<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<h1 align="center">게시글 상세보기</h1>
	<br>
	
	<!-- 게시글 작성하기(boardInsertForm.jsp에서 복사하고 수정하자 -->
	<table align="center" border="1" width="500">
		<tr align="center" valign="middle">
			<th colspan="2">${board.bId}번 글 상세보기</th>
		</tr>
		<tr>
			<td>제목</td>
			<td>${board.bTitle}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${board.bWriter}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${board.bContent}</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
				<c:if test="${!empty board.originalFileName }">
					<a href="${contextPath}/resources/buploadFiles/${board.renameFileName}" download="${board.originalFileName}">
						${board.originalFileName}
					</a>
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<c:url var="bupView" value="bupView.do">
					<c:param name="bId" value="${board.bId}"/>
					<c:param name="page" value="${currentPage}"/>
				</c:url>
				<c:url var="bdelete" value="bdelete.do">
					<c:param name="bId" value="${board.bId}"/>
				</c:url>
				<c:url var="blist" value="blist.do">
					<c:param name="page" value="${currentPage}"/>
				</c:url>
				
				
				<c:if test="${loginUser.id eq board.bWriter}">
					<!-- 수정하기 -->
					<a href="${bupView}">수정하기</a> &nbsp;
					<!-- 삭제하기 -->
					<a href="${bdelete}">삭제하기</a>
				</c:if>
				
				<a href="${blist}">목록으로</a>
			</td>
		</tr>
	</table>
	
	<!-- ajax 이후에 댓글 달기 할 때 작성한 부분 -->
	<!-- 댓글 등록하기 -->
	<table align="center" width="500" border="1">
		<tr>
			<td><textarea cols="55" rows="3" id="rContent"></textarea></td>
			<td>
				<button id="rSubmit">등록하기</button>
			</td>
		</tr>
	</table>
	
	<!-- 댓글 목록보기 -->
	<table align="center" width="500" border="1" id="tb2">
		<thead>
			<tr>
				<td colspan="2"><b id="rCount"></b></td>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	
	<script>
		$(function(){
			getReplyList();
			
			setInterval(function(){
				getReplyList();
			}, 10000);
			
			$("#rSubmit").on("click",function(){
				var rContent = $("#rContent").val();	// 선택자
				var refBid = ${board.bId};				// el
				
				$.ajax({
					url:"addReply.do",
					data:{rContent:rContent, refBid:refBid},
					success:function(data){
						if(data == "success"){
							getReplyList();
							// DB의 최신화된 댓글을 불러오는 것이 작성자가 댓글다는 사이 다른 댓글이 끼어들었을 때
							// 더 보기 완벽한 코드가 된다.
							// (방금 쓴 댓글 기존 댓글에 한 줄 추가하는 것 보다..)
							$("#rContent").val("");	// 댓글 작성 부분 리셋
						}
					},
					error:function(request, status, errorData){
	                     alert("error code: " + request.status + "\n"
	                           +"message: " + request.responseText
	                           +"error: " + errorData);
	                }

				})
			})
		})
		
		function getReplyList(){
			var bId = ${board.bId};
			
			$.ajax({
				url:"rList.do",
				data:{bId:bId},
				dataType:"json",
				success:function(data){
					$tableBody = $("#tb2 tbody");
					$tableBody.html("");
					
					var $tr;
					var $rWriter;
					var $rContent;
					var $rCreateDate;
					
					$("#rCount").text("댓글(" + data.length + ")");
					
					if(data.length > 0 ){	// 댓글이 하나 이상 존재하면
						for(var i in data){
							$tr = $("<tr>");
							$rWriter = $("<td width='100'>").text(data[i].rWriter);
							$rContent = $("<td>").text(data[i].rContent)
							$rCreateDate = $("<td width='100'>").text(data[i].rCreateDate);
							
							$tr.append($rWriter);
							$tr.append($rContent);
							$tr.append($rCreateDate);
							$tableBody.append($tr);
						}
					} else{					// 댓글이 없으면
						$tr = $("<tr>");
						$rContent = $("<td colspan='3'>").text("등록 된 댓글이 없습니다.");
						
						$tr.append($rContent);
						$tableBody.append($tr);
					}
					
				},
				error:function(request, status, errorData){
                    alert("error code: " + request.status + "\n"
                          +"message: " + request.responseText
                          +"error: " + errorData);
               }

			})
		}
	</script>
</body>
</html>
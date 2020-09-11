<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<title></title>
<style>
.list{
        margin:20px;
        list-style-type: none;
    }
    
  
  #list a{
    color:black;
    text-decoration: none;
  }
  button{
      background-color: rgb(0, 125, 255);
  }
  table {
    width: 100%;
    border: 1px solid #CCCCCC !important;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #CCCCCC !important;
  }
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<br><br><br>
	 
	<div class="container">
    <div class="row">
      <div class="col-3">
        <h1 align="center">상품제안</h1>
        <ul class="list" id="list">
			<li style="margin-bottom: 5%;"><img src="resources/images/Alert.png" style="width:20%; height:20%;margin-bottom:3%"><a href="noticeList.do">공지사항</a></li>
            <li style="margin-bottom: 5%;"><img src="resources/images/FAQ.png" style="width:20%; height:20%;margin-bottom:3%"><a href="FAQList.do">FAQ</a></li>
            <li style="margin-bottom: 5%;"><img src="resources/images/inquiary.png" style="width:20%; height:20%;margin-bottom:3%"><a href="sinquiryList.do">1:1문의</a></li>
            <li style="margin-bottom: 5%;"><img src="resources/images/proposal.png" style="width:20%; height:20%;margin-bottom:3%"><a style="color:rgb(0, 125, 255);" readonly">상품제안</a></li>
            <li style="margin-bottom: 5%;"><img src="resources/images/benefit1.png" style="width:20%; height:20%;margin-bottom:3%"><a href="tierOfBenefit.do">등급별 혜택</a></li>        
        </ul>
      </div>
      <div class="col-9">
          	<div style="font-size: 30px;">상품제안</div>
            <hr style="border-color:rgb(0, 125, 255);">
            <table style="margin-top:15px">
                <thead style="text-align: center;">
                  <tr>
                    <th style="width:10%; padding:20px;">제목</th>
                    <td style="width: 35%;">${board.bTitle }</td>
                    <th style="width: 10%;">작성일</th>
                    <td style="width: 10%;">${board.bWrite_date }</td>
                    <th style="width: 5%;">조회수</th>
                    <td style="width: 5%;">${board.bRead_num }</td>
                  </tr>
                </thead>
                <tbody >
                  <tr>
                      <td colspan="6" style="height:auto; padding:5%">
                        <span style="margin:auto">
                        ${board.bContent }
                        </span>
                        <br><br>
                        <c:if test="${!empty board.originalFileName }">
                        	<center>
                           		<img style="height:500px;width:500px" src="${contextPath }/resources/proposalUploadFiles/${board.renameFileName }">
                        	</center>
                        </c:if>
                      </td>
                  </tr>
                </tbody>
                
              </table>
              <br><br><br>
              <!-- 댓글 목록보기 -->
			  <table style="align:center; width:825px ;border:1;" id="tb2">
			  	<thead>
					<tr>
						<td colspan="4"><b id="rCount"></b></td>
					</tr>
				</thead>
			  <tbody>
			  </tbody>
			  </table>
              <br>
              <!-- 댓글 작성 창 -->
              <c:if test="${loginUser.memberId != null}">
              <table style="width:825px; border:1 !important; algin:center;">
              <tr>
              	<td><textarea style="aling:center; resize: none; width:750px; height:100px;" name="reply_content" id="reply_content"></textarea></td>
				<td>
					<button style="align:center;" id="rSubmit">등록하기</button>
				</td>
			  </tr>
			  </table>
			  </c:if>
			  

            <br><br><br>
            
            <c:url var="proposalUpdateView" value="productProposalUpdate.do">
						<c:param name="bBoard_no" value="${board.bBoard_no }"/>
						<c:param name="page" value="${currentPage }"/>
			</c:url>
			<c:url var="proposalDelete" value="proposalDelete.do">
						<c:param name="bBoard_no" value="${board.bBoard_no }"/>
			</c:url>
			
            <a href="productProposalList.do" type="button" class="btn btn-primary" style="float:right;">목록으로</a>
            <c:if test="${loginUser.memberId eq board.bMember_id }">
            <a href="${proposalUpdateView }" type="button" class="btn btn-primary" style="float:right;margin-right:10px">수정</a>
            <a href="${proposalDelete }" type="button" class="btn btn-primary" style="float:right;margin-right:10px" id="delete">삭제</a>
            </c:if>
            </div>
            </div>
            </div>
            
            <br><br><br>
            <footer class="page-footer font-small indigo">
				<jsp:include page="../common/footer.jsp" />
			</footer>
			
			<script>
			
			// 댓글 달기
				$(function(){
					getReplyList();
					
					$("#rSubmit").on("click",function(){
						var reply_content = $("#reply_content").val();
						var rBoard_no = '${board.bBoard_no}';
						var reply_writer = '${loginUser.memberId}';
						var rMember_no = '${loginUser.memberNo}';
						var rEmail = '${loginUser.email}';
						var flag= true;
						
					if(reply_content.trim().length == 0){
						alert("댓글을 작성해주세요!");
					}
					else{
						if(confirm("댓글을 작성하시겠습니까?")){
						$.ajax({
							url:"addReply.do",
							data:{reply_content:reply_content, rBoard_no:rBoard_no, reply_writer:reply_writer, rMember_no:rMember_no, rEmail:rEmail},
							success:function(data){
								if(data=="success"){
									alert("댓글이 작성되었습니다!");
									getReplyList();
									$("#reply_content").val("");	// 댓글 작성 부분 리셋
								}
							},
							error:function(request, status, errorData){
			                    alert("error code: " + request.status + "\n"
			                          +"message: " + request.responseText
			                          +"error: " + errorData);
			                 }
						});
					
					}
					else{
						flag=false;
					}
					return flag;
					}
					})
					
				})
			
			// 댓글 삭제
				function deleteReply(obj){
						$delete = obj;
						console.log(obj);
				        var checkBtn = $($delete);
				        console.log(checkBtn);
						var tr = checkBtn.parent().parent();
						console.log(tr);
						var td = tr.children(0);
						console.log(td);
						var children = td.eq(0).text();
						console.log(children);

					      
						var flag = true;
						
						if(confirm("작성된 댓글을 삭제하시겠습니까?")){
							alert("삭제되었습니다!");
				
						$.ajax({
							url:"deleteReply.do",
							data:{children:children},
							success:function(data){
								if(data=="success"){
									getReplyList();
								}
							},
							error:function(request, status, errorData){
			                    alert("error code: " + request.status + "\n"
			                          +"message: " + request.responseText
			                          +"error: " + errorData);
			                 }
						});
							}
							else{
								flag=false;
							}
						return flag;
						
					}
			
			
			// 댓글 수정 저장
				function updateReply(obj){
						$update = obj;
						console.log(obj);
				        var checkBtn = $($update);
				        console.log(checkBtn);
						var tr = checkBtn.parent();
						console.log(tr);
						var td = tr.children(0);
						console.log(td);
						var children1 = td.eq(0).text();
						console.log(children1);
						var children2 = td.eq(2).val();
						console.log(children2);

					      
						var flag = true;
						
						if(confirm("작성된 댓글을 수정하시겠습니까?")){
							alert("수정되었습니다!");
				
						$.ajax({
							url:"updateReply.do",
							data:{children1:children1, children2:children2},
							success:function(data){
								if(data=="success"){
									getReplyList();
								}
							},
							error:function(request, status, errorData){
			                    alert("error code: " + request.status + "\n"
			                          +"message: " + request.responseText
			                          +"error: " + errorData);
			                 }
						});
							}
							else{
								flag=false;
							}
						return flag;
						
					}
					
			// 수정버튼 눌렀을 때
				function modifyReply(obj){
					$update = obj;
					console.log(obj);
			        var checkBtn = $($update);
			        console.log(checkBtn);
					var tr = checkBtn.parent().parent();
					console.log(tr);
					var td = tr.children(0);
					console.log(td);
					var children1 = td.eq(0).text();
					console.log(children1);
					var children2 = td.eq(2).text();
					console.log(children2);
					var bBoard_no = '${board.bBoard_no}';
				
					$.ajax({
						url:"replyList.do",
						data:{bBoard_no:bBoard_no},
						dataType:"json",
						success:function(data){
							$tableBody = $("#tb2 tbody");
							$tableBody.html("");
							
							var $tr;
							var $reply_no;
							var $reply_writer;
							var $reply_content;
							var $reply_createDate;
							var $reply_modifyDate;
							
							$("#rCount").text("댓글(" + data.length + ")");
							
							if(data.length > 0){	// 댓글이 하나 이상 존재하면
								for(var i in data){
									$tr =$("<tr>");
									$reply_no = $('<td>').text(data[i].reply_no).hide();
									var reply_no = $($reply_no).text();
									console.log(reply_no);
									if(children1 == reply_no){
										console.log(children1);
										console.log(reply_no);
										$update = $('<input style="float:right; width:50px; margin-top:35px;" type="button" value="저장" onclick="updateReply(this)">');
										$delete = $('<input style="float:right; width:50px; margin-top:35px;" type="button" value="취소" onclick="getReplyList()">');
										$reply_content = $("<textarea style='resize:none; width:450px; height:100px;'>").val(data[i].reply_content);
										$reply_writer = $("<td align='center' width='80px' height:100px;>").text(data[i].reply_writer);
										$reply_createDate = $("<td align='center' width='120px'>").text(data[i].reply_createDate).hide();
										$reply_modifyDate = $("<td align='center' width='120px'>").text(data[i].reply_modifyDate);
										
										$tr.append($reply_no);
										$tr.append($reply_writer);
									if(data[i].reply_writer == '${loginUser.memberId}' || '${loginUser.memberId}' == 'admin'){
										$tr.append($reply_content).append($update);
										$tr.append($delete).append($reply_modifyDate);
										$tableBody.append($tr);
									}
									else{
										$tr.append($reply_content);
										$tr.append($reply_modifyDate);
										$tableBody.append($tr);
									}
									
									}
									else{
										$modify = $('<input style="float:right; width:50px;" type="button" value="수정" onclick="modifyReply(this)">');
										$delete = $('<input style="float:right; width:50px;" type="button" value="삭제" onclick="deleteReply(this)">');
										$reply_content = $("<td width='730px' height='60px'>").text(data[i].reply_content)
										$reply_writer = $("<td align='center' width='80px'>").text(data[i].reply_writer);
										$reply_createDate = $("<td align='center' width='120px'>").text(data[i].reply_createDate).hide();
										$reply_modifyDate = $("<td align='center' width='120px'>").text(data[i].reply_modifyDate);

										$tr.append($reply_no);
										$tr.append($reply_writer);
									if(data[i].reply_writer == '${loginUser.memberId}' || '${loginUser.memberId}' == 'admin'){
										$tr.append($reply_content);
										$tr.append($reply_modifyDate);
										$reply_content.append($delete).append($modify);
									}
									else{
										$tr.append($reply_content);
										$tr.append($reply_modifyDate);
										$tableBody.append($tr);
									}
									
								}
							}
							}
							else{					// 댓글이 없으면
							$tr = $("<tr>");
							$reply_content = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");
							$tr.append($reply_content);
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
			
			
			// 댓글 리스트
				function getReplyList(){
					var bBoard_no = '${board.bBoard_no}';
					
					$.ajax({
						url:"replyList.do",
						data:{bBoard_no:bBoard_no},
						dataType:"json",
						success:function(data){
							$tableBody = $("#tb2 tbody");
							$tableBody.html("");
							
							var $tr;
							var $reply_no;
							var $reply_writer;
							var $reply_content;
							var $reply_createDate;
							var $reply_modifyDate;
							
							$("#rCount").text("댓글(" + data.length + ")");
							
							if(data.length > 0){	// 댓글이 하나 이상 존재하면
								for(var i in data){
									$tr =$("<tr>");
									$reply_no = $('<td>').text(data[i].reply_no).hide();
									$modify = $('<input style="float:right; width:50px;" type="button" value="수정" onclick="modifyReply(this)">');
									$delete = $('<input style="float:right; width:50px;" type="button" value="삭제" onclick="deleteReply(this)">');
									$reply_content = $("<td width='730px' height='40px'>").text(data[i].reply_content)
									$reply_writer = $("<td align='center' width='80px'>").text(data[i].reply_writer);
									$reply_createDate = $("<td align='center' width='120px'>").text(data[i].reply_createDate).hide();
									$reply_modifyDate = $("<td align='center' width='120px'>").text(data[i].reply_modifyDate);
									

									
										$tr.append($reply_no);
										$tr.append($reply_writer);
									if(data[i].reply_writer == '${loginUser.memberId}' || '${loginUser.memberId}' == 'admin'){
										$tr.append($reply_content);
										$tr.append($reply_modifyDate);
										$reply_content.append($delete).append($modify);
										$tableBody.append($tr);
									}
									else{
										$tr.append($reply_content);
										$tr.append($reply_modifyDate);
										$tableBody.append($tr);
									}
									
								}
							}else{					// 댓글이 없으면
							$tr = $("<tr>");
							$reply_content = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");
							$tr.append($reply_content);
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
			
			
			
				$("#delete").click(function(){
					
					var flag = true;
					
					if(confirm("작성된 글을 삭제하시겠습니까?")){
						alert("삭제되었습니다!");
					}else{
						flag=false;
					}
					return flag;
				})
			</script>
</body>
</html>
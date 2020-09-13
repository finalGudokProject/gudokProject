<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.js" type="text/javascript"></script>
    <title></title>
    <style>
   table {
    width: 100%;	
    border: 1px solid #CCCCCC !important;
  }
  th, td {
    border: 1px solid #CCCCCC !important;
    padding-top:20px !important;
  }
  
  button{
      background-color: rgb(0, 125, 255);
  }



    </style>
  </head>




  <body>
  <c:set var="contextPath"
		value="${pageContext.servletContext.contextPath }" scope="application" />
	<jsp:include page="../common/adminMenubar.jsp"/>
    <!-- 화면 -->
    <div class="content">
      <div class="container box">

        <div style="font-size: 30px;">상품제안</div>
        <hr style="border-color:rgb(0, 125, 255);">

              <table style="margin-top:15px">
                	<thead style="text-align: center;">
	                  <tr>
	                    <th style="width:10%; padding:20px;">제목</th>
	                    <td style="width: 35%;">${board.bTitle }</td>
	                    <th style="width: 10%; ">작성일</th>
	                    <td style="width: 10%;">${board.bWrite_date }</td>
	                    <th style="width: 5%;">조회수</th>
	                    <td style="width: 5%;">${board.bRead_num }</td>
	                  </tr>
	                </thead>
	              	<tbody>
                    	<tr>
	                      	<td colspan="6" style="height:auto; padding:5%; text-align:left !important">
	                        	<span style="margin:auto">
	                        	${board.bContent }
	                        	</span>
	                        	<br><br>
	                        		<c:if test="${!empty  board.originalFileName }">
		                        		<center>
	                          				<img style="height:500px;width:500px" src="${contextPath }/resources/proposalUploadFiles/${board.renameFileName }">
	                        			</center>
                        			</c:if>
	                    	</td>
	                  	</tr>
	                </tbody>
                </table>
                <br><br>
                
                <!-- 댓글 목록보기 -->
			  <table style="align:center; width:1080px ;border:1;" id="tb2">
			  	<thead>
					<tr>
						<td colspan="3"><b id="rCount"></b></td>
					</tr>
				</thead>
			  <tbody>
			  </tbody>
			  </table>
              <br>
              <!-- 댓글 작성 창 -->
              <c:if test="${loginUser.memberId eq 'admin'}">
              <table style="width:1000px; border:1 !important; algin:center;">
              <tr>
              	<td><textarea style="aling:center; resize: none; width:950px; height:100px;" name="reply_content" id="reply_content"></textarea></td>
				<td>
					<button style="align:center; width:80px; height:30px; margin-top:30px;" id="rSubmit" >등록하기</button>
				</td>
			  </tr>
			  </table>
			  </c:if>
                
            <br><br>
            <c:url var="aProposalDelete" value="aProposalDelete.do">
						<c:param name="bBoard_no" value="${board.bBoard_no }"/>
			</c:url>
            &nbsp;&nbsp;<a href="javascript:history.go(-1)" type="button" class="btn btn-primary" style="float:right;">목록으로</a>
			<c:if test="${loginUser.memberId eq 'admin' }">
            <a href="${aProposalDelete }" type="button" class="btn btn-primary" style="float:right;margin-right:10px" id="delete">삭제</a>
            </c:if>
            <br><br><br>

    </div><!--하얀박스 있는부분 끝-->
  </div><!--회색바탕 div-->
  
  
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
  

   




    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>
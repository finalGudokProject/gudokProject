<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <title>회원 상세 정보</title>    
    <style>


input, select,textarea{
    border: 1px solid #CCCCCC;
}


.sv_btn{
	background:#90A4AE;
	color:white;
	border-radius:5px;
	padding:4px 15px 4px 15px;
	transition:0.5s;
  	position:relative;
  	border:1px solid #B0BEC5;
	font-size:14px;
}
.sv_btn:hover{
  background:#424242;
  color:#ffffff;
  border:1px solid #11538C;
}

.sv_btn:hover:before,#btn:hover:after{
  width:100%;
  transition:0.5s;
}


</style>


</head>
    <body>
    <jsp:include page="../common/adminMenubar.jsp"/>
        <div class="content">
            <div class="container box">
                <h3>회원 상세 정보</h3>
                <br>
            	<br>
            	
            
                <h5 style="padding-left:25px; padding-bottom:10px;">- 회원 정보</h5>
         <form action="mUpdateA.do" method="post" onsubmit="return validate()">
          			<input type="hidden" name="beforePage" value="${beforPage }">
          			<input type="hidden" name="memberNo" value="${m.memberNo }">
          			<input type="hidden" name="type" value="${type }">
                    <table>
                        <tr>
                            <td>아이디</td>
                            <td><input type="text" name="memberId" value="${m.memberId }" readonly></td>
                            <td>이메일</td>
                            <td><input type="text" id="email" name="email" value="${m.email }"></td>
                        </tr>
                        <tr>
                            <td>이름</td>
                            <td><input type="text" name="memberName" value="${m.memberName }" readonly></td>
                            <td>등급</td>
                            <td>
                            	<c:if test="${m.gradeNo eq 1 }">
                           	 		<input type="text" value="4등급" readonly>
                            	</c:if>
                            	<c:if test="${m.gradeNo eq 2 }">
                           	 		<input type="text" value="3등급" readonly>
                            	</c:if>
                            	<c:if test="${m.gradeNo eq 3 }">
                           	 		<input type="text" value="2등급" readonly>
                            	</c:if>
                            	<c:if test="${m.gradeNo eq 4 }">
                           	 		<input type="text" value="1등급" readonly>
                            	</c:if>
                            </td>
                        </tr>
                        
	                    <tr>
	                       <td rowspan="3" style="width:15%">주소</td>
							<td colspan="3"><label style="float:left; width:180px;">우편번호</label>
								<input type="text" name="address1" class="postcodify_postcode5" value="${m.address1 }" id="address1" style="float:left;">
								<button type="button" class="sv_btn" id="postcodify_search_button" style="float:left; margin-left:15px;">검색</button>
							</td>
						</tr>
						<tr>
							<td colspan="3"><label style="float:left; width:180px;">도로명 주소</label>
							<input type="text" name="address2" class="postcodify_address" value="${m.address2 }" id="address2"style="float:left;width:70%;"></td>
				
						</tr>
						<tr>
							<td colspan="3"><label style="float:left;  width:180px;">상세 주소</label>
							<input type="text" name="address3" class="postcodify_extra_info" value="${m.address3 }" id="address3"style="float:left;width:70%;">
							
							
						</tr>
						<tr>
                            <td>적립금</td>
                            <td><input type="number" min="0" id="point" name="point" value="${m.point }"></td>
                            <td>총 구매 금액</td>
                            <td><input type="text" name="purchase" readonly value="${totalPayment }원"></td>
                        </tr>
                        <tr>
                            <td>가입일</td>
                            <td><input type="text" name="enroll" value="${m.enrollDate }" readonly></td>
                            <td>탈퇴일</td>
                            <td>
                            	<c:if test="${m.memberStatus eq 'Y' }">
                            		<input type="text" name="out" value="${m.secessionDate }"readonly>
                            	</c:if>
                            	<c:if test="${m.memberStatus ne 'Y' }">
                            		<input type="text" name="out" value="해당없음" readonly>
                            	</c:if>
                            </td>
                        </tr>
                    </table>
                   
                    
                    <div style="float:right;">
                  
                    	<c:if test="${type eq 'user' }">
                    		<c:url var="goList" value="gradeList.do">
                    			<c:param name="page" value="${beforePage }"/>
                    		</c:url>
	                   		<input type="button" class="btn" value="목록 " onclick="location.href='${goList}'">
	                    </c:if>
	                    <c:if test="${type eq 'secession' }">
	                  		  <c:url var="goSecessionList" value="sList.do">
	                    	<c:param name="page" value="${beforePage}"/>
	                    	</c:url>
	                   		<input type="button" class="btn" value="목록 " onclick="location.href='${goSecessionList}'">
	                    </c:if>
	                    
	                    
	                    
	                    <input type="submit" class="btn" value="수정">
	                    <input type="button" class="btn" value="삭제" onclick="deleteM()">
                    </div>
					<br>
                    <br>
            </form>
                    <h5 style="padding-left:25px; padding-bottom:10px;">-결제 내역</h5>
                    <table>
                        <thead>
                            <tr style="background-color:lightgray">
                                <th id="td1">결제일자</th>
                                <th>상품명</th>
                                <th>수량</th>
                                <th>결제금액</th>
                             </tr>   
                         </thead>
                         <tbody>
                         
		                         <c:if test="${empty pList }">
		                         	<tr>
		                         	<td colspan="4">결제한 내역이 없습니다.</td>
		                         	</tr>
		                         </c:if>
		                         <c:if test="${not empty pList }">
		                         	<c:forEach var="i" items="${pList }" varStatus="cnt">
		                         		<tr>
			                                <td>${i.paymentDate }</td>
			                                <td>${i.itemName }</td>
			                                <td>${i.amount }</td>
			                                <td>${i.totalPayment }</td>
		                                <tr>
	                                </c:forEach>
		                         </c:if>
                   
                         </tbody>
                    </table>



<!-- Postcodify를 로딩하자 -->
			 	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	

                    <br>


				<c:if test="${pi.listCount ne 0 }">

                   <!------페이징 처리----->
                <div class="page-center">
                    <ul class="pagination-t">
                    
                    	<!-- 이전 -->
                        <c:if test="${pi.currentPage eq 1 }">
	                        <li class="page-item-t disabled-t"><a class="page-link-t"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-left-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M3.86 8.753l5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z"/>
</svg></a></li>
						</c:if>
						 <c:if test="${pi.currentPage gt 1 }">
							<c:url var="blistBack" value="mDetail.do">
								<c:param name="detailPage" value="${pi.currentPage-1 }"/>
								<c:param name="page" value="${beforePage }"/>
								<c:param name="memberNo" value="${memberNo }"/>
								<c:param name="type" value="${type }"/>
							</c:url>
		                        <li class="page-item-t">
		                        <a class="page-link-t" href="${blistBack }">
		                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-left-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	  <path d="M3.86 8.753l5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z"/>
	</svg></a></li>
						</c:if>
						
						<!-- 번호들 -->
						<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
							
							<c:if test="${p eq pi.currentPage }">
	                       		<li class="page-item-t  active-t"><a class="page-link-t">${p }<span class="sr-only"></span></a></li>
							</c:if>
							
	                        <c:if test="${p ne pi.currentPage }">
	                        	<c:url var="blistCheck" value="mDetail.do">
	                        		<c:param name="detailPage" value="${p }"/>
	                        		<c:param name="page" value="${beforePage }"/>
									<c:param name="memberNo" value="${memberNo }"/>
									<c:param name="type" value="${type }"/>
                        		</c:url>
		                        <li class="page-item-t"><a class="page-link-t" href="${blistCheck }">${p } <span class="sr-only"></span></a>
		                        </li>
		                    </c:if>
                        </c:forEach>
                        
                        
                        <!-- 이후 -->
                        <c:if test="${pi.currentPage eq pi.maxPage }">
	                        <li class="page-item-t disabled-t"><a class="page-link-t">
	                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-right-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M12.14 8.753l-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
</svg></a></li>
						</c:if>
						 <c:if test="${pi.currentPage lt pi.maxPage }">
							<c:url var="blistAfter" value="mDetail.do">
								<c:param name="detailPage" value="${pi.currentPage+1 }"/>
								<c:param name="page" value="${beforePage }"/>
								<c:param name="memberNo" value="${memberNo }"/>
								<c:param name="type" value="${type }"/>
							</c:url>
	                        <li class="page-item-t">
	                        <a class="page-link-t" href="${blistAfter }">
	                       <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-right-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M12.14 8.753l-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
</svg></a></li>
						</c:if>
                    </ul>

                </div>

		</c:if>



            </div><!--내용담은 컨테이너-->
        </div><!--250px띄운 div-->
        		 	<script>
			 		//정보 수정
			        function validate(){
			        
			    	if($("#email").val().trim().length==0){
				    		alert('이메일을 확인하세요.');
				    		$("#email").focus();
			    		
			    		return false;
			
			    	}else if($("#address1").val().trim().length==0){
				    		alert('우편번호를 확인하세요.');
				    		$("#address1").focus();
			    		
			    		return false;
			    	}else if($("#address2").val().trim().length==0){
			    		alert('우편번호를 확인하세요.');
			    		$("#address2").focus();
		    		
		    		return false;
			    	}else if($("#address3").val().trim().length==0){
			    		alert('우편번호를 확인하세요.');
			    		$("#address3").focus();
		    		
		    		return false;
			    	}else if($("#point").val().trim().length==0){
			    		alert('포인트를 확인하세요.');
			    		$("#point").focus();
		    		
		    		return false;
			    			
			    
					
			    	}else{
			    		alert('회원 정보가 수정되었습니다.');
			    		return true;
			    	}
			        
			      };
						 	
			 	
			 	
			 		//주소 api
			 		$(function(){
			 			$("#postcodify_search_button").postcodifyPopUp();
			 		})
			 		
			 		
			 			 function goList(){
			 			 var type=${type};
	   	        		 var page=${beforePage };   
	   	        		 alert(type);
	   	        		 
	   	        		 if(type=="user"){
	   	           		location.href="gradeList.do?page="+page;
	   	        		 }else{
	   	        		location.href="sList.do?page="+page;	 
	   	        		 }
			 		} 
			 		
			 		
			 		function deleteM(){
			 			confirm("회원을 삭제하시겠습니까?");
			 			 var memberNo=${m.memberNo };   
			 			 var page=${beforePage };  
	   	        		 alert(memberNo);
	   	           		location.href="deleteM.do?memberNo="+memberNo+"&page="+page;
			 			
			 		}
			 		
			 		
			 	</script>
       <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>
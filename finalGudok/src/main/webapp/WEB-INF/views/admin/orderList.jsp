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
     <!-- google charts -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
    <title>주문 리스트</title>    
    <style>



#td1{
    width:15%;
    vertical-align: middle;
}
#td2{
    width:35%;
    vertical-align: middle;
}
#td3{
    width:15%;
    vertical-align: middle;
}
#td4{
    width:35%;
    vertical-align: middle;
}

input, select,textarea{
    border: 1px solid #CCCCCC;
}

#cursor{
cursor: pointer;
}



</style>


</head>
    <body>
    <jsp:include page="../common/adminMenubar.jsp"/>
        <div class="content">
            <div class="container box">
                <h3>구독 상품 리스트</h3>
                <br>
            
                <br><br>
               
                <div style="width:100%">
                    <div style="float:left;">
                      
                    <c:if test="${empty category }">
                    <select id="category" name="category" style="width:200px">
                        <option value="" selected>전체</option>
                        <option value="N">배송대기</option>
                        <option value="D">배송중</option>
                        <option value="Y">배송완료</option>
                    </select>
                    </c:if>
                     <c:if test="${category eq 'N' }">
                    <select id="category" name="category" style="width:200px">
                        <option value="">전체</option>
                        <option value="N" selected>배송대기</option>
                        <option value="D">배송중</option>
                        <option value="Y">배송완료</option>
                    </select>
                    </c:if>
                    <c:if test="${category eq 'D' }">
                    <select id="category" name="category" style="width:200px">
                        <option value="">전체</option>
                        <option value="N">배송대기</option>
                        <option value="D" selected>배송중</option>
                        <option value="Y">배송완료</option>
                    </select>
                    </c:if>
                    <c:if test="${category eq 'Y' }">
                    <select id="category" name="category" style="width:200px">
                        <option value="">전체</option>
                        <option value="N">배송대기</option>
                        <option value="D">배송중</option>
                        <option value="Y" selected>배송완료</option>
                    </select>
                    </c:if>
                    
                    <c:choose>
               		<c:when test="${type eq 'subscribeNo' }">
		                 <select id="type" name="type" style="width:100px">
		                    <option value="">전체</option>
		                    <option value="subscribeNo" selected>구독번호</option>
		                    <option value="itemName">상품명</option>
		                    <option value="memberId">구매자</option>
		                </select>
		            </c:when>
		            <c:when test="${type eq 'itemName' }">
		                 <select id="type" name="type" style="width:100px">
		                    <option value="">전체</option>
		                    <option value="subscribeNo">구독번호</option>
		                    <option value="itemName" selected>상품명</option>
		                    <option value="memberId">구매자</option>
		                </select>
		            </c:when>
		            <c:when test="${type eq 'memberId' }">
		                 <select id="type" name="type" style="width:100px">
		                    <option value="">전체</option>
		                    <option value="subscribeNo">구독번호</option>
		                    <option value="itemName">상품명</option>
		                    <option value="memberId" selected>구매자</option>
		                </select>
		            </c:when>
		             <c:otherwise>
		                 <select id="type" name="type" style="width:100px">
		                    <option value="" selected>전체</option>
		                    <option value="subscribeNo">구독번호</option>
		                    <option value="itemName">상품명</option>
		                    <option value="memberId">구매자</option>
		                </select>
		            </c:otherwise>
                </c:choose>
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                   <input type="text" id="word" name="word" value="${word }">
                   <input type="button" class="btn" value="검색" onclick="search()">
                    </div>  
                    <div style="float:right">
                        <input type="button" class="btn" value="대기" onclick="updateDelivery('N')">
                        <input type="button" class="btn" value="배송" onclick="updateDelivery('D')">
                        <input type="button" class="btn" value="완료" onclick="updateDelivery('Y')">
                    </div>
                </div>
           
                <br>
                <br>
            
        
                    <table>
                        <thead>
                            <tr>
                                <th onclick='event.cancelBubble=true'><input type="checkbox" id="checkAll"></th>
                                <th onclick='event.cancelBubble=true'>주문 일자</th>
                                <th onclick='event.cancelBubble=true'>구독 번호</th>
                                <th onclick='event.cancelBubble=true'>상품명</th>
                                <th onclick='event.cancelBubble=true'>수량</th>
                                <th onclick='event.cancelBubble=true'>구매자</th>
                                <th onclick='event.cancelBubble=true'>배송상태</th>
                             </tr>   
                         </thead>
                         <tbody>
                            <c:if test="${!empty oList }">
	                         	<c:forEach var="e" items="${oList }" varStatus="cnt">
		                             <tr>
		                                
		                                	<c:choose>
				                                <c:when test="${e.deliveryStatus eq 'N' }">
				                                	<td onclick="event.cancelBubble=true"><input type="checkbox" class="common" id="subscribeNo${cnt.index}" name="subscribeNo" value="${e.subscribeNo }"></td>
					                                <td onclick="event.cancelBubble=true">${e.subscribeDate }</td>
					                                <td id="cursor">${e.subscribeNo }</td>
					                                <td onclick="event.cancelBubble=true">${e.itemName }</td>
					                                <td onclick="event.cancelBubble=true">${e.amount }</td>
					                                <td onclick="event.cancelBubble=true">${e.memberId }</td>
				                                	<td onclick="event.cancelBubble=true">배송 대기</td>
				                                </c:when>
				                                <c:when test="${e.deliveryStatus eq 'D' }">
				                                	<td onclick="event.cancelBubble=true"><input type="checkbox" class="common" id="subscribeNo${cnt.index}" name="subscribeNo" value="${e.subscribeNo }"></td>
					                                <td onclick="event.cancelBubble=true">${e.subscribeDate }</td>
					                                <td id="cursor">${e.subscribeNo }</td>
					                                <td onclick="event.cancelBubble=true">${e.itemName }</td>
					                                <td onclick="event.cancelBubble=true">${e.amount }</td>
					                                <td onclick="event.cancelBubble=true">${e.memberId }</td>
				                                	<td onclick="event.cancelBubble=true">배송 중</td>
				                                </c:when>
				                                <c:when test="${e.deliveryStatus eq 'Y' }">
					                                <td onclick="event.cancelBubble=true"><input type="checkbox" id="subscribeNo${cnt.index}" name="subscribeNo" value="${e.subscribeNo }" disabled></td>
					                                <td onclick="event.cancelBubble=true">${e.subscribeDate }</td>
					                                <td id="cursor">${e.subscribeNo }</td>
					                                <td onclick="event.cancelBubble=true">${e.itemName }</td>
					                                <td onclick="event.cancelBubble=true">${e.amount }</td>
					                                <td onclick="event.cancelBubble=true">${e.memberId }</td>
				                                	<td onclick="event.cancelBubble=true">배송 완료</td>
				                                </c:when>
				                            </c:choose>
                           			 </tr>
                           		</c:forEach>
                           	</c:if>
                           	 <c:if test="${empty oList }">
		                             <tr>
		                                <td colspan="7">등록된 주문이 없습니다.</td>
                           			 </tr>
                           	</c:if>
                           	
                         </tbody>
                    </table>



                    <br>


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
							<c:url var="blistBack" value="oList.do">
								<c:param name="page" value="${pi.currentPage-1 }"/>
									<c:param name="category" value="${category }"/>
									<c:param name="word" value="${word }"/>
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
	                        	<c:url var="blistCheck" value="oList.do">
	                        		<c:param name="page" value="${p }"/>
	                        		<c:param name="category" value="${category }"/>
									<c:param name="word" value="${word }"/>
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
							<c:url var="blistAfter" value="oList.do">
								<c:param name="page" value="${pi.currentPage+1 }"/>
								<c:param name="category" value="${category }"/>
								<c:param name="word" value="${word }"/>
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
</div>




            </div><!--내용담은 컨테이너-->
        </div><!--250px띄운 div-->
       <input type="hidden" id="category" name="category" value="${category }">
       <input type="hidden" id="type" name="type" value="${type }">
       <input type="hidden" id="word" name="word" value="${word }">
       
       <script>
       
   
       
       
       
       //검색
       function search(){
    	   
    	   var category=$("#category").val();
    	   var word=$("#word").val();
    	   var type=$("#type").val();
    	   
    	   location.href="oList.do?category="+category+"&word="+word+"&type="+type;
    	   
    	   
       }
       
       
       
       
       
     //배송 상태 변경
   	function updateDelivery(status){
   		
   		var sendArr=Array();
   		var sendCnt=0;
   		var chkbox=$(".common");
   		var deliveryStatus=status;
   		
   		
   		
   		for(i=0; i<chkbox.length;i++){
   			if(chkbox[i].checked==true){
   				sendArr[sendCnt]=chkbox[i].value;
   				sendCnt++;
   			}
   		}
   		
   		if(sendCnt==0){
   			alert("상품을 선택해주세요.")
   			return;
   		}
   		
   	
   		$.ajax({
   				url:"updateDelivery.do",
   				type:"post",
   				traditional:true,
   				data:{"sendArr":sendArr,"deliveryStatus":deliveryStatus},
   				success:function(data){
   					
   					alert('도오오착');
   					getList();
   					        					
   				},
   				error:function(request, status, errorData){
	                    alert("error code: " + request.status + "\n"
		                           +"message: " + request.responseText
		                           +"error: " + errorData);
		                  }   
   			});
   				
   }
   
   
     
  	//게시물 상세보기
      
     	$(function(){
     		
     		$("tr").on("click",function(){
     			var subscribeNo=$(this).children().eq(2).text();
     			var type="order";
      			 var page=${pi.currentPage };   
      				 alert(subscribeNo);
      				 alert(page);
      				 
         		location.href="oDetail.do?subscribeNo="+subscribeNo+"&page="+page+"&type="+type;
     		})
     	})
     	
     	
	//상태 변경 후 리스트 가져오기
    function getList(){
   	 var page=${pi.currentPage};
   	 var category=$("#category").val();
   	 var type=$("#type").val();
   	 var word=$("#word").val();
   	 
   	 
   	 $.ajax({
   		 
   	 	url:"oListChange.do", 
   	 	data:{"page":page,"category":category,"type":type,"word":word},
   	 	dataType:"json",
   	 	success:function(data){
   	 		
   	 		
      	       	
   	 		$tableBody=$("tbody");
   	 		$tableBody.html("");
   	 		
   	 		var $tr;
   	 		var $itemNo;
   	 		var $itemName;
   	 		var $amount;
   	 		var $subscribeDate;
   	 		var $deliveryStatus;
   	 		var $memberId;
   	 		var $checkBox;
   	 		var $th;
   	 		
   	 				if(data.list!=null){
   	 	
	   	 			 	for(var i in data.list){
	   	 			 		
	   	 			 		
	   	 				
	   	 				if(data.list[i].deliveryStatus=="배송 완료"){
	   	 					
		   	 				$tr=$("<tr>");
		   	 				$td=$("<td onclick='event.cancelBubble=true'>");
		   	 				$checkBox=$("<input type='checkbox' name='subscribeNo' disabled>").val(data.list[i].subscribeNo);     	 			
		   	 				$subscribeDate=$("<td onclick='event.cancelBubble=true'>").text(data.list[i].subscribeDate);     	 			
		   	 				$itemNo=$("<td id='cursor'>").text(data.list[i].subscribeNo);
		   	 				$itemName=$("<td onclick='event.cancelBubble=true'>").text(data.list[i].itemName);
		   	 				$amount=$("<td onclick='event.cancelBubble=true'>").text(data.list[i].amount);
		   	 				$memberId=$("<td onclick='event.cancelBubble=true'>").text(data.list[i].memberId);
		   	 				$deliveryStatus=$("<td onclick='event.cancelBubble=true'>").text(data.list[i].deliveryStatus);
		   	 				
		   	 				
		   	 				
	   	 			 	}else{
	   	 			 		
		   	 			 	$tr=$("<tr>");
		   	 				$td=$("<td onclick='event.cancelBubble=true'>");
		   	 				$checkBox=$("<input type='checkbox' class='common' name='subscribeNo'>").val(data.list[i].subscribeNo);     	 			
		   	 				$subscribeDate=$("<td onclick='event.cancelBubble=true'>").text(data.list[i].subscribeDate);     	 			
		   	 				$itemNo=$("<td id='cursor'>").text(data.list[i].subscribeNo);
		   	 				$itemName=$("<td onclick='event.cancelBubble=true'>").text(data.list[i].itemName);
		   	 				$amount=$("<td onclick='event.cancelBubble=true'>").text(data.list[i].amount);
		   	 				$memberId=$("<td onclick='event.cancelBubble=true'>").text(data.list[i].memberId);
		   	 				$deliveryStatus=$("<td onclick='event.cancelBubble=true'>").text(data.list[i].deliveryStatus);
	   	 			 		
	   	 			 		
	   	 			 		
	   	 			 	}
	   	 			 
	   	 				
		   	 				$td.append($checkBox);
			 				$tr.append($td);
			 				$tr.append($subscribeDate);
			 				$tr.append($itemNo);
			 				$tr.append($itemName);
			 				$tr.append($amount);
			 				$tr.append($memberId);
			 				$tr.append($deliveryStatus); 
			 				$tableBody.append($tr);
			 				
	   	 			 	}
			
   	 			 	}else{
   	 				$tr=$("<tr>");
   	 				$td=$("<td colspan='7' onclick='event.cancelBubble=true'>").text("해당 조건의 구독 내역이 없습니다.");
   	 				$tr.append($td);
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
   			
       
       
       
       
       
       
       
   	//모두 체크

	 	$(function(){
	
			$("#checkAll").click(function(){
				var bool = $(this).prop("checked");
				$(".common").prop('checked', bool);
			});
		}); 
       </script>
        
       <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>
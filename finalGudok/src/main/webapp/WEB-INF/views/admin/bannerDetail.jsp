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
    <title>이벤트 배너 상품 상세</title>    
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


</style>



    <body>
    <jsp:include page="../common/adminMenubar.jsp"/>
        <div class="content">
            <div class="container box">
                <h3>배너 상품 전체 리스트</h3>
                <br>
            <div style="float:left;">
                
                    <input type="button" class="btn" value="목록 " onclick="location.href='eList.do'">
                    <input type="button" class="btn" value="삭제" onclick="bannerItemDelete()">
                </div>
               
                <br>
                <br>
            
        
                    <table>
                        <thead>
                            <tr>
                                <th onclick='event.cancelBubble=true'><input type="checkbox" id="checkAll"></th>
                                <th onclick='event.cancelBubble=true'>이벤트 번호</th>
                                <th onclick='event.cancelBubble=true'>상품 번호</th>
                                <th onclick='event.cancelBubble=true'>상품명</th>
                                <th onclick='event.cancelBubble=true'>가격</th>
                                <th onclick='event.cancelBubble=true'>게시 상태</th>
                             </tr>   
                         </thead>
                         <tbody>
                         <c:if test="${!empty list }">
                        	 <c:forEach var="i" items="${list }" varStatus="cnt">
                        	 <input type="hidden" id="eventNo" name="eventNo" value="${i.eventNo }">
	                             <tr>
	                                <td onclick='event.cancelBubble=true'><input type="checkbox" class="common" id="itemNo${cnt.index}" name="itemNo" value="${i.itemNo }"></td>
	                                <td onclick='event.cancelBubble=true'>${i.eventNo }
	                                <td onclick='event.cancelBubble=true'>${i.itemNo }</td>
	                                <td  id="cursor">${i.itemName }</td>
	                                <td onclick='event.cancelBubble=true'>${i.itemPrice }</td>
	                                <td onclick='event.cancelBubble=true'>${i.itemDpStatus }</td>
	                            </tr>
	                         </c:forEach>
                         </c:if>
                         
                         <c:if test="${empty list }">
                         	<tr>
                         		<td onclick='event.cancelBubble=true' colspan="6">등록된 상품이 없습니다.</td>
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
							<c:url var="blistBack" value="bannerDetail.do">
								<c:param name="page" value="${pi.currentPage-1 }"/>
								<c:param name="eventNo" value="${ev.eventNo }"/>
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
	                        	<c:url var="blistCheck" value="bannerDetail.do">
	                        		<c:param name="page" value="${p }"/>
	                        		
	                        		<c:param name="eventNo" value="${ev.eventNo }"/>
	                   
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
							<c:url var="blistAfter" value="bannerDetail.do">
								<c:param name="page" value="${pi.currentPage+1 }"/>
								<c:param name="eventNo" value="${ev.eventNo }"/>
	                   
							</c:url>
	                        <li class="page-item-t">
	                        <a class="page-link-t" href="${blistAfter }">
	                       <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-right-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M12.14 8.753l-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
</svg></a></li>
						</c:if>
                    </ul>

                </div>


		
		<script>
		//상품 상세보기 
		  	$(function(){

       	       		$("tr").on("click",function(){
       	       			var eventNo=$(this).children().eq(1).text();
       	       			var itemNo=$(this).children().eq(2).text();
       	        		 var page=${pi.currentPage };   
       	        		 var type='event';
       	        	
       	           		location.href="itemDetail.do?itemNo="+itemNo+"&page="+page+"&type="+type;
       	       		})
       	        	
       	       	})
		
		   //선택 제외
    	function bannerItemDelete(){
    
    		var sendArr=Array();
    		var sendCnt=0;
    		var chkbox=$(".common");
    		
    		for(i=0; i<chkbox.length;i++){
    			if(chkbox[i].checked==true){
    				sendArr[sendCnt]=chkbox[i].value;
    				sendCnt++;
    			}
    		}
    		
    		$.ajax({
				url:"bannerItemDelete.do",
				type:"post",
				traditional:true,
				data:{"sendArr":sendArr},
				success:function(data){
					alert('여기까진 온다');
					getList();
					        					
				},
				error:function(request, status, errorData){
					alert('첫번째 오류인가');
                    alert("error code: " + request.status + "\n"
	                           +"message: " + request.responseText
	                           +"error: " + errorData);
	                  }   
				
				 
			});
    		

    	} 
		   
		   
    	//상품 삭제 후 리스트 가져오기
        function getList(){
       	 var page=${pi.currentPage};
       	 var eventNo=${ev.eventNo};
       	 
       	 $.ajax({
       		 
       	 	url:"biChange.do", 
       	 	data:{"page":page,"eventNo":eventNo},
       	 	dataType:"json",
       	 	success:function(data){
       	 		
       	 	console.log('두번째도 온다');
       	 		$tableBody=$("tbody");
       	 		$tableBody.html("");
       	 		
       	 		var $tr;
       	 		var $eventNo;
       	 		var $itemNo;
       	 		var $itemName;
       	 		var $itemPrice;
       	 		var $itemDpStatus;
       	 	
       	 		
       	 				
       	 				 for(var i in data.list){
       	 					
       	 				
       	 				$tr=$("<tr id='cursor'>");
       	 				
       	 				$checkBox=$("<td><input type='checkbox' class='common' name='itemNo'>").val(data.list[i].itemNo);     	 			
       	 				$eventNo=$("<td>").text(data.list[i].eventNo);
       	 				$itemNo=$("<td>").text(data.list[i].itemNo);
       	 				$itemName=$("<td>").text(data.list[i].itemName);
       	 				$itemPrice=$("<td>").text(data.list[i].itemPrice);
       	 				$itemDpStatus=$("<td>").text(data.list[i].itemDpStatus);
       	 				
       	 				$tr.append($checkBox);
       	 				$tr.append($eventNo);
       	 				$tr.append($itemNo);
       	 				$tr.append($itemName);
       	 				$tr.append($itemPrice);
       	 				$tr.append($itemDpStatus);
       	 				$tableBody.append($tr);
       	 				
       	 			} 
       	 			
       	 		
       	 	},
       	 	error:function(request, status, errorData){
       	 		alert('두번째 오류인가');
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



            </div><!--내용담은 컨테이너-->
        </div><!--250px띄운 div-->
        
       <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
     <script src="https://code.jquery.com/jquery-3.4.1.js" type="text/javascript"></script>
    <script integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>
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
    <title>기간별 매출 통계</title>    
    <style>


.btn1{
	background:#F5F5F5;
	color:black;
	border-radius:5px;
	padding:2px 5px;
	transition:0.2s;
  	position:relative;
  	border:1px solid #E0E0E0 !important; 
	font-size:12px;

}
.btn1:hover{
  background:rgba(69,75,77,0.2);
  color:black;
/*   border:1px solid #BDBDBD; */
}

.btn1:hover:before,#btn:hover:after{
  width:100%;
  transition:0.2s;
}



.btn2{
	background-color:rgba(69,75,77,0.2);
	color:black;
	border-radius:px;
	padding:3px 15px;
	transition:0.2s;
  	position:relative;
  	border:1px solid #B0BEC5; 
	font-size:14px;
	font-weight: bold;
	

}
.btn2:hover{
  background:rgba(69,75,77,0.2);
  color:black;
  border:1px solid #BDBDBD;
}

.btn2:hover:before,#btn:hover:after{
  width:100%;
  transition:0.2s;
}


input, select,textarea{
    border: 1px solid #dee2e6;
}


.total{

	text-align:center;
	border: 1px solid #dee2e6;
}


</style>


</head>
    <body>
    <jsp:include page="../common/adminMenubar.jsp"/>
        <div class="content">
            <div class="container box">
                <h3>기간별 매출 통계</h3>
                <br>
              
                <input type="button" class="btn" value="기간별" onclick="location.href='sDateList.do?type='+'N'">
                <input type="button" class="btn" value="카테고리별" onclick="location.href='sCategoryList.do?type='+'N'">
                <input type="hidden" id="type" name="type" value="${type }">
                 <input type="hidden" id="startD" name="startD" value="${startDay }">
			     <input type="hidden" id="lastD" name="lastD" value="${lastDay }">
                <br><br><br>

                <div style="width:100%; text-align:right;">
                <table>
                	<tr>
                		<th rowspan="2" style="width:25%; border: 1px solid #CCCCCC;background-color:rgba(69,75,77,0.2);padding:0.25rem !important;vertical-align:middle;">기간 선택</th>
                		<td style="text-align:left; padding:0.3rem !important; border: 1px solid #CCCCCC;" onclick="event.cancelBubble=true">
                			&nbsp;
                			<input type="radio" id="type" name="type" value="Y"> 연도별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                			<input type="radio" id="type" name="type" value="M"> 월별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                			<input type="radio" id="type" name="type" value="D"> 일별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                		</td>
                		
                	</tr>
                		
                	<tr>
                		<th  style="text-align:left ;padding:0.3rem !important; border: 1px solid #CCCCCC;" onclick="event.cancelBubble=true">
			                &nbsp;&nbsp;<input type="date" id="date1" name="date1" value="">~ <input type="date" id="date2" name="date3" value="">&nbsp;&nbsp;
			               <input type="button" class="btn1" value="오늘" onclick="goList('T');">
			               <input type="button" class="btn1" value="일주일" onclick="goList('W');">
			               <input type="button" class="btn1" value="한달" onclick="goList('O');">
			               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		               		<input type="button" class="btn2" value="검색" onclick="checkDate();">
		               </th>
                	</tr>
                	
                </table>
                <table>
                <tr>
                		<td class="total" style="width:40%"onclick="event.cancelBubble=true">검색 기간 </td>
                		<td class="total"onclick="event.cancelBubble=true">총 결제 건 수</td>
                		<td class="total"onclick="event.cancelBubble=true">총 결제 금액</td>
                	</tr>
                	<tr>
                		<td class="total"onclick="event.cancelBubble=true">${startDay } ~ ${lastDay }</td>
                		<td class="total"onclick="event.cancelBubble=true">${sumTotalC } 건</td>
                		<td class="total"onclick="event.cancelBubble=true">${sumTotalP } 원</td>
                	</tr>
                </table>
               
               
                </div>
                    <table>
                        <thead>
                            <tr>
                                <th onclick="event.cancelBubble=true">날짜</th>
                                <th onclick="event.cancelBubble=true">결제건 수</th>
                                <th onclick="event.cancelBubble=true">매출액</th>
                             </tr>   
                         </thead>
                         <tbody>
                         	<c:if test="${!empty pList }">
                             <c:forEach var="i" items="${pList }" varStatus="cnt">
	                             <tr>
	                             	<c:choose>
		                             	<c:when test="${type eq 'Y' }">
			                                <td>${i.itemName }</td>	                             	
		                             	</c:when>
		                             	<c:when test="${type eq 'M' }">
			                                <td>${i.itemName }</td>	                             	
		                             	</c:when>
		                             	<c:otherwise>
		                                	<td>${i.paymentDate }</td>
		                                </c:otherwise>
	                                </c:choose>
	                                <td>${i.totalCount } 건</td>
	                                <td>${i.totalPayment } 원</td>
	                            </tr>
                            </c:forEach>
                            </c:if>
                            <c:if test="${empty pList }">
                            	<tr>
	                                <td colspan="3">결제 내역이 없습니다.</td>
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
							<c:url var="blistBack" value="sDateList.do">
								<c:param name="page" value="${pi.currentPage-1 }"/>
								<c:param name="type" value="${type }"/>
								<c:param name="startD" value="${startDay }"/>
								<c:param name="lastD" value="${lastDay }"/>
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
	                        	<c:url var="blistCheck" value="sDateList.do">
	                        		<c:param name="page" value="${p }"/>
	                        		<c:param name="type" value="${type }"/>
	                        		<c:param name="startD" value="${startDay }"/>
									<c:param name="lastD" value="${lastDay }"/>	
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
							<c:url var="blistAfter" value="sDateList.do">
								<c:param name="page" value="${pi.currentPage+1 }"/>
								<c:param name="type" value="${type }"/>
								<c:param name="startD" value="${startDay }"/>
								<c:param name="lastD" value="${lastDay }"/>
							</c:url>
	                        <li class="page-item-t">
	                        <a class="page-link-t" href="${blistAfter }">
	                       <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-right-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M12.14 8.753l-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
</svg></a></li>
						</c:if>
                    </ul>

                </div>





            </div><!--내용담은 컨테이너-->
        </div><!--250px띄운 div-->
       
       <script>
       //매출 상세보기 
 
          	$(function(){
   	       		
   	       		$("tr").on("click",function(){
   	       			var type=$("#type").val();
   	       			var type2='date';
   	       			var startD=$(this).children().eq(0).text();
   	       			var startDay=$("#startD").val();
   	       			var lastDay=$("#lastD").val();
   	        		 var beforePage=${pi.currentPage };   
   	        	
   	        		 
   	           		location.href="sDetail.do?startD="+startD+"&beforePage="+beforePage+"&type2="+type2+"&type="+type+"&startDay="+startDay+"&lastDay="+lastDay;
   	       		})
   	       	})
                    
       
       
       
       
       
       
       
       function goList(type){
    	   var type=type;
    	   var page=${pi.currentPage}
    	   location.href="sDateList.do?type="+type+"&page="+page;
       }
       
       function checkDate(){
    	  var type=$("input[name=type]:checked").val();
    	  var page=${pi.currentPage};
    	  
    	  if($("#date1").val()<$("#date2").val()){
	    	  var startD=$("#date1").val();
	    	  var lastD=$("#date2").val();
    	  }else{
    		  var startD=$("#date2").val();
	    	  var lastD=$("#date1").val();
    	  }
    	 

     	  if(!$("input[name=type]:checked").val()){
    		  alert('기간 유형을 선택해주세요.');
    	  }else if(!$("#date1").val()){
    		  alert('검색 시작 날짜를 지정해주세요.');
    	  }else if(!$("#date2").val()){
    		  alert('검색 마지막 날짜를 지정해주세요.');
    	  }else{
    		  location.href="sDateList.do?type="+type+"&startD="+startD+"&lastD="+lastD+"&page="+page;
    	  }
    	   
    	   
       }
       
       </script>
        
       <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>
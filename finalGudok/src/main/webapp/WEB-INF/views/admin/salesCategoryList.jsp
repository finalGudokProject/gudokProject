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
    <title>카테고리별 매출 통계</title>    
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
                <h3>카테고리별 매출 통계</h3>
                <br>
                <input type="button" class="btn" value="기간별" onclick="location.href='sDateList.do?type='+'N'">
                <input type="button" class="btn" value="카테고리별" onclick="location.href='sCategoryList.do?type='+'N'">
			      <input type="hidden" id="startDay" name="startDay" value="${startDay }">
			      <input type="hidden" id="lastDay" name="lastDay" value="${lastDay }">
			      <input type="hidden" id="type" name="type" value="${type }">
			      <c:out value="${startDay}"/>
			      <c:out value="${lastDay}"/>
			      <c:out value="${startD}"/>
			      <c:out value="${type }"/>
			
                
                <br><br><br>

                <div style="width:100%; text-align:right;">
                <table>
                	<tr>
                		<th style="width:25%; border: 1px solid #CCCCCC;background-color:rgba(69,75,77,0.2);padding:0.25rem !important;vertical-align:middle;"onclick="event.cancelBubble=true">기간 선택</th>
                		<th  style="text-align:left ;padding:0.3rem !important; border: 1px solid #CCCCCC;"onclick="event.cancelBubble=true">
			                &nbsp;&nbsp;<input type="date" id="date1" name="date1" value="">~ <input type="date" id="date2" name="date3" value="">&nbsp;&nbsp;
			               <input type="button" class="btn1" value="오늘" onclick="goList('T');">
			               <input type="button" class="btn1" value="일주일" onclick="goList('W');">
			               <input type="button" class="btn1" value="한달" onclick="goList('O');">
			               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		               		<input type="button" class="btn2" value="검색" onclick="checkDate('D');">
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
                                <th onclick="event.cancelBubble=true">카테고리</th>
                                <th onclick="event.cancelBubble=true">결제건 수</th>
                                <th onclick="event.cancelBubble=true">비율</th>
                                <th onclick="event.cancelBubble=true">매출액</th>
                             </tr>   
                         </thead>
                         <tbody>
                         	<c:if test="${!empty pList }">
                             <c:forEach var="i" items="${pList }" varStatus="cnt">
	                             <tr>
	                             	<td>${i.categoryNo }</td>
	                                <td>${i.totalCount } 건</td>
	                                <c:if test="${ratio[cnt.index] gt 50 }">
	                                <td style="color:red;">${ratio[cnt.index] } %</td>
	                                </c:if>
	                                <c:if test="${ratio[cnt.index] lt 50 }">
	                                <td>${ratio[cnt.index] } %</td>
	                                </c:if>
	                                
	                                <td>${i.totalPayment } 원</td>
	                            </tr>
                            </c:forEach>
                            </c:if>
                            <c:if test="${empty pList }">
                            	<tr>
	                                <td colspan="4">결제 내역이 없습니다.</td>
	                            </tr>
                            </c:if>
                         </tbody>
                    </table>



                    <br>


                  



            </div><!--내용담은 컨테이너-->
        </div><!--250px띄운 div-->
       
       <script>
       //매출 상세보기 
       
     	 	$(function(){
   	       		
   	       		$("tr").on("click",function(){
   	       			var type=$("#type").val();
   	       			var type2='category';
   	       			var startDay=$("#startDay").val();
   	       			var lastDay=$("#lastDay").val();
   	        		var categoryNo=$(this).children().eq(0).text();
   	        		
   	        		alert(categoryNo)
   	        		
   	        
   	        		 
   	           		location.href="sDetail.do?type2="+type2+"&type="+type+"&startDay="+startDay+"&lastDay="+lastDay+"&categoryNo="+categoryNo;
   	       		})
   	       	})
               
       
       
   
      	
       function goList(type){
    	   var type=type;
    	
    	   location.href="sCategoryList.do?type="+type;
       }
       
        function checkDate(type){
    	   alert('????')
    	  var type=type;
    	  
    	  if($("#date1").val()<$("#date2").val()){
	    	  var startD=$("#date1").val();
	    	  var lastD=$("#date2").val();
    	  }else{
    		  var startD=$("#date2").val();
	    	  var lastD=$("#date1").val();
    	  }
    	 

     
    	  if(!$("#date1").val()){
    		  alert('검색 시작 날짜를 지정해주세요.');
    	  }else if(!$("#date2").val()){
    		  alert('검색 마지막 날짜를 지정해주세요.');
    	  }else{
    		  location.href="sCategoryList.do?type="+type+"&startD="+startD+"&lastD="+lastD;
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
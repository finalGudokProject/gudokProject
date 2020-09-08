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
    
	
	
    <title>탈퇴 회원 리스트</title>    
      <!-- google charts -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   
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
    width:50%;
    vertical-align: middle;
    background-color: rgb(198, 224, 253);
}





input, select,textarea{
    border: 1px solid #CCCCCC;
}

  .table{
     padding: 0.75rem;
       margin:auto;
        word-wrap:break-word;
        word-break:break-all;
        table-layout:fixed;
         
    }


 td{
 	padding: 0.75rem;
     text-overflow: ellipsis;
     overflow:hidden;
	white-space:nowrap;
    }
   

</style>


</head>
    <body>
    <jsp:include page="../common/adminMenubar.jsp"/>
        <div class="content">
            <div class="container box">
                <h3>탈퇴 내역</h3>
                <br>
    
                <div>
                    <div id="secessionChart" style="width:40%; float:left; height:350px; background-color:lightsteelblue">구글차트</div>
                    <div style="width:58%; padding-left:20px;float:left;height:300px;">
                       
                        <table style="width:47%; float:left;">
                        	<thead>
                        	<tr><th onclick="event.cancelBubble=true" style="border-top:none !important;font-size:18px;text-align:left;">항목별</th>
                        	</tr>
                        		<tr>
	                                <th onclick="event.cancelBubble=true">사유 </th>
	                                <th onclick="event.cancelBubble=true" style="background-color:#CFD8DC">회원 수</th>
	                            </tr>
                        	</thead>
                        	<tbody id="tbody1">
                        	
                        		<c:forEach var="s" items="${sList }" varStatus="cnt">
		                            <tr>
		                            <c:choose>
		                            	<c:when test="${s.secessionCategory eq '1'}">
			                            	<td onclick="event.cancelBubble=true">서비스 문제</td>
			                            	<td onclick="event.cancelBubble=true" style="background-color:#CFD8DC">${s.total }명</td>
		                            	</c:when>
		                            	<c:when test="${s.secessionCategory eq '2'}"><td onclick="event.cancelBubble=true" >가격 문제</td>
		                            	<td onclick="event.cancelBubble=true" style="background-color:#CFD8DC">${s.total }명</td></c:when>
		                            	<c:when test="${s.secessionCategory eq '3'}"><td onclick="event.cancelBubble=true">상품 문제</td>
		                            	<td onclick="event.cancelBubble=true" style="background-color:#CFD8DC">${s.total }명</td></c:when>
		                            	<c:when test="${s.secessionCategory eq '4'}"><td onclick="event.cancelBubble=true">개인 정보 문제</td>
		                            	<td onclick="event.cancelBubble=true" style="background-color:#CFD8DC">${s.total }명</td></c:when>
		                            	<c:when test="${s.secessionCategory eq '5'}"><td onclick="event.cancelBubble=true">기타</td>
		                            	<td onclick="event.cancelBubble=true" style="background-color:#CFD8DC">${s.total }명</td></c:when>
			                        </c:choose>
			                            
		                            </tr>
	                            </c:forEach>
                         	</tbody>
                        </table>
                       
                   
                         
                          <table style="width:47%;float:left;margin-left:16px;">
                        	<thead>
                        	<tr><th onclick="event.cancelBubble=true" style="border-top:none !important;font-size:18px;text-align:left;">등급별</th>
                        	</tr>
                        		<tr>
	                                <th onclick="event.cancelBubble=true" style="width:65%">등급 </th>
	                                <th onclick="event.cancelBubble=true"  style="width:35%;background-color:#CFD8DC">회원 수</th>
	                            </tr>
                        	</thead>
                        	<tbody id="tbody2">
                        		<c:forEach var="i" items="${mList }" varStatus="cnt">
		                            <tr>
		                            <c:choose>
		                            	<c:when test="${i.gradeNo eq '4'}"><td onclick="event.cancelBubble=true">1등급</td>
		                            	 <td onclick="event.cancelBubble=true" style="background-color:#CFD8DC">${i.total }명</td></c:when>
		                            	<c:when test="${i.gradeNo eq '3'}"><td onclick="event.cancelBubble=true">2등급</td>
		                            	 <td onclick="event.cancelBubble=true" style="background-color:#CFD8DC">${i.total }명</td></c:when>
		                            	<c:when test="${i.gradeNo eq '2'}"><td onclick="event.cancelBubble=true">3등급</td>
		                            	 <td onclick="event.cancelBubble=true" style="background-color:#CFD8DC">${i.total }명</td></c:when>
		                            	<c:when test="${i.gradeNo eq '1'}"><td onclick="event.cancelBubble=true">4등급</td>
		                            	 <td onclick="event.cancelBubble=true" style="background-color:#CFD8DC">${i.total }명</td></c:when>
			                        </c:choose>
			                              
		                            </tr>
	                            </c:forEach>
		                            
                         	</tbody>
                        </table>
                       </div>

                <br><br>
                <br>   <br><br>
                <br>   <br><br>
                <br>   <br><br>
                <br>   <br><br><br>
           
                    
                    <div style="margin-top:50px; margin-bottom:15px; float:right; width:100%; text-align:right">
                        <div style="float:left;">
	                            <select id="categoryNo" name="categoryNo" style="width:110px;">
	                                <option value="" selected>전체</option>
	                                <option value="1">서비스 문제</option>
	                                <option value="2">가격 문제</option>
	                                <option value="3">상품 문제</option>
	                                <option value="4">개인정보 문제</option>
	                                <option value="5">기타</option>
	                            </select>
	                            <select id="type" name="type" style="width:100px;">
	                                <option value="" selected>전체</option>
	                                <option value="memberNo">회원번호</option>
	                                <option value="memberId">아이디</option>
	                                <option value="memberName">회원명</option>
	                                <option value="content">탈퇴 사유</option>
	                            </select>
	                            <input type="text" id="word" name="word" value="" style="width:150px;">
                            <input type="button" class="btn" value="검색" onclick="search()">
                        </div> 
                    </div>
                <br>
                <br>
                
                    <table class="table">
                        <thead>
                            <tr>
                                <th onclick="event.cancelBubble=true">회원번호</th>
                                <th onclick="event.cancelBubble=true">아이디 (이름)</th>
                                <th onclick="event.cancelBubble=true">탈퇴사유</th>
                                <th onclick="event.cancelBubble=true">등급</th>
                                <th onclick="event.cancelBubble=true">탈퇴일자</th>
                            </tr>   
                         </thead>
                         <tbody>
                         	<c:if test="${!empty msList }">
                         	<c:forEach var="i" items="${msList }">
	                             <tr>
	                                <td onclick="event.cancelBubble=true">${i.memberNo }</td>
	                                <td id="cursor" class="cursor">${i.memberId } (${i.memberName })</td>
	                                <td class="secession" data-toggle="modal" data-target="#myModal">${i.secessionContent }</td>
	                                 <c:choose>
		                            	<c:when test="${i.gradeNo eq '4'}"><td>1등급</td></c:when>
		                            	<c:when test="${i.gradeNo eq '3'}"><td>2등급</td></c:when>
		                            	<c:when test="${i.gradeNo eq '2'}"><td>3등급</td></c:when>
		                            	<c:when test="${i.gradeNo eq '1'}"><td>4등급</td></c:when>
			                        </c:choose>
	                                <td onclick="event.cancelBubble=true">${i.secessionDate }</td>
	                            </tr>
                            </c:forEach>
                            </c:if>
                            <c:if test="${empty msList}">
                            	<td colspan="5">해당 회원이 없습니다.</td>
                            </c:if>
                         </tbody>
                    </table>

</div>

                    <br>

				<c:if test="${!empty msList }">
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
							<c:url var="blistBack" value="sList.do">
								<c:param name="page" value="${pi.currentPage-1 }"/>
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
	                        	<c:url var="blistCheck" value="sList.do">
	                        		<c:param name="page" value="${p }"/>
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
							<c:url var="blistAfter" value="sList.do">
								<c:param name="page" value="${pi.currentPage+1 }"/>
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
        
         <div id="myModal" class="modal" tabindex="-1">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title">탈퇴 사유</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      	<div>
			        <p id="secessionContent" style="word-break:break-all;"></p>
			        </div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
        
       
     <script>
     //검색
     
     function search(){
   
    	 var categoryNo=$("#categoryNo").val();
    	 var type=$("#type").val();
    	 var word=$("#word").val();
    	
    	 alert(categoryNo)
    	 alert(type)
    	 alert(word)
    	 
    	 if(type=="memberNo"){
    		 if(word.replace(/[0-9]/g, "").length > 0) {
    		        alert("숫자만 입력해 주십시오.");
    		     $("#word").focus();
    		     return;
    	 	}
    	 }
    	 
			
			 location.href="sList.do?categoryNo="+categoryNo+"&type="+type+"&word="+word;
    	
    	
    	 
    	 
    	 
    	 
    	 
     }
     
     
     
     
  	//탈퇴 사유 상세보기(modal)
   $(function(){
	  
	  $("td[class=secession]").on("click",function(){
	  
	  	var content=$(this).text();
	   	$("#secessionContent").text(content);
	  	
	 
	  	
	  	$('#myModal').on('shown.bs.modal', function () {
	  	  $('#myInput').trigger('focus')
	  	})
		 
	  })
 }) 
     //회원 상세 정보보기
   	$(function(){
       		
       		$("td[class=cursor]").on("click",function(){
       			var type='secession';
       			var memberNo=$(this).parent().children().eq(0).text();
        		 var page=${pi.currentPage };   
        		
        		 location.href="mDetail.do?memberNo="+memberNo+"&page="+page+"&type="+type;
       		})
       	})

     
     //구글 차트
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

   
      function drawChart() {
    	  
    	var one=${sList[0].total};
    	var two=${sList[1].total};
    	var three=${sList[2].total};
    	var four=${sList[3].total};
    	var five=${sList[4].total};
    	
    	  var data = google.visualization.arrayToDataTable([
    		  
    
              ['Task', 'Percentage'],
              ['서비스 불만족', one],
              ['높은 가격', two],
              ['상품 부족', three],
              ['개인 정보 보호', four],
              ['기타', five]
            ]);
        
       
        // 그래프 옵션 설정
       
        var options = {
          title: '탈퇴 사유 현황',
          pieHole: 0.4,
          chartArea:{left:30,right:15,top:50,width:'100%',height:'100%'},
       	  colors:['#FFE0B2','#E57373','#D32F2F','#FF8A65','#795548'],
       	  fontSize:14
        };

        // 입력값을 화면에 뿌려줌
        var chart = new google.visualization.PieChart(document.getElementById('secessionChart'));

        chart.draw(data, options);
      }
    </script>    
        
       <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.js" type="text/javascript"></script>
    <script integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>
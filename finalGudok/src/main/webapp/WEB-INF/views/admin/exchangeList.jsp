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
   
   
    <title>교환 신청 리스트</title>    
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
 table{
   
        word-wrap:break-word;
        word-break:break-all;
        table-layout:fixed;
        }
      
  td{
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
                <h3>교환 신청 리스트</h3>
                <br>
    
                <div>
                    <div style="width:50%; float:left; height:250px; background-color:lightsteelblue" id="exchangeChart">교환 비율 차트</div>
                    <div style="width:50%; padding-left:50px; padding-right:30px; padding-bottom:10px; float:left;height:300px;">
                    <br><br>
                        <h5>교환 사유</h5>
                        
                        <table>
                            <tr>
                                <td  onclick='event.cancelBubble=true'>상품 품질 문제</td>
                                <td  onclick='event.cancelBubble=true' id="td3">${list[0].temp2 }명</td>
                            </tr>
                            <tr>
                                <td  onclick='event.cancelBubble=true'>오배송</td>
                                <td  onclick='event.cancelBubble=true' id="td3">${list[1].temp2 }명</td>
                            </tr>
                            <tr>
                                <td  onclick='event.cancelBubble=true'>기타</td>
                                <td  onclick='event.cancelBubble=true' id="td3">${list[2].temp2 }명</td>
                            </tr>

                        </table>
                    </div>
                    
                </div>

                <br><br><br><br><br><br><br><br><br><br>
                    
                    <div style="width:100%;">
                    <div style="float:left;">
                    	<select id="category" name="category">
                            <option value="">전체</option>
                            <option value="N">교환 대기</option>
                            <option value="Y">교환 완료</option></select>
                        <select id="type" name="type">
                            <option value="">전체</option>
                            <option value="exchangeContent">교환사유</option>
                            <option value="subscribeNo">구독번호</option>
                            <option value="memberId">구매자</option></select>
                        <input type="text" id="word" name="word" value="">   
                        <input type="button" class="btn" value="검색" onclick="search()">
                    </div>
                    <div style="float:right;">                    	
                    	<input type="button" class="btn" value="교환대기" onclick="changeN()">
                        <input type="button" class="btn" value="교환완료" onclick="changeY()">
                    </div>
                    </div>
                
                <br>
                <br>
                <br>
                <br>
                <br>
               
            	
        
                    <table>
                        <thead>
                            <tr>
                                <th onclick='event.cancelBubble=true' style="width:20px;"><input type="checkbox" id="checkAll"></th>
                                <th onclick='event.cancelBubble=true' style="width:130px;">신청 일자</th>
                                <th onclick='event.cancelBubble=true' style="width:150px;">교환 사유</th>
                                <th onclick='event.cancelBubble=true' style="width:100px;">구독 번호</th>
                                <th onclick='event.cancelBubble=true' style="width:250px;">상품명</th>
                                <th onclick='event.cancelBubble=true' style="width:100px;">구매자</th>
                                <th onclick='event.cancelBubble=true' style="width:120px;">가격</th>
                                <th onclick='event.cancelBubble=true' style="width:100px;">상태</th>
                             </tr>   
                         </thead>
                         <tbody id="e">
                         	<c:forEach var="i" items="${eList }" varStatus="cnt">
	                             <tr>
	                                <td><input type="checkbox" class="common" id="exchangeNo${cnt.index}" name="exchangeNo" value="${i.exchangeNo }" onclick='event.cancelBubble=true'></td>
	                                <td  onclick='event.cancelBubble=true'>${i.exchangeDate }</td>
	                                <td>${i.exchangeContent }</td>
	                                <td>${i.subscribeNo }</td>
	                                <td>${i.itemName }</td>
	                                <td>${i.memberId }</td>
	                                <td>${i.itemPrice }</td>
	                                <td>${i.exchangeStatus }</td>
	                            </tr>
                            </c:forEach>
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
							<c:url var="blistBack" value="exchangList.do">
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
	                        	<c:url var="blistCheck" value="exchangList.do">
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
							<c:url var="blistAfter" value="exchangList.do">
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




            </div><!--내용담은 컨테이너-->
        </div><!--250px띄운 div-->
        
        
        
           <script>
           //검색
            function search(){
        
        	 var category=$("#category").val();
        	 var type=$("#type").val();
        	 var word=$("#word").val();
        	 alert(category)
        	 alert(type)
        	 alert(word)
        	 
        	 if(type=="subscribeNo"){
        		 if(word.replace(/[0-9]/g, "").length > 0) {
        		        alert("숫자만 입력해 주십시오.");
        		      $("#word").val("");
        		     $("#word").focus();
        		     return;
        	 	}
        	 }
        	 
   			
  			 location.href="exchangList.do?category="+category+"&type="+type+"&word="+word;
        	
        	
        }
           
           
           //교환 대기로 변경
           function changeN(){
        	   
        	  confirm("교환 대기 처리하시겠습니까?");
        	   var sendArr=Array();
       		   var sendCnt=0;
       		   var chkbox=$(".common");
        	   var page=${pi.currentPage};
        	   var type='N';
        	   
        	   alert(page);
        	   alert(type);
        	   
        	   for(i=0; i<chkbox.length;i++){
       			if(chkbox[i].checked==true){
       				sendArr[sendCnt]=chkbox[i].value;
       				sendCnt++;
       			}
       		}
        	   
        	   $.ajax({
   				url:"eChange.do",
   				traditional:true,
   				data:{"sendArr":sendArr,"page":page,"type":type},
   				success:function(data){
   					
   					alert('성공이다');
   					/* getList(); */
   					        					
   				},
   				error:function(request, status, errorData){
                       alert("error code: " + request.status + "\n"
   	                           +"message: " + request.responseText
   	                           +"error: " + errorData);
   	                  }   
   			});
        	   
        	 
        	   
           }
           
           //교환 완료 변경
           function changeY(){
        	   confirm("교환 완료 처리하시겠습니까?");
        	   var sendArr=Array();
       		   var sendCnt=0;
       		   var chkbox=$(".common");
        	   var page=${pi.currentPage};
        	   var type='Y';
        	   
        	   alert(page);
        	   alert(type);
        	   
        	   for(i=0; i<chkbox.length;i++){
       			if(chkbox[i].checked==true){
       				sendArr[sendCnt]=chkbox[i].value;
       				sendCnt++;
       			}
       		}
        	   
        	   $.ajax({
   				url:"eChange.do",
   				traditional:true,
   				data:{"sendArr":sendArr,"page":page,"type":type},
   				success:function(data){
   					
   					alert('성공이다');
   					getList();
   					        					
   				},
   				error:function(request, status, errorData){
                       alert("error code: " + request.status + "\n"
   	                           +"message: " + request.responseText
   	                           +"error: " + errorData);
   	                  }   
   			});
        	   
        	 
        	   
           }
           
           
         //상태 변경 후 리스트 가져오기
           function getList(){
        	 alert('교환 페이지 왔고')
          	 var page=${pi.currentPage};
          	 
          	 $.ajax({
          		 
          	 	url:"exchangeListChange.do", 
          	 	data:{"page":page},
          	 	dataType:"json",
          	 	success:function(data){
          	 		
          	 		
             	     alert('바꾸는데까지 왔는데')
          	 		$tableBody=$("#e");
          	 		$tableBody.html("");
          	 		
          	 		var $tr;
          	 		var $checkBox;
          	 		var $itemName;
          	 		var $itemprice;
          	 		var $subscribeNo;
          	 		var $exchangeDate;
          	 		var $exchangeContent;
          	 		var $exchangeStatus;
          	 		var $memberId;
          	 		var $th;
          	 		
          	 				
          	 	
          	 			 	for(var i in data.list){
          	 					
          	 				
          	 				$tr=$("<tr id='cursor'>");
          	 				$td=$("<td onclick='event.cancelBubble=true'>");
          	 				$checkBox=$("<input type='checkbox' class='common' name='exchangeNo'>").val(data.list[i].exchangeNo);     	 			
          	 				$exchangeDate=$("<td onclick='event.cancelBubble=true'>").text(data.list[i].exchangeDate);     	 			
          	 				$exchangeContent=$("<td>").text(data.list[i].exchangeContent);
          	 				$subscribeNo=$("<td>").text(data.list[i].subscribeNo);
          	 				$itemName=$("<td>").text(data.list[i].itemName);
          	 				$memberId=$("<td>").text(data.list[i].memberId);
          	 				$itemPrice=$("<td>").text(data.list[i].itemPrice);
          	 				$exchangeStatus=$("<td>").text(data.list[i].exchangeStatus);
          	 				
          	 				
          	 				$td.append($checkBox);
          	 				$tr.append($td);
          	 				$tr.append($exchangeDate);
          	 				$tr.append($exchangeContent);
          	 				$tr.append($subscribeNo);
          	 				$tr.append($itemName);
          	 				$tr.append($memberId);
          	 				$tr.append($itemPrice);
          	 				$tr.append($exchangeStatus); 
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
         
         //게시물 상세보기(ajax후)
           
        	$(function(){
        		
        		$("tr").on("click",function(){
        			var subscribeNo=$(this).children().eq(3).text();
         			 var page=${pi.currentPage };   
         			 var type="exchange";
         				
            		location.href="oDetail.do?subscribeNo="+subscribeNo+"&page="+page+"&type="+type;
        		})
        	})
        	
         
         
         //구글 차트

        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

   
      function drawChart() {
    	  
    	var one=${list[0].temp2};
    	var two=${list[1].temp2};
    	var three=${list[2].temp2};
    	
    	
    	  var data = google.visualization.arrayToDataTable([
    		  
    
              ['Task', 'Percentage'],
              ['상품 품질 문제', one],
              ['오배송 문제', two],
              ['기타', three]
            ]);
        
       
        // 그래프 옵션 설정
       
        var options = {
          title: '교환 사유별 현황 (최근 7일 기준)',
          
          pieHole: 0.4,
          chartArea:{left:30,top:50,width:'100%',height:'100%'},
       	  colors:['#D84315','#FF8F00','#FFD600'],
       	  fontSize:14
        };

        // 입력값을 화면에 뿌려줌
        var chart = new google.visualization.PieChart(document.getElementById('exchangeChart'));

        chart.draw(data, options);
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
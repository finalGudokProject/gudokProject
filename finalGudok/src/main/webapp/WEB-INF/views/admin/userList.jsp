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
    <title>회원 리스트</title>    
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

</style>
</head>


    <body>
    <jsp:include page="../common/adminMenubar.jsp"/>
        <div class="content">
            <div class="container box">
                <h3>회원 리스트</h3>
                <br>
                <div>
                    <div id="userChart" style="width:40%; float:left; height:320px;"></div>
                    
                    <div style="width:60%; padding:10px; float:left;height:auto;">
          
                        <h5>등급별 정보</h5>
                        
                        <table>
                     
                        	<thead>
                        		<tr>
	                                <th onclick="event.cancelBubble=true">등급 </th>
	                                <th onclick="event.cancelBubble=true">등급명</th>
	                                <th onclick="event.cancelBubble=true">회원 수</th>
	                                <th onclick="event.cancelBubble=true">최소 구매금액</th>
	                                <th onclick="event.cancelBubble=true">적립율</th>
	                            </tr>
                        	</thead>
                        	<tbody id="tbody1">
                        	
                        		<c:forEach var="i" items="${gList }" varStatus="cnt">
		                            <tr>
		                            <c:choose>
		                            	<c:when test="${i.gradeNo eq '4'}"><td onclick="event.cancelBubble=true">1등급</td></c:when>
		                            	<c:when test="${i.gradeNo eq '3'}"><td onclick="event.cancelBubble=true">2등급</td></c:when>
		                            	<c:when test="${i.gradeNo eq '2'}"><td onclick="event.cancelBubble=true">3등급</td></c:when>
		                            	<c:when test="${i.gradeNo eq '1'}"><td onclick="event.cancelBubble=true">4등급</td></c:when>
			                        </c:choose>
			                        	

			                                <td onclick="event.cancelBubble=true">${i.gradeName }</td>
			                                <td onclick="event.cancelBubble=true">${i.total }명</td>
			                                <td onclick="event.cancelBubble=true">${i.gradeMin }원</td>
			                                <td onclick="event.cancelBubble=true">${i.gradeRate } %</td>
		                            </tr>
	                            </c:forEach>
	                            
                         	</tbody>
                        </table>
                       
                    </div>
                    <br>
                
                
                

                <!-- 모달 -->
                <div style="width:100%; margin-top:10px; margin-bottom:15px; text-align: right;">
                    
            		<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary btn-lg" id="btn" data-toggle="modal" data-target="#myModal">최소 구매금액 변경</button>
					<button type="button" class="btn btn-primary btn-lg" id="btn" data-toggle="modal" data-target="#myModal2">적립율 변경</button>
					  <!-- Modal 1-->
					  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					    <div class="modal-dialog">
					      <div class="modal-content">
					        <div class="modal-header">
					            <h4 class="modal-title" id="myModalLabel">최소 구매 금액</h4>
					          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					          
					        </div>
					        <div class="modal-body">
					          <table>
					            <tr>
					                <td onclick="event.cancelBubble=true">
					                <input type="hidden" class="gradeM" name="grade" value="4">1등급</td>
					                <td onclick="event.cancelBubble=true">
					                <input type="number" min="0" class="gradeMin" id="gradeMin1" name="gradeMin1"></td>
					            </tr>
					            <tr>
					               <td onclick="event.cancelBubble=true">
					               <input type="hidden" class="gradeM" name="grade" value="3">2등급</td>
					                <td onclick="event.cancelBubble=true">
					                <input type="number" min="0" class="gradeMin" id="gradeMin2" name="gradeMin2"></td>
					            </tr>
					             <tr>
					               <td onclick="event.cancelBubble=true">
					               <input type="hidden" class="gradeM" name="grade" value="2">3등급</td>
					                <td onclick="event.cancelBubble=true">
					                <input type="number" min="0" class="gradeMin" id="gradeMin3" name="gradeMin3"></td>
					            </tr>
					            <tr>
					                <td onclick="event.cancelBubble=true">
					                <input type="hidden" class="gradeM" name="grade" value="1">4등급</td>
					                <td onclick="event.cancelBubble=true">
					                <input type="number" min="0" class="gradeMin" id="gradeMin4" name="gradeMin4"></td>
					            </tr>
					          </table>
					        </div>
					        <div class="modal-footer">
					         <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					          <button type="button" class="btn btn-primary" id="test" onclick="gradeMinChg()">저장</button>
					        </div>
					      </div>
					    </div>
					  </div>
					  
					  
					  
					<!-- Modal 2-->
					<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					    <div class="modal-dialog">
					      <div class="modal-content">
					        <div class="modal-header">
					            <h4 class="modal-title" id="myModalLabel">등급별 적립율</h4>
					          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					          
					        </div>
					        <div class="modal-body">
					          <table  onclick="event.cancelBubble=true">
					            <tr>
					                <td onclick="event.cancelBubble=true">
					                <input type="hidden" class="grade" name="grade" value="4">1등급</td>
					                <td onclick="event.cancelBubble=true">
					                <input type="number" min="0" max="100" class="gradeRate" id="rate1" name="gradeRate"></td>
					            </tr>
					             <tr>
					                <td onclick="event.cancelBubble=true">
					                <input type="hidden" class="grade" name="grade" value="3">2등급</td>
					                
					                <td onclick="event.cancelBubble=true">
					                <input type="number" min="0" max="100" class="gradeRate" id="rate2" name="gradeRate"></td>
					            </tr>
					             <tr>
					                <td onclick="event.cancelBubble=true">
					                <input type="hidden" class="grade" name="grade" value="2">3등급</td>
					                <td onclick="event.cancelBubble=true">
					                <input type="number" min="0" max="100" class="gradeRate" id="rate3" name="gradeRate"></td>
					            </tr>
					             <tr>
					                <td onclick="event.cancelBubble=true">
					                <input type="hidden" class="grade" name="grade" value="1">4등급</td>
					                <td onclick="event.cancelBubble=true">
					                <input type="number" min="0" max="100" class="gradeRate" id="rate4" name="gradeRate"></td>
					            </tr>
					
					          </table>
					        </div>
					        <div class="modal-footer">
					          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					          <button type="button" class="btn btn-primary" onclick="rateChg()">저장</button>
					        </div>
					      </div>
					    </div>
					  </div>

                 
                </div><!--모달 버튼 감싸는 div-->
                <!--모달 끝-->

                <div style="margin-top:30px;margin-bottom:10px; float:left;">
                	<c:if test="${categoryNo eq null }">
                	 <select id="categoryNo" name="CategoryNo" style="width:150px">
		                    <option value="" selected>전체</option>
		                    <option value="memberNo">회원번호</option>
		                    <option value="memberId">아이디</option>
		                    <option value="memberName">이름</option>
	                 </select>
	                </c:if> 
	                <c:if test="${categoryNo eq 'memberNo' }">
                	 <select id="categoryNo" name="CategoryNo" style="width:150px">
		                    <option value="">전체</option>
		                    <option value="memberNo" selected>회원번호</option>
		                    <option value="memberId">아이디</option>
		                    <option value="memberName">이름</option>
	                 </select>
	                </c:if> 
	                <c:if test="${categoryNo eq 'memberId' }">
                	 <select id="categoryNo" name="CategoryNo" style="width:150px">
		                    <option value="">전체</option>
		                    <option value="memberNo">회원번호</option>
		                    <option value="memberId" selected>아이디</option>
		                    <option value="memberName">이름</option>
	                 </select>
	                </c:if> 
	                <c:if test="${categoryNo eq 'memberName' }">
                	 <select id="categoryNo" name="CategoryNo" style="width:150px">
		                    <option value="">전체</option>
		                    <option value="memberNo">회원번호</option>
		                    <option value="memberId">아이디</option>
		                    <option value="memberName"  selected>이름</option>
	                 </select>
	                </c:if> 
	                 
	                 
                    <input type="text" id="word" name="word" style="width:200px;"value="${word }">
                    <input type="button" class="btn" value="검색" onclick="search()">
                </div>
	              
                    <table class="table">
                        <thead>
                            <tr>
                                <th onclick="event.cancelBubble=true">회원번호</th>
                                <th onclick="event.cancelBubble=true">아이디 (이름)</th>
                                <th onclick="event.cancelBubble=true">총 구매금액</th>
                                <th onclick="event.cancelBubble=true">등급</th>
                                <th onclick="event.cancelBubble=true">가입일자</th>
                             </tr>   
                         </thead>
                         <tbody id="tbody2">
                         	<c:if test="${!empty mList }">
                         	<c:forEach var="i" items="${mList }" varStatus="cnt">
	                             <tr>
	                                <td onclick="event.cancelBubble=true">${i.memberNo }</td>
	                                <td id="cursor">${i.memberId } (${i.memberName })</td>
	                              	<td onclick="event.cancelBubble=true">${i.totalPay }원</td>
		                               <c:choose>
			                            	<c:when test="${i.gradeNo eq '4'}"><td onclick="event.cancelBubble=true">1등급</td></c:when>
			                            	<c:when test="${i.gradeNo eq '3'}"><td onclick="event.cancelBubble=true">2등급</td></c:when>
			                            	<c:when test="${i.gradeNo eq '2'}"><td onclick="event.cancelBubble=true">3등급</td></c:when>
			                            	<c:when test="${i.gradeNo eq '1'}"><td onclick="event.cancelBubble=true">4등급</td></c:when>
				                        </c:choose>
	                                <td onclick="event.cancelBubble=true">${i.enrollDate }</td>
	                            </tr>
                            </c:forEach>
                            </c:if>
                            <c:if test="${empty mList}">
                            	<tr>
                            	<td  onclick="event.cancelBubble=true" colspan="5">해당 회원이 없습니다.</td>
                            	</tr>
                            </c:if>
                         </tbody>
                    </table>
                    
                    
            <script>
            
            //검색
            function search(){
            	var categoryNo=$("#categoryNo").val();
            	var word=$("#word").val();
            
            	
            	 if(categoryNo=="memberNo"){
            		 if(word.replace(/[0-9]/g, "").length > 0) {
            		        alert("숫자만 입력해 주십시오.");
            		     $("#word").val("");
            		     $("#word").focus();
            		     return;
            	 	}
            	 }
            	
            	alert(categoryNo)
            	alert(word)
            	location.href="gradeList.do?categoryNo="+categoryNo+"&word="+word;
            	
            }
            
            
            
            //회원 상세 정보보기
          	$(function(){
   	       		
   	       		$("tr").on("click",function(){
   	       		
   	       			var type='user';
   	       			var memberNo=$(this).children().eq(0).text();
   	        		 var page=${pi.currentPage };   
   	        		 alert(memberNo);
   	        		 alert(page);
   	        		 alert(type);
   	        		 
   	           		location.href="mDetail.do?memberNo="+memberNo+"&page="+page+"&type="+type;
   	       		})
   	       	})
                    
                    
            </script>
                    
                    

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
							<c:url var="blistBack" value="gradeList.do">
								<c:param name="page" value="${pi.currentPage-1 }"/>
								<c:param name="categoryNo" value="${categoryNo }"/>
								<c:param name="word" value="${word }"/>
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
	                        	<c:url var="blistCheck" value="gradeList.do">
	                        		<c:param name="page" value="${p }"/>
	                        		<c:param name="categoryNo" value="${categoryNo }"/>
									<c:param name="word" value="${word }"/>
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
							<c:url var="blistAfter" value="gradeList.do">
								<c:param name="page" value="${pi.currentPage+1 }"/>
								<c:param name="categoryNo" value="${categoryNo }"/>
								<c:param name="word" value="${word }"/>
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
        
        
        
        
        
        
         <script>
         
                      $('#myModal').on('shown.bs.modal', function () {
                        $('#myInput').focus()
                        });
                      
                      
                      function gradeMinChg(){
                    	  
                    		if($("#gradeMin1").val().trim()==0){
                    			alert('최소 구매금액을 입력해주세요.');
                    		}else if($("#gradeMin2").val().trim()==0){
                    			alert('최소 구매금액을 입력해주세요.');
                    		}else if($("#gradeMin3").val().trim()==0){
                    			alert('최소 구매금액을 입력해주세요.');
                    		}else if($("#gradeMin4").val().trim()==0){
                    			alert('최소 구매금액을 입력해주세요.');
                    		
                    		}else{
                    			
                    			var grade=$(".gradeM");
                    			var gradeMin=$(".gradeMin");
                    			var sendCnt=0;
                    			var sendGradeMinArr=Array();
                    			var sendGradeArr=Array();
                    			
               
                    			
                    			for(i=0; i<grade.length;i++){
                        			if(gradeMin[i].value!=null){
                        				sendGradeMinArr[sendCnt]=gradeMin[i].value;
                        				sendGradeArr[sendCnt]=grade[i].value;
                        				
                        				sendCnt++;
                        			}
                        		}
                    			
                 
                    		 		$.ajax({
                        				url:"gradeMinInfoChang.do",
                        				type:"post",
                        				traditional:true,
                        				data:{"sendGradeMinArr":sendGradeMinArr,"sendGradeArr":sendGradeArr},
                        				success:function(data){
                        					
                        			
                        					getGradeList();
                        					alert('정보가 변경되었습니다.');
                        					$("[data-dismiss=modal]").trigger({ type: "click" });
                        					
                        					        					
                        				},
                        				error:function(request, status, errorData){
                		                    alert("error code: " + request.status + "\n"
                			                           +"message: " + request.responseText
                			                           +"error: " + errorData);
                			                  }   
                        			});
                    		 		
                    		}
                    			
                      }
                    	  
                    	  
                    	  
                      
                        
                      function rateChg(){
                    	  
                    		if($("#rate1").val().trim()==0){
                    			alert('적립율을 입력해주세요.');
                    		}else if($("#rate2").val().trim()==0){
                    			alert('적립율을 입력해주세요.');
                    		}else if($("#rate3").val().trim()==0){
                    			alert('적립율을 입력해주세요.');
                    		}else if($("#rate4").val().trim()==0){
                    			alert('적립율을 입력해주세요.');
                    		
                    		}else{
                    			
                    			var grade=$(".grade");
                    			var gradeRate=$(".gradeRate");
                    			var sendCnt=0;
                    			var sendGradeArr=Array();
                    			var sendRateArr=Array();
                    			
               
                    			
                    			for(i=0; i<grade.length;i++){
                        			if(gradeRate[i].value!=null){
                        				sendRateArr[sendCnt]=gradeRate[i].value;
                        				sendGradeArr[sendCnt]=grade[i].value;
                        				
                        				sendCnt++;
                        			}
                        		}
                    			
                    		
                    		 		$.ajax({
                        				url:"gradeRateInfoChang.do",
                        				type:"post",
                        				traditional:true,
                        				data:{"sendGradeArr":sendGradeArr,"sendRateArr":sendRateArr},
                        				success:function(data){
                        					
                        				
                        					getGradeList();
                        					alert('정보가 변경되었습니다.');
                        					//모달창 닫기
                        					$("[data-dismiss=modal]").trigger({ type: "click" });
                        					        					
                        				},
                        				error:function(request, status, errorData){
                		                    alert("error code: " + request.status + "\n"
                			                           +"message: " + request.responseText
                			                           +"error: " + errorData);
                			                  }   
                        			});
                    		 		
                    		}
                    			
                      }
                      
                      
                      
                    //등급 정보변경 후 리스트 가져오기
                      function getGradeList(){
                    	
                    	var page=${pi.currentPage};
                     	
                     	 $.ajax({
                     		 
                     	 	url:"gListChange.do", 
                     	 	dataType:"json",
                     	 	data:{"page":page},
                     	 	success:function(data){
                     	 		
                        	       	
                     	 		$tableBody=$("#tbody1");
                     	 		$tableBody.html("");
                     	 		
                     	 		var $tr;
                     	 		var $gradeNo;
                     	 		var $gradeName;
                     	 		var $total;
                     	 		var $gradeMin;
                     	 		var $gradeRate;
                     	 		
                     	 				for(var i in data.list){
                     	 					
                     	 				$tr=$("<tr id='cursor'>");
                     	 				
                     	 				if(data.list[i].gradeNo==1){
                     	 					$gradeNo=$("<td>").text('4등급');     	 			
                     	 				}else if(data.list[i].gradeNo==2){
                     	 					$gradeNo=$("<td>").text('3등급');    
                     	 				}else if(data.list[i].gradeNo==3){
                     	 					$gradeNo=$("<td>").text('2등급');    
                     	 				}else{
                     	 					$gradeNo=$("<td>").text('1등급');  
                     	 				}
                     	 					
                     	 				$gradeName=$("<td>").text(data.list[i].gradeName);     	 	
                     	 				$total=$("<td>").text(data.list[i].total+'명');     	 	
                     	 				$gradeMin=$("<td>").text(data.list[i].gradeMin+'원');     	 	
                     	 				$gradeRate=$("<td>").text(data.list[i].gradeRate+'%');     	 	
                     	 				
                     	 			
                     	 				$tr.append($gradeNo);
                     	 				$tr.append($gradeName);
                     	 				$tr.append($total);
                     	 				$tr.append($gradeMin);
                     	 				$tr.append($gradeRate);
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
        
        
        <script  type="text/javascript">

        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

   
      function drawChart() {
    	  
    	var one=${gList[0].total};
    	var two=${gList[1].total};
    	var three=${gList[2].total};
    	var four=${gList[3].total};
    	
    	  var data = google.visualization.arrayToDataTable([
    		  
    
              ['Task', 'Percentage'],
              ['1등급', one],
              ['2등급', two],
              ['3등급', three],
              ['4등급', four]
            ]);
        
       
        // 그래프 옵션 설정
       
        var options = {
          title: '등급별 회원 현황',
          pieHole: 0.4,
          chartArea:{left:30,top:50,width:'100%',height:'100%'},
       	  colors:['#4DB6AC','#9CCC65','#CDDC39','#FFEB3B'],
       	  fontSize:14
        };

        // 입력값을 화면에 뿌려줌
        var chart = new google.visualization.PieChart(document.getElementById('userChart'));

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
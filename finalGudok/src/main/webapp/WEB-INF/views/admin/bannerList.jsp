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
  
    <script src="https://code.jquery.com/jquery-3.4.1.js" type="text/javascript"></script>
   
    <title>이벤트 배너 리스트</title>    
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

td a{

 text-decoration:none; 
 color:black;
}

td a:hover{


 color:black;
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
        <div class="content" id="content">
            <div class="container box">
                <h3>배너 리스트</h3>
                <br>
            
               
                <br>
                <br>
                <form>
                <div style="width:100%">
                <div style="float:right;">
                	
          			
                    <input type="button" class="btn" value="게시" onclick="eventStatusY()">
                    <input type="button" class="btn" value="중지" onclick="eventStatusN()">
                    <input type="button" class="btn" value="삭제" onclick="eventDelete()">
                </div>
                <div style="float:left;">
                	<input type="text" id="word" name="word" value="">
                	<input type="button" class="btn" value="검색" onclick="eventSearch()">
                </div>
                </div>
        <br><br>
        			<input type="hidden" name="array" value="">
                    <table id="bannerTable">
                        <thead>
                            <tr>
                                <th><input type="checkbox" id="checkAll"></th>
                                <th id="td1">배너번호</th>
                                <th>이벤트 명</th>
                                <th>상품 수</th>
                                <th>상태</th>
                             </tr>   
                         </thead>
                         
                         
                         
                         <tbody>
                    <c:if test="${!empty list }">
                         	<c:forEach var="e" items="${list }" varStatus="cnt">
                         		<tr>
	                                <td><input type="checkbox" class="common" id="eventNo${cnt.index}" name="eventNo" value="${e.eventNo }"></td>
	                                <td>${e.eventNo }</td>
	                                <td id="cursor" onclick="bDetail(${e.eventNo })" id="event" style="pointer:cursor;">${e.eventName }</td>
	                                <td>${eCountList[cnt.index] }</td>
	                                <td id="eventStatus">${e.eventStatus }</td>
	                            </tr>
                            </c:forEach>
                     </c:if>
                     <c:if test="${empty list }">
                     		<tr>
                     			<td colspan="5">등록된 이벤트가 없습니다.</td>
                     		</tr>
                     </c:if>       
                         </tbody>
                    </table>
                    <div style="float:right">
						<input type="button" class="btn" value="글 등록" onclick="location.href='eRegisterView.do'">
					</div>

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
							<c:url var="blistBack" value="eList.do">
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
	                        	<c:url var="blistCheck" value="eList.do">
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
							<c:url var="blistAfter" value="eList.do">
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

				</form>	
            </div><!--내용담은 컨테이너-->
        </div><!--250px띄운 div-->
        
        
        
        <script>
        
       //게시물 상세보기(ajax적용전)
        
        function bDetail(eventNo){
        	
        		 var eventNo=eventNo;
        		/*  var page=${pi.currentPage }; */
        		   
           		location.href="bannerDetail.do?eventNo="+eventNo;
           				/* "&page="+page; */
       
        }
        
       
        
        //검색 
        
        function eventSearch(){
        	var word=$("#word").val();
        	alert(word);
        	
        	location.href="searchEventA.do?keyword="+keyword;
        	
        }
        
        
        //이벤트 게시
        	function eventStatusY(){
        		
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
        				url:"eChangeY.do",
        				type:"post",
        				traditional:true,
        				data:{"sendArr":sendArr},
        				success:function(data){
        					
        					getBannerList();
        					        					
        				},
        				error:function(request, status, errorData){
		                    alert("error code: " + request.status + "\n"
			                           +"message: " + request.responseText
			                           +"error: " + errorData);
			                  }   
        			});
        				
        }
        
        
     	//이벤트 상태 변경 후 리스트 가져오기
         function getBannerList(){
        	 var page=${pi.currentPage};
        	 
        	 $.ajax({
        		 
        	 	url:"eListChange.do", 
        	 	data:{"page":page},
        	 	dataType:"json",
        	 	success:function(data){
        	 		
        	 		//게시물 상세보기(ajax후)
           	        
           	       	$(function(){
           	       		
           	       		$("tr").on("click",function(){
           	       			var eventNo=$(this).children().eq(1).text();
           	        		 var page=${pi.currentPage };   
           	        		 alert(eventNo);
           	           		location.href="bannerDetail.do?eventNo="+eventNo+"&page="+page;
           	       		})
           	       	})
           	       	
        	 		$tableBody=$("tbody");
        	 		$tableBody.html("");
        	 		
        	 		var $tr;
        	 		var $eventNo;
        	 		var $eventName;
        	 		var $eventCnt;
        	 		var $eventStatus;
        	 		var $checkBox;
        	 		var $th;
        	 		
        	 				
        	 				for(var i in data.bannerList){
        	 					
        	 				
        	 				$tr=$("<tr>");
        	 				$td=$("<td onclick='event.cancelBubble=true'>");
        	 				$checkBox=$("<input type='checkbox' class='common' name='eventNo'>").val(data.bannerList[i].eventNo);     	 			
        	 				$eventNo=$("<td onclick='event.cancelBubble=true'>").text(data.bannerList[i].eventNo);
        	 				$eventName=$("<td id='cursor'>").text(data.bannerList[i].eventName);
        	 				$eventCnt=$("<td onclick='event.cancelBubble=true'>").text(data.bannerList[i].eventCnt);
        	 				$eventStatus=$("<td onclick='event.cancelBubble=true'>").text(data.bannerList[i].eventStatus);
        	 				
        	 				
        	 				$td.append($checkBox);
        	 				$tr.append($td);
        	 				$tr.append($eventNo);
        	 				$tr.append($eventName);
        	 				$tr.append($eventCnt);
        	 				$tr.append($eventStatus);
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
        			
        			
        	  //이벤트 중지
        	function eventStatusN(){
       	 
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
            				url:"eChangeN.do",
            				type:"post",
            				traditional:true,
            				data:{"sendArr":sendArr},
            				success:function(data){
            					
            					getBannerList();
            					        					
            				},
            				error:function(request, status, errorData){
    		                    alert("error code: " + request.status + "\n"
    			                           +"message: " + request.responseText
    			                           +"error: " + errorData);
    			                  }   
            			});
            }
            
        
        
         //선택 삭제
        	function eventDelete(){
        
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
    				url:"eDelete.do",
    				type:"post",
    				traditional:true,
    				data:{"sendArr":sendArr},
    				success:function(data){
    					
    					getBannerList();
    					        					
    				},
    				error:function(request, status, errorData){
	                    alert("error code: " + request.status + "\n"
		                           +"message: " + request.responseText
		                           +"error: " + errorData);
		                  }   
    			});
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
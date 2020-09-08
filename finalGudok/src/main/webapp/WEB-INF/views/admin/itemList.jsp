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
    <title>판매 상품 리스트</title>    
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

#recommendItem{

width:23%; 
height:200px; 
float:left;
margin-left:1.5%;
margin-top:10px;

}

.btn2{

	background:#90A4AE;
	color:white;
	border-radius:5px;
	padding-left:8px;
	padding-right:8px;
	padding-top:2px;
	padding-bottom:2px;
  	border:1px solid #B0BEC5;
	font-size:14px;
}



</style>

</head>

    <body>
    <jsp:include page="../common/adminMenubar.jsp"/>
        <div class="content">
            <div class="container box">
                <h3>판매 상품 리스트</h3>
                <br>
            	<h4>추천상품</h4>
            		<div id="recommendArea" style="text-align:center;">
            			
            			 <c:if test="${!empty rList }">
            				 <c:forEach var="i" items="${rList }">
	            			 <div id="recommendItem">
		            			<img src="${contextPath }/resources/uploadFiles/${i.imageRename}">
		            			<br>
		            			<div style="width:80%; float:left;text-align:left; padding-left:15px;">
		            			<p style="margin-top:13px;">${i.itemNo }번  ${i.itemName }</p></div>
		            			<input type="hidden" id="itemNo" name="itemNo" value="${i.itemNo }">
		            			<div style="width:20%; float:right;">
		            			<button class="btn2" id="rDelete" value="x" style="margin-top:13px;">x</button>
		            			</div>
	            			</div> 
	            			</c:forEach>
            			</c:if> 
            			<c:if test="${empty rList }">
	            			 <div id="recommendItem">
		            			<p style="padding:50px;">추천상품이 없습니다.
	            			</div> 
            			</c:if>
            			
            		
            			
            			
            		
            		
            		
            		
            		
            		
            		
            		
            		</div>
            		
            	 
                <br><br>
                <div style="width:100%; margin-top:190px;">
                <div style="float:left;">
               <input type="hidden" name="categoryNo" value="${categoryNo }">
               <input type="hidden" name="type" value="${type }">
               <input type="hidden" name="word" value="${word }">
               
       			<c:choose>
       				<c:when test="${categoryNo eq 'F1' }">
		                <select id="categoryNo" name="CategoryNo" style="width:105px">
		                    <option value="">전체</option>
		                    <option value="F1" selected>음료</option>
		                    <option value="F2">유제품</option>
		                    <option value="F3">베이커리</option>
		                    <option value="F4">간편식</option>
		                    <option value="F5">건강식품</option>
		                    <option value="F6">다이어트 식단</option>
		                    <option value="L1">생활용품</option>
		                    <option value="L2">바디케어</option>
		                    <option value="L3">홈데코</option>
		                </select>
	             	</c:when>
	             	<c:when test="${categoryNo eq 'F2' }">
		                <select id="categoryNo" name="CategoryNo" style="width:105px">
		                    <option value="">전체</option>
		                    <option value="F1">음료</option>
		                    <option value="F2" selected>유제품</option>
		                    <option value="F3">베이커리</option>
		                    <option value="F4">간편식</option>
		                    <option value="F5">건강식품</option>
		                    <option value="F6">다이어트 식단</option>
		                    <option value="L1">생활용품</option>
		                    <option value="L2">바디케어</option>
		                    <option value="L3">홈데코</option>
		                </select>
	             	</c:when>
	             	<c:when test="${categoryNo eq 'F3' }">
		                <select id="categoryNo" name="CategoryNo" style="width:105px">
		                    <option value="">전체</option>
		                    <option value="F1">음료</option>
		                    <option value="F2">유제품</option>
		                    <option value="F3" selected>베이커리</option>
		                    <option value="F4">간편식</option>
		                    <option value="F5">건강식품</option>
		                    <option value="F6">다이어트 식단</option>
		                    <option value="L1">생활용품</option>
		                    <option value="L2">바디케어</option>
		                    <option value="L3">홈데코</option>
		                </select>
	             	</c:when>
	             	<c:when test="${categoryNo eq 'F4' }">
		                <select id="categoryNo" name="CategoryNo" style="width:105px">
		                    <option value="">전체</option>
		                    <option value="F1">음료</option>
		                    <option value="F2">유제품</option>
		                    <option value="F3">베이커리</option>
		                    <option value="F4" selected>간편식</option>
		                    <option value="F5">건강식품</option>
		                    <option value="F6">다이어트 식단</option>
		                    <option value="L1">생활용품</option>
		                    <option value="L2">바디케어</option>
		                    <option value="L3">홈데코</option>
		                </select>
	             	</c:when>
	             	<c:when test="${categoryNo eq 'F5' }">
		                <select id="categoryNo" name="CategoryNo" style="width:105px">
		                    <option value="">전체</option>
		                    <option value="F1">음료</option>
		                    <option value="F2">유제품</option>
		                    <option value="F3">베이커리</option>
		                    <option value="F4">간편식</option>
		                    <option value="F5" selected>건강식품</option>
		                    <option value="F6">다이어트 식단</option>
		                    <option value="L1">생활용품</option>
		                    <option value="L2">바디케어</option>
		                    <option value="L3">홈데코</option>
		                </select>
	             	</c:when>
	             	<c:when test="${categoryNo eq 'F6' }">
		                <select id="categoryNo" name="CategoryNo" style="width:105px">
		                    <option value="">전체</option>
		                    <option value="F1">음료</option>
		                    <option value="F2">유제품</option>
		                    <option value="F3">베이커리</option>
		                    <option value="F4">간편식</option>
		                    <option value="F5">건강식품</option>
		                    <option value="F6" selected>다이어트 식단</option>
		                    <option value="L1">생활용품</option>
		                    <option value="L2">바디케어</option>
		                    <option value="L3">홈데코</option>
		                </select>
	             	</c:when>
	             	<c:when test="${categoryNo eq 'L1' }">
		                <select id="categoryNo" name="CategoryNo" style="width:105px">
		                    <option value="">전체</option>
		                    <option value="F1">음료</option>
		                    <option value="F2">유제품</option>
		                    <option value="F3">베이커리</option>
		                    <option value="F4">간편식</option>
		                    <option value="F5">건강식품</option>
		                    <option value="F6">다이어트 식단</option>
		                    <option value="L1" selected>생활용품</option>
		                    <option value="L2">바디케어</option>
		                    <option value="L3">홈데코</option>
		                </select>
	             	</c:when>
	             	<c:when test="${categoryNo eq 'L2' }">
		                <select id="categoryNo" name="CategoryNo" style="width:105px">
		                    <option value="">전체</option>
		                    <option value="F1">음료</option>
		                    <option value="F2">유제품</option>
		                    <option value="F3">베이커리</option>
		                    <option value="F4">간편식</option>
		                    <option value="F5">건강식품</option>
		                    <option value="F6">다이어트 식단</option>
		                    <option value="L1">생활용품</option>
		                    <option value="L2" selected>바디케어</option>
		                    <option value="L3">홈데코</option>
		                </select>
	             	</c:when>
	             	<c:when test="${categoryNo eq 'L3' }">
		                <select id="categoryNo" name="CategoryNo" style="width:105px">
		                    <option value="">전체</option>
		                    <option value="F1">음료</option>
		                    <option value="F2">유제품</option>
		                    <option value="F3">베이커리</option>
		                    <option value="F4">간편식</option>
		                    <option value="F5">건강식품</option>
		                    <option value="F6">다이어트 식단</option>
		                    <option value="L1">생활용품</option>
		                    <option value="L2">바디케어</option>
		                    <option value="L3" selected>홈데코</option>
		                </select>
	             	</c:when>
	             	<c:otherwise>
	             		<select id="categoryNo" name="CategoryNo" style="width:105px">
		                    <option value="">전체</option>
		                    <option value="F1">음료</option>
		                    <option value="F2">유제품</option>
		                    <option value="F3">베이커리</option>
		                    <option value="F4">간편식</option>
		                    <option value="F5">건강식품</option>
		                    <option value="F6">다이어트 식단</option>
		                    <option value="L1">생활용품</option>
		                    <option value="L2">바디케어</option>
		                    <option value="L3">홈데코</option>
		                </select>
	             	</c:otherwise>
             	</c:choose>
              
               
               	<c:choose>
               		<c:when test="${type eq 'itemNo' }">
		                 <select id="type" name="type" style="width:100px">
		                    <option value="">전체</option>
		                    <option value="itemNo" selected>상품번호</option>
		                    <option value="itemName">상품명</option>
		                </select>
		            </c:when>
		            <c:when test="${type eq 'itemName' }">
		                 <select id="type" name="type" style="width:100px">
		                    <option value="">전체</option>
		                    <option value="itemNo">상품번호</option>
		                    <option value="itemName" selected>상품명</option>
		                </select>
		            </c:when>
		             <c:otherwise>
		                 <select id="type" name="type" style="width:100px">
		                    <option value="">전체</option>
		                    <option value="itemNo">상품번호</option>
		                    <option value="itemName">상품명</option>
		                </select>
		            </c:otherwise>
                </c:choose>
                
                <c:if test="${word eq null }">
              	  <input type="text" id="word" name="word" value="" style="width:150px;">
           	  </c:if>
           	  <c:if test="${word ne null }">
              	  <input type="text" id="word" name="word" value="${word }" style="width:150px;">
           	  </c:if>
                <input type="button" class="btn" value="검색" onclick="searchItem()">
                </div>
               <div style="float:right">
                 <input type="button" class="btn" value="추천" onclick="recommend()">
                 <input type="button" class="btn" value="게시" onclick="itemStatusY()">
                 <input type="button" class="btn" value="중지" onclick="itemStatusN()">
                  <input type="button" class="btn" value="삭제" onclick="itemDelete()">
               </div>


            </div>
                <br>
                <br>
            
        
                    <table>
                        <thead>
                            <tr>
                                <th><input type="checkbox" id="checkAll"></th>
                                <th>상품번호</th>
                                <th>상품명</th>
                                <th>가격</th>
                                <th>할인율</th>
                                <th>상태</th>
                             </tr>   
                         </thead>
                         
                         <tbody>
                         <c:if test="${!empty list}">
                         	<c:forEach var="i" items="${list }" varStatus="cnt">
	                             <tr>
	                                <td><input type="checkbox" class="common" name="itemNo" value="${i.itemNo }"></td>
	                                <td>${i.itemNo }</td>
	                                <td  id="cursor" onclick="iDetail(${i.itemNo })">${i.itemName }</td>
	                                <td>${i.itemPrice }원</td>
	                                <c:choose>
		                                <c:when test="${empty i.itemDiscount }">
		                                <td>0%</td>
		                                </c:when>
		                                 <c:otherwise>
		                                <td>${i.itemDiscount }%</td>
		                                </c:otherwise>
	                                </c:choose>
	                                <td><a id="itemStatus">${i.itemDpStatus }</a></td>
	                            </tr>
                            </c:forEach>
                          </c:if>
                          <c:if test="${empty list}">
                           	<tr>
                           		<td colspan="5">등록된 상품이 없습니다.</td>
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
							<c:url var="blistBack" value="itemListA.do">
								<c:param name="page" value="${pi.currentPage-1 }"/>
								<c:param name="categoryNo" value="${categoryNo }"/>
								<c:param name="type" value="${type }"/>
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
	                        	<c:url var="blistCheck" value="itemListA.do">
	                        		<c:param name="page" value="${p }"/>
	                        		<c:param name="categoryNo" value="${categoryNo }"/>
									<c:param name="type" value="${type }"/>
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
							<c:url var="blistAfter" value="itemListA.do">
								<c:param name="page" value="${pi.currentPage+1 }"/>
								<c:param name="categoryNo" value="${categoryNo }"/>
								<c:param name="type" value="${type }"/>
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




            </div><!--내용담은 컨테이너-->
        </div><!--250px띄운 div-->
        
        
        <script>
        
        //추천상품 취소하기
        
          	$(function(){

       	       		$("button").on("click",function(){
       	       			var itemNo=$(this).parent().parent().find("#itemNo").val();
       	       	
       	        
       	        		$.ajax({
       						url:"cancelRecommend.do",
       						type:"post",
       						traditional:true,
       						data:{"itemNo":itemNo},
       						dataType:"json",
       						success:function(data){
       							
       					
       					
       							var html=$("#recommendArea");
       							html.html("");
       							
       							
       							for(var i in data.list){
       							
       							
       							var div="";
       						
       								
       						
       							div+= '<div id="recommendItem">';
       		            	  	div+='<img src="/finalGudok/resources/uploadFiles/'+data.list[i].imageRename+'"><br>';
       		            		div+='<div style="width:80%; float:left;text-align:left; padding-left:15px;">';
       		            		div+='<p  style="margin-top:13px;">'+data.list[i].itemNo+'번  '+data.list[i].itemName+'</p></div>';
       		            		div+='<input type="hidden" id="itemNo" name="itemNo" value="'+data.list[i].itemNo+'">';
       		            		div+='<div style="width:20%; float:right;">';
       		            		div+='<button class="btn2" value="x"  style="margin-top:13px;">x</button></div></div>'; 
       	        			 
       						
       	        				html.append(div);
       							}
       							
       						},
       						error:function(request, status, errorData){
       		                    alert("error code: " + request.status + "\n"
       			                           +"message: " + request.responseText
       			                           +"error: " + errorData);
       			                  }   
       						
       					});
       		        	
       	       		
       	       		
       	       		
       	       		
       	       		
       	       		
       	       		
       	       		
       	       		
       	       		
       	       		
       	       		})
       	        	
       	       	})
        
        
        
        
        
        
        
        
        
        //추천 상품 전 수량 확인
        
        function recommend(){
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
    				url:"recommendChk.do",
    				type:"post",
    				traditional:true,
    				data:{"sendCnt":sendCnt},
    				success:function(data){
    					
    					
    			
    					if(data.iNum==3){
    						alert("추천 상품은 3개까지만 등록 가능합니다.")
    					}else{
    						recommendList();
    						
    					}
    					
    					
    					
    					
    				},
    				error:function(request, status, errorData){
	                    alert("error code: " + request.status + "\n"
		                           +"message: " + request.responseText
		                           +"error: " + errorData);
		                  }   
    				
    			});
    				
    }
    
        
        //추천상품 등록
        function recommendList(){
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
					url:"recommend.do",
					type:"post",
					traditional:true,
					data:{"sendArr":sendArr},
					dataType:"json",
					success:function(data){
						
				
				
						var html=$("#recommendArea");
						html.html("");
						
						
						for(var i in data.list){
						
						
						var div="";
					
							
					
						div+= '<div id="recommendItem">';
	            	  	div+=	'<img src="/finalGudok/resources/uploadFiles/'+data.list[i].imageRename+'"><br>';
	            		div+='<div style="width:80%; float:left;text-align:left; padding-left:15px;">';
	            		div+='<p  style="margin-top:13px;">'+data.list[i].itemNo+'번  '+data.list[i].itemName+'</p></div>';
	            		div+='<input type="hidden" id="itemNo" name="itemNo" value="'+data.list[i].itemNo+'">';
	            		div+='<div style="width:20%; float:right;">';
	            		div+='<button class="btn2" value="x"  style="margin-top:13px;">x</button></div></div>'; 
        			 
					
        				html.append(div);
						}
						
					},
					error:function(request, status, errorData){
	                    alert("error code: " + request.status + "\n"
		                           +"message: " + request.responseText
		                           +"error: " + errorData);
		                  }   
					
				});
	        	
        	
        	
        	
        	
        	
        }
        
        
        
        
        //검색하기
        function searchItem(){
        	
        	 var categoryNo=$("#categoryNo").val();
        	 var type=$("#type").val();
        	 var word=$("#word").val();
        	 alert(categoryNo)
        	 alert(type)
        	 alert(word)
        	 
        	 if(type=="itemNo"){
        		 if(word.replace(/[0-9]/g, "").length > 0) {
        		        alert("숫자만 입력해 주십시오.");
        		      $("#word").val("");
        		     $("#word").focus();
        		     return;
        	 	}
        	 }
        	 
   			
  			 location.href="itemListA.do?categoryNo="+categoryNo+"&type="+type+"&word="+word;
        	
        	
        }
        
        
        //게시물 상세보기(ajax적용전)
        
        function iDetail(iNum){
 	
       		 var itemNo=iNum;
       		 var page=${pi.currentPage };
       		 var type="itemList"
       		   
        	location.href="itemDetail.do?itemNo="+itemNo+"&page="+page+"&type="+type;
 		}
        
        //상품 게시
    	function itemStatusY(){
    		
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
    				url:"iChangeY.do",
    				type:"post",
    				traditional:true,
    				data:{"sendArr":sendArr},
    				success:function(data){
    					 getList();			
    				},
    				error:function(request, status, errorData){
	                    alert("error code: " + request.status + "\n"
		                           +"message: " + request.responseText
		                           +"error: " + errorData);
		                  }   
    				
    			});
    				
    }
    
    
    	// 상태 변경 후 리스트 가져오기
        function getList(){
       	 var page=${pi.currentPage};
       	 var categoryNo=$("#categoryNo").val();
    	 var type=$("#type").val();
    	 var word=$("#word").val();
    	 
    	 alert(categoryNo);
    	 alert(type);
    	 alert(word);
       	 
       	
       	
       	 
       	 $.ajax({
       		 
       	 	url:"iListChange.do", 
       	 	type:"POST",
       	 	data:{"page":page,"categoryNo":categoryNo,"type":type,"word":word},
       	 	dataType:"json",
       	 	success:function(data){
       	 		
       	 	  
       	 		
       	 		//게시물 상세보기(ajax후)
       	        
       	       	$(function(){

       	       		$("tr").on("click",function(){
       	       			var itemNo=$(this).children().eq(1).text();
       	        		 var page=${pi.currentPage };   
       	        		 var type="itemList"
       	        		 alert(itemNo);
       	           		location.href="itemDetail.do?itemNo="+itemNo+"&page="+page+"&type="+type;
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
       	 		var $itemDiscount;
       	 	
       	 				for(var i in data.list){
       	 					
       	 				$tr=$("<tr>");
       	 				$td=$("<td onclick='event.cancelBubble=true'>");
       	 				$checkBox=$("<input type='checkbox' class='common' name='itemNo'>").val(data.list[i].itemNo);     	 			
       	 				$eventNo=$("<td onclick='event.cancelBubble=true'>").text(data.list[i].itemNo);
       	 				$eventName=$("<td id='cursor'>").text(data.list[i].itemName);
       	 				$eventName.attr('id','test');
       	 				$eventCnt=$("<td onclick='event.cancelBubble=true'>").text(data.list[i].itemPrice+'원');
       	 				$itemDiscount=$("<td onclick='event.cancelBubble=true'>").text(data.list[i].itemDiscount+'%');
       	 				$eventStatus=$("<td onclick='event.cancelBubble=true'>").text(data.list[i].itemDpStatus);
       	 				
       	 				
       	 				$td.append($checkBox);
       	 			
       	 				$tr.append($td);
       	 				$tr.append($eventNo);
       	 				$tr.append($eventName);
       	 				$tr.append($eventCnt);
       	 				$tr.append($itemDiscount);
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
    			
    			
    	  //상품 게시 중지
    	function itemStatusN(){
   	 
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
        				url:"iChangeN.do",
        				type:"post",
        				traditional:true,
        				data:{"sendArr":sendArr},
        				success:function(data){
        					
        					getList();
        					        					
        				},
        				error:function(request, status, errorData){
		                    alert("error code: " + request.status + "\n"
			                           +"message: " + request.responseText
			                           +"error: " + errorData);
			                  }   
        			});
        				
        }
        
    
    
     //선택 삭제
    	function itemDelete(){
    
    		var sendArr=Array();
    		var sendCnt=0;
    		var chkbox=$(".common");
    		var page=${pi.currentPage};
    		
    		for(i=0; i<chkbox.length;i++){
    			if(chkbox[i].checked==true){
    				sendArr[sendCnt]=chkbox[i].value;
    				sendCnt++;
    			}
    		}
    		
    		$.ajax({
				url:"iDelete.do",
				traditional:true,
				data:{"sendArr":sendArr,"page":page},
				success:function(data){
					
					getList();
					        					
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
     <script src="https://code.jquery.com/jquery-3.4.1.js" type="text/javascript"></script>
    <script integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>
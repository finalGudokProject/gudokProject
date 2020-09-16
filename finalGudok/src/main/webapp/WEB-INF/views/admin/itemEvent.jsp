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
    <title>이벤트 상품 등록</title>    
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


</head>
    <body>
    <jsp:include page="../common/adminMenubar.jsp"/>
        <div class="content">
            <div class="container box">
                <h3>이벤트 상품 등록</h3>
                <br>
                <button type="button" class="btn" onclick="location.href='iInsertView.do'">일반 상품</button>&nbsp;
                <button type="button" class="btn" onclick="location.href='iEventInsertView.do'">이벤트 상품</button>
                <br><br>
        
        <script>
        
     
        </script>
                <table>
                	
         
                    <tr>
                        <td style="vertical-align: middle;" onclick='event.cancelBubble=true'>
                           	 이벤트 제목
                        </td>
                        <td colspan="3"  onclick='event.cancelBubble=true'>
                                <select id="eventNo" name="eventNo" style="float:left;">
                                		<option value="">이벤트를 선택하세요.</option>
                                    <c:forEach var="i" items="${eArr }">
	                                    <option value="${i.eventNo }">${i.eventName }</option>
                                    </c:forEach> 
                                </select>
                        </td>     
                    </tr>
                    <tr  onclick='event.cancelBubble=true'>
                        <td id="td1" onclick='event.cancelBubble=true'>
                          	  할인율
                        </td>
                        <td colspan="3"  onclick='event.cancelBubble=true'>
                            <input type="number" min="0" max="100" id="itemDiscount" name="itemDiscount" style="float:left; width:35%" value=""  ondragstart="return false"><label style="float:left"><b>&nbsp;&nbsp;%</b></label>
                        </td>
                    </tr>
                   
                </table>
               
               
                 <label style="margin-left:20px; margin-top:50px;margin-bottom:15px;font-size:20px;"><b>이벤트 미등록 상품</b></label>
                 <form name="select_category">
                 <div style="float:left; margin-left:10px">
                 
                 
                 
                 
            
                    <c:if test="${empty itemCategory }">
	                    <select name="product" id="product" style="width:150px" onchange="itemCategoryList(this.value);">
	                        <option value="">대분류</option>
	                        <option value="F">푸드</option>
	                        <option value="L">리빙</option>
	                    </select>
	                &nbsp; 
	                    <select name="itemCategory" id="itemCategory" style="width:150px">
	                        <option value="">소분류</option>
	                    </select>
                    </c:if>
                    <c:if test="${itemCategory eq 'F1'}">
	                    <select name="product" id="product" style="width:150px" onchange="itemCategoryList(this.value);">
	                        <option value="">대분류</option>
	                        <option value="F" selected>푸드</option>
	                        <option value="L">리빙</option>
	                    </select>
	                &nbsp; 
	                    <select name="itemCategory" id="itemCategory" style="width:150px">
	                        <option value="F1" selected>음료</option>
	                        <option value="F2">유제품</option>
	                        <option value="F3">베이커리</option>
	                        <option value="F4">간편식</option>
	                        <option value="F5">건강식품</option>
	                        <option value="F6">다이어트 식단</option>
	                    </select>
                    </c:if>
                    <c:if test="${itemCategory eq 'F2'}">
	                    <select name="product" id="product" style="width:150px" onchange="itemCategoryList(this.value);">
	                        <option value="">대분류</option>
	                        <option value="F" selected>푸드</option>
	                        <option value="L">리빙</option>
	                    </select>
	                &nbsp; 
	                    <select name="itemCategory" id="itemCategory" style="width:150px">
	                        <option value="F1">음료</option>
	                        <option value="F2" selected>유제품</option>
	                        <option value="F3">베이커리</option>
	                        <option value="F4">간편식</option>
	                        <option value="F5">건강식품</option>
	                        <option value="F6">다이어트 식단</option>
	                    </select>
                    </c:if>
                     <c:if test="${itemCategory eq 'F3'}">
	                    <select name="product" id="product" style="width:150px" onchange="itemCategoryList(this.value);">
	                        <option value="">대분류</option>
	                        <option value="F" selected>푸드</option>
	                        <option value="L">리빙</option>
	                    </select>
	                &nbsp; 
	                    <select name="itemCategory" id="itemCategory" style="width:150px">
	                         <option value="F1">음료</option>
	                        <option value="F2">유제품</option>
	                        <option value="F3" selected>베이커리</option>
	                        <option value="F4">간편식</option>
	                        <option value="F5">건강식품</option>
	                        <option value="F6">다이어트 식단</option>
	                    </select>
                    </c:if>
                     <c:if test="${itemCategory eq 'F4'}">
	                    <select name="product" id="product" style="width:150px" onchange="itemCategoryList(this.value);">
	                        <option value="">대분류</option>
	                        <option value="F" selected>푸드</option>
	                        <option value="L">리빙</option>
	                    </select>
	                &nbsp; 
	                    <select name="itemCategory" id="itemCategory" style="width:150px">
	                         <option value="F1">음료</option>
	                        <option value="F2">유제품</option>
	                        <option value="F3">베이커리</option>
	                        <option value="F4" selected>간편식</option>
	                        <option value="F5">건강식품</option>
	                        <option value="F6">다이어트 식단</option>
	                    </select>
                    </c:if>
                     <c:if test="${itemCategory eq 'F5'}">
	                    <select name="product" id="product" style="width:150px" onchange="itemCategoryList(this.value);">
	                        <option value="">대분류</option>
	                        <option value="F" selected>푸드</option>
	                        <option value="L">리빙</option>
	                    </select>
	                &nbsp; 
	                    <select name="itemCategory" id="itemCategory" style="width:150px">
	                        <option value="F1">음료</option>
	                        <option value="F2">유제품</option>
	                        <option value="F3">베이커리</option>
	                        <option value="F4">간편식</option>
	                        <option value="F5" selected>건강식품</option>
	                        <option value="F6">다이어트 식단</option>
	                    </select>
                    </c:if>
                     <c:if test="${itemCategory eq 'F6'}">
	                    <select name="product" id="product" style="width:150px" onchange="itemCategoryList(this.value);">
	                        <option value="">대분류</option>
	                        <option value="F" selected>푸드</option>
	                        <option value="L">리빙</option>
	                    </select>
	                &nbsp; 
	                    <select name="itemCategory" id="itemCategory" style="width:150px">
	                        <option value="F1">음료</option>
	                        <option value="F2">유제품</option>
	                        <option value="F3">베이커리</option>
	                        <option value="F4">간편식</option>
	                        <option value="F5">건강식품</option>
	                        <option value="F6" selected>다이어트 식단</option>
	                    </select>
                    </c:if>
                    <c:if test="${itemCategory eq 'L1'}">
	                    <select name="product" id="product" style="width:150px" onchange="itemCategoryList(this.value);">
	                        <option value="">대분류</option>
	                        <option value="F">푸드</option>
	                        <option value="L" selected>리빙</option>
	                    </select>
	                &nbsp; 
	                    <select name="itemCategory" id="itemCategory" style="width:150px">
	                        <option value="L1" selected>홈데코</option>
	                        <option value="L2">바디케어</option>
	                        <option value="L3">생활용품</option>
	                    </select>
                    </c:if>
                    <c:if test="${itemCategory eq 'L2'}">
	                    <select name="product" id="product" style="width:150px" onchange="itemCategoryList(this.value);">
	                        <option value="">대분류</option>
	                        <option value="F">푸드</option>
	                        <option value="L" selected>리빙</option>
	                    </select>
	                &nbsp; 
	                    <select name="itemCategory" id="itemCategory" style="width:150px">
	                        <option value="L1">홈데코</option>
	                        <option value="L2" selected>바디케어</option>
	                        <option value="L3">생활용품</option>
	                    </select>
                    </c:if>
                    <c:if test="${itemCategory eq 'L3'}">
	                    <select name="product" id="product" style="width:150px" onchange="itemCategoryList(this.value);">
	                        <option value="">대분류</option>
	                        <option value="F">푸드</option>
	                        <option value="L" selected>리빙</option>
	                    </select>
	                &nbsp; 
	                    <select name="itemCategory" id="itemCategory" style="width:150px">
	                        <option value="L1">홈데코</option>
	                        <option value="L2">바디케어</option>
	                        <option value="L3" selected>생활용품</option>
	                    </select>
                    </c:if>
                    
                    
                    
                    
                    
                    
                    
                    <input type="button" class="btn" value="검색" onclick="search()">
                  </div>
                  <br>
                
                   </form>

                    <table id="table1">
                        <thead >
                            <tr>
                                <th style="width:20%" onclick='event.cancelBubble=true'>상품번호</th>
                                <th style="width:40%" onclick='event.cancelBubble=true'>상품명</th>
                                <th onclick='event.cancelBubble=true'>가격</th>
                                <th onclick='event.cancelBubble=true'>평점</th>
                                <th onclick='event.cancelBubble=true'><input type="checkbox" id="checkAll"  onclick="event.cancelBubble=true"></th>
                             </tr>   
                         </thead>
                         <tbody id="chgTable">
                         
                         <c:if test="${!empty list }">
                         <c:forEach var="i" items="${list }" varStatus="cnt">
                             <tr>
                                <td onclick="event.cancelBubble=true">${i.itemNo }</td>
                                <td id="cursor" onclick="itemDetail()">${i.itemName }</td>
                                <td onclick="event.cancelBubble=true">${i.itemPrice }원</td>
                                <td onclick="event.cancelBubble=true">${i.itemRate }</td>
                                <td onclick="event.cancelBubble=true"><input type="checkbox"  class="common" id="itemNo${cnt.index }" name="itemNo" value="${i.itemNo }"></td>
                            </tr>
                            
                         </c:forEach>  
                         </c:if>
                         <c:if test="${empty list }">
                        
                             <tr>
                                <td colspan="5" onclick='event.cancelBubble=true'>이벤트 미등록 상품이 없습니다.</td>
                        
                            </tr>
                            
                      
                         </c:if>
                         
                          
                            
                            
                            
                            
                         </tbody>
                    </table>
 				<div style="text-align: right;"><input type="button" class="btn" value="등록하기" onclick="save()"></div>
				
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
							<c:url var="blistBack" value="iEventInsertView.do">
								<c:param name="page" value="${pi.currentPage-1 }"/>
								<c:param name="itemCategory" value="${itemCategory }"/>
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
	                        	<c:url var="blistCheck" value="iEventInsertView.do">
	                        		<c:param name="page" value="${p }"/>
	                        		<c:param name="itemCategory" value="${itemCategory }"/>
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
							<c:url var="blistAfter" value="iEventInsertView.do">
								<c:param name="page" value="${pi.currentPage+1 }"/>
								<c:param name="itemCategory" value="${itemCategory }"/>
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
  		 //상품 상세보기
  		 	
       	$(function(){

       		   $("#table1").children().on("click",function(){
       			var itemNo=$(this).children().children().eq(0).text();
        		 var page=${pi.currentPage };   
        		 var type="itemEvent";
        		 
        		
           		location.href="itemDetail.do?itemNo="+itemNo+"&page="+page+"&type="+type;
       		})
        	
       	})
  		 
  		 
  		 
  		 //카테고리별 검색
  		 function search(){
  			 
  			 var itemCategory=$("#itemCategory").val();
  			
  			 location.href="iEventInsertView.do?itemCategory="+itemCategory;
  			 
  			 
  		 }
  		 
  		 //하위 셀렉트박스 리스트 생성
  		 function itemCategoryList(iVal){
  			 
  			 var i=document.forms.select_category;
  			 var opt=$("#itemCategory option").length;
  			 
  			 if(iVal==""){
  				 num=new Array("소분류");
  				 vnum=new Array("");
  				 
  			 }else if(iVal=="F"){
  				 num=new Array("음료","유제품","베이커리","간편식","건강식품","다이어트 식단");
  				 vnum=new Array("F1","F2","F3","F4","F5","F6");
  			 }else if(iVal=="L"){
  				 num=new Array("홈데코","바디케어","생활용품");
  				 vnum=new Array("L1","L2","L3");
  			 }
  			 
  			  for(j=0;j<opt;j++){
  				 i.itemCategory.options[0]=null;
  			
  			 } 
  			 
  			 for(k=0;k<num.length;k++){
  				 i.itemCategory.options[k]=new Option(num[k],vnum[k]);
  			 }
  			 
  			 
  		 }
  		 
  		 //이벤트 선택 시 할인율 정보 있으면 가져오기
  		 $(function(){
  		
  			  $("#eventNo").change(function(){
  				  
  			 var eventNo=$("#eventNo option:checked").val();
  			if(eventNo.length==0){
  				alert('이벤트를 선택해주세요.');
  				return;
  			}else{
  				
  				  
  				$.ajax({
  					url:"selectItemDiscount.do",
  					traditional:true,
  					data:{"eventNo":eventNo},
  					success:function(data){
  						
  						
  					
  					
  					$("#itemDiscount").val("");
  					$("#itemDiscount").val(data.itemDiscount);
  					
  						        					
  					},
  					error:function(request, status, errorData){
  	                    alert("error code: " + request.status + "\n"
  		                           +"message: " + request.responseText
  		                           +"error: " + errorData);
  		                  }   
  				});
  			}
  			 })
  			  
  		 })
  		 
  		 
        //이벤트 상품 등록 시 공백 제한
         function save(){
        	
        var eventName=$("#eventNo option:checked").text();
        confirm("["+eventName+"]의 이벤트 상품으로 등록하시겠습니까?");
        
        if($("#eventNo").val().trim().length==0){
    		alert('이벤트를 선택하세요.');
			$("#eventNo").focus();
  		}else if($("input[name=itemNo]:checked").val()==null){
	    		alert('이벤트 상품을 선택하세요.');
    	}else{
    		
    		var sendArr=Array();
    		var sendCnt=0;
    		var chkbox=$(".common");
    		var page=${pi.currentPage};
    		var eventNo=$("#eventNo").val();
    		var itemDiscount=$("#itemDiscount").val();
    		var itemCategory=$("#itemCategory").val();
    		
    	
    		
    		for(i=0; i<chkbox.length;i++){
    			if(chkbox[i].checked==true){
    				sendArr[sendCnt]=chkbox[i].value;
    				sendCnt++;
    			}
    		}
    		
    	
    		
    		
    		$.ajax({
				url:"eventItemInsert.do",
				traditional:true,
				data:{"sendArr":sendArr,"page":page,"eventNo":eventNo,"itemDiscount":itemDiscount},
				success:function(data){
					
					
					location.href="iEventInsertView.do?page="+page+"&itemCategory="+itemCategory;
					
					/* getList(); */
					        			 		
				},
				error:function(request, status, errorData){
                    alert("error code: " + request.status + "\n"
	                           +"message: " + request.responseText
	                           +"error: " + errorData);
	                  }   
			});
    		
    	} 
    		
    
    	}
    	
    	

    
  
 // 상태 변경 후 리스트 가져오기
  /*   function getList(){
   	 var page=${pi.currentPage};
   	 var itemCategory=$("#itemCategory").val();
   	 
   	 $.ajax({
   		 
   	 	url:"eventItemListChange.do", 
   	 	type:"POST",
   	 	data:{"page":page,"itemCategory":itemCategory},
   	 	dataType:"json",
   	 	success:function(data){
   	 		
   	 	  
   	 		
   	 		//게시물 상세보기(ajax후)
   	        
   	        	$(function(){

   	        	  $("#table1").children().on("click",function(){
   	       			var itemNo=$(this).children().children().eq(0).text();
   	        		 var page=${pi.currentPage };   
   	        		 var type="itemEvent";
   	        		 var itemCategory=$("#itemCategory").val();
   	        	
   	           		location.href="itemDetail.do?itemNo="+itemNo+"&page="+page+"&type="+type+"&itemCategory="+itemCategory;
   	       		})
   	        	
   	       	}) 
   	       	
   	 		$tableBody=$("#chgTable");
   	 		$tableBody.html("");
   	 		
   	 		var $tr;
   	 		var $eventNo;
   	 		var $eventName;
   	 		var $eventCnt;
   	 		var $eventStatus;
   	 		var $checkBox;
   	 		var $th;
   	 		var $p;
   	 	
   	 	
   	 	if(data.list.length>0){
   	 		
   	 				for(var i in data.list){
   	 					
   	 				$tr=$("<tr>");
   	 				$td=$("<td onclick='event.cancelBubble=true'>");
   	 				$checkBox=$("<input type='checkbox' class='common' name='itemNo'>").val(data.list[i].itemNo);     	 			
   	 				$eventNo=$("<td onclick='event.cancelBubble=true'>").text(data.list[i].itemNo);
   	 				$eventName=$("<td id='cursor'>").text(data.list[i].itemName);
   	 				$eventName.attr('id','test');
   	 				$eventCnt=$("<td onclick='event.cancelBubble=true'>").text(data.list[i].itemPrice+'원');
   	 				$eventStatus=$("<td onclick='event.cancelBubble=true'>").text(data.list[i].itemRate);
   	 				
   	 				
   	 				$td.append($checkBox);
   	 			
   	 				$tr.append($eventNo);
   	 				$tr.append($eventName);
   	 				$tr.append($eventCnt);
   	 				$tr.append($eventStatus);
   	 				$tr.append($td);
   	 				$tableBody.append($tr);
   	 	
   	 				}
   	 	}else{
   	 		
   	 			$tr=$("<tr>");
	   	 		$td=$("<td colspan='5' onclick='event.cancelBubble=true'>").text("이벤트 미등록 상품이 없습니다.");
	   	 	
		   
		   	 	$tr.append($td);
		   	 	$tableBody.append($tr);
		   	 	
		   	 	$page=$(".page-center");
		   	 	$page.html("");
   	 	}	
   	 			
   	 		
   	 	},
   	 	error:function(request, status, errorData){
               alert("error code: " + request.status + "\n"
                           +"message: " + request.responseText
                           +"error: " + errorData);
                  }   
   	 	
   	 })
   	 
    }
			  */
		
        
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
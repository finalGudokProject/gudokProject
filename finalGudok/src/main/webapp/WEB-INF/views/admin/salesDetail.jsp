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
    <title>결제 상세 리스트</title>    
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
                <h3>결제 상세 리스트</h3>
                <br>
            
                <br><br>
                
                <div style="float:left;">
                		
					<input type="button" class="btn" value="목록" onclick="goList()">
			      <input type="hidden" id="beforePage" name="page" value="${beforePage }">
			      <input type="hidden" id="startDay" name="startDay" value="${startDay }">
			      <input type="hidden" id="startD" name="startD" value="${startD }">
			      <input type="hidden" id="lastDay" name="lastDay" value="${lastDay }">
			      <input type="hidden" id="type" name="type" value="${type }">
			      <input type="hidden" id="type2" name="type2" value="${type2 }">
			      <input type="hidden" id="categoryNo" name="categoryNo" value="${categoryNo }">
			       <c:out value="${startDay}"/>
			      <c:out value="${lastDay}"/>
			      <c:out value="${startD}"/>
			      <c:out value="${type }"/>
			      <c:out value="${categoryNo }"/>
		
			   
					
                </div>
                <div style="float:right;">
                    <select id="category" name="category" style="width:200px">
                        <option value="" selected>전체</option>
                        <option value="subscribeNo">구독번호</option>
                        <option value="itemNo">상품번호</option>
                        <option value="itemName">상품명</option>
                        <option value="memberId">구매자</option>
                    </select>
                    <input type="text" id="word" name="word" value="">
                    <input type="button" class="btn" value="검색" onclick="search()">
                </div>
            
                <br>
                <br>
                    <table>
                        <thead>
                            <tr>
                                <th>결제일자</th>
                                <th>구독 번호</th>
                                <th>상품 번호</th>
                                <th>상품명</th>
                                <th>구매자</th>
                                <th>총 결제금액</th>
                             </tr>   
                         </thead>
                         <tbody>
                        	 <c:forEach var="i" items="${pList }" varStatus="cnt">
	                             <tr>
	                                <td>${i.paymentDate }</td>
	                                <td>${i.subscribeNo }</td>
	                                <td>${i.itemNo }</td>
	                                <td>${i.itemName }</td>
	                                <td>${i.memberId }</td>
	                                <td>${i.totalPayment }</td>
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
							<c:url var="blistBack" value="sDetail.do">
								<c:param name="page" value="${pi.currentPage+1 }"/>
								<c:param name="type" value="${type }"/>
								<c:param name="type2" value="${type2 }"/>
								<c:param name="startDay" value="${startDay }"/>
								<c:param name="lastDay" value="${lastDay }"/>
								<c:param name="beforePage" value="${beforePage }"/>
								<c:param name="startD" value="${startD }"/>
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
	                        	<c:url var="blistCheck" value="sDetail.do">
	                        		<c:param name="page" value="${pi.currentPage+1 }"/>
									<c:param name="type" value="${type }"/>
									<c:param name="type2" value="${type2 }"/>
									<c:param name="startDay" value="${startDay }"/>
									<c:param name="lastDay" value="${lastDay }"/>
									<c:param name="beforePage" value="${beforePage }"/>
									<c:param name="startD" value="${startD }"/>
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
							<c:url var="blistAfter" value="sDetail.do">
								<c:param name="page" value="${pi.currentPage+1 }"/>
								<c:param name="type" value="${type }"/>
								<c:param name="type2" value="${type2 }"/>
								<c:param name="startDay" value="${startDay }"/>
								<c:param name="lastDay" value="${lastDay }"/>
								<c:param name="beforePage" value="${beforePage }"/>
								<c:param name="startD" value="${startD }"/>
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
	
	function search(){
		
		
	
		var type=$("#type").val();
       	var type2=$("#type2").val();
       	var startD=$("#startD").val();
       	var startDay=$("#startDay").val();
       	var lastDay=$("#lastDay").val();
        var beforePage=$("#beforePage").val(); 
	   	var category=$("#category").val();
	   	var word=$("#word").val();
	   	
	   	if($("#categoryNo").val()!=null){
	   		
	  	 	var categoryNo=$("#categoryNo").val();
	   	}
	   	
	   	 
	   	 if(category=="subscribeNo"||category=="itemNo"){
	   		 if(word.replace(/[0-9]/g, "").length > 0) {
	   		        alert("숫자만 입력해 주십시오.");
	   		      $("#word").val("");
	   		     $("#word").focus();
	   		     return;
	   	 	}
	   	 }
	   	 
	
           		location.href="sDetail.do?startD="+startD+"&beforePage="+beforePage+"&type2="+type2+"&type="+type+"&startDay="+startDay+"&lastDay="+lastDay+"&category="+category+"&word="+word+"&categoryNo="+categoryNo;
		
		
	}
	
	function goList(){
		
			var page=$("#beforePage").val(); 
			var startD=$("#startD").val();
			var lastD=$("#lastD").val();
			var type=$("#type").val();
			var type2=$("#type2").val();
			
		if(type2=="date"){
			
			location.href="sDateList.do?page="+page+"&startD="+startD+"&lastD="+lastD+"&type="+type;
		}else{
			location.href="sCategoryList.do?page="+page+"&startD="+startD+"&lastD="+lastD+"&type="+type;
			
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
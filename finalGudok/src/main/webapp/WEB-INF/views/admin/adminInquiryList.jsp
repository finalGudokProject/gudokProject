<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.4.1.js" type="text/javascript"></script>
<title></title>
<style>
          body{
      font-family: 'Jua', sans-serif;
    }
    .list{
        margin:20px;
        list-style-type: none;
    }
    table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
  
  #list a{
    color:black;
    text-decoration: none;
  }
  button{
      background-color: rgb(0, 125, 255);
  }

  .container {
        width: 100%;
        margin-right: auto;
        margin-left: auto;
        margin:auto;
    }
    .content{
        margin-left:250px;
        background-color: RGB(237,237,237);
        padding:50px;
    
    }
    .box{
        padding:70px 70px 70px 70px; 
        
        background-color: #ffffff;
        height:1100px;
      
    }


    </style>
  </head>
  <body>
  
  <jsp:include page="../common/adminMenubar.jsp"/>

    <div class="content">
      <div class="container box">

        <div style="font-size: 30px;">1:1 문의</div>
        
        <div class="input-group" >
        	<form action="searchInquiryList.do" method="post" enctype="multipart/form-data">
              <select class="custom-select" id="searchType" name="searchType" style="margin-left: 464px; width:150px">
                <option value="All">모두</option>
                <option value="title">제목</option>
                <option value="content">내용</option>          
                <option value="user">작성자</option>        
              </select>
              <select class="custom-select" id="inquiry_yn" name="inquiry_yn" style="margin-left:-4px; width:150px">
                <option value="All">모두</option>
                <option value="Yes">답변완료</option>
                <option value="No">답변대기</option>                
              </select>
              <div class="input-group-append" style="float:right; width: 75px; height: 38px;">    
              <input type="text" class="form-control" id="keyword" name="keyword" value="" style="float:right; width:450px;height: 38px;" placeholder="검색어를 입력하세요">
                <input type="submit" value="검색" id="searchBtn" name="searchBtn" class="btn btn-primary" style="float:right; height:38px; margin-right: 10px;">    
              </div>
          	 </form>
            </div>
            <br>

          <table style="text-align: center; margin-top:15px">
        <thead>
          <tr>
            <th><input type="checkbox" id="checkAll"></th>
            <th style="width:10%">번호</th>
          <th style="width: 35%;">제목</th>
          <th style="width: 20%;">작성자</th>          
          <th style="width: 20%;">작성일</th>
          <th style="width: 20%;">답변상태</th>
          </tr>
        </thead>
        <tbody>
	      		<c:choose>
	      			<c:when test="${fn:length(list1)>0}">
			        	<c:forEach var="b" items="${list1 }" varStatus="cnt">
							<tr>
								<td><input type="checkbox" class="common" id="inquriyNo${cnt.index}" name="inquriyNo" value="${b.bBoard_no }"></td>
								<td align="center">${b.rownum }</td>
								<td align="center">
									<c:url var="adminInquiryDetail" value="adminInquiryDetail.do">
										<c:param name="bBoard_no" value="${b.bBoard_no }"/>
										<c:param name="page" value="${pi.currentPage }"/>
									</c:url>
									<c:choose>
									<c:when test="${list2[cnt.index] eq 'secret [oBoard_no=0, oSecret=Y, oSecret_pwd=null]'}">
									<a href="${adminInquiryDetail }">[공개] ${b.bTitle }</a>
									</c:when>
									<c:otherwise>
									<a href="${adminInquiryDetail }">[비공개] ${b.bTitle }</a>
									</c:otherwise>
									</c:choose>
								</td>
								<td align="center">${b.bMember_id}</td>
								<td align="center">${b.bWrite_date }</td>
								<td align="center">
								<c:choose>
								<c:when test="${list3[cnt.index]  eq 'Inquiry [iBoard_no=0, iInquiry_yn=N, iInquiry_date=null, iInquiry_content=null, iBoard_type=null, iInquiry_name=null]'}">
									답변 대기중	
								</c:when>
								<c:otherwise>
									답변 완료	
								</c:otherwise>		
								</c:choose>						
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<td colspan="5">조회된 결과가 없습니다.</td>
					</c:otherwise>
				</c:choose>
	      </tbody>
      	</table>
            <br><br>
            <input type="button" value="삭제" style="float:right; margin-right: 10px;"" class="btn btn-primary" onclick="iDelete()">
            <br><br><br>

                    <div class="page-center">
   					
                    <ul class="pagination-t">
                    
                       <!-- 이전 -->
                        <c:if test="${pi.currentPage eq 1 }">
                           <li class="page-item-t disabled-t"><a class="page-link-t"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-left-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  						   <path d="M3.86 8.753l5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z"/>
						   </svg></a></li>
                  		</c:if>
                   		<c:if test="${pi.currentPage gt 1 }">
                     		<c:url var="blistBack" value="adminInquiryList.do">
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
                              <c:url var="blistCheck" value=" adminInquiryList.do">
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
                     		<c:url var="blistAfter" value=" adminInquiryList.do">
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
                <br><br><br>

    </div><!--하얀박스 있는부분 끝-->
  </div><!--회색바탕 div-->
  
  
  <script>
	 
	  
		  // 선택 삭제
		  
			  function iDelete(){
				 			var sendArr = Array();
		     				var sendCnt = 0;
		     				var chkbox=$(".common");
			        		
		     				for(i=0; i<chkbox.length;i++){
		               			if(chkbox[i].checked == true){
		               				sendArr[sendCnt] = chkbox[i].value;
		               				sendCnt++;
		               			}
		               		}
			        		
			        		$.ajax({
			    				url:"inquiryDeleteCheck.do",
			    				type:"post",
			    				traditional:true,
			    				data:{"sendArr":sendArr},
			    				success:function(data){
			    					alert("선택한 1:1 문의들을 삭제합니다");
			    					getInquiryList();
			    				},
			    				error:function(request, status, errorData){
				                    alert("error code: " + request.status + "\n"
					                           +"message: " + request.responseText
					                           +"error: " + errorData);
					                  }   
			    			});
			        	} 
	  
		// 삭제 후 리스트 가져오기
	      function getInquiryList(){
	     	 var page=${pi.currentPage};
	     	 
	     	 $.ajax({
	     		 
	     	 	url:"inquiryListChange.do", 
	     	 	data:{"page":page},
	     	 	dataType:"json",
	     	 	success:function(data){
	     	 		
	     	 		//게시물 상세보기(ajax후)
	        	        
	        	       	$(function(){
	        	       		
	        	       		$("tr").on("click",function(){
	        	       			var bBoard_no=$(this).children().eq(1).text();
	        	        		var page=${pi.currentPage };  
	        	           		location.href="adminInquiryDetail.do?bBoard_no="+bBoard_no+"&page="+page;
	        	       		})
	        	       	})
	        	       	
	     	 		$tableBody=$("tbody");
	     	 		$tableBody.html("");
	     	 		
	     	 		var $tr;
	     	 		var $bBoard_no;
	     	 		var $rownum;
	     	 		var $bTitle;
	     	 		var $oSecret
	     	 		var $bMember_id;
	     	 		var $bWrite_date;
	     	 		var $iInquiry_yn;
	     	 		var $th;
	     	 		
	     	 				
	     	 				for(var i in data.adminInquiryList){
	     	 					
	     	 				$tr=$("<tr id='cursor'>");
	     	 				$td=$("<td onclick='event.cancelBubble=true'>");
	     	 				$checkBox=$("<input type='checkbox' class='common' name='proposalNo'>").val(data.adminInquiryList[i].bBoard_no);     	 			
	     	 				$bBoard_no=$("<td onclick='event.cancelBubble=true'>").text(data.adminInquiryList[i].bBoard_no).hide();
	     	 				$rownum=$("<td onclick='event.cancelBubble=true'>").text(data.adminInquiryList[i].rownum);
	     	 				$oSecret=$("<td>").text(data.adminInquiryList[i].oSecret);
	     	 				if($oSecret.text()=="N"){
	     	 					$oSecret.text("[비공개]");
	     	 				}else if($oSecret.text()=="Y"){
	     	 					$oSecret.text("[공개]");
	     	 				} 
	     	 				$bTitle=$($oSecret).append(data.adminInquiryList[i].bTitle);
	     	 				$bMember_id=$("<td onclick='event.cancelBubble=true'>").text(data.adminInquiryList[i].bMember_id);
	     	 				$bWrite_date=$("<td onclick='event.cancelBubble=true'>").text(data.adminInquiryList[i].bWrite_date);
	     	 				$iInquiry_yn=$("<td onclick='event.cancelBubble=true'>").text(data.adminInquiryList[i].iInquiry_yn);
	     	 				
	     	 				
	     	 				if($iInquiry_yn.text()=="N"){
	     	 					$iInquiry_yn.text("답변대기중");
	     	 				}else if($iInquiry_yn.text()=="Y"){
	     	 					$iInquiry_yn.text("답변완료");
	     	 				}
	     	 				
	     	 				
	     	 				
	     	 				$td.append($checkBox);
	     	 				$tr.append($td);
	     	 				$tr.append($bBoard_no);
	     	 				$tr.append($rownum);
	     	 				$tr.append($oSecret);
	     	 				$tr.append($bTitle);
	     	 				$tr.append($bMember_id);
	     	 				$tr.append($bWrite_date);
	     	 				$tr.append($iInquiry_yn);
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
	  
	  
	  // 모두 체크
	  
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
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
<title></title>
<style>

    table {
    width: 100%;
    border-top: 1px #CCCCCC !important;
  }
  th, td {
    border: 1px solid #CCCCCC !important;
    padding-top:20px !important;
  }
  
  button{
      background-color: rgb(0, 125, 255);
  }
  </style>
  </head>
  <body>
  
   <c:set var="contextPath"
		value="${pageContext.servletContext.contextPath }" scope="application" />
  
	  <jsp:include page="../common/adminMenubar.jsp"/>
	    <div class="content">
	      <div class="container box">

	        <div style="font-size: 30px;">1:1 문의</div>
	        <hr style="border-color:rgb(0, 125, 255);">

		 	<form action="aInquiryUpdate.do" method="post" enctype="multipart/form-data">
		          	<input type="hidden" name="page" value="${currentPage }">
					<input type="hidden" name="bBoard_no" value="${board.bBoard_no }">
					<input type="hidden" name="iBoard_no" value="${inquiry.iBoard_no }">
					<input type="hidden" name="oBoard_no" value="${secret.oBoard_no }">			
					<input type="hidden" name="renameFileName" value="${board.renameFileName }">
					<input type="hidden" name="originalFileName" value="${board.originalFileName }">
                   <table style="margin-top:15px">
                	<thead>
                    <tr>
                        <th style="text-align:center; padding:20px !important" colspan="5">
                        
                        	<c:if test="${secret.oSecret eq 'Y'}">
                        		[공개] ${board.bTitle }
                        	</c:if>
                        	<c:if test="${secret.oSecret eq 'N'}">
                        		[비공개] ${board.bTitle }
                        	</c:if>
                        </th>
                    </tr>
                    <tr>
                        <th style="width:15%; padding:20px;text-align: center;">문의유형</th>
                        <td style="width:39%;text-align:center; padding-top:20px">
						<c:if test="${inquiry.iBoard_type eq 'OPI' }">
                        	상품정보문의
                        </c:if>
                        <c:if test="${inquiry.iBoard_type eq 'OEC' }">
                        	교환문의
                        </c:if>
                        <c:if test="${inquiry.iBoard_type eq 'OAL' }">
                        	제휴
                        </c:if>
                        <c:if test="${inquiry.iBoard_type eq 'ODL' }">
                        	배송문의
                        </c:if>
                        <c:if test="${inquiry.iBoard_type eq 'OETC' }">
                        	기타문의
                        </c:if>
						</td>
                        <th style="width:15%; padding:20px;text-align: center;">작성자</th>
                        <td style="width:15%;text-align:center; padding-top:20px">${board.bMember_id }</td>
                        <th>
                        <c:if test="${inquiry.iInquiry_yn eq 'N'}">
                        		답변 대기중
                        	</c:if>
                        	<c:if test="${inquiry.iInquiry_yn eq 'Y'}">
                        		답변 완료
                        	</c:if>
                        </th>
                    </tr>
                    </thead>
                    <tbody>
	                  <tr>
	                      <td colspan="6" style="height:auto; padding:5%; text-align:left !important">
	                        <span style="margin:auto">
	                        ${board.bContent }
	                        </span>
	                        <br><br>
	                        <c:if test="${!empty  board.originalFileName }">
		                        <center>
	                          		<img style="height:300px;width:300px" src="${contextPath }/resources/inquiryUploadFiles/${board.renameFileName }">
	                        	</center>
                        	</c:if>
	                      </td>
	                  </tr>
              </table>
              <br>
              <table>
                  <tr>
                    <th style="width:15%; padding-top:75px !important;text-align: center;">답변 </th>
                    <td style="padding:12px !important;">
                    <textarea class="form-control" rows="6" style="resize: none;" id="iInquiry_content" name="iInquiry_content">${inquiry.iInquiry_content }</textarea></td>
                  </tr>
              </table>
            <br><br>
 
            <a href="javascript:history.go(-1)" type="button" class="btn btn-primary" style="float:right;">이전으로</a>
            <input type="submit" value="답변하기" class="btn btn-primary" style="float:right; margin-right: 10px;">
            
            <br><br><br>
			</form>

    </div><!--하얀박스 있는부분 끝-->
  </div><!--회색바탕 div-->
  

   




    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>

</html>
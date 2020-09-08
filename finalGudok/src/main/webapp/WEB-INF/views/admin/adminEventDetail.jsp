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

        <div style="font-size: 30px;">이벤트</div>
        <hr style="border-color:rgb(0, 125, 255);">

            
                 <table style="margin-top:15px">
                <thead style="text-align: center;">
                  <tr>
                    <th style="width:100px; padding:20px; text-align:center; ">이벤트</th>
                    <td style="width: 53%; text-align:center; ">${board.bTitle }</td>
                    <th style="width:100px; text-align:center; ">조회수</th>
                    <td style="width:100px; text-align:center; ">${board.bRead_num }</td>
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
	                          		<img style="height:500px;width:500px" src="${contextPath }/resources/eventUploadFiles/${board.renameFileName }">
	                        	</center>
                        	</c:if>
	                      </td>
	                  </tr>
	                </tbody>
              </table>

            <br><br>
            <c:url var="adminEventUpdateView" value="adminEventUpdate.do">
						<c:param name="bBoard_no" value="${board.bBoard_no }"/>
						<c:param name="page" value="${currentPage }"/>
			</c:url>
			<c:url var="eventDelete" value="eventDelete.do">
						<c:param name="bBoard_no" value="${board.bBoard_no }"/>
			</c:url>
            &nbsp;&nbsp;<a href="adminEventList.do" type="button" class="btn btn-primary" style="float:right;">목록으로</a>
            <c:if test="${loginUser.memberId eq 'admin' }">
            <a href="${adminEventUpdateView }" type="button" class="btn btn-primary" style="float:right;margin-right:10px">수정</a>
            <a href="${eventDelete }" type="button" class="btn btn-primary" style="float:right;margin-right:10px">삭제</a>
            </c:if>
            
            <br><br><br>

    </div><!--하얀박스 있는부분 끝-->
  </div><!--회색바탕 div-->
  

   




    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>
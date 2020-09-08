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
<title></title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<br><br><br>
    <div class="container" align="center">
    
        <h1 >이벤트</h1>
            <br>
            <hr style="border-color:rgb(0, 125, 255);"><br>
          
          <table>
          <c:choose>
          <c:when test="${fn:length(list1)>0 }">
				<c:forEach var="b" items="${list1 }" varStatus="cnt">
	              <tr>
	              <td align="center">
	                <c:url var="eventDetail" value="eventDetail.do">
						<c:param name="bBoard_no" value="${b.bBoard_no }"/>
						<c:param name="page" value="${pi.currentPage }"/>
					</c:url>
					<c:choose>
					<c:when test="${list2[cnt.index] eq 'EventBoard [eBoard_no=0, eE_status=Y]'}">
					<div style="font-size:20px" align="center">
		              ${b.bTitle }
		              </div><br>
	                  <a href="${eventDetail }"><img style="height:400px;width:1000px;" src="${contextPath }/resources/eventUploadFiles/${b.renameFileName }"></a> 
	                	<br><br><br>
	                </c:when>
	                <c:otherwise>
	                </c:otherwise>
	                </c:choose>
	                </td>
	              </tr>
				</c:forEach>
				</c:when>
				</c:choose>
          </table>

            <br><br><br>
            </div>
            
            
            <footer class="page-footer font-small indigo">
				<jsp:include page="../common/footer.jsp" />
			</footer>
            <br><br><br>
</body>
</html>
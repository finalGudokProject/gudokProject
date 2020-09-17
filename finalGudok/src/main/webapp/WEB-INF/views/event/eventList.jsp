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
<style>
/*페이징 처리용 cs*/
.pagination-t {
            display: flex;
            padding-left: 0;
            list-style: none;
            border-radius: 0.25rem;
        }

        .page-link-t {
            position: relative;
            display: block;
            padding: 0.5rem 0.75rem;
            margin-left: -1px;
            line-height: 1.25;
            color: black;
            background-color: #fff;
            border: 1px solid #dee2e6;
        }

        .page-link-t:hover {
            z-index: 2;
            color: #0056b3;
            text-decoration: none;
            background-color: #e9ecef;
            border-color: #dee2e6;
        }

        .page-link-t:focus {
            z-index: 3;
            outline: 0;
        }

        .page-item-t:first-child .page-link-t {
            border-top-left-radius: 0.25rem;
            border-bottom-left-radius: 0.25rem;
        }

        .page-item-t:last-child .page-link-t {
            border-top-right-radius: 0.25rem;
            border-bottom-right-radius: 0.25rem;
        }

        .page-item-t.active-t .page-link-t {
            z-index: 3;
            color: #fff;
            background-color: rgba(90,148,235,0.8);
            border-color:  rgba(90,148,235,0.8);
        }

        .page-item-t.disabled-t .page-link-t {
            color: #6c757d;
            pointer-events: none;
            cursor: auto;
            background-color: #fff;
            border-color: #dee2e6;
        }


        .sr-only-t {
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip: rect(0, 0, 0, 0);
            white-space: nowrap;
            border: 0;
        }

        .page-center {
            display: flex;
            justify-content: center;
            /*가운데 정렬*/
            align-items: center;
        }
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<br><br><br>
    <div class="container" align="center">
    
        <h1><img src="resources/images/event.png" width="60px" height="60px">&nbsp;이벤트</h1>
            <br>
            <hr style="border-color:#ced4da;"><br>
          
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
          <br><br>
			<!------페이징 처리----->
                <div class="page-center">
                	<c:choose>
		      		<c:when test="${!empty list1 }">
                    <ul class="pagination-t">
                       <!-- 이전 -->
                        <c:if test="${pi.currentPage eq 1 }">
                           <li class="page-item-t disabled-t"><a class="page-link-t"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-left-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  						   <path d="M3.86 8.753l5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z"/>
						   </svg></a></li>
                  		</c:if>
                   		<c:if test="${pi.currentPage gt 1 }">
                     		<c:url var="blistBack" value="eventList.do">
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
                              <c:url var="blistCheck" value="eventList.do">
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
                     		<c:url var="blistAfter" value="eventList.do">
                        		<c:param name="page" value="${pi.currentPage+1 }"/>
                     		</c:url>
                            <li class="page-item-t">
                            <a class="page-link-t" href="${blistAfter }">
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-right-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  							<path d="M12.14 8.753l-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
							</svg></a></li>
                  		</c:if>
                    </ul>
                    </c:when>
                    <c:otherwise>
                    
                    </c:otherwise>
                    </c:choose>
                </div>
                <br><br><br>
            <br><br><br>
            </div>
            
            
            <footer class="page-footer font-small indigo">
				<jsp:include page="../common/footer.jsp" />
			</footer>
            <br><br><br>
</body>
</html>
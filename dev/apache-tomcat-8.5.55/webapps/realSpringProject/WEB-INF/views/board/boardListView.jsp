<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<h1 align="center">게시글 목록</h1>
	
	<h3 align="center">
		총 게시글 갯수 : ${pi.listCount}
		<c:if test="${!empty loginUser}">
			&nbsp;&nbsp;&nbsp;
			<button onclick="location.href='binsertView.do'">글쓰기</button>
		</c:if>
	</h3>
	
	<table align="center" border="1" width="700" id="td">
		<tr>
			<th>번호</th>
			<th width="300">제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
			<th>첨부파일</th>
		</tr>
		<c:forEach var="b" items="${list}">
			<tr>
				<td align="center">${b.bId}</td>
				<td align="left">
					<c:if test="${!empty loginUser}">
						<c:url var="bdetail" value="bdetail.do">
							<c:param name="bId" value="${b.bId}"/>
							<c:param name="page" value="${pi.currentPage}"/>
							<!-- 현재 보던 페이지 정보도 넘기자 -->
						</c:url>
						<a href="${bdetail}">${b.bTitle}</a>
					</c:if>
					<c:if test="${empty loginUser}">
						${b.bTitle}
					</c:if>
				</td>
				<td align="center">${b.bWriter}</td>
				<td align="center">${b.bCreateDate}</td>
				<td align="center">${b.bCount}</td>
				<td align="center">
					<c:if test="${!empty b.originalFileName}">
						★
					</c:if>
					<c:if test="${empty b.originalFileName}">
						&nbsp;
					</c:if>
				</td>
			</tr>
		</c:forEach>
		<!-- 페이징 처리 부분 -->
		<tr align="center" height="20">
			<td colspan="6">
				<!-- [이전] -->
				<c:if test="${pi.currentPage eq 1}">
					[이전]&nbsp;
				</c:if>
				
				<c:if test="${pi.currentPage gt 1}">
					<c:url var="blistBack" value="blist.do">
						<c:param name="page" value="${pi.currentPage - 1}"></c:param>
					</c:url>
					<a href="${blistBack}">[이전]</a>&nbsp;
				</c:if>
				<!-- [번호들] -->
				<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
					<c:if test="${p eq pi.currentPage}">
						<font color="red" size="4"><b>[${p}]</b></font>
					</c:if>
					
					<c:if test="${p ne pi.currentPage}">
						<c:url var="blistCheck" value="blist.do">
							<c:param name="page" value="${p}"></c:param>
						</c:url>
						<a href="${blistCheck}">${p}</a>
					</c:if>
				</c:forEach>
				<!-- [이후] -->
				<c:if test="${pi.currentPage eq pi.maxPage}">
					&nbsp;[이후]
				</c:if>
				
				<c:if test="${pi.currentPage lt pi.maxPage}">
					<c:url var="blistAfter" value="blist.do">
						<c:param name="page" value="${pi.currentPage + 1}"></c:param>
					</c:url>
					&nbsp;<a href="${blistAfter}">[이후]</a>
				</c:if>			
			</td>
		</tr>
	</table>
	
	<!-- 페이징 처리를 포함한 게사글 리스트 작성이 완료되면 게시글 작성 및 상세보기를 완성하자. -->
	
	<br><br><br><br><br><br>
</body>
</html>
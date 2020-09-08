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
	
	<!-- 한번 더  boardInsertForm.jsp에서 내용을 복붙하자. -->
	<h1 align="center">${board.bId}번 게시글 수정하기</h1>
	
	<br>
	
	<form action="bupdate.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="page" value="${currentPage}">
		<input type="hidden" name="bId" value="${board.bId}">
		<input type="hidden" name="renameFileName" value="${board.renameFileName}">
		
		<table align="center">
			<tr>
				<td>제목</td>
				<td><input type="text" name="bTitle" value="${board.bTitle}"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="bWriter" value="${loginUser.id}" readonly></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="bContent">${board.bContent}</textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="file" name="uploadFile">
					<c:if test="${!empty board.originalFileName}">
						<br> 현재 업로드 한 파일 :
						<a href="${contextPath}/resources/buploadFiles/${board.renameFileName}" download="${board.originalFileName}">
							${board.originalFileName}
						</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정하기">&nbsp;
					<c:url var="blist" value="blist.do">
						<c:param name="page" value="${currentPage}"/>
					</c:url>
					<a href="${blist}">목록으로</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
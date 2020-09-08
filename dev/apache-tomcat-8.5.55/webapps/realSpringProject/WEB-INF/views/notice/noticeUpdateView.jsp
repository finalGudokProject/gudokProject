<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<h1 align="center">공지글 수정 페이지</h1>
	
	<br><br>
	
	<form action="nupdate.do" method="post" enctype="Multipart/form-data">
	
		<!-- 아래 두개는 기본적으로 화면에 뿌려줄 필요가 없으므로 hidden타입의 input으로 만들자 -->
		<input type="hidden" name="nId" value="${notice.nId}"/>
		<!-- 수정하려면 notice.nId가 쿼리에서 필요하다 -->
		<input type="hidden" name="filePath" value="${notice.filePath}"/>
		<!-- 파일을 수정했다면 기존 파일을 지우기 위해 기존 파일명도 넘겨주자 -->		

		<table align="center" border="1" width="400">
			<tr>
				<td>제목</td>
				<td>
					<input type="text" size="50" name="nTitle" value="${notice.nTitle}">
				</td>			
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="nWriter" value="${loginUser.id}" readonly>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="7" cols="50" name="nContent">
						${notice.nContent}
					</textarea>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="file" name="reuploadFile">
					<c:if test="${!empty notice.filePath}">
						<br>현재 업로드 한 파일 : 
						<img src="${contextPath}/resources/nuploadFiles/${notice.filePath}">
						<a href="${contextPath}/resources/nuploadFiles/${notice.filePath}" download>
							${notice.filePath}
						</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정하기">
				</td>
			</tr>
		</table>
	</form>
	
	<p align="center">
		<a href="home.do">시작페이지로 이동</a>
		<a href="nlist.do">목록 보기로 이동</a>
		<a href="javascript:history.go(-1);">이전 페이지로 이동</a>
	</p>
</body>
</html>
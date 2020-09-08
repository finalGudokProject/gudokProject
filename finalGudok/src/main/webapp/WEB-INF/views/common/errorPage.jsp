<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${msg }</h1>
	<a href="home.do">홈으로 돌아가기</a>
	
	<!-- 공용 에러페이지 등록 시 사용할 태그 -->
	<%-- <h1>${requestScope['javax.servlet.error.message'] }</h1>
	<a href="home.do">홈으로 돌아가기</a> --%>
</body>
</html>
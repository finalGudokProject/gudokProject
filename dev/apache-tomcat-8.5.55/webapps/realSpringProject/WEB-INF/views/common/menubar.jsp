<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
   .nav{
      width:780px;
      margin-left:auto;
      margin-right:auto;
   }
   .menu{
      display:inline-block;
      background:yellowgreen;
      text-align:center;
      line-height:50px;
      width:150px;
      height:50px;
      margin-left:20px;
      margin-right:20px;
      border-radius:20px;
   }
   .menu:hover{
      background:orangered;
      color:white;
      cursor:pointer;
   }
</style>
</head>
<body>
	<!-- 
		메뉴바는 어느 페이지든 포함하고 있을 테니 예전(mybatis 시절)에  index.jsp에서
		지정했던 contextPath 변수 값을 여기에 만들어 두면 어느 페이지든
		열어도 contextPath가 동작할 수 있다.
	 -->
	 
	 <c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
	 
	 <h1 align="center">Finally Last Subject Spring</h1>
	 <br>
	 
	 <div class="loginArea" align="right">
	 	<!-- 로그인 X -->
	 	<c:if test="${empty sessionScope.loginUser}">
	 		<form action="login.do" method="post">
	 			<table id="loginTable" style="text-align:center;">
	 				<tr>
	 					<td>아이디</td>
	 					<!-- id 멤버 변수와 똑같이 적어주기 -->
	 					<td><input type="text" name="id"></td>
	 					<td rowspan="2">
	 						<button id="loginBtn">로그인</button>
	 					</td>
	 				</tr>
	 				<tr>
	 					<td>비밀번호</td>
	 					<td><input type="password" name="pwd"></td>
	 				</tr>
	 				<tr>
	 					<td colspan="3">
	 					<!-- 로그인 로그아웃이 끝나면 회원가입 만들자 -->
	 						<a href="enrollView.do">회원가입</a>
	 						<a href="#">아이디/비밀번호 찾기</a>
	 					</td>
	 				</tr>
	 			</table>
	 		</form>
	 	</c:if>
	 	
	 	<!-- 로그인 O -->
	 	<c:if test="${!empty sessionScope.loginUser}">
	 		<!-- 여기는 DB까지의 길을 뚫어서 로그인 기능 성공하고 작성하자. -->
	 		<h3 align="right">
	 			<c:out value="${loginUser.name}님 환영합니다!!"/>
	 			<!-- 경로 변경시 사용 할 변수 지정 -->
	 			<c:url var="logout" value="logout.do"/>
	 			<c:url var="myinfo" value="myinfo.do"/>
	 			
	 			<button onclick="location.href='${myinfo}'">정보수정</button>
	 			<button onclick="location.href='${logout}'">로그아웃</button>
	 		</h3>
	 	</c:if>
	 </div>
	 
	 <!-- 회원탈퇴까지 진행하면 공지사항부터 착착 진행하자 -->
	 <c:url var="nlist" value="nlist.do"/>
	 <c:url var="blist" value="blist.do"/>
	 
	 <div class="menubar">
	 	<div class="nav">
	 		<div class="menu"><a href="home.do">홈</a></div>
	 		<div class="menu"><a href="${nlist}">공지사항</a></div>
	 		<div class="menu"><a href="${blist}">게시판</a></div>
	 		<div class="menu"><a href="#">etc</a></div>
	 	</div>
	 </div>
	 
</body>
</html>
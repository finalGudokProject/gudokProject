<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<title>Menubar</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
/*폰트 적용*/
body {
	font-family: 'Jua', sans-serif !important;
	color: #495057;
}


h3 {
	color: black;
}

section {
	margin-bottom: 50px;
}

/*상단 회원가입, 로그인, 고객센터 메뉴(#menu-list) */
.menu-list {
	line-height: 3;
	text-align: right;
}

.menu-list>li {
	display: inline-block;
	margin-right: 50px;
}

.menu-list a {
	color: #495057;;
}

.menu-list a:hover {
	color: black;
	cursor: pointer;
	text-decoration: none;
}

/*나비바 각 카테고리(a태그) 간격조정*/
.nav-link {
	margin: 0 60px 0 60px;
	color: #495057 !important;
}

.nav-link:hover {
	color: black;
}

/*나비바 각 카테고리(글씨, 아이콘) 가운데 정렬*/
.nav-item {
	text-align: center;
	color: #495057;
}

.nav-item:hover {
	cursor: pointer;
}

/*나비바 각 카테고리 간격 설정*/
.navbar-nav {
	margin-left: 50px;
}

.nav-item a {
	color: #495057;
}

.nav-item>a:hover {
	color: black !important;
}

/*검색바 마진 설정*/
#searchBar {
	margin-left: 50px;
	margin-right: 50px;
}

/* 푸드, 리빙 카테고리 드롭다운 설정*/
#food-menu, #living-menu {
	background-color: #f8f9fa;
	margin-left: 10px;
	border: none;
}

.dropdown:hover>.dropdown-menu {
	text-align: center;
	display: block;
}

.dropdown-item {
	color: #495057;
}

.dropdown-item:hover {
	color: black;
}

.form-inline my-2 my-lg-0>input {
	margin-left: 50px;
}

/*버튼 css 설정*/
.btn {
	border-color: #ced4da;
	color: #495057;
}

.btn:hover {
	border-color: black;
	color: black;
}

::placeholder {
	font-size: small;
}

#cardWrap>a {
	color: #495057 !important;
}

a:hover {
	text-decoration: none;
	color: black;
}

.card{
display:inline-block !important;

</style>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
</head>
	<!-- 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
   <!-- 아이콘 -->
   
   <!-- 부트스트랩 -->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
   <!-- popper 툴팁 -->
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
   <!-- 부트스트랩 스크립트(jQuery보다 아래 있어야함) -->
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<body>
	<c:set var="contextPath"
		value="${pageContext.servletContext.contextPath }" scope="application" />
	<div class="userMenu">
		<c:if test="${empty sessionScope.loginUser }">
			<ul class="menu-list">
				<li><a href="moveToSignUp.do">회원가입</a></li>
				<li><a href="moveToLogin.do">로그인</a></li>
				<li><a href="noticeList.do">고객센터</a></li>
				<li><a href="#">Who is JH?</a></li>
				<li><a href="payment.do">결제페이지</a>
			</ul>
		</c:if>
		<c:if test="${!empty sessionScope.loginUser }">
			<ul class="menu-list">
				<li><c:out value="${loginUser.memberName }님 환영합니다" /></li>
				<c:url var="slist" value="subscribeView.do">
					<c:param name="memberNo" value="${loginUser.memberNo}"/>
				</c:url> 
				<li><a href="${slist}">마이페이지</li>
				<li><a href="logout.do">로그아웃</a></li>
				<li><a href="noticeList.do">고객센터</a></li>
				<li><a href="#">Who is JH?</a></li>
				<li><a href="payment.do">결제페이지</a>
			</ul>
		</c:if>
	</div>


	<div class="container">
		<div class="row">
			<div class="col-12" align="center">
				<a href="home.do"><img src="resources/images/logo.png"
					width="220px" height="150px"></a>
			</div>
		</div>
	</div>
	<br>

	<nav class="navbar navbar-expand-sm navbar-light bg-light sticky-top">
		<!-- <a class="navbar-brand" href="#">Navbar</a> -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
          <!-- <ul class="navbar-nav mr-auto"> -->
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="itemNew.do"><img src="resources/images/new.png" width="50px" height="50px"><br>신상품</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="itemBest.do"><img src="resources/images/best.png" width="50px" height="50px"><br>베스트</a>
            </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown" href="itemFood.do" id="navbarDropdown1" role="button" aria-haspopup="true" aria-expanded="false">
                <img src="resources/images/food.png" width="50px" height="50px"><br>Food
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown1" id="food-menu">
                  <a class="dropdown-item" href="foodSort.do?categoryNo=F1"><img src="resources/images/beverage.png" width="30px" height="30px">&nbsp;음료</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="foodSort.do?categoryNo=F2"><img src="resources/images/milk.png" width="30px" height="30px">&nbsp;유제품</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="foodSort.do?categoryNo=F3"><img src="resources/images/bakery.png" width="30px" height="30px">&nbsp;베이커리</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="foodSort.do?categoryNo=F4"><img src="resources/images/canned_food.png" width="30px" height="30px">&nbsp;간편식품</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="foodSort.do?categoryNo=F5"><img src="resources/images/supplement.png" width="30px" height="30px">&nbsp;건강식품</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="foodSort.do?categoryNo=F6"><img src="resources/images/diet_food.png" width="30px" height="30px">&nbsp;다이어트 식단</a>
                </div>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown" href="itemLiving.do" id="navbarDropdown2" role="button" aria-haspopup="true" aria-expanded="false">
                <img src="resources/images/living.png" width="50px" height="50px"><br>리빙
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown2" id="living-menu">
                  <a class="dropdown-item" href="livingSort.do?categoryNo=L3"><img src="resources/images/diffuser.png" width="30px" height="30px">&nbsp;홈데코</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="livingSort.do?categoryNo=L2"><img src="resources/images/body_care.png" width="30px" height="30px">&nbsp;바디케어</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="livingSort.do?categoryNo=L1"><img src="resources/images/mask.png" width="30px" height="30px">&nbsp;생활용품</a>
                </div>
              </li>
            <li class="nav-item">
              <a class="nav-link" href="itemEvent.do"><img src="resources/images/event.png" width="50px" height="50px"><br>이벤트</a>
            </li>
          </ul>
          <!-- </ul> -->
          <form class="form-inline my-2 my-lg-0" id="searchBar">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
          </form>
        </div>
	</nav>

	<script
       src="https://code.jquery.com/jquery-3.4.1.min.js"
       integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
       crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/4b6b63d8f6.js" crossorigin="anonymous"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="row">
	<div class="col-md-3" id="menuId">
	<div class="menuName">푸드</div>
		<ul>
			<li id="menu" class="menu"><div><a href="#">반찬</a></div>
			</li>
			
			<li id="menu" class="menu"><div>유제품</div>
				<div>
					<ul>
						<li class="smallMenu" id="smallMenu1"><a href="#">우유</a></li>
						<li class="smallMenu" id="smallMenu2"><a href="#">요거트</a></li>
						<li class="smallMenu" id="smallMenu2"><a href="#">아이스크림</a></li>
					</ul>
				</div>
			</li>
			<li id="menu"><a href="#">베이커리</a></li>
			<li id="menu" class="menu"><div>다이어트 식단</div>
				<div>
					<ul>
						<li class="smallMenu" id="smallMenu1"><a href="#">샐러드</a></li>
						<li class="smallMenu" id="smallMenu2"><a href="#">다이어트 도시락</a></li>
					</ul>
				</div>
			</li>
			<li id="menu"><div>음료</div>
				<div>
					<ul>
						<li class="smallMenu" id="smallMenu1"><a href="#">물</a></li>
						<li class="smallMenu" id="smallMenu2"><a href="#">커피</a></li>
					</ul>
				</div>
			</li>
			<li id="menu"><a href="#">간편식품</a></li>
			<li id="menu"><a href="#">건강식품</a></li>
		</ul>
		
		
		<div class="menuName">리빙</div>
		<ul>
			<li id="menu" class="menu"><div><a href="#">생활용품</a></div>
				<div>
					<ul>
						<li class="smallMenu" id="smallMenu1"><a href="#">면도기</a></li>
						<li class="smallMenu" id="smallMenu2"><a href="#">수건</a></li>
					</ul>
				</div>
			</li>
			
			<li id="menu" class="menu"><div>바디케어</div>
				<div>
					<ul>
						<li class="smallMenu" id="smallMenu1"><a href="#">마스크</a></li>
						<li class="smallMenu" id="smallMenu2"><a href="#">생리대</a></li>
					</ul>
				</div>
			</li>
			<li id="menu" class="menu"><div>홈 데코</div>
				<div>
					<ul>
						<li class="smallMenu" id="smallMenu1"><a href="#">꽃</a></li>
						<li class="smallMenu" id="smallMenu2"><a href="#">디퓨저</a></li>
						<li class="smallMenu" id="smallMenu2"><a href="#">이불</a></li>
					</ul>
				</div>
			</li>
		</ul>
	
	</div>
	<div class="col-md-9">
		<div id="cateName">아이스크림</div>
		<div id="rankDiv">
			<div id="rankDiv">인기순</div>
			<div id="rankDiv">최신 등록순</div>
			<div id="rankDiv">높은 가격순</div>
			<div id="rankDiv">낮은 가격순</div>
			<div id="rankDiv"><input type="text">&nbsp;<button>검색</button></div>
		</div>
		<ul class="paperUl">
			<li class="paper">
			<a href="#" class="itemListA">
				<div id="itemHover">
				<ul class="listUl">
					<li><img src="resources/images/spong.jpg" style="width:100%;height:100%;" ></li>
					<li>DB상품명 입니다.</li>
					<li>DB가격 입니다.</li>
					<li>DB평점☆☆☆☆☆</li>
				</ul>
				</div>
			</a>
			</li>
			<li class="paper">
			<a href="#" class="itemListA">
				<div id="itemHover">
				<ul class="listUl">
					<li><img src="resources/images/spong.jpg" style="width:100%;height:100%;" ></li>
					<li>DB상품명 입니다.</li>
					<li>DB가격 입니다.</li>
					<li>DB평점☆☆☆☆☆</li>
				</ul>
				</div>
			</a>
			</li>
			<li class="paper">
			<a href="#" class="itemListA">
				<div id="itemHover">
				<ul class="listUl">
					<li><img src="resources/images/spong.jpg" style="width:100%;height:100%;" ></li>
					<li>DB상품명 입니다.</li>
					<li>DB가격 입니다.</li>
					<li>DB평점☆☆☆☆☆</li>
				</ul>
				</div>
			</a>
			</li>
			<li class="paper">
			<a href="#" class="itemListA">
				<div id="itemHover">
				<ul class="listUl">
					<li><img src="resources/images/spong.jpg" style="width:100%;height:100%;" ></li>
					<li>DB상품명 입니다.</li>
					<li>DB가격 입니다.</li>
					<li>DB평점☆☆☆☆☆</li>
				</ul>
				</div>
			</a>
			</li>
			
			
		</ul>
	</div>
	</div>
</div>
	<!-- <script>
		$(function(){
			$(".paper").mouseenter(function(){
				$(this).css("border","1px solid black");
			}).mouseout(function(){
				$(this).css("border","none");
			})
		})
	</script> -->
	
	<!-- 사이드 메뉴바 -->
	<script>
	$(function(){
		$(".menu").mouseenter(function(){
			$(this).find("li").css("display","block").css("background","white");
		}).mouseleave(function(){
			$(this).find("li").css("display","none");
		})
	})
	</script>
</body>
</html>
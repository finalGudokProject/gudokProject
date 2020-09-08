<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
	#content {
        font-size: 1em;
        margin-top: 5%;
    }

    /* 마이페이지 메뉴바 */

    .myPage_Menu {
        float: left;
        list-style-type: none;
        margin: 0;
        padding: 0;
        width: 10%;
        display: relative;
    }

    .myPage_Menu ul {
        list-style-type: none;
        padding: 0;
        font-size: 1em;
        font-weight: lighter;
        margin-left: 10%;
        margin-bottom:5%;
    }

    .myPage_Menu>li {
        margin-bottom: 10%;
    }

    .myPage_Menu li a {
        display: block;
        color: #000;
        padding: 8px 16px;
        text-decoration: none;
    }
    
    .myPage_Menu li span {
        display: block;
        color: #000;
        padding: 8px 16px;
        text-decoration: none;
    }

    .myPage_Menu li a.active {
        /* background-color: #4CAF50; */
        color: #000;
    }

    .myPage_Menu li a:hover:not(.active) {
        color: #115D8C;
    }
    
    /* 회원정보 상자 */

    .content_sub {
      width: 85%;
      text-align: center;
      margin-bottom: 10%;
      float:left
    }

    .content_member {
      height: 10em;
      width: 100%;
    }
    
    .title{
    	font-size: 1.2em;
    }

    .member_info {
      overflow: hidden;
      border: 1px solid #ccc;
      height: 10em;
      width: 80%;
      margin: 0 auto;

    }

    .member,
    .cart,
    .point,
    .subscribe {
      float: left;
      width: 25%;
      height: 100%;
      text-align: center;
      margin: 0;
      padding: 0;
    }

    .member,
    .subscribe,
    .cart,
    .point {
      position: relative;
    }

    .member span {
      display: inline-block;
      padding-top: 10%;
    }

    .sub {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
    }

    .sub a {
      text-decoration: none;
    }

    .name,
    .grade {
      font-size: 1.2em;
    }

    .name {
      color: black;
    }

    .grade {
      color: #115D8C;
    }

    .etc {
      color: black;
      display: inline;
      font-size: 1em;
    }

    .count {
      color: #115D8C;
      font-size:1.1em;
    }

    /* ------------------- */
	.top {
      border-top: 1px solid black;
      border-width: medium;
    }

    .bottom {
      border-bottom: 1px solid black;
    }

    .sub_content {
      float: left;
      margin-left: 10%;
      margin-top: 3%;
    }

    .pointList {
      margin-top: 5%;
      margin-left: 10%;
    }

    .pointList table {
      width: 100%;
    }

    .pointList table tr {
      height: 45px;
    }
	

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<div id="content">
        <ul class="myPage_Menu">
            <li>
                <span><img src="resources/images/delivery.png"
                        style="width: 25%; height: 25%; margin-right: 4%;">구독배송</span>
                <ul>
                	<c:url var="slist" value="subscribeView.do">
						<c:param name="memberNo" value="${loginUser.memberNo}"/>
					</c:url> 
                    <li><a href="${slist}">구독 조회</a></li>
                    <c:url var="dlist" value="deliveryList.do">
						<c:param name="memberNo" value="${loginUser.memberNo}"/>
					</c:url> 
                    <li><a href="${dlist}">배송 조회</a></li>
                    <c:url var="elist" value="exchangeList.do">
						<c:param name="memberNo" value="${loginUser.memberNo}"/>
					</c:url> 
                    <li><a href="${elist}">교환 내역</a></li>
                </ul>
            </li>
            <li>
                <span><img src="resources/images/my_benefit.png"
                        style="width: 25%; height: 25%; margin-right: 4%;">나의혜택</span>
                <ul>
                    <c:url var="grade" value="gradeView.do"></c:url> 
                    <li><a href="${grade}">회원 등급</a></li>
                    <c:url var="plist" value="pointList.do">
							<c:param name="memberNo" value="${loginUser.memberNo}"/>
					</c:url> 
                    <li><a href="${plist}">적립금 내역</a></li>
                </ul>
            </li>
            <c:url var="clist" value="cartView.do">
				<c:param name="memberNo" value="${loginUser.memberNo}"/>
			</c:url> 
            <li><a href="${clist}"><img src="resources/images/cart.png"
                        style="width: 25%; height: 25%; margin-right: 4%;">장바구니</a></li>
            <c:url var="hlist" value="heartView.do">
				<c:param name="memberNo" value="${loginUser.memberNo}"/>
			</c:url> 
            <li><a href="${hlist}"><img src="resources/images/heart.png" style="width: 25%; height: 25%; margin-right: 4%;">찜</a>
            </li>
            <c:url var="rlist" value="reviewList.do">
				<c:param name="memberNo" value="${loginUser.memberNo}"/>
			</c:url> 
            <li><a href="${rlist}"><img src="resources/images/review.png"
                        style="width: 25%; height: 25%; margin-right: 4%;">상품리뷰</a></li>
            <c:url var="ilist" value="inquiryList.do">
				<c:param name="memberNo" value="${loginUser.memberNo}"/>
			</c:url>
            <li><a href="${ilist}"><img src="resources/images/inquiry.png"
                        style="width: 25%; height: 25%; margin-right: 4%;">1:1문의</a></li>
            <li>
                <span><img src="resources/images/member_information.png"
                        style="width: 25%; height: 25%; margin-right: 4%;">회원정보</span>
                <ul>
                	<c:url var="myInfo" value="myInfo.do">
						<c:param name="memberNo" value="${loginUser.memberNo}"/>
					</c:url>
                    <li><a href="${myInfo}">회원정보 확인</a></li>
                    <c:url var="withdrawal" value="myWithdrawal.do">
						<c:param name="memberNo" value="${loginUser.memberNo}"/>
					</c:url>
                    <li><a href="${withdrawal}">회원탈퇴</a></li>
                </ul>
            </li>
        </ul>
        
        <div class="content_sub">
	      <div class="content_member">
	        <div class="member_info">
	          <div class="member">
	            <div class="sub">
	              <span class="name">${loginUser.memberName } <span class="etc">&nbsp;님</span></span>
	              <br>
	              <c:if test="${loginUser.gradeNo eq 1}">
	              	<span class="grade">알 <span class="etc">&nbsp;등급</span></span>
	              </c:if>
	              <c:if test="${loginUser.gradeNo eq 2}">
	              	<span class="grade">아기거위 <span class="etc">&nbsp;등급</span></span>
	              </c:if>
	              <c:if test="${loginUser.gradeNo eq 3}">
	              	<span class="grade">어른거위 <span class="etc">&nbsp;등급</span></span>
	              </c:if>
	              <c:if test="${loginUser.gradeNo eq 4}">
	              	<span class="grade">황금거위 <span class="etc">&nbsp;등급</span></span>
	              </c:if>
	              <br>
	              <c:url var="grade" value="gradeView.do"></c:url> 
	              <span><a href="${grade}" style="color: black; font-size: 0.8em;">등급 혜택보기</a></span>
	            </div>
	          </div>
	          <div class="subscribe">
	            <div class="sub">
	              <span class="title"><a href="#" style="color: black;">구독</a></span>
	              <br><br>
	              <span class="count"><a href="#" style="color :#115D8C;">${subscribeCount}<span class="etc">&nbsp;건</span></a></span>
	            </div>
	          </div>
	          <div class="cart">
	            <div class="sub">
		            <c:url var="clist" value="cartList.do">
						<c:param name="memberNo" value="${loginUser.memberNo}"/>
					</c:url> 
	              <span class="title"><a href="${clist}" style="color: black;">장바구니</a></span>
	              <br><br>
	              <span class="count"><a href="${clist}" style="color :#115D8C;">${cartCount}<span class="etc">&nbsp;건</span></a></span>
	            </div>
	          </div>
	          <div class="point">
	            <div class="sub">
	            	<c:url var="plist" value="pointList.do">
						<c:param name="memberNo" value="${loginUser.memberNo}"/>
					</c:url>
	              <span class="title"><a href="${plist}" style="color: black;">적립금</a></span>
	              <br><br>
	              <span class="count"><a href="${plist}" style="color :#115D8C;">${pointCount}<span class="etc">&nbsp;건</span></a></span>
	            </div>
	          </div>
	        </div>
	      </div>
	      <span class="sub_content" style="font-size: 1.5em;">적립금 내역</span>
	      <br><br><br>
	
	      <div class="pointList" style="width:80%;">
	        <table>
	          <tr>
	            <td style="width: 20%;" class="top bottom">주문일자</td>
	            <td style="width: 20%;" class="top bottom">적립금</td>
	            <td style="width: 60%;" class="top bottom">내용</td>
	          </tr>
	          <c:forEach var="p" items="${list}">
		          <tr>
		            <td>${p.subscribeDate}</td>
		            <td>${p.point}</td>
		            <td>${p.itemName}</td>
		          </tr>
	          </c:forEach>
	        </table>
	      </div>
	    </div>
    </div>
    <br style="clear:both;">
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>
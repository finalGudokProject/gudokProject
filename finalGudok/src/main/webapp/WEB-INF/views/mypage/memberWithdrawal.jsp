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
    
    /* ------------------- */
    
    .content_sub{
    	margin-bottom:18%;
    }

    .sub_content {
        float: left;
    }

    .content_sub table {
        width: auto;
        margin:0 auto;
        margin-top:2%;
    }

    .content_sub table tr {
        height: 30px;
    }

    .content_sub table button {
        background: #ffffff;
        border: 1px solid black;
        color: black;
        font-size: 0.8em;
        padding: 1%;
    }

    .content_sub table input {
        border: none;
    }

    .button {
        margin: auto;
        width: 20%;
    }

    .withdrawal_btn {
        margin-top: 10%;
        border: none;
        background: #11538C;
        color: white;
        width: 100%;
        padding: 5%;
    }

    .content_sub {
        margin-left: 15%;
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
            <span class="sub_content" style="font-size: 1.5em;">회원탈퇴</span>
            <br><br><br>
            <form action="withdrawalInsert.do" method="post">
            	<input type="hidden" value="${loginUser.memberNo}" name="memberNo">
            	<input type="hidden" value="${loginUser.memberId}" name="memberId">
            	<input type="hidden" value="${loginUser.email}" name="email">
	            <table>
	                <tr>
	                    <td style="width: 80px">탈퇴사유</td>
	                    <td>
	                        <select style="width:40%; height:30px;" name="secessionCategory">
	                            <option value="1">서비스가 마음에 들지 않음</option>
	                            <option value="2">가격이 비쌈</option>
	                            <option value="3">원하는 상품이 없음</option>
	                            <option value="4">개인정보보호를 위해</option>
	                            <option value="5">기타</option>
	                        </select>
	                    </td>
	                </tr>
	                <tr></tr>
	                <tr>
	                    <td colspan="2" name="secessionContent">
	                        <textarea cols="80" rows="10" style="resize:none;"></textarea>
	                    </td>
	                </tr>
	            </table>
	            
	            <div style="width:52%; margin:0 auto;">
	                <div class="button">
	                    <button class="withdrawal_btn">탈퇴하기</button>
	                </div>
            	</div>
            </form>
        </div>
    </div>
    <br style="clear:both;">
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>
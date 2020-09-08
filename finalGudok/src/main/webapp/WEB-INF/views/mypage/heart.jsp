<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

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
      float: left;
      width: 85%;
      text-align: center;
      margin-bottom: 10%;
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
	.sub_content {
      float: left;
      margin-left: 10%;
      margin-top: 3%;
    }

    .delete,
    .go_cart,
    .selectAll {
      border: 1px solid black;
      background: #ffffff;
      padding: 1% 2%;
      margin-top: 3%;
      float: right;
    }

    .selectAll{
      margin-right: 2%;
    }

    .delete {
      margin-right: 10%;
      margin-left: 2%;
    }

    .heart {
      float: left;
      margin-left: 10%;
      width:80%;
    }

    .heart_item {
      float:left;
      border: 1px solid #cccc;
      width: 300px;
      height: 180px;
      margin-top: 3%;
      margin-right: 3%;
    }

    .heart_item input[type="checkbox"] {
      float: left;
      margin-left: 3%;
      margin-top: 3%;
    }

    .image {
      width: 30%;
      height: auto;
      margin-top: 10%;
      overflow: hidden;
      display: flex;
      justify-content: center;
      float: left;
    }

    .image img {
      width: 100%;
      height: 120px;
    }

    .product {
      float: right;
      width: 60%;
      margin-top: 20%;
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
	      <span class="sub_content" style="font-size: 1.5em;">찜</span>
      	<button class="delete" onclick="deleteHeart();">선택삭제</button>
	    <button class="go_cart">장바구니</button>
	    <button class="selectAll">전체선택</button>
	    <br><br><br>
	    <div class="heart">
	    	
	    </div>
	  </div>
    </div>
    <br style="clear:both;">
    <jsp:include page="../common/footer.jsp"/>
    <script>
	    var clicked = false;
	    $(".selectAll").on("click", function() {
	        $(".check").prop("checked", !clicked);
	        clicked = !clicked;
	        this.innerHTML = clicked ? '전체해제' : '전체선택';
	    });
  </script>
  <script>
  	$(function(){
  		$(".go_cart").click(function(){
  	  		var confirm_val = confirm("선택하신 상품을 장바구니에 추가하시겠습니까?");
  	  		
  	  		if(confirm_val){
  	  			var checkArr = new Array();
  	  			var memberNo = $("#memberNo").val();
  	  			var memberId = $("#memberId").val();
  	  			var email = $("#email").val();
	  			
	  			$("input[class='check']:checked").each(function(){
	  				checkArr.push($(this).attr("data-itemNum"));
	  			});
	  			
	  			console.log(checkArr);
	  			
	  			$.ajax({
	  				url:"addCart.do",
	  				type:"post",
	  				data:{checkArr:checkArr, memberNo:memberNo, memberId:memberId, email:email},
	  				success:function(data){
	  					if(data == "success"){ 
	  						console.log("장바구니 추가 성공");
	  						cartAfterDelete();
						}
	  				},
  					error:function(request, status, errorData){
  	                    alert("error code: " + request.status + "\n"
  	                          +"message: " + request.responseText
  	                          +"error: " + errorData);
  					}
	  			})
  	  		}
  	  	});
  	})
  	
  	function cartAfterDelete(){
  		var checkArr = new Array();
			
		$("input[class='check']:checked").each(function(){
			checkArr.push($(this).attr("data-cartNum"))
		});
		
		$.ajax({
			url:"heartDelete.do",
			type:"post",
			data:{checkArr:checkArr},
			success:function(data){
				if(data == "success"){ 
					getHeartList();
				}
			},
			error:function(request, status, errorData){
	               alert("error code: " + request.status + "\n"
	                     +"message: " + request.responseText
	                     +"error: " + errorData);
			}
		});
  	}
  </script>
  <script>
  	$(function(){
  		getHeartList();
  	});
  	
  	function deleteHeart(){
	  		var confirm_val = confirm("정말 삭제하시겠습니까?");
	  		
	  		if(confirm_val){
	  			var checkArr = new Array();
	  			
	  			$("input[class='check']:checked").each(function(){
	  				checkArr.push($(this).attr("data-cartNum"))
	  			});
	  			
	  			$.ajax({
	  				url:"heartDelete.do",
	  				type:"post",
	  				data:{checkArr:checkArr},
	  				success:function(data){
	  					if(data == "success"){ 
	  						getHeartList();
					}
	  				},
					error:function(request, status, errorData){
	                    alert("error code: " + request.status + "\n"
	                          +"message: " + request.responseText
	                          +"error: " + errorData);
					}
	  			});
	  		}
	  	}
  	
  	function getHeartList(){
		var memberNo = ${loginUser.memberNo};
		
		$.ajax({
			url:"heartList.do",
			data:{memberNo:memberNo},
			dataType:"json",
			success:function(data){
				console.log(data);
				
				$tableBody = $(".heart");
				$tableBody.html("");
				
				var $heart_item;
				var $checkBox;
				var $imageDiv;
				var $img;
				var $product;
				var $itemName;
				var $price;
				var $won;
				
				if(data.length > 0 ){	// 댓글이 하나 이상 존재하면
					for(var i in data){
						var heartNo = parseInt(data[i].heartNo);
						var itemNo = parseInt(data[i].itemNo);
						$heart_item = $("<div class='heart_item'>");
						$checkBox = $("<input type='checkbox' class='check' name='heartNo'>").attr('data-cartNum', heartNo).attr('data-itemNum', itemNo);			
						$imageDiv = $("<div class='image'>");
<<<<<<< HEAD
						$img = $("<img src='resources/images/milk.jpg'>");
=======
						$img = $("<img src=${contextPath}/resources/uploadFiles/"+data[i].imageRename+">");
>>>>>>> refs/remotes/origin/master
						$product = $("<div class='product'>");
						$itemName = $("<span>").text(data[i].itemName);
						var str = String(data[i].itemPrice);
						var price = str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
						$price = $("<span class='price'>").text(price);
						$won = $("<span>").text("원");
						
						$heart_item.append($checkBox);
						$imageDiv.append($img);
						$heart_item.append($imageDiv);
						$product.append($itemName);
						$product.append("<br>");
						$product.append($price).append();
						$product.append($won);
						$heart_item.append($product);
						
						$tableBody.append($heart_item);
					}
				}
			},
			error:function(request, status, errorData){
                alert("error code: " + request.status + "\n"
                      +"message: " + request.responseText
                      +"error: " + errorData);
           }

		})
	}
  	
  </script>
</body>
</html>
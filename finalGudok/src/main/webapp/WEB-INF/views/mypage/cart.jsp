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
 <!-- sweetalert시작 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<!-- sweetalert끝 -->
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
    
    .myPage_Menu li span {
        display: block;
        color: #000;
        padding: 8px 16px;
        text-decoration: none;
    }

    .myPage_Menu li a {
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

    .top {
      border-top: 1px solid black;
      border-width: medium;
    }

    .bottom {
      border-bottom: 1px solid black;
    }

    .cartTable {
      margin-top: 5%;
      margin-left: 10%;
      width: 85%;
    }

    /* .cartTable tr {
      height: 45px;
    }

    .image {
      width: 100%;
      height: 100%;
      overflow: hidden;
      display: flex;
      justify-content: center;
    }

    .image img {
      float: left;
      width: 100px;
      height: 70px;
    }

    .product {
      display: inline-block;
      border: 1px solid pink;
    }

    .btn2 {
      width: 90%;
      margin-top: 5%;
      text-align: center;
      margin-left: 10%;
    }

    .btn2 button {
      border: none;
      padding: 2% 8%;
      margin-right: 10%;
      margin: 0 auto;
      margin-left: 3%;
    }

    .delete button{
      border: 1px solid black;
      background: #fff;
      padding: 0.5% 2%;
      float: left;
      margin-left: 10%;
      margin-top: 3%;
    }

    .price table{
      width: 85%;
      margin-top: 10%;
      margin-left: 10%;
    }

    .price td{
      border: 2px solid #115D8C;
    } */
    
    .basketImg{
		width:20rem;
		height:20rem;
	}
	.listChk{
		width:5%;
		height:5%;
	}
	input[type=checkbox]{
		width:30px;
		height:30px;
		display:block;
		margin:0 auto;
		
	}
	td{
		vertical-align:middle;

	}
	th{

	}
	
	input[type=button]{
		background:#6AAED9;
		color:white;
		border-radius:5px;
		padding:2%;
		width:20%;
		transition:0.5s;
	  	position:relative;
	  	border:1px solid #6AAED9;
		margin-bottom:1%;
	}
	input[type=button]:hover{
		background:#11538C;
		color:#white;
		border:1px solid #11538C;
	}
	
	input[type=button]:hover:before,input[type=button]:hover:after{
		width:100%;
		transition:0.5s;
	}
		
	.signImg{
		width:35px;
		height:35px;
	}
	
	.signImgP{
		width:35px;
		height:35px;
	}
	
	.signImgM{
		width:35px;
		height:35px;
	}
	
	
	table .countTd{
		vertical-align:middle;
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
            <c:url var="clist" value="mbasketPage.do">
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
	              <span class="title"><a href="${slist}" style="color: black;">구독</a></span>
	              <br><br>
	              <span class="count"><a href="${slist}" style="color :#115D8C;">${subscribeCount}<span class="etc">&nbsp;건</span></a></span>
	            </div>
	          </div>
	          <div class="cart">
	            <div class="sub">
	              <span class="title"><a href="${clist}" style="color: black;">장바구니</a></span>
	              <br><br>
	              <span class="count"><a href="${clist}" style="color :#115D8C;">${cartCount}<span class="etc">&nbsp;건</span></a></span>
	            </div>
	          </div>
	          <div class="point">
	            <div class="sub">
	              <span class="title"><a href="${plist}" style="color: black;">적립금</a></span>
	              <br><br>
	              <span class="count"><a href="${plist}" style="color :#115D8C;">${pointCount}<span class="etc">&nbsp;건</span></a></span>
	            </div>
	          </div>
	        </div>
	      </div>
	      <span class="sub_content" style="font-size: 1.5em;">장바구니</span>
	      <br><br>
			<c:if test="${!empty list }">
			<table style="border:1px solid black; text-align:center; padding:10%; align="center" class="cartTable">
				<thead>
				<tr style="border-bottom:1px solid lightgray; vertical-align:middle;">
					<th class="listChk"  style="width:3%;"><input type="checkbox" id="allChk"></th>
					<th style="width:7%;"><label for="chk" style="display:block;margin:0px;text-align:left;">전체선택(<span id="frontCount">0</span>/<span id="afterCount">${list.size() }</span>)</label></th>
					<th colspan="2" style="width:35%;text-align:left;">상품정보</th>
					<th style="width:18%;">수량</th>
					<th style="width:8%;">구독주기</th>
					<th style="width:19%;">상품가격</th>
				</tr>
				
				</thead>
				<tbody id="tbody">
				
				<c:forEach var="c" items="${list }" varStatus="vs">
				<fmt:formatNumber var="discountPrice" value="${(c.itemPrice - c.itemPrice*(c.itemDiscount/100)) * c.cartCount}" type="number"/>
				<fmt:formatNumber var="itemPrice" value="${c.itemPrice * c.cartCount }" type="number"/>
				<tr style="border-bottom:1px solid lightgray;vertical-align:middle;">
					<td class="listChk">
					<c:if test="${c.itemDiscount == 0 }">
					<input type="checkbox" class="chk" value="${c.itemPrice * c.cartCount}" data-cartNo="${c.cartNo }">
					</c:if>
					<c:if test="${c.itemDiscount != 0 }">
					<input type="checkbox" class="chk" value="${(c.itemPrice - c.itemPrice*(c.itemDiscount/100)) * c.cartCount}" data-cartNo="${c.cartNo }">
					<input type="hidden" class="chk" value="${c.itemPrice * c.cartCount}" data-cartNo="${c.cartNo }">
					</c:if>
					</td>
					<td colspan="2" style="width:25rem;text-align:center;">
						<img src="${contextPath }/resources/uploadFiles/${c.itemRename}" class="basketImg">
					</td>
					<td><input type="hidden" id="totalPriceInput" class="totalPriceInput" style="width:10rem;">${c.itemName }</td>
					<td class="countTd" style="width:20rem;">
						<c:if test="${c.cartCount == 1 }">
						<img src="${contextPath }/resources/images/XSIGN.png" class="signImgM" id="signM">
						</c:if>
						<c:if test="${c.cartCount != 1 }">
						<img src="${contextPath }/resources/images/minus.png" class="signImgM" id="signM">
						</c:if>
						
						<input type="hidden">
						
						<c:if test="${c.itemDiscount != 0}">
		                	<input type="hidden" value="${c.itemPrice - c.itemPrice*(c.itemDiscount/100)}">
						</c:if>
						<c:if test="${c.itemDiscount == 0}">
							<input type="hidden" value="${c.itemPrice }">
						</c:if>
						<input type="text" readonly class="amountT" value="${c.cartCount }" style="width:50px;text-align:center;">
						<img src="${contextPath }/resources/images/plus.png" class="signImgP" id="signP">
						<input type="hidden" value="${c.itemDiscount }">
					</td>
					<td style="width:10rem;">
					<c:choose>
						<c:when test="${c.cartSubs == 1 }">
							<select style="width:80px;height:30px;" name="cartSubs">
								<option value="1" selected>1주일</option>
								<option value="2">2주일</option>
								<option value="3">3주일</option>
								<option value="4">4주일</option>
							</select>
						</c:when>
						<c:when test="${c.cartSubs == 2 }">
							<select style="width:80px;height:30px;" name="cartSubs">
								<option value="1">1주일</option>
								<option value="2" selected>2주일</option>
								<option value="3">3주일</option>
								<option value="4">4주일</option>
							</select>
						</c:when>
						<c:when test="${c.cartSubs == 3 }">
							<select style="width:80px;height:30px;" name="cartSubs">
								<option value="1">1주일</option>
								<option value="2">2주일</option>
								<option value="3" selected>3주일</option>
								<option value="4">4주일</option>
							</select>
						</c:when>
						<c:otherwise>
							<select style="width:80px;height:30px;" name="cartSubs">
								<option value="1">1주일</option>
								<option value="2">2주일</option>
								<option value="3">3주일</option>
								<option value="4" selected>4주일</option>
							</select>
						</c:otherwise>
					</c:choose>
					</td>
					<td style="width:50px;">
						<c:if test="${c.itemDiscount != 0}">
		                	<s style="color:red;">${itemPrice }원</s><br>↓<br>${discountPrice }원
						</c:if>
						<c:if test="${c.itemDiscount == 0}">
							${itemPrice }원
						</c:if>
					</td>
				</tr>
				</c:forEach>
				</tbody>
				<tfoot>
				<tr>
					<td colspan="7" style="text-align:right; padding-right:3%; font-size:20px;"><span id="totalPriceTd">결제하실 상품을 선택해 주세요.</span></td>
				</tr>
				<tr id="asd">
					<td colspan="7" style="text-align:right;padding-right:3%;"><input type="button" value="장바구니 삭제하기" style="margin-right:5%;" id="delBtn"><input type="button" value="선택 상품 결제하기" id="paymentBtn"></td>
				</tr>
				</tfoot>
			</table>
			</c:if>
			<c:if test="${empty list }">
				<div class="col-8" style="margin:0 auto;">
					<div class="col-20" id="emptyDiv" style="margin-top:10%;border:1px solid lightgray;">
						<div style="text-align:center;width:100%;"><img src="${contextPath }/resources/images/empty.png" style="width:30%;"></div>
						<div style="text-align:center;width:100%;font-size:40px;">장바구니에 추가한 상품이 없습니다.</div>
					</div>
				</div>
			</c:if>
	    </div>
    </div>
    <br style="clear:both;">
    <jsp:include page="../common/footer.jsp"/>
  	<script>
		$(function(){
			function addComma(num) {
			 	var regexp = /\B(?=(\d{3})+(?!\d))/g;
				return num.toString().replace(regexp, ',');
			}
			var count = "";
			var check = "";
			var sum = 0;
			$("#allChk").on("click", function(){
				if($("#allChk").prop("checked")){
					$("input[type=checkbox]").prop("checked",true);
					check = $("input:checkbox[class=chk]:checked").length;
					$("#delBtn").val(check + "개 상품 삭제하기");
					$("#frontCount").text(check);
					$("input:checkbox[class=chk]:checked").each(function(){
						sum += Number($(this).val());
						$("#paymentBtn").val(addComma(sum)+"원 결제하기");
						$("#totalPriceTd").text("총 주문 금액 : " + addComma(sum)+"원");
					})
					console.log(sum);
				}else{
					$("input[type=checkbox]").prop("checked",false);
					check = $("input:checkbox[class=chk]:checked").length;
					$("#delBtn").val("장바구니 삭제하기");
					$("#frontCount").text("0");
					sum = 0;
					$("#paymentBtn").val("상품을 선택해 주세요.");
					$("#totalPriceTd").text("결제하실 상품을 선택해 주세요.");
					console.log(sum);
				}
			})
			$(".chk").on("click", function(){
				if($("#allChk").prop("checked")){
					$("#allChk").prop("checked",false);
				}
				if($(this).prop("checked")){
					check++;
					$("#delBtn").val(check + "개 상품 삭제하기");
					$("#frontCount").text(check);
					
					/* sum += $(this).parent().next().next().find("input").val(); */
					sum += Number($(this).val());
					$("#totalPrice").val(sum);
					$("#paymentBtn").val(addComma(sum)+"원 결제하기");
					$("#totalPriceTd").text("총 주문 금액 : " + addComma(sum)+"원");
					
					console.log(sum);
				}else{
					check--;
					sum -= Number($(this).val());
					$("#frontCount").text(check);
					if(check != 0){
						$("#delBtn").val(check + "개 상품 삭제하기");
						$("#paymentBtn").val(addComma(sum)+"원 결제하기");
						$("#totalPriceTd").text("총 주문 금액 : " + addComma(sum)+"원");
					}else{
						$("#paymentBtn").val("상품을 선택해 주세요.");
						$("#delBtn").val("장바구니 삭제하기");
						$("#totalPriceTd").text("결제하실 상품을 선택해 주세요.");
					}
					console.log(sum);
					
				}
			})
		})
	</script>
	
	
	<!-- 수량 버튼 -->
		<script>
			function addComma(num) {
			 	var regexp = /\B(?=(\d{3})+(?!\d))/g;
				return num.toString().replace(regexp, ',');
			}
			$(function(){
				$(".signImgP").on("click",function(){
					if($(this).parent().prev().prev().prev("td").find("input").prop("checked") == true){
						swal("","선택된 상태로는 수량 변경을 할 수 없습니다.","error");
					}else{
						var amount = $(this).prev().val();
						amount = Number(amount) + 1;
						console.log(amount);
						$(this).prev().val(amount);
						
						var valueCheck = $(this).prev().prev().val();
						$(this).prev().prev().prev().val("");
						var realValue = $(this).prev().prev().prev().val(valueCheck * amount);
						var varPrice = $(this).prev().prev().prev().val();
	
						$(this).parent().next("td").next("td").text("");
						$(this).parent().prev("td").find(".totalPriceInput").val(varPrice);
						$(this).parent().prev().prev().prev("td").find("input").val(varPrice);
						$(this).parent().next("td").next("td").text(addComma(varPrice)+"원");
						
						if(amount > 1){
							$(this).prev().prev().prev().prev().attr("src","${contextPath }/resources/images/minus.png");
						}
					}
				})
				$(".signImgM").on("click",function(){
					if($(this).parent().prev().prev().prev("td").find("input").prop("checked") == true){
						swal("","선택된 상태로는 수량 변경을 할 수 없습니다.","error");
					}else{
						var amount = $(this).next().next().next().val();
						if(amount > 1){
							amount = Number(amount) - 1;
							$(this).next().next().next().val(amount);
							/* console.log(amount); */
							
							var valueCheck = $(this).next().next().val();
							$(this).next().val("");
							var realValue = $(this).next().val(valueCheck * amount);
							var varPrice = $(this).next().val();
							
							$(this).parent().next("td").next("td").text("");
							$(this).parent().next("td").next("td").text(varPrice);
							$(this).parent().prev().prev().prev("td").find("input").val(varPrice);
							$(this).parent().next("td").next("td").text(addComma(varPrice)+"원");
							/* $("#totalPriceTd").text("총 주문 금액 : " + addComma(varPrice) + "원"); */
							if(amount == 1){
								$(this).attr("src","${contextPath }/resources/images/XSIGN.png");
							}
							
						}else if(amount == 1){
								swal("","1개 미만은 선택하실 수 없습니다.","error");
						}
					}
				})
			})
		</script>
		
		<!-- 장바구니 목록 삭제버튼 -->
		<script>
			$(function(){
				$("#delBtn").on("click", function(){
					var check = $("input:checkbox[class=chk]:checked").length;
					if(check == 0){
						swal("","선택된 상품이 없습니다.","error");
					}else{
						swal({
							text : check + "개의 상품을 장바구니에서 삭제하시겠습니까?",
							icon : "warning",
							buttons : ["예", "아니오"],
							closeOnEsc : false,
							dangerMode : true,
						}).then((result)=>{
							if(result){
								
							}else{
								var checkArr = new Array();
								$("input:checkbox[class='chk']:checked").each(function(){
									checkArr.push($(this).attr("data-cartNo"));
								})
								$.ajax({
									url : "basketDel.do",
									data : {checkboxArr:checkArr},
									type : "post",
									success:function(data){
										if(data == "success"){
											swal("",check+"개의 상품이 장바구니에서 삭제되었습니다.","success").then((del)=>{
												if(del){
													location.reload();
												}
											})
											
										}else{
											alert("실패");
										}
									},
									error:function(request, status, errorData){
					                	alert("error code: " + request.status + "\n"
					                	+"message: " + request.responseText
					                	+"error: " + errorData);
					               }
								})
							}
						})
					}
				})
			})	
		</script>
		<!-- 장바구니 목록 삭제버튼 끝 -->
		
		<!-- 결제하기 버튼 -->
		<script>
			$(function(){
				$("#paymentBtn").on("click", function(){
					var check = $("input:checkbox[class='chk']:checked").length;
					var pay = $("#paymentBtn").val().slice(0,-5);
					if(check == 0){
						swal("","결제하실 상품을 선택해 주세요.","error");
					}else{
						swal({
							text : check + "개의 상품 " + pay + "을 결제하시겠습니까?",
							icon : "warning",
							buttons : ["예", "아니오"],
							closeOnEsc : false,
							dangerMode : true,
						}).then((result)=>{
							if(result){
								
							}else{
								swal("","결제 페이지로","success");
							}
						})
					}
				})
			})	
		</script>
		<!-- 결제하기 버튼 끝 -->
</body>
</html>
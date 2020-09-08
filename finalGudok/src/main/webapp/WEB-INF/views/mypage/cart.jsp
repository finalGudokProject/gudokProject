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

    .cartTable tr {
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
	      <span class="sub_content" style="font-size: 1.5em;">장바구니</span>
	      <br><br><br>
	      <table class="cartTable">
	      	<thead>
	      		<tr class="cartList">
		          <td style="width: 10%" class="top bottom"><input type="checkbox" class="check_all">&nbsp;&nbsp;전체선택</td>
		          <td style="width: 45%;" colspan="2" class="top bottom">상품명</td>
		          <td style="width: 15%;" class="top bottom">주기</td>
		          <td style="width: 15%;" class="top bottom">수량</td>
		          <td style="width: 15%;" class="top bottom">주문금액</td>
		        </tr>
	      	</thead>
	        <tbody class="tbody">
	        
	        </tbody>
	      </table>
	
	      <div class="delete">
	        <button onclick="deleteCart();">선택삭제</button>
	      </div>
	
	      <div class="price" style="width: 100%; margin: 0 auto; margin-top: 10%;">
	        <table>
	          <tr style="height: 40px;">
	            <td>총 판매금액</td>
	            <td>할인금액</td>
	            <td>배송비</td>
	            <td>최종 주문금액</td>
	          </tr>
	          <tr style="height: 80px;">
	            <td><span style="font-size:1.2em" class="totalPrice"><fmt:formatNumber value="0" pattern="#,###"/></span><span>원</span></td>
	            <td><span style="font-size:1.2em">0</span><span>원</span></td>
	            <td><span style="font-size:1.2em" class="deliveryPrice">2,500</span><span>원</span></td>
	            <fmt:parseNumber var="numberType" value="${price}"/>
	            <c:set var="paymentPrice" value="${numberType + 2500}"/>
	            <td><span style="font-size:1.2em" class="paymentPrice"><fmt:formatNumber value="0" pattern="#,###"/></span><span>원</span></td>
	          </tr>
	        </table>
	      </div>
	
	      <div class="btn2">
	        <button style="border: 1px solid black; background: #fff;">선택주문하기</button>
	        <button style="background: #115D8C; color: #fff;">주문하기</button>
	      </div>
	    </div>
    </div>
    <br style="clear:both;">
    <jsp:include page="../common/footer.jsp"/>
  
  <script>
	$(function(){
		getCartList();
  	});
	
	  function deleteCart(){
			var confirm_val = confirm("정말 삭제하시겠습니까?");
			
			if(confirm_val){
				var checkArr = new Array();
				
				$("input[class='check']:checked").each(function(){
					checkArr.push($(this).attr("data-cartNum"))
				});
				
				$.ajax({
					url:"cartDelete.do",
					type:"post",
					data:{checkArr:checkArr},
					success:function(data){
						if(data == "success"){ 
							getCartList();
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
	  
	  function getCartList(){
			var memberNo = ${loginUser.memberNo};
			
			$.ajax({
				url:"cartList.do",
				data:{memberNo:memberNo},
				dataType:"json",
				success:function(data){
					console.log(data);
					
					$tableBody = $(".cartTable .tbody");
					$tableBody.html("");
					
					var $tr;
					var $td;
					var $checkbox;
					var $imageTd;
					var $imageDiv
					var $img;
					var $productTd;
					var $productSpan;
					var $cycleTd;
					var $cycleSelect;
					var $cycleOption1;
					var $cycleOption2;
					var $cycleOption3;
					var $cycleOption4;
					var $countTd;
					var $minus;
					var $amount;
					var $plus;
					var $totalPriceTd;
					var $totalPrice;
					var $won;
					
					if(data.length > 0 ){	// 댓글이 하나 이상 존재하면
						for(var i in data){
							var cartNo = parseInt(data[i].heartNo);
							
							$tr = $("<tr class='cartList'>");
							$td = $("<td class='bottom'>");
							$checkBox = $("<input type='checkbox' name='check' class='check' style='margin: auto 0;'>").attr('data-cartNum', data[i].cartNo).attr('value',data[i].itemPrice * data[i].cartCount);			
							$imageTd = $("<td style='width:15%' class='bottom'>");
							$imageDiv = $("<div class='image'>")
							$img = $("<img src=${contextPath}/resources/uploadFiles/"+data[i].imageRename+">");
							$productTd = $("<td class='bottom'>");
							$productSpan = $("<span style='float:left; margin-left: 1%;'>").text(data[i].itemName);
							$cycleTd = $("<td class='bottom'>");
							$cycleSelect = $("<select style='width:60%; height:30px'>");
							if(data[i].cartSubs == '1주'){								
								$cycleOption1 = $("<option selected>").text("1주");
								$cycleOption2 = $("<option>").text("2주");
								$cycleOption3 = $("<option>").text("3주");
								$cycleOption4 = $("<option>").text("4주");
							} else if(data[i].cartSubs == '2주'){								
								$cycleOption1 = $("<option>").text("1주");
								$cycleOption2 = $("<option selected>").text("2주");
								$cycleOption3 = $("<option>").text("3주");
								$cycleOption4 = $("<option>").text("4주");
							} else if(data[i].cartSubs == '3주'){								
								$cycleOption1 = $("<option>").text("1주");
								$cycleOption2 = $("<option>").text("2주");
								$cycleOption3 = $("<option selected>").text("3주");
								$cycleOption4 = $("<option>").text("4주");
							} else{
								$cycleOption1 = $("<option>").text("1주");
								$cycleOption2 = $("<option>").text("2주");
								$cycleOption3 = $("<option>").text("3주");
								$cycleOption4 = $("<option selected>").text("4주");
							}
							$countTd = $("<td class='bottom'>");
							$minus = $("<img class='minus' src = 'resources/images/my_minus.png' style='width: 10%; height: auto; cursor:pointer;'>");
							$amount = $("<span class='amount' style='display:inline-block; width:40px;'>").text(data[i].cartCount);
							$plus = $("<img class='plus' src='resources/images/my_plus.png' style='width: 10%; height: auto; cursor:pointer;'>");
							$totalPriceTd = $("<td class='bottom tprice'>");
							var str = String(data[i].itemPrice * data[i].cartCount);
							var price = str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
							$totalPrice = $("<span class='price' style='display: inline-block; width: 45px;'>").text(price);
							$won = $("<span>").text("원");
							
							$td.append($checkBox);
							$imageDiv.append($img);
							$imageTd.append($imageDiv);
							$productTd.append($productSpan);
							$cycleSelect.append($cycleOption1);
							$cycleSelect.append($cycleOption2);
							$cycleSelect.append($cycleOption3);
							$cycleSelect.append($cycleOption4);
							$cycleTd.append($cycleSelect);
							$countTd.append($minus);
							$countTd.append($amount);
							$countTd.append($plus);
							$totalPriceTd.append($totalPrice);
							$totalPriceTd.append($won);
							
							$tr.append($td);
							$tr.append($imageTd);
							$tr.append($productTd);
							$tr.append($cycleTd);
							$tr.append($countTd);
							$tr.append($totalPriceTd);
							
							$tableBody.append($tr);
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
  
  <script>
    	$(function(){
    		function addComma(num) {
			 	var regexp = /\B(?=(\d{3})+(?!\d))/g;
				return num.toString().replace(regexp, ',');
			}
    		
    		var sum = 0;
    		var paymentPrice = 0;
    		
    		$(".check_all").on("click", function(){
				if($(".check_all").prop("checked")){
					$("input[type=checkbox]").prop("checked",true);
					/* check = $("input:checkbox[class=check]:checked").length;
					$("#delBtn").val(check + "개 상품 삭제하기");
					$("#frontCount").text(check); */
					$("input:checkbox[class=check]:checked").each(function(){
						sum += Number($(this).val());
						
						var deliveryPrice = parseInt($('.deliveryPrice').text().replace(/\,/g, ""), 10);
						
						paymentPrice = sum + deliveryPrice;
						
						$('.totalPrice').text(addComma(sum));
						$('.paymentPrice').text(addComma(paymentPrice));
						
						console.log(sum);
					})
				}else{
					$("input[type=checkbox]").prop("checked",false);
					/* check = $("input:checkbox[class=chk]:checked").length;
					$("#delBtn").val("장바구니 삭제하기");
					$("#frontCount").text("0"); */
					sum = 0;
					var deliveryPrice = parseInt($('.deliveryPrice').text().replace(/\,/g, ""), 10);
					
					paymentPrice = sum + deliveryPrice;
					
					$('.totalPrice').text(addComma(sum));
					$('.paymentPrice').text(addComma(paymentPrice));
				}
			});
    		
    		$(document).on('click', '.check', function(){
				/* if($("#allChk").prop("checked")){
					$("#allChk").prop("checked",false);
				} */
				if($(this).prop("checked")){
					alert("체크");
					/* check++;
					$("#delBtn").val(check + "개 상품 삭제하기");
					$("#frontCount").text(check); */
					
					sum += Number($(this).val());
					
					var deliveryPrice = parseInt($('.deliveryPrice').text().replace(/\,/g, ""), 10);
					
					paymentPrice = sum + deliveryPrice;
					
					$('.totalPrice').text(addComma(sum));
					$('.paymentPrice').text(addComma(paymentPrice));
					/* $("#paymentBtn").val(addComma(sum)+"원 결제하기");
					$("#totalPriceTd").text("총 주문 금액 : " + addComma(sum)+"원"); */
				}else{
					/* check--; */
					sum -= Number($(this).val());
					paymentPrice -= Number($(this).val());
					/* $("#frontCount").text(check);
					if(check != 0){
						$("#delBtn").val("상품을 선택해 주세요.");
						$("#paymentBtn").val(addComma(sum)+"원 결제하기");
						$("#totalPriceTd").text("총 주문 금액 : " + addComma(sum)+"원");
					}else{
						$("#paymentBtn").val("상품을 선택해 주세요.");
						$("#delBtn").val(check + "개 상품 삭제하기");
						$("#totalPriceTd").text("결제하실 상품을 선택해 주세요.");
					} */
					
					$('.totalPrice').text(addComma(sum));
					$('.paymentPrice').text(addComma(paymentPrice));
				}
			});
    	})
    </script>
    
    <script>
	    $(function () {
	    	function addComma(num) {
			 	var regexp = /\B(?=(\d{3})+(?!\d))/g;
				return num.toString().replace(regexp, ',');
			}
	    	
	    	$(document).on('click', '.minus', function(e){
		        e.preventDefault();
		        var stat = $(this).siblings('.amount').text();
		        var num = parseInt(stat, 10);
		        var currentPrice = $(this).parent('td').next('td').children('.price').text();
		        var price = parseInt(currentPrice.replace(/\,/g, ""), 10);
		        var itemPrice = price / num;
		        var deliveryPrice = parseInt($('.deliveryPrice').text().replace(/\,/g, ""), 10);
		        
		        num--;
		
		        if (num <= 0) {
		          alert('주문 최소 수량은 1개입니다.');
		          num = 1;
		        }
				
		        var totalPrice = itemPrice * num;
	
		        $(this).siblings('.amount').text(num);
		        $(this).parent('td').next('td').children('.price').text(addComma(totalPrice));
		        $(this).parent().prev().prev().prev().prev().children('.check').val(totalPrice);
	
		      });
			
	    	$(document).on('click', '.plus', function(e){
		        e.preventDefault();
		        var stat = $(this).siblings('.amount').text();
		        var num = parseInt(stat, 10);
		        var currentPrice = $(this).parent('td').next('td').children('.price').text();
		        var price = parseInt(currentPrice.replace(/\,/g, ""), 10);
		        var itemPrice = price / num;
		        var deliveryPrice = parseInt($('.deliveryPrice').text().replace(/\,/g, ""), 10);
		        
		        num++;
		        
		        var totalPrice = itemPrice * num;
	
		        $(this).siblings('.amount').text(num);
		        $(this).parent('td').next('td').children('.price').text(addComma(totalPrice));
		        $(this).parent().prev().prev().prev().prev().children('.check').val(totalPrice);
	
		   });
	    });
  </script>

</body>
</html>
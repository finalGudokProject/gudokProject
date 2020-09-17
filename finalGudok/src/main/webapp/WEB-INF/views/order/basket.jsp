<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	 <!-- sweetalert시작 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	<!-- sweetalert끝 -->
<style>
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
		font-size:20px;
	}
	th{
		font-size:20px;
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
<body>
	<jsp:include page="../common/menubar.jsp"/>


		
		<div style="padding-left:12%;">
			<img src="${contextPath }/resources/images/basketImg.png" style="width:7%;height:7%;">
			<span style="vertical-align:middle;font-size:50px;"><b>장바구니</b></span>
		</div>
	<div class="container">
		<div class="row" style="text-align:center;">
			<c:if test="${!empty list }">
			<table style="border:1px solid black; text-align:center; padding:10%; width:100%;margin-bottom:2%;" align="center">
				<thead>
				<tr style="border-bottom:1px solid lightgray; vertical-align:middle;">
					<th class="listChk"  style="width:3%;"><input type="checkbox" id="allChk"></th>
					<th style="width:7%;">
						<label for="chk" style="display:block;margin:0px;text-align:left;">
							전체선택(<span id="frontCount">0</span>/<span id="afterCount">${list.size() }</span>)
						</label>
					</th>
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
					<input type="hidden" class="iName" value="${c.itemName }">
					<input type="hidden" class="no" value="${c.itemNo }">
					<input type="hidden" class="cartArr" value="${contextPath }/resources/uploadFiles/${c.itemRename }">
					<td class="listChk">
					
					<!-- 해당 상품에 할인율이 없다면 -->
					<c:if test="${c.itemDiscount == 0 }">
					<input type="checkbox" class="chk" value="${c.itemPrice * c.cartCount}" data-cartNo="${c.cartNo }">
					</c:if>
					<!-- 해당 상품에 할인율이 있다면 -->
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
						
						<!-- 상품 수량에 따른 상품 가격(할인율이 존재한다면 반영해서)이 들어갈 input -->
						<input type="hidden">
						
						<!-- 상품 가격 체크(할인율 여부) -->
						<c:if test="${c.itemDiscount != 0}">
		                	<input type="hidden" value="${c.itemPrice - c.itemPrice*(c.itemDiscount/100)}">
						</c:if>
						<c:if test="${c.itemDiscount == 0}">
							<input type="hidden" value="${c.itemPrice }">
						</c:if>
						
						<input type="text" readonly class="amountT" value="${c.cartCount }" style="width:50px;text-align:center;">
						<img src="${contextPath }/resources/images/plus.png" class="signImgP" id="signP">
						<input type="hidden" value="${c.itemDiscount }" class="discount">
						<input type="hidden" value="${c.itemPrice }" class="price">
					</td>
					<td style="width:10rem;">
					<c:choose>
						<c:when test="${c.cartSubs == 1 }">
							<select style="width:80px;height:30px;" name="cartSubs" class="cartSubs">
								<option value="1" selected>1주일</option>
								<option value="2">2주일</option>
								<option value="3">3주일</option>
								<option value="4">4주일</option>
							</select>
						</c:when>
						<c:when test="${c.cartSubs == 2 }">
							<select style="width:80px;height:30px;" name="cartSubs" class="cartSubs">
								<option value="1">1주일</option>
								<option value="2" selected>2주일</option>
								<option value="3">3주일</option>
								<option value="4">4주일</option>
							</select>
						</c:when>
						<c:when test="${c.cartSubs == 3 }">
							<select style="width:80px;height:30px;" name="cartSubs" class="cartSubs">
								<option value="1">1주일</option>
								<option value="2">2주일</option>
								<option value="3" selected>3주일</option>
								<option value="4">4주일</option>
							</select>
						</c:when>
						<c:otherwise>
							<select style="width:80px;height:30px;" name="cartSubs" class="cartSubs">
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
					<td colspan="7" style="text-align:right; padding-right:3%; font-size:40px;"><span id="totalPriceTd">결제하실 상품을 선택해 주세요.</span></td>
				</tr>
				<tr id="asd">
					<td colspan="7" style="text-align:right;padding-right:3%;"><input type="button" value="장바구니 삭제하기" style="margin-right:5%;" id="delBtn"><input type="button" value="선택 상품 결제하기" id="paymentBtn"></td>
				</tr>
				</tfoot>
			</table>
			</c:if>
			<c:if test="${empty list }">
				<div class="col-2"></div>
					<div class="col-8" id="emptyDiv" style="margin:2% 0 2% 0;border:1px solid lightgray;">
						<div style="text-align:center;width:100%;"><img src="${contextPath }/resources/images/empty.png" style="width:30%;"></div>
						<div style="text-align:center;width:100%;font-size:40px;">장바구니에 추가한 상품이 없습니다.</div>
					</div>
				<div class="col-2"></div>	
			</c:if>
		</div>
	</div>	<!-- 컨테이너 끝 -->
	
	<!-- input[type=checkbox] -->
	<script>
		$(function(){
			
			/* 3번째 자리마다 컴마를 찍어주는 이벤트 */
			function addComma(num) {
			 	var regexp = /\B(?=(\d{3})+(?!\d))/g;
				return num.toString().replace(regexp, ',');
			}
			
			/* 해당 상품 수량 */
			var count = "";
			/* 해당 상품 input[type=checkbox] 체크 여부 */
			var check = "";
			/* 해당 상품 총 가격(할인율 적용) */
			var sum = 0;
			
			/* 전체 선택 버튼 클릭 시 */
			$("#allChk").on("click", function(){
				
				/* 전체 선택이 선택되어 있다면 */
				if($("#allChk").prop("checked")){
					
					/* 모든 checkbox를 선택하고 */
					$("input[type=checkbox]").prop("checked",true);
					
					/* check에 선택된 갯수를 담는다. */
					check = $("input:checkbox[class=chk]:checked").length;
					$("#delBtn").val(check + "개 상품 삭제하기");
					
					/* 전체선택(front/back) front 부분 */
					$("#frontCount").text(check);
					
					/* 선택되어 있지 않은 가격을 초기화 시키고 */
					sum = 0;
					
					/* 선택된 값만 sum에 담는다. */
					$("input:checkbox[class=chk]:checked").each(function(){
						sum += Number($(this).val());
						$("#paymentBtn").val(addComma(sum)+"원 결제하기");
						$("#totalPriceTd").text("총 주문 금액 : " + addComma(sum)+"원");
					})
					console.log(sum);
				
				/* 전체 선택이 선택되어 있지 않다면 */
				}else{
					
					/* 모든 checkbox를 선택 해제하고 */
					$("input[type=checkbox]").prop("checked",false);
					check = $("input:checkbox[class=chk]:checked").length;
					
					/* 관련된 버튼의 값과 front의 값을 바꾸고 sum을 초기화 한다. */
					$("#delBtn").val("장바구니 삭제하기");
					$("#frontCount").text("0");
					sum = 0;
					$("#paymentBtn").val("상품을 선택해 주세요.");
					$("#totalPriceTd").text("결제하실 상품을 선택해 주세요.");
					console.log(sum);
				}
			})
			
			/* 전체 선택이 아닌 개별로 선택하는 경우 */
			$(".chk").on("click", function(){
				if($("#allChk").prop("checked")){
					$("#allChk").prop("checked",false);
				}
				
				/* 개별 선택되었다면 */
				if($(this).prop("checked")){
					check++;
					$("#delBtn").val(check + "개 상품 삭제하기");
					$("#frontCount").text(check);
					
					/* sum += $(this).parent().next().next().find("input").val(); */
					
					/* 선택된 checkbox의 값을 sum에 더한다. */
					sum += Number($(this).val());
					$("#totalPrice").val(sum);
					$("#paymentBtn").val(addComma(sum)+"원 결제하기");
					$("#totalPriceTd").text("총 주문 금액 : " + addComma(sum)+"원");
					
					console.log(sum);
					
				/* 개별 선택 해제되었다면 */
				}else{
					check--;
					
					/* 해제된 checkbox의 값을 sum에서 빼고 */
					sum -= Number($(this).val());
					$("#frontCount").text(check);
					
					/* 선택된 상품이 남아있다면 */
					if(check != 0){
						$("#delBtn").val(check + "개 상품 삭제하기");
						$("#paymentBtn").val(addComma(sum)+"원 결제하기");
						$("#totalPriceTd").text("총 주문 금액 : " + addComma(sum)+"원");
					
					/* 선택된 상품이 남아있지 않다면 */
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
			/* 3번째 자리마다 컴마를 찍어주는 이벤트 */
			function addComma(num) {
			 	var regexp = /\B(?=(\d{3})+(?!\d))/g;
				return num.toString().replace(regexp, ',');
			}
			
			$(function(){
				
				/* + 이미지 클릭 시 */
				$(".signImgP").on("click",function(){
					
					/* checkbox가 선택되어 있다면 */
					if($(this).parent().prev().prev().prev("td").find("input").prop("checked") == true){
						swal({ text : "선택된 상태로는 수량 변경을 할 수 없습니다.", icon : "error", closeOnClickOutside: false,});
					
					/* checkbox가 선택되어 있지 않다면 */
					}else{
						
						/* amount에 현재 수량 input의 값을 담고 */
						var amount = $(this).prev().val();
						/* 1을 더해서 다시 input에 담는다. */
						amount = Number(amount) + 1;
						console.log(amount);
						$(this).prev().val(amount);
						
						/* 상품 가격을 변수에 담고(할인율이 있다면 적용해서) */
						var valueCheck = $(this).prev().prev().val();
						/* 초기화한다. */
						$(this).prev().prev().prev().val("");
						
						/* 다시 realValue에 상품가격*수량의 값을 담는다. */
						var realValue = $(this).prev().prev().prev().val(valueCheck * amount);
						var varPrice = $(this).prev().prev().prev().val();
						
						/* 상품 가격이 적혀있는 td를 초기화하고 */
						$(this).parent().next("td").next("td").text("");
						$(this).parent().prev("td").find(".totalPriceInput").val(varPrice);
						$(this).parent().prev().prev().prev("td").find("input").val(varPrice);
						/* 컴마를 추가한 가격을 td에 넣는다. */
						$(this).parent().next("td").next("td").text(addComma(varPrice)+"원");
						
						if(amount > 1){
							$(this).prev().prev().prev().prev().attr("src","${contextPath }/resources/images/minus.png");
						}
					}
				})
				
				/* - 이미지 클릭 시 */
				$(".signImgM").on("click",function(){
					
					/* checkbox가 선택되어 있다면 */
					if($(this).parent().prev().prev().prev("td").find("input").prop("checked") == true){
						swal({ text : "선택된 상태로는 수량 변경을 할 수 없습니다.", icon : "error", closeOnClickOutside: false,});
						
					/* checkbox가 선택되어 있지 않다면 */	
					}else{
						
						/* amount에 현재 수량 input의 값을 담고 */
						var amount = $(this).next().next().next().val();
						
						/* amount가 1이상이라면 */
						if(amount > 1){
							
							/* 1을 빼서 다시 input에 담는다. */
							amount = Number(amount) - 1;
							$(this).next().next().next().val(amount);
							/* console.log(amount); */
							
							/* 상품 가격을 변수에 담고(할인율이 있다면 적용해서) */
							var valueCheck = $(this).next().next().val();
							/* 초기화한다. */
							$(this).next().val("");
							
							/* 다시 realValue에 상품가격*수량의 값을 담는다. */
							var realValue = $(this).next().val(valueCheck * amount);
							var varPrice = $(this).next().val();
							
							/* 상품 가격이 적혀있는 td를 초기화하고 */
							$(this).parent().next("td").next("td").text("");
							$(this).parent().next("td").next("td").text(varPrice);
							$(this).parent().prev().prev().prev("td").find("input").val(varPrice);
							/* 컴마를 추가한 가격을 td에 넣는다. */
							$(this).parent().next("td").next("td").text(addComma(varPrice)+"원");
							/* $("#totalPriceTd").text("총 주문 금액 : " + addComma(varPrice) + "원"); */
							if(amount == 1){
								$(this).attr("src","${contextPath }/resources/images/XSIGN.png");
							}
							
						}else if(amount == 1){
							swal({ text : "1개 미만은 선택하실 수 없습니다.", icon : "error", closeOnClickOutside: false,});
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
						swal({ text : "선택된 상품이 없습니다.", icon : "error", closeOnClickOutside: false,});
					}else{
						swal({
							text : check + "개의 상품을 장바구니에서 삭제하시겠습니까?",
							icon : "warning",
							buttons : ["예", "아니오"],
							closeOnEsc : false,
							closeOnClickOutside: false,
							dangerMode : true,
						}).then((result)=>{
							if(result){
								
							}else{
								
								/* 선택된 상품을 ArrayList로 담는다.(2개이상일 경우도 있기 때문에) */
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
											swal({ text : check+"개의 상품이 장바구니에서 삭제되었습니다.", icon : "success", closeOnClickOutside: false,}).then((del)=>{
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
					
					var itemNo = new Array();
					var price = new Array();
					var amount = new Array();
					var name = new Array();
					var cycle = new Array();
					var discount = new Array();
					var imageArr = new Array();
					
					var checkItem = $(".chk"); //체크박스 다 가져옴
					
					$(checkItem).each(function(){
						if($(this).is(":checked")){
							/* var itemNo = $(this).parent().parent().find(".no").val(); */
							/* var name = $(this).parent().parent().find(".iName").val();
							var price = $(this).parent().next().next().next().find(".price").val();
							var discount = $(this).parent().next().next().next().find(".discount").val();
							var cycle = $(this).parent().next().next().next().next().find("select[name=cartSubs]").val();
							var amount = $(this).parent().next().next().next().find(".amountT").val(); */
							
							itemNo.push($(this).parent().parent().find(".no").val());
							name.push($(this).parent().parent().find(".iName").val());
							price.push($(this).parent().next().next().next().find(".price").val());
							discount.push($(this).parent().next().next().next().find(".discount").val());
							cycle.push($(this).parent().next().next().next().next().find("select[name=cartSubs]").val());
							amount.push($(this).parent().next().next().next().find(".amountT").val());
							imageArr.push($(this).parent().parent().find(".cartArr").val());
							
						}
					})
						/* alert("번호 " + itemNo);
						alert("이름 " + name);
						alert("가격 " + price);
						alert("할인률 " + discount);
						alert("주기" + cycle);
						alert("수량" + amount); */
					
					var check = $("input:checkbox[class='chk']:checked").length;
					var pay = $("#paymentBtn").val().slice(0,-5);
					if(check == 0){
						swal({ text : "결제하실 상품을 선택해 주세요.", icon : "error", closeOnClickOutside: false,});
					}else{
						swal({
							text : check + "개의 상품 " + pay + "을 결제하시겠습니까?",
							icon : "warning",
							buttons : ["예", "아니오"],
							closeOnEsc : false,
							closeOnClickOutside: false,
							dangerMode : true,
						}).then((result)=>{
							if(result){
								
							}else{
								
								var form = document.createElement('form');
								form.setAttribute('method', 'post');
								form.setAttribute('action', "moveToPayment.do");
								document.charset = "utf-8";
								params = {"price":price, "name":name, "cycle":cycle, "amount":amount,
										"itemNo":itemNo, "discount":discount, "image":imageArr};
								
								for ( var key in params) {
									var hiddenField = document.createElement('input');
									hiddenField.setAttribute('type', 'hidden');
									hiddenField.setAttribute('name', key);
									hiddenField.setAttribute('value', params[key]);
									form.appendChild(hiddenField);

								}
								document.body.appendChild(form);
								form.submit();
								
							}
						})
					}
				})
			})	
		</script>
		<!-- 결제하기 버튼 끝 -->
		
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>
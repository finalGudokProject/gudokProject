<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <title>결제페이지</title>
    <style>
        /*폰트 적용*/
        body {
            font-family: 'Jua', sans-serif;
        }

        .vl {
            border: 1px solid #495057;
            height: 480px;
            margin-left: 30px;
            margin-right: 30px;
        }

        #paymentInfo {
            margin-bottom: 50px;
        }

        #paymentInfo>div {
            display: inline-block;
            vertical-align: baseline;
        }

        td {
            padding: 5px;
        }
        
        /* tr:nth-child(1) {
            text-align: center;
        } */
        
        #payBtn{
        	margin-right:10px;
        }
        
        #goBackBtn{
        	margin-left:10px;
        	margin-right:10px;
        }

        h2 {
            color: black;
            margin-top: 50px;
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>

<body>
	<header>
    <jsp:include page="../common/menubar.jsp" />
    </header>

    <section>
        <div id="titleDiv">
            <h2 align="center">결제 페이지</h2>
        </div>
        <div id="paymentInfo" align="center">
            <div id="customerInfo">
                <table id="customerTable" width="500" height="500">
                    <tr>
                        <td colspan="3" align="center">
                            <h4>배송정보</h4>
                        </td>
                    </tr>
                    <tr>
                        <td>받는 사람</td>
                        <td>${loginUser.memberName }
                        <input type="hidden" id="memberNo" value="${loginUser.memberNo }">
                        </td>
                        <td><button class="btn">수정하기</button>
                    </tr>
                    <tr>
                        <td>연락처</td>
                        <td colspan="2"><input type="tel" placeholder="연락처를 입력하세요" id="phone"></td>
                    </tr>
                    <tr>
                        <td>주소</td>
                        <td>${loginUser.address2 }<br>${loginUser.address3 }</td>
                        <td><button type="button" class="btn">주소 변경</button></td>
                    </tr>
                    <tr>
                        <td>배송 요청사항</td>
                        <td colspan="2">
                            <select name="deliveryReq" id="deliveryReq">
                                <option value="0">--</option>
                                <option value="1"></option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="vl"></div>
            
            <div id="itemInfo">
            	
                <table id="itemTable" width="500" height="500">
                    <tr>
                        <td colspan="5" align="center">
                            <h4>주문상품</h4>
                            
                        </td>
                    </tr>
                    <tr>
                    	<td><img src=""></td>
                   		<td>상품명</td>
                     	<td>수량</td>
                        <td>구독주기</td>
                        <td>주문금액</td>
                    </tr>
                    <c:forEach items="${list }" var="iList" >
            		<c:if test="${!empty list}">
                    <tr>
                    	<td><img src="${contextPath }/resources/images/logo.png" width=100 height=100></td>
                    	<td id="name">${iList.itemName }</td>
                    	<td id="itemAmount">${iList.cartCount } 개</td>
                    	<td>${iList.cartSubs } 주</td>
                    	<td>${iList.itemPrice * iList.cartCount } 원</td>
                    </tr>
                  		 
                    </c:if>
                	</c:forEach>
                	<tr>
                		<td>적립금</td>
                		<td>${loginUser.point } 원</td>
                		<td>사용금액</td>
                		<td colspan="2"><input type="text" id="usePoint"></td>
					</tr>
					<tr>
						<td colspan="4">배송비</td>
						<td>무료</td>
					</tr>
                    <tr>
                    	<td colspan="4">최종결제금액</td>
                        <td id="checkPrice">${totalPrice } 원</td>
                    </tr>
                    <tr>
                        <td colspan="5" rowspan="2" align="center">
                        	<input id="customerUid" type="hidden" value="${loginUser.memberId }">
                            <button type="submit" class="btn" id="payBtn" onclick="requestPay();">결제하기</button>
                            <button type="button" class="btn" id="goBackBtn">이전으로</button>
                        </td>
                    </tr>
                </table>
                
            </div>
        </div>

    </section>

    <footer>
        <jsp:include page="../common/footer.jsp" />
    </footer>
  
    <script>
		function requestPay(){
		var IMP = window.IMP; // 생략해도 괜찮습니다.
		var customerUid = "${loginUser.memberId}" + new Date().getTime();	//카드와 1:1로 대응되는 아이디
		var email = "${loginUser.email}";
		var phone = $("#phone").val();
		var name = "${loginUser.memberName}";
		var memberNo = "${loginUser.memberNo}";
		var point = $("#usePoint").val();
		
		var nameArr = new Array();
		var noArr = new Array();
    	var priceArr = new Array();
    	var countArr = new Array();
    	var cycleArr = new Array();
    	
    	var finalPrice = $("#checkPrice").html().slice(0,-2);
    	
    	<c:forEach items="${list}" var="i">
    		noArr.push("${i.itemNo}");
    		nameArr.push("${i.itemName}");
    		priceArr.push("${i.itemPrice}");
    		countArr.push("${i.cartCount}");
    		cycleArr.push("${i.cartSubs}");
  		</c:forEach>
  		/* alert(noArr);
  		alert(nameArr);
  		alert(priceArr);
  		alert(countArr);
  		alert(cycleArr); */
  		
  		var billingPrice = $("#checkPrice").html().slice(0,-2);	// 결제 전 보여지는 최종 가격
  		
  		
		IMP.init("imp38859026"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
		
		// IMP.request_pay(param, callback) 호출
		  IMP.request_pay({ // param
			  	pg : "html5_inicis.INIBillTst", // 실제 계약 후에는 실제 상점아이디로 변경
				pay_method : 'card', // 'card'만 지원됩니다.
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '결제',
				amount : billingPrice, // 결제창에 표시될 금액. 실제 승인이 이뤄지지는 않습니다. (모바일에서는 가격이 표시되지 않음)
				customer_uid : customerUid, //customer_uid 파라메터가 있어야 빌링키 발급을 시도합니다.
				buyer_email : email,
				buyer_name : name,
				buyer_tel : phone
		  }, function (rsp) { // callback
		    if (rsp.success) {
		    	alert("빌링키 발급 성공")
		    	
		    	jQuery.ajax({
		            url: "payment.do", // 서비스 웹서버
		            method: "POST",
		            traditional:true,
		            data:{nameArr:nameArr, priceArr:priceArr, countArr:countArr, cycleArr:cycleArr, customerUid:customerUid,
		            	email:email, phone:phone, memberNo:memberNo, finalPrice:finalPrice, noArr:noArr, point:point},
		            success: function(data){
		            	if(data == "success"){
		            		alert("결제가 완료되었습니다.");
		            		location.href="home.do";
		            	}
		            },
		            error : function(request, status, errorData) {
						alert("error code: " + request.status
								+ "\n" + "message: "
								+ request.responseText + "error: "
								+ errorData);
					}
		          });
		    } else {
		    	alert("빌링키 발급 실패");
		    }
		  });
		}

	</script>
	
	<script>
		$(function(){
			$("#usePoint").on("keyup", function(){
				var point = Number($("#usePoint").val());	// point
				var checkPrice = "${totalPrice}";	// 합계
				
				if(point > 5000 && point <= checkPrice){
					var totalPrice = checkPrice - point;
					$("#checkPrice").html(totalPrice+"원");
					
				}else{
					alert("보유하신 적립금 이상으로 사용하실 수 없습니다.");
					$("#usePoint").val("");
					$("#checkPrice").html("${totalPrice}"+"원");
				}
				
			});
		})
	
	</script>
	
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js" ></script>
  	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</body>

</html>
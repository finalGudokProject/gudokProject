<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <title>주문 상세 내역</title>    
    <style>


#td1{
    width:15%;
    vertical-align: middle;
}
#td2{
    width:35%;
    vertical-align: middle;
}
#td3{
    width:15%;
    vertical-align: middle;
}
#td4{
    width:35%;
    vertical-align: middle;
}

input, select,textarea{
    border: 1px solid #CCCCCC;
}

        #count{
            margin:5px;
        }
</style>


</head>
    <body>
    <jsp:include page="../common/adminMenubar.jsp"/>
        <div class="content">
            <div class="container box">
                <h3>구독 상품 상세보기</h3>
                <br>
                <br><br>
					<form>
		                    <input type="hidden" id="page" name="page" value="${page }">
		                    <input type="hidden" id="type" name="type" value="${type }">
		                    <input type="hidden" id="subscribeNo" name="subscribeNo" value="${sc.subscribeNo }">
					</form>
                    <table style="background-color:#CFD8DC;">
                        <tr>
                            <td style="width:25%">구독 취소 여부</td>
                            <td style="width:25%">
                            	<c:if test="${sc.subscribeStatus eq 'Y' }">
	                            	<b>※ 구독 취소</b>
	                            </c:if>
	                            <c:if test="${sc.subscribeStatus eq 'N' }">
	                            	<b>※ 해당 없음</b>
	                            </c:if>
                            </td>
                            <td style="width:25%">배송 상태</td>
                            <td style="width:25%">
                            	<c:if test="${sc.deliveryStatus eq 'N' }">
	                            	<b>※ 배송 대기</b>
	                            </c:if>
	                            <c:if test="${sc.deliveryStatus eq 'D' }">
	                            	<b>※ 배송중</b>
	                            </c:if>
	                            <c:if test="${sc.deliveryStatus eq 'Y' }">
	                            	<b>※ 배송 완료</b>
	                            </c:if>
                            </td>
                        </tr>
                    </table>
            
                    <!--주문 상품 리스트-->
                    <table>
                        <tr>
                            <td>구독 번호</td>
                            <td><input type="text" name="subscribeNo" value="${sc.subscribeNo }" readonly></td>
                            <td>주문 일자</td>
                            <td><input type="text" name="paymentDate" value="${p.paymentDate }" readonly></td>
                        </tr>
                        <tr>
                            <td>상품명</td>
                            <td colspan="3"><input type="text" name="itemName" value="${sc.itemName }" readonly style="width:87%"></td>
                           
                        </tr>
            
                        <tr>
                            <td>주문 수량</td>
                            <td><input type="text" name="amount" readonly value="${sc.amount }"></td>
                            <td>가격</td>
                            <td><input type="text" name="purchase" readonly value="${sc.itemPrice }"></td>
                        </tr>
                         <tr>
	                       <td rowspan="3" style="width:15%">주소</td>
							<td colspan="3"><label style="float:left; width:180px;">우편번호</label>
								<input type="text" name="address1" class="postcodify_postcode5" value="${sc.address1 }" id="address1" style="float:left;">
			
							</td>
						</tr>
						<tr>
							<td colspan="3"><label style="float:left; width:180px;">도로명 주소</label>
							<input type="text" name="address2" class="postcodify_address" value="${sc.address2 }" id="address2"style="float:left;width:70%;"></td>
				
						</tr>
						<tr>
							<td colspan="3"><label style="float:left;  width:180px;">상세 주소</label>
							<input type="text" name="address3" class="postcodify_extra_info" value="${sc.address3 }" id="address3"style="float:left;width:70%;">
							
							
						</tr>
                        <tr>
                            <td>구독 시작 날짜</td>
                            <td><input type="text" name="subscribeDate" readonly value="${sc.subscribeDate }"></td>
                            <td>구독 주기</td>
                            <c:if test="${sc.cycleNo eq 1 }">
                            	<td><input type="text" name="out" readonly value="1주"></td>
                            </c:if>
                            <c:if test="${sc.cycleNo eq 2 }">
                            	<td><input type="text" name="out" readonly value="2주"></td>
                            </c:if>
                              <c:if test="${sc.cycleNo eq 3 }">
                            	<td><input type="text" name="out" readonly value="3주"></td>
                            </c:if>
                              <c:if test="${sc.cycleNo eq 4 }">
                            	<td><input type="text" name="out" readonly value="4주"></td>
                            </c:if>
                        </tr>
                       
                    </table>

                    <br>
                    <br>
                    <br>


                   

                    <!--결제 금액 계산-->
                    <div style="width:100%; text-align:right;">
                        <div id="count">총 금액 : <input type="text" readonly value="${total }"></div>
                        <div id="count">- 할인 금액  (포인트 사용) : <input type="text" readonly value="${p.point }"></div>
                        <div id="count">배송비 : <input type="text" readonly></div>
                    </div>
                    <div style="width:400px; float:right;"><b><hr></b></div><br>
                    <div style="width:100%; text-align:right;">
                       <br>
                       
                        <div>총 결제 금액 : <input type="text" readonly  value="${p.totalPayment }"></div>
                    </div>

                    <br>

                   <br>
                   <br>
                    <br>
                   <br>

                   <div style="text-align:center">
                   <input type="button" class="btn" value="목록으로" onclick="goList()">
                   <input type="button" class="btn" value="구독취소" onclick="updateS()">
                </div>



            </div><!--내용담은 컨테이너-->
        </div><!--250px띄운 div-->
        
        
        <script>
        	
        	function goList(){
        		
        		var type=$("#type").val();
        	  	var page=${page }
        	  	alert(type);
        	  	
        	  	if(type=="order"){
           			location.href="oList.do?page="+page; 
        	  	}else{
        	  		location.href="exchangList.do?page="+page; 
        	  	}
        		 
        	}
        	
        	
        	function updateS(){
        		var page=${page }
        	 	var subscribeNo=${sc.subscribeNo}
        	 	alert(subscribeNo);
        	 	location.href="updateSubscribe.do?page="+page+"&subscribeNo="+subscribeNo; 
        		
        	}
        
        
        
        </script>
        
       <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>
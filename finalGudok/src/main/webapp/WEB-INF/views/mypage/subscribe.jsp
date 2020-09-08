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

<link href='<%=request.getContextPath()%>/resources/css/main.css' rel='stylesheet' />
<script src='<%=request.getContextPath()%>/resources/js/main.js'></script>
<script src='<%=request.getContextPath()%>/resources/js/moment.js'></script>
<script src='<%=request.getContextPath()%>/resources/js/ko.js'></script>

<!-- rrule lib -->
<script src='https://cdn.jsdelivr.net/npm/rrule@2.6.4/dist/es5/rrule.min.js'></script>

<!-- fullcalendar bundle -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.2.0/main.min.js'></script>

<!-- the rrule-to-fullcalendar connector. must go AFTER the rrule lib -->
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/rrule@5.2.0/main.global.min.js'></script>

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

    .subscribe_list {
      margin-top: 5%;
      margin-left: 10%;
    }

    .subscribe_list table {
      width: 100%;
    }

    .subscribe_list table tr {
      height: 45px;
    }

    .subscribe_list table button {
      border: 1px solid black;
      background: #fff;
      padding: 1% 10%;
      margin-right: 3%;
    }

    /* 모달 */
    .panel {
      background-color: #444;
      height: 34px;
      padding: 10px;
    }

    a#cycle_pop {
      border: 1px solid black;
      color: black;
      display: block;
      margin-right: 3%;
      text-decoration: none;
      width: 40%;
      margin: 0 auto;
      height: 35px;
      line-height:35px;
    }

    a#cycle_pop:hover {
      border-color: rgb(155, 150, 150);
    }

    a#cancle_pop {
      border: 1px solid black;
      color: black;
      display: block;
      margin-right: 3%;
      text-decoration: none;
      width: 60%;
      margin: 0 auto;
      height: 35px;
      line-height:35px;
    }

    a#cancle_pop:hover {
      border-color: rgb(155, 150, 150);
    }

    .overlay {
      background-color: rgba(0, 0, 0, 0.6);
      bottom: 0;
      cursor: default;
      left: 0;
      opacity: 0;
      position: fixed;
      right: 0;
      top: 0;
      visibility: hidden;
      z-index: 1;

      -webkit-transition: opacity .5s;
      -moz-transition: opacity .5s;
      -ms-transition: opacity .5s;
      -o-transition: opacity .5s;
      transition: opacity .5s;
    }

    .overlay:target {
      visibility: visible;
      opacity: 1;
    }

    .popup {
      background-color: #fff;
      border: 3px solid #fff;
      display: inline-block;
      left: 50%;
      opacity: 0;
      padding: 15px;
      position: fixed;
      text-align: justify;
      top: 40%;
      visibility: hidden;
      z-index: 10;

      -webkit-transform: translate(-50%, -50%);
      -moz-transform: translate(-50%, -50%);
      -ms-transform: translate(-50%, -50%);
      -o-transform: translate(-50%, -50%);
      transform: translate(-50%, -50%);

      -webkit-transition: opacity .5s, top .5s;
      -moz-transition: opacity .5s, top .5s;
      -ms-transition: opacity .5s, top .5s;
      -o-transition: opacity .5s, top .5s;
      transition: opacity .5s, top .5s;
    }

    .overlay:target+.popup {
      top: 50%;
      opacity: 1;
      visibility: visible;
    }

    .close {
      height: 30px;
      line-height: 30px;
      position: absolute;
      right: 0;
      text-align: center;
      text-decoration: none;
      top: 10px;
      right: 10px;
      width: 30px;
    }

    .close:before {
      color: black;
      content: "X";
      font-size: 24px;
      text-shadow: 0 -1px rgba(0, 0, 0, 0.9);
    }

    .popup p,
    .popup div {
      margin-bottom: 10px;
    }

    .popup label {
      display: inline-block;
      text-align: left;
      width: 120px;
    }

    .popup table tr {
      height: 40px;
    }

    .popup button {
      border: none;
      background: #11538C;
      color: white;
      padding: 1% 10%;
      text-align: center;
    }
    
    #calendar{
    	width:1000px;
    	margin:0 auto;
    	margin-top:50px;
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
	      
	      <div id="calendar" class="royal-navy"></div>

		<script>
		
			var myEvents=[];

			$(function(){
				myEvents = subscribeList();
			});
		     
			 document.addEventListener('DOMContentLoaded', function() {
				 
			    var calendarEl = document.getElementById('calendar');

			    var calendar = new FullCalendar.Calendar(calendarEl, {
			      	initialDate: '2020-09-12',
			      	locale: 'ko',
			      	editable: true,
			      	selectable: true,
			      	businessHours: true,
			      	dayMaxEvents: true,
			      	displayEventTime: false,
			      	events:subscribeList()
			    });

			    calendar.render();
			  });
			 
			 
			function subscribeList(){
				var memberNo = ${loginUser.memberNo};
				$.ajax({
					url:"subscribeList.do",
					async: false,
					data:{memberNo:memberNo},
					dataType:"json",
					success:function(data){
						console.log("DB에서 불러온 리스트");
						console.log(data);
						
						$tableBody = $(".subscribeTable .tbody");
						$tableBody.html("");
						
						var $tr;
						var $td;
						var $date;
						var $itemName;
						var $change;
						var $cancle;
						
						if(data.length > 0 ){
							for(var i in data){
								var colorCode = "#" + Math.round(Math.random() * 0xffffff).toString(16);
								
								if(data[i].cycleNo == 1) {
									myEvents.push(
										  {
										    title:data[i].itemName,
										    start:data[i].subscribeDate,
										    color:colorCode,
										    rrule: {
									              freq: 'weekly',
									              dtstart:data[i].subscribeDate,
									              interval: 1
									            }
										   }
									)
								}
								else if(data[i].cycleNo == 2) {
									myEvents.push(
										  {
										    title:data[i].itemName,
										    start:data[i].subscribeDate,
										    color:colorCode,
										    rrule: {
									              freq: 'weekly',
									              dtstart:data[i].subscribeDate,
									              interval: 2
									            }
										   }
									)
								}
								else if(data[i].cycleNo == 3) {
									myEvents.push(
										  {
										    title:data[i].itemName,
										    start:data[i].subscribeDate,
										    color:colorCode,
										    rrule: {
									              freq: 'weekly',
									              dtstart:data[i].subscribeDate,
									              interval: 3
									            }
										   }
									)
								}
								else{
									myEvents.push(
										  {
										    title:data[i].itemName,
										    start:data[i].subscribeDate,
										    
										    rrule: {
									              freq: 'weekly',
									              dtstart:data[i].subscribeDate,
									              interval: 4
									            }
										   }
									)
								}
								
		   
					            $tr = $("<tr class='cartList'>");
					            $tr=$("<tr>");
					            $changeTd=$("<td>");
					            $cancleTd=$("<td>");
					            $data=$("<td>").text(data[i].subscribeDate);
					            $itemName=$("<td>").text(data[i].itemName);
					            $change=$("<a href='#cycle_form' id='cycle_pop' onclick='changeCycle(" + data[i].subscribeNo+","+ data[i].memberNo+"," +'"'+data[i].itemName+'"'+","+data[i].cycleNo+")'>").text("구독주기변경");
					            $cancle=$("<a href='#cancle_form' id='cancle_pop' onclick='cancleClick(" + data[i].subscribeNo+","+ data[i].memberNo+")'>").text("구독취소");
					            
					            
					            $tr.append($data);
					            $tr.append($itemName);
					            $changeTd.append($change);
					            $tr.append($changeTd);
					            $cancleTd.append($cancle);
					            $tr.append($cancleTd);
					           
					            $tableBody.append($tr);
							}
						}
						
						console.log("ajax2");
						console.log(myEvents);
						
					},
					error:function(request, status, errorData){
		                alert("error code: " + request.status + "\n"
		                      +"message: " + request.responseText
		                      +"error: " + errorData);
		           }
				});
				return myEvents
			}
		</script>

	      <div class="subscribe_list" style="width:80%;">
	        <table class="subscribeTable">
	        	<thead>
		          <tr>
		            <td style="width: 10%;" class="top bottom">날짜</td>
		            <td style="width: 45%;" class="top bottom">상품정보</td>
		            <td style="width: 30%;" class="top bottom">구독주기변경</td>
		            <td style="width: 25%;" class="top bottom">구독취소</td>
		          </tr>
	          	</thead>
	          	<tbody class="tbody">
	          		
	          	</tbody>
	
	        </table>
	      </div>
		  
	      <!-- popup form #1 -->
	      <a href="#x" class="overlay" id="cycle_form"></a>
	      <div class="popup">
	        <h4>구독주기 변경</h4>
	        <form action="cycleChange.do" method="post">
	        	<input type="hidden" id="subscribeNo" name="subscribeNo">
	        	<input type="hidden" id="memberNo" name="memberNo">
		        <div>
		          <table>
		            <tr>
		              <td style="width: 100px;"><b>구독번호</b></td>
		              <td><span id="subscribeNo2"></span></td>
		            </tr>
		            <tr>
		                <td style="width: 100px;"><b>제품명</b></td>
		                <td><span id="itemName"></span></td>
	                </tr>
	                <tr>
		                <td style="width: 100px;"><b>구독주기</b></td>
		                <td><span id="cycle"></span></td>
		            </tr>
		            <tr>
		                <td style="width: 180px;">변경 할 구독주기</td>
		                <td>
		                    <select style="width: 100px; height:30px" id="cycleNo" name="cycleNo">
		                      <option value="1">1주</option>
		                      <option value="2">2주</option>
		                      <option value="3">3주</option>
		                      <option value="4">4주</option>
		                    </select>
		                  </td>
		            </tr>
		          </table>
		        </div>
		        <div style="text-align: center;">
		          <button>변경</button>
		        </div>
	        </form>
	        <a class="close" href="#close"></a>
	      </div>
	
	      <a href="#x" class="overlay" id="cancle_form"></a>
	      <div class="popup">
	        <h4>구독취소</h4>
	        <form action="subscribeCancle.do" method="post">
	        	<input type="hidden" id="subscribeNo3" name="subscribeNo">
	        	<input type="hidden" id="memberNo3" name="memberNo">
		        <div>
		          <table>
		          	<tr class="top">
		          		<td style="width: 100px; height:30px;"><b>구독번호</b></td>
		                <td><span id="subscribeNo4"></span></td>
		          	</tr>
		            <tr class="top bottom">
		              <td style="width: 100px;" >취소 사유</td>
		              <td>
		                <select style="width: 200px; height: 30px;" id="cancleCategory" name="cancleCategory">
		                  <option value="1">상품 불필요</option>
		                  <option value="2">가격이 비쌈</option>
		                  <option value="3">기타</option>
		                </select>
		              </td>
		            </tr>
		            <tr>
		              <td colspan="2">
		                <br>
		                <textarea id="cancleContent" name="cancleContent" cols="50" rows="5"></textarea>
		              </td>
		            </tr>
		          </table>
		        </div>
		        <div style="text-align: center;">
		          <button id="subscribeCancle">구독취소</button>
		        </div>
	        </form>
	        <a class="close" href="#close"></a>
	      </div>
	    </div>
    </div>
    <br style="clear:both;">
    <jsp:include page="../common/footer.jsp"/>
    <script>
	    function changeCycle(subscribeNo, memberNo, itemName, cycleNo){
			$("#subscribeNo").val(subscribeNo);
			$("#memberNo").val(memberNo);
			
			$("#subscribeNo2").text(subscribeNo);
			$("#itemName").text(itemName);
			
			if(cycleNo == 1){
				$("#cycle").text("1주");
			} else if(cycleNo == 2){
				$("#cycle").text("2주");
			} else if(cycleNo == 3){
				$("#cycle").text("3주");
			} else{
				$("#cycle").text("4주");
			}
		}
	    
	    function cancleClick(subscribeNo, memberNo){
	    	$("#subscribeNo3").val(subscribeNo);
			$("#memberNo3").val(memberNo);
			
			$("#subscribeNo4").text(subscribeNo);
	    }
	    
	    $(function(){
    		$("#cancleCategory").on('change',function(){
    			var select = $("#cancleCategory option:selected").val()
    			
        		if(select == 1){
        			$("#cancleContent").attr("disabled", "disabled");
        		} else if(select == 2){
        			$("#cancleContent").attr("disabled", "disabled");
        		} else if(select == 3){
        			$("#cancleContent").attr("disabled", false);
        		}
    		})
    	})
    </script>
</body>
</html>
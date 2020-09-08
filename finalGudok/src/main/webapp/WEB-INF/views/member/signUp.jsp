<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<title>회원가입</title>
<style>
/*폰트 적용*/
body {
	font-family: 'Jua', sans-serif;
}

.card {
	border: none;
}

table {
	margin: auto;
}

/* #btnTd {
	text-align: center;
} */
td {
	padding: 10px;
}

::placeholder {
	font-size: small;
}

.btn {
	border: 1px solid #ced4da;
	color: #495057;
}

.btn:hover {
	border-color: black;
	color: black;
}

#submitBtn {
	margin-right: 10px;
}

#titleTag {
	margin-left: -30px;
	margin-top: 50px;
}

#signUpDiv {
	margin-bottom: 50px;
}

.guide {
	display: none;
	font-size: 12px;
	top: 12px;
	right: 10px;
}

span {
	font-size: 0.8em;
}

.modal{
	width:400px;
	height:250px;
}

#modalWrap{
	position:fixed;
	top:30%;
	left:36%;
}

#modalContent{
	width:400px;
	height:250px;
}

#modalHeader{
	align:center;
	text-align: center;
	border-bottom:1px solid #ced4da;
}

#modalTitle{
	font-size:1.8em;
	padding-top:40px;
	padding-bottom:30px;
}

#modalBody{
	align:center;
	text-align: center;
	padding-top:50px;
	padding-bottom:30px;
	font-size:1.2em;
}

</style>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<section>
		<h2 align="center" id="titleTag" style="color: black;">회원가입</h2>
		<br>

		<div id="si5gnUpDiv">
			<form id="signUpForm">
				<table align="center" width="500" id="signUpTb">
					<tr>
						<td>*아이디</td>
						<td><input type="text" name="memberId" id="memberId" placeholder="사용할 아이디를 입력하세요." autofocus>
							&nbsp;
							<span id="idInfo">4-15자리 영어, 숫자만 가능</span>
							<span class="guide ok">사용 가능한 아이디입니다.</span> 
							<span class="guide error">이미 사용 중인 아이디입니다.</span> 
							<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0"></td>
					</tr>
					<tr>
						<td>*비밀번호</td>
						<td colspan="2">
							<input type="password" name="memberPwd" id="pwd1" placeholder="사용할 비밀번호를 입력하세요." class="pw">
							<input type="hidden" id="pwdCheck" value="0"/>
							&nbsp;
							<span id="pwdInfo">8-15자 영어,숫자,특수문자 혼합 사용</span>
						</td>
					</tr>
					<tr>
						<td>*비밀번호 확인</td>
						<td colspan="2">
							<input type="password" id="pwd2" placeholder="비밀번호를 한번 더 입력하세요." class="pw">
							&nbsp;
							<span id="pwdCheckInfo"></span>
						</td>
					</tr>
					<tr>
						<td>*이름</td>
						<td colspan="2">
							<input type="text" id="name" name="memberName" placeholder="이름을 입력하세요.">
							&nbsp;
							<span id="pwdInfo">2-6자리 한글만 가능</span>
						</td>
					</tr>
					<tr>
						<td>*이메일</td>
						<td colspan="2">
							<input type="email" class="input-area" id="email" placeholder="email@email.com" name="email"> 
							<input type="hidden" value="0" id="emailDupCheck"> 
							&nbsp;
							<button class="btn" type="button" id="verifyEmail">이메일인증</button>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input type="text" class="input-area" id="inputAuthCode" name="inputAuthCode" placeholder="인증번호를 입력하세요"> 
							<input type="hidden" value="0" id="authCode"> 
							&nbsp;
							<button class="btn" type="button" id="emailCheck">확인</button>
						</td>
					</tr>
					<tr>
						<td>우편번호</td>
						<td colspan="2">
							<input type="text" name="address1" class="postcodify_postcode5" value="" id="address1"> 
							&nbsp;
							<button class="btn" type="button" id="postcodify_search_button">검색하기</button>
						</td>
					</tr>
					<tr>
						<td>도로명 주소</td>
						<td>
							<input type="text" name="address2" class="postcodify_address" value="" id="address2"></td>
						<td></td>
					</tr>
					<tr>
						<td>상세주소</td>
						<td>
							<input type="text" name="address3" class="postcodify_extra_info" value="" id="address3">
						</td>
						<td></td>
					</tr>
					
					<!-- Postcodify를 로딩하자 -->
					<script>
						$(function() {
							$("#postcodify_search_button").postcodifyPopUp();
						})
					</script>
					<tr>
						<td>성별</td>
						<td><input type="radio" class="gender" name="gender" id="male" value="M" checked><label for="male">&nbsp;남자</label>
							&nbsp; 
							<input type="radio" class="gender" name="gender" id="female" value="F"><label for="female">&nbsp;여자</label>
							&nbsp; 
							<input type="radio" class="gender" name="gender" id="none" value="N"><label for="none">&nbsp;선택안함</label>
						</td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2" id="btnTd">
							<button type="button" class="btn" id="submitBtn" onclick="validate();">가입하기</button>
							<button type="reset" class="btn">취소하기</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	
	<!-- 로그인 성공 시 모달 띄우기 -->	
	<div id="modalWrap" class="modal">
	    <div class="modal-content" id="modalContent">
	      <div id="modalHeader">
	        <h5 id="modalTitle">회원가입이 완료되었습니다.</h5>
	      </div>
	      <div id="modalBody">
	        <a href="home.do">홈 화면으로 이동</a>
	        &nbsp;&nbsp;&nbsp;
	        <a href="moveToLogin.do">로그인 페이지로 이동</a>
	      </div>
	    </div>
	</div>

	</section>
	<!-- Footer -->
	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>

	<script>
		// 아이디 유효성 검사
		$(function() {
			// 아이디 정규표현식(영어,숫자만 4-15자리)
			var regId = /^[a-zA-z0-9]{4,15}$/;
			$("#memberId").on("keyup", function() {
						var memberId = $(this).val().trim();
						
						if (!regId.test(memberId) && memberId.length < 4) {
							$(".guide").hide();
							$("#idDuplicateCheck").val(0);
							$("#idInfo").show();
						}

						$.ajax({
							url : "dupId.do",
							data : {memberId : memberId},
							success : function(data) {
								if (data == "true" && memberId.length > 4 && regId.test(memberId)) {
									$("#idInfo").hide();
									$(".ok").show();
									$(".error").hide();
									$("#idDuplicateCheck").val(1);
								}else if(data == "false" && memberId.length > 4) {
									$("#idInfo").hide();
									$(".ok").hide();
									$(".error").show();
									$("#idDuplicateCheck").val(0);
								}else if(!regId.test(memberId) && memberId.length > 4){
									$("#idInfo").hide();
									$(".ok").hide();
									$(".error").show().html("사용 가능한 아이디를 입력하세요.");
									$("#idDuplicateCheck").val(0);
								}
							},
							error : function(request, status, errorData) {
								alert("error code: " + request.status + "\n"
										+ "message: " + request.responseText
										+ "error: " + errorData);
							}
						})
					})
				})
	
		// 비밀번호 일치여부 확인
		$(".pw").keyup(function(){
			// 비밀번호 정규표현식(영어, 특수문자, 숫자 혼합 8~15자)
			var regPwd = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			var pwd1 = $("#pwd1").val();				
			var pwd2 = $("#pwd2").val();				
			
			if(pwd1 != "" && pwd2 != "" && pwd1 != pwd2){
				$("#pwdCheckInfo").html("비밀번호 미일치");
				$("#pwdCheck").val(0);
			}
			if(pwd1 == pwd2 && pwd1 != "" && pwd2 != "" && regPwd.test(pwd1) == true && regPwd.test(pwd2) == true){
				$("#pwdCheckInfo").html("사용가능");
				$("#pwdCheck").val(1);
			}
			if(pwd1 == "" || pwd2 == ""){
				$("#pwdCheckInfo").html("");
				$("#pwdCheck").val(0);
			}
		})
        
		// 이메일 인증 확인
		$(function() {
			// 이메일 정규표현식
			var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			$("#verifyEmail").on("click", function() {
						var memberEmail = $("#email").val();
						if (memberEmail == "") {
							alert("이메일을 입력하세요.");
						}else if(!regEmail.test(memberEmail)){
							alert("이메일 양식을 확인해주세요.");
						}else {
							$.ajax({
								url : "emailDupCheck.do",
								data : {email : memberEmail},
								success : function(data) {
									// 중복되는 이메일이 없을 경우
									if (data.emailCheckResult == true) {
										alert("인증번호를 발송하였습니다.");
									} else {
										// 중복되는 이메일이 있을 경우
										alert("이미 사용중인 이메일입니다.");
										$("#email").val("");
										$("#email").focus();
									}
									// 메일로 발송 된 인증번호 hidden tag에 저장
									$("#authCode").val(data.authCode);
								},
								error : function(request, status, errorData) {
									alert("error code: " + request.status
											+ "\n" + "message: "
											+ request.responseText + "error: "
											+ errorData);
								}
							})
						}
				})
			})
		
		// 이메일 인증번호 발송 후 처리
		$(function(){
			$("#emailCheck").on("click",function(){
				var inputAuthCode = $("#inputAuthCode").val();
				if(inputAuthCode == ""){
					alert("인증번호를 입력하세요");
				}else if($("#authCode").val() == inputAuthCode){
					alert("인증완료");	
					$("#emailDupCheck").val(1);
					
					// 인증완료 후 이메일 인증 관련 태그, 버튼 비활성화
					$("#inputAuthCode").attr("readonly", true);
					$("#emailCheck").attr("disabled", true);
					$("#email").attr("readonly", true);
					$("#verifyEmail1").attr("disabled", true);
					
					
				}else{
					alert("인증번호를 확인하고 다시 입력해주세요");
				}
			})
		})
	</script>
	
	<script>
		// 회원가입 유효성검사
		function validate(){
 			// 아이디
			if($("#memberId").val() == ""){
				alert("아이디를 입력하세요.");
				$("#memberId").focus();
				return false;
			}
			if($("#idDuplicateCheck").val() == 0) {
				alert("사용 가능한 아이디를 입력해 주세요.");
				$("#memberId").focus();
				return false;
			}
			// 비밀번호
			if($("#pwdCheck").val() == 0){
				alert("비밀번호를 확인해주세요.");
				$("#pwd1").focus();
				return false;
			}
			// 이름
			// 이름 정규표현식 2-6자 한글만 가능
			var regName = /^[가-힣]{2,6}$/;
			
			if($("#name").val() == ""){
				alert("이름을 입력하세요");
				$("#name").focus();
				return false;
			}
			if(!regName.test($("#name").val())){
				alert("이름을 확인해주세요");
				$("#name").focus();
				return false;
			}
			// 이메일
			if($("#emailDupCheck").val() == 0){
				alert("이메일 인증을 해주세요.");
				return false;
			}
			// 주소
			var address1 = $("#address1");
			var address2 = $("#address2");
			var address3 = $("#address3");
			if(address1.val() == "" || address2.val() == "" || address3.val() == ""){
				alert("주소를 입력하세요.");
				return false;
			}
			
			var obj = new Object();
			obj.id=$("#memberId").val();
			obj.pwd=$("#pwd1").val();
			obj.name=$("#name").val();
			obj.email=$("#email").val();
			obj.address1=$("#address1").val();
			obj.address2=$("#address2").val();
			obj.address3=$("#address3").val();
			obj.gender=$("input[name='gender']:checked").val();

			$.ajax({
				url:"signUp.do",
				type:"post",
				data:JSON.stringify(obj),
				contentType:"application/json;charset=utf-8",
				success:function(data){
					if(data == "success"){
						$("#modalWrap").show();
					}
				},
				error : function(request, status, errorData) {
					alert("error code: " + request.status
							+ "\n" + "message: "
							+ request.responseText + "error: "
							+ errorData);
				}
			})
			
		}
	</script>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script> -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
</body>
</html>
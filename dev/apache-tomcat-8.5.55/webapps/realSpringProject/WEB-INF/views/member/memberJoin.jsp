<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
   .centerText table{
      margin: auto;
   }
   body{
      background-image:url("resources/images/background.jpg");
   }
   .guide{
      display:none;
      font-size:12px;
      top:12px;
      right:10px;
   }
   span.ok{color:green;}
   span.error{color:red;}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<h1 align="center">회원가입</h1>
	
	<div class="centerText">
		<form action="minsert.do" method="post" id="joinForm">
			<table width="500" cellspacing="5">
				<tr>
					<td width="150">* 아이디</td>
					<td width="450">
						<input type="text" name="id" id="userId">
						<!-- ----- ajax 연습 후에 적용 할 부분 ------ -->
						<span class="guide ok">이 아이디는 사용 가능합니다.</span>
						<span class="guide error">이 아이디는 사용할 수 없습니다.</span>
						<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0">
						<!-- -------------------------------- -->
					</td>
				</tr>
				<tr>
					<td>* 이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>* 비밀번호</td>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type="radio" name="gender" value="M">남
						<input type="radio" name="gender" value="F">여
					</td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" min="20" max="100" name="age"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="tel" name="phone"></td>
				</tr>
				<!-- 
					주소 api로 주소와 우편번호를 받아보자
				 -->
				<tr>
	                <td>우편번호</td>
	                <td><input type="text" name="post" class="postcodify_postcode5" value="" size="6">
	                <button type="button" id="postcodify_search_button">검색</button>
	            </tr>
	            <tr>
	                <td>도로명 주소</td>
	                <td><input type="text" name="address1" class="postcodify_address" value=""></td>
	            </tr>
	            <tr>
	                <td>상세 주소</td>
	                <td><input type="text" name="address2" class="postcodify_extra_info" value=""></td>
	            </tr>
	            <!-- Postcodify를 로딩하자 -->
	            <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	            <script>
	               	$(function(){
	                   $("#postcodify_search_button").postcodifyPopUp();
	                })
	            </script>
	             
	            <tr>
	             	<td colspan="2" align="center">
	             		<button type="button" onclick="validate()">가입하기</button>
	             		<input type="reset" value="취소하기">
	             	</td>
	            </tr>
			</table>
		</form>
		<br><br>
		<a href="home.do">시작 페이지로 이동</a>
		
		<script>
			/* function validate(){
				$("#joinForm").submit();
			} */
			
			/* AJAX 이후 코드들 */
			$(function(){
				$("#userId").on("keyup", function(){
					var userId = $(this).val().trim();
					
					if(userId.length < 4){
						$(".guide").hide();				// 아이디 사용 유무 구문이 보이지 않게 하자
						$("#idDuplicateCheck").val(0);	// 아이디 중복 체크 버튼을 다시 누르게끔 하자
						
						// 애초에 4글자가 안되게 아이디를 쓰면 ajax가 실행되지 않고
						// 이벤트 핸들러 함수가 종료되게 하자.
						return;
					}
					
					$.ajax({
						url:"dupid.do",
						data:{id:userId},
						success:function(data){
							/* if(data == "true"){ */	// stream 방식일 때
							if(data.isUsable == true){	// jsonView 일 때
														// 모델에 담긴 객체는 원본 자료형 그대로이다.
								$(".error").hide();
								$(".ok").show();
								$("#idDuplicateCheck").val(1);
							} else{
								$(".error").show();
								$(".ok").hide();
								$("#idDuplicateCheck").val(0);
							}
						},
						error:function(request, status, errorData){
		                     alert("error code: " + request.status + "\n"
		                           +"message: " + request.responseText
		                           +"error: " + errorData);
		                }
					})
				})
			})
			
			function validate(){
				if($("#idDuplicateCheck").val() == 0){
					alert("사용 가능한 아이디를 입력해 주세요.");
					$("#userId").focus();
				} else{
					$("#joinForm").submit();
				}
			}
		</script>
	</div>
</body>
</html>
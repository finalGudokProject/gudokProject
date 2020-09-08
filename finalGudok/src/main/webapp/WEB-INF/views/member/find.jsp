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

<title>계정찾기</title>
<style>
/*폰트 적용*/
body {
	font-family: 'Jua', sans-serif;
}

#titleDiv {
	margin-top: 50px;
	margin-right: auto;
	margin-left: auto;
	text-align: center;
}

#titleDiv>ul {
	display: inline-block;
	text-align: center !important;
}

#titleDiv li {
	display: inline-block;
}

.vl {
	border: 1px solid #495057;
	height: 20px;
	margin-left: 10px;
	margin-right: 10px;
	margin-left: 10px;
}

#findId {
	color: black !important;
	margin-left: auto;
	margin-right: auto;
	font-size: 1.8em;
}

#findPwd {
	color: #495057 !important;
	margin-left: auto;
	margin-right: auto;
	font-size: 1.8em;
}

#findId:hover, #findPwd:hover {
	color: black;
	text-decoration: none;
}

#inputDiv {
	margin-top: 30px;
	margin-bottom: 50px;
}

.btn {
	color: #495057;
	border: 1px solid #495057;
}

.btn:hover {
	border-color: black;
	color: black;
	cursor: pointer;
}

#inputIdTable td, #inputPwdTable td {
	text-align: center;
}

td {
	padding: 10px;
}
</style>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
</head>

<body>
	<jsp:include page="../common/menubar.jsp" />

	<div id="titleDiv" align="center">
		<ul class="nav nav">
			<li class="nav-item"><a class="nav-link active"
				data-toggle="tab" href="#findIdDiv" id="findId">아이디 찾기</a></li>
			<li class="vl"></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#findPwdDiv" id="findPwd">비밀번호 찾기</a></li>
		</ul>
	</div>
	<div class="tab-content" id="inputDiv">
		<div class="tab-pane show active" id="findIdDiv">
			<form action="" method="POST" id="findIdForm">
				<table id="inputIdTable" align="center">
					<tr>
						<td colspan="3"><input class="form-control mb-1" type="text"
							id="name" placeholder="이름" autofocus></td>
					</tr>
					<tr>
						<td colspan="3"><input class="form-control mb-1" type="text"
							id="email" placeholder="이메일"></td>
					</tr>
					<tr>
						<td colspan="3"><button type="button" class="btn"
								id="findIdBtn" onclick="findId();">아이디 찾기</button></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="tab-pane show" id="findPwdDiv">
			<form action="" method="POST" id="findPwdForm">
				<table id="inputPwdTable" align="center">
					<tr>
						<td colspan="3"><input class="form-control mb-1" type="text"
							id="id" placeholder="아이디" required autofocus></td>
					</tr>
					<tr>
						<td colspan="3"><input class="form-control mb-1" type="text"
							id="name" placeholder="이름" required></td>
					</tr>
					<tr>
						<td colspan="3"><input class="form-control mb-1" type="text"
							id="email" placeholder="이메일" required></td>
					</tr>
					<tr>
						<td colspan="3"><button type="button" class="btn"
								id="findPwdBtn" onclick="findPwd()">비밀번호 찾기</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<script>
		$("#findId").on("click", function() {
			$("#findId").attr("style", "color:black !important");
			$("#findPwd").attr("style", "color:#495057 !important");
		});

		$("#findPwd").on("click", function() {
			$("#findId").attr("style", "color:#495057 !important");
			$("#findPwd").attr("style", "color:black !important");
		});

		// 아이디, 이름, 이메일 정규표현식
		var regId = /^[a-zA-z0-9]{4,15}$/;
		var regName = /^[가-힣]{2,6}$/;
		var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		// 사용자가 입력한 아이디, 이름, 이메일
		
		
		
		function findId() {
			var inputName = $("#inputIdTable").find("#name").val();
			var inputEmail = $("#inputIdTable").find("#email").val();
			
			if (inputName == "" || !regName.test(inputName)) {
				alert("이름");
			} else if (inputEmail == "" || !regEmail.test(inputEmail)) {
				alert("이메일");
			} else {
				
				$.ajax({
					url : "findId.do",
					type:"post",
					data:{email:inputEmail, name:inputName},
					/* data:JSON.stringify(obj), */
					/* contentType:"application/json;charset=utf-8", */
					success : function(data){
						if(data.id != null){
							alert("고객님의 아이디는" + data.id + "입니다.");
						}else{
							alert("존재하지 않는 회원입니다. 회원가입을 진행해주세요.")
						}
					},
					error : function(request, status, errorData) {
						alert("error code: " + request.status + "\n"
								+ "message: " + request.responseText
								+ "error: " + errorData);
					}
				})
				
			}
		}

		function findPwd() {
			var inputId = $("#inputPwdTable").find("#id").val();
			var inputName = $("#inputPwdTable").find("#name").val();
			var inputEmail = $("#inputPwdTable").find("#email").val();
			
			if (inputId == "" || !regId.test(inputId)) {
				alert("아이디");
			} else if (inputName == "" || !regName.test(inputName)) {
				alert("이름")
			} else if (inputEmail == "" || !regEmail.test(inputEmail)) {
				alert("이메일");
			} else {
				
				$.ajax({
					url : "findPwd.do",
					type:"post",
					data:{id:inputId, email:inputEmail, name:inputName},
					/* data:JSON.stringify(obj), */
					/* contentType:"application/json;charset=utf-8", */
					success : function(data){
						if(data.msg == "success"){
							alert("회원님의 메일로 임시비밀번호를 발송하였습니다.");
						}else{
							alert("존재하지 않는 회원입니다. 정보를 다시 확인해주세요.");
						}
						
					},
					error : function(request, status, errorData) {
						alert("error code: " + request.status + "\n"
								+ "message: " + request.responseText
								+ "error: " + errorData);
					}
				})
			}
		}
	</script>

	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</body>

</html>
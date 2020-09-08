<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
/*폰트 적용*/
body {
	font-family: 'Jua', sans-serif;
}

.footer {
	font-size: small;
	color: #495057;
}

a {
	color: #495057;
}

a:hover {
	color: black;
}
</style>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
</head>
<body>

	<div class="footer">
		<hr class="rgba-white-light" style="margin: 0 15%;">
		<!-- Footer Links -->
		<div class="container footer">

			<!-- Grid row-->
			<div class="row text-center d-flex justify-content-center pt-5 mb-3">

				<!-- Grid column -->
				<div class="col-md-2 mb-3">
					<h6 class="text-uppercase font-weight-bold">
						<a href="#!">About Goose</a>
					</h6>
				</div>
				<!-- Grid column -->

				<!-- Grid column -->
				<div class="col-md-2 mb-3">
					<h6 class="text-uppercase font-weight-bold">
						<a href="termsOfService.do">이용약관</a>
					</h6>
				</div>
				<!-- Grid column -->

				<!-- Grid column -->
				<div class="col-md-2 mb-3">
					<h6 class="text-uppercase font-weight-bold">
						<a href="privacyPolicy.do">개인정보처리방침</a>
					</h6>
				</div>
				<!-- Grid column -->

				<!-- Grid column -->
				<div class="col-md-2 mb-3">
					<h6 class="text-uppercase font-weight-bold">
						<a href="noticeList.do">고객센터</a>
					</h6>
				</div>

			</div>
		</div>

		<!-- Grid row-->
		<div
			class="row d-flex text-center justify-content-center mb-sm-0 mb-4">

			<!-- Grid column -->
			<div class="col-md-8 col-12">
				<p style="line-height: 1.7rem">
					회사명 : 주식회사 Goose &nbsp;&nbsp; 사업자등록번호 : 123-45-7890 <br> 주소 :
					경기도 동두천시 동두천로 139 부영아파트 902동 1104호 <br> 연락처 : 010-1234-5678
					&nbsp; 개인정보관리 책임자 : 박재명 &nbsp; 대표자 : 박재명(JM)
				</p>
			</div>
			<!-- Grid column -->
		</div>
		<!-- Grid row-->

		<!-- Copyright -->
		<div class="footer-copyright text-center py-3">© 2020 Copyright
			: Goose, All rights reserved</div>
	</div>
	<!-- Copyright -->
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script> -->
	<script
        src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
</body>
</html>
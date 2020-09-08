<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	 <!-- sweetalert시작 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	<!-- sweetalert끝 -->
<title>Insert title here</title>
<style>
.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}
#reviewBtn{
	margin:0 0 0 1%;
	font-size:20px;
}

div.reviewDC{
	vertical-align: middle;
}
#reviewPI{
	margin-top:20px;
	font-size:35px;
}
.reviewRC{
	display:inline-block;
}

.reviewRP{
	text-align:center;
	padding-top:2%;
	font-size:25px;
}

.starRv{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starRv.on{background-position:0 0;}

.starP{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 20px;
  height: 20px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starP.on{background-position:0 0;}



.sign{
	text-align: center;
	vertical-align: middle;
}
.signImg{
	width:35px;
	height:35px;
}
.amountT{
	text-align: center;
	line-height: 27px;
    width:50px;
}

.amountPriceDiv{
	text-align:right;
	padding-right:5%;
	font-size:20px;
	background:#F8F9FA;
	border-radius: 5px;
}
   
  .fa-heart-o {
  color: black;
  cursor: pointer;
}

.fa-heart {
  color: red;
  cursor: pointer;
}

div #mainImg{
	display:block;
	width: 100%;
	height: 100%;
}

div #logoImg{
	display:block;
	width: 100%;
	height: 39rem;
	border:1px solid lightgray;
}

input[type=button]{
	background:#6AAED9;
	color:white;
	border-radius:5px;
	padding:2%;
	width:40%;
	transition:0.5s;
  	position:relative;
  	border:1px solid #6AAED9;
	margin-bottom:2%;
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

#allReviewBtn{
	  background:white;
	  color:#6AAED9;
	  border:1px solid #6AAED9;
	  border-radius:5px;
	  padding:1%;
}

#allReviewBtn:hover{
	  background:#6AAED9;
	  color:white;
	  border:1px solid #11538C;
	  border-radius:5px;
	  padding:1%;
}


.cycleSpan{
	display:block;
	cursor:pointer;
	background:white;
	border-radius:5px;
	border:1px solid #6AAED9;
	color:#6AAED9;
	padding:5%;	
}


.cycleTable{
	text-align:center;
	width:100%;
}
.ansTable{
	font-size:15px !important;
	margin:0px !important;
}

/* The Modal (background) */
.modal {
	display: none;
	/* Hidden by default */
	position: fixed;
	/* Stay in place */
	z-index: 1030;
	/* Sit on top */
	padding-top: 2%;
	/* Location of the box */
	left: 0;
	top: 0;
	width: 100%;
	/* Full width */
	height: 100%;
	/* Full height */
	overflow: auto;
	/* Enable scroll if needed */
	background-color: rgb(0, 0, 0);
	/* Fallback color */
	background-color: rgba(0, 0, 0, 0.4);
	/* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 35% !important;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

/* 리뷰 내용 */
.reviewText{
	padding:1%;
}

.reviewTDiv{
	border:1px solid #BBDDF2;
	margin:2% 0 6% 0;
}


	.starRev{
		line-height:35px;
	}
	.starRev div{
		vertical-align:bottom;
	}
	
	.reviewImgClass{
		width:100%;
		height:100%;
		margin:2% 2% 2% 0;
		border:1px solid lightgray;
		max-height:200px;
		max-width:200px;
	}
	
	.reviewLine{
		border-bottom:1px datted lightgray;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<fmt:formatNumber var="itemPrice" value="${ilv.itemPrice}" type="number"/>
	<div class="container" style="margin-top:3%;">
		<div class="row">
			
			<div class="col-md-6" style="padding:0 2% 0 2%;"><img src="${contextPath }/resources/uploadFiles/${ilv.itemRename}" id="logoImg"></div>
			<div class="col-md-6" style="margin-bottom:2%;">
					<div style="margin-top:3%;">${ilv.categoryName }</div>
					<div class="row">
					<div class="col-md-8" style="padding:0px 15px;margin:0px;font-size:35px;vertical-align:middle;"><b>${ilv.itemName }</b></div>
					<div class="col-md-4" style="padding-right:4%;margin:0px;text-align:right;font-size:35px;">
					<c:if test="${empty loginUser.memberNo || hResult.memberNo != loginUser.memberNo}">
					<span id ="heart" title="찜하기"><i class="fa fa-heart-o" aria-hidden="true" ></i> </span>
					</c:if>
					<c:if test="${!empty loginUser.memberNo && hResult.memberNo == loginUser.memberNo && !empty ilv.heartNo}">
						<span id ="heart" class="liked" title="찜하기"><i class="fa fa-heart" aria-hidden="true"></i> </span>
					</c:if>
					</div>
					<div class="col-md-6" style="padding:0 15px;font-size:20px;">
					<c:if test="${empty ilv.itemMemo }">
						${ilv.itemName }입니다.
					</c:if>
					<c:if test="${!empty ilv.itemMemo }">
						${ilv.itemMemo }
					</c:if>
					</div>
					<div class="col-md-6" style="padding-right:4%;text-align:right;">
						<span style="text-align:right;" id="whatSpan" data-toggle="modal" data-target="#intro" title="상품 문의"><img id="whatImg"src="${contextPath }/resources/images/what.png" style="width:35px;height:35px;border:2px solid black;border-radius:5px;display:inline-block;vertical-align:middle;"></span>
					</div>
					
					
					
				</div>
				<div class="starRev">
							<c:choose>
								<c:when test="${ilv.itemRate < 1}">
									<span class="starRv">1</span>
									<span class="starRv">2</span>
									<span class="starRv">3</span>
									<span class="starRv">4</span>
									<span class="starRv">5</span>
								</c:when>
								<c:when test="${ilv.itemRate < 2 }">
									<span class="starRv on">1</span>
									<span class="starRv">2</span>
									<span class="starRv">3</span>
									<span class="starRv">4</span>
									<span class="starRv">5</span>
								</c:when>
								
								<c:when test="${ilv.itemRate < 3 }">
									<span class="starRv on">1</span>
									<span class="starRv on">2</span>
									<span class="starRv">3</span>
									<span class="starRv">4</span>
									<span class="starRv">5</span>
								</c:when>
								
								<c:when test="${ilv.itemRate < 4 }">
									<span class="starRv on">1</span>
									<span class="starRv on">2</span>
									<span class="starRv on">3</span>
									<span class="starRv">4</span>
									<span class="starRv">5</span>
								</c:when>
								
								<c:when test="${ilv.itemRate < 5 }">
									<span class="starRv on">1</span>
									<span class="starRv on">2</span>
									<span class="starRv on">3</span>
									<span class="starRv on">4</span>
									<span class="starRv">5</span>
								</c:when>
								<c:otherwise>
									<span class="starRv on">1</span>
									<span class="starRv on">2</span>
									<span class="starRv on">3</span>
									<span class="starRv on">4</span>
									<span class="starRv on">5</span>
								</c:otherwise>
							</c:choose>
						</div>
					<div style="padding:5% 0 5% 0;margin-bottom:3%;font-size:30px;border-bottom:1px dotted lightgray;"><b>${itemPrice }원</b></div>
					<div class="amountDC">
						<table style="vertical-align:middle;">
							<tr class="countTr">
								<td class="sign"><img src="${contextPath }/resources/images/XSIGN.png" class="signImg" id="signM"></td>
								<td><input type="text" readonly class="amountT" value="1" name="cartCount"></td>
								<td class="sign"><img src="${contextPath }/resources/images/plus.png" class="signImg" id="signP"></td>
							</tr>
						</table>
						<br>
						<div class="amountPriceDiv"><div style="margin-bottom:2%;padding-top:2%;font-weight:bold;" id="priceId">${itemPrice }원</div>
						<input type="hidden" value="${ilv.itemNo}" name="${ilv.itemNo}">
						<input type="hidden" value="${loginUser.memberNo}" name="${loginUser.memberNo}">
						<input type="hidden" value="${loginUser.memberId}" name="${loginUser.memberId}">
						<input type="hidden" value="${loginUser.email}" name="${loginUser.email}">
						<div style="padding:1% 0 1% 0;"><input type="button" value="장바구니 담기" id="basketBtn" style="margin:0 5% 0 5%;"><input type="button" value="결제하기" id="paymentBtn"></div>
						</div>
						<div style="margin-top:3%;border-top:1px dotted lightgray;"></div>
						<div class="cycleListClass" style="margin-top:3%;padding:2%;background:#F8F9FA;">
							<input type="text" id="cycleText" style="display:none;" name="cartSubs">
							<table class="cycleTable">
								<tr>
									<td style="width:25%;"><span class="cycleSpan" id="1cycle">1주일</span></td>
									<td style="width:25%;"><span class="cycleSpan" id="2cycle">2주일</span></td>
									<td style="width:25%;"><span class="cycleSpan" id="3cycle">3주일</span></td>
									<td style="width:25%;"><span class="cycleSpan" id="4cycle">4주일</span></td>
								</tr>
								<tr>
									<td colspan="4" style="padding:3% 3% 0 0;text-align:right;font-size:20px;" id="cycleChTd">구독 주기를 선택해 주세요.</td>
								</tr>
							</table>
						</div>
						
					</div>
			</div>
			<br><br>
			
		</div>
		
			<!-- 상세 이미지 -->
			<div class="col-md-12" style="padding:3%;margin:3% 0 3% 0; width:100%;height:auto;">
				<img src="${contextPath }/resources/uploadFiles/${ilv.imageRename}" id="mainImg">
			</div>
			<!-- 상세 이미지 끝 -->
			
			
			
			<!-- 모달 시작 -->
			<div id="myModal" class="modal">
				<div class="modal-content">
					<div class='modal-header'>
						<div class="row">
							<div style="font-size:40px;" id="boardTitle">${ilv.itemName} 상품문의</div>
							<div style="font-size:15px;padding:2%;color:gray;">상품에 대한 자세한 문의는 고객 센터를 이용해 주세요.</div>
						</div>
						<div><button type='button' class="close" data-dismiss='modal'
							aria-hidden="='true'" style="font-size:50px;">&times;</button></div>
					</div>
					
					<div class='modal-body'>
							<textarea placeholder="문의하실 내용을 적어주세요." style="width:100%;" rows="8" id="inquiredText"></textarea>
							
							
							<div class='modal-footer'>
								<input type='button' class="modalAnsBtn" data-dismiss='modal'
									value="문의하기">
								<div id='area2' class='area'></div>
							</div>
					</div>
				</div>
			</div>
			<!-- 모달 끝 -->
			
			
		<br>
		
		<!-- 리뷰 시작 -->
		<form action="reviewInsert.do" method="post" enctype="multipart/form-data" id="reviewForm">
		<input type="hidden" name="page" value="${currentPage}">
		<input type="hidden" name="itemNo" value="${ilv.itemNo }">
		<input type="hidden" id="starValue" name="reviewRate" value="5">
		<input type="hidden" name="memberNo" value="${loginUser.memberNo }">
		<input type="hidden" name="memberId" value="${loginUser.memberId }">
		<input type="hidden" name="email" value="${loginUser.email }">
		
		<div class="col-md-12" style="border-top:1px solid lightgray;">
		<p id="reviewPI"><b>상품평</b></p>
			<div class="starRev">
			<div style="display:none;">
			<input type="radio" name="reviewRadio" id="radio1" value="1">
			<input type="radio" name="reviewRadio" id="radio2" value="2">
			<input type="radio" name="reviewRadio" id="radio3" value="3">
			<input type="radio" name="reviewRadio" id="radio4" value="4">
			<input type="radio" name="reviewRadio" id="radio5" checked value="5">
			</div>
			  <span class="starR on">1</span>
			  <span class="starR on">2</span>
			  <span class="starR on">3</span>
			  <span class="starR on">4</span>
			  <span class="starR on">5</span>
			</div>
			<br>
			<table>
			<tr>
				<td style="width:50%;" align="center">
					<textarea rows="5" cols="120" id="reviewTxt" name="reviewContent"></textarea>
				</td>
					
				<td style="width:20%;" align="center">
					<input id="reviewBtn" type="submit" value="등록하기" style="width:160px;height:120px;font-size:30px;">
				</td>
			</tr>
			</table>
			<div class="fileAddClass">
				<div style="vertical-align:middle;margin-bottom:0.5%;">
					<img src="${contextPath }/resources/images/plus.png" style="width:30px;height:30px;margin-bottom:0.3rem;" class="fileImgBtn" id="fileAddBtn">
					<input type="file" name="uploadFile1">
				</div>
				<div style="display:none;" class="hiddenTr">
					<img src="${contextPath }/resources/images/minus.png" style="width:30px;height:30px;margin-bottom:0.3rem;" class="fileImgBtn" id="fileRemoveBtn">
					<input type="file" name="uploadFile2">
				</div>
			</div>
		</div>
		
		</form>
		
		
		<br>
		
		
	<!-- 상품평 -->
	<script>
		$(function(){
			$("#reviewBtn").on("click", function(e){
				e.preventDefault();
				/* console.log($("#reviewTxt").val().length); */
				if(${loginUser.memberId == null}){
					swal("","로그인한 회원만 사용 가능합니다.","error").then((result)=>{
						swal({
							text : "로그인 페이지로 이동하시겠습니까?",
							buttons : ["예", "아니오"],
							dangerMode : false,
							closeOnEsc : false,
						}).then((login)=>{
							if(login){
								
							}else{
								location.href="moveToLogin.do";
							}
						})
					});
				}else if(${loginUser.memberId != null}){
					if($("#reviewTxt").val().length < 10){
						swal("","10자 이상으로 입력해 주세요.","warning");
					}else if($("input[name=reviewRadio]:checked").val() == "1" || $("input[name=reviewRadio]:checked").val() == "2"){
						swal({
							text : "무분별한 평점 테러는 다른 사람에게 피해를 줄 수 있습니다.\n 다시 작성하시겠습니까?",
							icon : "warning",
							buttons : ["예", "아니오"],
							closeOnEsc: false,
							dangerMode : true,
						}).then((result)=>{
							if(result){
								swal("상품평","등록 완료되었습니다.","success").then((result)=>{
									if(result){
										$("#reviewForm").submit();
									}
								});
							}else{
								$("#reviewTxt").focus();
							}
						})	
					}else{
						swal({
							text : "상품평을 등록하시겠습니까?",
							buttons : ["예","아니오"],
							closeOnEsc: false,
							dangerMode : true,
						}).then((result)=>{
							if(result){

							}else{
								swal("상품평","등록 완료되었습니다.","success").then((result)=>{
									if(result){
										$("#reviewForm").submit();
									}
								})
								
							}
						})
					}
				}
			})
		})
	</script>
	<!-- 상품평 끝 -->

		
		<div class="row" style="border-top:1px solid lightgray;border-bottom:1px solid lightgray;" >
			<div class="col-md-6" class="reviewRC">
				<p class="reviewRP"><b>긍정 상품평</b></p>
				<c:forEach var="r" items="${review }">
					<c:if test="${r.reviewRate >=4 }">
						<div class="reviewLine"><span style="font-size:20px;">${r.memberId }님의 상품평</span>
							<div class="starRev">
								<c:choose>
									<c:when test="${r.reviewRate < 1}">
										<span class="starRv">1</span>
										<span class="starRv">2</span>
										<span class="starRv">3</span>
										<span class="starRv">4</span>
										<span class="starRv">5</span>
									</c:when>
									<c:when test="${r.reviewRate  < 2 }">
										<span class="starRv on">1</span>
										<span class="starRv">2</span>
										<span class="starRv">3</span>
										<span class="starRv">4</span>
										<span class="starRv">5</span>
									</c:when>
									
									<c:when test="${r.reviewRate  < 3 }">
										<span class="starRv on">1</span>
										<span class="starRv on">2</span>
										<span class="starRv">3</span>
										<span class="starRv">4</span>
										<span class="starRv">5</span>
									</c:when>
									
									<c:when test="${r.reviewRate  < 4 }">
										<span class="starRv on">1</span>
										<span class="starRv on">2</span>
										<span class="starRv on">3</span>
										<span class="starRv">4</span>
										<span class="starRv">5</span>
									</c:when>
									
									<c:when test="${r.reviewRate  < 5 }">
										<span class="starRv on">1</span>
										<span class="starRv on">2</span>
										<span class="starRv on">3</span>
										<span class="starRv on">4</span>
										<span class="starRv">5</span>
									</c:when>
									<c:otherwise>
										<span class="starRv on">1</span>
										<span class="starRv on">2</span>
										<span class="starRv on">3</span>
										<span class="starRv on">4</span>
										<span class="starRv on">5</span>
									</c:otherwise>
								</c:choose>
								<div style="display:inline-block;color:gray;">등록일 : ${r.reviewDate }</div>
							</div>
							<div>
								<c:forEach var="i" items="${img }">
									<c:if test="${i.reviewNo == r.reviewNo && !empty i.imageRename}">
										<img src="${contextPath }/resources/iuploadFiles/${i.imageRename}" class="reviewImgClass" style="width:100%;height:100%;">
									</c:if>
								</c:forEach>
							</div>
							<div class="reviewTDiv">
								<div class="reviewText">${r.reviewContent }</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<div class="col-md-6" class="reviewRC" style="border-left:1px dashed lightgray;">
				<p class="reviewRP"><b>부정 상품평</b></p>
				
				<c:forEach var="r" items="${review }">
					<c:if test="${r.reviewRate < 3 }">
						<div class="reviewLine"><span style="font-size:20px;">${r.memberId }님의 상품평</span>
							<div class="starRev">
								<c:choose>
									<c:when test="${r.reviewRate < 1}">
										<span class="starRv">1</span>
										<span class="starRv">2</span>
										<span class="starRv">3</span>
										<span class="starRv">4</span>
										<span class="starRv">5</span>
									</c:when>
									<c:when test="${r.reviewRate  < 2 }">
										<span class="starRv on">1</span>
										<span class="starRv">2</span>
										<span class="starRv">3</span>
										<span class="starRv">4</span>
										<span class="starRv">5</span>
									</c:when>
									
									<c:when test="${r.reviewRate  < 3 }">
										<span class="starRv on">1</span>
										<span class="starRv on">2</span>
										<span class="starRv">3</span>
										<span class="starRv">4</span>
										<span class="starRv">5</span>
									</c:when>
									
									<c:when test="${r.reviewRate  < 4 }">
										<span class="starRv on">1</span>
										<span class="starRv on">2</span>
										<span class="starRv on">3</span>
										<span class="starRv">4</span>
										<span class="starRv">5</span>
									</c:when>
									
									<c:when test="${r.reviewRate  < 5 }">
										<span class="starRv on">1</span>
										<span class="starRv on">2</span>
										<span class="starRv on">3</span>
										<span class="starRv on">4</span>
										<span class="starRv">5</span>
									</c:when>
									<c:otherwise>
										<span class="starRv on">1</span>
										<span class="starRv on">2</span>
										<span class="starRv on">3</span>
										<span class="starRv on">4</span>
										<span class="starRv on">5</span>
									</c:otherwise>
								</c:choose>
								<div style="display:inline-block;color:gray;">등록일 : ${r.reviewDate }</div>
							</div>
							<div>
								<c:forEach var="i" items="${img }">
									<c:if test="${i.reviewNo == r.reviewNo && !empty i.imageRename}">
										<img src="${contextPath }/resources/iuploadFiles/${i.imageRename}" class="reviewImgClass" style="width:100%;height:100%;">
									</c:if>
								</c:forEach>
							</div>
							<div class="reviewTDiv">
								<div class="reviewText">${r.reviewContent }</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
		<!-- 리뷰 끝 -->
		<c:if test="${review.size() != 0}">
		<div style="text-align:center;margin-top:3%;"><button type="button" style="font-size:30px;height:auto;" id="allReviewBtn">상품명 모든 리뷰 보러가기</button></div>
		</c:if>
		<c:if test="${review.size() == 0}">
		<div style="text-align:center;margin-top:3%;font-size:40px;">해당 상품의 리뷰가 없습니다.</div>
		</c:if>
		
	</div>
	<br><br><br><br><br><br>
		
		<!-- 찜하기, 상품문의 툴팁 -->
		<script type="text/javascript">
		    $(document).ready(function(){
		        $("#heart, #whatSpan").tooltip();
		    });
		</script>
		<!-- 찜하기, 상품문의 툴팁 끝 -->
		
		
		<!-- 문의하기 이미지 변경 -->
		<script>
			$(function(){
				$("#whatSpan").on("mouseenter", function(){
					$("#whatImg").attr("src","${contextPath }/resources/images/whatHover.png").css("cursor","pointer");
				}).on("mouseleave", function(){
					$("#whatImg").attr("src","${contextPath }/resources/images/what.png");
				})
			})
		</script>
		
		<!-- 문의하기 이미지 변경 끝 -->
		
		
				<script>
				var modal = document.getElementById("myModal");
				$(function(){
					var title = $("#boardTitle").text();
					var memberNo = "${loginUser.memberNo}";
					var itemNo = "${ilv.itemNo}";
					var memberId = "${loginUser.memberId}";
					var email = "${loginUser.email}";
					$(".modalAnsBtn").on("click", function(){
						var content = $(this).parent().prev().val();
						console.log(title + "," +content + "," + itemNo + "," + memberId);
						if($("#ansText").val() <= 10){
							swal("","10자 이상 입력해 주십시오.","error");
						}else{
							swal({
								text : "${ilv.itemName}"+" 상품을 문의하시겠습니까?",
								buttons : ["예", "아니오"],
								dangerMode : true,
								closeOnEsc: false,
							}).then((result)=>{
								if(result){

								}else{
									$.ajax({
										url : "inquire.do",
										data : {title:title, itemNo:itemNo, memberNo:memberNo, memberId:memberId, email:email, content:content},
										type : "POST",
										  success:function(data){
											  if(data == "success"){
												  swal("","문의하신 내용은 어디서 확인하실 수 있습니다.","success").then((result)=>{
														if(result){
															$("#inquiredText").val("");
															modal.style.display = "none";
														}
												});
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
	
	<!-- 수량 버튼 -->
		<script>
			function addComma(num) {
			 	var regexp = /\B(?=(\d{3})+(?!\d))/g;
				return num.toString().replace(regexp, ',');
			}
			$(function(){
				
				var amount = $(".amountT").val();
				var total = ${ilv.itemPrice };
				$("#signP").click(function(){
					amount = Number(amount) + 1;
					/* console.log(amount); */
					$(".amountT").val(amount);
					total = total + ${ilv.itemPrice};
					console.log(total);
					$("#priceId").text("");
					$("#priceId").text(addComma(total)+"원");
					
					if(amount > 1){
						$("#signM").attr("src","${contextPath }/resources/images/minus.png").css("transitionDuration","1s");
					}
				})
				$("#signM").click(function(){
					if(amount > 1){
						amount = Number(amount) - 1;
						$(".amountT").val(amount);
						/* console.log(amount); */
						total = total - ${ilv.itemPrice};
						console.log(total);
						$("#priceId").text("");
						$("#priceId").text(addComma(total)+"원");
						if(amount < 2){
							$("#signM").attr("src","${contextPath }/resources/images/XSIGN.png").css("transitionDuration","1s");
						}
					}else if(amount == 1){
						swal("","1개 미만은 선택하실 수 없습니다.","error");
					}
				})
			})
		</script>
		
		
		<!-- 구독 주기 선택 -->
		<script>
			$(function(){
				var text = $("#cycleText").val()
				$(".cycleSpan").click(function(){
					text = "";
					var c1 = $(this).text();
					var $cycle = $(this).text();
					$(".cycleTable").find("tr td .cycleSpan").not($cycle).css({"background":"white","color":"#6AAED9","border":"1px solid #6AAED9"});
					$(this).css({"background":"#6AAED9","color":"white"});
					switch(c1){
						case "1주일" : 
							text = text + 1;
							$("#cycleChTd").text("1주일 구독을 선택하셨습니다.");
							break;
						case "2주일" : 
							text = text + 2;
							$("#cycleChTd").text("2주일 구독을 선택하셨습니다.");
							break;
						case "3주일" : 
							text = text + 3;
							$("#cycleChTd").text("3주일 구독을 선택하셨습니다.");
							break;
						case "4주일" :
							text = text + 4;
							$("#cycleChTd").text("4주일 구독을 선택하셨습니다.");
							break;
					}
					
					console.log(text);
					$("#cycleText").val(text);
				})
			})
		</script>
		<!-- 구독 주기 선택 끝 -->
		
	
		
		<script>
			$(function(){
				var itemNo = "${ilv.itemNo}";
				var memberNo = "${loginUser.memberNo}";
				var memberId = "${loginUser.memberId}";
				var email = "${loginUser.email}";
				var itemName = "${ilv.itemName}";
				var itemPrice = "${ilv.itemPrice}";
				var cartCount = $(".amountT").val();
				var cartSubs = $("#cycleText").val();
				$("#paymentBtn").click(function(){
					var cycle = $("#cycleText").val();
					var amount = $(".amountT").val();
					/* console.log($("#cycleText").val()); */
					if(cycle == ""){
						swal("","구독 주기를 선택해 주세요.","error");
					}else{
						if(${loginUser.memberNo == null}){
							swal({
								text : "로그인해야 사용 가능한 기능입니다. 로그인 하시겠습니까?",
								icon : "error",
								buttons : ["예", "아니오"],
								closeOnEsc : false,
								dangerMode : true,
							}).then((loginCheck)=>{
								if(loginCheck){
									
								}else{
									location.href="moveToLogin.do";
								}
							})
						}else{
							swal({
								text : amount + "개의 상품을 " + cycle + "주일 동안 구독하시겠습니까?",
								icon : "warning",
								buttons : ["예", "아니오"],
								closeOnEsc: false,
								dangerMode : true,
							}).then((result)=>{
								if(result){
									
								}else{
									location.href="moveToPayment.do?itemName=itemName&cartCount=cartCount&itemPrice=itemPrice&cartSubs=cartSubs";
								}
							})
						}
					}
				})
				$("#basketBtn").click(function(){
					var cartSubs = $("#cycleText").val();
					var cartCount = $(".amountT").val();
					console.log(itemNo + ", " + memberNo + ", " + memberId + ", " + email + ", " + cartSubs + ", " + cartCount);
					if($("#cycleText").val() == ""){
						swal("","구독 주기를 선택해 주세요.","error");
					}else{
						if(${loginUser.memberNo == null}){
							swal({
								text : "로그인해야 사용 가능한 기능입니다. 로그인 하시겠습니까?",
								icon : "error",
								buttons : ["예", "아니오"],
								closeOnEsc : false,
								dangerMode : true,
							}).then((loginCheck)=>{
								if(loginCheck){
									
								}else{
									location.href="moveToLogin.do";
								}
							})
						}else{
							$.ajax({
								  url : "basket.do",
								  data : {itemNo:itemNo, memberNo:memberNo, memberId:memberId, email:email, cartSubs:cartSubs, cartCount:cartCount, itemName:itemName, itemPrice:itemPrice},
								  type : "POST",
								  success:function(data){
									if(data == "success"){
										swal("","장바구니에 추가되었습니다.","success").then((result)=>{
											if(result){
												swal({
													text : "장바구니로 이동하시겠습니까?",
													icon : "warning",
													buttons : ["예", "아니오"],
													closeOnEsc: false,
													dangerMode : true,
													}).then((willDelete)=>{
													if(willDelete){
														
													}else{
														location.href="basketPage.do?memberNo="+memberNo;
													}
												})
											}	
											})
									}
								},
								  error:function(request, status, errorData){
					                	alert("error code: " + request.status + "\n"
					                	+"message: " + request.responseText
					                	+"error: " + errorData);
					               }
							  })
							
						}
					}
				})
			})
		</script>
	
	<!-- 상품평 별버튼 -->
	<script>
		$(function(){
			$('.starRev .starR').click(function(){
				$(this).parent().children('span').removeClass('on');
				$(this).addClass('on').prevAll('span').addClass('on');
				/* console.log($(this).text()); */
				$("#starValue").val($(this).text());
				switch($(this).text()){
				case "1" : $("input:radio[id=radio1]").prop("checked", true);
					break;
				case "2" : $("input:radio[id=radio2]").prop("checked", true);
					break;
				case "3" : $("input:radio[id=radio3]").prop("checked", true);
					break;
				case "4" : $("input:radio[id=radio4]").prop("checked", true);
					break;
				case "5" : $("input:radio[id=radio5]").prop("checked", true);
					break;
				}
				
			});
		})
		
	</script>
	<!-- 상품평 별버튼 끝 -->
	
	<script>
	$(document).ready(function(){
		var memberNo = "${loginUser.memberNo}";
		var itemNo = "${ilv.itemNo}";
		var memberId = "${loginUser.memberId}";
		var email = "${loginUser.email}";
		$("#heart").click(function(){
			if(memberId != ""){
				if($("#heart").hasClass("liked")){
					swal({
						text : "찜목록에서 삭제하시겠습니까?",
						icon : "warning",
						buttons : ["예", "아니오"],
						closeOnEsc: false,
						dangerMode : true,
					  }).then((result)=>{
						  if(result){
						      $("#heart").html('<i class="fa fa-heart" aria-hidden="true"></i>');
						      $("#heart").addClass("liked");
						  }else{
							  $.ajax({
								  url : "choiceDel.do",
								  data : {itemNo:itemNo, memberNo:memberNo, memberId:memberId, email:email},
								  type : "POST",
								  success:function(data){
									  if(data == "success"){
										  $("#heart").html('<i class="fa fa-heart-o" aria-hidden="true"></i>');
									      $("#heart").removeClass("liked");
									      swal("찜하기","찜목록에서 삭제되었습니다.","success");
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
				}else{
					swal({
						text : "찜목록에 추가하시겠습니까?",
						buttons : ["예", "아니오"],
						closeOnEsc: false,
						dangerMode : true,
					  }).then((result)=>{
						  if(result){
							  $("#heart").html('<i class="fa fa-heart-o" aria-hidden="true"></i>');
						      $("#heart").removeClass("liked");
						  }else{
							  $.ajax({
								  url : "choice.do",
								  data : {itemNo:itemNo, memberNo:memberNo, memberId:memberId, email:email},
								  type : "POST",
								  success:function(data){
									  if(data == "success"){
										  $("#heart").html('<i class="fa fa-heart" aria-hidden="true"></i>');
									      $("#heart").addClass("liked");
									      swal("찜하기","찜목록에 추가되었습니다.","success");
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
			}else if(memberId == ""){
				swal("","로그인한 회원만 사용 가능합니다.","error").then((result)=>{
					swal({
						text : "로그인 페이지로 이동하시겠습니까?",
						buttons : ["예", "아니오"],
						dangerMode : false,
						closeOnEsc : false,
					}).then((login)=>{
						if(login){
							
						}else{
							location.href="moveToLogin.do";
						}
					})
				});
			}
			
		    /* if($("#heart").hasClass("liked")){
		      $("#heart").html('<i class="fa fa-heart-o" aria-hidden="true"></i>');
		      $("#heart").removeClass("liked");
		    }else{
		      $("#heart").html('<i class="fa fa-heart" aria-hidden="true"></i>');
		      $("#heart").addClass("liked");
		    } */
		  });
		});
	</script>
	
	<!-- <script>
		var count = 1;
		var removeImgId = null;
		$(function(){
			$("#fileAddBtn").click(function(){
				if(count < 3){
					console.log(count);
					count++;
					removeImgId = "minusImgId" + count;
					
					$(".fileAddClass > tbody:last").
					append("<tr><td>"+"<img src='${contextPath }/resources/images/minus.png' style='width:30px;height:30px;' class='fileImgBtn' id='"+removeImgId+"' onclick='removeBtn"+count+"();'></td>"+
							"<td><input type='file' name='uploadFile'></td></tr>");
				}else{
					alert("파일은 3개까지 등록 가능합니다.")
				}
			});
		})
		
		function removeBtn2(){
			$("#minusImgId2").parent().parent().remove();
			count--;
		}
		function removeBtn3(){
			$("#minusImgId3").parent().parent().remove();
			count--;
		}
		
	</script> -->
	
	<script>
		$(function(){
			$("#fileAddBtn").on("click", function(){
				if($(".hiddenTr").css("display") == "none"){
					swal({
						text:"파일을 추가하시겠습니까?",
						buttons : ["예","아니오"],
						closeOnEsc: false,
					}).then((result)=>{
						if(result){
							
						}else{
							$(".hiddenTr").css("display","inline");
							$("#fileAddBtn").attr("src","${contextPath }/resources/images/XSIGN.png");
						}
					})
				}else{
					swal("","파일은 2개까지 등록이 가능합니다.","warning");
				}
			})
			$("#fileRemoveBtn").on("click", function(){
				swal({
					text:"파일을 삭제하시겠습니까?",
					buttons : ["예","아니오"],
					closeOnEsc: false,
				}).then((result)=>{
					if(result){
						
					}else{
						$(".hiddenTr").css("display","none");
						$("#fileAddBtn").attr("src","${contextPath }/resources/images/plus.png");
					}
				})
				
			})
		})
		
	</script>
	
	
	
	<script>
		$(function(){
			$("#allReviewBtn").on("click", function(){
				var itemNo = "${ilv.itemNo}";
				var memberNo = "${loginUser.memberNo}";
				var itemName = "${ilv.itemName}";
				swal({
					title : itemName,
					text : "위 상품의 모든 리뷰를 보러 가시겠습니까?",
					buttons : ["예", "아니오"],
					closeOnEsc: false,
					dangerMode : true,
				}).then((result)=>{
					if(result){
						
					}else{
						location.href="itemReview.do?itemNo="+itemNo;
					}
				})
			})
		})
	</script>
	
	<!-- 모달 실행(모달 폼보다 밑에 두기) -->
		<script>
			var modal = document.getElementById("myModal");
			var btn = document.getElementById("whatSpan");
			var span = document.getElementsByClassName("close")[0];
			btn.onclick = function() {
				if(${loginUser.memberId == null}){
					swal("","로그인한 회원만 사용 가능합니다.","error").then((result)=>{
						swal({
							text : "로그인 페이지로 이동하시겠습니까?",
							buttons : ["예", "아니오"],
							dangerMode : false,
							closeOnEsc : false,
						}).then((login)=>{
							if(login){
								
							}else{
								location.href="moveToLogin.do";
							}
						})
					});
				}else if(${loginUser.memberId != null}){
					modal.style.display = "block";
				}
			}
			span.onclick = function() {
				modal.style.display = "none";
			}
			
		</script>
		<!-- 모달 실행 끝 -->
		
	
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>
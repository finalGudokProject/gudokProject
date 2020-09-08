<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- sweetalert시작 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	<!-- sweetalert끝 -->
</head>
<style>
	.starRv{
		background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
		background-size: auto 100%;
		width: 50px;
		height: 50px;
		display: inline-block;
		text-indent: -9999px;
		cursor: pointer;
	}
	.starRv.on{background-position:0 0;}
	
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
	
	.starPp{
		line-height:40px;
	}
	
	.starPp #cDate{
		vertical-align:bottom;
	}
	
	#reviewNameTd{
		line-height:62px;
	}
	#reviewNameTd span{
		vertical-align:middle;
	}
	
	#reviewNameTd img{
		align:right;
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
</style>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<form action="reviewUpdate.do" method="post" id="reviewUpForm">
	<div style="display:none;">
		<input type="hidden" value="${rv[0].reviewNo }" name="reviewNo">
		<input type="hidden" value="${rv[0].itemNo }" name="itemNo">
		<input type="hidden" value="${loginUser.memberNo }" name="memberNo">
		<input type="hidden" value="${loginUser.memberId }" name="memberId">
		<input type="hidden" value="${loginUser.email }" name="email">
		<input type="hidden" value="${rv[0].reviewDate}" name="reviewDate">
	</div>
	<div style="padding:1% 0 1% 18%;">
			<img src="${contextPath }/resources/images/reviewImg.png" style="width:7%;height:7%;">
			<span style="vertical-align:middle;font-size:50px;"><b>${rv[0].memberId } 상품평 수정</b></span>
		</div>
	<div class="container">
		<div class="row">
		
		<div class="col-12">
			<table align="center" style="width:80%;text-align:center;font-size:30px;border:1px solid lightgray;">
			<c:if test="${empty rv}">
			<div class="col-2"></div>
				<div class="col-8" id="emptyDiv" style="margin-top:2%;border:1px solid lightgray;">
					<div style="text-align:center;width:100%;"><img src="${contextPath }/resources/images/empty.png" style="width:30%;"></div>
					<div style="text-align:center;width:100%;font-size:40px;">해당 카테고리의 상품이 존재하지 않습니다.</div>
				</div>
			<div class="col-2"></div>
			</c:if>
			
			
			<c:if test="${!empty rv}">
				<tr>
					<td><div style="vertical-align:middle;font-size:50px; text-align:left;padding-left:2%;border-bottom:1px dashed lightgray;">평점 : 
						<div class="starRev" style="margin:2% 0 0 0;display:inline-block;">
						<div style="display:none;">
						<input type="hidden" value="${rv[0].reviewRate }" name="reviewRate" class="radioInput">
						<input type="radio" name="reviewRadio" id="radio1" value="1">
						<input type="radio" name="reviewRadio" id="radio2" value="2">
						<input type="radio" name="reviewRadio" id="radio3" value="3">
						<input type="radio" name="reviewRadio" id="radio4" value="4">
						<input type="radio" name="reviewRadio" id="radio5" value="5">
						</div>
							<c:choose>
								<c:when test="${rv[0].reviewRate < 1}">
									<span class="starRv">1</span>
									<span class="starRv">2</span>
									<span class="starRv">3</span>
									<span class="starRv">4</span>
									<span class="starRv">5</span>
								</c:when>
								<c:when test="${rv[0].reviewRate < 2 }">
									<span class="starRv on">1</span>
									<span class="starRv">2</span>
									<span class="starRv">3</span>
									<span class="starRv">4</span>
									<span class="starRv">5</span>
									<script>
										$(function(){
											$("#radio1").prop("checked", true);
										})
									</script>
								</c:when>
								
								<c:when test="${rv[0].reviewRate < 3 }">
									<span class="starRv on">1</span>
									<span class="starRv on">2</span>
									<span class="starRv">3</span>
									<span class="starRv">4</span>
									<span class="starRv">5</span>
									<script>
										$(function(){
											$("#radio2").prop("checked", true);
										})
									</script>
								</c:when>
								
								<c:when test="${rv[0].reviewRate < 4 }">
									<span class="starRv on">1</span>
									<span class="starRv on">2</span>
									<span class="starRv on">3</span>
									<span class="starRv">4</span>
									<span class="starRv">5</span>
									<script>
										$(function(){
											$("#radio3").prop("checked", true);
										})
									</script>
								</c:when>
								
								<c:when test="${rv[0].reviewRate < 5 }">
									<span class="starRv on">1</span>
									<span class="starRv on">2</span>
									<span class="starRv on">3</span>
									<span class="starRv on">4</span>
									<span class="starRv">5</span>
									<script>
										$(function(){
											$("#radio4").prop("checked", true);
										})
									</script>
								</c:when>
								<c:otherwise>
									<span class="starRv on">1</span>
									<span class="starRv on">2</span>
									<span class="starRv on">3</span>
									<span class="starRv on">4</span>
									<span class="starRv on">5</span>
									<script>
										$(function(){
											$("#radio5").prop("checked", true);
										})
									</script>
								</c:otherwise>
							</c:choose>
						</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<c:forEach var="r" items="${rv }">
							<c:if test="${!empty r.imageOriginalName }">
								<div style="display:inline; cursor:pointer;" class="reviewImg">
									<img src="${contextPath }/resources/iuploadFiles/${r.imageRename}" style="margin:2%;width:40%;border:1px solid lightgray;">
								</div>
							</c:if>
							<c:if test="${empty r.imageOriginalName }">
								등록한 사진이 없습니다.
							</c:if>
						</c:forEach>
						<script>
							$(function(){
								$(".reviewImg").on("click", function(){
									swal("","이미지는 수정이 불가능합니다.","error");
								})
							})
						</script>
					</td>
				</tr>
				<tr>
					<td>
						<div style="line-height:50px;vertical-align:middle; border-top:1px dashed lightgray;padding-top:2%;"><textarea style="width:96%;" name="reviewContent">${rv[0].reviewContent }</textarea></div>
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" style="vertical-align:middle;text-align:center;width:auto;margin:0 0 2% 0;letter-spacing:5px;" value="수정완료" id="completeBtn">
					</td>
				</tr>
				</c:if>
			</table>
		</div>
		
		</div>
	</div>
	</form>
	<script>
		$(function(){
			$("#completeBtn").on("click", function(e){
				e.preventDefault();
				/* var reviewNo = "${rv[0].reviewNo}";
				var itemNo = "${rv[0].itemNo}";
				var reviewContent = "${rv[0].reviewContent}";
				var reviewRate = $("input[type=radio]:checked").val();
				var memberNo = "${loginUser.memberNo}";
				var memberId = "${loginUser.memberId}";
				var email = "${loginUser.memberId}"; */
				swal({
					text : "상품평을 수정하시겠습니까?",
					buttons : ["예", "아니오"],
					closeOnEsc : false,
					dangerMode : true,
				}).then((result)=>{
					if(result){
						
					}else{
						$("#reviewUpForm").submit();
					}
				})
			})
		})
	</script>
	
	<script type="text/javascript">
	    $(document).ready(function(){
	        $(".retouchImgC").tooltip();
	    });
	</script>
	
	<script>
		$(function(){
			$('.starRev .starRv').on("click", function(){
				if(${rv[0].reviewRate} > $(this).text()){
					swal({
						text : "상품에 대한 불만 사항은 상품 문의를 통해 해주시길 바랍니다.\n 평점을 낮추시겠습니까?",
						buttons : ["예", "아니오"],
						closeOnEsc : false,
						dangerMode : true,
					}). then((result)=>{
						if(result){
							
						}else{
							$(this).parent().children('span').removeClass('on');
							$(this).addClass('on').prevAll('span').addClass('on');
							switch($(this).text()){
							case "1" : $("input:radio[id=radio1]").prop("checked", true);
									$(".radioInput").val($(this).text());
								break;
							case "2" : $("input:radio[id=radio2]").prop("checked", true);
									$(".radioInput").val($(this).text());
								break;
							case "3" : $("input:radio[id=radio3]").prop("checked", true);
									$(".radioInput").val($(this).text());
								break;
							case "4" : $("input:radio[id=radio4]").prop("checked", true);
									$(".radioInput").val($(this).text());
								break;
							case "5" : $("input:radio[id=radio5]").prop("checked", true);
									$(".radioInput").val($(this).text());
								break;
							}
						}
					})
				}else{
					$(this).parent().children('span').removeClass('on');
					$(this).addClass('on').prevAll('span').addClass('on');
					switch($(this).text()){
					case "1" : $("input:radio[id=radio1]").prop("checked", true);
							$(".radioInput").val($(this).text());
						break;
					case "2" : $("input:radio[id=radio2]").prop("checked", true);
							$(".radioInput").val($(this).text());
						break;
					case "3" : $("input:radio[id=radio3]").prop("checked", true);
							$(".radioInput").val($(this).text());
						break;
					case "4" : $("input:radio[id=radio4]").prop("checked", true);
							$(".radioInput").val($(this).text());
						break;
					case "5" : $("input:radio[id=radio5]").prop("checked", true);
							$(".radioInput").val($(this).text());
						break;
					}
				}
				
			});
		})
		
	</script>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>
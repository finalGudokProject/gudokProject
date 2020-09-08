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
	.starP{
		background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
		background-size: auto 100%;
		width: 30px;
		height: 30px;
		display: inline-block;
		text-indent: -9999px;
		cursor: pointer;
	}
	.starP.on{background-position:0 0;}
	
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
	
	.reviewImgClass{
		width:25rem;
		height:auto;
		margin-right:1%;
		border:1px solid lightgray !important;
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
.starRev{
		line-height:40px;
		padding-left:1%;
	}
	.starRev div{
		vertical-align:bottom;
	}
.starRv.on{background-position:0 0;}

	.reviewImgD{
		overflow:hidden;
		text-align:center;
		padding:2%;
		border-top:1px dashed lightgray;
	}
	.reviewImgD img{
		height:40%;
		width:40%;
		object-fit:cover;
		transform:(1.0);
		transition:transform.5s;
	}
	
	.reviewImgD img:hover{
		transform:scale(1.05);
		transition:transform.5s;
	}
</style>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<div style="padding:1% 0 1% 18%;">
			<img src="${contextPath }/resources/images/reviewImg.png" style="width:7%;height:7%;">
			<span style="vertical-align:middle;font-size:50px;"><b>${item.itemName } 전체 상품평</b></span>
		</div>
	<div class="container">
		<div class="row">
		
		<div class="col-12">
		<c:if test="${empty review}">
		<div style="width:100%;border:1px solid lightgray;border-radius:5rem;">
			<div style="text-align:center;width:100%;"><img src="${contextPath }/resources/images/empty.png" style="width:30%;"></div>
			<div style="text-align:center;width:100%;font-size:40px;">${item.itemName } 상품평이 존재하지 않습니다.</div>
		</div>
		
		</c:if>
		<c:if test="${!empty review}">
		<c:forEach var="r" items="${review }">
		<div style="margin-bottom:2%;"align="center">
		<table style="border:1px solid lightgray;margin:0 0 0 5%;width:80%;">
			<thead>
			<tr>
				<td id="reviewNameTd">
				<div class="row">
					<div class="col-9">
						<span style="font-size:40px;padding-left:2%;">${r.memberId }님의 상품평</span>
					</div>
					<c:if test="${loginUser.memberId == r.memberId }">
						<div class="col-3" style="text-align:right;padding-right:2%;">
							<input type="hidden" value="${r.reviewNo }">
							<input type="hidden" value="${r.itemNo }">
							<input type="hidden" value="${r.reviewContent }">
							<input type="hidden" value="${r.reviewRate }">
							<img src="resources/images/retouch.png" class="retouchImgC" style="width:3.5rem;border:1px solid lightgray;" title="상품평 수정하기">
							<img src="resources/images/reDelete.png" class="deleteImgC" style="width:3.5rem;border:1px solid lightgray;" title="상품평 삭제하기">
						</div>
					</c:if>
				</div>
				</td>
			</tr>
			
			<tr>
				<td>
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
						<c:if test="${!empty r.reviewDate && empty r.reviewModify }">
							<div style="display:inline-block;color:gray;">등록일 : ${r.reviewDate }</div>
						</c:if>
						<c:if test="${!empty r.reviewDate && !empty r.reviewModify }">
							<div style="display:inline-block;color:gray;">등록일 : ${r.reviewDate } / 수정일 : ${r.reviewModify}</div>
						</c:if>
					</div>
				</td>
			</tr>
			</thead>
			<tbody style="padding:2%;">
				<tr>
					<td>
						<div class="reviewImgD">
						<c:forEach var="i" items="${img }">
							<c:if test="${i.reviewNo == r.reviewNo && !empty i.imageRename}">
								<img src="${contextPath }/resources/iuploadFiles/${i.imageRename}" class="reviewImgClass">
							</c:if>
						</c:forEach>
						</div>
					</td>
				</tr>
				<tr>
					<td style="padding:2%;">
						<div class="reviewText" style="padding:2%;border:1px solid black;font-size:20px;">${r.reviewContent }</div>
					</td>
				</tr>
			</tbody>
		</table>
		</div>
		</c:forEach>
		</c:if>
		</div>
		
		</div>
	</div>
	<script type="text/javascript">
	    $(document).ready(function(){
	        $(".retouchImgC, .deleteImgC").tooltip();
	    });
	</script>
	
	<script>
		$(function(){
			$(".retouchImgC").on("mouseenter", function(){
				$(this).attr("src","${contextPath }/resources/images/retouchHover.png").css("cursor","pointer");
			}).on("mouseleave", function(){
				$(this).attr("src","${contextPath }/resources/images/retouch.png");
			}).on("click", function(){
				swal({
					text : "상품평을 수정하시겠습니까?",
					buttons : ["예", "아니오"],
					closeOnEsc : false,
					dangerMode : true,
				}).then((result)=>{
					if(result){
						
					}else{
						var reviewNo = $(this).parent().find("input:nth-child(1)").val();
						var itemNo = $(this).parent().find("input:nth-child(2)").val();
						var reviewContent = $(this).parent().find("input:nth-child(3)").val();
						var reviewRate = $(this).parent().find("input:nth-child(4)").val();
						var memberNo = "${loginUser.memberNo}";
						var memberId = "${loginUser.memberId}";
						var email = "${loginUser.email}";
						
						console.log("reviewNo : " + reviewNo + ",itemNo : " + itemNo + ",reviewContent : " + reviewContent
								 + ",reviewRate : " + reviewRate + ",memberNo : " + memberNo+ ",memberId : " + memberId + ",email : " + email);
						location.href="reviewDetail.do?reviewNo=" + reviewNo + "&itemNo=" + itemNo;
					}
				})
			})
			$(".deleteImgC").on("mouseenter", function(){
				$(this).attr("src","${contextPath }/resources/images/reDeleteHover.jpg").css("cursor","pointer");
			}).on("mouseleave", function(){
				$(this).attr("src","${contextPath }/resources/images/reDelete.png");
			}).on("click", function(){
				swal({
					text : "상품평을 삭제하시겠습니까?",
					buttons : ["예", "아니오"],
					closeOnEsc : false,
					dangerMode : true,
				}).then((result)=>{
					if(result){
						
					}else{
						var reviewNo = $(this).parent().find("input:nth-child(1)").val();
						var itemNo = $(this).parent().find("input:nth-child(2)").val();
						location.href="reviewDelete.do?reviewNo=" + reviewNo + "&itemNo=" + itemNo;
					}
				})
			})
		})
	</script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>
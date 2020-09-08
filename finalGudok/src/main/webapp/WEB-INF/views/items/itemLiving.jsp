<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	body {
	font-family: 'Jua', sans-serif;
	color: #495057;
	}
	
	ul{
		list-style: none;
		display:inline-block;
	}
	
	.paper{
		margin:2%;
		width:25%;
		height:auto;
		float:left;
		text-align:left;
		border:1px solid black;
	}
	#cateName{
		font-size:30px;
		margin:3% 0 1% 7%;
		line-height:100px;
		width:16%;
	}
	#cateName span:hover{
		cursor:pointer;
	}
	#cateName img{
		vertical-align:middle;
	}
	#cateName span{
		vertical-align:middle;
	}
	
	.detailDiv :hover{
		cursor:pointer;
	}
	
	/* 상품 리스트 정렬 CSS */
	#rankDiv{
		float:left;
		margin-left:2%;
		width:500px;
		height:auto;
		border:1px solid lightgray;
	}
	
	.rankDiv{
		float:left;
		size:30px;
		margin:0 3% 0 3%;
		width:17%;
		height:35px;
		display:inline-block;
		text-align:center;
		padding-top:4px;
	}
	
	#menu{
		background:white;
		width:220px;
		height:40px;
		vertical-align:middle !important;
		padding:2%;
		border-bottom:1px solid lightgray;
	}
	#menu a{
		display:block;
		color:black;
		vertical-align:middle !important;
	}	
	
	div.col-md-9{
		padding:0 !important;
	}
	
	.paperUl{
		padding:0px !important;
	}
	#menuId{
		margin-top:10%;
		padding-left:0;
		border:1px solid lightgray;
	}
	.smallMenu{
		display:none;
		width:180px;
		height:35px;
		opacity:90%;
		border: 1px solid black;
		left:60px;
		top:20px;
	}
	.smallMenu a{
		display:block;
	}
	
	.menuName{
		margin-left:10%;
		font-size:30px;
	}
	
	.listUl{
		padding:0 !important;
	}
	
	#itemsRowDiv{
		margin:5%;
		text-align:center;
	}
	.sortClass{
		width:8rem;
		height:8rem;
		display:block;
	}
	
	td{
		text-align:center;
	}
	
	/* .sortDivC :hover{
		cursor:pointer;
		background:lightyellow;
	} */
	
	.starR{
	  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
	  background-size: auto 100%;
	  width: 30px;
	  height: 30px;
	  display: inline-block;
	  text-indent: -9999px;
	  cursor: pointer;
	  margin:0 0 12px;
	}
	.starR.on{background-position:0 0;}
	
	.itemPriceDiv{
		font-size:25px;
		font-weight:bold;
	}
	
	#rateId{
		margin-bottom:3%;
	}
	
	.cardBody {
	    -ms-flex: 1 1 auto;
	    flex: 1 1 auto;
	    min-height: 1px;
	    padding: 1.25rem;
	    padding-bottom: 0;
	}
	
	.cardFooter{
	 	padding-bottom:5%;
	}
	
	.starRev{
		line-height:35px;
	}
	.starRev span{
		vertical-align:bottom;
	}
	
	.card{
		margin:0 auto;
		float:none;
		margin-bottom:10px;
	}
	
	.circle{
		width:6rem;
		height:6rem;
		position:absolute;
		z-index:1;
		margin:3% 0 0 2%;
	}
	
	.circle img{
		width:90%;
		height:90%;
		border-radius:1rem;
		border:1px solid red;
	}
	
	#ratePercentId{
		line-height:6rem;
		width:6rem;
	}
	#ratePercentId span{
		vertical-align:middle;
		text-align:center;
		width:6rem;
		font-size:30px;
		font-weight: bold;
		opacity: 90%;
	}
	
	.col-4{
		padding-bottom:8%;
	}
	
	
	.page-link, .page-item{
		font-size:30px;
	}
	.cateTableC td:hover{
		background:yellow;
		cursor:pointer;
	}
	
	.cardHeader{
		overflow:hidden;
	}
	.cardHeader .saleImg{
		height:100%;
		width:100%;
		object-fit:cover;
		transform:(1.0);
		transition:transform.5s;
	}
	
	.cardHeader .mainImg{
		height:22rem;
		width:100%;
		object-fit:cover;
		transform:(1.0);
		transition:transform.5s;
	}
	
	.cardHeader img:hover{
		transform:scale(1.1);
		transition:transform.5s;
	}

</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
<div class="container">
	<div class="row">
	<div class="col-md-12">
		<div id="cateName" style="font-size:50px;">
		<img src="${contextPath }/resources/images/living.png" style="width:70px;height:70px;">
		<span>리빙
			<c:if test="${livingChk != 'L0'}">
				<input type="hidden" id="categoryL0" value="L0">
			</c:if>
			<c:if test="${livingChk == 'L0' }">
				<input type="hidden" id="categoryL0" value="">
			</c:if>
		</span>
		
		
		
		</div>
		
		<div style="margin:0 0 3% 2%">
			<table style="display:block;" class="cateTableC">
				<tr>
					<td style="width:10%;" id="foodLife" class="sortCate"><input type="hidden" value="L1">생활용품</td>
					<td style="width:10%;" id="foodBody" class="sortCate"><input type="hidden" value="L2">바디케어</td>
					<td style="width:10%;" id="foodDeco" class="sortCate"><input type="hidden" value="L3">홈데코</td>
				</tr>
			</table>
			<div style="display:none;"><input type="text" name="categoryNo" id="categoryInput"></div>
			<script>
				$(function(){
					$("#cateName span").on("click", function(){
						location.href="itemLiving.do";
					})
				})
			</script>
			<script>
				$(function(){
					if("${categoryNo}" == "L1"){
						$(".cateTableC #foodLife").css({"text-decoration":"underline","background":"yellow","font-weight":"bold"});
					}else if("${categoryNo}" == "L2"){
						$(".cateTableC #foodBody").css({"text-decoration":"underline","background":"yellow","font-weight":"bold"});
					}else if("${categoryNo}" == "L3"){
						$(".cateTableC #foodDeco").css({"text-decoration":"underline","background":"yellow","font-weight":"bold"});
					}
				})
			</script>
			
			<script>
				$(function(){
					if("${sortNo}" == "S1"){
						$(".sortTable #newSort .sortDivC span").css({"background":"yellow","font-weight":"bold"});
					}else if("${sortNo}" == "S2"){
						$(".sortTable #bestSort .sortDivC span").css({"background":"yellow","font-weight":"bold"});
					}else if("${sortNo}" == "S3"){
						$(".sortTable #highSort .sortDivC span").css({"background":"yellow","font-weight":"bold"});
					}else if("${sortNo}" == "S4"){
						$(".sortTable #lowSort .sortDivC span").css({"background":"yellow","font-weight":"bold"});
					}
				})
			</script>
			
			<script>
				$(function(){
					$(".sortCate").on("click", function(){
						var sort = $(this).find("input").val();
						$("#categoryInput").val(sort);
						location.href="livingSort.do?categoryNo="+sort;
						
					})
					$(".detailDiv").on("mouseenter", function(){
						$(this).css({"box-shadow":"1px 1px 20px lightgray", "transition":"0.3s"});
					}).on("mouseleave", function(){
						$(this).css({"border":"1px solid lightgray","box-shadow":"none"});
					})
				})
				
			</script>
		</div>
			<div style="border-top:1px solid lightgray;border-bottom:1px solid lightgray;">
			<table align="center" style="margin-bottom:1%;" class="sortTable">
				<tr>
					<td class="sortRank" id="newSort"><input type="hidden" value="" class="catchHidden"><input type="hidden" value="S1" class="catchNew"><div class="sortDivC">
					<img src="${contextPath }/resources/images/newItem.png" class="sortClass"><span style="display:block;">신상품순</span>
					</div></td>
					<td class="sortRank" id="bestSort"><input type="hidden" value="" class="catchHidden"><input type="hidden" value="S2" class="catchBest"><div class="sortDivC">
					<img src="${contextPath }/resources/images/popul.png" class="sortClass"><span style="display:block;">인기순</span>
					</div></td>
					<td class="sortRank" id="highSort"><input type="hidden" value="" class="catchHidden"><input type="hidden" value="S3" class="catchHigh"><div class="sortDivC">
					<img src="${contextPath }/resources/images/high.png" class="sortClass"><span style="display:block;">높은 가격순</span>
					</div></td>
					<td class="sortRank" id="lowSort"><input type="hidden" value="" class="catchHidden"><input type="hidden" value="S4" class="catchLow"><div class="sortDivC">
					<img src="${contextPath }/resources/images/low.png" class="sortClass"><span style="display:block;">낮은 가격순</span>
					</div></td>
				</tr>
			</table>
			</div>
			<script>
				$(function(){
			 		$(".sortRank").on("click", function(){
						var hidden1 = $("#hiddenCategory").val();
						$(".catchHidden").val(hidden1);
						var categoryNo = $(this).find("input:nth-child(1)").val();
						var sortNo = $(this).find("input:nth-child(2)").val();
						
						if($("#categoryL0").val() == ""){
							/* console.log(categoryNo);
							console.log(sortNo); */
							if(categoryNo != ""){
								location.href="livingSort.do?categoryNo=" + categoryNo + "&sortNo=" + sortNo;
							}else if(categoryNo == ""){
								swal("","정렬할 상품이 없습니다.","error");
							}
						}else if($("#categoryL0").val() == "L0"){
							location.href="itemLiving.do?sortNo=" + sortNo;
						}
					})
					
				})
			</script>
			
	</div>
	
	
	
		<c:if test="${empty list }">
		<div class="row" id="itemsRowDiv" style="width:63rem;">
			<div class="col-md-12" id="emptyDiv" style="margin-top:2%;border:1px solid lightgray;">
				<div style="text-align:center;width:100%;"><img src="${contextPath }/resources/images/empty.png" style="width:30%;"></div>
				<div style="text-align:center;width:100%;font-size:40px;">해당 카테고리의 상품이 존재하지 않습니다.</div>
			</div>
		</div>
		</c:if>
		
		<c:if test="${!empty list && list.size() == 1 || list.size() == 2}">
		<div class="row" id="itemsRowDiv">
		<c:forEach var="i" items="${list }" varStatus="vs">
		<c:url var="idetail" value="idetail.do">
			<c:param name="itemNo" value="${i.itemNo }"/>
			<c:param name="page" value="${pi.currentPage }"/>
			<c:param name="memberNo" value="${loginUser.memberNo }"/>
		</c:url>
		<fmt:formatNumber var="discountPrice" value="${(i.itemPrice - i.itemPrice*(i.itemDiscount/100))}" type="number"/>
		<fmt:formatNumber var="itemPrice" value="${i.itemPrice}" type="number"/>
		<input type="hidden" value="${i.categoryNo}" id="hiddenCategory">
			<div class="col-4" onclick="location.href='${idetail}'" style="width:63rem;">
				<div class="card detailDiv">
					<c:if test="${i.itemDiscount != 0}" >
					<div class="cardHeader">
						<div class="circle">
							<div id="ratePercentId" style="position:absolute;"><span>${i.itemDiscount }%</span></div>
							<img src="resources/images/sale.png" class="saleImg">
						</div>
						<img src="${contextPath}/resources/uploadFiles/${i.itemRename}" class="card-img-top mainImg" alt="..." style="position:relative;">
					</div>
					</c:if>
					
					<c:if test="${i.itemDiscount == 0}">
					<div class="cardHeader">
					<img src="${contextPath}/resources/uploadFiles/${i.itemRename}" class="card-img-top mainImg" alt="...">
					</div>
					</c:if>
					<div class="cardBody">
						<h3 class="card-title"><b>${i.itemName }</b></h3>
						<c:if test="${!empty i.itemMemo }"><h5>${i.itemMemo}</h5></c:if>
						<c:if test="${empty i.itemMemo }"><h5>${i.itemName}입니다.</h5></c:if>
						<div class="itemPriceDiv">
						<c:if test="${i.itemDiscount != 0}">
							<s style="color:red;">${itemPrice }원</s>→${discountPrice }원
						</c:if>
						<c:if test="${i.itemDiscount == 0}">
							${itemPrice }원
						</c:if>
						</div>
						
						
						
						<div class="starRev">
							<c:choose>
								<c:when test="${i.itemRate == 0}">
									<span class="starR">1</span>
									<span class="starR">2</span>
									<span class="starR">3</span>
									<span class="starR">4</span>
									<span class="starR">5</span>
								</c:when>
								<c:when test="${i.itemRate < 2 }">
									<span class="starR on">1</span>
									<span class="starR">2</span>
									<span class="starR">3</span>
									<span class="starR">4</span>
									<span class="starR">5</span>
								</c:when>
								
								<c:when test="${i.itemRate < 3 }">
									<span class="starR on">1</span>
									<span class="starR on">2</span>
									<span class="starR">3</span>
									<span class="starR">4</span>
									<span class="starR">5</span>
								</c:when>
								
								<c:when test="${i.itemRate < 4 }">
									<span class="starR on">1</span>
									<span class="starR on">2</span>
									<span class="starR on">3</span>
									<span class="starR">4</span>
									<span class="starR">5</span>
								</c:when>
								
								<c:when test="${i.itemRate < 5 }">
									<span class="starR on">1</span>
									<span class="starR on">2</span>
									<span class="starR on">3</span>
									<span class="starR on">4</span>
									<span class="starR">5</span>
								</c:when>
								<c:otherwise>
									<span class="starR on">1</span>
									<span class="starR on">2</span>
									<span class="starR on">3</span>
									<span class="starR on">4</span>
									<span class="starR on">5</span>
								</c:otherwise>
							</c:choose>
						  <div style="display:inline-block;color:gray;">(리뷰수:${i.reviewCount}개)</div>
						</div>
						
						
						  <div id="rateId">
							  <c:if test="${i.itemRate == 0}">
							  	(평점 : 0점 / 찜한 사람 : ${i.itemChoice }명)
							  </c:if>
							  <c:if test="${i.itemRate != 0}">
							  	(평점 : ${i.itemRate}점 / 찜한 사람 : ${i.itemChoice }명)
							  </c:if>
						  </div>
						  
						</div>
						<div class="row">
							<div class="col-4" id="btnBlank"></div>
							<div class="col-4" style="padding:0px;">
								<button class="btn btn-primary" style="width:100%;height:100%;" id="preview${vs.index}">상품평보기</button>
								<input type="hidden" value="${i.itemNo }">
							</div>
							<div class="col-4" id="btnBlank"></div>
						</div>
						<div class="cardFooter"></div>
				</div>
			</div>
		</c:forEach>
		</div>
		</c:if>
		
		<c:if test="${!empty list && list.size() >= 3}">
		<div class="row" id="itemsRowDiv">
		<c:forEach var="i" items="${list }" varStatus="vs">
		<c:url var="idetail" value="idetail.do">
			<c:param name="itemNo" value="${i.itemNo }"/>
			<c:param name="page" value="${pi.currentPage }"/>
			<c:param name="memberNo" value="${loginUser.memberNo }"/>
		</c:url>
		<fmt:formatNumber var="discountPrice" value="${(i.itemPrice - i.itemPrice*(i.itemDiscount/100))}" type="number"/>
		<fmt:formatNumber var="itemPrice" value="${i.itemPrice}" type="number"/>
		<input type="hidden" value="${i.categoryNo}" id="hiddenCategory">
			<div class="col-4" onclick="location.href='${idetail}'" class="detailDiv">
				<div class="card detailDiv">
					<c:if test="${i.itemDiscount != 0}" >
					<div class="cardHeader">
						<div class="circle">
							<div id="ratePercentId" style="position:absolute;"><span>${i.itemDiscount }%</span></div>
							<img src="resources/images/sale.png" class="saleImg">
						</div>
						<img src="${contextPath}/resources/uploadFiles/${i.itemRename}" class="card-img-top mainImg" alt="..." style="position:relative;">
					</div>
					</c:if>
					
					<c:if test="${i.itemDiscount == 0}">
					<div class="cardHeader">
					<img src="${contextPath}/resources/uploadFiles/${i.itemRename}" class="card-img-top mainImg" alt="...">
					</div>
					</c:if>
					<div class="cardBody">
						<h3 class="card-title"><b>${i.itemName }</b></h3>
						<c:if test="${!empty i.itemMemo }"><h5>${i.itemMemo}</h5></c:if>
						<c:if test="${empty i.itemMemo }"><h5>${i.itemName}입니다.</h5></c:if>
						<div class="itemPriceDiv">
						<c:if test="${i.itemDiscount != 0}">
							<s style="color:red;">${itemPrice }원</s>→${discountPrice }원
						</c:if>
						<c:if test="${i.itemDiscount == 0}">
							${itemPrice }원
						</c:if>
						</div>
						
						
						
						<div class="starRev">
							<c:choose>
								<c:when test="${i.itemRate == 0}">
									<span class="starR">1</span>
									<span class="starR">2</span>
									<span class="starR">3</span>
									<span class="starR">4</span>
									<span class="starR">5</span>
								</c:when>
								<c:when test="${i.itemRate < 2 }">
									<span class="starR on">1</span>
									<span class="starR">2</span>
									<span class="starR">3</span>
									<span class="starR">4</span>
									<span class="starR">5</span>
								</c:when>
								
								<c:when test="${i.itemRate < 3 }">
									<span class="starR on">1</span>
									<span class="starR on">2</span>
									<span class="starR">3</span>
									<span class="starR">4</span>
									<span class="starR">5</span>
								</c:when>
								
								<c:when test="${i.itemRate < 4 }">
									<span class="starR on">1</span>
									<span class="starR on">2</span>
									<span class="starR on">3</span>
									<span class="starR">4</span>
									<span class="starR">5</span>
								</c:when>
								
								<c:when test="${i.itemRate < 5 }">
									<span class="starR on">1</span>
									<span class="starR on">2</span>
									<span class="starR on">3</span>
									<span class="starR on">4</span>
									<span class="starR">5</span>
								</c:when>
								<c:otherwise>
									<span class="starR on">1</span>
									<span class="starR on">2</span>
									<span class="starR on">3</span>
									<span class="starR on">4</span>
									<span class="starR on">5</span>
								</c:otherwise>
							</c:choose>
						  <div style="display:inline-block;color:gray;">(리뷰수:${i.reviewCount}개)</div>
						</div>
						
						
						  <div id="rateId">
							  <c:if test="${i.itemRate == 0}">
							  	(평점 : 0점 / 찜한 사람 : ${i.itemChoice }명)
							  </c:if>
							  <c:if test="${i.itemRate != 0}">
							  	(평점 : ${i.itemRate}점 / 찜한 사람 : ${i.itemChoice }명)
							  </c:if>
						  </div>
						  
						</div>
						<div class="row">
							<div class="col-4" id="btnBlank"></div>
							<div class="col-4" style="padding:0px;">
								<button class="btn btn-primary" style="width:100%;height:100%;" id="preview${vs.index}">상품평보기</button>
								<input type="hidden" value="${i.itemNo }">
							</div>
							<div class="col-4" id="btnBlank"></div>
						</div>
						<div class="cardFooter"></div>
				</div>
			</div>
		</c:forEach>
		</div>
		</c:if>
		<script>
				$(function(){
					$(".sortTable td").on("mouseenter", function(){
						$(this).css("cursor","pointer");
						if($(this).children().find("span").css("font-weight") == 700){
							$(this).children().find("span").css({"background":"yellow","text-decoration":"underline"});
						}else{
							$(this).children().find("span").css({"background":"yellow"});
						}
					}).on("mouseleave", function(){
						if($(this).children().find("span").css("font-weight") == 700){
							$(this).children().find("span").css({"background":"yellow","text-decoration":"none"});
						}else{
							$(this).children().find("span").css({"background":"white"});
						}
					})
				})
			</script>
		<c:forEach var="i" items="${list }" varStatus="vs">
		<script>
			$(function(){
				$("#preview${vs.index}").on("click", function(event){
					var preview = $(this).attr("id");
					console.log(preview);
					var review = $(this).next().val();
					console.log(review);
					event.stopPropagation();
				})
				$("#preview${vs.index}").on("click",function(){
					var itemNo = $(this).next().val();
					location.href="itemReview.do?itemNo="+itemNo;
				})
			})
			
		
		</script>
		</c:forEach>
		<c:if test="${empty list }">
		
		</c:if>
		<c:if test="${!empty list}">
			<div class="col-12">
			
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
				<c:if test = "${pi.currentPage  == 1}">
					<li class="page-item disabled">
				      <a class="page-link" href="#" tabindex="-1">이전</a>
				    </li>
				</c:if>
				<c:if test = "${pi.currentPage > 1 }">
					<c:url var = "ilistBack" value = "itemFood.do">
						<c:param name="page" value="${pi.currentPage - 1 }"/>
					</c:url>
					<li class="page-item">
				      <a class="page-link" href="${ilistBack}">이전</a>
				    </li>
				</c:if>
				
				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
					<c:if test="${p == pi.currentPage }">
						<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1">${p }</a></li>
					</c:if>
					<c:if test="${p != pi.currentPage }">
						<c:url var="ilistCheck" value="itemFood.do">
							<c:param name="page" value="${p}"/>
						</c:url>
						<li class="page-item"><a class="page-link" href="${ilistCheck }">${p }</a></li>
					</c:if>
				</c:forEach>
				
				<c:if test = "${pi.currentPage eq pi.maxPage}">
					<li class="page-item disabled">
				      <a class="page-link" href="#" tabindex="-1">다음</a>
				    </li>
				</c:if>
				<c:if test = "${pi.currentPage lt pi.maxPage}">
					<c:url var = "ilistAfter" value = "itemFood.do">
						<c:param name="page" value="${pi.currentPage + 1 }"/>
					</c:url>
					<li class="page-item">
				      <a class="page-link" href="${ilistAfter }">다음</a>
				    </li>
				</c:if>
				</ul>
			</nav>
		</div>
		</c:if>
	</div>
</div>

	<!-- <script>
		$(function(){
			$(".btn-primary").on("click", function(){
				swal("","확인","warning").then((value)=>{
					swal("","여기서 값 넣어요","info");
				});
			})
		})
	</script> -->

	
	<!-- 사이드 메뉴바 -->
	<script>
	$(function(){
		$(".menu").mouseenter(function(){
			$(this).find("li").css("display","block").css("background","white");
		}).mouseleave(function(){
			$(this).find("li").css("display","none");
		})
	})
	</script>
	<!-- <script>
		$(function(){
			$(".cardHeader, .cardBody, #btnBlank, .cardFooter").click(function(){
				var itemNo = $(this).find("input[type=hidden]").val();
				console.log(itemNo);
				location.href="itemDetail.do?itemNo+" + ${i.itemNo} + "&page="+${pi.currentPage};
			}).mouseenter(function(){
				$(this).css("cursor","pointer");
			})
		})
	</script> -->
<jsp:include page="../common/footer.jsp"/>
</body>
</html>
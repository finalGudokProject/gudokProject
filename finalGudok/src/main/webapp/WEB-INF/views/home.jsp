<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <title>메인페이지</title>
    <style>
        /*메인 */
        .cardWrap{
          text-align: center;
        }

        .cardWrap a{
          color: black;
        }

        .card{
          margin: 0 30px 0 30px;
          display: inline-block;
        }

        .carousel-inner > .item > img{
          height: 10px;
        }
        
        /*폰트 적용*/
        body{
          font-family: 'Jua', sans-serif;
        }
        
        .moveToDetail:hover{
        	cursor:pointer;
        }
        
        .moveToList{
        	color:#495057 !important;
        }
        
        .moveToList:hover{
        	color:black !important;
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
  </head>
  <body>
  	
  	<header>
    <jsp:include page="common/menubar.jsp"/>
 	</header>

	<section>
      <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="resources/images/carousel2.jpg" class="d-block w-100" alt="...">
          </div>
          <div class="carousel-item">
            <img src="resources/images/flower.jpg" class="d-block w-100" alt="...">
          </div>
          <div class="carousel-item">
            <img src="resources/images/salad.jpg" class="d-block w-100" alt="...">
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>

      <br><br><br><br><br>

      <div class=cardWrap>
        <p style="font-size:2em;"><a href="itemNew.do" class="moveToList">오늘의 신상품 ></a></p>
        <br>

        <c:forEach items="${newList }" var="newList">
        <div class="card" style="width: 18rem;">
          <a class="moveToDetail"><img src="${contextPath}/resources/uploadFiles/${newList.itemRename}" class="card-img-top" alt="..."></a>
          <input type="hidden" value="${newList.itemNo }">
          <div class="card-body">
            <p class="card-text">${newList.itemName }</p>
            <p class="card-text">${newList.itemMemo }</p>
          </div>
        </div>
        </c:forEach>
      </div>

      <br><br><br><br><br>

      <div class=cardWrap>
        <p style="font-size:2em;"><a href="itemBest.do" class="moveToList">베스트 상품 ></a></p>
        <br>
		
		<c:forEach items="${bestList }" var="best">
        <div class="card" style="width: 18rem;">
          <a class="moveToDetail"><img src="${contextPath}/resources/uploadFiles/${best.itemRename}" class="card-img-top" alt="..."></a>
          <input type="hidden" value="${best.itemNo }">
          <div class="card-body">
            <p class="card-text">${best.itemName }</p>
            <p class="card-text">${best.itemMemo }</p>
          </div>
        </div>
        </c:forEach>
      </div>

      <br><br><br><br><br>
      
      <div class=cardWrap>
        <p style="font-size:2em;">지금 가장 핫한 상품</p>
        <br>

      	<div id="wholeWrap">
        </div>
      </div>

      <br><br><br><br><br>

      <div class=cardWrap>
        <p style="font-size:2em;">추천상품</p>
        <br>
		
		<c:if test="${loginUser.gender == 'M' }">
        <c:forEach items="${recommendMList }" var="recommend">
        <div class="card" style="width: 18rem;">
          <a class="moveToDetail"><img src="${contextPath}/resources/uploadFiles/${recommend.imageRename}" class="card-img-top" alt="..."></a>
          <input type="hidden" value="${recommend.itemNo }">
          <div class="card-body">
            <p class="card-text">${recommend.itemName }</p>
            <p class="card-text">${recommend.itemMemo }</p>
          </div>
        </div>
        </c:forEach>
        </c:if>
        <c:if test="${loginUser.gender == 'F' }">
        <c:forEach items="${recommendFList }" var="recommend">
        <div class="card" style="width: 18rem;">
          <a class="moveToDetail"><img src="${contextPath}/resources/uploadFiles/${recommend.imageRename}" class="card-img-top" alt="..."></a>
          <input type="hidden" value="${recommend.itemNo }">
          <div class="card-body">
            <p class="card-text">${recommend.itemName }</p>
            <p class="card-text">${recommend.itemMemo }</p>
          </div>
        </div>
        </c:forEach>
        </c:if>
        <c:if test="${loginUser.gender == 'N' || empty loginUser }">
        <c:forEach items="${recommendCList }" var="recommend">
        <div class="card" style="width: 18rem;">
           <a class="moveToDetail"><img src="${contextPath}/resources/uploadFiles/${recommend.imageRename}" class="card-img-top" alt="..."></a>
          <input type="hidden" value="${recommend.itemNo }">
          <div class="card-body">
            <p class="card-text">${recommend.itemName }</p>
            <p class="card-text">${recommend.itemMemo }</p>
          </div>
        </div>
        </c:forEach>
        </c:if>
      </div>
      <br><br><br>
	</section>
    <!-- Footer -->
    <footer>
  		<jsp:include page="common/footer.jsp"/>
  	</footer>
  	
  <script>
	  function hotList(){
			/* alert("핫리스트 실행"); */
			
			$.ajax({
				url:"hotList.do",		
				dataType:"json",
				success:function(data){
					var wholeWrap = $("#wholeWrap");
					wholeWrap.empty();

					for(var i in data){
						var card = $("<div>").addClass("card").css("width","18rem");
						var aTag = $("<a>").addClass("moveToDetail");
						var imageTag = $("<img>").addClass("card-img-top").attr({"src":"${contextPath}/resources/uploadFiles/"+data[i].imageRename, "alt":"..."});
						var hidden = $("<input>").attr("type","hidden").attr("value",data[i].itemNo);
						var cardBody = $("<div>").addClass("card-body");
						var pTag1 = $("<p>").addClass("card-text").text(data[i].itemName);
						var pTag2 = $("<p>").addClass("card-text").text(data[i].itemMemo);

						cardBody.append(pTag1);
						cardBody.append(pTag2);
						aTag.append(imageTag);
						card.append(aTag);
						card.append(hidden);
						card.append(cardBody);
						
						wholeWrap.append(card);
					}
				},
				error:function(request, status, errorData){
	              alert("error code: " + request.status + "\n"
	                         +"message: " + request.responseText
	                         +"error: " + errorData);
				}
			})
		}
	  
		
		$(function(){
			hotList();
			
			/* setInterval(function(){
				hotList();
			}, 10000); */
			
		})


  </script>
  
  <script>  	
  	$(document).on('click','.moveToDetail',function(){
  		var itemNo = $(this).parent().find("input").val();
		/* alert(itemNo); */
		location.href="idetail.do?itemNo="+itemNo+"&page=1";
	});
  	
  </script>
 
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>
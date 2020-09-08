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
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
  </head>
  <body>
  
    <jsp:include page="common/menubar.jsp"/>
 

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
        <p style="font-size:2em;"><a href="#">오늘의 신상품 ></a></p>
        <br>

        <div class="card" style="width: 18rem;">
          <a href="#"><img src="resources/images/salad1.jpg" class="card-img-top" alt="..."></a>
          <div class="card-body">
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          </div>
        </div>

        <div class="card" style="width: 18rem;">
          <a href="#"><img src="resources/images/salad1.jpg" class="card-img-top" alt="..."></a>
          <div class="card-body">
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          </div>
        </div>

        <div class="card" style="width: 18rem;">
          <a href="#"><img src="resources/images/salad1.jpg" class="card-img-top" alt="..."></a>
          <div class="card-body">
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          </div>
        </div>

        <div class="card" style="width: 18rem;">
          <a href="#"><img src="resources/images/salad1.jpg" class="card-img-top" alt="..."></a>
          <div class="card-body">
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          </div>
        </div>
      </div>

      <br><br><br><br><br>

      <div class=cardWrap>
        <p style="font-size:2em;"><a href="#">베스트 상품 ></a></p>
        <br>

        <div class="card" style="width: 18rem;">
          <a href="#"><img src="resources/images/salad1.jpg" class="card-img-top" alt="..."></a>
          <div class="card-body">
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          </div>
        </div>

        <div class="card" style="width: 18rem;">
          <a href="#"><img src="resources/images/salad1.jpg" class="card-img-top" alt="..."></a>
          <div class="card-body">
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          </div>
        </div>

        <div class="card" style="width: 18rem;">
          <a href="#"><img src="resources/images/salad1.jpg" class="card-img-top" alt="..."></a>
          <div class="card-body">
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          </div>
        </div>

        <div class="card" style="width: 18rem;">
          <a href="#"><img src="resources/images/salad1.jpg" class="card-img-top" alt="..."></a>
          <div class="card-body">
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          </div>
        </div>
      </div>

      <br><br><br><br><br>

      <div class=cardWrap>
        <p style="font-size:2em;">지금 가장 핫한 상품</p>
        <br>

        <div class="card" style="width: 18rem;">
          <a href="#"><img src="resources/images/salad1.jpg" class="card-img-top" alt="..."></a>
          <div class="card-body">
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          </div>
        </div>

        <div class="card" style="width: 18rem;">
          <a href="#"><img src="resources/images/salad1.jpg" class="card-img-top" alt="..."></a>
          <div class="card-body">
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          </div>
        </div>

        <div class="card" style="width: 18rem;">
          <a href="#"><img src="resources/images/salad1.jpg" class="card-img-top" alt="..."></a>
          <div class="card-body">
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          </div>
        </div>

        <div class="card" style="width: 18rem;">
          <a href="#"><img src="resources/images/salad1.jpg" class="card-img-top" alt="..."></a>
          <div class="card-body">
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          </div>
        </div>
      </div>

      <br><br><br><br><br>

      <div class=cardWrap>
        <p style="font-size:2em;">JM's 추천</p>
        <br>

        <div class="card" style="width: 18rem;">
          <a href="#"><img src="resources/images/salad1.jpg" class="card-img-top" alt="..."></a>
          <div class="card-body">
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          </div>
        </div>

        <div class="card" style="width: 18rem;">
          <a href="#"><img src="resources/images/salad1.jpg" class="card-img-top" alt="..."></a>
          <div class="card-body">
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          </div>
        </div>

        <div class="card" style="width: 18rem;">
          <a href="#"><img src="resources/images/salad1.jpg" class="card-img-top" alt="..."></a>
          <div class="card-body">
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          </div>
        </div>

        <div class="card" style="width: 18rem;">
          <a href="#"><img src="resources/images/salad1.jpg" class="card-img-top" alt="..."></a>
          <div class="card-body">
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          </div>
        </div>
      </div>

      <br><br><br>
      <hr>
	</section>
	
      <!-- Footer -->
    <footer class="page-footer font-small indigo">

      <!-- Footer Links -->
      <div class="container">
  
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
          <!-- Grid column -->
  
          <!-- Grid column -->
          <!-- <div class="col-md-2 mb-3">
          <h6 class="text-uppercase font-weight-bold">
              <a href="#!">Contact</a>
          </h6>
          </div> -->
          <!-- Grid column -->
  
      </div>
      <!-- Grid row-->
      <hr class="rgba-white-light" style="margin: 0 15%;">
  
      <!-- Grid row-->
      <div class="row d-flex text-center justify-content-center mb-md-0 mb-4">
  
          <!-- Grid column -->
          <div class="col-md-8 col-12 mt-5">
          <p style="line-height: 1.7rem">
            회사명 : 주식회사 Goose <br>
            사업자등록번호 : 123-45-7890 <br>
            주소 : 경기도 동두천시 동두천로 139 부영아파트 902동 1104호 <br>
            연락처 : 010-1234-5678 <br>
            개인정보관리 책임자 : 박재명 <br>
            대표자 : 박재명(JM)
          </p>
          </div>
          <!-- Grid column -->

     </div>
      <!-- Grid row-->
      <hr class="clearfix d-md-none rgba-white-light" style="margin: 10% 15% 5%;">
  
      <!-- Copyright -->
      <div class="footer-copyright text-center py-3">© 2020 Copyright : Goose, All rights reserved
      </div>
      <!-- Copyright -->
  
  </footer>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>



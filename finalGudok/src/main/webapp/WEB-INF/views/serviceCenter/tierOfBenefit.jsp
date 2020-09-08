<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<title></title>
<style>
    .list{
        margin:20px;
        list-style-type: none;
    }
    table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
  
  #list a{
    color:black;
    text-decoration: none;
  }
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<br><br><br>
    <div class="container">
    <div class="row">
      <div class="col-3">
        <h1 align="center">고객센터</h1>
        <ul class="list" id="list">
            <li style="margin-bottom: 5%;"><img src="resources/images/Alert.png" style="width:20%; height:20%;margin-bottom:3%"><a href="noticeList.do">공지사항</a></li>
            <li style="margin-bottom: 5%;"><img src="resources/images/FAQ.png" style="width:20%; height:20%;margin-bottom:3%"><a href="FAQList.do">FAQ</a></li>
			<li style="margin-bottom: 5%;"><img src="resources/images/inquiary.png" style="width:20%; height:20%;margin-bottom:3%"><a href="sinquiryList.do">1:1문의</a></li>
            <li style="margin-bottom: 5%;"><img src="resources/images/proposal.png" style="width:20%; height:20%;margin-bottom:3%"><a href="productProposalList.do">상품제안</a></li>
            <li style="margin-bottom: 5%;"><img src="resources/images/benefit1.png" style="width:20%; height:20%;margin-bottom:3%"><a id="tier_benefit" style="color:rgb(0, 125, 255);" readonly>등급별 혜택</a></li>
        </ul>
      </div>
      <div class="col-9">
        <div style="font-size: 30px;">등급별 혜택(전월 구매 실적)</div>
         
        
        <table style="text-align: center; margin-top:15px">
      <thead>
        <tr>
            <th>알</th>
            <th >아기거위</th>
            <th>어른거위</th>
            <th>황금거위</th>
        </tr> 
        <tr>
            <th>5만원 미만</th>
            <th>5만원 이상</th>
            <th>20만원 이상</th>
            <th>30만원 이상</th>
        </tr>
        <tr>
            <th>구독시 0.1% 적립</th>
            <th>구독시 1% 적립</th>
            <th>구독시 3% 적립</th>
            <th>구독시 5% 적립</th>
        </tr>
      </thead>
      <tbody >
        <tr>
            <td><img src="resources/images/egg.png" style="width:100px; height:100px;"></td>
            <td><img src="resources/images/babygoose.png" style="width:100px; height:100px;"></td>
            <td><img src="resources/images/adultgoose.png" style="width:100px; height:100px;"></td>
            <td><img src="resources/images/goldengoose.png" style="width:100px; height:100px;"></td>
        </tr>
      </tbody>
    </table>
      </div>
    </div>
    </div>
    <br><br><br><br>
    <footer class="page-footer font-small indigo">
		<jsp:include page="../common/footer.jsp" />
	</footer>
	<br><br><br><br><br>
</body>
</html>
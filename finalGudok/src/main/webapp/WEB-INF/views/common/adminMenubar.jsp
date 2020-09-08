<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
   
   
   
    <title>adminPage</title>
   
    <style>
body{
    font-family: 'Noto Sans KR', sans-serif;
    background-color:#F5F5F5;
    /* font-family: 'Jua', sans-serif;     */
}

img{
    max-width: 100%; 
    height: auto;
    padding:0 !important;
    
}
img:hover{
cursor: pointer;
}

.container-fluid {
    width: 100%;
    padding-right: 0px;
    padding-left: 0px; 
    margin-right: 0;
    margin-left: 0;

}


.box{
    padding:30px;
    
    background-color: #ffffff;
    height:1100px;
  
}

.container {
    width: 100%;
    margin-right: auto;
    margin-left: auto;
    margin:auto;
}  


div {
    display: block;
}

.flex-xl-nowrap {
    -ms-flex-wrap: nowrap!important;
    flex-wrap: nowrap!important;
}
.row {
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    margin-right: 1.5px;
    margin-left: 1.5px;
}


.bd-sidebar {
    /* -ms-flex: 0 1 320px; */
    flex: 0 1 320px;
    position: fixed;
    
    z-index: 1000;
    height: 100vh;
    
    -ms-flex-order: 0;
    order: 0;
    border-bottom: 1px solid rgba(0,0,0,.1);
    width:250px;
    margin-left:0px;
    margin-top:0px;
    background-color: #CFD8DC; 
    float:left; 
    overflow-y:hidden; 
    overflow-x:hidden;
    font-color:red;
}







.bd-content {
    -ms-flex-order: 1;
    order: 1; /*div순서*/
    margin-top:0;
  
}

::-webkit-scrollbar {
/* display:none; */
width: 7px; 
height: 7px; 
}
::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment {
display: block; 
height: 10px; 

}
::-webkit-scrollbar-track {
/* background: #efefef;  */
background: transparent;
-webkit-border-radius: 10px; 
border-radius:10px; 
/* -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.2) */
}
::-webkit-scrollbar-thumb {
height: 50px; 
width: 50px; 
 background-color:rgba(69,75,77,0.2); 
/* background-color:#b1bfc5; */
-webkit-border-radius: 8px; 
border-radius: 8px; 
-webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.1)
}


.bd-links {
    display: block!important;
    max-height: calc(100vh - 9rem);
    height: 100vh;
    overflow-y: auto;
    /* padding-top: 1rem; */
    padding-bottom: 1rem;
   
   
}

.nav {
  
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    padding-left: 0;
    margin-bottom: 0;
    list-style: none;
   
}

.sd_ul {
    margin-top: 0.5rem;
    margin-bottom: 0.5rem;
    display: block;
    list-style-type: disc;
    color:#424242;
 
    
}

.sd_ul li{
    padding:5px 0;
    list-style: none;
}

.sd_ul li a{
    color:#424242;
}

.sd_ul:hover{

  color:#11538C;
transition:2s;
	
}

.sd_ul li a:hover{

  color:#0D47A1;
transition:1s;
text-decoration:none;
	
}







table {
  width: 100%;
  margin-bottom: 1rem;
  color: #212529;
}
table th,
table td {
  padding: 0.75rem;
  vertical-align: top;
  border-top: 1px solid #dee2e6;
  border-bottom: 1px solid #dee2e6;
  text-align:center;
}

.table thead th {
  vertical-align: bottom;
  border-bottom: 2px solid #dee2e6;
}
.table tbody + tbody {
  border-top: 2px solid #dee2e6;
}

.sd_btn{
	background:#6AAED9;
	color:white;
	border-radius:5px;
	padding:3%;
	width:40%;
	transition:0.5s;
  	position:relative;
  	border:1px solid #6AAED9;
	margin-bottom:2%;
	font-size:14px;
}
.sd_btn:hover{
  background:#11538C;
  color:#ffffff;
  border:1px solid #11538C;
}

.sd_btn:hover:before,#btn:hover:after{
  width:100%;
  transition:0.5s;
}

.btn{
	background:#90A4AE;
	color:white;
	border-radius:5px;
	padding:5px 20px;
	transition:0.5s;
  	position:relative;
  	border:1px solid #B0BEC5;
	margin-bottom:2%;
	font-size:14px;
}
.btn:hover{
  background:#424242;
  color:#ffffff;
  border:1px solid #11538C;
}

.btn:hover:before,#btn:hover:after{
  width:100%;
  transition:0.5s;
}


/*사이드바 css*/

.table {
  width: 100%;
  color: #212529;
}
.table th,
.table td {
  padding: 0.5rem 1rem;
  vertical-align: top;
  border-top: 1px solid #dee2e6;
  /* border-bottom: 1px solid #dee2e6; */
}




.mainbox{
    position:absolute; 
    padding:30px; 
    top:50%; 
    left:50%; 
    background-color:white; 
    transform:translate(-50%,-50%);

}


.content{
    margin-left:250px;
    background-color: #F5F5F5;
    padding:30px;

}


.nav__list input[type=checkbox]:checked + label + ul {
  max-height: 1000px;
}

.nav__list input[type=checkbox]:checked + label > span {
  -webkit-transform: rotate(90deg);
      -ms-transform: rotate(90deg);
          transform: rotate(90deg);
}

.nav__list li > span {
  -webkit-transform: rotate(90deg);
      -ms-transform: rotate(90deg);
          transform: rotate(90deg);
}

.group-list,
.sub-group-list,
.sub-sub-group-list {
  height: 100%;
  max-height: 0;
  overflow: hidden;
  -webkit-transition: max-height .5s ease-in-out;
          transition: max-height .5s ease-in-out;
}

label > span {
  float: right;
  -webkit-transition: -webkit-transform .65s ease;
          transition: transform .65s ease;
}

.nav label {
  cursor: pointer;
}


.nav a,
.nav label {
  display: block;
  color: #fff;
  background-color: #151515;
  box-shadow: inset 0 -1px #1d1d1d;
  -webkit-transition: all .25s ease-in;
          transition: all .25s ease-in;
          }

/*페이징 처리용 cs*/
.pagination-t {
            display: flex;
            padding-left: 0;
            list-style: none;
            border-radius: 0.25rem;
        }

        .page-link-t {
            position: relative;
            display: block;
            padding: 0.5rem 0.75rem;
            margin-left: -1px;
            line-height: 1.25;
            color: black;
            background-color: #ffffff;
            border: 1px solid #dee2e6;
        }

        .page-link-t:hover {
            z-index: 2;
            color: #424242;
            text-decoration: none;
            background-color: #CFD8DC;
            border-color: #CFD8DC;
        }

        .page-link-t:focus {
            z-index: 3;
            outline: 0;
        }

        .page-item-t:first-child .page-link-t {
            border-top-left-radius: 0.25rem;
            border-bottom-left-radius: 0.25rem;
        }

        .page-item-t:last-child .page-link-t {
            border-top-right-radius: 0.25rem;
            border-bottom-right-radius: 0.25rem;
        }

        .page-item-t.active-t .page-link-t {
            z-index: 3;
            color: #fff;
            background-color: #6AAED9;
            border-color:#6AAED9;
        }

        .page-item-t.disabled-t .page-link-t {
            color: #6c757d;
            pointer-events: none;
            cursor: auto;
            background-color: #fff;
            border-color: #dee2e6;
        }


        .sr-only-t {
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip: rect(0, 0, 0, 0);
            white-space: nowrap;
            border: 0;
        }

        .page-center {
            display: flex;
            justify-content: center;
            /*가운데 정렬*/
            align-items: center;
        }
        
        #cursor{
		cursor: pointer;
		
		}
		 #cursor:hover{
		cursor: pointer;
		
		text-decoration: underline;
		
		}
    </style>
  </head>




  <body>
    <!--사이드바-->
    <c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
    <div class="container-fluid" style="background-color: red;" >
        <div class="row">
            <div class="col-md-3 bd-sidebar">
                <img src="resources/images/logo2.png" style="padding:0;" onclick="location.href='aMain.do'">
                
                <h2 style="text-align: center; font-size: 18px; margin-top:35px;"><b>관리자</b>님, 환영합니다.</h2>
                <br>
                <div style="text-align:center">
                <input type="button" class="sd_btn" value="쇼핑몰 이동" onclick="location.href='home.do'">
                &nbsp;
                <input type="button" class="sd_btn" value="로그아웃" onclick="location.href='logout.do'">
            </div>
                  
                    <nav class="collapse bd-links">

                     <br>
                        <div>
                            <ul class="nav__list sd_ul">
                                <li>
                                  <input id="group-1" type="checkbox" hidden />
                                  <label for="group-1">
                                      <span><b><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-double-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
                                        <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
                                      </svg></span></b> 
                                      <b>
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-archive-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M12.643 15C13.979 15 15 13.845 15 12.5V5H1v7.5C1 13.845 2.021 15 3.357 15h9.286zM6 7a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1H6zM.8 1a.8.8 0 0 0-.8.8V3a.8.8 0 0 0 .8.8h14.4A.8.8 0 0 0 16 3V1.8a.8.8 0 0 0-.8-.8H.8z"/>
                                      </svg>&nbsp;&nbsp;상품관리&nbsp;&nbsp;</b></label>
                                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  <ul class="group-list sd_ul">
                                    <li><a href="iInsertView.do">상품 등록</a></li>
                                    <li><a href="itemListA.do">판매 상품 리스트</a></li>
                                    <li><a href="eList.do">배너 리스트</a></li>
                                    
                                  </ul>
                                </li>
                            </ul>
                        </div>   

                        <div>
                            <ul class="nav__list sd_ul">
                                <li>
                                  <input id="group-2" type="checkbox" hidden />
                                  <label for="group-2"><span><b><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-double-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
                                    <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
                                  </svg></span></b> <b>
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-people-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                  
                                        <path fill-rule="evenodd" d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"/>
                                      </svg>&nbsp;&nbsp;회원 관리&nbsp;&nbsp;</b></label>
                                  <ul class="group-list sd_ul">
                                    <li><a href="gradeList.do">회원 리스트</a></li>
                                    <li><a href="sList.do">탈퇴 내역</a></li>
                                  </ul>
                                </li>
                            </ul>
                        </div>  

                        <div>
                            <ul class="nav__list  sd_ul">
                                <li>
                                  <input id="group-3" type="checkbox" hidden />
                                  <label for="group-3"><span><b><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-double-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
                                    <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
                                  </svg></span></b> <b>
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-bar-chart-line-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <rect width="4" height="5" x="1" y="10" rx="1"/>
                                        <rect width="4" height="9" x="6" y="6" rx="1"/>
                                        <rect width="4" height="14" x="11" y="1" rx="1"/>
                                        <path fill-rule="evenodd" d="M0 14.5a.5.5 0 0 1 .5-.5h15a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5z"/>
                                      </svg>&nbsp;&nbsp;매출 관리&nbsp;&nbsp;</b></label>
                                  <ul class="group-list sd_ul">
                                    <li><a href="oList.do">구독 / 배송 내역</a></li>
                                    <li><a href="exchangList.do">교환 요청 내역</a></li>
                                    <c:url var="goSalesList" value="sDateList.do">
                                    	<c:param name="type" value="N"/>
                                    </c:url>
                                    	<li><a href="${goSalesList }">매출 통계 내역</a></li>
                                    
                                  </ul>
                                </li>
                            </ul>
                        </div>  

                        <div>
                            <ul class="nav__list sd_ul">
                                <li>
                                  <input id="group-4" type="checkbox" hidden />
                                  <label for="group-4"><span><b><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-double-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
                                    <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
                                  </svg></span></b><b>
                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-volume-up-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M11.536 14.01A8.473 8.473 0 0 0 14.026 8a8.473 8.473 0 0 0-2.49-6.01l-.708.707A7.476 7.476 0 0 1 13.025 8c0 2.071-.84 3.946-2.197 5.303l.708.707z"/>
                                        <path d="M10.121 12.596A6.48 6.48 0 0 0 12.025 8a6.48 6.48 0 0 0-1.904-4.596l-.707.707A5.483 5.483 0 0 1 11.025 8a5.483 5.483 0 0 1-1.61 3.89l.706.706z"/>
                                        <path d="M8.707 11.182A4.486 4.486 0 0 0 10.025 8a4.486 4.486 0 0 0-1.318-3.182L8 5.525A3.489 3.489 0 0 1 9.025 8 3.49 3.49 0 0 1 8 10.475l.707.707z"/>
                                        <path fill-rule="evenodd" d="M6.717 3.55A.5.5 0 0 1 7 4v8a.5.5 0 0 1-.812.39L3.825 10.5H1.5A.5.5 0 0 1 1 10V6a.5.5 0 0 1 .5-.5h2.325l2.363-1.89a.5.5 0 0 1 .529-.06z"/>
                                      </svg>&nbsp;&nbsp;고객센터 관리&nbsp;&nbsp;</b></label>
                                  <ul class="group-list sd_ul">
                                    <li><a href="adminNoticeList.do">공지사항</a></li>
                                    <li><a href="adminFAQList.do">FAQ</a></li>
                                    <li><a href="adminInquiryList.do">1:1 문의</a></li>
                                    <li><a href="adminProductProposalList.do">상품제안</a></li>
                                    <li><a href="adminEventList.do">이벤트</a></li>
                                  </ul>
                                </li>
                            </ul>
                        </div> 
           
                    </nav>
      		     </div>
      		  </div>    
            </div>
                
                
                
   


   




    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script src="https://code.jquery.com/jquery-3.4.1.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>
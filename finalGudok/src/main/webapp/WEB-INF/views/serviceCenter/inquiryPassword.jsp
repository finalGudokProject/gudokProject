<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

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
    border-top: 1px solid none !important;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid none !important;
    padding: 10px;
  }
  
  #list a{
    color:black;
    text-decoration: none;
  }
  button{
      background-color: rgb(0, 125, 255);
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
            background-color: #fff;
            border: 1px solid #dee2e6;
        }

        .page-link-t:hover {
            z-index: 2;
            color: #0056b3;
            text-decoration: none;
            background-color: #e9ecef;
            border-color: #dee2e6;
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
            background-color: rgba(90,148,235,0.8);
            border-color:  rgba(90,148,235,0.8);
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
            <li style="margin-bottom: 5%;"><img src="resources/images/inquiary.png" style="width:20%; height:20%;margin-bottom:3%"><a style="color:rgb(0, 125, 255);" readonly>1:1문의</a></li>
            <li style="margin-bottom: 5%;"><img src="resources/images/proposal.png" style="width:20%; height:20%;margin-bottom:3%"><a href="productProposalList.do">상품제안</a></li>
            <li style="margin-bottom: 5%;"><img src="resources/images/benefit1.png" style="width:20%; height:20%;margin-bottom:3%"><a href="tierOfBenefit.do">등급별 혜택</a></li>
        </ul>
      </div>
     <div class="col-9">
	    <!-- <form action="inquiryEqualPwd.do" method="post" enctype="multipart/form-data"> -->
	    <input type="hidden" id="page" name="page" value="${currentPage }">
		<input type="hidden" id="bBoard_no" name="bBoard_no" value="${board.bBoard_no }">
        
        <div style="font-size: 30px;">1:1 문의</div>
        <hr style="border-color:rgb(0, 125, 255);">

	        <div id="leftDiv" style="float:left;height:100px">
	            <table style="text-align: center; margin-top:15px;width:350px">
	                <tbody>
	                <tr>
	                    <th style="padding:20px;">비밀번호 </th>
	                    <td><input type="password" id="pwd" name="pwd"></td>
	                </tr>
	                </tbody>
	              </table>
	          	
	        </div>
	        <div id="rightDiv" style="float:left;height:100px;margin-top:28px">
		        <input type="button" value="확인" class="btn btn-primary" style="float:right;" id="pwdSubmit">
       		</div>     
        <!-- </form> -->
        </div>
            </div>
   
    <br><br><br>
    </div>
    <br><br><br><br><br>
    <footer class="page-footer font-small indigo">
		<jsp:include page="../common/footer.jsp" />
	</footer>
	<script>
		$(function(){
			
			$("#pwdSubmit").on("click",function(){
				
				var pwd = $("#pwd").val();
				var bBoard_no = $("#bBoard_no").val();
				var page = $("#page").val();
				$.ajax({
					url:"inquiryEqPwdYN.do",
					data:{pwd:pwd, bBoard_no:bBoard_no, page:page},
					success:function(data){
						if(data=="success"){
							
							location.href="inquiryEqualPwd.do?page="+page+"&bBoard_no="+bBoard_no;
					       
						}else{
							alert("비밀번호가 틀렸습니다. 다시 입력해주세요");
							$("#pwd").val("");
						}
					},
						error:function(request, status, errorData){
		                    alert("error code: " + request.status + "\n"
		                          +"message: " + request.responseText
		                          +"error: " + errorData);
		                 
					}
				})
			})
		})
			
			
	</script>
</body>
</html>
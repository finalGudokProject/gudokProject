<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <title>교환 상세 내역</title>    
    <style>




#td1{
    width:15%;
    vertical-align: middle;
}
#td2{
    width:35%;
    vertical-align: middle;
}
#td3{
    width:15%;
    vertical-align: middle;
}
#td4{
    width:35%;
    vertical-align: middle;
}

input, select,textarea{
    border: 1px solid #CCCCCC;
}

#count{
     margin:5px;
 }
</style>

</head>
    <body>
    <jsp:include page="../common/adminMenubar.jsp"/>
        <div class="content">
            <div class="container box">
                <h3>교환 신청 상세보기</h3>
                <br>

                    <!--주문 상품 리스트-->
                    <table>
                        <tr>
                            <td>구독 번호</td>
                            <td><input type="text" name="orderNum" value="" readonly></td>
                            <td>구독 시작일자</td>
                            <td><input type="text" name="orderDate"></td>
                        </tr>
                        <tr>
                            <td>교환 신청 번호</td>
                            <td><input type="text" name="orderNum" value="" readonly></td>
                            <td>교환 신청 일자</td>
                            <td><input type="text" name="orderDate"></td>
                        </tr>
                        <tr>
                            <td>구독 시작 날짜</td>
                            <td><input type="text" name="enroll" readonly></td>
                            <td>구독 주기</td>
                            <td><input type="text" name="out" readonly></td>
                        </tr>
                        <tr>
                            <td>상품명</td>
                            <td colspan="3"><input type="text" name="item_name" value="" readonly style="width:89%"></td>
                           
                        </tr>
            
                        <tr>
                            <td>주문 수량</td>
                            <td><input type="text" name="item_num"></td>
                            <td>가격</td>
                            <td><input type="text" name="purchase" readonly></td>
                        </tr>
                        <tr>
                            <td>배송 주소</td>
                            <td colspan="3"><input type="text" name="item_name" value="" readonly style="width:89%"></td>
                           
                        </tr>
                        
                        <tr>
                            <td>교환 내용</td>
                            <td colspan="3"><input type="text" name="item_name" value="" readonly style="width:89%"></td>
                           
                        </tr>
                        <tr>
                            <td>교환 진행 상태</td>
                            <td colspan="3">
                                <input type="radio" name="item_name">&nbsp;&nbsp;교환 대기&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="item_name">&nbsp;&nbsp;배송중&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="item_name">&nbsp;&nbsp;교환 완료
                            
                            </td>
                           
                        </tr>
                       
                    </table>

                   

                    <br>

                    
                   <br>

                   <div style="text-align:center">
                   <button>이전으로</button>
                </div>



            </div><!--내용담은 컨테이너-->
        </div><!--250px띄운 div-->
        
       <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>
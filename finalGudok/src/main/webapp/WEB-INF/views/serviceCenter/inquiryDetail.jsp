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
    
  
  #list a{
    color:black;
    text-decoration: none;
  }
  button{
      background-color: rgb(0, 125, 255);
  }
  table {
    width: 100%;
    border: 1px solid #CCCCCC !important;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #CCCCCC !important;
  }
  body {
    margin: 10px;
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
        
          
            <div style="font-size: 30px;">1:1 문의</div>
            <hr style="border-color:rgb(0, 125, 255);">
            <table style="margin-top:15px">
                <tbody>
                    <tr>
                        <th style="width:10%; padding:20px;text-align: center;">제목</th>
                        <td style="width:39%;text-align:center;" colspan="3">
                        <c:choose>
                        <c:when test="${secret.oSecret eq 'Y'}">
                        	<c:if test="${inquiry.iInquiry_yn eq 'N'}">
                        		[공개] ${board.bTitle } - 답변 대기중
                        	</c:if>
                        	<c:if test="${inquiry.iInquiry_yn eq 'Y'}">
                        		[공개] ${board.bTitle } - 답변 완료
                        	</c:if>
                        </c:when>
                        <c:when test="${secret.oSecret eq 'N'}">
                        	<c:if test="${inquiry.iInquiry_yn eq 'N'}">
                        		[비공개] ${board.bTitle } - 답변 대기중
                        	</c:if>
                        	<c:if test="${inquiry.iInquiry_yn eq 'Y'}">
                        		[비공개] ${board.bTitle } - 답변 완료
                        	</c:if>
                       </c:when>
                        </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th style="width:15%; padding:20px;text-align: center;">문의유형</th>
                        <td style="width:39%;text-align:center;">
						<c:if test="${inquiry.iBoard_type eq 'OPI' }">
                        	상품정보문의
                        </c:if>
                        <c:if test="${inquiry.iBoard_type eq 'OEC' }">
                        	교환문의
                        </c:if>
                        <c:if test="${inquiry.iBoard_type eq 'OAL' }">
                        	제휴
                        </c:if>
                        <c:if test="${inquiry.iBoard_type eq 'ODL' }">
                        	배송문의
                        </c:if>
                        <c:if test="${inquiry.iBoard_type eq 'OETC' }">
                        	기타문의
                        </c:if>
						</td>
                        <th style="width:15%; padding:20px;text-align: center;">작성자</th>
                        <td style="width:39%;text-align:center;">${board.bMember_id }</td>
                    </tr>
                    <tr>
                      <td colspan="4" style="height:auto; padding:5%">
                        <span style="margin:auto">
                        ${board.bContent }
                        </span>
                        <br><br>
                        <c:if test="${!empty board.originalFileName }">
                        	<center>
                           		<img style="height:500px;width:500px" src="${contextPath }/resources/inquiryUploadFiles/${board.renameFileName }">
                        	</center>
                        </c:if>
                      </td>
                  </tr>   
                </tbody>
              </table>
              <br><br>
              
              <table style="margin-top:15px">
                <tr>
                  <th style="width:15%; padding:20px;text-align: center;" colsapn="1">답변</th>
                  <td colspan="3" style="height:auto; padding:5%; text-align:left !important">${inquiry.iInquiry_content }</td>
                </tr>
              </table>
      
           
            <br><br><br>
             <c:url var="inquiryUpdateView" value="inquiryUpdate.do">
						<c:param name="bBoard_no" value="${board.bBoard_no }"/>
						<c:param name="page" value="${currentPage }"/>
			</c:url>
			<c:url var="inquiryDelete" value="inquiryDelete.do">
						<c:param name="bBoard_no" value="${board.bBoard_no }"/>
			</c:url>
			
            <a href="sinquiryList.do" type="button" class="btn btn-primary" style="float:right;">목록으로</a>
            <c:if test="${inquiry.iInquiry_content eq null }">
            <a href="${inquiryUpdateView }" type="button" class="btn btn-primary" style="float:right;margin-right:10px">수정</a>
            </c:if>
            <a href="${inquiryDelete }" type="button" class="btn btn-primary" style="float:right;margin-right:10px">삭제</a>
            </div>
            </div>
        	</div>
            <br><br><br>
            <footer class="page-footer font-small indigo">
				<jsp:include page="../common/footer.jsp" />
			</footer>
</body>
</html>
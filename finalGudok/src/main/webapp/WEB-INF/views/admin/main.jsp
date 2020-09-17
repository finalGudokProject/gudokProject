<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <title>관리자 페이지</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>


  <style>
    .container {
        width: 100%;
        height:1100px;
        
    }
    .content{
        margin-left:250px;
        background-color: #F5F5F5;
      padding:10px !important;
    
    }
    .mainBox{
        
        background-color:  #F5F5F5;
        height:1100px;
       
    }
    .mainRow{
 
    display: flex;
    
    flex-wrap: wrap;
    }
    
    #maintd1{
        width:30%;
        height:270px;
        border:none;
    }

    #mainTable{
        width:100%;
        max-height:1000px;
    }

    #subBox1{
        width:100%; 
        height:260px; 
        background-color: white; 
        margin:auto;
        padding:25px;
      
    }
    #subBox2{
        width:100%; 
        height:830px; 
        background-color: white; 
        margin:auto;
        padding:30px;
        text-align:center;
    
    }

    .table{
        padding:50px;
        margin:auto;
        word-wrap:break-word;
        word-break:break-all;
        table-layout:fixed;
        
    }
    
    td{
      text-overflow: ellipsis;
      overflow:hidden;
     white-space:nowrap;
    }
   
   

    #visitor1{
    
    float:left;
    background-color: #E1F5FE;
    margin-right:5px;
    font:12px;
    font-weight: 550;
    padding-left:5px;
    padding-right:5px;
 
    
    }
    
    #visitor2{
    
    float:left;
    background-color: #E1F5FE;
    font:12px;
    font-weight: 550;
    margin-right:5px;
    padding-left:5px;
    padding-right:5px;

    
    }
   
    
 
    
    </style>
</head>
<body>

   <jsp:include page="../common/adminMenubar.jsp"/>
    <div class="content">
        <div class="mainBox">
            
            <table id="mainTable">
                <tr>
                    <td id="maintd1">
                        <div id="subBox1">
                            <div style="float:left; margin-bottom:5px;"><h5><b>교환 대기</b></h5></div>
                            
                            <div class="mr-0" style="float:right;">
                            <a href="exchangList.do?category=N"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-right-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd" d="M7.646 11.354a.5.5 0 0 1 0-.708L10.293 8 7.646 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0z"/>
                            <path fill-rule="evenodd" d="M4.5 8a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5z"/>
                            </svg></a></div> 
                            <br>
                            <br>
                        <table class="table">
                           <c:if test="${!empty exList }">
                           <c:forEach var="i" items="${exList }" varStatus="cnt">
                               <c:url var="exchangeDetail" value="oDetail.do">
                           <c:param name="subscribeNo" value="${i.subscribeNo }"/>
                           <c:param name="page" value="1"/>
                           <c:param name="type" value="exchange"/>
                           <c:param name="category" value="N"/>
                        </c:url>
                               <tr id="cursor"onclick='location.href="${exchangeDetail }"'>
                                   <td style="width:60%; text-align:left;">${i.exchangeContent }</td>
                                   <td style="width:40%">${i.exchangeDate }</td>
                               </tr>
                            </c:forEach>
                            </c:if>
                            <c:if test="${empty exList }">
                            
                           
                               <tr>
                                   <td colspan="2">교환 내역이 없습니다.</td>
                               </tr>
                          
                            </c:if>
                            
                        </table>


                        </div>
                    </td>
                    <td id="maintd1">
                        <div id="subBox1">
                        <div style="float:left; margin-bottom:5px;"><h5><b>배송 대기</b></h5></div>
                            
                        <div class="mr-0" style="float:right;">
                        <a href="oList.do?category=N"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-right-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path fill-rule="evenodd" d="M7.646 11.354a.5.5 0 0 1 0-.708L10.293 8 7.646 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0z"/>
                        <path fill-rule="evenodd" d="M4.5 8a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5z"/>
                        </svg></a></div> 
                   
                        <br>
                        <br>
                    <table class="table">
                       <c:if test="${!empty dList }">
                        <c:forEach var="i" items="${dList }" varStatus="cnt">
                              <c:url var="orderDetail" value="oDetail.do">
                           <c:param name="subscribeNo" value="${i.subscribeNo }"/>
                           <c:param name="page" value="1"/>
                           <c:param name="type" value="order"/>
                           <c:param name="category" value="N"/>
                        </c:url>
                        
                           <tr id="cursor"onclick='location.href="${orderDetail }"'>
                               <td style="width:40%">${i.itemName }</td>
                               <td style="width:20%">${i.memberId }</td>
                               <td style="width:40%">${i.subscribeDate }</td>
                           </tr>
                        </c:forEach>
                        </c:if>
                        <c:if test="${empty dList }">
                           <tr>
                               <td colspan="4">주문 내역이 없습니다.</td>
                           </tr>
                        </c:if>
                        
                    </table>
                    </div>
                    </td>



                    <td id="maintd1">
                        <div id=subBox1>
                            <div style="float:left; width:35%;text-align:left;"><h5><b>방문·가입 현황</b></h5></div>
       
                              
                                   <div style="float:right;width:60%;margin-left:10px">
                                   
                                   
                                  <div style="float:left;">총 방문자  </div>&nbsp;
                                  <div class="test3" style="float:left;"> ${sessionScope.totalCount }</div>
                                     <div style="float:left;">명/총 가입자</div>&nbsp;
                                       <div class="test4" style="float:left;"> ${sessionScope.totalMember }</div>
                                       <div style="float:left;">명</div>
                                       
                                       
                                       </div>
                                   
                           
                         
                          <br>
                        
                    
                        <div id="visitor_chart" style="height:180px;">
              
                        </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="border:none;"colspan="2" rowspan="3">
                        <div id="subBox2"> 
                            <div style="float:left;margin-bottom:5px;"><h5 style="float:left"><b>주간 매출 현황</b></h5>
                            <div style="float:left; margin-left:20px"> 주간 총 거래건   </div><div class="test1" style="float:left; margin-left:10px">${sumTotalC }</div><div style="float:left;">건 / 매출액</div> <div class="test2" style="display:inline;margin-left:10px">${sumTotalP }</div>원</div>
                            <div class="mr-0" style="float:right;">
                                <c:url var="goSalesList" value="sDateList.do">
                                       <c:param name="type" value="N"/>
                                  </c:url>
                            <a href="${goSalesList }"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-right-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd" d="M7.646 11.354a.5.5 0 0 1 0-.708L10.293 8 7.646 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0z"/>
                            <path fill-rule="evenodd" d="M4.5 8a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5z"/>
                            </svg></a></div> 
                        <br><br>
                        <div  id="salesChart" style="height:300px;">구글차트 삽입</div>
                      
                       <table class="table" style="border:1px solid #E0E0E0;margin-top:30px;; width:100%">
                        <thead>
                        <tr  style="background-color:#E0E0E0">
                            <th>거래일자</th>
                            <th>매출액</th>
                            <th>거래건수</th>
                        </tr>
                    </thead>
                    <tbody>
               <c:if test="${!empty pList }">
                      <c:forEach var="i" items="${pList }" varStatus="cnt">
                        <tr>
                            <td>${i.categoryNo }</td>
                            <td><div class="pay" style="display:inline">${i.totalPayment }</div> 원</td>
                            <td>${i.totalCount } 건</td>
                        </tr>
                     </c:forEach>
                     </c:if>
                     <c:if test="${empty pList }">
                   
                        <tr>
                            <td colspan="3">거래 내역이 없습니다.</td>
                        </tr>
                  
                     </c:if>
                    </tbody>
                         </table>
                        </div>
                    </td>
                    <td id="maintd1">
                        <div id="subBox1">
                            <div style="float:left;"><h5><b>미답변 문의</b></h5></div>
                            <c:url var="searchInquiryList" value="searchInquiryList.do">
                        <c:param name="searchType" value="All"/>
                        <c:param name="inquiry_yn" value="No"/>
                        <c:param name="keyword" value=""/>
                        <c:param name="page" value="1"/>
                     </c:url>
                            <div class="mr-0" style="float:right;">
                            <a href="${searchInquiryList }"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-right-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd" d="M7.646 11.354a.5.5 0 0 1 0-.708L10.293 8 7.646 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0z"/>
                            <path fill-rule="evenodd" d="M4.5 8a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5z"/>
                            </svg></a></div> 
                            <br><br>
                        <table class="table">
                           <c:if test="${!empty bList }">
                             <c:forEach var="i" items="${bList }" varStatus="cnt">
                             <c:url var="adminInquiryDetail" value="adminInquiryDetail.do">
                        <c:param name="bBoard_no" value="${i.bBoard_no }"/>
                        <c:param name="page" value="1"/>
                     </c:url>   
                               <tr id="cursor">
                                   <td style="width:70%; text-align:left"><a href="${adminInquiryDetail }" style="text-decoration:none; color:black;">${i.bTitle }</a></td>
                                   <td style="width:30%;">${i.bWrite_date }</td>
                               </tr>
                            </c:forEach>
                            </c:if>
                            <c:if test="${empty bList }">
                               <tr>
                                   <td colspan="2">미답변 내역이 없습니다.</td>
                                   
                               </tr>
                            </c:if>
                        </table>
  
                        </div>
                    </td>
                </tr>
                <tr>
                    <td id="maintd1">
                        <div id="subBox1">
                            <div style="float:left;"><h5><b>공지사항</b></h5></div>
                            <div class="mr-0" style="float:right;">
                            <a href="adminNoticeList.do"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-right-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd" d="M7.646 11.354a.5.5 0 0 1 0-.708L10.293 8 7.646 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0z"/>
                            <path fill-rule="evenodd" d="M4.5 8a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5z"/>
                            </svg></a></div> <br><br>
                        <table class="table">
                            <c:if test="${!empty nList }">
                             <c:forEach var="i" items="${nList }" varStatus="cnt">
                             <c:url var="adminNoticeDetail" value="adminNoticeDetail.do">
                        <c:param name="bBoard_no" value="${i.bBoard_no }"/>
                        <c:param name="page" value="1"/>
                     </c:url>                        
                                  <tr id="cursor">
                                   <td style="width:70%; text-align:left;"><a href="${adminNoticeDetail }" style="text-decoration:none; color:black;">${i.bTitle }</a></td>
                                   <td style="width:30%;">${i.bWrite_date }</td>
                               </tr>
                              </c:forEach>
                              </c:if>
                              <c:if test="${empty nList }">
                         
                                  <tr>
                                   <td colspan="2">공지사항이 없습니다.</td>
                               </tr>
                              </c:if>
                        </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td id="maintd1">
                        <div id="subBox1">
                            <div style="float:left;"><h5><b>이벤트 진행건</b></h5></div>
                            <div class="mr-0" style="float:right;">
                            <a href="eList.do"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-right-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd" d="M7.646 11.354a.5.5 0 0 1 0-.708L10.293 8 7.646 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0z"/>
                            <path fill-rule="evenodd" d="M4.5 8a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5z"/>
                            </svg></a></div> <br><br>
                        <table class="table">
                             <c:if test="${!empty eList }">
                             <c:forEach var="i" items="${eList }" varStatus="cnt">
                              <c:url var="eventDetail" value="bannerDetail.do">
                           <c:param name="eventNo" value="${i.eventNo }"/>
                           <c:param name="page" value="1"/>
                        </c:url>
                            <tr id="cursor" onclick="${eventDetail}">
                                <td style="width:60%; text-align:left">${i.eventName }</td>
                                <td style="width:40%;">이벤트 상품 ${i.itemCount }개</td>
                            </tr>
                           </c:forEach>
                           
                           
                           </c:if>
                           <c:if test="${empty eList }">
                         
                            <tr>
                                <td colspan="2">진행중인 이벤트가 없습니다.</td>
                            </tr>
                         
                           </c:if>
                        </table>
                        </div>
                    </td>
                </tr>
            </table>

       


        </div><!--하얀바탕-->
    </div><!--회색바탕 div-->

   <input type="hidden" id="cArr" name="cArr" value="${cArr }">




 <script>
 
 //금액 변환
 
 $(function(){
   
    var test1=$(".test1").text();
    var chg1=addComma(test1);
    $(".test1").text(chg1);
    
    
    var test2=$(".test2").text();
    var chg2=addComma(test2);
    $(".test2").text(chg2);
    
    var test3=$(".test3").text();
    var chg3=addComma(test3);
    $(".test3").text(chg3);
    
    
    var test4=$(".test4").text();
    var chg4=addComma(test4);
    $(".test4").text(chg4);
   
    
 })
 
    function addComma(num) {
             var regexp = /\B(?=(\d{3})+(?!\d))/g;
            return num.toString().replace(regexp, ',');
         }
 
 
    //일일 방문자 가입현황 차트
    
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);


        function drawChart() {

          var data = new google.visualization.DataTable();
          data.addColumn('string', 'Day');
          data.addColumn('number', '가입');
          data.addColumn('number', '방문');
      

          data.addRows([
             
                  ['${cArr[0].vDay}',${cArr[0].memberNum},${cArr[0].visitorNum}],
                  ['${cArr[1].vDay}',${cArr[1].memberNum},${cArr[1].visitorNum}],
                  ['${cArr[2].vDay}',${cArr[2].memberNum},${cArr[2].visitorNum}],
                  ['${cArr[3].vDay}',${cArr[3].memberNum},${cArr[3].visitorNum}],
                  ['${cArr[4].vDay}',${cArr[4].memberNum},${cArr[4].visitorNum}],
                  ['${cArr[5].vDay}',${cArr[5].memberNum},${cArr[5].visitorNum}],
                  ['${cArr[6].vDay}',${cArr[6].memberNum},${cArr[6].visitorNum}],
                  ['${cArr[7].vDay}',${cArr[7].memberNum},${cArr[7].visitorNum}]
                
          
          ]);

          var options = {
            chart: {
              title: '방문자 및 가입자 집계',
              subtitle: '일일 방문자 및 가입자 현황'
            },
            width: '100%',
            legend: { position: 'bottom' },
            chartArea:{left:20,right:20,top:25,bottom:35,width:'90%',height:'100%'}
          };

        var chart = new google.visualization.LineChart(document.getElementById('visitor_chart'));

        chart.draw(data, options);
        window.addEventListener('resize',drawChart,false);
      }
      
      
      
      //주간 매출현황 그래프
      google.charts.load('current', {'packages':['corechart', 'bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {

     
        var chartDiv = document.getElementById('salesChart');

       
        var data = google.visualization.arrayToDataTable([
          ['거래일자', '매출액', '거래건'],
          ['${pList[0].categoryNo}',${pList[0].totalPayment},${pList[0].totalCount}],
          ['${pList[1].categoryNo}',${pList[1].totalPayment},${pList[1].totalCount}],
          ['${pList[2].categoryNo}',${pList[2].totalPayment},${pList[2].totalCount}],
          ['${pList[3].categoryNo}',${pList[3].totalPayment},${pList[3].totalCount}],
          ['${pList[4].categoryNo}',${pList[4].totalPayment},${pList[4].totalCount}],
          ['${pList[5].categoryNo}',${pList[5].totalPayment},${pList[5].totalCount}],
          ['${pList[6].categoryNo}',${pList[6].totalPayment},${pList[6].totalCount}],
          ['${pList[7].categoryNo}',${pList[7].totalPayment},${pList[7].totalCount}]
          
        ]);

        var materialOptions = {
          width: '100%',
          chart: {
          },
          series: {
            0: { axis: '매출액' }, // Bind series 0 to an axis named 'distance'.
            1: { axis: '거래건' } // Bind series 1 to an axis named 'brightness'.
          },
          axes: {
            y: {
              distance: {label: 'parsecs'}, // Left y-axis.
              brightness: {side: 'right', label: 'apparent magnitude'} // Right y-axis.
            }
          }
        };

    

        function drawMaterialChart() {
          var materialChart = new google.charts.Bar(chartDiv);
          materialChart.draw(data, google.charts.Bar.convertOptions(materialOptions));
        }

 
        drawMaterialChart();
        window.addEventListener('resize',drawStuff,false);
    };
      
    </script>

</body>
</html>
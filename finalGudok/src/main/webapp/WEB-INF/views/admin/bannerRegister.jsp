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
	

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

	
    
    
    <title>이벤트 배너 등록</title>    
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



/*파일첨부 이미지*/
.where {
  display: block;
  margin: 25px 15px;
  font-size: 11px;
  color: #000;
  text-decoration: none;
  font-family: verdana;
  font-style: italic;
} 

.filebox input[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}

.filebox label {
    display: inline-block;
    padding: .5em .75em;
    color: #999;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #fdfdfd;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
    margin-bottom:0px !important;
}

/* named upload */
.filebox .upload-name {
    display: inline-block;
    padding: .5em .75em;
    font-size: inherit;
    font-family: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none; /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
}

/* imaged preview */
.filebox .upload-display {
    margin-bottom: 5px;
}

@media(min-width: 768px) {
    .filebox .upload-display {
        display: inline-block;
        margin-right: 5px;
        margin-bottom: 0;
    }
}

.filebox .upload-thumb-wrap {
    display: inline-block;
    width: 450px;
    height:350px;
    padding: 2px;
    vertical-align: middle;
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #fff;
    overflow-y:scroll;
}

.filebox .upload-display img {
    display: block;
    max-width: 100%;
    width: 100% \9;
    height: auto;
}

.filebox.bs3-primary label {
  color: #fff;
  background-color: #337ab7;
    border-color: #2e6da4;
}





</style>

</head>

    <body>
    <jsp:include page="../common/adminMenubar.jsp"/>
        <div class="content">

            <div class="container box">
                <h3>배너 등록</h3>
                <br>

                
                <br><br>
             
                <form action="eInsert.do" method="post" encType="multipart/form-data" onsubmit="return validate()">
                <table>
              
                    <tr>
                        <td id="td1" style="vertical-align: middle;">
                          	 이벤트 제목
                        </td>
                        <td colspan="3">
                                <input type="text" name="eventName" id="eventName" style="width:100%; margin:3px;">
                        </td>
                       
                    </tr>
                    <tr>
                        <td id="td1">
                        	    이미지 첨부
                        </td>
                        <td colspan="3">

                             <div class="filebox preview-image"> 
                                <input class="upload-name" value="파일선택" disabled="disabled" > 
                                <label for="input-file">업로드</label> 
                                <input type="file" id="input-file" class="upload-hidden" name="uploadFile" accept="image/*" title="이미지 파일만 업로드 가능"> 
                         	</div>

                        </td>
                    </tr>
    

                </table>
                <br>
            <div style="text-align: center;">
                <input type="submit" class="btn" value="저장하기">
                <input type="reset"  class="btn" value="취소">
            </div>
            
            </form>
            </div><!--내용담은 컨테이너-->
        </div><!--250px띄운 div-->


        <script>
        
      //이벤트 등록시 필요정보 공백 제한
        function validate(){
        
    	if($("#eventName").val().trim().length==0){
	    		alert('이벤트 명을 입력하세요.');
	    		$("#eventName").focus();
    		
    		return false;

    			
    	}else if(!$("#input-file").val()){
			alert('배너 이미지를 선택하세요.')
		
			return false;
		
    	}else{
    		alert('이벤트가 등록되었습니다.');
    		return true;
    	}
        
      };
        
    
     
      
      // 파일 업로드 관련
      $(function(){
     var fileTarget = $('.filebox .upload-hidden');

      fileTarget.on('change', function(){
          if(window.FileReader){
              // 파일명 추출
              var filename = $(this)[0].files[0].name;
          } 
          
          else {
              // Old IE 파일명 추출
              var filename = $(this).val().split('/').pop().split('\\').pop();
          };

          $(this).siblings('.upload-name').val(filename);
      });

     		 //preview image 
      var imgTarget = $('.preview-image .upload-hidden');

      imgTarget.on('change', function(){
          var parent = $(this).parent();
          parent.children('.upload-display').remove();

          if(window.FileReader){
              //image 파일만
              if (!$(this)[0].files[0].type.match(/image\//)) return;
              
              var reader = new FileReader();
              reader.onload = function(e){
                  var src = e.target.result;
                  parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
              }
              reader.readAsDataURL($(this)[0].files[0]);
          }

          else {
              $(this)[0].select();
              $(this)[0].blur();
              var imgSrc = document.selection.createRange().text;
              parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

              var img = $(this).siblings('.upload-display').find('img');
              img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
          }
      });
  });
      
    </script>
        
        
        
       <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
     <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
   
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>
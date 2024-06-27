<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<% pageContext.setAttribute("newLine", "\n"); %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>boardInput.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
    th {
      text-align: center;
      background-color: white;
      color: gray;
    }
  </style>
    <script>
    'use strict';
    
    function fCheck() {
    	let fName = document.getElementById("file").value;
    	let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
    	let maxSize = 1024 * 1024 * 10;   // 1KByte=1024Byte=10^3Byte=2^10Byte, 1MByte=2^20Byte=10^6Byte, 1GByte=2^30Byte=10^9Byte, 1TByte=2^40Byte=10^12Byte)
    	
    	if(fName.trim() == "") {
    		alert("업로드할 파일을 선택하세요!");
    		return false;
    	}
    	
    	let fileSize = document.getElementById("file").files[0].size;
    	
    	if(ext != 'jpg' && ext != 'gif' && ext != 'png' && ext != 'zip' && ext != 'hwp' && ext != 'ppt' && ext != 'pptx' && ext != 'xlsx') {
    		alert("업로드 가능한 파일은 'jgp/gif/png/zip/hwp/ppt/pptx/xlsx' 만 가능합니다.");
    	}
    	else if(fileSize > maxSize) {
    		alert("업로드할 파일의 최대용량은 10MByte입니다.");
    	}
    	else {
    		myform.submit();
    	}
    	
    }
    
    // 업로드시키는 파일의 정보를 가져와서 이미지를 브라우저에 출력시켜주기(이미지파일만 처리했다.)
    $(function(){
    	$("#file").on("change", function(e){
    		// 그림파일 체크
    		let files = e.target.files;
    		let filesArr = Array.prototype.slice.call(files);
    		
    		//console.log('filesArr',filesArr);
    		
    		filesArr.forEach(function(f){
    			if(!f.type.match("image.*")) {
    				alert("업로드할 파일은 이미지파일만 가능합니다.");
    			}
    		});
    		
    		// 멀티파일 이미지 미리보기
    		let i = e.target.files.length;
    		for(let image of files) {
    			let img = document.createElement("img");
    			let reader = new FileReader();
    			reader.onload = function(e) {
    				img.setAttribute("src", e.target.result);
    				img.setAttribute("width", 200);
    			}
    			reader.readAsDataURL(e.target.files[--i]);
    			document.querySelector(".demo").append(img);
    		}
    	});
    });
  </script>
</head>
<body>
<jsp:include page="/include/nav.jsp" />
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center"></h2>
  <form name="myform" method="post" action="boardInputOk.bo" enctype="multipart/form-data" >
    <table class="table table-bordered">
      <tr>
        <th>👤</th>
        <td>${sNick}</td>
      </tr>
      <tr>
        <th>제목</th>
        <td><input type="text" name="title" id="title" placeholder="제목" autofocus required class="form-control"/></td>
      </tr>
      <tr>
        <th></th>
        <td><textarea rows="6" name="content" id="content" placeholder="내용을 입력하세요" class="form-control" required></textarea></td>
      </tr>
      
      <tr>
      	<th>파일 업로드</th>
      	<td>
       	    <div  class="form-group">
		      회원 사진(파일용량:2MByte이내) :
		      <input type="file" name="fName" id="file" class="form-control-file border" required/>
		    </div> 
      	
     <!--  		<input type="file" name="fName" id="file" multiple class="form-control-file mb-2 border"/> -->
      		 <input type="button" value="적용" onclick="fCheck()" class="btn btn-light form-control mb-2"/>
      	</td>
      	<tr>
      		<th>업로드 파일 미리보기</th>
      		<td class="demo" style="text-align: center;"></td>
      	</tr>	
      
      <tr>
        <th>공개여부</th>
        <td>
          <input type="radio" name="openSw" value="OK" checked />공개 &nbsp;
          <input type="radio" name="openSw" value="NO" />비공개
        </td>
      </tr>
      <tr>
        <td colspan="2" class="text-right">
          <input type="reset" value="다시입력" class="btn btn-light" /> &nbsp;
          <input type="submit" value="발행" class="btn btn-danger" /> &nbsp;
        </td>
      </tr>
    </table>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>
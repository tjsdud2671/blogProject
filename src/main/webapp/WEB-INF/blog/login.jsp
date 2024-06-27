<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%
	// 로그인창에 아이디 체크 유무에 대한 처리
	// 쿠키를 검색해서 cMid가 있을때 가져와서 아이디입력창에 뿌릴수 있게 한다.
	Cookie[] cookies = request.getCookies();

	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")) {
				pageContext.setAttribute("mid", cookies[i].getValue());
				break;
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>login.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
    th {
      background-color: #eee;
      text-align: center;
    }
  </style>
  <script>
    'use strict';
    
    $(function() {
    	$("#searchMid").hide();
    	$("#searchPassword").hide();
    });
    
    // 아이디 찾기 폼 보기
    function midSearch() {
    	$("#searchPassword").hide();
    	$("#searchMid").show();
    }
    
    // 이메일 검색처리
    function emailFind() {
    	let email = $("#emailSearch").val().trim();
    	if(email == "") {
    		alert("가입시 등록한 email을 입력하세요");
    		$("#emailSearch").focus();
    		return false;
    	}
    	
    	$.ajax({
    		url  : "UserEmailSearch.do",
    		type : "post",
    		data : {email : email},
    		success:function(res) {
    			let temp = res.split("/");
    			console.log("temp :", temp);
    			let str = '검색결과 : <br/><font color=blue><b>';
    			for(let i=0; i<temp.length; i++) {
    				let jump = Math.floor((Math.random()*(4-2)) + 2);
    				let tempMid = temp[i].substring(0,1);
    				console.log("tempMid",tempMid,", jump",jump);
    				for(let j=1; j<temp[i].length; j++) {
    					if(j % jump == 0) tempMid += "*";
    					else tempMid += temp[i].substring(j,j+1);
    				}
	    			str += tempMid;
	    			
	    			str += "<br/>";
    			}
    			str += '</b></font>';
    			midShow.innerHTML = str;
    		},
    		error : function() {
    			alert("전송 오류!");
    		}
    	});
    }
    
    // 비밀번호 검색폼 보여주기
    function pwdSearch() {
    	$("#searchMid").hide();
    	$("#searchPassword").show();
    }
    
    // 비밀번호 검색처리
    function passwordFind() {
    	let mid = $("#midSearch").val().trim();
    	let email = $("#emailSearch2").val().trim();
    	if(mid == "" || email == "") {
    		alert("가입시 등록한 아이디와 메일주소를 입력하세요");
    		$("#midSearch").focus();
    		return false;
    	}
    	let query = {
    			mid   : mid,
    			email : email
    	}
    	
    	$.ajax({
    		url  : "UserPasswordSearch.do",
    		type : "post",
    		data : query,
    		success:function(res) {
    			passwordShow.innerHTML = "결과메세지 : " + res;
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
  </script>
</head>
<body>
<jsp:include page="/include/nav.jsp" />
<br/>
<br/>
<br/>
<div class="container" style="width: 600px;">
  <form name="loginForm" method="post" action="userLoginOk.do" >
  	<table class="table table-bordered m-0">
  	  <tr>
  	    <td colspan="2" class="text-center" style="color: gray"><h2>LOGIN</h2></td>
  	  </tr>
  	  <tr>
  	    <th style="background: white">ID</th>
  	    <td><input type="text" name="mid" id="mid" value="${mid}" class="form-control" autofocus required /></td>
  	  </tr>
  	  <tr>
  	    <th style="background: white">PWD</th>
  	    <td><input type="password" name="pwd" id="pwd"  class="form-control" required /></td>
  	  </tr>
  	  <tr>
  	    <td colspan="2" class="text-center">
  	      <input type="submit" value="로그인" class="btn btn-outline-secondary mr-2" />
  	      <input type="reset" value="다시입력" class="btn btn-outline-secondary mr-2" />
  	      <input type="button" value="회원가입" onclick="location.href='join.do';" class="btn btn-outline-secondary" />
  	    </td>
  	  </tr>
  	 </table>
  	 <table class="table table-borderless p-0">
  	  <tr>
  	    <td colspan="2" class="text-center">
  	     <input type="checkbox" name="idSave" /> 아이디저장 &nbsp;&nbsp;&nbsp;
  	      [<a href="javascript:midSearch()">아이디찾기</a>] /
  	      [<a href="javascript:pwdSearch()">비밀번호찾기</a>]
  	    </td>
  	  </tr>
  	</table>
  </form>
	<form name="searchForm">
	  <div id="searchMid">
	    <hr/>
	  	<table class="table table-borderless p-0 text-center">
	  	  <tr>
	  	    <td class="text-center">
	  	      <font size="4"><b>아이디 찾기</b></font>
	  	      (가입시 입력한 메일주소를 입력하세요)
	  	    </td>
	  	  </tr>
	  	  <tr>
	  	    <td>
	  	      <div class="input-group">
	  	        <input type="text" name="eamilSearch" id="emailSearch" class="form-control" placeholder="이메일 입력"/>
	  	        <div class="input-group-append">
	  	          <input type="button" value="이메일검색" onclick="emailFind()" class="btn btn-info" />
	  	        </div>
	  	      </div>
	  	    </td>
	  	  </tr>
	  	  <tr>
	  	    <td><div id="midShow"></div></td>
	  	  </tr>
	  	</table>
  	</div>
  	<div id="searchPassword">
	  	<hr/>
	  	<table class="table table-bordered p-0 text-center">
	  	  <tr>
	  	    <td class="text-center" colspan="2">
	  	      <font size="4"><b>비밀번호 찾기</b></font>
	  	      (가입시 입력한 아이디와 메일주소를 입력하세요)
	  	    </td>
	  	  </tr>
	  	  <tr>
	  	    <th>아이디</th>
	  	    <td><input type="text" name="midSearch" id="midSearch" class="form-control" placeholder="아이디를 입력하세요"/></td>
	  	  </tr>
	  	  <tr>
	  	    <th>이메일</th>
	  	    <td><input type="text" name="emailSearch2" id="emailSearch2" class="form-control" placeholder="메일주소를 입력하세요"/></td>
	  	  </tr>
	  	  <tr>
	  	    <td colspan="2">
	  	      <input type="button" value="새비밀번호발급" onclick="passwordFind()" class="btn btn-info" />
	  	    </td>
	  	  </tr>
	  	</table>
	  	<table class="table table-borderless">
	  	  <tr>
	  	    <td><div id="passwordShow"></div></td>
	  	  </tr>
	  	</table>
  	</div>
	</form>
</div>
<br/>
<br/>
<br/>
<br/>
<br/>
<jsp:include page="/include/footer.jsp" />
</body>
</html>
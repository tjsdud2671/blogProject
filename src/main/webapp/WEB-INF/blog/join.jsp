<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="{pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>join.jsp</title>
<%@ include file="/include/bs4.jsp" %>
<style>
	.container{
	 width : 600px;
 	 height: 800px;
 	 border: 1px solid white;
	}
</style>
<script>
	'use strict';
	//아이디와 닉네임 중복버튼 클릭 확인
	let idSw = 0;
	let nickSw = 0;
	
	function fCheck(){
    	let regMid = /^[a-zA-Z0-9_]{4,20}$/;
    	let regPwd = /(?=.*[0-9a-zA-Z]).{4,20}$/;
      	let regName = /^[가-힣a-zA-Z]+$/;
      	let regNick = /^[가-힣]+$/;
      	let regEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    	let regTel = /\d{2,3}-\d{3,4}-\d{4}$/g;
    	
    	let mid = myform.mid.value.trim();
    	let pwd = myform.pwd.value;
    	let name = myform.name.value;
    	let nick = myform.nick.value;
    	let email1 = myform.email1.value.trim();
    	let email2 = myform.email2.value;
    	let email = email1 + "@" + email2;
    	let tel1 = myform.tel1.value;
    	let tel2 = myform.tel2.value.trim();
    	let tel3 = myform.tel3.value.trim();
    	let tel = tel1 + "-" + tel2 + "-" + tel3;	
    	
    	let submitFlag=0;
    	//모든 체크가 정상완료되면 1로 변경처리
    	
    	// 앞의 정규식으로 정의된 부분에 대한 유효성체크
    	if(!regMid.test(mid)) {
    		alert("아이디는 4~20자리의 영문 소/대문자와 숫자, 언더바(_)만 사용가능합니다.");
    		myform.mid.focus();
    		return false;
    	}
    	else if(!regPwd.test(pwd)) {
	        alert("비밀번호는 1개이상의 문자와 특수문자 조합의 6~24 자리로 작성해주세요.");
	        myform.pwd.focus();
	        return false;
       }
    	
       else if(!regName.test(name)) {
	        alert("성명은 한글과 영문대소문자만 사용가능합니다.");
	        myform.name.focus();
	        return false;
       }
       else if(!regNick.test(nick)) {
	        alert("닉네임은 한글만 사용가능합니다.");
	        myform.nick.focus();
	        return false;
       }
       else if(!regEmail.test(email)) {
	        alert("이메일 형식에 맞지않습니다.");
	        myform.email1.focus();
	        return false;
      } 
       else{
        	submitFlag=1;
       }

	
	if(tel2 != "" && tel3 != "") {
  	  if(!regTel.test(tel)) {
	    		alert("전화번호형식을 확인하세요.(000-0000-0000)");
	    		myform.tel2.focus();
	    		return false;
  	  }
  	  else {
  		  submitFlag = 1;
  	  }
  	}
  	else {		// 전화번호를 입력하지 않을시 DB에는 '010- - '의 형태로 저장하고자 한다.
  		tel2 = " ";
  		tel3 = " ";
  		tel = tel1 + "-" + tel2 + "-" + tel3;
  		submitFlag = 1;
  	}
	
	
	// 전송전에 모든 체크가 끝나면 submitFlag가 1로 변경된다. 이때 값들을 서버로 전송처리한다.
	if(submitFlag == 1) {
		if(idSw == 0) {
			alert("아이디 중복체크버튼을 눌러주세요");
			document.getElementById("midBtn").focus();
		}
		else if(nickSw == 0) {
			alert("닉네임 중복체크버튼을 눌러주세요");
			document.getElementById("nickBtn").focus();
		}
		else {
    		myform.email.value = email;
    		myform.tel.value = tel;
    		
	    	myform.submit();
		}
	}
	else {
		alert("회원가입 실패");
	}
}
	// 아이디 중복체크
	function idCheck() {
		let mid = myform.mid.value;
		let url = "userIdCheck.do?mid="+mid;
		
		if(mid.trim() == "") {
			alert("아이디를 입력하세요!");
			myform.mid.focus();
		}
		else {
			idSw = 1;
			myform.mid.readOnly = true;
			window.open(url,"nWin","width=580px,height=250px");
		}
	}
	

	
	// 닉네임 중복체크
	function nickCheck() {
		let nick = myform.nick.value;
		let url = "${ctp}/userNickCheck.do?nick="+nick;
		
		if(nick.trim() == "") {
			alert("닉네임을 입력하세요");
			myform.nick.focus();
		}
		else {
			nickSw = 1;
			myform.nick.readOnly = true;
			window.open(url,"nWin","width=580px,height=250px");
		}
	}
	
</script>
</head>
<body>
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="userJoinOk.do" class="was-validated">
    <div class="join" style="text-align: center; color: lightgray"><h3>Join</h3></div>
    <br/>
    <div class="form-group">
      <label for="mid">아이디 : &nbsp; &nbsp;<input type="button" value="아이디 중복체크" id="midBtn" class="btn btn-outline-primary btn-sm" onclick="idCheck()"/></label>
      <input type="text" class="form-control" name="mid" id="mid" placeholder="아이디를 입력하세요." required autofocus/>
    </div>
    <div class="form-group">
      <label for="pwd">비밀번호 :</label>
      <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요." name="pwd" required />
    </div>
    <div class="form-group">
      <label for="name">성명 :</label>
      <input type="text" class="form-control" id="name" placeholder="성명을 입력하세요." name="name" required />
    </div>
    <div class="form-group">
      <label for="nick">닉네임 : &nbsp; &nbsp;<input type="button" id="nickBtn" value="닉네임 중복체크" class="btn btn-outline-primary btn-sm" onclick="nickCheck()"/></label>
      <input type="text" class="form-control" id="nick" placeholder="별명을 입력하세요." name="nick" required />
    </div>
    <div class="form-group">
      <div class="form-check-inline">
        <span class="input-group-text">성별 :</span> &nbsp; &nbsp;
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="gender" value="남자" >남자
        </label>
      </div>
      <div class="form-check-inline">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="gender" value="여자" checked>여자
        </label>
      </div>
    </div>
    <div class="form-group">
      <label for="email1">Email :</label>
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="Email을 입력하세요." id="email1" name="email1" required />
          <div class="input-group-append">
            <select name="email2" class="custom-select">
              <option value="naver.com" selected>naver.com</option>
              <option value="hanmail.net">hanmail.net</option>
              <option value="hotmail.com">hotmail.com</option>
              <option value="gmail.com">gmail.com</option>
              <option value="nate.com">nate.com</option>
              <option value="yahoo.com">yahoo.com</option>
            </select>
          </div>
        </div>
    </div>
    <div class="form-group">
      <div class="input-group mb-3">
        <div class="input-group-prepend">
          <span class="input-group-text">전화번호 :</span> &nbsp;&nbsp;
            <select name="tel1" class="custom-select">
              <option value="010" selected>010</option>
              <option value="02">서울</option>
              <option value="031">경기</option>
              <option value="032">인천</option>
              <option value="041">충남</option>
              <option value="042">대전</option>
              <option value="043">충북</option>
              <option value="051">부산</option>
              <option value="052">울산</option>
              <option value="061">전북</option>
              <option value="062">광주</option>
            </select>-
        </div>
        <input type="text" name="tel2" size=4 maxlength=4 class="form-control"/>-
        <input type="text" name="tel3" size=4 maxlength=4 class="form-control"/>
      </div>
    </div>
    <div class="btnstyle" style="text-align: right">
    <button type="button" class="btn btn-outline-primary" onclick="fCheck()">회원가입</button> &nbsp;
    <button type="reset" class="btn btn-outline-primary">다시작성</button> &nbsp;
    </div>
    <input type="hidden" name="email" />
    <input type="hidden" name="tel" />
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>userIdCheck.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    // 사용가능한 닉네임을 부모창으로 전송후 창닫기
    function sendCheck() {
    	opener.window.document.myform.nick.value = '${nick}';
    	opener.window.document.myform.email.focus();
    	window.close();
    }
    
    // 닉네임 재검색
    function nickCheck() {
    	let nick = childForm.nick.value;
    	
    	if(mid.trim() == "") {
    		alert("닉네임을 입력하세요");
    		childForm.nick.focus();
    	}
    	else {
    		childForm.submit();
    	}
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h3>닉네임 체크폼</h3>
  <c:if test="${res == 1}">
    <h4><font color="blue"><b>${nick}</b></font>닉네임은 사용 가능합니다.</h4>
    <p><input type="button" value="창닫기" onclick="sendCheck()"/>
  </c:if>
  <c:if test="${res != 1}">
    <h4><font color="blue"><b>${nick}</b></font>는 이미 사용중인 닉네임 입니다.</h4>
    <form name="childForm" method="post" action="userNickCheck.do">
      <p>
        <input type="text" name="nick">
        <input type="button" value="닉네임재검색" onclick="nickCheck()"/>
      </p>
    </form>
  </c:if>
</div>
<p><br/></p>
</body>
</html>
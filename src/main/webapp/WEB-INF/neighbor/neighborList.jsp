<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="{pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/include/bs4.jsp" %>
</head>
<body>
<div class="w3-container" style="margin-left: 50px">
  <p>From. 블로그 이웃님들</p>
  <div style="width: 800px; height: 800px">
  <c:forEach var="vo" items="${vos}" varStatus="st">
  <ul class="w3-ul w3-card-4">
  <img src="${ctp}/images/산타.jpg" class="w3-circle" alt="Alps" style="width: 10%">
    <li class="w3-display-container">${vo.nick} &nbsp;|&nbsp; ${vo.content }<span onclick="location.href='answerDelete.as?idx=${vo.idx}';" class="w3-button w3-transparent w3-display-right">&times;</span></li>
    <p></p>
  </ul>
  </c:forEach>
  </div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<% pageContext.setAttribute("newLine", "\n"); %>
<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<jsp:include page="/include/nav.jsp" />
<jsp:include page="/include/header.jsp" />


<div class="w3-container" style="margin-left: 50px">
  <p>From. 블로그 이웃님들</p>
  <div style="width: 800px; height: 800px">
  <c:forEach var="vo" items="${vos}" varStatus="st">
  <ul class="w3-ul w3-card-4">
    <li class="w3-display-container"><font color="gray">${vo.nick}</font> &nbsp;|&nbsp; ${vo.content }<span onclick="location.href='answerDelete.as?idx=${vo.idx}';" class="w3-button w3-transparent w3-display-right">&times;</span></li>
    <p></p>
  </ul>
  </c:forEach>
  </div>
</div>
</body>
</html>
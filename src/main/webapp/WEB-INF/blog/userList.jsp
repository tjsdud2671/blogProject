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
<%@ include file="/include/nav.jsp" %>
	<center>
	<div class="container">
	<p><br/></p>
	<h2>전체 회원 </h2>
	<p><br/></p>
	<table width="800" border="1" bordercolor="gray">
		<tr height="40">
			<td align="center" width="50">아이디</td>
			<td align="center" width="50">닉네임</td>
			<td align="center" width="50">이메일</td>
			<td align="center" width="50">성명</td>
			<td align="center" width="50">성별</td>
			<td align="center" width="50">전화번호</td>
		</tr>
		<c:forEach var="vo" items="${vos}">
		<tr height="40">
			<td align="center" width="200">${vo.mid}</td>
			<td align="center" width="200">${vo.nick}</td>
			<td align="center" width="200">${vo.email}</td>
			<td align="center" width="200">${vo.name}</td>
			<td align="center" width="200">${vo.gender}</td>
			<td align="center" width="400">${vo.tel}</td>
		</tr>
		</c:forEach>
	</table>	
	
	<br/><br/><br/><br/><br/><br/>
	<div class="w3-bar">
	  <a href="#" class="w3-button">&laquo;</a>
	  <a href="#" class="w3-button">1</a>
	  <a href="#" class="w3-button">2</a>
	  <a href="#" class="w3-button">3</a>
	  <a href="#" class="w3-button">4</a>
	  <a href="#" class="w3-button">&raquo;</a>
	</div>

	
	
	</div>
	
	<br/><br/><br/><br/>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>
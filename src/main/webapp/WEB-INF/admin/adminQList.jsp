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

<div class="w3-row-padding w3-margin-top">
<c:forEach var="vo" items="${vos}" varStatus="st">
<div class="w3-third">
<div class="w3-card">
<a href=""><img src="${ctp}/images/board/blog/${vo.fSName}" style="width: 480px; height: 300px; text-align: center;"></a>
<div class="w3-container">
	<table>
		<tr><br/>
		<td style=" color: gray">${vo.content}</td>
		</tr>
	</table>
</div>
</div><br/>
</div>

</c:forEach>
</div>

</body>
</html>
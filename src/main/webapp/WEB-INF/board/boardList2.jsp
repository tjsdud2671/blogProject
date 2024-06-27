<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<body>
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center"></h2>
  <%-- <c:set var="curScrStartNo" value="${curScrStartNo}" /> --%>'
  <c:forEach var="vo" items="${vos}" varStatus="st">
	  <table class="table table-bordered">
	    <tr>
	      <th>성명</th>
	      <td>${vo.nick}</td>
	      <th>작성일</th>
	      <td>${fn:substring(vo.wDate,0,19)}</td>
	 	</tr>
	    <tr>
	      <th>내용</th>
	      <td>${vo.content}</td>
	 	</tr>
	 	<tr>
	 		<td><img src="${ctp}/images/board/blog/${vo.fSName}"></td>
	 	</tr>
	  </table>
	  <c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
  </c:forEach>
  <br/>
  
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>
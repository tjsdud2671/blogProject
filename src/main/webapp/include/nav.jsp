<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="w3-bar w3-black">
  <a href="${ctp}/" class="w3-bar-item w3-button w3-mobile w3-pink">Home</a>
  <div class="w3-dropdown-hover w3-mobile">
    <button class="w3-button">Menu <i class="fa fa-caret-down"></i></button> 
    <div class="w3-dropdown-content w3-bar-block w3-dark-grey">
      <a href="board.bo?mid=${sMid}" class="w3-bar-item w3-button w3-mobile">🏠내 블로그</a>
      <a href="boardInput.bo" class="w3-bar-item w3-button w3-mobile">📝글쓰기</a>
      <a href="boardList.bo" class="w3-bar-item w3-button w3-mobile">🙋이웃 글 보기</a>
      <a href="adminQList.ad" class="w3-bar-item w3-button w3-mobile">📩블로그씨의 질문 리스트</a>
    </div>
  </div>
  <c:if test="${sLevel==99}">
  <div class="w3-dropdown-hover w3-mobile">
    <button class="w3-button">Staff <i class="fa fa-caret-down"></i></button> 
    <div class="w3-dropdown-content w3-bar-block w3-dark-grey">
      <a href="boardInput.bo" class="w3-bar-item w3-button w3-mobile">블로그 글쓰기</a>
      <a href="adminInput.ad" class="w3-bar-item w3-button w3-mobile">블로그씨 질문하기</a>
      <a href="adminQList.ad" class="w3-bar-item w3-button w3-mobile">블로그씨 질문 리스트</a>
      <a href="answerList.as" class="w3-bar-item w3-button w3-mobile">답변 리스트</a>
      <a href="userList.do" class="w3-bar-item w3-button w3-mobile">전체 회원 리스트</a>
    </div>
  </div>
  </c:if>
</div>
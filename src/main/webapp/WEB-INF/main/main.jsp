<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/functions"
prefix="fn" %> <% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

  <head>
    <title>blog_main</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <jsp:include page="/css/mainCss.jsp"></jsp:include>
   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>

  <body>
    <section class="header">
      <div class="container">
        <div class="col-12">
          <div class="row">
            <div class="header-img">
              <img src="${ctp}/images/00.jpg" />
              <div class="header-title">
                <h1>BLOG</h1>
                <p>일상의 기록</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
	
	<%@ include file="/include/nav.jsp" %>
	
	<div class="mobile-neighbor">
    	<img src="${ctp}/images/지구.png" class="earth" />
 	</div>
	
    <section class="center">
      <div class="container">
        <div class="row">
          <div class="main">
            <div class="center-main-aside">
              <h1><a href="#" class="main-aside-login">👤Login</a></h1>
              <div>
                <a href="#" class="main-aside-desc"
                  >아이디찾기&nbsp;|&nbsp;비밀번호찾기</a
                >
                <a href="#" class="main-aside-desc">회원가입</a>
              </div>
            </div>
            <div class="col-12 col-md-6">
            <div class="main-login">
            <h1><a href="#" class="main-aside-login">👤Login</a></h1>
                <div>
                  <a href="#" class="main-aside-desc"
                    >아이디찾기&nbsp;|&nbsp;비밀번호찾기</a
                    >
                  <a href="#" class="main-aside-desc">회원가입</a>
                </div>
            </div>
            
              <div class="center-card">
                  <img src="${ctp}/images/모달.jpg" />
	                <div class="center-card-desc">
	                  <p class="center-desc">To, ${sNick}</p>
	                  <strong class="center-desc"> ${vo.content} 이건 예시입니다 고쳐야함 내용이 길어진다면?</strong>
	                  <p class="center-desc">From, 블로그씨</p>
	                </div>
              </div>
              <div class="center-card-logout">
	                <div class="center-card-desc">
	                  <p class="center-desc">로그아웃 상태입니다.<br/>로그인하여 이웃새글을 확인해보세요.</p>
	                </div>
              </div>
            </div>
            <div class="col-12 col-md-6">
              <div class="center-aside">
                <h1><a href="#" class="main-aside-login">👤Login</a></h1>
                <div>
                  <a href="#" class="main-aside-desc"
                    >아이디찾기&nbsp;|&nbsp;비밀번호찾기</a
                    >
                  <a href="#" class="main-aside-desc">회원가입</a>
                </div>
                	<img src="${ctp}/images/지구.png" class="earth" />
                <div class="neighbor">
                  <a href="#" class="neighbor-button">이웃 목록</a>
               </div>
               <div class="toffic-info">
                <p >
                  매주 일요일 배달되는 블로그씨 질문에 답해보세요<br />여러분의
                  답변은 블로그홈 핫토픽 영역에<br />
                  일정기간 소개됩니다.
                </p>
                </div>
                <div class="toffic">
   				  <ul class="w3-ul w3-hoverable ">
 					<c:forEach var="vo" items="${asVos}" begin="0" end="19" varStatus="st">
	 			    <img src="${ctp}/images/메모.png"  class="w3-left w3-margin-right" style="width: 52px;">
	      				<li class="w3-padding-16">
							<p>${vo.nick } &nbsp;&nbsp;|&nbsp;&nbsp; ${vo.content }</p><br>
	     				</li>
 				   </c:forEach>
				 </ul>
    		   </div>
                
                
            </div>
          </div>
       	 </div>
      	</div>
      </div>
    </section>
    
    <%@ include file="/include/footer.jsp" %>
  </body>
</html>

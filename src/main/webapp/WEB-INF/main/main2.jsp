<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
</style>


</head>
<body class="w3-light-grey">
<%@ include file="/include/nav.jsp" %>
<!-- Page content -->
<div class="w3-content" style="max-width:2000px; margin-top:0px">
  <!-- Automatic Slideshow Images -->
  <div class="mySlides w3-display-container w3-center">
    <img src="${ctp}/images/13.jpg" style="width:100%; height: 550px">
    <div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
        <h1><b>BLOG</b></h1>
  		<p style="font-size: 10pt;">일상의 기록</p>
    </div>
  </div>
  <div class="mySlides w3-display-container w3-center">
    <img src="${ctp}/images/00.jpg" style="width:100%; height: 550px">
    <div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
        <h1><b>BLOG</b></h1>
  		<p style="font-size: 10pt;">일상의 기록</p>
    </div>
  </div>



<div class="w3-content" style="max-width:1400px">
<!-- Grid -->
<div class="w3-row">

<!-- Blog entries -->
<div class="w3-col l8 s12">
  <!-- Blog entry -->
  
  <center>
  <div class="w3-card-4 w3-margin w3-white">
    <img src="${ctp}/images/산타.jpg" width="500px" height="500px" style="text-align: center; margin-top: 10px;" />
    <div class="w3-container">
      	<p style="font-size: 15px; color: gray">매주 일요일 배달되는 블로그씨 질문에 답해보세요!<br/>
      	여러분의 답변 중 핫토픽으로 선정된 글은<br/>
      	블로그홈 핫토픽 영역에 일정기간 소개됩니다.</p>
    </div>

    <div class="w3-container">
      <p>From.블로그씨</p>
      <div class="w3-row">
        <div class="w3-col m8 s12">
          <!-- <p><button class="w3-button w3-padding-large w3-white w3-border"  style="font-size: 13px; color: gray;" ><b>블로그씨 질문에 답하기  »</b></button></p> -->
          <p><button onclick="document.getElementById('id01').style.display='block'" class="w3-button"><b>블로그씨 질문에 답하기  »</b></button></p>
        
        </div>
      </div>
    </div>
  </div>
</center>
  <hr>
  <!-- Blog entry -->
  <div class="w3-card-4 w3-margin w3-white">
    <div class="w3-container">
      <h3><b>Hot Topic</b></h3>
      <h5>Title description, <span class="w3-opacity">April 2, 2014</span></h5>
    </div>

    <div class="w3-container">
    	<c:forEach var="vo" items="${vos}" begin="0" end="4" varStatus="st">
    		<div>
	  			<img src="${ctp}/images/board/blog/${vo.fSName}" style="width:100%"><br/>
	    		<p>${vo.nick}</p><br/>
    			<p>${fn:substring(vo.content,0,16)}</p>
    			${ctp}
    		</div>
  		</c:forEach>
    </div>
  </div>
<!-- END BLOG ENTRIES --> 
</div>
<!-- Introduction menu -->
<div class="w3-col l4">
  <!-- About Card -->
	    
	  <div class="w3-card w3-margin w3-margin-top">
	    <div class="w3-container w3-white">
	    	<center>
			  <c:if test="${sLevel<1 ||empty sLevel}">
		    	<p style="font-size: 10pt">블로그를 보다 편리하고 안전하게 이용하세요</p>
		    	<tr>
		    	<h4><b><a href="login.do" style="text-decoration: none">LOGIN</a></b></h4>
		    	</tr>
		    	<p style="font-size: 10pt"><a href="login.do" style="text-decoration: none">아이디찾기</a> | <a href="login.do" style="text-decoration: none">비밀번호찾기</a> &nbsp;&nbsp;&nbsp;&nbsp;<a href="join.do" style="text-decoration: none">👤회원가입</a></p>	
			 </c:if> 
			 
			  <c:if test="${sLevel>=1}">
		    	<tr>
		    	<p></p>
		    	<h4><b><a href="logout.do" style="text-decoration: none">LOGOUT</a></b></h4>
		    	<%-- <p> ‍${sNick}&nbsp;&nbsp;|&nbsp;&nbsp;<a href="boardList.bo" style="text-decoration: none">🏠 내 블로그</a></p> --%>
 		    	<p> ‍${sNick}&nbsp;&nbsp;|&nbsp;&nbsp;<a href="board.bo?mid=${sMid}" style="text-decoration: none">🏠 내 블로그</a></p> 
		    	</tr>
	 		</c:if> 
	    	</center>
	    </div>	
	  </div><hr>
  
  <!-- Posts -->
  <c:if test="${sLevel<1 ||empty sLevel}">
  <div class="w3-card w3-margin">
    <div class="w3-container w3-padding">
      <center>
      <p style="font-size: 10pt">로그아웃 상태입니다.</p>
      <p style="font-size: 10pt">로그인하여 이웃새글을 확인해보세요.</p>
      </center>
    </div>
</c:if>

	<c:if test="${sLevel>=1}">
    <ul class="w3-ul w3-hoverable w3-white">
      <li class="w3-padding-16">
        <img src="${ctp}/w3images/workshop.jpg" alt="Image" class="w3-left w3-margin-right" style="width:50px">
        <span class="w3-large">Lorem</span><br>
        <span>Sed mattis nunc</span>
      </li>
      <li class="w3-padding-16">
        <img src="${ctp}/w3images/gondol.jpg" alt="Image" class="w3-left w3-margin-right" style="width:50px">
        <span class="w3-large">Ipsum</span><br>
        <span>Praes tinci sed</span>
      </li> 
      <li class="w3-padding-16">
        <img src="${ctp}/w3images/skies.jpg" alt="Image" class="w3-left w3-margin-right" style="width:50px">
        <span class="w3-large">Dorum</span><br>
        <span>Ultricies congue</span>
      </li>   
      <li class="w3-padding-16 w3-hide-medium w3-hide-small">
        <img src="${ctp}/w3images/rock.jpg" alt="Image" class="w3-left w3-margin-right" style="width:50px">
        <span class="w3-large">Mingsum</span><br>
        <span>Lorem ipsum dipsum</span>
      </li>  
    </ul>
    </c:if>
  </div>
  <hr> 
  
 
<!-- END Introduction Menu -->
</div>

<!-- END GRID -->
</div><br>

<!-- END w3-content -->
</div>



<!-- The Modal -->
<div id="id01" class="w3-modal">
  <div class="w3-modal-content">
    <div class="w3-container">
      <span onclick="document.getElementById('id01').style.display='none'"
      class="w3-button w3-display-topright">&times;</span>
      <p>From.블로그씨</p>
      <p>Some text in the Modal..</p>
    </div>
  </div>
</div>


<script>
// Automatic Slideshow - change image every 4 seconds
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
  x[myIndex-1].style.display = "block";  
  setTimeout(carousel, 4000);    
}

</script>
<%@ include file="/include/footer.jsp" %>
</body>
</html>

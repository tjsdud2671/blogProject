<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>boardContent.jsp</title>
<%@ include file="/include/bs4.jsp" %>
<style>
.btn{
	float: right;
}
#rp{
	font-size: 11px;
	
}
</style>
<script>
	'use strict';
	function boardDelete(){
		let ans = confirm("현재 글을 삭제 하시겠습니까?");
		if(ans) location.href="boardDelete.bo?idx=${vo.idx}";
	}
	
	 // 댓글 달기
    function replyCheck(){
    	let content = $("#content").val();
    	if(content.trim()==""){
    		alert("댓글을 입력하세요");
    		$("#content").focus();
    		return false;
    	}
    	let query={
    			boardIdx : ${vo.idx},
    			mid : '${sMid}',
    			nickName : '${sNick}',
    			content : content
    			
    	}
    	
    	$.ajax({
    		url : "boardReplyInput.bo",
    		type : "post",
    		data : query,
    		success:function(res){
    			if(res == "1"){
    				alert("댓글이 입력되었습니다.");
    				location.reload();
    			}
    			else{
    				alert("댓글 입력을 실패하였습니다.");
    			}
    		},
    		error:function(){
    			alert("전송오류");
    		}
    	});
    }
    // 댓글 삭제하기
    function replyDelete(idx) {
    	let ans = confirm("선택한 댓글을 삭제하시겠습니까?");
    	if(!ans) return false;
    	
    	$.ajax({
    		url  : "boardReplyDelete.bo",
    		type : "post",
    		data : {idx : idx},
    		success:function(res) {
    			if(res == "1") {
    				alert("댓글이 삭제되었습니다.");
    				location.reload();
    			}
    			else alert("댓글 삭제 실패");
    		},
    		error : function() {
    			alert("전송실패");
    		}
    	});
    }
    
    function goodCheck() {
    	$.ajax({
    		url  : "boardGoodCheck.bo",
    		type : "post",
    		data : {idx : ${vo.idx}},
    		success:function(res) {
    			if(res == "0") alert('이미 좋아요 버튼을 클릭하셨습니다.');
    			else location.reload();
    		},
    	});
    }
    
</script>
</head>
<body>
<%@ include file="/include/nav.jsp" %>
<%@ include file="/include/header.jsp" %>
	<p><br/></p>
	<div class="container" style="text-align: center;">
		<p colspan="2" style="text-align: right">${fn:substring(vo.wDate,0,10)}</p>
		<c:if test="${sMid == vo.mid}">
		<input type="button" value="삭제" onclick="boardDelete()" class="btn btn-danger ml-2 btn-sm"/>
		<input type="button" value="수정" onclick="location.href='boardUpdate.bo?idx=${vo.idx}';" class="btn btn-light" btn-sm />
		</c:if>
		<table class="table table-bordered">
			<tr>
				<th>👤</th>
				<td><a href="#myModal" data-toggle="modal" >${vo.nick}</a></td>
				
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="2">${vo.title}</td>
			</tr>
			</table>
			
			<div style="text-align: center;">
				<td>
					<img src="${ctp}/images/board/blog/${vo.fSName}" width="500px"; height="400px"; style="text-center"/>
				</td>
			</div>
			<p><br/></p>
		<table class="table table-bordered" >
			<tr>
				<td colspan="2">${fn:replace(vo.content,newLine,"<br/>")}</td>
			</tr>
		</table>
		<div style="float: left;"><font color="red"><a href="javascript:goodCheck()">♥</a></font><font color="gray">+${vo.good}</font></div>					
		<br/>
		<br/>
	
	<!-- 댓글 처리 -->
<div class="container">
	<!-- 댓글 리스트 보여주기 -->
  <table class="table table-hover text-center" >
	<p style="text-align: left;">댓글</p>
    <c:forEach var="replyVo" items="${vos}" varStatus="st">
      <tr>
        <td>${replyVo.mid}
        	<c:if test="${replyVo.mid == sMid }">
        		<span style="color: red">(<a href = "javascript:replyDelete(${replyVo.idx})">x</a>)</span>
        	</c:if>
        </td>
        <td class="text-left">${fn:replace(replyVo.content,newLine,"<br/>")}</td>
        <td>${fn:substring(replyVo.wDate,0,10)}</td>
      </tr>
      <tr><td colspan="4" class="m-0 p-0"></td></tr>
    </c:forEach>
  </table>
  
  <!-- 댓글 입력창 -->
	<form name="replyForm">
		<table class="table table-center">
			<tr>
				<td style="width:85% class="text-left">
					<textarea rows="4" name="content" id="content" class="form-control"></textarea> 
				</td style="width:15%">
				<td>
					<br/>
					<p><input type="button" value="댓글달기" onclick="replyCheck()" class="btn btn-danger btn-sm"/></p>
				</td>
			</tr>
		</table>
	</form>

	

	
	</form>
	</div>
	</div>
	
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      	<img src="${ctp}/images/이웃추가.jpg">
      	<center>
		<form name="modalForm" action="neighborAdd.ne" method="post">
		    <input type="text" name="nick" value="${vo.nick}" style="text-align: center;" readonly="readonly">
		    <p></p>
		    <input type="submit" value="이웃추가" class="w3-button w3-purple">
		    <p></p>
		</form>
		</center>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

	
<%@ include file="/include/footer.jsp" %>
</body>
</html>
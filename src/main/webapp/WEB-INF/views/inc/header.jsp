<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
$(document).ready(function() {
	
	// 새로운 메세지 표시
	var contextpath = $('#contextpath').val();
	$.ajax({
		type : "post",
		url : contextpath + "/alertnewmessage.htm",
		success : function(data) { //callback
			if (data != null) {
				console.log(data.result);
				$('#newmessagecount').text(data.result);
			}

		}// success : function(data)
	});//$.ajax({
		
		
});
</script>

<input type="hidden" id="contextpath" value="<%=request.getContextPath()%>">

<nav class="navbar navbar-inverse navbar-fixed-top" style="margin-bottom: 0px;">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/submain.htm" 
			style="padding-bottom: 0px; padding-right: 10px; padding-top: 0px;"><img src="<%=request.getContextPath()%>/images/무전무죄_logo_fin_04.png" style="width: 75px; height: 55px;"></a>
		</div>
		<div>
			<ul class="nav navbar-nav">
				<li><a href="<%=request.getContextPath()%>/notice/noticelist.htm">공지사항</a></li>
				<li><a href="<%=request.getContextPath()%>/workboard/worklist.htm">귀인만나기</a></li>
				<li><a href="<%=request.getContextPath()%>/epilogue/epiloguelist.htm">여행후기</a></li>
				<li><a href="<%=request.getContextPath()%>/freeboard/freelist.htm">자유게시판</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<se:authentication property="name" var="LoingUser" />
				<se:authorize ifAnyGranted="ROLE_ADMIN">
					<li><a href="<%=request.getContextPath()%>/admin/memberlist.htm"><span class="glyphicon glyphicon-user"></span>
							회원현황</a></li>
				</se:authorize>
				<se:authorize ifNotGranted="ROLE_ADMIN">
					<li><a href="<%=request.getContextPath()%>/mypage/messagereceivelist.htm">
					<span class="glyphicon glyphicon-envelope"></span>
					&nbsp;&nbsp;<span style="color: #9d9d9d;" id="newmessagecount">1</span></a>
					</li>
					<li><a href="<%=request.getContextPath()%>/mypage/memberinfo.htm"><span class="glyphicon glyphicon-user"></span>
							MyPage</a></li>
				</se:authorize>
				<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
					<li><a href="<%=request.getContextPath()%>/logout">
							<span class="glyphicon glyphicon-log-out"></span>  [${LoingUser}]님 로그아웃</a></li>
				</se:authorize>
			</ul>
		</div>
	</div>
</nav>
  
<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">

    <div class="item active" align="center">
      <img src="<%=request.getContextPath()%>/images/main.jpg" alt="Chania" width="100%" height="40%">
      <div class="carousel-caption">
        <h3>무전무죄</h3>
        <p>돈없는 것은 죄가 아니다.</p>
      </div>
    </div>

    <div class="item" align="center">
      <img src="<%=request.getContextPath()%>/images/walk.jpg" alt="main" width="100%" height="40%">
      <div class="carousel-caption">
        <h3>떠나보자</h3>
        <p>떠나라 떠나라!! 어디든 떠나라!</p>
      </div>
    </div>
  
    <div class="item" align="center">
      <img src="<%=request.getContextPath()%>/images/submain.jpg" alt="submain" width="100%" height="40%">
      <div class="carousel-caption">
        <h3>당신도 떠나요</h3>
        <p>지금이라도 떠날수 있다!!</p>
      </div>
    </div>

    <div class="item" align="center">
      <img src="<%=request.getContextPath()%>/images/free.jpg" alt="free" width="100%" height="40%">
      <div class="carousel-caption">
        <h3>망설이지 마요</h3>
        <p>지금이 기회 입니다!</p>
      </div>
    </div>

  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

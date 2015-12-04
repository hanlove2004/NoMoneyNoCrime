<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/submain.htm" style="padding-bottom: 0px; padding-right: 10px; padding-top: 0px;"><img src="<%=request.getContextPath()%>/images/무전무죄_logo_fin_04.png" style="width: 75px; height: 55px;"></a>
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
				<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
					<li><a href="<%=request.getContextPath()%>/mypage/memberinfo.htm"><span class="glyphicon glyphicon-user"></span>
							MyPage</a></li>
					<li><a href="<%=request.getContextPath()%>/logout"> (${LoingUser})님 로그아웃</a></li>
				</se:authorize>
			</ul>
		</div>
	</div>
</nav>

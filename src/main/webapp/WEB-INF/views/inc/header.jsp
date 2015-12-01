<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">무전무죄</a>
		</div>
		<div>
			<ul class="nav navbar-nav">
				<li><a href="notice/noticelist.htm">공지사항</a></li>
				<li><a href="workboard/workboardlist.htm">귀인만나기</a></li>
				<li><a href="/pilogue/epiloguelist.htm">여행후기</a></li>
				<li><a href="freeboard/freelist.htm">자유게시판</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<se:authentication property="name" var="LoingUser" />
				<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
					<li><a href="mypage/memberinfo.htm"><span class="glyphicon glyphicon-user"></span>
							MyPage</a></li>
					<li><a href="main/logout.htm"> (${LoingUser})님 로그아웃</a></li>
				</se:authorize>
			</ul>
		</div>
	</div>
</nav>

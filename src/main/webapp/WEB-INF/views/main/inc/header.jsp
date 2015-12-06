<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>

<nav class="navbar navbar-fixed-top" style="margin-bottom: 0px;">
	<div class="container-fluid">
	   <div class="navbar-header">
	      <a class="navbar-brand" href="<%=request.getContextPath()%>/main.htm" style="padding-bottom: 0px; padding-right: 10px; 
	      	padding-top: 0px;">
	      	<img src="<%=request.getContextPath()%>/images/무전무죄_logo_fin_09.png" style="width: 75px; height: 55px;">
	      </a>
	   </div>
	   <div>
	      <ul class="nav navbar-nav navbar-right">
	         <li class="li1">
	         	<a href="#"><span class="glyphicon glyphicon-search"></span> 검색</a>
	         </li>
	         
	         <se:authorize ifNotGranted="ROLE_USER">
	         <li class="li2">
	         	<a href="#"><span class="glyphicon glyphicon-log-in"></span> 로그인</a>
	         </li>
	         <li class="li3">
	         	<a href="#"><span class="glyphicon glyphicon-edit"></span> 회원가입</a>
	         </li>
	         </se:authorize>
	         
	         <se:authentication property="name" var="LoingUser" />
	            <se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
					<li>
						<a href="${pageContext.request.contextPath}/logout">(${LoingUser})로그아웃</a>
					</li>
				</se:authorize>
	         
	         <li class="li4">
	         	<a href="#"><span class="glyphicon glyphicon-question-sign"></span> 사용방법</a></li>
	      </ul>
	   </div>
	</div>
</nav>
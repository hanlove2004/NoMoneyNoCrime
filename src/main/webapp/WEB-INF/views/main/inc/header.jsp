<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>

<nav class="navbar">

   <div class="navbar-header">
      <a class="navbar-brand" href="main.htm">무전무죄</a>
   </div>
   <div>
      <ul class="nav navbar-nav navbar-right">
         <li class="li1"><a> <span class="glyphicon glyphicon-log-in"></span>
                  시작
         </a></li>
         
         <se:authorize ifNotGranted="ROLE_USER">
         <li class="li2"><a> <span class="glyphicon glyphicon-log-in"></span>
                  로그인
         </a></li>
         <li class="li3"><a> <span class="glyphicon glyphicon-log-in"></span>
                  회원가입
         </a></li>
         </se:authorize>
         <se:authentication property="name" var="LoingUser" />
            <se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
               <li><a href="${pageContext.request.contextPath}/logout">
                     (${LoingUser})로그아웃</a></li>
               </se:authorize>
         
         <li class="li4"><a> <span
               class="glyphicon glyphicon-question-sign"></span> 사용방법
         </a></li>
      </ul>
   </div>


</nav>
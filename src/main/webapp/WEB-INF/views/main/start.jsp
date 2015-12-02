<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 메인 -->
<div id="start" class="collapse in">
   <div class="well well-lg">
      메인 
      <br> 
      <br> 
      <br> 
      <br> 
      <br> 
      <br> 
      <br>
      <br> 
      메인 끝
   </div>
</div>

<!-- 로그인 -->
<div id="login" align="center" class="collapse">
   <div class="well well-lg" style="text-align: center; vertical-align: middle; margin: auto; width: 400px; border-color: white; border-style:;">
      <h1>로그인</h1>
      <c:if test="${param.error != null}">
         <div>
            로그인실패<br>
            <c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
                           이유 : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
            </c:if>
         </div>
      </c:if>

      <form action="${pageContext.request.contextPath}/login" method="post">
         <div class="form-group form-inline">
            <label for="id" class="col-sm-3 control-label">아이디:</label>
            <div class="col-sm-8">
               <input type="text" class="form-control" id="username" name="username" placeholder="Enter email">
            </div>
         </div>
         <div class="form-group form-inline">
            <label for="pwd" class="col-sm-3 control-label">비밀번호:</label>
            <div class="col-sm-8">
               <input type="password" class="form-control" id="password" name="password" placeholder="Enter password">
            </div>
         </div>
         <button type="submit" class="btn btn-default">로그인</button>
         <!-- 모달이동 -->
         <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">ID / PWD 찾기</button>
      </form>
   </div>
</div>

<!-- ID / PWD 찾기 Modal -->
<div class="modal fade" id="myModal" role="dialog">
   <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">ID / PWD 찾기</h4>
         </div>
         <div class="modal-footer">
            <form action="${pageContext.request.contextPath}/main/searchid.htm" method="post">
               <div class="form-group form-inline">
                  <label for="id" class="col-sm-3 control-label">이름:</label>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="name" name="name" placeholder="name">
                  </div>
               </div>
               <div class="form-group form-inline">
                  <label for="pwd" class="col-sm-3 control-label">이메일:</label>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="email" name="email" placeholder="email">
                  </div>
               </div>
               <button type="submit" class="btn btn-default">확인</button>
            </form>
         </div>

         <div class="modal-footer">
            <form action="${pageContext.request.contextPath}/main/searchpwd.htm" method="post">
               <div class="form-group form-inline">
                  <label for="id" class="col-sm-3 control-label">아이디:</label>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="id" name="id" placeholder="id">
                  </div>
               </div>
               <div class="form-group form-inline">
                  <label for="pwd" class="col-sm-3 control-label">이메일:</label>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="email" name="email" placeholder="email">
                  </div>
               </div>
               <button type="submit" class="btn btn-default">확인</button>
            </form>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
         </div>
      </div>

   </div>
</div>

<!-- 회원가입 -->
<div id="join" align="center" class="collapse">
   <div class="well well-lg" align="center" style="margin: auto; height: 85%; width: 50%;">
      <div style="width: 400px;">
         <form class="form-horizontal" name="joinform" action="main/join.htm" method="post" onsubmit="return CheckForm();">
            
            <div class="form-group">
               <label for="m_id" class="col-sm-4 control-label">아이디</label>
               <div class="col-sm-8">
                  <input type="text" class="form-control" name="id" id="id" placeholder="ID">
               </div>
            </div>
            
            <div class="form-group">
               <label for="m_pwd1" class="col-sm-4 control-label">비밀번호</label>
               <div class="col-sm-8">
                  <input type="password" class="form-control" name="pwd" id="pwd" placeholder="Password">
               </div>
            </div>
            
            <div class="form-group">
               <label for="m_pwd2" class="col-sm-4 control-label">비밀번호확인</label>
               <div class="col-sm-8">
                  <input type="password" class="form-control" name="confirmpwd" id="confirmpwd" placeholder="Password Check">
               </div>
            </div>
            
            <div class="form-group">
               <label for="m_pwd2" class="col-sm-4 control-label"></label>
               <div class="col-sm-8" id="pwdcheck">필수정보 입니다.</div>
            </div>
            
            <div class="form-group">
               <label for="m_nick" class="col-sm-4 control-label">이름</label>
               <div class="col-sm-8">
                  <input type="text" class="form-control" name="name" id="name" placeholder="Nickname">
               </div>
            </div>
            
            <div class="form-group">
               <label for="phone" class="col-sm-4 control-label">전화번호</label>
               <div class="col-sm-8">
                  <input type="text" class="form-control" name="phone" id="phone" placeholder="(예시) 01012345678">
               </div>
            </div>
            <div class="form-group">
               <label for="m_gender" class="col-sm-4 control-label">성별</label>
               <div class="col-sm-5">
                  <label class="radio-inline"> <input type="radio" name="sex" id="man" value="남" checked>남</label> 
                  <label class="radio-inline"> <input type="radio" name="sex" id="woman" value="여">여</label>
               </div>
            </div>
            
            <div class="form-group">
               <label for="birth" class="col-sm-4 control-label">생년월일</label>
               <div class="col-sm-8">
                  <input type="date" class="form-control" name="birth" id="birth">
               </div>
            </div>
            
            <div class="form-group">
               <label for="birth" class="col-sm-4 control-label">이메일</label>
               <div class="col-sm-8">
                  <input type="text" class="form-control" name="email" id="email">
               </div>
            </div>
            
            <hr>
            
            <input type="submit" value="JOIN" class="btn btn-success"> 
            <input type="button" onclick="location.href='javascript:joinform.reset()'" value="RESET" class="btn btn-info"> 
            <input type="button" onclick="location.href='main.start'" value="CANCEL" class="btn btn-danger">
         </form>
      </div>
   </div>
</div>

<!-- 사용방법 -->
<div id="howtouse" align="center" class="collapse">
   <div class="well well-lg">
      사용방법 
      <br> 
      <br> 
      <br> 
      <br> 
      <br> 
      <br> 
      <br>
      <br> 
      사용방법 끝
   </div>
</div>
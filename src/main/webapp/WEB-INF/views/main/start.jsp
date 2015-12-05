<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 메인 -->
<div id="start" align="center" class="collapse in" style="margin-top: 90px;">
	<div class="jumbotron text-center" style="vertical-align: middle; margin: auto; width: 500px; border-radius: 0.5em; background-color: #F2E966;">
		<h2 style="font-family: myfont05;">돈 없는 것은 죄가 아니다!</h2> 
		<b style="font-family: myfont05; font-size: 20px; color: #DC0429">떠나세요! 여러분의 무전여행을 도와드립니다.</b>
		<hr>
		<form class="form-inline">
			<input type="text" class="form-control" size="35" placeholder="여행후기 검색">&nbsp;&nbsp;&nbsp;
			<a href="#" class="btn btn-danger">
				<span class="glyphicon glyphicon-search"></span> Search
			</a> 
		</form>
	</div>
</div>

<!-- 로그인 -->
<div id="login" class="collapse" style="margin: 80px;" >
   <div class="well" 
   		style="text-align: center; vertical-align: middle; margin: auto; width: 350px; border-radius: 0.5em; background-color: #F2E966;">
      <h1 style="font-family: myfont05;">로그인</h1>
      <hr>
      <!-- SECURITY 적용부분 -->
      <c:if test="${param.error != null}">
         <div>
            로그인실패<br>
            <c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
                               이유 : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
            </c:if>
         </div>
      </c:if>

      <form action="${pageContext.request.contextPath}/login" method="post">
         
         <div class="form-group">
            <label for="username" class="col-sm-3 control-label" style="font-size: 20px; text-align: right; vertical-align: middle;">
            	<span class="glyphicon glyphicon-user"></span>
            </label>
            <div class="col-sm-8">
               <input type="text" class="form-control" id="username" name="username" placeholder="ID">
            </div>
         </div>
         
         <div class="form-group">
            <label for="password" class="col-sm-3 control-label" style="font-size: 20px; text-align: right; vertical-align: middle;">
            	<span class="glyphicon glyphicon-lock"></span>
            </label>
            <div class="col-sm-8">
               <input type="password" class="form-control" id="password" name="password" placeholder="PASSWORD">
            </div>
         </div>
         <hr>
         <button type="submit" class="btn btn-success">로그인</button>&nbsp;&nbsp;&nbsp;
         
         <!-- 모달이동 -->
         <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">ID / PWD 찾기</button>
      </form>
   </div>
</div>

<!-- ID / PWD 찾기 Modal -->
<div class="modal fade" id="myModal" role="dialog">
   <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content" style=" background-color: #F2EFC2;">
      
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">ID / PWD 찾기</h4>
         </div>
         
         <!-- ID 찾기 -->
         <div class="modal-footer">
            <form action="${pageContext.request.contextPath}/main/searchid.htm" method="post">
               <div class="form-group form-inline">
                  <h4 class="modal-title" style="text-align: left;">ID 찾기</h4>
                  <label for="name" class="col-sm-3 control-label">이름:</label>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="name" name="name" placeholder="name">
                  </div>
               </div>
               
               <div class="form-group form-inline">
                  <label for="email" class="col-sm-3 control-label">이메일:</label>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="email" name="email" placeholder="email">
                  </div>
               </div>
               
               <button type="submit" class="btn btn-default">확인</button>
            </form>
         </div>

         <!-- PWD 찾기 -->
         <div class="modal-footer">
            <form action="${pageContext.request.contextPath}/main/searchpwd.htm" method="post">
               <div class="form-group form-inline">
                  <h4 class="modal-title"style="text-align: left;">PWD 찾기</h4>
                  <label for="id" class="col-sm-3 control-label">아이디:</label>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="searchid" name="searchid" placeholder="id">
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
   <div class="well well-lg" align="center" style="margin: auto; height: 85%; width: 40%; background-color: #F2E966;">
      <!-- <div style="width: 400px;"> -->
         <form class="form-horizontal" name="joinform" action="main/join.htm" method="post" onsubmit="return CheckForm();">
            
            <div class="form-group">
               <label for="id" class="col-sm-4 control-label">아이디</label>
               <div class="col-sm-6">
                  <input type="text" class="form-control input-sm" name="id" id="id" placeholder="ID">
               </div>
            </div>
            <div class="form-group">
               <label for="pwd" class="col-sm-4 control-label">비밀번호</label>
               <div class="col-sm-6">
                  <input type="password" class="form-control input-sm" name="pwd" id="pwd" placeholder="Password">
               </div>
            </div>
            <div class="form-group">
               <label for="confirmpwd" class="col-sm-4 control-label">비밀번호확인</label>
               <div class="col-sm-6">
                  <input type="password" class="form-control input-sm" name="confirmpwd" id="confirmpwd" placeholder="Password Check">
               </div>
            </div>
            <div class="form-group">
               <label for="pwdcheck" class="col-sm-4 control-label"></label>
               <div class="col-sm-6" id="pwdcheck">필수정보 입니다.</div>
            </div>
            <div class="form-group">
               <label for="name" class="col-sm-4 control-label">이름</label>
               <div class="col-sm-6">
                  <input type="text" class="form-control input-sm" name="name" id="name" placeholder="Name">
               </div>
            </div>
            <div class="form-group">
               <label for="phone" class="col-sm-4 control-label">전화번호</label>
               <div class="col-sm-6">
                  <input type="text" class="form-control input-sm" name="phone" id="phone" placeholder="(예시) 01012345678">
               </div>
            </div>
            <div class="form-group">
               <label for="sex" class="col-sm-4 control-label">성별</label>
               <div class="col-sm-4">
                  <label class="radio-inline"> <input type="radio" name="sex" id="man" value="남" checked>남</label> 
                  <label class="radio-inline"> <input type="radio" name="sex" id="woman" value="여">여</label>
               </div>
            </div>
            <div class="form-group">
               <label for="birth" class="col-sm-4 control-label">생년월일</label>
               <div class="col-sm-6">
                  <input type="date" class="form-control input-sm" name="birth" id="birth">
               </div>
            </div>
            <div class="form-group">
               <label for="email" class="col-sm-4 control-label">이메일</label>
               <div class="col-sm-6">
                  <input type="text" class="form-control input-sm" name="email" id="email" placeholder="(예시) kosta@kosta.co.kr">
               </div>
            </div>
            <br>
            <input type="submit" value="JOIN" class="btn btn-success"> 
            <input type="button" onclick="location.href='javascript:joinform.reset()'" value="RESET" class="btn btn-info"> 
            <input type="button" onclick="location.href='main.start'" value="CANCEL" class="btn btn-danger">
         </form>
      <!-- </div> -->
   </div>
</div>

<!-- 사용방법 -->
<div id="howtouse" class="collapse">
	<div class="well well-lg" style="margin: auto; height: 85%; width: 90%; background-color: #F2E966;">
		<div class="container">
			<h3 style="font-family: myfont05;">무전무죄 이용은 어떻게 하나요?</h3>
			<p>
				<strong>Note:</strong> The <strong>data-parent</strong> attribute
				makes sure that all collapsible elements under the specified parent
				will be closed when one of the collapsible item is shown.
			</p>
			<div class="panel-group" id="accordion">
				<div class="panel panel-danger">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" 
								href="#collapse1">귀인 이란?</a>
						</h4>
					</div>
					<div id="collapse1" class="panel-collapse collapse in">
						<div class="panel-body">
							Lorem ipsum dolor sit amet,
							consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
							labore et dolore magna aliqua. Ut enim ad minim veniam, quis
							nostrud exercitation ullamco laboris nisi ut aliquip ex ea
							commodo consequat.
						</div>
					</div>
				</div>
				<div class="panel panel-success">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" 
								href="#collapse2">귀인과 매칭되는 방식은?</a>
						</h4>
					</div>
					<div id="collapse2" class="panel-collapse collapse">
						<div class="panel-body">
							Lorem ipsum dolor sit amet,
							consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
							labore et dolore magna aliqua. Ut enim ad minim veniam, quis
							nostrud exercitation ullamco laboris nisi ut aliquip ex ea
							commodo consequat.
						</div>
					</div>
				</div>
				<div class="panel panel-info">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" 
								href="#collapse3">어플리케이션 이용방법은?</a>
						</h4>
					</div>
					<div id="collapse3" class="panel-collapse collapse">
						<div class="panel-body">
							Lorem ipsum dolor sit amet,
							consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
							labore et dolore magna aliqua. Ut enim ad minim veniam, quis
							nostrud exercitation ullamco laboris nisi ut aliquip ex ea
							commodo consequat.
						</div>
					</div>
				</div>
				<div class="panel panel-warning">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" 
								href="#collapse4">각종 문의는 어떻게?</a>
						</h4>
					</div>
					<div id="collapse4" class="panel-collapse collapse">
						<div class="panel-body">
							Lorem ipsum dolor sit amet,
							consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
							labore et dolore magna aliqua. Ut enim ad minim veniam, quis
							nostrud exercitation ullamco laboris nisi ut aliquip ex ea
							commodo consequat.
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 메인 -->
<div id="start" align="center" class="collapse in" style="margin-top: 90px;">
   <div class="jumbotron text-center" style="vertical-align: middle; margin: auto; width: 500px; border-radius: 0.5em; background-color: #E5F1B5;">
      <h2 style="font-family: myfont05;">돈 없는 것은 죄가 아니다!</h2> 
      <b style="font-family: myfont05; font-size: 20px; color: #DC0429">떠나세요! 여러분의 무전여행을 도와드립니다.</b>
      <hr>
      <form class="form-inline">
         <input type="text" id="mainsearch" class="form-control" size="35" placeholder="여행후기 검색">
         
         &nbsp;&nbsp;&nbsp;
         
         <a href="#" class="btn btn-danger" id="searchbutton">
            <span class="glyphicon glyphicon-search"></span> Search
         </a> 
         
      </form>
      
      <!-- mainsearch 결과 list -->
      <div id="suggest" style=" margin-left:47px;" >
         <ul style="list-style:none;position: absolute;background-color: white;padding-left: 10px" id="keywordlist">
         </ul>
      </div> 
      
   </div>
</div>

<!-- 로그인 -->
<div id="login" class="collapse" style="margin: 80px;" >
   <div class="well" 
   		style="text-align: center; vertical-align: middle; margin: auto; width: 350px; border-radius: 0.5em; background-color: #E5F1B5;">
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
         <button type="submit" class="btn btn-success">로그인</button>&nbsp;&nbsp;
         
         <!-- 모달이동 -->
         <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">ID / PWD 찾기</button>
      </form>
   </div>
</div>

<!-- ID / PWD 찾기 Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog" style="width: 400px;">
		
		<!-- Modal content-->
		<div class="modal-content" style="background-color: #A8D5F6;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" style="font-family: myfont05;">ID / PWD 찾기</h4>
			</div>
			<!-- ID 찾기 -->
			<form action="${pageContext.request.contextPath}/main/searchid.htm"	method="post">
				<div class="modal-body">
					<h4 class="modal-title" style="text-align: left;">ID 찾기</h4>
					<div class="form-group form-inline">
						<br>
						<label for="name" class="col-sm-3 control-label" style="font-size: 15px; text-align: right; vertical-align: middle;">이름</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="name" name="name" placeholder="name">
						</div>
					</div>
					<div class="form-group form-inline">
						<label for="email" class="col-sm-3 control-label" style="font-size: 15px; text-align: right; vertical-align: middle;">이메일</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="email" name="email"	placeholder="email">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-search"></span> 찾기</button>
				</div>
			</form>
			<!-- PWD 찾기 -->
			<form action="${pageContext.request.contextPath}/main/searchpwd.htm" method="post">
				<div class="modal-body">
					<h4 class="modal-title" style="text-align: left;">PWD 찾기</h4>
					<div class="form-group form-inline">
						<br>
						<label for="id" class="col-sm-3 control-label" style="font-size: 15px; text-align: right; vertical-align: middle;">아이디</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="searchid" name="searchid" placeholder="id">
						</div>
					</div>
					<div class="form-group form-inline">
						<label for="pwd" class="col-sm-3 control-label" style="font-size: 15px; text-align: right; vertical-align: middle;">이메일</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="email" name="email"	placeholder="email">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-search"></span> 찾기</button>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- 회원가입 -->
<div id="join" align="center" class="collapse">
   <div class="well well-lg" align="center" style="margin: auto; height: 85%; width: 40%; background-color: #E5F1B5;">
      <!-- <div style="width: 400px;"> -->
         <form class="form-horizontal" name="joinform" action="main/join.htm" method="post">
            
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
               <button type="submit" class="btn btn-success" name="check" id="check">가입</button>
		       <button type="reset" class="btn btn-info" onclick="location.href='javascript:joinform.reset()'">재작성</button>
            <!-- <input type="submit" value="JOIN" class="btn btn-success">&nbsp;&nbsp;
            <input type="button" onclick="location.href='javascript:joinform.reset()'" value="RESET" class="btn btn-info"> --> 
         </form>
   </div>
</div>

<!-- 사용방법 -->
<div id="howtouse" class="collapse">
	<div class="well well-lg" style="margin: auto; height: 85%; width: 90%; background-color: #E5F1B5;">
		<div class="container">
			<h3 style="font-family: myfont05;">무전무죄 이용은 어떻게 하나요?</h3>
			<p style="color: gray;">
				<strong>기타문의사항:</strong> <strong>무전무죄</strong> 사이트를 이용하시면서
				문의사항이 있으시면 전화번호(031-1234-5678) 또는 이메일(NoMoneyNoCrime@naver.com)로
				문의를 주시면 빠른 답변을 드리겠습니다.
			</p>
			<div class="panel-group" id="accordion" style="font-family: myfont05;">
				<div class="panel panel-danger">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" 
								href="#collapse1">귀인 이란?</a>
						</h4>
					</div>
					<div id="collapse1" class="panel-collapse collapse in">
						<div class="panel-body">
							회원 여러분의 무전여행을 도와주는 소중한 분들을 말합니다.<br>
							여러분의 무전여행이 무전여행이기에 힘들고 어렵기만 한 것이 아니라 소중한 추억으로 
							채워질 수 있도록 도와주시는 분들이 바로 귀인입니다.
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
							귀인 만나기 게시판을 통해서 귀인과의 만남이 성사될 수 있습니다. 
							귀인 만나기 게시글 중에서 회원 여러분이 원하시는 게시글에 대해 신청을 하시면 귀인에게 신청 양식이 전달됩니다.<br>
							귀인이 승인을 하게 되면 매칭이 완료됩니다.
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
							어플리케이션을 설치하시면 저희 사이트에서 이용하실 수 있는 서비스를 모두 이용하실 수 있으며,
							추가적으로 길찾기 / 귀인찾기 등을 이용할 수 있는 지도 서비스를 함께 제공하고 있습니다. <br>
							무전여행 다니실 때의 불편함을 해결해 드리기 위해서 제공되는 어플리케이션이니 회원 여러분의 많은 이용 부탁드립니다.
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
							각종 문의는 평일 오전 9시부터 오후 6시까지 아래의 전화번호를 통해서 연락을 주시면 문의에 대한 답변이 가능합니다.<br>
							그리고 서류를 전달하셔야 하는 분들은 아래의 팩스 번호로 보내주시면 바로 처리해 드리겠습니다.
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
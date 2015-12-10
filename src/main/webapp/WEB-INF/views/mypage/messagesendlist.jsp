<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="height: 500px; width: 700px; margin: auto;">
	<button type="button" class="btn btn-info"><a href="messagereceivelist.htm">받은쪽지함</a></button>
	&nbsp;&nbsp;&nbsp; 
	<button type="button" class="btn btn-info"><a href="messagesendlist.htm">보낸쪽지함</a></button>
	<button type="button" class="btn btn-info" style="margin-left: 400px;">
		<a href="#" data-toggle="modal" data-target="#messageModal" onclick="setReceiver()">쪽지보내기</a>
	</button>

	<!-- 보낸쪽지함  -->
	<input type="hidden" id="listname" value="sendlist">
	<div class="messagesendlisthead" style="padding-top: 20px;">
		<div class="col col-xs-2">받는사람</div>
		<div class="col col-xs-6">내용</div>
		<div class="col col-xs-2">보낸날짜</div>
		<div class="col col-xs-1">쪽지</div>
		<hr>
	</div>
	
	<c:forEach var="messagesendlist" items="${messagesendlist}">
	<div>
			<div class="col col-xs-2">${messagesendlist.receiver}</div>
			<div class="col col-xs-6">${messagesendlist.content}</div>
			<div class="col col-xs-2">${messagesendlist.regdate}</div>
			<div class="col col-xs-2">
				<button type="button" class="btn btn-xs">
					<a href="#" data-toggle="modal" data-target="#messageModal" onclick="setSenderReceiver()">보내기</a>
				</button>
				<input type="hidden" id="messagenum" value="${messagesendlist.num}">
				<button type="button" class="btn btn-xs">
					<a href="#" data-toggle="modal" data-target="#messagedeleteModal" onclick="setMessageNum()">삭제</a>
				</button>
			</div><br>
			<div><hr></div>
			
			<!-- 메세지 폼 에서 사용할 데이터 -->
			<input type="hidden" id="message_from" value="${messagesendlist.sender}">
			<input type="hidden" id="message_to" value="${messagesendlist.receiver}">
	</div>
	</c:forEach>
	<div style="margin: 0 auto; width: 300px;">
	         <nav style="text-align: center;">
	            <ul class="pagination pagination-sm">
	               <!-- 처음 , 이전 페이지로 이동 -->
	               <c:if test="${pg>block}">
	                  <li><a href="messagesendlist.htm?strPg=1">처음</a></li>
	                  <li><a href="messagesendlist.htm?strPg=${fromPage-1}" aria-label="Previous"> 
	                     <span aria-hidden="true">&laquo;</span>
	                  </a></li>
	               </c:if>
	               <!-- 각 페이지로 이동 -->
	               <c:forEach begin="${fromPage}" end="${toPage}" var="i">
	                  <c:if test="${i==pg}">
	                     <li class="active"><a>${i}</a></li>
	                  </c:if>
	                  <c:if test="${i!=pg}">
	                     <li><a href="messagesendlist.htm?strPg=${i}">${i}</a></li>
	                  </c:if>
	               </c:forEach>
	               <!-- 마지막 , 다음 페이지로 이동 -->
	               <c:if test="${toPage<allPage}">
	                  <li><a href="messagesendlist.htm?strPg=${toPage+1}" aria-label="Next">
	                        <span aria-hidden="true">&raquo;</span>
	                  </a></li>
	                  <li><a href="messagesendlist.htm?strPg=${allPage}">마지막</a></li>
	               </c:if>
	            </ul>
	         </nav>
	      </div>

</div>

<!-- 쪽지 form modal include  -->
<%@ include file="messagemodal.jsp" %>
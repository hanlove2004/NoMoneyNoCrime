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
	
	<!-- 받은쪽지함  -->
	<input type="hidden" id="listname" value="receivelist">
	<div class="messagereceivelisthead" style="padding-top: 20px;">
		<div class="col col-xs-2">보낸사람</div>
		<div class="col col-xs-6">내용</div>
		<div class="col col-xs-2">작성일</div>
		<div class="col col-xs-1">답장</div>
		<hr>
	</div>
	
	<c:forEach var="messagereceivelist" items="${messagereceivelist}">
	<div>
			<div class="col col-xs-2">${messagereceivelist.sender}</div>
			<div class="col col-xs-6">${messagereceivelist.content}</div>
			<div class="col col-xs-2">${messagereceivelist.regdate}</div>
			<div class="col col-xs-2">
				<button type="button" class="btn btn-xs">
					<a href="#" data-toggle="modal" data-target="#messageModal" onclick="setSenderReceiver()">보내기</a>
				</button>
				<input type="hidden" id="messagenum" value="${messagereceivelist.num}">
				<button type="button" class="btn btn-xs">
					<a href="#" data-toggle="modal" data-target="#messagedeleteModal" onclick="setMessageNum()">삭제</a>
				</button>
			</div><br>
			<div><hr></div>
			<!-- 메세지 폼 에서 사용할 데이터 -->
			<input type="hidden" id="message_from" value="${messagereceivelist.receiver}">
			<input type="hidden" id="message_to" value="${messagereceivelist.sender}">
	</div>
	</c:forEach>
	<div style="margin: 0 auto; width: 300px;">
	         <nav style="text-align: center;">
	            <ul class="pagination pagination-sm">
	               <!-- 처음 , 이전 페이지로 이동 -->
	               <c:if test="${pg>block}">
	                  <li><a href="messagereceivelist.htm?strPg=1">처음</a></li>
	                  <li><a href="messagereceivelist.htm?strPg=${fromPage-1}" aria-label="Previous"> 
	                     <span aria-hidden="true">&laquo;</span>
	                  </a></li>
	               </c:if>
	               <!-- 각 페이지로 이동 -->
	               <c:forEach begin="${fromPage}" end="${toPage}" var="i">
	                  <c:if test="${i==pg}">
	                     <li class="active"><a>${i}</a></li>
	                  </c:if>
	                  <c:if test="${i!=pg}">
	                     <li><a href="messagereceivelist.htm?strPg=${i}">${i}</a></li>
	                  </c:if>
	               </c:forEach>
	               <!-- 마지막 , 다음 페이지로 이동 -->
	               <c:if test="${toPage<allPage}">
	                  <li><a href="messagereceivelist.htm?strPg=${toPage+1}" aria-label="Next">
	                        <span aria-hidden="true">&raquo;</span>
	                  </a></li>
	                  <li><a href="messagereceivelist.htm?strPg=${allPage}">마지막</a></li>
	               </c:if>
	            </ul>
	         </nav>
	      </div>

</div>

<%@ include file="messagemodal.jsp" %>
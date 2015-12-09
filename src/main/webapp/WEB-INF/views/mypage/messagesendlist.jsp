<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="height: 500px; width: 600px; margin: auto;">
	<button type="button" class="btn btn-info"><a href="messagereceivelist.htm">받은쪽지함</a></button>
	&nbsp;&nbsp;&nbsp; 
	<button type="button" class="btn btn-info"><a href="messagesendlist.htm">보낸쪽지함</a></button>

	<!-- 보낸쪽지함  -->
	<div class="messagesendlisthead" style="padding-top: 20px;">
		<div class="col col-xs-2">글번호</div>
		<div class="col col-xs-2">받는사람</div>
		<div class="col col-xs-5">내용</div>
		<div class="col col-xs-3">작성일</div>
		<hr>
	</div>
	
	<c:forEach var="messagesendlist" items="${messagesendlist}">
	<div>
			<div class="col col-xs-2">${messagesendlist.num}</div>
			<div class="col col-xs-2">${messagesendlist.receiver}</div>
			<div class="col col-xs-5">${messagesendlist.content}</div>
			<div class="col col-xs-3">${messagesendlist.regdate}</div><br>
			<div><hr></div>
	</div>
	</c:forEach>
	<%-- <div style="margin: 0 auto; width: 300px;">
	         <nav style="text-align: center;">
	            <ul class="pagination pagination-sm">
	               <!-- 처음 , 이전 페이지로 이동 -->
	               <c:if test="${pg>block}">
	                  <li><a onclick="Paging(1)">처음</a></li>
	                  <li><a onclick="Paging(${fromPage-1})" aria-label="Previous"> 
	                     <span aria-hidden="true">&laquo;</span>
	                  </a></li>
	               </c:if>
	               <!-- 각 페이지로 이동 -->
	               <c:forEach begin="${fromPage}" end="${toPage}" var="i">
	                  <c:if test="${i==pg}">
	                     <li class="active"><a>${i}</a></li>
	                  </c:if>
	                  <c:if test="${i!=pg}">
	                     <li><a onclick="Paging(${i})">${i}</a></li>
	                  </c:if>
	               </c:forEach>
	               <!-- 마지막 , 다음 페이지로 이동 -->
	               <c:if test="${toPage<allPage}">
	                  <li><a onclick="Paging(${toPage+1})" aria-label="Next">
	                        <span aria-hidden="true">&raquo;</span>
	                  </a></li>
	                  <li><a onclick="Paging(${allPage})">마지막</a></li>
	               </c:if>
	            </ul>
	         </nav>
	      </div> --%>

</div>
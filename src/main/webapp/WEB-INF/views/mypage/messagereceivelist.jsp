<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="height: 500px; width: 700px; margin: auto;">
	<button type="submit" class="btn btn-info">
		<a href="messagereceivelist.htm">받은쪽지함</a><!-- 링크 설정해야함 -->
	</button>&nbsp;&nbsp;&nbsp;
	<button type="submit" class="btn btn-info">
		<a href="messagesendlist.htm">보낸쪽지함</a><!-- 링크 설정해야함 -->
	</button>
	<table class="table table-hover" style="text-align: center;">
		<tr style="height: 30px;" class="success">
			<td>번호</td>
			<td>제목</td>
			<td>날짜</td>
			<td>보낸사람</td>
		</tr>
		<!-- 받아오는 값 가칭 (messagereceivelist) 으로 설정 -->
		<c:forEach var="messagereceivelist" items="${messagereceivelist}">
			<tr style="height: 30px;">
				<td>${messagereceivelist.num}</td>
				<td><a href="messagedatail.htm?num=${messagereceivelist.num}">${messagereceivelist.title}</a></td>
				<td>${messagereceivelist.regdate}</td>
				<td>${messagereceivelist.receiver}</td>
			</tr>
		</c:forEach>
	</table>
	
	<div style="margin: 0 auto; width: 300px;">
		<nav style="text-align: center;">
			<ul class="pagination pagination-sm">
				<!-- 처음 , 이전 페이지로 이동 -->
				<c:if test="${pg>block}">
					<li><a href="messagereceivelist.htm?pg=1">처음</a></li>
					<li>
						<a href="messagereceivelist.htm?pg=${fromPage-1}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
			    	</li>
		    	</c:if> 
		    	<!-- 각 페이지로 이동 -->
		    	<c:forEach begin="${fromPage}" end="${toPage}" var="i">
		    		<c:if test="${i==pg}"><li class="active"><a>${i}</a></li></c:if>
					<c:if test="${i!=pg}">
						<li><a href="messagereceivelist.htm?pg=${i}">${i}</a></li>
					</c:if>
				</c:forEach> 
				<!-- 마지막 , 다음 페이지로 이동 -->
				<c:if test="${toPage<allPage}">
					<li>
						<a href="messagereceivelist.htm?pg=${toPage+1}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
					<li><a href="messagereceivelist.htm?pg=${allPage}">마지막</a></li>
				</c:if>
			</ul>
		</nav>
	</div>
</div>
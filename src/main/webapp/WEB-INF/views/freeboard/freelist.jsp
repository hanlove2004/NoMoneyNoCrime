<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="height: 500px; width: 700px; margin: auto;">
	<table class="table table-bordered"
		style="text-align: center; font-size: 30px;">
		<tr>
			<td class="active"><b>공지사항</b></td>
		</tr>
	</table>
	<table class="table table-hover" style="text-align: center;">
		<tr style="height: 30px;" class="success">
			<td>글번호</td>
			<td>작성자</td>
			<td>내용</td>
			<td>작성일</td>
		</tr>
		<c:forEach var="freelist" items="${freelist}">
			<tr style="height: 30px;">
				<td>${freelist.num}</td>
				<td>${freelist.id}</td>
				<td><a href="freedatail.htm?num=${freelist.num}">${freelist.title}</a></td>
				<td>${freelist.regdate}</td>
			</tr>
		</c:forEach>
	</table>
	
	<div style="text-align: right">
		<a href="freeinsert.htm">글쓰기</a>
	</div>
	<div style="margin: auto;">
		<nav>
			<ul class="pagination">
				<!-- 처음 , 이전 페이지로 이동 -->
				<c:if test="${pg>block}">
					<li><a href="freelist.htm?pg=1">처음</a></li>
					<li>
						<a href="freelist.htm?pg=${fromPage-1}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
			    	</li>
		    	</c:if> 
		    	<!-- 각 페이지로 이동 -->
		    	<c:forEach begin="${fromPage}" end="${toPage}" var="i">
					<c:if test="${i==pg}"><li>${i}</li></c:if>
					<c:if test="${i!=pg}">
						<li><a href="freelist.htm?pg=${i}">${i}</a></li>
					</c:if>
				</c:forEach> 
				<!-- 마지막 , 다음 페이지로 이동 -->
				<c:if test="${toPage<allPage}">
					<li>
						<a href="freelist.htm?pg=${toPage+1}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
					<li><a href='freelist.htm?pg=${allPage}'>마지막</a></li>
				</c:if>
			</ul>
		</nav>
	</div>
</div>
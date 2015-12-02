<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="height: 500px; width: 700px; margin: auto; overflow-y: scroll;">
	<table class="table table-bordered"
		style="text-align: center; font-size: 30px;">
		<tr>
			<td class="active"><b>자유게시판</b></td>
		</tr>
	</table>
	<c:set var="freeboarddto" value="${freeboarddto}" />
	<div style="height: 390px;">
		<table class="table table-striped" style="text-align: center; margin-bottom: 0;">
			<tr>
				<td>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>
				<td colspan="2" align="left">
					${freeboarddto.title}
				</td>
			</tr>
			<tr>
				<td>내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</td>
				<td colspan="2" style="height: 150px" align="left">
					<textarea name="content" cols="70" rows="16" readonly>${freeboarddto.content}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<button type="submit" class="btn btn-success">
						<a href="freelist.htm">확인</a>
					</button>&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-success">
						<a href="freelist.htm">목록</a>
					</button>
				</td>
			</tr>
		</table>
		<table class="table table-hover" style="text-align: center;">
			<c:forEach var="reply_freedtolist" items="${reply_freedtolist}">
				<tr class="success">
					<td>${reply_freedtolist.id}</td>
					<td>${reply_freedtolist.content}</td>
					<td>${reply_freedtolist.regdate}</td>
				</tr>
			</c:forEach>
		</table>
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
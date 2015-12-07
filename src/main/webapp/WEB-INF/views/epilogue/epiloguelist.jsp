<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="height: 500px; width: 700px; margin: auto;">
	<table class="table table-bordered"
		style="text-align: center; font-size: 30px;">
		<tr>
			<td class="active"><b>여행 후기</b></td>
		</tr>
	</table>
	<%-- <table class="table table-hover" style="text-align: center;">
		<tr style="height: 30px;" class="success">
			<td>글번호</td>
			<td>작성자</td>
			<td>내용</td>
			<td>작성일</td>
		</tr>
		<c:forEach var="epiloguelist" items="${epiloguelist}">
			<tr style="height: 30px;">
				<td>${epiloguelist.num}</td>
				<td><a href="epiloguedetail.htm?num=${epiloguelist.num}">${epiloguelist.title}</a></td>
				<td>${epiloguelist.id}</td>
				<td>${epiloguelist.regdate}</td>
			</tr>
		</c:forEach>
	</table> --%>
	
	<!-- 목록(카드 디자인) 테스트 -->
	<div style="margin: 0 auto; width: 700px; height: 500px;">
		<div class="card-deck-wrapper" style="margin: 0 auto;">
			<div class="card-deck">
				<c:forEach var="epiloguelist" items="${epiloguelist}">
					<div class="card" style="float: left; margin: 30px; padding: 10px; background-color: silver;
							-moz-box-shadow: 30px 3px 5px 5px black; 
					   		-webkit-box-shadow: 3px 3px 85px 5px black; 
					   		box-shadow: 10px 10px 30px 5px black; 
					   		border-top-right-radius: 1em;
					   		border-top-left-radius: 1em;
							border-bottom-right-radius: 1em;
							border-bottom-left-radius: 1em;">
						<img class="card-img-top" src="<%=request.getContextPath()%>/upload/${epiloguelist.photoname1}" 
							alt="${epiloguelist.title}" height="100px" width="150px">
						<div class="card-block">
							<h4 class="card-title"><b>${epiloguelist.title}</b></h4>
							<p class="card-text">
								<small class="text-muted">${epiloguelist.regdate}</small>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								<small class="text-muted">${epiloguelist.id}</small>
							</p>
							<a href="#" class="btn btn-primary" id="epilogue${epiloguelist.num}" onclick="epiloguedetail(${epiloguelist.num})">상세보기</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<div style="text-align: right">
		<a href="epilogueinsert.htm">글쓰기</a>
	</div>
	
	<div style="margin: 0 auto; width: 300px;">
		<nav style="text-align: center;">
			<ul class="pagination pagination-sm"">
				<!-- 처음 , 이전 페이지로 이동 -->
				<c:if test="${pg>block}">
					<li><a href="epiloguelist.htm?pg=1">처음</a></li>
					<li>
						<a href="epiloguelist.htm?pg=${fromPage-1}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
			    	</li>
		    	</c:if> 
		    	<!-- 각 페이지로 이동 -->
		    	<c:forEach begin="${fromPage}" end="${toPage}" var="i">
		    		<c:if test="${i==pg}"><li class="active"><a>${i}</a></li></c:if>
					<c:if test="${i!=pg}">
						<li><a href="epiloguelist.htm?pg=${i}">${i}</a></li>
					</c:if>
				</c:forEach> 
				<!-- 마지막 , 다음 페이지로 이동 -->
				<c:if test="${toPage<allPage}">
					<li>
						<a href="epiloguelist.htm?pg=${toPage+1}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
					<li><a href='epiloguelist.htm?pg=${allPage}'>마지막</a></li>
				</c:if>
			</ul>
		</nav>
	</div>
	
	<%@ include file="epiloguedetail.jsp" %>
</div>
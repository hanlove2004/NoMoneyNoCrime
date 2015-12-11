<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se"
   uri="http://www.springframework.org/security/tags"%>
<%@ include file="memberdetail.jsp" %>

<div class="container" id="admincontainer">
	<table class="table table-bordered"	style="text-align: center; font-size: 30px; font-family: myfont05; margin-top: 20px;">
		<tr>
			<td class="info"><b>회원현황</b></td>
		</tr>
	</table>
	
	<div id="memberlist">
		<table class="table table-hover" style="text-align: center;">
			<tr style="font-size: 15px;" class="success">
				<td>회원번호</td>
				<td>아이디</td>
				<td>이름</td>
				<td>생년월일</td>
				<td>전화번호</td>
				<td>상세보기</td>
			</tr>
			<c:forEach var="memberlist" items="${memberlist}">
				<tr style="font-size: 15px;">
					<td>${memberlist.num}</td>
					<td>${memberlist.id}</td>
					<td>${memberlist.name}</td>
					<td>${memberlist.birth}</td>
					<td>${memberlist.phone}</td>
					<td>
						<button type="button" class="btn btn-warning btn-sm" onclick="memberdetail(${memberlist.num})"
						data-toggle="modal" data-target="#memberModal">상세보기</button>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div style="margin: 0 auto;">
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
		</div>
	</div>
</div>
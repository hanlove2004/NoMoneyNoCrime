<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="height: 500px; width: 700px; margin: auto;">
	<table class="table table-bordered"	style="text-align: center; font-size: 30px;">
		<tr>
			<td class="active"><b>회원현황</b></td>
		</tr>
	</table>
	<table class="table table-hover" style="text-align: center;">
		<tr style="height: 30px;" class="success">
			<td>회원번호</td>
			<td>아이디</td>
			<td>이름</td>
			<td>생년월일</td>
			<td>전화번호</td>
			<td>상세보기</td>
		</tr>
		<c:forEach var="memberlist" items="${memberlist}">
			<tr style="height: 30px;">
				<td>${memberlist.num}</td>
				<td>${memberlist.id}</td>
				<td>${memberlist.name}</td>
				<td>${memberlist.birth}</td>
				<td>${memberlist.phone}</td>
				<td><a href="memberdatail.htm?num=${memberlist.num}" class="btn btn-primary">상세보기</a></td>
			</tr>
		</c:forEach>
	</table>
</div>
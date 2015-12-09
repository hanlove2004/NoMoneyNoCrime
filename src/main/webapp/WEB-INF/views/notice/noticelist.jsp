<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
	
<div class="container" id="noticecontainer">
	<table class="table table-bordered"
		style="text-align: center; font-size: 30px; font-family: myfont05; margin-top: 20px;">
		<tr>
			<td class="danger"><b>공지사항</b></td>
		</tr>
	</table>
	<se:authorize ifAllGranted="ROLE_USER,ROLE_ADMIN">
		<div align="right" style="width: 97%; height: 30px;">
			<button type="submit" class="btn btn-info btn-sm"><a href="noticeinsert.htm"><span class="glyphicon glyphicon-pencil"></span> 글쓰기</a>
		</div>
	</se:authorize>
	<div class="noticehead" style="padding-top: 20px;">
		<div class="col col-xs-2">글번호</div>
		<div class="col col-xs-2">작성자</div>
		<div class="col col-xs-5">제목</div>
		<div class="col col-xs-3">작성일</div>
		<div>
			<hr>
		</div>
	</div>
	<div id="list">
		<c:forEach var="noticelist" items="${noticelist}">
			<div>
				<!-- 글번호/작성자/제목/작성일 -->
				<div id="noticehead${noticelist.num}"
					onclick="NoticeDetail(${noticelist.num})">
					<div class="col col-xs-2">${noticelist.num}</div>
					<div class="col col-xs-2">${noticelist.id}</div>
					<div class="col col-xs-5">${noticelist.title}</div>
					<div class="col col-xs-3">${noticelist.regdate}</div>
					<div>
						<hr>
					</div>
				</div>
				<!-- detail -->
				<div class="notice" id="noticedetail${noticelist.num}"
					style="text-align: left;"></div>
			</div>
		</c:forEach>

		<div style="margin: 0 auto; width: 300px;">
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
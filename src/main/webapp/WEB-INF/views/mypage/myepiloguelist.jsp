<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se"
   uri="http://www.springframework.org/security/tags"%>
<div class="container" id="epiloguecontainer" style="width: 750px; background-color: #fff;
													border-radius: 0.5em;
													width: 750px;
													margin-top: 30px;
													margin-bottom: 30px;
													font-family: myfont05;">
	<table class="table table-bordered" style="text-align: center; font-size: 30px;">
		<tr>
			<td class="active"><b>나의 여행후기</b></td>
		</tr>
	</table>
	
	<se:authorize ifNotGranted="ROLE_ADMIN">
		<div align="right" style="width: 97%; height: 30px;">
				<a href="#" class="btn btn-info btn-sm" id="epilogueinsert" 
					data-target="#insertModal" data-toggle="modal" >글쓰기</a>
		</div>
	</se:authorize>
	<div id="myepiloguelist">
		<!-- 목록(카드 디자인) 테스트 -->
		<div style="margin: 0 auto; width: 600px; height: 500px;">
			<div class="card-deck-wrapper" style="margin: 0 auto;">
				<div class="card-deck">
					<c:forEach var="myepiloguelist" items="${myepiloguelist}">
						<div class="card" style="float: left; margin: 13px; padding: 7px; background-color: #DCD8D0;
								-moz-box-shadow: 10px 3px 5px 5px silver; 
						   		-webkit-box-shadow: 3px 3px 50px 5px silver; 
						   		box-shadow: 10px 10px 30px 5px silver; 
						   		border-top-right-radius: 0.5em;
						   		border-top-left-radius: 0.5em;
								border-bottom-right-radius: 0.5em;
								border-bottom-left-radius: 0.5em;">
							<img class="card-img-top" src="<%=request.getContextPath()%>/${myepiloguelist.photoname1}" 
								alt="${myepiloguelist.title}" height="100px" width="150px">
							<div class="card-block">
								<h4 class="card-title"><b>${myepiloguelist.title}</b></h4>
								<p class="card-text">
									<small class="text-muted">${myepiloguelist.regdate}</small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<small class="text-muted">${myepiloguelist.id}</small>
								</p>
								<div align="center">
								<a href="#" class="btn btn-primary" id="myepilogue${myepiloguelist.num}" onclick="myepiloguedetail(${myepiloguelist.num})"
								data-target="#epilogueModal" data-toggle="modal">상세보기</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
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

<%@ include file="myepiloguedetail.jsp" %>
<%@ include file="myepilogueinsert.jsp" %>
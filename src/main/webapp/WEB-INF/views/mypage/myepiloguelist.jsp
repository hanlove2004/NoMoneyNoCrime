<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="height: 500px; width: 700px; margin: auto;">
	<table class="table table-bordered" style="text-align: center; font-size: 30px;">
		<tr>
			<td class="active"><b>나의 여행후기</b></td>
		</tr>
	</table>
	
	<!-- 목록(카드 디자인) 테스트 -->
	<div style="margin: 0 auto; width: 700px; height: 500px;">
		<div class="card-deck-wrapper" style="margin: 0 auto;">
			<div class="card-deck">
				<c:forEach var="myepiloguelist" items="${myepiloguelist}">
					<div class="card" style="float: left; margin: 30px; padding: 10px; background-color: silver;
							-moz-box-shadow: 30px 3px 5px 5px black; 
					   		-webkit-box-shadow: 3px 3px 85px 5px black; 
					   		box-shadow: 10px 10px 30px 5px black; 
					   		border-top-right-radius: 1em;
					   		border-top-left-radius: 1em;
							border-bottom-right-radius: 1em;
							border-bottom-left-radius: 1em;">
						<img class="card-img-top" src="<%=request.getContextPath()%>/upload/${myepiloguelist.photoname1}" 
							alt="${myepiloguelist.title}" height="100px" width="150px">
						<div class="card-block">
							<h4 class="card-title"><b>${myepiloguelist.title}</b></h4>
							<p class="card-text">
								<small class="text-muted">${myepiloguelist.regdate}</small>
							</p>
							<a href="#" class="btn btn-primary" id="epilogue${myepiloguelist.num}" onclick="myepiloguedetail(${myepiloguelist.num})">상세보기</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<div style="text-align: right">
		<a href="myepilogueinsert.htm">글쓰기</a>
	</div>
	
	<div style="margin: 0 auto; width: 300px;">
		<nav style="text-align: center;">
			<ul class="pagination pagination-sm"">
				<!-- 처음 , 이전 페이지로 이동 -->
				<c:if test="${pg>block}">
					<li><a href="myepiloguelist.htm?pg=1">처음</a></li>
					<li>
						<a href="myepiloguelist.htm?pg=${fromPage-1}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
			    	</li>
		    	</c:if> 
		    	<!-- 각 페이지로 이동 -->
		    	<c:forEach begin="${fromPage}" end="${toPage}" var="i">
		    		<c:if test="${i==pg}"><li class="active"><a>${i}</a></li></c:if>
					<c:if test="${i!=pg}">
						<li><a href="myepiloguelist.htm?pg=${i}">${i}</a></li>
					</c:if>
				</c:forEach> 
				<!-- 마지막 , 다음 페이지로 이동 -->
				<c:if test="${toPage<allPage}">
					<li>
						<a href="myepiloguelist.htm?pg=${toPage+1}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
					<li><a href="myepiloguelist.htm?pg=${allPage}">마지막</a></li>
				</c:if>
			</ul>
		</nav>
	</div>
	
	<%@ include file="myepiloguedetail.jsp" %>
</div>
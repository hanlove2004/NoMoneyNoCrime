<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="searchdivlist" style="width: 730px; margin: auto; background-color: #F3F4F1; overflow: auto; border-radius: 1em;">
   <!-- TITLE 처리하는 부분 -->
   <div id="epiloguetitle"></div>
   
   <!-- 비동기시 path를 못불러오기 때문에 담아놓고 가공하기 위해서.. -->
   <input type="hidden" id="requestgetContextPath" value="<%=request.getContextPath()%>">
   
   <div id="epiloguelist" align="center">
	   <!-- 목록(카드 디자인) 테스트 -->
	   <div style="margin: 0 auto;">
	      <div class="card-deck-wrapper" style="margin: 0 auto;">
	         <div class="card-deck">
	            <div id="searchdiv" style="height: auto;">
	               <!-- 비동기올부분 -->
	            </div>
	         </div>
	      </div>
	   </div>
	</div>
	
	<%-- <div style="margin: 0 auto;">
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

<%@ include file="epiloguedetail.jsp" %>
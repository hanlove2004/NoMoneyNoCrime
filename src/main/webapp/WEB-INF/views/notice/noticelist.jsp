<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<%-- <div style="height: 500px; width: 700px; margin: auto;">
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
		<c:forEach var="noticelist" items="${noticelist}">
			<tr style="height: 30px;">
				<td>${noticelist.num}</td>
				<td>${noticelist.id}</td>
				<td><a href="noticedatail.htm?num=${noticelist.num}">${noticelist.title}</a></td>
				<td>${noticelist.regdate}</td>
			</tr>
		</c:forEach>
	</table>
	<se:authorize ifAnyGranted="ROLE_ADMIN">
		<div style="text-align: right">
			<a href="noticeinsert.htm">글쓰기</a>
		</div>
	</se:authorize>
	<div style="margin: auto;">
		<nav>
			<ul class="pagination">
				<!-- 처음 , 이전 페이지로 이동 -->
				<c:if test="${pg>block}">
					<li><a href="noticelist.htm?pg=1">처음</a></li>
					<li>
						<a href="noticelist.htm?pg=${fromPage-1}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
			    	</li>
		    	</c:if> 
		    	<!-- 각 페이지로 이동 -->
		    	<c:forEach begin="${fromPage}" end="${toPage}" var="i">
					<c:if test="${i==pg}"><li>${i}</li></c:if>
					<c:if test="${i!=pg}">
						<li><a href="noticelist.htm?pg=${i}">${i}</a></li>
					</c:if>
				</c:forEach> 
				<!-- 마지막 , 다음 페이지로 이동 -->
				<c:if test="${toPage<allPage}">
					<li>
						<a href="noticelist.htm?pg=${toPage+1}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
					<li><a href='freelist.htm?pg=${allPage}'>마지막</a></li>
				</c:if>
			</ul>
		</nav>
	</div>
</div> --%>


<%-- <div class="container">
    <div class="noticehead">
       <div class="col col-xs-2">글번호</div>
       <div class="col col-xs-2">작성자</div>
       <div class="col col-xs-6">제목</div>
       <div class="col col-xs-2">작성일</div>
       <div><hr></div>
    </div>
    <c:forEach var="noticelist" items="${noticelist}">
       <div>
          <div class="col col-xs-2">${noticelist.num}</div>
          <div class="col col-xs-2">${noticelist.id}</div>
          <div class="col col-xs-6" id="noticehead${noticelist.num}" onclick="NoticeDetail(${noticelist.num})">
             ${noticelist.title}
          </div>
          <div class="col col-xs-2">${noticelist.regdate}</div>
          <div><hr></div>
       </div>
       <div class="notice" id="noticedetail${noticelist.num}"> <!-- noticedetail, noticedetail2 -->
         <div class="col col-xs-10">${noticelist.content}</div>
         <div class="col-btn col-xs-2">
            <button type="button" class="btn btn-default"><a type="submit" href="#">수정</a></button>&nbsp;&nbsp;
            <button type="button" class="btn btn-danger"><a type="submit" href="#">삭제</a></button>         
         </div>
         <div><hr class="col-xs-11"></div>
      </div>
   </c:forEach>
</div> --%>

<div class="container" id="noticecontainer">
   <div class="noticehead">
      <div class="col col-xs-2">글번호</div>
      <div class="col col-xs-2">작성자</div>
      <div class="col col-xs-6">제목</div>
      <div class="col col-xs-2">작성일</div>
      <div>
         <hr>
      </div>
   </div>
   <c:forEach var="noticelist" items="${noticelist}">
      <div>
         <!-- 글번호/작성자/제목/작성일 -->
         <div>
            <div class="col col-xs-2">${noticelist.num}</div>
            <div class="col col-xs-2">${noticelist.id}</div>
            <div class="col col-xs-6" id="noticehead${noticelist.num}"
               onclick="NoticeDetail(${noticelist.num})">
               ${noticelist.title}</div>
            <div class="col col-xs-2">${noticelist.regdate}</div>
            <div>
               <hr>
            </div>
         </div>
         <!-- detail -->
         <div class="notice" id="noticedetail${noticelist.num}">
         
         </div>
      </div>
   </c:forEach>

<div style="margin: 0 auto; width: 300px;">
      <nav style="text-align: center;">
         <ul class="pagination pagination-sm">
            <!-- 처음 , 이전 페이지로 이동 -->
            <c:if test="${pg>block}">
               <li><a href="noticelist.htm?pg=1">처음</a></li>
               <li>
                  <a href="noticelist.htm?pg=${fromPage-1}" aria-label="Previous">
                     <span aria-hidden="true">&laquo;</span>
                  </a>
                </li>
             </c:if> 
             <!-- 각 페이지로 이동 -->
             <c:forEach begin="${fromPage}" end="${toPage}" var="i">
                <c:if test="${i==pg}"><li class="active"><a>${i}</a></li></c:if>
               <c:if test="${i!=pg}">
                  <li><a href="noticelist.htm?pg=${i}">${i}</a></li>
               </c:if>
            </c:forEach> 
            <!-- 마지막 , 다음 페이지로 이동 -->
            <c:if test="${toPage<allPage}">
               <li>
                  <a href="noticelist.htm?pg=${toPage+1}" aria-label="Next">
                     <span aria-hidden="true">&raquo;</span>
                  </a>
               </li>
               <li><a href='noticelist.htm?pg=${allPage}'>마지막</a></li>
            </c:if>
         </ul>
      </nav>
   </div>
</div>
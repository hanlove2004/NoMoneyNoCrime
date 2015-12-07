<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="button" onclick="workaddlist.htm" value="등록현황" class="btn btn-info">
<input type="button" onclick="workrequestlist.htm" value="신청현황" class="btn btn-info">
<div style="height: 500px; width: 700px; margin: auto;">
   <table class="table table-bordered"
      style="text-align: center; font-size: 30px;">
      <tr>
         <td class="active"><b>내 등록 현황</b></td>
      </tr>
   </table>
   <table class="table table-hover" style="text-align: center;">
      <tr style="height: 30px;" class="success">
         <td>글번호</td>
         <td>제목</td>
         <td>날짜</td>
         <td>상태</td>
         <td>신청</td>
         <td>확정</td>
         <td>취소여부</td>
      </tr>
      <c:forEach var="workaddlist" items="${workaddlist}">
         <tr style="height: 30px;">
            <td>${workaddlist.num}</td>
            <td><a href="workadddatail.htm?num=${workboardlist.num}">${workaddlist.title}</a></td>
            <td>${workaddlist.startdate} ~ ${workaddlist.enddate}</td>
            <td>${workaddlist.state}</td>
            <!-- 확정인원 받아와서 어떻게 할지 결정해야함. 일단 matching된 것에 대한 count를 구해서 여기에 뿌리는 걸로 -->
            <td>${matchingcount}&nbsp;/&nbsp;${workaddlist.needpeople}</td>
            <td><a href="workadddelete.htm">취소</a></td>
         </tr>
      </c:forEach>
   </table>
   <div style="margin: auto;">
      <nav>
         <ul class="pagination">
            <!-- 처음 , 이전 페이지로 이동 -->
            <c:if test="${pg>block}">
               <li><a href="workaddlist.htm?pg=1">처음</a></li>
               <li>
                  <a href="workaddlist.htm?pg=${fromPage-1}" aria-label="Previous">
                     <span aria-hidden="true">&laquo;</span>
                  </a>
                </li>
             </c:if>
             <!-- 각 페이지로 이동 -->
             <c:forEach begin="${fromPage}" end="${toPage}" var="i">
               <c:if test="${i==pg}"><li>${i}</li></c:if>
               <c:if test="${i!=pg}">
                  <li><a href="workaddlist.htm?pg=${i}">${i}</a></li>
               </c:if>
            </c:forEach>
            <!-- 마지막 , 다음 페이지로 이동 -->
            <c:if test="${toPage<allPage}">
               <li>
                  <a href="workaddlist.htm?pg=${toPage+1}" aria-label="Next">
                     <span aria-hidden="true">&raquo;</span>
                  </a>
               </li>
               <li><a href="workaddlist.htm?pg=${allPage}">마지막</a></li>
            </c:if>
         </ul>
      </nav>
   </div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div style="height: 500px; width: 700px; margin: auto;">
      <!-- 비동기시 path를 못불러오기 때문에 담아놓고 가공하기 위해서.. -->
      <input type="hidden" id="requestgetContextPath">
   <!-- 목록(카드 디자인) 테스트 -->
   <div style="margin: 0 auto; width: 700px; height: 500px;">
      <div class="card-deck-wrapper" style="margin: 0 auto;">
         <div class="card-deck">
            <div id="searchdiv">
               <!-- 비동기올부분 -->
            </div>
         </div>
      </div>
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
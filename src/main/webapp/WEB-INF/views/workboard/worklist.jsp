<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style=" width: 700px; margin: auto;">
   <table class="table table-bordered"
      style="text-align: center; font-size: 30px;">
      <tr>
         <td>
         <!-- checkbox -->
         <input type="checkbox" id="sukso"    name="column" value="숙소" >숙소
         <input type="checkbox" id="siksa"    name="column" value="식사" >식사
         <input type="checkbox" id="don"    name="column" value="급여" >급여
         
          &nbsp;
          
          <input type="search" id="searchvalue" name="searchvalue" placeholder="주소 및 제목 검색">
            
            &nbsp;
            
            <button id="search" class="btn btn-danger">
                              검색
            </button>
         </td>
      </tr>
      <tr>
         <td class="active"><b>귀인 만나기</b></td>
      </tr>
   </table>
   <table id="body" class="table table-hover" style="text-align: center;">

      <tr style="height: 30px;" class="success">
         <td>글번호</td>
         <td>작성자</td>
         <td>제목</td>
         <td>보상</td>
         <td>인원</td>
      </tr>

      <c:forEach var="workboardlist" items="${worklist}">
         <tr style="height: 30px;">
            <td>${workboardlist.num}</td>
            <td>${workboardlist.id}</td>
            <td><a href="workdetail.htm?num=${workboardlist.num}">${workboardlist.title}</a></td>
            <td>${workboardlist.compensate}</td>
            <td>${workboardlist.needpeople}</td>
         </tr>
      </c:forEach>

   </table>
   
   <div style="text-align: right">
      <a href="/NoMoneyNoCrime/workboard/workinsert.htm">글쓰기</a>
   </div>
   <div style="margin: auto;">
      <nav>
         <ul class="pagination">
            <!-- 처음 , 이전 페이지로 이동 -->
            <c:if test="${pg>block}">
               <li><a href="worklist.htm?pg=1">처음</a></li>
               <li>
                  <a href="worklist.htm?pg=${fromPage-1}" aria-label="Previous">
                     <span aria-hidden="true">&laquo;</span>
                  </a>
                </li>
             </c:if> 
             <!-- 각 페이지로 이동 -->
             <c:forEach begin="${fromPage}" end="${toPage}" var="i">
               <c:if test="${i==pg}"><li>${i}</li></c:if>
               <c:if test="${i!=pg}">
                  <li><a href="worklist.htm?pg=${i}">${i}</a></li>
               </c:if>
            </c:forEach>
            <!-- 마지막 , 다음 페이지로 이동 -->
            <c:if test="${toPage<allPage}">
               <li>
                  <a href="worklist.htm?pg=${toPage+1}" aria-label="Next">
                     <span aria-hidden="true">&raquo;</span>
                  </a>
               </li>
               <li><a href='worklist.htm?pg=${allPage}'>마지막</a></li>
            </c:if>
         </ul>
      </nav>
   </div>
</div>
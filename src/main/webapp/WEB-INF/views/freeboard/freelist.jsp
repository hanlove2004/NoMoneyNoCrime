<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se"
   uri="http://www.springframework.org/security/tags"%>

<div class="container" id="freecontainer" >
   <table class="table table-bordered"
      style="text-align: center; font-size: 30px; font-family: myfont05; margin-top: 20px;">
      <tr>
         <td class="danger"><b>자유게시판</b></td>
      </tr>
   </table>
   <se:authorize ifNotGranted="ROLE_ADMIN">
      <div align="right" style="width: 97%; height: 30px;">
         <button type="submit" class="btn btn-info btn-sm">
            <a href="noticeinsert.htm">
               <span class="glyphicon glyphicon-pencil"></span> 글쓰기
            </a>
      </div>
   </se:authorize>
   <div class="freehead">
      <div class="col col-xs-2">글번호</div>
      <div class="col col-xs-2">작성자</div>
      <div class="col col-xs-6">제목</div>
      <div class="col col-xs-2">작성일</div>
      <div>
         <hr>
      </div>
   </div>
   <c:forEach var="freelist" items="${freelist}">
      <div>
         <!-- 글번호/작성자/제목/작성일 -->
         <div>
            <div class="col col-xs-2">${freelist.num}</div>
            <div class="col col-xs-2">${freelist.id}</div>
            <div class="col col-xs-6" id="freehead${freelist.num}"
               onclick="FreeDetail(${freelist.num})">
               ${freelist.title}</div>
            <div class="col col-xs-2">${freelist.regdate}</div>
            <div>
               <hr>
            </div>
         </div>
         <!-- detail -->
         <div class="free" id="freedetail${freelist.num}"></div>
      </div>
   </c:forEach>

   <div style="margin: 0 auto; width: 300px;">
      <nav style="text-align: center;">
         <ul class="pagination pagination-sm">
            <!-- 처음 , 이전 페이지로 이동 -->
            <c:if test="${pg>block}">
               <li><a href="freelist.htm?pg=1">처음</a></li>
               <li><a href="freelist.htm?pg=${fromPage-1}"
                  aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
               </a></li>
            </c:if>
            <!-- 각 페이지로 이동 -->
            <c:forEach begin="${fromPage}" end="${toPage}" var="i">
               <c:if test="${i==pg}">
                  <li class="active"><a>${i}</a></li>
               </c:if>
               <c:if test="${i!=pg}">
                  <li><a href="freelist.htm?pg=${i}">${i}</a></li>
               </c:if>
            </c:forEach>
            <!-- 마지막 , 다음 페이지로 이동 -->
            <c:if test="${toPage<allPage}">
               <li><a href="freelist.htm?pg=${toPage+1}" aria-label="Next">
                     <span aria-hidden="true">&raquo;</span>
               </a></li>
               <li><a href='freelist.htm?pg=${allPage}'>마지막</a></li>
            </c:if>
         </ul>
      </nav>
   </div>
</div>
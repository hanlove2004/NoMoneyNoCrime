<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<!-- Modal -->
<div class="modal fade" id="epilogueModal" role="dialog">
   <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content" style="background-color: #D9DED3;">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <input type="hidden" id="modal-num">
            <se:authentication property="name" var="LoingUser" />
               <input type="hidden" id="LoingUser" value="${LoingUser}">
               <input type="hidden" id="path" value="<%=request.getContextPath()%>">
            <h4 class="modal-title" id="modal-title"></h4>
            <span>작성자 : <input type="text" id="modal-writer" readonly></span>
            <span id="modal-edit"></span>
            <span id="modal-delete"></span>            
         </div>
         <div class="modal-body" id="modal-image" style="width: 100%;">
            
         </div>
         <div class="modal-body" id="modal-body">
            <p></p>
         </div>
         <div class="modal-body" id="modal-reply" style="background-color: white;">
            
         </div>
         <!-- 비로그인한 사람들이 보기위해서 삭제했습니다. 
         <div class="modal-body" id="reply-text">
            <textarea rows="4" cols="60" id="replycontent" name="replycontent">댓글쓰기</textarea>
            <button id="replywrite" onclick="replywrite()">확인</button>
         </div> -->
         <div class="modal-footer" id="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
         </div>
      </div>

   </div>
</div>
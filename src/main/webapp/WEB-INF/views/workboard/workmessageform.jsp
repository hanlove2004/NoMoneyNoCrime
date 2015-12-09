<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<!-- 쪽지보내기 Modal -->
  <div class="modal fade" id="messageModal" role="dialog">
    <div class="modal-dialog modal-sm">
    
    <!-- ajax data -->
    <input type="hidden" id="contextpath" value="<%=request.getContextPath()%>">
    <input type="hidden" id="sender" value="${LogingUser}">
    <input type="hidden" id="receiver" value="${workboarddto.id}">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">쪽지 보내기</h4>
        </div>
        <div class="modal-body" style="padding-bottom: 5px;padding-top: 5px;border-bottom: 1px solid #e5e5e5;">
        	<se:authentication property="name" var="LogingUser" />
        	<div style="margin: 3px;">FROM. ${LogingUser}</div>
        	<div style="margin: 3px;text-align: right;">TO.  ${workboarddto.id}</div>
        </div>
        <div class="modal-body">
          <textarea rows="8" cols="35" id="messagecontent"></textarea>
        </div>
        <div class="modal-footer">
          <a onclick="sendMessage()"><button type="button" class="btn btn-default" data-dismiss="modal">Send</button></a>
          <a><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></a>
        </div>
      </div>
      
    </div>
  </div>
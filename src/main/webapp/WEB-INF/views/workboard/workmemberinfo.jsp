<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<!-- 회원정보 Modal -->
  <div class="modal fade" id="memberinfoModal" role="dialog">
    <div class="modal-dialog">
    
    <!-- ajax data -->
    <input type="hidden" id="contextpath" value="<%=request.getContextPath()%>">
    <input type="hidden" id="sender" value="${LogingUser}">
    <input type="hidden" id="receiver" value="${workboarddto.id}">
    
      <!-- Modal content-->
      <div class="modal-content">
		   <div class="well well-lg" align="center" style="margin: auto; width: 100%; background-color: #FFE7EC;">
		       <div class="form-horizontal">
			       <div class="form-group">
			          <label for="m_id" class="col-sm-4 control-label">아이디</label>
			          <label for="m_nick" class="col-sm-5 control-label" id="member_id"></label>
			       </div>
			       
			       <div class="form-group">
			          <label for="m_nick" class="col-sm-4 control-label">이름</label>
			          <label for="m_nick" class="col-sm-5 control-label" id="member_name"></label>
			       </div>
			    
			       <div class="form-group">
			          <label for="sex" class="col-sm-4 control-label">성별</label>
			          <label for="m_nick" class="col-sm-5 control-label" id="member_sex"></label>
			       </div>
			       
			       <div class="form-group">
			          <label for="birth" class="col-sm-4 control-label">생년월일</label>
			          <label for="m_nick" class="col-sm-5 control-label" id="member_birth"></label>
			       </div>
			       
			       <div class="form-group">
			          <label for="email" class="col-sm-4 control-label">이메일</label>
			          <label for="m_nick" class="col-sm-5 control-label" id="member_email"></label>
			       </div>
			       
			       <div class="form-group">
			          <label for="panalty" class="col-sm-4 control-label">벌점</label>
			          <label for="m_nick" class="col-sm-5 control-label" id="member_panalty"></label>
			       </div>
			       
			       <div class="form-group">
			          <label for="panalty" class="col-sm-4 control-label">레퍼런스</label>
			          <label for="m_nick" class="col-sm-5 control-label" id="member_reference">레퍼런스 내용</label>
			       </div>
		       </div>
		   </div>
      </div>
      
    </div>
  </div>
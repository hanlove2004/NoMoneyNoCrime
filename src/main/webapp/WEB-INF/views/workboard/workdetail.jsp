<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<div class="container" style="width: 700px; margin: auto;">
   <table class="table table-bordered"
      style="text-align: center; font-size: 30px;">
      <tr>
         <td class="active"><b>귀인 만나기</b></td>
      </tr>
   </table>
   <c:set var="workboarddto" value="${workboarddto}" />
   <div>
      <!-- <form name="workinsertform" action="workinsert.htm" method="post"> -->
		<table class="table table-striped"
			style="text-align: center; margin-bottom: 0;">
			<tr>
				<td>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>
				<td colspan="2" align="left">${workboarddto.title}</td>
			</tr>
			<tr>
				<td>귀&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인</td>
				<td colspan="2" align="left">${workboarddto.id}
					<input type="hidden" id="writername" value="${workboarddto.id}">
					<se:authentication property="name" var="LogingUser" />
					<c:if test="${workboarddto.id != LogingUser }">
					<!-- dropdown span -->
					<span class="dropdown">
					    <button id="writerdropdown" class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
					    <span class="caret" id="caret"></span></button>
					    <ul class="dropdown-menu">
					      <li><a href="#"  id="memberinfo_btn" data-toggle="modal" 
						data-target="#memberinfoModal" onclick="getMemberInfo('${workboarddto.id}')" >회원정보</a></li>
					      <li><a href="#" id="messagesend_btn" data-toggle="modal" 
						data-target="#messageModal">쪽지보내기</a></li>
					    </ul>
					</span>
					</c:if>
				</td>
			</tr>
			<tr>
				<td>기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;간</td>
				<td colspan="2" align="left">${workboarddto.startdate}
					&nbsp;&nbsp;~&nbsp;&nbsp; ${workboarddto.enddate}</td>
			</tr>
			<tr>
				<td>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</td>
				<td colspan="2" align="left">${workboarddto.addr}</td>
			</tr>
			<tr>
				<td>보&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상</td>
				<td colspan="2" align="left">${workboarddto.compensate}</td>
			</tr>
			<tr>
				<td>구&nbsp;인&nbsp;인&nbsp;원</td>
				<td colspan="2" align="left">${workboarddto.needpeople}</td>
			</tr>
			<tr>
				<td>전&nbsp;화&nbsp;번&nbsp;호</td>
				<td colspan="2" align="left">${workboarddto.phone}</td>
			</tr>
			<tr>
				<td>내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</td>
				<td colspan="2" align="left"><textarea name="content" cols="70"
						rows="16" readonly>${workboarddto.content}</textarea></td>
			</tr>
			<tr>
				<td colspan="3">
					<!-- 작성자 아이디 --> 
					<c:set var="dtoid" value="${workboarddto.id}" />

					<!-- 로그인한 아이디 --> 
					<c:set var="loginid" value="${id}" /> 
					<!-- 로그인한 아이디와 작성자와 같을때 신청버튼 활성화 -->
					<c:if test="${dtoid != loginid}">
						<c:if test="${result == 0}">
							<button type="button" class="btn btn-success" data-toggle="modal"
								data-target="#requestForm">신청
							</button>
	                    	&nbsp;&nbsp;&nbsp;
	                    </c:if>
                    </c:if> <!-- 만약 관리자 일 경우 삭제버튼 활성화 --> 
                    <se:authorize ifAllGranted="ROLE_ADMIN">
						<button type="submit" class="btn btn-danger">
							<a href="workdelete.htm?num=${workboarddto.num}">삭제</a>
						</button>
                     &nbsp;&nbsp;&nbsp;
					</se:authorize> <!-- 로그인한 아이디와 작성자와 같을때 삭제, 수정버튼 활성화 --> 
					<c:if test="${dtoid == loginid}">
						<button type="submit" class="btn btn-danger">
							<a href="workupdate.htm?num=${workboarddto.num}">수정</a>
						</button>
         
                        &nbsp;&nbsp;&nbsp;
         
						<button type="submit" class="btn btn-danger">
							<a href="workdelete.htm?num=${workboarddto.num}">삭제</a>
						</button>

					</c:if> &nbsp;&nbsp;&nbsp;

					<button type="submit" class="btn btn-danger">
						<a href="worklist.htm">목록</a>
					</button>
				</td>
			</tr>
		</table>
	</div>
	
</div>

<!-- 귀인만나기 신청양식 -->
<div class="modal fade" id="requestForm" role="dialog">
   <div class="modal-dialog">
   
      <!-- 귀인만나기 신청양식 입력폼 -->
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">귀인 만나기 신청</h4>
         </div>
         <div class="modal-body">
            <form class="form-horizontal" action="workrequest.htm" method="post">
               <!-- 귀인 ID (readonly) -->
               <div class="form-group form-inline">
                  <label for="owner" class="col-sm-3 control-label">귀인</label>
                  <div class="col-sm-9">
                     <input type="text" class="form-control input-sm" id="owner" name="owner" value="${workboarddto.id}" readonly>
                  </div>
               </div>
               <!-- 신청자 이름 (readonly) -->
               <div class="form-group form-inline">
                  <label for="name" class="col-sm-3 control-label">이름</label>
                  <div class="col-sm-9">
                     <!-- session 에서 값을 받아와서 넣어놓고 readonly로 해야함 -->
                     <input type="text" class="form-control input-sm" id="name" name="name" value="${logininfo.name}" readonly>
                  </div>
               </div>
               <input type="hidden" id="worker" name="worker" value="${id}">
               <input type="hidden" id="num" name="num" value="${workboarddto.num}">
               <!-- 신청자 나이 (readonly) -->
               <div class="form-group form-inline">
                  <label for="age" class="col-sm-3 control-label">나이</label>
                  <div class="col-sm-9">
                     <!-- session 에서 값을 받아와서 넣어놓고 readonly로 해야함 -->
                     <input type="text" class="form-control input-sm" id="age" name="age" value="${logininfo.age}" readonly>
                  </div>
               </div>
               <!-- 자기소개 작성 -->
               <div class="form-group">
                  <label for="introduce" class="col-sm-3 control-label">자기소개</label>
                  <div class="col-sm-9">
                     <textarea id="introduce" name="introduce" cols="50" rows="10"></textarea>
                  </div>
               </div>
               <!-- 신청버튼 -->
               <div class="form-group">
                  <div class="col-sm-12" align="right">
                     <button type="submit" class="btn btn-success">신청하기</button>
                  </div>
               </div>
            </form>
         </div>
      </div>

   </div>
</div>
<!-- 쪽지 form modal include  -->
<%@ include file="workmessageform.jsp" %>
<!-- 회원 정보 modal include -->
<%@ include file="workmemberinfo.jsp" %>


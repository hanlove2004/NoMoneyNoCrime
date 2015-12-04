<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="height: 500px; width: 700px; margin: auto;">
	<table class="table table-bordered"	style="text-align: center; font-size: 30px;">
		<tr>
			<td class="active"><b>회원현황</b></td>
		</tr>
	</table>
	<table class="table table-hover" style="text-align: center;">
		<tr style="height: 30px;" class="success">
			<td>회원번호</td>
			<td>아이디</td>
			<td>이름</td>
			<td>생년월일</td>
			<td>전화번호</td>
			<td>상세보기</td>
		</tr>
		<c:forEach var="memberlist" items="${memberlist}">
			<tr style="height: 30px;">
				<td>${memberlist.num}</td>
				<td>${memberlist.id}</td>
				<td>${memberlist.name}</td>
				<td>${memberlist.birth}</td>
				<td>${memberlist.phone}</td>
				<td>
					<button type="button" class="btn btn-danger" data-toggle="modal" 
						data-target="#memberdetail${memberlist.num}">상세보기</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>

<!-- 회원 상세보기 모달창 -->
<c:forEach var="memberlist" items="${memberlist}">
	<div class="modal fade" id="memberdetail${memberlist.num}" role="dialog">
		<div class="modal-dialog">
	
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">회원상세정보</h4>
				</div>
				<div class="modal-footer">
					<form action="${pageContext.request.contextPath}/admin/deletemember.htm?id=${memberlist.id}" method="post">
						<div class="form-group">
							<label for="m_id" class="col-sm-4 control-label">아이디</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="id" id="id"
									value="${memberlist.id}" readonly="readonly">
							</div>
						</div>
	
						<div class="form-group">
							<label for="m_nick" class="col-sm-4 control-label">이름</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="name" id="name"
									value="${memberlist.name}" readonly="readonly">
							</div>
						</div>
	
						<div class="form-group">
							<label for="phone" class="col-sm-4 control-label">전화번호</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="phone" id="phone"
									value="${memberlist.phone}" readonly="readonly">
							</div>
						</div>
	
						<div class="form-group">
							<label for="sex" class="col-sm-4 control-label">성별</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" name="sex" id="sex"
									value="${memberlist.sex}" readonly="readonly">
							</div>
						</div>
	
						<div class="form-group">
							<label for="birth" class="col-sm-4 control-label">생년월일</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="birth" id="birth"
									value="${memberlist.birth}" readonly="readonly">
							</div>
						</div>
	
						<div class="form-group">
							<label for="email" class="col-sm-4 control-label">이메일</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="email" id="email"
									value="${memberlist.email}" readonly="readonly">
							</div>
						</div>
	
						<div class="form-group">
							<label for="panalty" class="col-sm-4 control-label">벌점현황</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="panalty"
									id="panalty" value="${memberlist.panalty}" readonly="readonly">
							</div>
						</div>
						<hr>
						<div class="form-group">
							<button type="submit" class="btn btn-default">회원강퇴</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
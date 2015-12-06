<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se"
   uri="http://www.springframework.org/security/tags"%>
<div class="container" id="admincontainer">
	<table class="table table-bordered"	style="text-align: center; font-size: 30px; font-family: myfont05; margin-top: 20px;">
		<tr>
			<td class="info"><b>회원현황</b></td>
		</tr>
	</table>
	<table class="table table-hover" style="text-align: center;">
		<tr style="font-size: 15px;" class="success">
			<td>회원번호</td>
			<td>아이디</td>
			<td>이름</td>
			<td>생년월일</td>
			<td>전화번호</td>
			<td>상세보기</td>
		</tr>
		<c:forEach var="memberlist" items="${memberlist}">
			<tr style="font-size: 15px;">
				<td>${memberlist.num}</td>
				<td>${memberlist.id}</td>
				<td>${memberlist.name}</td>
				<td>${memberlist.birth}</td>
				<td>${memberlist.phone}</td>
				<td>
					<button type="button" class="btn btn-warning btn-sm" data-toggle="modal" 
						data-target="#memberdetail${memberlist.num}">상세보기</button>
				</td>
			</tr>
		</c:forEach>
	</table>
	<div style="margin: 0 auto; width: 300px;">
      <nav style="text-align: center;">
         <ul class="pagination pagination-sm">
            <!-- 처음 , 이전 페이지로 이동 -->
            <c:if test="${pg>block}">
               <li><a href="memberlist.htm?pg=1">처음</a></li>
               <li><a href="memberlist.htm?pg=${fromPage-1}"
                  aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
               </a></li>
            </c:if>
            <!-- 각 페이지로 이동 -->
            <c:forEach begin="${fromPage}" end="${toPage}" var="i">
               <c:if test="${i==pg}">
                  <li class="active"><a>${i}</a></li>
               </c:if>
               <c:if test="${i!=pg}">
                  <li><a href="memberlist.htm?pg=${i}">${i}</a></li>
               </c:if>
            </c:forEach>
            <!-- 마지막 , 다음 페이지로 이동 -->
            <c:if test="${toPage<allPage}">
               <li><a href="memberlist.htm?pg=${toPage+1}" aria-label="Next">
                     <span aria-hidden="true">&raquo;</span>
               </a></li>
               <li><a href="memberlist.htm?pg=${allPage}">마지막</a></li>
            </c:if>
         </ul>
      </nav>
   </div>
</div>

<!-- 회원 상세보기 모달창 -->
<c:forEach var="memberlist" items="${memberlist}">
	<div class="modal fade" id="memberdetail${memberlist.num}" role="dialog">
		<div class="modal-dialog" style="width: 400px;">
	
			<!-- Modal content-->
			<div class="modal-content" style="font-family: myfont05;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" style="font-family: myfont05;">[ ${memberlist.name} ] 님 상세정보</h4>
				</div>
				<div class="modal-body" style="height: 330px; font-family: myfont05; font-size: 16px;">
					<form action="${pageContext.request.contextPath}/admin/deletemember.htm?id=${memberlist.id}" method="post">
						<div class="form-group">
							<label for="id" class="col-sm-4 control-label">아이디</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="id" id="id"
									value="${memberlist.id}" readonly="readonly">
							</div>
						</div>
	
						<div class="form-group">
							<label for="name" class="col-sm-4 control-label">이름</label>
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
							<div class="col-sm-8">
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
						
						<div class="form-group">
							<label for="joindate" class="col-sm-4 control-label">가입날짜</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="joindate"
									id="joindate" value="${memberlist.joindate}" readonly="readonly">
							</div>
						</div>
					</form>
				</div>
				<c:if test="${memberlist.id != 'admin'}">
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger">
						<a href="javascript:deleteMember(${memberlist.num})">회원강퇴</a></button>
				</div>
				</c:if>
			</div>
		</div>
	</div>
</c:forEach>
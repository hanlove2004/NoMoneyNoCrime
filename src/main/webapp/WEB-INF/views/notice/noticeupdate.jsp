<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="height: 500px; width: 700px; margin: auto;">
	<table class="table table-bordered"
		style="text-align: center; font-size: 30px;">
		<tr>
			<td class="active"><b>공지사항 수정</b></td>
		</tr>
	</table>
	<div style="height: 390px;">
		<form name="noticeupdateform" action="noticeupdate.htm" method="post">
			<table class="table table-striped" style="text-align: center; margin-bottom: 0;">
				<tr>
					<td>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>
					<td colspan="2" align="left">
						<input type="text" name="title" style="width: 320px;">
					</td>
				</tr>
				<tr>
					<td>내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</td>
					<td colspan="2" style="height: 150px" align="left">
						<textarea name="content" cols="70" rows="16"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<button type="submit" class="btn btn-danger">
							<a href="javascript:noticeupdateform.submit()">수정</a>
						</button>&nbsp;&nbsp;&nbsp;
						<button type="submit" class="btn btn-danger">
							<a href="noticelist.htm">취소</a>
						</button>&nbsp;&nbsp;&nbsp;
						<button type="submit" class="btn btn-danger">
							<a href="noticelist.htm">목록</a>
						</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
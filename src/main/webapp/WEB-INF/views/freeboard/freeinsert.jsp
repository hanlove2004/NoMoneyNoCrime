<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container" id="freecontainer">
	<table class="table table-bordered"
		style="text-align: center; font-size: 30px; font-family: myfont05; margin-top: 20px;">
		<tr>
			<td class="success"><b>자유게시판</b></td>
		</tr>
	</table>
	<div align="center">
		<form name="freeinsertform" action="freeinsert.htm" method="post">
			<table class="table table-striped" style="text-align: center; margin-bottom: 0; font-family: myfont05;">
				<tr>
					<td>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>
					<td colspan="2" align="left">
						<input type="text" name="title" style="width: 514px;">
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
							<a href="javascript:freeinsertform.submit()">작성</a>
						</button>&nbsp;&nbsp;&nbsp;
						<button type="submit" class="btn btn-danger">
							<a href="freelist.htm">취소</a>
						</button>&nbsp;&nbsp;&nbsp;
						<button type="submit" class="btn btn-danger">
							<a href="freelist.htm">목록</a>
						</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
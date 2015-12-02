<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="height: 500px; width: 700px; margin: auto;">
	<table class="table table-bordered"
		style="text-align: center; font-size: 30px;">
		<tr>
			<td class="active"><b>여행후기</b></td>
		</tr>
	</table>
	<div style="height: 390px;">
		<form name="epilogueinsertform" id="epilogueinsertform" 
		action="<%=request.getContextPath() %>/epilogue/epilogueinsert.htm" method="post" enctype="multipart/form-data">
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
						<textarea name="content" cols="70" rows="10"></textarea>
					</td>
				</tr>
				<tr>
					<td>첨부이미지 : </td>
					<td colspan="2"><input type="file" name="files"></td>
				</tr>
				<tr>
					<td></td>
					<td><div id="afile3-list" style="border:2px solid #c9c9c9;min-height:50px"></div></td>
				</tr>
				<tr>
					<td colspan="3">
						<button type="button" class="btn btn-danger"><a href="javascript:epilogueinsertform.submit()">작성</a></button>&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-danger">
							<a href="<%=request.getContextPath() %>/epilogue/epiloguelist.htm?pg=${pg}">취소</a>
						</button>&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-danger">
							<a href="<%=request.getContextPath() %>/epilogue/epiloguelist.htm">목록</a>
						</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
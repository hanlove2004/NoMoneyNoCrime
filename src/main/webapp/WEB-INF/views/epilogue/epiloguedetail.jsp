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
	<c:set var="epilogueboarddto" value="epilogueboarddto" />
	<div style="height: 390px;">
		<table class="table table-striped" style="text-align: center; margin-bottom: 0;">
			<tr>
				<td>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>
				<td colspan="2" align="left">
					${epilogueboarddto.title}
				</td>
			</tr>
			<tr>
				<td>내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</td>
				<td colspan="2" style="height: 150px" align="left">
					<textarea name="content" cols="70" rows="16" readonly>${epilogueboarddto.content}</textarea>
				</td>
			</tr>
			<tr>
				<td>첨부이미지1 : </td>
				<td colspan="2">${epilogueboarddto.filename}</td>
			</tr>
			<tr>
				<td>첨부이미지2 : </td>
				<td colspan="2">${epilogueboarddto.filename2}</td>
			</tr>
			<tr>
				<td>첨부이미지3 : </td>
				<td colspan="2">${epilogueboarddto.filename3}</td>
			</tr>
			<tr>
				<td colspan="3">
					<button type="submit" class="btn btn-danger">
						<a href="epilogueupdate.htm">수정</a>
					</button>&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-danger">
						<a href="epiloguelist.htm">취소</a>
					</button>&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-danger">
						<a href="epiloguelist.htm">목록</a>
					</button>
				</td>
			</tr>
		</table>
	</div>
</div>
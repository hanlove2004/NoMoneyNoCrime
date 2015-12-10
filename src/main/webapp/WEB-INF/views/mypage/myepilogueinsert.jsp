<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 여행후기 작성 모달창 -->
<div class="modal fade" id="insertModal" role="dialog">
   <div class="modal-dialog">
   	  <input type="hidden" id="path" value="<%=request.getContextPath() %>">
      <!-- 여행후기 작성 입력폼 -->
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">여행후기 작성</h4>
         </div>
         <div class="modal-body">
            <form class="form-horizontal" name="epilogueinsertform" id="epilogueinsertform" 
				action="<%=request.getContextPath() %>/mypage/myepilogueinsert.htm" method="post" enctype="multipart/form-data">
               <!-- 여행후기 제목 작성 -->
               <div class="form-group form-inline">
                  <label for="title" class="col-sm-2 control-label">제목</label>
                  <div class="col-sm-10">
                     <input type="text" class="form-control" id="title" name="title" style="width: 80%;">
                  </div>
               </div>
               <!-- 여행후기 내용 작성 -->
               <div class="form-group form-inline">
                  <label for="content" class="col-sm-2 control-label">내용</label>
                  <div class="col-sm-10">
                     <textarea id="content" name="content" cols="60" rows="10"></textarea>
                  </div>
               </div>
               <!-- 여행후기 첨부이미지 작성 (null 값 허용) -->
               <div class="form-group form-inline">
                  <label for="files" class="col-sm-2 control-label">첨부이미지</label>
                  <div class="col-sm-10">
                     <input type="file" id="files" name="files">
                  </div>
               </div>
               <div class="form-group form-inline">
                  <label for="files" class="col-sm-2 control-label"></label>
                  <div class="col-sm-10">
                     <div id="afile3-list" style="border:2px solid #c9c9c9; min-height:50px; width: 95%;"></div>
                  </div>
               </div>
               <!-- 작성 / 닫기 버튼 -->
               <div class="form-group">
                  <div class="col-sm-12" align="center">
                     <button type="submit" class="btn btn-success">작성</button>&nbsp;&nbsp;&nbsp;
                     <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                  </div>
               </div>
            </form>
         </div>
      </div>

   </div>
</div>

<%-- <div style="height: 500px; width: 700px; margin: auto;">
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
</div> --%>
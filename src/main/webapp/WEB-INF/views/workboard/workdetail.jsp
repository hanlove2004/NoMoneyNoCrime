<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="height: 500px; width: 700px; margin: auto;">
   <table class="table table-bordered"
      style="text-align: center; font-size: 30px;">
      <tr>
         <td class="active"><b>귀인 만나기</b></td>
      </tr>
   </table>
   <c:set var="workboarddto" value="${workboarddto}" />
   <div style="height: 390px;">
      <!-- <form name="workinsertform" action="workinsert.htm" method="post"> -->
         <table class="table table-striped" style="text-align: center; margin-bottom: 0;">
            <tr>
               <td>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>
               <td colspan="2" align="left">
                  ${workboarddto.title}
               </td>
            </tr>
            <tr>
               <td>기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;간</td>
               <td colspan="2" align="left">
                  ${workboarddto.startdate}
                  &nbsp;&nbsp;~&nbsp;&nbsp;
                  ${workboarddto.enddate}
               </td>
            </tr>
            <tr>
               <td>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</td>
               <td colspan="2" align="left">
                  ${workboarddto.addr}
               </td>
            </tr>
            <tr>
               <td>보&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상</td>
               <td colspan="2" style="height: 150px" align="left">
                  ${workboarddto.compensate}
               </td>
            </tr>
            <tr>
               <td>구&nbsp;인&nbsp;인&nbsp;원</td>
               <td colspan="2" style="height: 150px" align="left">
                  ${workboarddto.needpeople}
               </td>
            </tr>
            <tr>
               <td>전&nbsp;화&nbsp;번&nbsp;호</td>
               <td colspan="2" style="height: 150px" align="left">
                  ${workboarddto.phone}
               </td>
            </tr>
            <tr>
               <td>내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</td>
               <td colspan="2" style="height: 150px" align="left">
                  ${workboarddto.content}
               </td>
            </tr>
            <tr>
               <td colspan="3">
                  <button type="button" class="btn btn-success" data-toggle="modal" data-target="#requestForm">
                     <a href="#">신청</a>
                  </button>
                  &nbsp;&nbsp;&nbsp;
                  <button type="submit" class="btn btn-danger">
                     <a href="workupdate.htm?num=${workboarddto.num}">수정하기</a>
                  </button>
                  &nbsp;&nbsp;&nbsp;
                  <button type="submit" class="btn btn-danger">
                     <a href="workdelete.htm?num=${workboarddto.num}">삭제하기</a>
                  </button>
                  &nbsp;&nbsp;&nbsp;
                  <button type="submit" class="btn btn-danger">
                     <a href="worklist.htm">목록</a>
                  </button>
               </td>
            </tr>
         </table>
     <!--  </form> -->
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
         <div class="modal-footer">
            <form action="workrequest.htm" method="post">
               <!-- 귀인 ID (readonly) -->
               <div class="form-group form-inline">
                  <label for="owner" class="col-sm-3 control-label">귀인</label>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="owner" name="owner" value="${workboarddto.id}" readonly>
                  </div>
               </div>
               <!-- 신청자 이름 (readonly) -->
               <div class="form-group form-inline">
                  <label for="name" class="col-sm-3 control-label">이름</label>
                  <div class="col-sm-8">
                     <!-- session 에서 값을 받아와서 넣어놓고 readonly로 해야함 -->
                     <input type="text" class="form-control" id="name" name="name" placeholder="이름">
                  </div>
               </div>
               <!-- 신청자 나이 (readonly) -->
               <div class="form-group form-inline">
                  <label for="age" class="col-sm-3 control-label">나이</label>
                  <div class="col-sm-8">
                     <!-- session 에서 값을 받아와서 넣어놓고 readonly로 해야함 -->
                     <input type="text" class="form-control" id="age" name="age" placeholder="나이">
                  </div>
               </div>
               <!-- 신청인원?? -->
               
               <!-- 자기소개 작성 -->
               <div class="form-group form-inline">
                  <label for="introduce" class="col-sm-3 control-label">자기소개</label>
                  <div class="col-sm-8">
                     <textarea id="introduce" name="introduce" cols="50" rows="10"></textarea>
                  </div>
               </div>
               
               <button type="submit" class="btn btn-success">신청하기</button>
            </form>
         </div>

         <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">창닫기</button>
         </div>
      </div>

   </div>
</div>
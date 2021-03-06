<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container" style="width: 700px; margin: auto;">
   <table class="table table-bordered"
      style="text-align: center; font-size: 30px;">
      <tr>
         <td class="active"><b>귀인 만나기</b></td>
      </tr>
   </table>
   
   <div>
      <form name="workinsertform" action="workinsert.htm" method="post">
         <table class="table table-striped" style="text-align: center; margin-bottom: 0;">
            <tr>
               <td>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>
               <td colspan="2" align="left">
                  <input type="text" name="title" style="width: 320px;">
               </td>
            </tr>
            <tr>
               <td>기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;간</td>
               <td colspan="2" align="left">
                  <input type="date" name="startdate" id="startdate">
                  &nbsp;&nbsp;~&nbsp;&nbsp;
                  <input type="date" name="enddate" id="enddate">
               </td>
            </tr>
            <tr>
               <td>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</td>
               <td colspan="2" align="left">
                  <input type="hidden" name="add_code" id="add_code" required readonly="readonly"/>
                  <input type="text" name="addr" id="addr" style="width: 400px;">
                  <input type="button" onclick="execDaumPostcode()" value="주소 찾기">
               </td>
            </tr>
            <tr>
               <td>보&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상</td>
               <td colspan="2" align="left">
                  <input type="checkbox" name="compensate" value="급여"> 급여
                  <input type="checkbox" name="compensate" value="숙소"> 숙소
                  <input type="checkbox" name="compensate" value="식사"> 식사
               </td>
            </tr>
            <tr>
               <td>구&nbsp;인&nbsp;인&nbsp;원</td>
               <td colspan="2" align="left">
                  <input type="text" name="needpeople" style="width: 320px;">
               </td>
            </tr>
            <tr>
               <td>전&nbsp;화&nbsp;번&nbsp;호</td>
               <td colspan="2" align="left">
                  <input type="text" name="phone" style="width: 320px;">
               </td>
            </tr>
            <tr>
               <td>내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</td>
               <td colspan="2" align="left">
                  <textarea name="content" cols="70" rows="16"></textarea>
               </td>
            </tr>
            <tr>
               <td colspan="3">
                  <button type="submit" class="btn btn-danger">
                     <a href="javascript:workinsertform.submit()">작성</a>
                  </button>&nbsp;&nbsp;&nbsp;
                  <button type="submit" class="btn btn-danger">
                     <a href="worklist.htm">취소</a>
                  </button>&nbsp;&nbsp;&nbsp;
                  <button type="submit" class="btn btn-danger">
                     <a href="worklist.htm">목록</a>
                  </button>
               </td>
            </tr>
         </table>
      </form>
   </div>
</div>
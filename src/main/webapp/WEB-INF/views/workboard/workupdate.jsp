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
      <form name="workupdateform" action="workupdate.htm?num=${workboarddto.num}" method="post">
         <table class="table table-striped" style="text-align: center; margin-bottom: 0;">
            <tr>
               <td>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>
               <td colspan="2" align="left">
                  <input type="hidden" name="num" id="num" style="width: 320px;" placeholder="${num}">
                  <input type="text" name="title" id="title" style="width: 320px;" value="${workboarddto.title}">
               </td>
            </tr>
            <tr>
               <td>기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;간</td>
               <td colspan="2" align="left">
                  <input type="date" name="startdate" id="startdate" value="${workboarddto.startdate}">
                  &nbsp;&nbsp;~&nbsp;&nbsp;
                  <input type="date" name="enddate" id="enddate" value="${workboarddto.enddate}">
               </td>
            </tr>
            <tr>
               <td>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</td>
               <td colspan="2" align="left">
                  <input type="text" id="addr" name="addr" style="width: 320px;" value="${workboarddto.addr}">
               </td>
            </tr>
            <tr>
               <td>보&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상</td>
               <td colspan="2" style="height: 150px" align="left">
                  <input type="checkbox" name="compensate" value="급여"> 급여
                  <input type="checkbox" name="compensate" value="숙소"> 숙소
                  <input type="checkbox" name="compensate" value="식사"> 식사
               </td>
            </tr>
            <tr>
               <td>구&nbsp;인&nbsp;인&nbsp;원</td>
               <td colspan="2" style="height: 150px" align="left">
                  <input type="text" id="needpeople" name="needpeople" style="width: 320px;" value="${workboarddto.needpeople}">
               </td>
            </tr>
            <tr>
               <td>전&nbsp;화&nbsp;번&nbsp;호</td>
               <td colspan="2" style="height: 150px" align="left">
                  <input type="text" id ="phone" name="phone" style="width: 320px;" value="${workboarddto.phone}">
               </td>
            </tr>
            <tr>
               <td>내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</td>
               <td colspan="2" style="height: 150px" align="left">
                  <textarea name="content" cols="70" rows="16">${workboarddto.content}</textarea>
               </td>
            </tr>
            <tr>
               <td colspan="3">
                  <button type="submit" class="btn btn-danger">
                     <a href="javascript:workupdateform.submit()">수정완료</a>
                  </button>
                  
                  &nbsp;&nbsp;&nbsp;
                  
                  <button type="submit" class="btn btn-danger">
                     <a href="worklist.htm">취소</a>
                  </button>
                  
                  &nbsp;&nbsp;&nbsp;
                  
                  <button type="submit" class="btn btn-danger">
                     <a href="worklist.htm">목록</a>
                  </button>
               </td>
            </tr>
         </table>
      </form>
   </div>
</div>
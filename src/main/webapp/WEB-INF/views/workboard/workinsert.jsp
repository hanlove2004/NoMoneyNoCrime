<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("add_code").value = data.postcode1+'-'+data.postcode2;
            //document.getElementById("postcode2").value = data.postcode2;
            document.getElementById("addr").value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr").focus();
        }
    }).open();
}
</script>
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
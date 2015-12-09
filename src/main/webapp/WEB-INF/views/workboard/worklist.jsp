<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container" id="workcontainer" style="background-color: #fff;
												border-radius: 0.5em;
												width: 700px;
												margin-top: 30px;
												margin-bottom: 30px;
												font-family: myfont05;
												text-align: center;">
	<table class="table table-bordered"
		style="text-align: center;">
		<tr>
			<td style="font-size: 18px; width: 300px">
				<!-- checkbox -->
				<input type="checkbox" id="sukso" name="column"	value="숙소"> 숙소  &nbsp;
				<input type="checkbox" id="siksa" name="column" value="식사"> 식사  &nbsp;
				<input type="checkbox" id="don"	name="column" value="급여"> 급여 &nbsp;
			</td>
			<td style="font-size: 18px; width: 400px"> 
				<input type="search" id="searchvalue" name="searchvalue" style="width: 300px;" placeholder="주소/제목/내용 검색">&nbsp;&nbsp;
				<button id="search" class="btn btn-danger btn-sm">검색</button>
			</td>
		</tr>
		<tr style="font-size: 30px;">
			<td class="info" colspan="2"><b>귀인 만나기</b></td>
		</tr>
	</table>

	<div id="work-list">
	<div class="work-list-box swiper-container" id="work-slide">
      <div class='row work-list swiper-wrapper clear-wrap'>
         <c:forEach var="workboardlist2" items="${worklist}">
	         <div class='col col-xs-4 work-card'>
	            <a href="workdetail.htm?num=${workboardlist2.num}"> 
	               <span class='work-thumb'> 
	                  <img alt='' class='img' src='<%=request.getContextPath()%>/images/${workboardlist2.compensate}.jpg'>
	                     <span class='work-name'>${workboardlist2.addr}</span>
	                  </img>
	               </span> 
	               <span class='work-content'>
	                  <span class='profile-img'>
	                     <img alt='' class='img-wrap'
	                        src='<%=request.getContextPath()%>/images/${workboardlist2.sex}.JPG'
	                        style='width: 52px; height: 52px;'> 
	                        <span class='profile-name'>${workboardlist2.id}</span>
	                     </img>
	                  </span>
	                  <span class='text'>${workboardlist2.title}</span>
	                  <span class="howmany" style="text-align: center">
	                  ${workboardlist2.startdate} ~ ${workboardlist2.enddate}
	                  <br>
	                  <b>신청 현황 : ${workboardlist2.regpeople} / ${workboardlist2.needpeople} 명</b>
	                  </span>
	               </span>
	               <span class='work-info'> 
	                  <span class='text'>
	                     	${workboardlist2.compensate}
	                  </span> 
	               </span>
	               <span class="over ani"></span>
	            </a>
	         </div>
         </c:forEach>
      </div>
   </div>
   </div>
   
   <input type="hidden" id="path" value="<%=request.getContextPath()%>">
   
   <div style="text-align: right">
      <a href="workinsert.htm" class="btn btn-success">글쓰기</a>
   </div>
   <div style="margin: auto;">
      <nav>
         <ul class="pagination">
            <!-- 처음 , 이전 페이지로 이동 -->
            <c:if test="${pg>block}">
               <li><a href="worklist.htm?pg=1">처음</a></li>
               <li>
                  <a href="worklist.htm?pg=${fromPage-1}" aria-label="Previous">
                     <span aria-hidden="true">&laquo;</span>
                  </a>
                </li>
             </c:if> 
             <!-- 각 페이지로 이동 -->
             <c:forEach begin="${fromPage}" end="${toPage}" var="i">
               <c:if test="${i==pg}"><li>${i}</li></c:if>
               <c:if test="${i!=pg}">
                  <li><a href="worklist.htm?pg=${i}">${i}</a></li>
               </c:if>
            </c:forEach>
            <!-- 마지막 , 다음 페이지로 이동 -->
            <c:if test="${toPage<allPage}">
               <li>
                  <a href="worklist.htm?pg=${toPage+1}" aria-label="Next">
                     <span aria-hidden="true">&raquo;</span>
                  </a>
               </li>
               <li><a href='worklist.htm?pg=${allPage}'>마지막</a></li>
            </c:if>
         </ul>
      </nav>
   </div>
</div>
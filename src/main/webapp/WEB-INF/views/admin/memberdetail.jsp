<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<input type="hidden" id="path" value="<%=request.getContextPath()%>">

<!-- 회원 상세보기 모달창 -->
<div class="modal fade" id="memberModal" role="dialog">
	<div class="modal-dialog" style="width: 400px;">

		<!-- Modal content-->
		<div class="modal-content" style="font-family: myfont05;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" id="modal-title" style="font-family: myfont05;"></h4>
			</div>
			<div class="modal-body" id="modal-body" style="height: 330px; font-family: myfont05; font-size: 16px;">
			</div>
			<div class="modal-footer" id="modal-footer">
			</div>
		</div>
	</div>
</div>


<script>
function memberdetail(num){
	$.ajax({
		type: "POST",
		url: "memberdetail.htm",
		cache: false,
		data: "num=" + num,
		success: function(data){

			var print = "";

			$("#modal-title").empty();
			$("#modal-body").empty();
			$("#modal-footer").empty();
			
			$("#modal-title").html("[ " + data.memberdto.name + " ] 님 상세정보");
			
			print += "<form action=\"" + $("#path") + "/admin/deletemember.htm?id=" + data.memberdto.id + "\" method=\"post\">";
			print += "<div class=\"form-group\">";
			print += "<label for=\"id\" class=\"col-sm-4 control-label\">아이디</label>";
			print += "<div class=\"col-sm-8\">";
			print += "<input type=\"text\" class=\"form-control\" name=\"id\" id=\"id\"";
			print += "value=\"" + data.memberdto.id + "\" readonly=\"readonly\">";
			print += "</div></div>";

			print += "<div class=\"form-group\">";
			print += "<label for=\"name\" class=\"col-sm-4 control-label\">이름</label>";
			print += "<div class=\"col-sm-8\">";
			print += "<input type=\"text\" class=\"form-control\" name=\"name\" id=\"name\"";
			print += "value=\"" + data.memberdto.name + "\" readonly=\"readonly\">";
			print += "</div></div>";

			print += "<div class=\"form-group\">";
			print += "<label for=\"phone\" class=\"col-sm-4 control-label\">전화번호</label>";
			print += "<div class=\"col-sm-8\">";
			print += "<input type=\"text\" class=\"form-control\" name=\"phone\" id=\"phone\"";
			print += "value=\"" + data.memberdto.phone + "\" readonly=\"readonly\">";
			print += "</div></div>";

			print += "<div class=\"form-group\">";
			print += "<label for=\"sex\" class=\"col-sm-4 control-label\">성별</label>";
			print += "<div class=\"col-sm-8\">";
			print += "<input type=\"text\" class=\"form-control\" name=\"sex\" id=\"sex\"";
			print += "value=\"" + data.memberdto.sex + "\" readonly=\"readonly\">";
			print += "</div></div>";

			print += "<div class=\"form-group\">";
			print += "<label for=\"birth\" class=\"col-sm-4 control-label\">생년월일</label>";
			print += "<div class=\"col-sm-8\">";
			print += "<input type=\"text\" class=\"form-control\" name=\"birth\" id=\"birth\"";
			print += "value=\"" + data.memberdto.birth + "\" readonly=\"readonly\">";
			print += "</div></div>";

			print += "<div class=\"form-group\">";
			print += "<label for=\"email\" class=\"col-sm-4 control-label\">이메일</label>";
			print += "<div class=\"col-sm-8\">";
			print += "<input type=\"text\" class=\"form-control\" name=\"email\" id=\"email\"";
			print += "value=\"" + data.memberdto.email + "\" readonly=\"readonly\">";
			print += "</div></div>";

			print += "<div class=\"form-group\">";
			print += "<label for=\"panalty\" class=\"col-sm-4 control-label\">벌점현황</label>";
			print += "<div class=\"col-sm-8\">";
			print += "<input type=\"text\" class=\"form-control\" name=\"panalty\" id=\"panalty\"";
			print += "value=\"" + data.memberdto.panalty + "\" readonly=\"readonly\">";
			print += "</div></div>";

			print += "<div class=\"form-group\">";
			print += "<label for=\"joindate\" class=\"col-sm-4 control-label\">아이디</label>";
			print += "<div class=\"col-sm-8\">";
			print += "<input type=\"text\" class=\"form-control\" name=\"joindate\" id=\"joindate\"";
			print += "value=\"" + data.memberdto.joindate + "\" readonly=\"readonly\">";
			print += "</div></div></form>";

			$("#modal-body").html(print);

			if(data.memberdto.id != "admin"){
				$("#modal-footer").html(
					"<button type=\"submit\" class=\"btn btn-danger\">"
					+ "<a href=\"javascript:deleteMember(" + num + ")\">회원강퇴</a></button>"
				);
			};
		}
	});
}
	
</script>
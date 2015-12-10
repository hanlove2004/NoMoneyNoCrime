<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<script type="text/javascript">

	//setSenderReceiver()
	function setSenderReceiver(){
		var to = $('#message_to').val();
		$('#to').html("TO. " + to);
		$('#receiver').val(to);
	}//setSenderReceiver() end

	//setReceiver()
	function setReceiver(){
		$('#to').html("TO. <input type='text' id='to1'>");
	}//setReceiver() end
	
	//sendmessage()
	function sendMessage() {
		
		var to1 = $('#to1').val();
		if(to1 != null){
			$('#receiver').val(to1);	
		}
		var sender = $('#sender').val();
		var receiver = $('#receiver').val();
		var content = $('#messagecontent').val();
		var contextpath = $('#contextpath').val();
		console.log(sender);
		// 받는사람 입력 체크
		if(receiver == ""){
			alert("받는사람 아이디를 입력해주세요");	
			$('#to1').focus();
			return false;
		}
		if(content == ""){
			alert("내용을 입력해주세요");	
			$('#messagecontent').focus();
			return false;
		}
		$.ajax({
			type : "post",
			url : contextpath + "/sendmessage.htm",
			data : "sender=" + sender + "&receiver=" + receiver + "&content="
					+ content,
			success : function(data) { //callback
				if (data != null) {
					alert(data.resultmessage);
					$('#messagecontent').val("");
					$('#messageModal').modal('hide');
					location.reload(true);
				}
			}// success : function(data)
		});//$.ajax
	}//function sendMessage() end
	
	// 쪽지 삭제 모달창에 글번호 set
	function setMessageNum(){
		var messagenum = $("#messagenum").val();
		console.log(messagenum);
		$("#numfordelete").val(messagenum);
	}
	
	// 쪽지 삭제
	function deleteMessage(){
		var num = $("#numfordelete").val();
		var listname = $("#listname").val();
		var contextpath = $('#contextpath').val();
		console.log(num);
		console.log(listname);
		console.log(contextpath);
		$.ajax({
			type : "post",
			url : contextpath + "/deletemessage.htm",
			data : "num=" + num + "&listname=" + listname ,
			success : function(data) { //callback
				if (data != null) {
					alert(data.resultmessage);
					location.reload(true);
				}
			}// success : function(data)
		});//$.ajax
	}

</script>

<!-- 쪽지보내기 Modal -->
  <div class="modal fade" id="messageModal" role="dialog">
    <div class="modal-dialog modal-sm">
    
    <!-- ajax data -->
    <se:authentication property="name" var="LogingUser" />
    <input type="hidden" id="contextpath" value="<%=request.getContextPath()%>">
    <input type="hidden" id="sender" value="${LogingUser}">
    <input type="hidden" id="receiver">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">쪽지 보내기</h4>
        </div>
        <div class="modal-body" style="padding-bottom: 5px;padding-top: 5px;border-bottom: 1px solid #e5e5e5;">
        	<div style="margin: 3px;" id="from">FROM. ${LogingUser}</div>
        	<div style="margin: 3px;text-align: right;" id="to"></div>
        </div>
        <div class="modal-body">
          <textarea rows="8" cols="35" id="messagecontent"></textarea>
        </div>
        <div class="modal-footer">
          <a onclick="sendMessage()"><button type="button" class="btn btn-default">Send</button></a>
          <a><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></a>
        </div>
      </div>
      
    </div>
  </div>
  
  <!-- 쪽지 삭제 Modal -->
  <div class="modal fade" id="messagedeleteModal" role="dialog">
    <div class="modal-dialog modal-sm">    
      
      <!-- 쪽지번호 -->
      <input type="hidden" id="numfordelete">
      
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">쪽지를 삭제하시겠습니까?</h4>
        </div>
        <div class="modal-footer">
          <a onclick="deleteMessage()"><button type="button" class="btn btn-default" data-dismiss="modal">delete</button></a>
          <a><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></a>
        </div>
      </div>
    </div>
  </div>
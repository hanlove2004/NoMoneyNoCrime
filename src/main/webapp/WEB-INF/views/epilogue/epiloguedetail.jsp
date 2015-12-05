<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Modal -->
<div class="modal fade" id="epilogueModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<input type="hidden" id="modal-num">
				<input type="hidden" id="path" value="<%=request.getContextPath()%>">
				<h4 class="modal-title" id="modal-title"></h4>
			</div>
			<div class="modal-body" id="modal-image">
				
			</div>
			<div class="modal-body" id="modal-body">
				<p></p>
			</div>
			<div class="modal-body" id="modal-reply">
				
			</div>
			<div class="modal-body" id="reply-text">
				<textarea rows="4" cols="60" id="replycontent" name="replycontent">댓글쓰기</textarea>
				<button id="replywrite" onclick="replywrite()">확인</button>
			</div>
			<div class="modal-footer" id="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>

<script type="text/javascript">

		// 여행후기 상세보기
		function epiloguedetail(num){			
			$.ajax({
				type: "post",
				url: "epiloguedetail.htm",
				cache: false,				
				data:'num=' + num,
			    success:function(data){
			    	console.log(data.epilogueboarddto.title);
			    	$("#modal-num").val(data.epilogueboarddto.num);
			    	$("#modal-image").empty();
			    	$("#modal-image").html("<img src=' " + $("#path").val()  + "/upload/" + data.epilogueboarddto.photoname1 +" ' >");		    	
			        $("#modal-title").empty();
			        $("#modal-title").html(data.epilogueboarddto.title);
			        $("#modal-body").empty();
			        $("#modal-body").html(data.epilogueboarddto.content);
			     },
				error: function(){						
					alert('Error while request..'	);
				}
			});
			
			$.ajax({
				type: "post",
				url: "epiloguereplydetail.htm",
				cache: false,				
				data:'num=' + num,
			    success:function(data){
			    	$("#modal-reply").empty();
			    	$("#modal-reply").append("<div>댓      글</div>");
			    	/* $("#modal-reply").html("<hr><div>" + data.reply_epiloguelist[0].id + "<div>");
			        $("#modal-reply").html("<div>" + data.reply_epiloguelist[0].content + "<div>"); */
			        $.each(data.reply_epiloguelist,function(index,value){
			        	console.log(value.content);
				          $("#modal-reply").append("<div>" + value.id+" : "+value.content + " " + "</div><br>");
				    });
			     },
				error: function(){						
					alert('Error while request..'	);
				}
			});
			
			$("#epilogueModal").modal();
			
		}
		
		//여행 후기 댓글 쓰기 ajax
		function replywrite(){
			var num = $("#modal-num").val();
			var replycontent = $('#replycontent').val();
			console.log(num);
			console.log(replycontent);
			$.ajax({
				type: "post",
				url: "reply_epiloguewrite.htm",
				cache: false,				
				data:'num=' + num + "&replycontent=" + replycontent,
			    success:function(data){
			    	console.log(data.reply_epiloguedto);
			    	$('#replycontent').val('').empty();
			    	$("#modal-reply").append("<div>" +data.reply_epiloguedto.id +" : "+data.reply_epiloguedto.content + " " + "</div><br>");
			     },
				error: function(){						
					alert('Error while request..'	);
				}
			});
		}
</script>
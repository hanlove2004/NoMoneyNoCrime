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
			    	var arr = [];
			    	arr.push(data.epilogueboarddto.photoname1);
			    	arr.push(data.epilogueboarddto.photoname2);
			    	arr.push(data.epilogueboarddto.photoname3);
			    	
			    	$("#modal-num").val(data.epilogueboarddto.num);
			    	
			    	$("#modal-image").empty();
			    	for(var i = 0 ; i < arr.length ; i++){
			    		if(arr[i] != null){
			    			$("#modal-image").append("<img style='width:300px;height:300px;' src=' " + $("#path").val()  + "/upload/" + arr[i] +" ' >");
			    		}
			    	}
			    	
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
			        $.each(data.reply_epiloguelist,function(index,value){
			        	if(value.id != data.userid){
			        		$("#modal-reply").append("<div>"
			        											+ "<span id='reply_id"+ value.num +"'>" + value.id+"</span>:"
			        											+ "<span id='reply_content"+ value.num +"'>"+value.content + "</span>"
			        											+ "</div><br>");
			        	}else{
			        		$("#modal-reply").append("<div id=reply"+ value.num +" >" 
			        											+ "<span id='reply_id"+ value.num +"'>" + value.id+"</span>:"
			        											+ "<span id='reply_content"+ value.num +"'>"+value.content + "</span>"
			        											+ "|<span><a onclick='replyeditform("+ value.num +")'>수정</a></span>"
			        											+ "|<span><a onclick='replydelete("+ value.num +")'>삭제</a></span>"
			        											+ "</div><br>"
			        											);
			        	}
				          
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
			    	$("#modal-reply").append("<div id=reply"+ data.reply_epiloguedto.num +">"
			    										+ "<span id='reply_id"+ data.reply_epiloguedto.num +"'>" +data.reply_epiloguedto.id +"</span>:"
			    										+ "<span id='reply_content"+ data.reply_epiloguedto.num +"'> : "+ data.reply_epiloguedto.content + "</span>"
			    										+ "|<span><a onclick='replyeditform("+ data.reply_epiloguedto.num +")'>수정</a></span>"
			    										+ "|<span><a onclick='replydelete("+ data.reply_epiloguedto.num +")'>삭제</a></span>"
			    										+"</div><br>"
			    										);
			     },
				error: function(){						
					alert('Error while request..'	);
				}
			});
			
		}
		
		// 댓글 삭제
		function replydelete(num){
			$.ajax({
				type: "post",
				url: "reply_epiloguedelete.htm",
				cache: false,				
				data:'num=' + num ,
			    success:function(data){
			    	console.log(data.result);
			    	$('#reply' + num).detach();
			     },
				error: function(){						
					alert('Error while request..'	);
				}
			});
		}
		
		// 댓글 수정 폼
		function replyeditform(num){
			console.log(num);
			var html = $('#reply' + num).html();
			var id = $('#reply_id' + num).text();
			var content = $('#reply_content' + num).text();
			console.log(id);
			console.log(content);
			console.log(html);
			$('#reply' + num).empty().append("<div>" 
															+ "<span id='editid'>" + id + "</span>:" 
															+ "<textarea id='editcontent'>" + content + "</textarea>"
															+ "<span>" 
																+ "<input type='button' value='확인' onclick=''>"
																+ "<input type='button' value='취소' onclick='replyeditcancel(" + num + ")'>"
															+ "</span>"
															+ "</div>"
														  );
		}
		
		// 댓글 수정 취소
		function replyeditcancel(num){
			var id = $('#editid').text();
			var content = $('#editcontent').text();
			$('#reply' + num).empty().append(
														"<div id=reply"+ num +">"
														+ "<span id='reply_id"+ num +"'>" +id +"</span>:"
														+ "<span id='reply_content"+ num +"'>"+ content + "</span>"
														+ "|<span><a onclick='replyeditform("+ num +")'>수정</a></span>"
														+ "|<span><a onclick='replydelete("+ num +")'>삭제</a></span>"
														+"</div><br>"
														  );
		}
		
</script>
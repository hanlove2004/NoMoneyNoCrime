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
				<h4 class="modal-title" id="modal-title">Modal Header</h4>
			</div>
			<div class="modal-body" id="modal-body">
				<p>modal-body</p>
			</div>
			<div class="modal-footer" id="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>

<script type="text/javascript">
		function epiloguedetail(num){			
			$.ajax({
				type: "post",
				url: "epiloguedetail.htm",
				cache: false,				
				data:'num=' + num,
			    success:function(data){
			    	console.log(data);
			        $("#modal-title").empty();
			     },
				error: function(){						
					alert('Error while request..'	);
				}
			});
			
			$("#epilogueModal").modal();
			
		}
</script>
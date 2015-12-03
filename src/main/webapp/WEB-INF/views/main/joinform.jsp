<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
		var parameter = window.location.search.split('=')[1];
		/* 유효성검사 */
		function checkfield() {
			if (document.joinForm.user_id.value == "") { //id값이 없을 경우
				alert("아이디를 입력하세요"); //메세지 경고창을 띄운 후
				document.joinForm.user_id.focus(); // id 텍스트박스에 커서를 위치
				exit;

			} else if (document.joinForm.user_name.value == "") {
				alert("이름을 입력하세요");
				document.joinForm.user_name.focus();
				exit;

			} else if (document.joinForm.password.value == "") {
				alert("비밀번호를 입력하세요");
				document.joinForm.password.focus();
				exit;

			} else if (document.joinForm.password2.value == "") {
				alert("비밀번호확인을 입력하세요");
				document.joinForm.password2.focus();
				exit;

			} else if (document.joinForm.email.value == "") {
				alert("E-Mail를 입력하세요");
				document.joinForm.email.focus();
				exit;

			} else if (document.joinForm.addr.value == "") {
				alert("지역주소를 입력하세요");
				document.joinForm.addr.focus();
				exit;

			} else if (document.joinForm.addd.value == "") {
				alert("세부주소를 입력하세요");
				document.joinForm.addd.focus();
				exit;

			} else if (document.joinForm.cell_phone.value == "") {
				alert("전화번호를 입력하세요");
				document.joinForm.cell_phone.focus();
				exit;

			} else if (document.joinForm.add_code.value == "") {
				alert("우편번호를 입력하세요");
				document.joinForm.add_code.focus();
				exit;

			}
			
			if(parameter=='ROLE_SELLER'){
				if (document.joinForm.farminfo.value == "") {
					alert("농장 이름을 입력하세요"); 
					document.joinForm.farminfo.focus(); 
					exit;
				} else if (document.joinForm.farm_add.value == "") {
					alert("농장 주소를 입력하세요"); 
					document.joinForm.farm_add.focus(); 
					exit;
				} else if (document.joinForm.farm_add_de.value == "") {
					alert("농장 세부 주소를 입력하세요"); 
					document.joinForm.farm_add_de.focus(); 
					exit;
				} else if (document.joinForm.pro_name.value == "") {
					alert("농장 주요 작물을 입력하세요"); 
					document.joinForm.pro_name.focus(); 
					exit;
				} else if (document.joinForm.farm_phon.value == "") {
					alert("농장 전화번호를 입력하세요"); 
					document.joinForm.farm_phon.focus(); 
					exit;
				} else if (document.joinForm.farm_comment.text == "") {
					alert("농장 소개를 입력하세요"); 
					document.joinForm.farm_comment.focus(); 
					exit;
				} else if (document.joinForm.accountnum.value==""){
					alert("계좌를 입력하세요");
					document.joinForm.accountnum.focus();
					exit;
				} else if (document.joinForm.bank.value==""){
					alert("은행를 입력하세요");
					document.joinForm.bank.focus();
					exit;
				}
			}
			
			if (document.joinForm.password.value != document.joinForm.password2.value) {
				//비밀번호와 비밀번호확인의 값이 다를 경우

				alert("입력한 2개의 비밀번호가 일치하지 않습니다.");
				document.joinForm.password.focus();
				exit;

			}

			var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

			if (exptext.test(document.joinForm.email.value) == false) {
				//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우

				alert("이 메일형식이 올바르지 않습니다.");
				document.joinForm.email.focus();
				exit;
			}
			$.ajax({
				  type: "POST",
				  url: "passwordEncoder.five",
				  data: {password:$('#password').val()},
				  success: function(data){
					  $('#password').val(data);
					  document.joinForm.submit();
				  }
			});
			

		}
		
		$(function(){
			$('#check_user_id').click(function(){
				$.ajax({
					  type: "POST",
					  url: "check_user_id.five",
					  data: {user_id:$('#user_id').val()},
					  success: function(data){
						  $('#dialog').text(data);
						  $('#dialog').dialog();
					  }
				});
			});
			
			/* email 조합 */
			$('#email2').change(function(){
				var email_v = $('#email2').val();
				if (email_v == "1") {
					$('#email3').show();
					$('#email3').val("");
				} else {
					$('#email3').hide();
					$('#email3').val(email_v);
				}
			});
			
			/* 조합한 email 표시 */
			$('#check_email').click(function(){
				var email = $('#email1').val()+'@'+$('#email3').val();
				
				$.ajax({
					  type: "POST",
					  url: "check_email.five",
					  data: {email:email},
					  success: function(data){
						  console.log()
						  if(data.trim()=='사용 가능한 Email입니다.'){
							  $('#dialog').text(data);
							  $('#dialog').dialog();
							  $('#email').val(email);
						  }else{
							  $('#dialog').text(data);
							  $('#dialog').dialog();
							  $('#email').val("");
						  }
					  }
				});
			});
		});
		
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
	                document.getElementById("addd").focus();
	            }
	        }).open();
	    }
		function execDaumPostcode2() {
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
	                document.getElementById("farm_addcode").value = data.postcode1+'-'+data.postcode2;
	                //document.getElementById("postcode2").value = data.postcode2;
	                document.getElementById("farm_add").value = fullAddr;

	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("farm_add_de").focus();
	            }
	        }).open();
	    }
	</script>
    
    <!-- Section: contact -->
    <section id="contact" class="home-section text-center" style="position: static;">
    	<div class="boxed-grey" style="height:100%">
	
	<!-- 회원가입 폼 -->
	<form action="" method="post" name="joinForm" enctype="multipart/form-data">
		<div class="row">
			<div class="col-sm-offset-4 col-md-4">
				<div class="form-group">
					<!-- ID 입력 --> 
					<div class="input-group">
					<span class="input-group-addon">ID</span>
					<input type="text" class="form-control" name="user_id" id="user_id" placeholder="UserID" required/>
					<input type="button" class="btn btn-skin" id="check_user_id" value="중복확인"/>
					</div>
					<!-- 이름 입력 --> 
					<div class="input-group">
					<span class="input-group-addon">이름</span>
					<input type="text" class="form-control" name="user_name" placeholder="UserName" required/>
					</div>
					<!-- 비밀번호 입력 --> 
					<div class="input-group">
					<span class="input-group-addon">비밀번호</span>
					<input type="password" class="form-control" name="password" id="password" placeholder="password" required/>
					</div>
					<!-- 비밀번호 입력 --> 
					<div class="input-group">
					<span class="input-group-addon">비밀번호 확인</span>
					<input type="password" class="form-control" name="password2" id="password2" placeholder="password" required/>
					</div>
					<!-- Email 입력 --> 
					<div class="input-group">
					<span class="input-group-addon">Email</span>
					<input type="text" class="form-control" name="email1" id="email1" placeholder="Email" required />@
					<select name="email2" id="email2" class="">
						<option value="" selected>이메일선택</option>
						<option value="naver.com">naver.com</option>
						<option value="dreamwiz.com">dreamwiz.com</option>
						<option value="empal.com">empal.com</option>
						<option value="hanmir.com">hanmir.com</option>
						<option value="hanafos.com">hanafos.com</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="lycos.co.kr">lycos.co.kr</option>
						<option value="nate.com">nate.com</option>
						<option value="paran.com">paran.com</option>
						<option value="netian.com">netian.com</option>
						<option value="yahoo.co.kr">yahoo.co.kr</option>
						<option value="kornet.net">kornet.net</option>
						<option value="nownuri.net">nownuri.net</option>
						<option value="unitel.co.kr">unitel.co.kr</option>
						<option value="freechal.com">freechal.com</option>
						<option value="korea.com">korea.com</option>
						<option value="orgio.net">orgio.net</option>
						<option value="chollian.net">chollian.net</option>
						<option value="hitel.net">hitel.net</option>
						<option value="1">직접입력</option>
					</select> 
					<input type="text" class="form-control" name="email3" id="email3" style="display: none">
					<input type="button" class="btn btn-skin" value="확인" id="check_email" >
					<input type="text" class="form-control" name="email" id="email" readonly="readonly">
					</div>
					<!-- 우편번호 입력 --> 
					<div class="input-group">
					<span class="input-group-addon">우편번호</span>
					<input type="text" class="form-control" name="add_code" id="add_code" placeholder="AddressCode" required readonly="readonly"/>
					<input type="button" class="btn btn-skin " onclick="execDaumPostcode()" value="우편번호 찾기">
					</div>
					<!-- 지역주소 -->
					<div class="input-group">
					<span class="input-group-addon">지역주소</span>
					<input type="text" class="form-control" name="addr" id="addr" placeholder="Address" required readonly="readonly"/>
					</div>
					<!-- 세부주소 -->
					<div class="input-group">
					<span class="input-group-addon">세부주소</span>
					<input type="text" class="form-control" name="addd" id="addd" placeholder="Address" required/>
					</div>
					<!-- 전화번호 -->
					<div class="input-group">
					<span class="input-group-addon">전화번호</span>
					<input type="text" class="form-control" name="cell_phone" placeholder="phoneNumber" required/>
					</div>
					<!-- 유저사진등록 -->
					<div class="input-group">
					<span class="input-group-addon">사진</span>
					<input type="file" class="form-control" name="file" placeholder="image" required/>
					</div>
					<hr>
					<c:if test="${param.user == 'ROLE_SELLER'}">
						<!-- 농장 이름 입력 --> 
						<div class="input-group">
						<span class="input-group-addon">농장 이름</span>
						<input type="text" class="form-control" name="farminfo" placeholder="FarmID" required/>
						</div>
						<!-- 농장 우편번호 입력 --> 
						<div class="input-group">
						<span class="input-group-addon">우편번호</span>
						<input type="text" class="form-control" name="farm_addcode" id="farm_addcode" placeholder="FarmAddressCode" required readonly="readonly"/>
						<input type="button" class="btn btn-skin " onclick="execDaumPostcode2()" value="우편번호 찾기">
						</div>
						<!-- 농장지역 -->
						<div class="input-group">
						<span class="input-group-addon">농장지역</span>
						<input type="text" class="form-control" name="farm_add" id="farm_add" placeholder="FarmAddress" required readonly="readonly"/>
						</div>
						<!-- 세부주소 -->
						<div class="input-group">
						<span class="input-group-addon">농장 세부주소</span>
						<input type="text" class="form-control" name="farm_add_de" id="farm_add_de" placeholder="FarmAddress" required/>
						</div>
						<!-- 농장 주요작물 -->
						<div class="input-group">
						<span class="input-group-addon">농장 주요작물</span>
						<input type="text" class="form-control" name="pro_name" placeholder="Product" required/>
						</div>
						<!-- 농장 전화번호 -->
						<div class="input-group">
						<span class="input-group-addon">농장 전화번호</span>
						<input type="text" class="form-control" name="farm_phon" placeholder="FarmPhoneNumber" required/>
						</div>
						<!-- 농장소개 -->
						<div class="input-group">
						<span class="input-group-addon">농장소개</span>
						<textarea class="form-control" name="farm_comment" placeholder="FarmIntroduce" required></textarea>
						</div>
						<hr>
						<!-- 계좌 등록 -->
						<div class="input-group">
						<span class="input-group-addon">은 행</span>
						<input type="text" class="form-control" name="bank" placeholder="Bank" required/>
						</div>
						<!-- 계좌 등록 -->
						<div class="input-group">
						<span class="input-group-addon">계 좌</span>
						<input type="text" class="form-control" name="accountnum" placeholder="Account" required/>
						</div>
					</c:if>
				</div>
			</div>
			
		</div>
		
		<c:choose>
			<c:when test="${param.user == 'ROLE_SELLER'}">
				<input type="hidden" name="authority" value="ROLE_SELLER">
			</c:when>
			<c:otherwise>
				<input type="hidden" name="authority" value="ROLE_CONSUMER">
			</c:otherwise>
		</c:choose>
	</form>
	<div class="col-sm-offset-4 col-md-4">
		<button type="button" class="btn btn-skin pull-center" onclick="checkfield()">가입확인</button>
		<button type="reset" class="btn btn-skin pull-center" onclick="javascript:history.go(-1)">취 소</button>
	</div>
	</div>
	</section>
	<div id="dialog" title="title">
	</div>
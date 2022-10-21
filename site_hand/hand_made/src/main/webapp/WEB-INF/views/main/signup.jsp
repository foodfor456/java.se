<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
<style type="text/css">
 .post>[type=text]{
 margin-top : 5px; text-align: left; padding-left: 10px;
 }
 .button-set{padding: 0;}
 
</style>
</head>

<body>
	<form class="container" action = "<%=request.getContextPath()%>/signup" method = "post">
		<h1 class="mt-3">회원가입</h1>	
		<div class="form-group">
		  <label>아이디</label>
		  <button type="button" class="btn btn-outline-primary ml-5 idcheck">아이디 중복확인</button>
		  <input type="text" class="form-control col-6" id="me_id" name="me_id">
		</div>
		<div class="form-group">
		  <label>비밀번호</label>
		  <input type="password" class="form-control col-6" id="me_pw" name="me_pw">
		</div>
		<div class="form-group">
		  <label>비밀번호 확인</label>
		  <input type="password" class="form-control col-6" id="me_pw2" name="me_pw2">
		</div>
		<div class="form-group">
		  <label>이름</label>
		  <input type="text" class="form-control col-6" id="me_name" name="me_name">
		</div>
		<div class="form-group">
		  <label>이메일</label>
		  <input type="text" class="form-control col-6" id="me_email" name="me_email">
	    <button type="button" class="btn btn-outline-success btn-check">이메일 인증</button>
		  <input type="text" id="me_validate" name="me_validate" style="display:none">
		  <div class="btn-checked form-group"></div>
		</div>
		<div class="form-group post">
		  <label>주소</label><br>
		  <input type="text" id="sample4_postcode" placeholder="우편번호" readonly class="col-2" name="me_post" id="me_post">
			<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="sample4_roadAddress" placeholder="도로명주소" readonly class="col-6" name="me_addr" id="me_addr"><br>
			<span id="guide" style="color:#999;display:none"></span>
			<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="me_addr_detail" id="me_addr_detail">
		</div>
		<div class="form-group">
		  <label>핸드폰 번호</label>
		  <input type="text" class="form-control col-6" name="me_phon" id="me_phon">
		</div>
		<div class="button-set">
			<button class="btn btn-outline-success btn-signUp">회원가입</button>
			<a class="btn btn-outline-warning" onclick="history.back()">취소</a>
		</div>
	</form>
</body>
<script>
$(function(){
	$('#me_id').change(function(){
		idCheck = false;})
	$("form").validate({
	  rules: {
	    me_id: {
	      required : true,
	      minlength : 5,
	      maxlength : 12,
	      regex: /^(=?\w{5,13}$)/
	    },
	    me_pw: {
	      required : true,
	      minlength : 8,
	      regex: /^(?=\w{8,20}$)\w*(\d[A-z]|[A-z]\d)\w*$/
	    },
	    me_pw2: {
	      required : true,
	      minlength : 8,
	      equalTo : me_pw
	    },
	    me_email: {
	    	email : true
	    },
	    me_phon: {
	    	regex: /^0(?=\w{1,11}$)\w*(\d)\w*$/
	    }
	  },
	  //규칙체크 실패시 출력될 메시지
	  messages : {
		  me_id: {
	      required : "필수로입력하세요",
	      minlength : "최소 {5}글자이상이어야 합니다",
	      regex: "영문, 숫자 5~13자리만 입력 가능합니다."
	    },
	    me_pw: {
	      required : "필수로입력하세요",
	      minlength : "최소 {8}글자이상이어야 합니다",
	      regex : "영문자, 숫자로 이루어져있으며 최소 하나이상 포함"
	    },
	    me_pw2: {
	      required : "필수로입력하세요",
	      minlength : "최소 {0}글자이상이어야 합니다",
	      equalTo : "비밀번호가 일치하지 않습니다."
	    },
	    me_email: {
	      email : "메일형식이 아닙니다."
	    },
	    me_phon: {
	    	regex : "핸드폰번호를 다시 입력해주세요."
	    }
	  },
	  submitHandler: function(form){
		  let me_email = $('#me_email').val();
		  let me_validate = $('#me_validate').val();
		  console.log(me_validate);
		  if(!idCheck){
				alert('아이디 중복 검사를 하세요');
				return false;
			}else{
			  if(me_validate != 1){
			  	if(confirm('이메일 인증을 하지 않으면 준회원입니다.'))
			  		return true;
			  	else{
			  		$('#me_email').focus();
			  		return false;
			  	}
			   }else{
				  
				  return true;
				  
			  }
			}
		  
		}
	});
	$('.idcheck').click(function(){
		let idRes = '${idRes}';
		let me_id = $('#me_id').val();
		let obj = {
			idRes : idRes,
			me_id : me_id
		};
	  if(me_id.trim() == 0){
			alert('아이디를 입력하세요.');
			return;
		}
		ajaxPost(false, obj, '/ajax/signup/check', function(data){
			console.log(data);
			if(data.idRes){
				alert('가입 가능한 아이디 입니다.');
				idCheck = true;
			}
			else
				alert('중복된 회원 아이디이거나 잘못된 아이디 입니다.');
			});
		})
		let idCheck = false;
	$('.btn-check').click(function(){
		  let me_email = $('#me_email').val();
		  if(me_email == null || me_email.trim() == 0 || $('#me_email-error').text().trim() != 0){
			  alert('이메일을 입력하세요.');
			  $('#me_email').focus();
			  return;
		  }
		  else{
				let str = '';
				str +=	'<div>'
				str +=		'<input type="text" class="form-control col-6" id="me_vali" name="me_vali">'
				str +=	 	'<button class="btn btn-outline-success btn-vali" type="button">인증하기</button>'
				str +=	 	'<button class="btn btn-outline-warning btn-cancle" type="button">취소</button>'
				str +=	'</div>'
				$('#me_validate').val('send');
				$('.btn-check').hide();
				$('.btn-checked').html(str);
				let me_email = $('#me_email').val();
				let send = $('#me_validate').val();
				obj = {
					me_email : me_email,
					send : send
				};
				ajaxString(false, obj, '/ajax/email/check', function(data){
					console.log(data);
				});
			}
		  
	  })
	$(document).on('click', '.btn-vali', function(){
	  let me_vali = $('#me_vali').val();
		let obj = {
			me_vali : me_vali
		};
		ajaxString(false, obj, '/ajax/email/checked', function(data){
			console.log(data);
			if(!data){
				alert('정확한 코드를 입력하세요.');
				return;}
			else{
				alert('이메일 인증이 완료되었습니다.');
				$('#me_email').attr('readonly', true);
				$('#me_validate').val(1);
				$('.btn-checked').text('인증완료');
				$('.btn-cancle').click();
				$('.btn-check').remove();
			}
		});
	 })
	$(document).on('click', '.btn-cancle', function(){
		$('#me_validate').val('');
		$('.btn-check').show();
		$('.btn-checked').children().remove();
	})
	
		
})

$.validator.addMethod(
    "regex",
    function(value, element, regexp) {
        var re = new RegExp(regexp);
        return this.optional(element) || re.test(value);
    },
    "Please check your input."
);

function ajaxPost(async, dataObj, url, success){
	$.ajax({
	  async: async,
	  type:'POST',
	  data:JSON.stringify(dataObj),
	  url:"<%=request.getContextPath()%>"+url,
	  dataType:"json",
	  contentType:"application/json; charset=UTF-8",
	  success : function(data){
		  success(data);
	  }
  })
};
function ajaxString(async, dataObj, url, success){
	$.ajax({
	  async: async,
	  type:'POST',
	  data:dataObj,
	  url:"<%=request.getContextPath()%>"+url,
	  dataType:"json",
	  success : function(data){
		  success(data);
	  }
  })
};
function sample4_execDaumPostcode() {
	new daum.Postcode({
	  oncomplete: function(data) {
	    var roadAddr = data.roadAddress; // 도로명 주소 변수
	    var extraRoadAddr = ''; // 참고 항목 변수
	
	    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
      	extraRoadAddr += data.bname;
	    }
	    if(data.buildingName !== '' && data.apartment === 'Y'){
      	extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	    }
	    if(extraRoadAddr !== ''){
      	extraRoadAddr = ' (' + extraRoadAddr + ')';
	    }
	    document.getElementById('sample4_postcode').value = data.zonecode;
	    document.getElementById("sample4_roadAddress").value = roadAddr;
	    var guideTextBox = document.getElementById("guide");
	    if(data.autoRoadAddress) {
	      var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	      guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	      guideTextBox.style.display = 'block';
	    } else {
	      guideTextBox.innerHTML = '';
	      guideTextBox.style.display = 'none';
	    }
	  }
	}).open();
}
</script>
</html>

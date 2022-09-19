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
		  <button type="button" class="btn btn-outline-primary ml-5">아이디 중복확인</button>
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
		  <label>이메일</label>
		  <input type="text" class="form-control col-6" id="me_email" name="me_email">
		 
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
			<button class="btn btn-outline-success">회원가입</button>
			<a class="btn btn-outline-warning" onclick="history.back()">취소</a>
		</div>
	</form>
</body>
<script>
$(function(){
	$("form").change(function(){
		$(this).validate({
		  rules: {
		    me_id: {
		      required : true,
		      minlength : 5,
		      maxlength : 12
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
		      minlength : "최소 {5}글자이상이어야 합니다"
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
		  }
		});
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

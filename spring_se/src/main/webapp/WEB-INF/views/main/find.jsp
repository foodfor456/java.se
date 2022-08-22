<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.alert{
	position : fixed; top: 0; left: 0; right: 0; bottom: 0; 
	background-color: rgba(0,0,0,0.3); line-height: 100vh; font-size: 40px;
	text-align: center; color: #fff;
	}
</style>
</head>
<body>
	<div class="container">
		<br>
	  <h2>아이디/비번찾기</h2>
	  <br>
	  <ul class="nav nav-tabs" role="tablist">
	    <li class="nav-item">
	      <a class="nav-link active" data-toggle="tab" href="#id">아이디 찾기</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" data-toggle="tab" href="#pw">비번 찾기</a>
	    </li>
	  </ul>
	  <div class="tab-content">
	    <div id="id" class="container tab-pane active"><br>
	      <h3>아이디 찾기</h3>
	      <div class="form-group">
	      	<input type="text" name="me_birth" class="form-control" placeholder="생년월일을 입력하세요(yyyy-MM-dd)">
	      </div>
	      <div class="form-group">
	      	<input type="text" name="me_email" class="form-control" placeholder="이메일을 입력하세요">
	      </div>
	      <button class="btn btn-success col-12 mb-5 btn-find-id">아이디 찾기</button>
	    </div>
	    <div id="pw" class="container tab-pane fade"><br>
	      <h3>비번 찾기</h3>
	      <div class="form-group">
	      	<input type="text" name="me_birth" class="form-control" placeholder="생년월일을 입력하세요(yyyy-MM-dd)">
	      </div>
	      <div class="form-group">
	      	<input type="text" name="me_email" class="form-control" placeholder="이메일을 입력하세요">
	      </div>
	      <button class="btn btn-success col-12 mb-5 btn-find-pw">비번 찾기</button>
	    	
	    </div>
	  </div>
	</div>
	
<script>
	$(function(){
		let type = '${type}';
		$('[href="#'+type+'"]').click();
		
		$('.btn-find-id').click(function(){ // document는 버튼이 사라졌다 나타나는 경우에 씀(ajax)
			let me_birth = $('#id [name=me_birth]').val();
			let me_email = $('#id [name=me_email]').val();
			let obj = {
					me_birth : me_birth,
					me_email : me_email
			}
			if(me_birth.trim() == ''){
				alert('생년월일을 입력하세요')
				$('#id [name=me_birth]').focus();
				return;
			}
			if(me_email.trim() == ''){
				alert('이메일을 입력하세요')
				$('#id [name=me_email]').focus();
				return;
			}
			$.ajax({
				// 비동기 : 작업이 끝날때 까지 기다리지 않음, ajax가 동작중인지 끝났는지 상관없이 다음 작업을 함
				// 동기 : 작업이 끝날때 까지 기다림, ajax가 끝날때 까지 기다린 다음 다음 작업을 함
				async:true, // 비동기 여부 : true(비동기), false(동기)
	      type:'POST', // 보내는 방식
	      data: JSON.stringify(obj), // 실제 보내는 데이터
	      url:'<%=request.getContextPath()%>/find/id',
	      dataType:"json", //서버에서 보내준 데이터의 타입
	      contentType:"application/json; charset=UTF-8", // 화면에서 ajax로 보내줄 데이터의 타입 data의 타입
	       // ajax가 성공적으로 동작했을때 할 작업
	      success : function(data){
	    	  if(data.idList.length == 0)
	    		  alert('가입된 아이디가 없습니다.')
	    		  return;
	    	  let str = '회원님의 아이디는 다음과 같습니다. \n';
	    	  for(id of data.idList){
	    		  str += id +'\n'
	    	  }
	    	  alert(str);
	    	}
			});
			
		})
		$('.btn-find-pw').click(function(){ // document는 버튼이 사라졌다 나타나는 경우에 씀(ajax)
			let me_birth = $('#pw [name=me_birth]').val();
			let me_email = $('#pw [name=me_email]').val();
			let obj = {
					me_birth : me_birth,
					me_email : me_email
			}
			if(me_birth.trim() == ''){
				alert('생년월일을 입력하세요')
				$('#pw [name=me_birth]').focus();
				return;
			}
			if(me_email.trim() == ''){
				alert('이메일을 입력하세요')
				$('#pw [name=me_email]').focus();
				return;
			}
			var str = '<div class="alert">확인중입니다.</div>';
			$('.container').after(str);
			$.ajax({
				// 비동기 : 작업이 끝날때 까지 기다리지 않음, ajax가 동작중인지 끝났는지 상관없이 다음 작업을 함
				// 동기 : 작업이 끝날때 까지 기다림, ajax가 끝날때 까지 기다린 다음 다음 작업을 함
				async:true, // 비동기 여부 : true(비동기), false(동기)
	      type:'POST', // 보내는 방식
	      data: JSON.stringify(obj), // 실제 보내는 데이터
	      url:'<%=request.getContextPath()%>/find/pw',
	      dataType:"json", //서버에서 보내준 데이터의 타입
	      contentType:"application/json; charset=UTF-8", // 화면에서 ajax로 보내줄 데이터의 타입 data의 타입
	       // ajax가 성공적으로 동작했을때 할 작업
	      success : function(data){
	    	 $('.alert').remove();
	    	 setTimeout(() => {
	    		 if(data.res){
		    		 alert('메일로 새 비밀번호를 전송했습니다. 확인해주세요.')
		    	 }else{
		    		 alert('입력한 정보가 잘못됐거나 없는 회원정보입니다.')
		    	 }
		    	 if(data.exception){
		    		 alert('서버 문제입니다. 전화로 문의해주세요.')
		    	 }
					}, 100);
	    	}
			});
		})
	})
</script>
</body>
</html>
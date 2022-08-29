<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	  <h2 class="mt-3">아이디 / 비밀번호 찾기</h2>
	  
	  <ul class="nav nav-pills" role="tablist">
	    <li class="nav-item">
	      <a class="nav-link active" data-toggle="pill" href="#id">아이디찾기</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" data-toggle="pill" href="#pw">비밀번호 찾기</a>
	    </li>
	  </ul>
	
	  <div class="tab-content">
	    <div id="id" class="container tab-pane active id"><br>
	      <h3>아이디 찾기</h3>
	      <div class="form-group">
	      	<input type="text" class="form-control me_email" placeholder="이메일을 입력하세요">
	      </div>
	      <div class="form-group">
	      	<input type="text" class="form-control me_birth" placeholder="생일을 입력하세요">
	      </div>
	      <button class="btn btn-outline-success btn-find-id col-12">아이디 찾기</button>
	    </div>
	    <div id="pw" class="container tab-pane fade pw"><br>
	      <h3>비밀번호 찾기</h3>
	      <div class="form-group">
	      	<input type="text" class="form-control me_email" placeholder="이메일을 입력하세요">
	      </div>
	      <div class="form-group">
	      	<input type="text" class="form-control me_birth" placeholder="생일을 입력하세요">
	      </div>
	      <button class="btn btn-outline-success btn-find-pw col-12">비밀번호 찾기</button>
	    </div>
	  </div>
	</div>
<script>
	
	$(function(){
		$('[href = "#${type}"]').click();
		
		$('.btn-find-id').click(function(){
			let me_email = $('#id .me_email').val();
			let me_birth = $('#id .me_birth').val();
			if(me_email.trim() == ''){
				alert('이메일을 입력하세요.');
				return;
			}
			let birthRegex = /^\d{4}-\d{2}-\d{2}$/
			if(!birthRegex.test(me_birth)){
				alert('생일을 올바르게 입력하세요.');
				$('#id .me_birth').focus();
				return;
			}
			
			obj = {
				me_email : me_email,
				me_birth : me_birth
			}
			ajaxPost(false, obj, '/ajax/find/id', function(data){
				if(data.memberId == null)
			  	alert('회원아이디가 없습니다.')
			  else
			  	alert('회원님의 아이디는: '+data.memberId+' 입니다.')
				
			})
		});
		$('.btn-find-pw').click(function(){
			let me_email = $('#pw .me_email').val();
			let me_birth = $('#pw .me_birth').val();
			if(me_email.trim() == ''){
				alert('이메일을 입력하세요.');
				return;
			}
			let birthRegex = /^\d{4}-\d{2}-\d{2}$/
			if(!birthRegex.test(me_birth)){
				alert('생일을 올바르게 입력하세요.');
				$('#pw .me_birth').focus();
				return;
			}
			obj = {
					me_email : me_email,
					me_birth : me_birth
				}
				ajaxPost(false, obj, '/ajax/find/pw', function(data){
					if(data.res){
						alert('입력한 이메일로 새 비밀번호를 발송했습니다.')
					}else{
						alert('없는 정보입니다.')
					}
			})
		})
	})
	function ajaxPost(async, dataObj, url, success){
		$.ajax({
	    async:false,
	    type:'POST',
	    data:JSON.stringify(dataObj),
	    url:"<%=request.getContextPath()%>"+url,
	    dataType:"json",
	    contentType:"application/json; charset=UTF-8",
	    success : function(data){
	    	success(data);
	    }
		});
	}
</script>
</body>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<style>
[name="file"]{
	display: none;
}
.box-thumb{
	width: 150px; height: 150px; border: 1px solid red;
	text-align: center; font-size: 50px; line-height: 148px; cursor: pointer;
	box-sizing: border-box;
}
#preview{
	display: none;
}
</style>
</head>
<body>
<form class="container" method="post" enctype="multipart/form-data">
	<h2>공지사항 등록</h2>
	<div class="form-group">
	  <input type="text" class="form-control" name="bd_title" placeholder="공지사항 제목">
	</div>
	<div class="form-group">
	  <textarea class="form-control" name="bd_content"></textarea>
	</div>
	<div class="form-check">
	  <label class="form-check-label">
	    <input type="checkbox" class="form-check-input" value="1" name="bd_secret">비밀글
	  </label>
	</div>
	<div>
		<input type="file" class="form-control" name="files">
		<input type="file" class="form-control" name="files">
		<input type="file" class="form-control" name="files">
	</div>
	<button class="btn btn-outline-danger col-12" >공지사항 등록</button>
</form>
<script type="text/javascript">
$(function(){
	$('[name=bd_content]').summernote({
	  placeholder: '공지사항 내용을 입력하세요.',
	  tabsize: 2,
	  height: 400
  });
	$('form').submit(function(){
		let bd_title = $('[name=bd_title]').val();
		if(bd_title == ''){
			alert('제품 제목을 입력하세요.');
			$('[name=bd_title]').focus();
			return false;
		}
		let bd_content = $('[name=bd_content]').val();
		if(bd_content == ''){
			alert('제품 내용을 입력하세요.');
			$('[name=bd_content]').focus();
			return false;
		}
	})
})

</script>
</body>
</html>
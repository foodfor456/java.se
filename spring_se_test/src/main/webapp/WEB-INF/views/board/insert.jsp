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

</head>
<body>
	<form method="post" class="container" enctype="multipart/form-data">
		<h1>게시글 등록</h1>
		<div class="form-group">
		  <label for="bd_title">제목</label>
		  <input type="text" class="form-control" name="bd_title" id="bd_title">
		</div>
		<div class="form-group">
		  <label for="bd_content">내용</label>
		  <textarea class="form-control" rows="10" name="bd_content" id="sn"></textarea>
		</div>
		  <div class="form-group">
	      <label>첨부파일(최대 3개):</label>
	      <input type="file" class="form-control" name="files" multiple="multiple"/> <!-- multiple한번에 파일 선택가능 속성 -->>
	      <input type="file" class="form-control" name="files"/>
	      <input type="file" class="form-control" name="files"/>
	    </div>
		<button class="btn btn-outline-success col-12">글쓰기</button>
	</form>
</body>
<script type="text/javascript">
$('#sn').summernote({
	placeholder: 'Hello Bootstrap 4',
	tabsize: 2,
	height: 500,
	callbacks: {
	    onImageUpload: function(files) {
			  if(files == null || files.length == 0)
				  return;
			  for(file of files){
		    	let data = new FormData(); // form태그와 같이 전송
		    	data.append('file', file);
				  let thisObj = $(this);
				  $.ajax({
					  data : data,
					  type : 'post',
					  url : '<%=request.getContextPath()%>/board/img/upload',
					  contentType : false,
					  processData : false,
					  dataType : "json",
					  success : function(data){
							let url = '<%=request.getContextPath()%>/simg' + data.url;
							console.log(data)
							thisObj.summernote('insertImage', url);
					  }
				  })
			  }
	    }
	  }
 });
</script>
</html>
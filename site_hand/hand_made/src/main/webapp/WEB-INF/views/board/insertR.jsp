<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script src="https://kit.fontawesome.com/7a5abb87c2.js" crossorigin="anonymous"></script>
<style type="text/css">
.idca-box{ margin-left: 0; padding: 0; height: 70px; width: 100%; display: flex;}
.idca-box>div{ width: 40%; height: 100%; flex: 1;}
.idca-box>div:nth-child(1){ margin-right: 10px;}
</style>
</head>

<body>
	<form class="mt-5 board-insert" action="<c:url value="/board/insertR"></c:url>" method="post">
		<h2>글 쓰기</h2>
		<div class="region-box">
			<label>지역 :</label>
			<div class="region-s">
				<select class="form-control mb-3" id="pv_name" name="pv_name">
					<option value="0">지역 선택</option>
					<c:forEach items="${region}" var="re">
						<option  value="${re}">${re}</option>
					</c:forEach>
					
				</select>
			</div>
			<div class="region-r"></div>
		</div>
		<div class="idca-box">
			<div class="form-group">
			  <label>카테고리 :</label>
			  <select class="form-control mb-3" id="bd_bc_num" name="bd_bc_num">
					<option value="0">카테고리 선택</option>
					<c:forEach items="${bca}" var="bc">
						<option value="${bc.bc_num}">${bc.bc_name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
			  <label>작성자 :</label>
			  <input type="text" class="form-control" id="bd_me_id" name="bd_me_id" value="${user.me_id}" readonly>
			</div>
		</div>
		<div class="form-group mt-3">
		  <label>제목 :</label>
		  <input type="text" class="form-control" id="bd_title" name="bd_title">
		</div>
		<div class="form-group mt-3">
		  <label>내용 :</label>
		  <textarea class="form-control" id="sn" name="bd_content"></textarea>
		</div>
		<button class="btn btn-outline-success">게시글 등록</button>
	</form>
</body>
<script type="text/javascript">
$(function(){
	$('#pv_name').change(function(){
		let pv_name = $(this).val();
		
		ajaxString(false, pv_name, '/ajax/board/region/select', function(data){
			console.log(data);
			let str = '';
			if(data.length != 0){
				str += '<select class="form-control mb-3" id="rg_name" name="rb_rg_name">'
				str += 	 '<option value="0">지역 선택</option>'
					for(let rli of data)
				str += 	 '<option value="'+rli+'">'+rli+'</option>'
				str += '</select>'
				
			}else if($('#pv_name').val() == '서울'){
				str += '<input readonly name="rb_rg_name" class="form-control mb-3" value="서울">'
			}
			else{
				str += '<input readonly class="form-control mb-3" value="아직 추가된 지역이 없습니다. 추가해주세요">'
			}
			$('.region-r').html(str)
		},null)
	})
})
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
function ajaxString(async, dataObj, url, success, dataType){
	$.ajax({
	  async: async,
	  type:'POST',
	  data:dataObj,
	  url:"<%=request.getContextPath()%>"+url,
	  dataType:dataType,
	  contentType:"application/json; charset=UTF-8",
	  success : function(data){
		  success(data);
	  },error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
  })
};
$('#sn').summernote({
  placeholder: 'Hello Bootstrap 4',
  tabsize: 2,
  height: 400,
//onImageUpload callback
});
</script>
</html>
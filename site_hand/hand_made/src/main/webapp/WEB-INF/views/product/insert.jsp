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
<style type="text/css">
.price-box{	float: right; width: 40%;}
.header-box{	position: relative;}
.code {	margin-top: 10px; position: absolute; bottom: -30px; right: 0; padding: 0;}
.themb-box-main { border: 1px solid gray; width: 50%; height: 50%; display: inline-block;}
.themb-box-sub {	border: 1px solid gray;	width: 50%; height: 60px;}
</style>
</head>
<body>
<form class="container mt-4" id="cl_category" method="post">
	<h1>제품 등록</h1>
	<div class="form-group header-box">
		<div class="category-box">
			<label>카테고리 :</label>
			<select class="form-control mb-3" id="cl_name" name="cl_name">
				<option value="0">대분류 카테고리</option>
				<c:forEach items="${categoryL}" var="cl" varStatus="i">
					<option value="${i.count}">${cl}</option>
				</c:forEach>
			</select>
			<div class="form-check-inline mt-3 ml-2">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input fa_check" value="1" name="fa_check">공방제품
			  </label>
			</div>
		</div>
		<div class="col-6 code">
		  <label>제품 코드 :</label>
		  <input type="text" class="form-control" id="pr_code" readonly name="pr_code">
		</div>
	</div>
	<div class="form-group mt-3">
	  <label>제목 :</label>
	  <input type="text" class="form-control" id="pr_title" name="pr_title">
	</div>
	<div class="form-group themb-box">
		<div class="themb-box-main"></div>
		<div class="price-box">
			<label>수량 :</label>
	    <input type="text" class="form-control" name="pr_amount">
	    <label class="mt-5">가격 :</label>
			<input type="text" class="form-control" id="pr_price" name="pr_price">
		</div>
		<div class="themb-box-sub"></div>
	</div>
	<div class="form-group mt-3">
	  <label>내용 :</label>
	  <textarea class="form-control" id="sn" name="pr_content"></textarea>
	</div>
	<button class="btn btn-outline-success">제품 등록</button>
</form>
<script type="text/javascript">
$(function(){
	$('#cl_name').change(function(){
		$('#cs_name').remove();
		let str = '';
		let cl_name = $(this).children().eq($(this).val()).text();
		let cs_name = $('#cs_name').text();
		let obj = {
			cl_name : cl_name
		}
		ajaxString(false, obj, '/product/insert/categoryS', function(data){
			if(data.length != 0){
			str +=	'<select class="form-control" id="cs_name" name="cs_name">'
			str +=		'<option value="0">소분류 카테고리</option>'
				for(let cs of data){
			str +=		'<option value="'+(cs.length-1)+'">'+cs+'</option>'
				}
			str +=	'</select>'
			}else{
				str +=	'<select class="form-control" id="cs_name" name="cs_name">'
				str +=	'<option value="0">등록된 카테고리가 없습니다.</option>'
				str +=	'</select>'
			}
			$('#cl_name').after(str);
			console.log(data);
		})
	});
		$(document).on('change','.category-box', function(){
			let cl_name = $('#cl_name').val();
			let cs_name = $('#cs_name').val();
			let fa_check = $('.fa_check').is(':checked');
			let ca_code = '';
			let fa_num = 0;
			if(fa_check)
				fa_num = 1;
			if(cl_name != 0 && cs_name != null && cs_name != 0){
				let strs = 'ABCDEFGHIJ';
				let pr_num = cl_name+cs_name+fa_num;
				for(let i = 0; i < pr_num.length; i++)
					ca_code += strs[pr_num[i]];
				let obj = {ca_code : ca_code};
				ajaxString(true, obj, '/product/select/category', function(data){
					$('#pr_code').val(data);
					console.log(data);
				}, null)
			}else
				$('#pr_code').val('');
		})
});
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
	  },error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
  })
};
function ajaxString(async, dataObj, url, success, dataType){
	$.ajax({
	  async: async,
	  type:'POST',
	  data:dataObj,
	  url:"<%=request.getContextPath()%>"+url,
	  dataType:dataType,
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
</body>
</html>
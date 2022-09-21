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
</head>
<body>
	<div class="container mt-4">
		<h1>카테고리 등록</h1>
		<div class="form-group col-6 category-insert">
		  <label>카테고리 종류</label>
		  <select class="form-control category" id="category" name="category">
		  	<option value="0">카테고리 종류</option>
		    <option value="1">대분류</option>
		    <option value="2">소분류</option>
		  </select>
		</div>
	</div>
</body>
<script type="text/javascript">
$(function(){
	$('.category').change(function(){
		$('.category-insert').find('.category-l').remove();
		$('.category-insert').find('.category-s').remove();
		let type = $('.category').val();
		let str = '';
		if(type == 1){
			str = '';
			str += 	'<div class="form-group category-l">'
			str += 	  '<label for="usr">대분류 카테고리 등록</label>'
			str += 	  '<input type="text" class="form-control" id="cl_name" name="cl_name">'
			str += 	  '<button class="btn btn-outline-success category-l-success">등록</button>'
			str += 	'</div>'
		}else if(type == 2){
				let cs_name = $('#cs_name').val();
				let obj = {
					cs_name : cs_name
				};
			ajaxPost(false, obj, '/ajax/product/listL', function(data){
				str = '';
				str += 	'<div class="form-group category-s">'
				str +=   '<label>소분류 카테고리 등록</label>'
				str +=   '<select class="form-control" id="cl_name" name="cl_name">'
				str +=   '<option value="0">대분류 카테고리</option>'
				for(categoryL of data.list){
				str +=   	 '<option value="'+categoryL+'">'+categoryL+'</option>'
				}
				str +=   '</select>'
				str +=   '<input type="text" class="form-control category-s" id="cs_name" name="cs_name">'
				str +=   '<button class="btn btn-outline-success category-s-success">등록</button>'
				str +=  '</div>'
				
				})
		}
			$('.category-insert').append(str);
	})
	$(document).on('click', '.category-l-success', function(){
		let cl_name = $('#cl_name').val();
		let obj = {
			cl_name : cl_name
		};
		ajaxString(false, obj, '/ajax/product/insertl', function(data){
			if(data)
				alert('카테고리를 추가하였습니다.');
			else
				alert('카테고리 추가를 실패하였습니다.');
			location.href = '<%=request.getContextPath()%>/product/category'
			console.log(data);
		})
	})
	$(document).on('click', '.category-s-success', function(){
		let cs_name = $('#cs_name').val();
		let cl_name = $('#cl_name').val();
		let obj = {
			cs_name : cs_name,
			cl_name : cl_name
		};
		ajaxString(false, obj, '/ajax/product/inserts', function(data){
			if(data)
				alert('카테고리를 추가하였습니다.');
			else
				alert('카테고리 추가를 실패하였습니다.');
			location.href = '<%=request.getContextPath()%>/product/category'
			console.log(data);
		})
		
	})
})
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
</script>


</html>

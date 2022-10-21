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
<script src="https://kit.fontawesome.com/7a5abb87c2.js" crossorigin="anonymous"></script>
<style type="text/css">
.price-box{	float: right; width: 40%;}
.header-box{	position: relative;}
.code {	margin-top: 10px; position: absolute; bottom: -30px; right: 0; padding: 0;}
.themb-box-main { border: 1px solid gray; width: 50%; height: 50%; display: inline-block; text-align: center;}
.thumb-box-sub { border: 1px solid gray;	width: 50%; height: 60px; padding: 0 50px;}
.thumb-box-sub>div{ margin: 0 7px;}
.file-area { text-align: center;}
.file-box input{  line-height: 1.2; float: left;}
.fa-plus, .op-plus{ cursor: pointer; font-size: 20px;}
.file-box span{ float: right; cursor: pointer;}
.op-minus { margin: 5px; line-height: 1.7; cursor: pointer;}
.thumb-box{ display: inline-block;}

</style>
</head>
<body>
<form class="container mt-5 clearfix" method="post" enctype="multipart/form-data">
	<h2>제품 등록</h2>
	<div class="form-group header-box">
		<div class="category-box">
			<label>카테고리 :</label>
			
			<select class="form-control mb-3" id="cl_name" name="cl_name">
				<option value="0">대분류 카테고리</option>
				<c:forEach items="${categoryL}" var="cl">
					<option value="${cl.cl_num}">${cl.cl_name}</option>
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
		<div class="themb-box-main">
			<img id="preview" width= "550" height= "435" style="display: none">
		</div>
		<div class="price-box">
			<label>수량 :</label>
	    <input type="text" class="form-control" name="pr_amount">
	    <label class="mt-2">파일 :</label>
	    <div class="file-area">
	    	<div class="file-box clearfix">
		    	<div class="mb-1"><input class="pr_file" type="file" id="pr_file" name="files"></div>
	    	</div>
			  <i class="fa-solid fa-plus fi-plus"></i>
			</div>
			<label class="mt-2">가격 :</label>
			<input type="text" class="form-control" id="pr_price" name="pr_price">
			<label class="mt-2">옵션 :</label><br>
			<button type="button" class="btn btn-outline-warning op-add mb-1">옵션 추가</button>
			<div class="op-area mt-2">
			</div>
		</div>
		<div class="thumb-box-sub">
			
		</div>
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
		let cl_name = '';
		if($(this).children('option:selected').index() != 0){
			cl_name = $(this).children('option:selected').text();
		}
		let cs_name = $('#cs_name').text();
		let obj = {
			cl_name : cl_name
		}
		
		ajaxPost(false, obj, '/product/insert/categoryS', function(data){
			 if(data.categoryS.length != 0){
			str +=	'<select class="form-control" id="cs_name" name="cs_name">'
			str +=		'<option value="0">소분류 카테고리</option>'
			
				for(let cs of data.categoryS){
			str +=		'<option value="'+(cs.cs_num)+'">'+cs.cs_name+'</option>'
				}
			str +=	'</select>'
			}else {
				str +=	'<select class="form-control" id="cs_name" name="cs_name">'
				str +=	'<option value="-1">등록된 카테고리가 없습니다.</option>'
				str +=	'</select>'
			}
			if($('#cl_name').children('option:selected').index() != 0)
				$('#cl_name').after(str);
		})
	});
	$(document).on('change', '.pr_file', function(event) {
		let str = '';
		let index = $(this).parents('.file-box').index();
		var file = event.target.files[0];
		var reader = new FileReader(); 
		
		if(event.target.files.length == 0){
			$('#preview').hide();
			return;
		}else if(index < 7){
			if(index == 0){
				reader.readAsDataURL(file);
				reader.onload = function(e) {
	   			$('#preview').attr("src", e.target.result);
			  }
				$('#preview').show();
			}
			else{
				reader.readAsDataURL(file);
				reader.onload = function(e) {
					$('.thumb-box').eq(index-1).find('.thumb-img').attr("src", e.target.result);
			  }
			}
		}
		return;
	});
	$(document).on('change','.category-box', function(){
		let cl_name = $('#cl_name').val()-1;
		let cs_name = $('#cs_name').val()-1;
		let fa_check = $('.fa_check').is(':checked');
		let ca_code = '';
		let fa_num = 0;
		if(fa_check)
			fa_num = 1;
		if(cl_name != -1 && cs_name != null && cs_name != -1){
			let strs = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
			let pr_num = [cl_name,cs_name,fa_num];
			for(let i = 0; i < pr_num.length; i++)
				ca_code += strs[pr_num[i]];
			let obj = {ca_code : ca_code};
			ajaxString(true, obj, '/product/select/category', function(data){
				$('#pr_code').val(data);
				
			}, null)
		}else
			$('#pr_code').val('');
	})
	$(document).on('click', '.fi-plus', function(){
		let count = $('.file-area').children().length;
		let str = '';
		let strs = '';
		if(count < 7){
			$(this).remove();
			str += '<div class="file-box clearfix">'
			str +=   '<div class="mb-1" ><input class="pr_file" type="file" id="pr_file" name="files"><span>X</span></div>'
			str += '</div>'
			str += '<i class="fa-solid fa-plus fi-plus"></i>'
			strs += '<div class="thumb-box clearfix">'
			strs +=		'<img class="thumb-img" width="60" height="100%"> '
			strs += '</div>'
		}
		else if(count == 7){
			$(this).remove();
			str += '<div class="file-box clearfix">'
			str +=   '<div class="mb-1" ><input class="pr_file" type="file" id="pr_file" name="files"><span>X</span></div>'
			str += '</div>'
			strs += '<div class="thumb-box clearfix">'
			strs +=		'<img class="thumb-img" width="60" height="100%"> '
			strs += '</div>'
		}
			$('.file-area').append(str);
			$('.thumb-box-sub').append(strs);
	})
	$(document).on('click','.file-box span', function(){
		$('.fi-plus').remove();
		let index = $(this).parents('.file-box').index();
		$('.thumb-box').eq(index-1).remove();
		$(this).parents('.file-box').remove();
		let count = $('.file-area').children().length;
		let str = '';
		if(count < 7){
			str += '<i class="fa-solid fa-plus fi-plus"></i>'
		}
		else if(count == 7){
			$(this).remove();
			str += '<div class="file-box clearfix">'
			str +=   '<div class="mb-1" ><input class="pr_file" type="file" id="pr_file" name="files"><span>X</span></div>'
			str += '</div>'
		}
			$('.file-area').append(str);
	})
	$(document).on('click','.op-add', function(){
		let str = '';
		str += 	'<div class="op-box mt-2">'
		str += 		'<div class="input-group mb-1 ps_name">'
		str += 		  '<div class="input-group-prepend">'
		str += 	 			'<span class="input-group-text">선택 옵션 명:</span>'
		str += 		 	'</div>'
		str += 			'<input type="hidden" class="form-control ps_num" name="list[0].ps_num" value="1">'
		str +=			'<input type="text" class="form-control mr-1 ps_name" name="list[0].ps_name" placeholder="예)사이즈, 색상"><span class="op-fold" style="font-size: 15px; line-height: 2.5; color: blue; cursor: pointer">접기</span>'
    str += 		'</div>'
    str +=		'<div class="op-sub">'
    str += 			'<div class="mb-1 sub-box">'
		str += 				'<div class="input-group mb-1 op_title">'
		str += 		  		'<div class="input-group-prepend">'
		str += 		    		'<span class="input-group-text">옵션 이름:</span>'
		str += 					'</div>'
		str += 					'<input type="text" class="form-control" name="list[0].op_title" placeholder="예)S,M,L,ML">'
		str += 				'</div>'
		str += 				'<div class="input-group mb-1 op_price">'
		str +=  				'<div class="input-group-prepend">'
		str +=  	 				'<span class="input-group-text">옵션 가격:</span>'
		str +=  	 			'</div>'
		str +=  				'<input type="text" class="form-control" name="list[0].op_price" placeholder="정수로 입력">'
		str += 				'</div>'
		str +=			'</div>'
		str +=	 	'<div style="text-align: center;"><i class="fa-solid fa-plus op-plus"></i></div>'
		str +=		'</div>'
		str +=		'<button type="button" class="btn btn-outline-success op-save">등록</button>'
		str +=		'<button type="button" class="btn btn-outline-primary op-update" style="display: none;">수정</button>'
		str +=		'<button type="button" class="btn btn-outline-danger op-cancle">삭제</button>'
		str +=	'</div>'
		$('.op-area').append(str);
		setNames()
	})
	$(document).on('click','.op-plus', function(){
		let str = '';
		str += '<div class="mb-1 sub-box">'
		str += 	 '<div class="input-group mb-1 op_title">'
		str +=   	 '<div class="input-group-prepend">'
		str +=    	 '<span class="input-group-text">옵션 이름:</span>'
		str +=   	 '</div>'
		str +=  	 '<input type="text" class="form-control" name="op_title[]" placeholder="예)S,M,L,ML">'
		str +=	 '<i class="fa-solid fa-minus op-minus"></i>'
		str +=	 '</div>'
		str += 	 '<div class="input-group mb-1 op_price">'
		str +=   	 '<div class="input-group-prepend">'
		str +=    	 '<span class="input-group-text">옵션 가격:</span>'
		str +=   	 '</div>'
		str +=   	 '<input type="text" class="form-control" name="op_price[]" placeholder="정수로 입력">'
		str +=	 '</div>'
		str += '</div>'
		str += '<div style="text-align: center;"><i class="fa-solid fa-plus op-plus"></i></div>'
		
		$(this).parents('.op-sub').append(str);
		$(this).remove();
		setNames()
	})
	$(document).on('click','.op-box>.btn', function(){
		if($(this).hasClass('op-save')){
			$(this).hide();
			$(this).siblings('.op-sub').find('i').hide();
			$(this).siblings('.op-update').show();
			$(this).parent().find('input').prop('readonly', true);
		}else if($(this).hasClass('op-update')){
			$(this).hide();
			$(this).siblings('.op-sub').find('i').show();
			$(this).siblings('.op-save').show();
			$(this).parent().find('input').prop('readonly', false);
		}else if($(this).hasClass('op-cancle'))
			$(this).parent().remove();
		setNames()
	});
	$(document).on('click','.op-fold', function(){
		$(this).parent().siblings('.op-sub').fadeToggle();
		$(this).parent().siblings('button').fadeOut();
		if($(this).hasClass('fol')){
			if($(this).siblings('input').prop('readonly'))
				$(this).parent().siblings('.op-update,.op-cancle').fadeIn();
			else
				$(this).parent().siblings('.op-save,.op-cancle').fadeIn();
			$(this).css('color', 'blue').removeClass('fol').text('접기');
		}
		else{
		$(this).css('color', 'green').addClass('fol').text('열기');
		}
	})
	$(document).on('click', '.op-minus', function(){
		$(this).parents('.sub-box').remove();
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
function setNames(){
	let ps_name = $('.ps_name').val();
	count_ps = $('.op-area').children('.op-box').length;
	count_op = $('.op-box').find('.op_price').length;
	for(let i = 0; i <= count_op; i++){
		for(let j = 0; j <= count_ps; j++){
			if($('.op_price').eq(i).parents('.op-box').index() != $('.op_price').eq(i-1).parents('.op-box').index()){
				$('.op_price').eq(i).parents('.op-box').children('.ps_name').children('.ps_name').attr('name', 'list['+i+'].ps_name');
				$('.op-box').eq(j).children('.ps_name').children('.ps_num').attr('value',j +1);
				$('.op_price').eq(i).parents('.op-box').children('.ps_name').children('.ps_num').attr('name', 'list['+i+'].ps_num');
			}
		}
		$('.op-box').find('.op_price').eq(i).children('input').attr('name', 'list['+i+'].op_price');
		$('.op-box').find('.op_title').eq(i).children('input').attr('name', 'list['+i+'].op_title');
	}
}
$('#sn').summernote({
	  placeholder: 'Hello Bootstrap 4',
	  tabsize: 2,
	  height: 400,
	//onImageUpload callback
	});
</script>
</body>
</html>
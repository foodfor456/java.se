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
.code {	margin-top: 10px; padding: 0; float: right; box-sizing: border-box; width: 40%;}
.check {
	margin-top: 10px; padding: 0; box-sizing: border-box;  width: 40%; float: left;
}
.themb-box-main>img{
	width: 100%; height: 100%;
}
.sub-box>img{
	width: 60px; height: 100%;
}
.themb-box-sub{	padding: 0 50px;}
.file-box>input{	line-height: 20px;}
.themb-box-main { border: 1px solid gray; width: 50%; height: 50%; display: inline-block;}
.themb-box-sub {	border: 1px solid gray;	width: 50%; height: 60px; }
.sub-box{display: inline-block;}
.fa-plus, .op-plus{ cursor: pointer; font-size: 20px;}
.file-box span{ float: right; cursor: pointer;}
.op-minus { margin: 5px; line-height: 1.7; cursor: pointer;}
</style>
</head>
<body>
<form class="container mt-4" action="<c:url value="/product/update"></c:url>" id="cl_category" method="post" enctype="multipart/form-data">
	<h1>제품 수정</h1>
	<div class="form-group wa-box">
		<c:if test="${pr.pr_waiting == 'Y'}">
			<span>대기 상태 : <input type="text" value="${wa.wp_state}"></span>
			<span>대기 일자 : <input type="text" value="${wa.wp_date_str}" readonly></span><br>
			<div class="wa_nt mt-3">
				<span>대기 사유 : </span>
				<textarea name="wp_note">${wa.wp_note}</textarea>
			</div>
			<button class="btn btn-outline-primary wa-stop"type="button">대기 해제</button>
		</c:if>
	</div>
	<div class="form-group header-box clearfix">
		<div class="category-box">
			<label>카테고리 :</label>
			<select class="form-control mb-3" id="cl_name" name="cl_name">
				<option value="0">대분류 카테고리</option>
				<c:set var="ch" value=""/>
				<c:forEach items="${ca}" var="c">
					<c:if test="${c.cl_name != ch}">
						<option value="${c.cl_num}" <c:if test="${cl_num.cl_num == c.cl_num}">selected</c:if>>${c.cl_name}</option>
					</c:if>
					<c:set var="ch" value="${c.cl_name}"/>
				</c:forEach>
			</select>
			<select class="form-control" id="cs_name" name="cs_name">
				<c:if test="${category.size() != 0}">
					<option value="0">소분류 카테고리</option>
					<c:forEach items="${category}" var="c">
						<option value="${c.cs_num}" <c:if test="${cl_num.cs_num == c.cs_num}">selected</c:if>>${c.cs_name}</option>
					</c:forEach>
				</c:if>
				<c:if test="${category.size() == 0}">
					<option value="0">등록된 카테고리가 없습니다.</option>
				</c:if>
			</select>
			<div class="form-check-inline mt-3 ml-2">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input fa_check" value="1" name="pr_check"<c:if test="${pr.pr_check == 1}">checked</c:if>>공방제품
			  </label>
			</div>
		</div>
		<div class="col-6 code">
		  <label>제품 코드 :</label>
		  <input type="text" class="form-control" readonly id="pr_code" name="pr_code" value="${pr.pr_code}">
		  <input type="hidden" class="form-control" name="pr_num" value="${pr.pr_code}">
		</div>
	</div>
	<div class="form-group mt-3">
	  <label>제목 :</label>
	  <input type="text" class="form-control" name="pr_title" value="${pr.pr_title}">
	</div>
	<div class="form-group themb-box clearfix">
		<div class="themb-box-main">
			<c:forEach items="${file}" var="fi" varStatus="i">
				<c:if test="${i.count == 1}">
					<img src="<c:url value="/thumb${fi.fi_name}"></c:url>" alt="사진이 없습니다">
				</c:if>	
			</c:forEach>
		</div>
		<div class="price-box">
			<label>수량 :</label>
	    <input type="text" class="form-control" value="${pr.pr_amount}" name="pr_amount">
	    <label class="mt-2">옵션 :</label><br>
			<button type="button" class="btn btn-outline-warning op-add mb-1">옵션 추가</button>
			<div class="op-area mt-2">
				<c:if test="${op != null || op.size() != 0}">
					<c:set var="ona" value=""/>
					<c:forEach items="${op}" var="opl">
						<c:if test="${opl.ps_name != ona}">
							<c:set var="ona" value="${opl.ps_name}"/>
							<div class="op-box mt-2">
								<div class="input-group mb-1 ps_name">
									<div class="input-group-prepend">
										<span class="input-group-text">선택 옵션 명:</span>
									</div>
									<input type="hidden" class="form-control ps_num" name="list[0].ps_num" value="${opl.ps_num}">
									<input type="text" class="form-control mr-1 ps_name" value="${opl.ps_name}" name="list[0].ps_name" placeholder="예)사이즈, 색상"><span class="op-fold" style="font-size: 15px; line-height: 2.5; color: blue; cursor: pointer">접기</span>
						    </div>
						    <div class="op-sub">
						      <c:forEach items="${op}" var="opp">
							    	<c:if test="${opp.ps_name == ona}">
								    	<div class="mb-1 sub-box" style="width: 100%;">
												<div class="input-group mb-1 op_title">
													<div class="input-group-prepend">
														<span class="input-group-text">옵션 이름:</span>
													</div>
													<input type="text" class="form-control" name="list[0].op_title" placeholder="예)S,M,L,ML" value="${opp.op_title}">
													<i data-sub="${opp.op_code}" class="fa-solid fa-minus op-minus op-default"></i>
												</div>
												<div class="input-group mb-1 op_price">
										  		<div class="input-group-prepend">
										 	 			<span class="input-group-text">옵션 가격:</span>
													</div>
													<input type="text" class="form-control" name="list[0].op_price" placeholder="정수로 입력" value="${opp.op_price}">
												</div>
											</div>
											
										</c:if>
									</c:forEach>
								</div>
								<button type="button" class="btn btn-outline-success op-save">등록</button>
								<button type="button" class="btn btn-outline-primary op-update" style="display: none;">수정</button>
								<button type="button" class="btn btn-outline-danger op-cancle">삭제</button>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
			</div>
	    
	    <label class="mt-5">가격 :</label>
			<input type="text" class="form-control" value="${pr.pr_price}" name="pr_price">
			<label class="mt-5">파일 :</label>
			<div class="file-box">
				<c:if test="${file.size() != 0}">
					<c:forEach var="fi" items="${file}">
						<div class="form-control">
							<a href="" id="pr_file">${fi.fi_ori_name}</a>
							<span class="file-delete" style="float: right; cursor: pointer;" data-fi_num="${fi.fi_num}" data-fi_code="${fi.fi_code}">X</span>
						</div>
					</c:forEach>
				</c:if>
				<c:forEach begin="1" end="${7-fileList.size()}">
					<input class="form-control" type="file" class="" id="pr_file" name="files">
				</c:forEach>
			</div>
		</div>
		<div class="themb-box-sub">
			<c:forEach items="${file}" var="fi" varStatus="i">
				<c:if test="${i.count != 1}">
					<div class="sub-box">
						<img src="<c:url value="/thumb${fi.fi_name}"></c:url>" alt="사진이 없습니다">
					</div>
				</c:if>	
			</c:forEach>
		</div>
	</div>
	<div class="form-group mt-3">
	  <label>내용 :</label>
	  <textarea class="form-control" id="sn" name="pr_content">${pr.pr_content}</textarea>
	</div>
	<button class="btn btn-outline-warning">수정 완료</button>
</form>
<script type="text/javascript">


$(function(){
	$('#cl_name').change(function(){
		$('#cs_name').children().remove();
		let cl_name = $('#cl_name option:selected').text();
		let cs_name = $('#cs_name option:selected').text();
		let str = '';
		let obj = {
			cl_name : cl_name
		};
	ajaxPost(false, obj, '/product/update/categoryL', function(data){
		if(data.cas.length != 0){
			str +=	'<select class="form-control" id="cs_name" name="cs_name">'
			str +=		'<option value="0">소분류 카테고리</option>'
			
				for(let cs of data.cas){
			str +=		'<option value="'+(cs.cs_num)+'">'+cs.cs_name+'</option>'
				}
			str +=	'</select>'
			}else{
				str +=	'<select class="form-control" id="cs_name" name="cs_name">'
				str +=	'<option value="0">등록된 카테고리가 없습니다.</option>'
				str +=	'</select>'
			}
			$('#cs_name').html(str);
				console.log(data);
		});
	})
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
				ajaxString(false, obj, '/product/update/categoryCode', function(data){
					$('#pr_code').val(data);
					console.log(data);
				}, null)
			}else
				$('#pr_code').val('');
		})
		let nums = '';
		let list = new Array();
		$(document).on('click', '.file-delete', function(){
			let fi_num = $(this).data('fi_num');
			let fi_code = $(this).data('fi_code');
			let str = '';
			$(this).parent().remove();
			str +=	'<input class="form-control" type="file" class="" id="pr_file" name="files">'
			str +=	'<input type="hidden" name="delFiles" value="'+fi_num+'">';
			$('.file-box').append(str);
			let obj = {
					fi_num : fi_num,
					fi_code : fi_code
			};
			ajaxPost(false, obj, '/product/update/files', function(data){
				let str = '';
				let strs = '';
				nums += fi_num;
				let i = 0;
				for(let files of data.fi){
					if(nums.indexOf(files.fi_num) == -1){
						if(i == 0){
							str += '<img src="<%=request.getContextPath()%>/thumb'+files.fi_name+'" alt="사진이 없습니다">';
							i++;
						}
						else{
							strs += '<div class="sub-box">';
							strs += 	'<img src="<%=request.getContextPath()%>/thumb'+files.fi_name+'" alt="사진이 없습니다">';
							strs += '</div>';
						}
					}
				}
				$('.themb-box-main').html(str);
				$('.themb-box-sub').html(strs);
			})
		})
	$(document).on('click','.wa-stop', function(){
		if(confirm('대기상태를 해제 하시겠습니까?')){
			let pr_code = $('#pr_code').val();
			let obj = {
				pr_code : pr_code
			};
			ajaxPost(false, obj, '/product/waiting/delete', function(data){
				if(data){
					alert('제품 대기가 해제 되었습니다.');
					$('.wa-box').html('');					
				}
				else
					alert('대기 해제가 실패하였습니다.');
			})
			return true;
		}
		else{
			return false;
		}
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
    str += 			'<div class="mb-1 sub-box" style="width: 100%;">'
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
		str += 			'<div style="text-align: center;"><i class="fa-solid fa-plus op-plus"></i></div>'
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
		str += '<div class="mb-1 sub-box" style="width: 100%;">'
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
	$('.op-sub').each(function(){
		$(this).append('<div style="text-align: center;"><i class="fa-solid fa-plus op-plus"></i></div>');
		$(this).find('.op-minus').first().remove();
	})
	$(document).on('click', '.op-default', function(){
		console.log(123);
		let op_num = $(this).data('sub');
		let str = '';
		str +=	'<input type="" name="nums" value="'+op_num+'">';
		$('.op-area').append(str);
	})
	setNames()
	
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
/* c:forEach script에서도 가능
let list = new Array();
<c:forEach items="${file}" var="fi">
	obj = {
			bd_num : `${fi.fi_ori_name}`
	};
	list.push(obj);
</c:forEach>
for(let ad of list)
	console.log(ad);
*/




</script>
</body>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
	<script src="https://kit.fontawesome.com/7a5abb87c2.js" crossorigin="anonymous"></script>
<style type="text/css">
.price-box{	float: right; width: 40%;}
.header-box{	position: relative;}
.code {	margin-top: 10px; padding: 0; float: right; box-sizing: border-box; width: 40%;}
.check {
	margin-top: 10px; padding: 0; box-sizing: border-box;  width: 40%; float: left;
}
.themb-box-main>img{width: 100%; height: 100%;}
.sub-box>img{width: 60px; height: 100%;}
.themb-box-sub{	padding: 0 50px;}
.themb-box-main { border: 1px solid gray; width: 50%; height: 50%; display: inline-block;}
.themb-box-sub {	border: 1px solid gray;	width: 50%; height: 60px;}
.sub-box{	display: inline-block;}
.wa_nt>span{ vertical-align: top;}
#pr_file{ display: none;}
.pr-calc{ text-align: center; font-size: 0;}
.pr-calc>*{
	margin: 10px; width: 30px; height: 30px; line-height: 2.1;
	vertical-align: top; text-align: center; display: inline-block;
	font-size: 15px;
	}
.pr-calc input{ padding: 0;}
.pr_cart{ font-size: 23px; color: grey; float: left; position: absolute; left: 30px; top: 12px;}
.buy-btn{ float: right;}
.cart-box,.buy-btn{ margin: 20px 5px; width: 212px; height: 50px; line-height: 2.2;}
.cart-box{ border: 1px solid grey; float: left;
	 padding: 6px 8px; border-radius: .25rem; text-align: center; position:relative;
	 cursor: pointer; color: #007bff;
   border-color: #007bff;
}
.cart-box:hover{ color: #fff; background-color: #007bff; border-color: #007bff;}
.cart-box:hover .pr_cart{ color: #fff;}
.clear-fix::after {
	display: block;
	content: '';
	line-height: 0;
	clear: both;
}
</style>
</head>
<body>
<div class="container mt-4">
	<h1>제품 정보</h1>
	<form class="wait-box" id="wait-box">
		<c:if test="${pr.pr_waiting == 'Y'}">
			<span>대기 상태 : <input type="text" value="${wa.wp_state}"></span>
			<span>대기 일자 : <input type="text" value="${wa.wp_date_str}"></span><br>
			<div class="wa_nt mt-3">
				<span>대기 사유 : </span>
				<textarea name="wp_note">${wa.wp_note}</textarea>
			</div>
			<button class="btn btn-outline-primary wa-stop"type="button">대기 해제</button>
		</c:if>
	</form>
	<div class="form-group header-box clearfix">
		<div class="category-box">
			<label>대분류 카테고리 :</label>
			<input class="form-control mb-3" readonly value="${ca.cl_name}">
			<label>소분류 카테고리 :</label>
			<input class="form-control mb-3" readonly value="${ca.cs_name}">
		</div>
		<div class="check">
		  <label>제품 형식:</label>
		   <input type="text" class="form-control mb-3 fa_check" readonly
		    value="<c:if test="${pr.pr_check == 1}">공방제품</c:if><c:if test="${pr.pr_check == 0}">일반제품</c:if>">
		</div>
		<div class="code">
		  <label>제품 코드 :</label>
		  <input type="text" class="form-control" id="pr_code" readonly value="${pr.pr_code}">
		</div>
	</div>
	<div class="form-group mt-3">
	  <label>제목 :</label>
	  <input type="text" class="form-control" readonly value="${pr.pr_title}">
	</div>
	<div class="form-group themb-box">
		<div class="themb-box-main">
			<c:forEach items="${file}" var="fi" varStatus="i">
				<c:if test="${i.count == 1}">
					<img src="<c:url value="/thumb${fi.fi_name}"></c:url>" alt="사진이 없습니다">
				</c:if>	
			</c:forEach>
		</div>
		<form class="price-box" action="<c:url value="/product/buy"></c:url>" method="post">
			<c:if test="${pr.pr_check == 1}">
				<label>수량 :</label>
		    <input type="text" class="form-control" readonly value="${pr.pr_amount}">
	    </c:if>
	    <input type="hidden" class="pr_amount form-control" readonly value="${pr.pr_amount}">
	    <c:if test="${op != null || op.size() != 0}">
		    <div class="form-group">
		    	<c:set var="ona" value=""/>
		    	<c:forEach items="${op}" var="opl">
		    		<c:if test="${opl.ps_name != ona}">
		    			<c:set var="ona" value="${opl.ps_name}"/>
		    		  <label for="sel1">옵션 : ${opl.ps_name}</label>
						  <select class="form-control op-box" id="sel1">
						  	<option value="0" data-title="${opl.ps_name}">${opl.ps_name}</option>
						  	<c:forEach items="${op}" var="opp">
						  		<c:if test="${opp.ps_name == ona}">
						  			<c:if test="${opp.op_price == null}">
						  				<option value="0" data-code="${opp.op_code}" data-title="${opp.op_title}">${opp.op_title}</option>
						  			</c:if>
						  			<c:if test="${opp.op_price != null}">
						  				<option value="${opp.op_price}" data-code="${opp.op_code}" data-title="${opp.op_title}">${opp.op_title}  + ${opp.op_price_str}</option>
						  			</c:if>
						  		</c:if>
						  	</c:forEach>
						  </select>
			    	</c:if>
					</c:forEach>
				</div>
			</c:if>
			<div class="buy-box">
				<div class="buy-price">
			    <div class="buy-option mb-3">
			    </div>
			    <div class="pr-calc" >
			    <button type="button" class="am-minus"><i class="fa-solid fa-minus"></i></button>
		    	<input type="text" class="am-calc" name="list[0].pr_amount" value="1">
			    <button type="button" class="am-plus"><i class="fa-solid fa-plus"></i></button>
			    </div>
			    <label class="mt-2">가격 :</label>
			    <input type="text" class="form-control pr_price" readonly value="${pr.pr_price_str}">
			    <input type="hidden" class="pr_ori_price" name="list[0].pr_price" value="${pr.pr_price}">
			  </div>
				<div class="cart-box clear-fix"><i class="fa-solid fa-cart-shopping pr_cart"></i>장바구니</div>
				<div class="option-box">
				</div>
				<input type="hidden" class="ca_op_name" name="list[0].ca_op_name">
				<input type="hidden" class="pr_code" name="list[0].pr_code" value="${pr.pr_code}">
				<input type="hidden" name="list[0].pr_title" value="${pr.pr_title}">
				<button class="btn btn-outline-success buy-btn">구매하기</button>
			</div>
		</form>
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
	  <div class="form-control" style="height: auto; min-height: 300px;">${pr.pr_content}</div>
	</div>
	<a class="btn btn-outline-warning" href="<c:url value="/product/update?pr_code=${pr.pr_code}"></c:url>">제품 수정</a>
	<c:if test="${pr.pr_waiting == 'N'}">
		<button class="btn btn-outline-warning wa-wait" type="button">제품대기로</button>
	</c:if>
</div>
<script type="text/javascript">
$(function(){
	$('#wait-box').validate({
	  rules: {
		  wp_state: {
	      required : true,
	      maxlength : 5,
	    },
	    wp_note: {
	      required : true,
	      minlength : 5,
		  }
	  },
	  //규칙체크 실패시 출력될 메시지
	  messages : {
		  wp_state: {
	      required : "필수로 입력하세요",
	      maxlength : "최대 5글자 입니다.",
	    },
	    wp_note: {
	      required : "필수로 입력하세요",
	      minlength : "최소 5글자이상 입력해주세요.",
			}
	  },
	  submitHandler: function(form){
		  let pr_code = $('.pr_code').val();
			let wp_state = $('#wp_state').val();
			let wp_note = $('#wp_note').val();
			let obj = {
				wp_pr_code : pr_code,
				wp_state : wp_state,
				wp_note : wp_note
			};
			ajaxPost(false, obj, '/product/waiting/insert', function(data){
				if(data){
					alert('제품이 대기상태로 등록되었습니다.');
					location.href = '<%=request.getContextPath()%>/product/select?pr_code='+pr_code
				}
				else
					alert('대기 등록에 실패했습니다.');
				console.log(data);
			})
   	}
	});
	$('.wa-wait').click(function(){
		let str = '';
		str +=		'<span>대기 상태 : <input type="text" id="wp_state" name="wp_state"></span>'
		str +=		'<div class="wa_nt mt-3">'
		str +=			'<span>대기 사유 : </span>'
		str +=			'<textarea id="wp_note" name="wp_note"></textarea>'
		str +=		'</div>'
		str +=		'<button class="btn btn-outline-warning wa-insert">제품대기로</button>'
		$('.wait-box').html(str);
		$('#wp_state').focus();
	})
	/*
	$(document).on('click','.wa-insert', function(){
		let pr_code = $('.pr_code').val();
		let wp_state = $('#wp_state').val();
		let wp_note = $('#wp_note').val();
		let obj = {
			wp_pr_code : pr_code,
			wp_state : wp_state,
			wp_note : wp_note
		};
		ajaxPost(false, obj, '/product/waiting/insert', function(data){
			if(data){
				alert('제품이 대기상태로 등록되었습니다.');
				location.href = '<%=request.getContextPath()%>/product/select?pr_code='+pr_code
			}
			else
				alert('대기 등록에 실패했습니다.');
			console.log(data);
		})
	})*/
	$(document).on('click','.wa-stop', function(){
		if(confirm('대기상태를 해제 하시겠습니까?')){
			let pr_code = $('.pr_code').val();
			let obj = {
				pr_code : pr_code
			};
			ajaxPost(false, obj, '/product/waiting/delete', function(data){
				if(data){
					alert('제품 대기가 해제 되었습니다.');
					$('.wait-box').html('');
					location.href = '<%=request.getContextPath()%>/product/select?pr_code='+pr_code
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
	let pr_price = parseInt($('.pr_ori_price').val());
	$(document).on('change','.op-box', function(){
		let op_price = 0;
		let str = '';
		let op_str = '';
		let i = 1;
		$('.op-box').each(function(){
			op_price += parseInt($(this).val());
			$(this).children().each(function(){
				if($(this).prop('selected') && $(this).index() != 0){
					op_str += '<input type="hidden" class="op_code" name="op_code" value="'+$(this).data('code')+'">'
					//$(this).data('title');
					str += '<span class="mr-3">옵션'+i+' : '+$(this).parent().children().first().data('title')+'\u00a0';
					str += $(this).text()+'\u00a0</span><br>';
					str += '<input type="hidden" name="op_info" value="옵션'+i+' : '+$(this).parent().children().first().data('title')+'\u00a0'+$(this).text()+'">'
					i++;
				}
			})
		});
		$('.op-info').text(op_str);
		$('.option-box').html(op_str);
		$('.buy-option').html(str);
		let am_calc = parseInt($('.am-calc').val());
		let totalPrice = (op_price + pr_price) * am_calc;
		$('.pr_ori_price').val(totalPrice);
		$('.pr_price').val(totalPrice.toLocaleString() + ' 원');
		opSetName()
	})
	$(document).on('click','.pr-calc>button',function(){
		let am_calc = parseInt($('.am-calc').val());
		if($(this).hasClass('am-minus') && am_calc > 1){
			am_calc--;
		}else if($(this).hasClass('am-plus')){
			am_calc++;
			if(parseInt($('.pr_amount').val()) <= parseInt($('.am-calc').val())){
				alert('제품 남은 수량 : ' + $('.pr_amount').val());
				am_calc = parseInt($('.pr_amount').val());
			}
		}
		$('.am-calc').val(am_calc);
		let op_price = 0;
		$('.op-box').each(function(){
			op_price += parseInt($(this).val());
		});
		let totalPrice = (op_price + pr_price) * am_calc;
		$('.pr_ori_price').val(totalPrice);
		$('.pr_price').val(totalPrice.toLocaleString() + ' 원');
		
	})
	$(document).on('click', '.cart-box', function(){
		let str = '';
		$('.buy-option>span').each(function(){
			str += $(this).text();
			if($('.buy-option>span:last').index() != $(this).index())
			str += '<br>'
		})
		let pr_price = $('.pr_ori_price').val();
		let obj = {
			ca_pr_code : $('.pr_code').val(),
			ca_amount : $('.am-calc').val(),
			ca_op_name : str,
			ca_pr_price : pr_price
		}
		ajaxPost(false, obj, '/ajax/buy/cart', function(data){
			if(data){
				if(confirm('장바구니에 담았습니다. 장바구니로 이동하시겠습니까?'))
					location.href = '<%=request.getContextPath()%>/buy/cart';
			}else
				alert('장바구니에 담는데 실패하였습니다. 수량을 확인해주세요');
		})
	})
	$(document).on('change','.am-calc', function(){
		let am_calc = 0;
		if(parseInt($('.pr_amount').val()) <= parseInt($('.am-calc').val())){
			alert('제품 남은 수량 : ' + $('.pr_amount').val());
			am_calc = parseInt($('.pr_amount').val());
		}else{
		  am_calc = parseInt($('.am-calc').val());
		}
		$('.am-calc').val(am_calc);
		let op_price = 0;
		$('.op-box').each(function(){
			op_price += parseInt($(this).val());
		});
		let totalPrice = (op_price + pr_price) * am_calc;
		$('.pr_ori_price').val(totalPrice);
		$('.pr_price').val(totalPrice.toLocaleString() + ' 원');
		console.log($('.pr_price').val());
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
function opSetName(){
	let str = '';
	$('.buy-option>span').each(function(){
		str += $(this).text();
		if($('.buy-option>span:last').index() != $(this).index())
		str += '<br>'
	})
	$('.ca_op_name').val(str);
}
</script>
</body>
</html>
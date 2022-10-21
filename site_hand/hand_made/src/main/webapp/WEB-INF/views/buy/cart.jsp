<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/7a5abb87c2.js" crossorigin="anonymous"></script>
<style type="text/css">
ul,li{ list-style: none; padding: 0; margin: 0;}
.pr-calc{ text-align: center; font-size: 0;}
.pr-calc>*{
	margin: 10px; width: 25px; height: 25px; line-height: 2.1;
	vertical-align: top; display: inline-block; text-align: center;
	font-size: 12px;
	}
.buy-product{
	width: 800px; margin-bottom: 16px; background-color: #fff;
	height: auto; border-radius: 8px; border: 1px solid #e0e0e0;
	padding:30px;  position: relative;
}
.cart-total{ position: relative; width: 350px; border-radius: 8px; border: 1px solid #000;
	box-sizing: border-box; text-align: center; padding: 20px;
}
.cart-head{ border-bottom: 1px solid #000; width: 80%; margin: 15px auto; font-size: 18px;}

.cart-list,.cart-total{ display: inline-block;}
.cart-list{ float: left; margin-right: 14px;}
.buy-product>*{ display: inline-block;}
.item-price{ float: right; font-size: 18px; font-weight: bold; line-height: 6;}
.buy-amount{ position: absolute; right: 200px; top: 40px;}
.buy-pr-info{ margin-left: 20px;}
.pr_title{ font-size: 20px; position: absolute; top: 30px;}
.pr_op{ position: absolute; bottom: 20px; }
.cart-cancle{position: absolute; top: 15px; right: 10px;
	height: 25px; width: 25px; border: 0; background-color: #fff; padding: 0;
	}
.cart-check{position: absolute; top: 10px; left: 10px; z-index: 1; width: 20px;
    height: 20px; margin-top: 0 !important;}
.cart-all{ margin: 20px 0;}
.buy-price nav:nth-child(1){
	float: left;
}
.buy-price nav:nth-child(2){
	float: right;
}
.buy-price>div{ margin: 20px;}
.clear-fix::after {
	display: block;
	content: '';
	line-height: 0;
	clear: both;
}
.cart-container{width: 1200px; margin: 30px auto;}
</style>
</head>
<body>
<form class="cart-container clear-fix" method="post" action="<c:url value="/product/buy"></c:url>">
	<h3>장바구니</h3>
	<c:if test="${!empty list}">
		<div class="buy-head">
			<button type="button" class="btn btn-outline-primary cart-all">전체선택</button>
			<button type="button" class="btn btn-outline-primary select-del">선택삭제</button>
		</div>
		<div class="cart-list">
			<ul>
				<c:forEach items="${list}" var="buy">
					<li class="buy-product">
						<input type="checkbox" class="cart-check">
						<div class="buy-themb">
							<a data-finame="${buy.fi_name}" href="<c:url value="/product/select?pr_code=${buy.ca_pr_code}"></c:url>"><img class="themb-img" src="<c:url value="/thumb${buy.fi_name}"></c:url>" alt="사진이 없습니다" width="120" height="120"></a>
						</div>
						<div class="buy-pr-info">
							<a class="pr_title" href="<c:url value="/product/select?pr_code=${buy.ca_pr_code}"></c:url>">${buy.ca_pr_title}</a>
							<div class="pr_op">
								<p>
									${buy.ca_op_name}
								</p>
							</div>
						</div>
						<div class="item-price">
							<span class="price-str">${buy.ca_pr_price_str}</span>
						</div>
						<div class="buy-amount clear-fix">
							<span>수량 : </span>
							<div class="pr-calc" >
						    <button type="button" class="am-minus"><i class="fa-solid fa-minus"></i></button>
					    	<input type="text" class="am-calc pr_amount" name="pr_amount" value="${buy.ca_amount}">
						    <button type="button" class="am-plus"><i class="fa-solid fa-plus"></i></button>
						  </div>
					  </div>
					  <button class="cart-cancle" type="button"><i class="fa-solid fa-xmark"></i></button>
					  <div class="input-box">
						  <input name="fi_name" type="hidden" class="fi_name" value="${buy.fi_name}">
						  <input name="pr_price" type="hidden" class="pr_price" data-ori="${(buy.ca_pr_price/buy.ca_amount)}" value="${buy.ca_pr_price}">
						  <input name="pr_code" type="hidden" class="pr_code" value="${buy.ca_pr_code}">
						  <input name="pr_title" type="hidden" class="pr_title" value="${buy.ca_pr_title}">
						  <input name="pr_amount" type="hidden" class="buy_amount" value="${buy.ca_amount}">
						  <input name="ca_op_name" type="hidden" class="ca_op_name" value="${buy.ca_op_name}">
						  <input name="ca_num" type="hidden" class="ca_num" value="${buy.ca_num}">
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div class="cart-total">
			<div class="cart-head">
				<strong>결제정보</strong>
			</div>
			<div class="buy-price clear-fix">
				<div class="clear-fix sel-box">
					<span>선택상품 수</span>
					<span class="sp-sel">0 개</span>
				</div>
				<div class="clear-fix price-box">
					<span>상품 가격</span>
					<span class="sp-price">0 원</span>
				</div>
				<input type="hidden" class="me_id" value="${user.me_id}">
			</div>
			<button class="btn btn-outline-success col-12">결제하기</button>
		</div>
	</c:if>
</form>
</body>
<script>
$(function(){
	$(document).on('submit', 'form', function(){
		$('.cart-check').each(function(){
			if($(this).prop('checked') == false){
				$(this).siblings('.input-box').remove();
			}
		})
		setNames()
		return true;
	})
	$('.cart-cancle').click(function(){
		if(confirm('해당 상품을 삭제하시겠습니까?')){
			let obj = {ca_num : $(this).siblings('.input-box').children('.ca_num').val()}
			ajaxPost(false, obj, '/ajax/cart/cancle', function(data){
				location.href = '<%=request.getContextPath()%>/buy/cart';
			})
		}
		else
			location.href = '<%=request.getContextPath()%>/buy/cart';
		priceCalc()
	})
	$('.cart-check').click(function(){
		if($('.cart-check:checked').length == $('.cart-check').length){
			$('.cart-all').text('선택해제');
			$('.cart-all').addClass('active');
		}else{
			$('.cart-all').text('전체선택');
			$('.cart-all').removeClass('active');
		}
	})
	$('.cart-all').click(function(){
		if($(this).hasClass('active')){
			$('.cart-check').each(function(){
				$(this).prop('checked', false);
			})
			$('.cart-all').text('전체선택');
			$('.cart-all').removeClass('active');
		}
		else{
			$('.cart-check').each(function(){
				$(this).prop('checked', true);
			})
			$('.cart-all').text('선택해제');
			$('.cart-all').addClass('active');
		}
		priceCalc()
	})
	$('.select-del').click(function(){
		let ca_num = [];
		if($('.cart-check:checked').length >= 1){
			if(confirm('상품을 삭제 하시겠습니까?')){
				$('.cart-check').each(function(){
					if($(this).prop('checked'))
						ca_num.push($(this).siblings('.input-box').children('.ca_num').val());
				})
				let obj = ca_num;
				ajaxPost(false, obj, '/ajax/cart/select/cancle', function(data){
					location.href = '<%=request.getContextPath()%>/buy/cart';
					priceCalc()
				})
			}else{
				location.href = '<%=request.getContextPath()%>/buy/cart';
			}
		}
	})
	$(document).on('change', '.cart-check', function(){
		priceCalc()
	})
	$(document).on('click', '.pr-calc>button', function(){
		let pr_price = parseInt($(this).parents('.buy-amount').siblings('.input-box').children('.pr_price').data('ori'));
		let pr_amount = parseInt($(this).siblings('.pr_amount').val());
		if($(this).hasClass('am-minus'))
			pr_amount = pr_amount-1
		else
			pr_amount = pr_amount+1
		$(this).siblings('.pr_amount').val(pr_amount);
		$(this).parents('.buy-amount').siblings('.input-box').children('.buy_amount').val(pr_amount);
		$(this).parents('.buy-amount').siblings('.input-box').children('.pr_price').val(pr_price * pr_amount);
		let totalPrice = parseInt($(this).parents('.buy-amount').siblings('.input-box').children('.pr_price').val());
		$(this).parents('.buy-amount').siblings('.item-price').children('span').text(totalPrice.toLocaleString() + ' 원');
		priceCalc()
		setNames()
	})
	$('.pr_amount').change(function(){
		let pr_amount = $(this).val();
		$(this).parents('.buy-amount').siblings('.input-box').children('.buy_amount').val(pr_amount);
		let pr_price = parseInt($(this).parents('.buy-amount').siblings('.input-box').children('.pr_price').data('ori'));
		$(this).parents('.buy-amount').siblings('.input-box').children('.pr_price').val(pr_price * pr_amount);
		let totalPrice = parseInt($(this).parents('.buy-amount').siblings('.input-box').children('.pr_price').val());
		$(this).parents('.buy-amount').siblings('.item-price').children('span').text(totalPrice.toLocaleString() + ' 원');
		priceCalc()
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
}
function ajaxString(async, dataObj, url, success, dataType){
	$.ajax({
	  async: async,
	  type:'POST',
	  data:dataObj,
	  dataType:dataType,
	  url:"<%=request.getContextPath()%>"+url,
	  success : function(data){
		  success(data);
	  }
	})
}
function priceCalc(){
	let str = 0;
	$('.cart-check').each(function(){
		if($(this).prop('checked'))
			str += parseInt($(this).siblings('.input-box').children('.pr_price').val());
	})
	let ch = $('.cart-check:checked').length;
	$('.sp-sel').text(ch+' 개');
	$('.sp-price').text(str.toLocaleString() + ' 원');
}
function setNames(){
	let i = 0;
	$('.input-box').each(function(){
		$(this).children('.fi_name').attr('name', 'list['+i+'].fi_name');
		$(this).children('.pr_price').attr('name', 'list['+i+'].pr_price');
		$(this).children('.pr_code').attr('name', 'list['+i+'].pr_code');
		$(this).children('.pr_title').attr('name', 'list['+i+'].pr_title');
		$(this).children('.buy_amount').attr('name', 'list['+i+'].pr_amount');
		$(this).children('.ca_op_name').attr('name', 'list['+i+'].ca_op_name');
		$(this).children('.ca_num').attr('name', 'list['+i+'].ca_num');
		i++;	
	})
}
</script>
</html>
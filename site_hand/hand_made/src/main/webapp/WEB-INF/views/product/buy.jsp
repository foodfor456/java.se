<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://kit.fontawesome.com/7a5abb87c2.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style type="text/css">
ul,li{ list-style: none; padding: 0; margin: 0;}
.post>[type=text]{
	margin-top : 5px; text-align: left; padding-left: 10px;
}
.buy-left{
	float: left; width: 700px; border: 1px solid black; padding: 30px; border-radius: 8px;
}
.buy-right{
	float: right; width: 470px; border: 1px solid black; padding: 30px; border-radius: 8px;
}
.buy-box { width: 1200px; margin: 0 auto;}
.buy-title { margin: 30px auto; width: 1200px;}
.buy-head { border-bottom: 1px solid black;}
.buy-themb { width: 90px; height: 90px; position: absolute; top: 0; left: 0;}
.buy-themb>a{ width: 100%; height: 100%;}
.themb-img{ border-radius: 8px;}
.buy-product{ position: relative; padding-left: 110px; border-bottom: 1px solid black;
 padding-bottom: 20px; min-height: 100px; margin-top: 20px;}
.buy-pr-info{ font-size: 25px;}
.buy-price{ font-size: 25px; text-align: center; margin: 30px 0;}
.btn-pay{ height: 50px; font-size: 30px; line-height: 1; margin-top: 30px;}
.pr-calc{ text-align: center; font-size: 0;}
.pr-calc>*{
	margin: 10px; width: 25px; height: 25px; line-height: 2.1;
	vertical-align: top; display: inline-block; text-align: center;
	font-size: 12px;
	}
.sp-title{ float: left;}
.sp-price{ float: right;}
.buy-amount>span{ font-size: 20px; float: left; line-height: 2;}
.buy-amount{ margin: 10px 0;}
.buy-amount>div{ float: right;}
.clear-fix::after {
	display: block;
	content: '';
	line-height: 0;
	clear: both;
}
.me_addr_detail,.me_addr{ width: 100%;}
.post>input{ border: 1px solid #ced4da; border-radius: .25rem; 
	transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
.post>input:focus{ color: #495057; background-color: #fff; border-color: #80bdff; outline: 0;
	box-shadow: 0 0 0 0.2rem rgb(0 123 255 / 25%);}
.buy-left input { height: calc(1.2em + .75rem + 2px);}
.pr_price_view{ font-size: 20px; float: right; }
</style>
</head>
<body>
<form class="clearfix container-box add-vali">
	<h2 class="buy-title">결제하기</h2>
	<div class="buy-box">
		<div class="buy-left">
			<h2>주소 정보</h2>
			<div class="form-group">
			  <label>보내는분 성함</label>
			  <input <c:if test="${user.me_name != null}">value="${user.me_name}"</c:if> type="text" class="form-control col-6 me_name" name="me_name" id="me_name">
			</div>
			<div class="form-group">
			  <label>받는분 성함</label>
			  <input type="text" class="form-control col-6 to_name" name="to_name" id="to_name">
			</div>
			<div class="form-group post">
		  	<label>주소</label><br>
			  <input <c:if test="${user.me_post != null}">value="${user.me_post}"</c:if> type="text" id="sample4_postcode" class="me_post" placeholder="우편번호" readonly class="col-2" name="ad_post">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<input <c:if test="${user.me_addr != null}">value="${user.me_addr}"</c:if> type="text" id="sample4_roadAddress" class="me_addr" placeholder="도로명주소" readonly class="col-6" name="ad_addr"><br>
				<span id="guide" style="color:#999;display:none"></span>
				<input value="<c:if test="${user.me_addr_detail != null}">${user.me_addr_detail}</c:if>" type="text" id="sample4_detailAddress" class="me_addr_detail" placeholder="상세주소" name="ad_addr_detail">
			</div>
			<div class="form-group">
			  <label>받는분 연락처</label>
			  <input <c:if test="${user.me_phon != null}">value="${user.me_phon}"</c:if> type="text" class="form-control col-6" name="me_phon" id="me_phon" placeholder="-제외 입력해주세요">
			</div>
			<div class="form-group">
			  <label>배송시 요청사항</label>
			  <input type="text" class="form-control col-6" name="bu_request" id="bu_request">
			</div>
		</div>
		<div class="buy-right">
			<div class="buy-head">
				<h3>주문 상품</h3>
			</div>
			<ul>
				<c:forEach items="${list}" var="buy" varStatus="am">
					<li class="buy-product clear-fix">
						<div class="buy-themb">
							<a href="<c:url value="/product/select?pr_code=${buy.pr_code}"></c:url>"><img class="themb-img" src="<c:url value="/thumb${buy.fi_name}"></c:url>" alt="사진이 없습니다" width="90" height="90"></a>
						</div>
						<div class="buy-pr-info">
							<a class="pr_title" href="<c:url value="/product/select?pr_code=${buy.pr_code}"></c:url>">${buy.pr_title}</a>
						</div>
						<div class="buy-pr-option">
							<p>
								${buy.ca_op_name}
							</p>
							<input type="hidden" class="op_name" value="${buy.ca_op_name}">
						</div>
						<div class="buy-amount clear-fix">
							<span>수량 : </span>
							<div class="pr-calc" >
						    <button type="button" class="am-minus"><i class="fa-solid fa-minus"></i></button>
					    	<input type="text" class="am-calc pr_amount" data-amount="${amount[am.count-1]}" name="pr_amount" value="${buy.pr_amount}">
						    <button type="button" class="am-plus"><i class="fa-solid fa-plus"></i></button>
						  </div>
					  </div>
					  <input type="hidden" data-ori="${buy.pr_price/buy.pr_amount}" class="pr_price" value="${buy.pr_price}">
					  <span class="pr_price_view">${buy.pr_price_str}</span>
						<input type="hidden" class="pr_code" value="${buy.pr_code}">
						<input type="hidden" name="ca_num" class="ca_num" value="${buy.ca_num}">
					</li>
				</c:forEach>
			</ul>
			<div class="buy-price clear-fix">
				<span class="sp-title">상품 가격 : </span>
				<span class="sp-price"></span>
				<input type="hidden" class="me_id" value="${user.me_id}">
			</div>
			<button class="btn btn-primary col-12 btn-pay">결제 하기</button>
		</div>
	</div>
	
</form>
</body>
<script type="text/javascript">
$(function(){
	
	$(".add-vali").validate({
	  rules: {
	    me_name: {
	      required : true,
	      maxlength : 15
	    },
	    to_name: {
	      required : true,
	      maxlength : 15
	    },
	    ad_post: {
		    required : true
		  },
		  ad_addr: {
		  	required : true
		  },
		  me_phon: {
		    required : true,
		    regex: /^\d{2,3}\d{3,4}\d{4}$|^0(?=\w{1,11}$)\w*(\d)\w*$/
		  }
	  },
	  //규칙체크 실패시 출력될 메시지
	  messages : {
		  me_name: {
	      required : "필수로 입력하세요",
	      maxlength : "15자 이하로 작성하세요"
	    },
	    to_name: {
	      required : "필수로 입력하세요",
	      maxlength : "15자 이하로 작성하세요"
	    },
	    ad_post: {
		    required : "우편번호 찾기를 이용해주세요"
		  },
		  ad_addr: {
		  	required : "우편번호 찾기를 이용해주세요"
		  },
		  me_phon: {
		    required : "필수로 입력하세요",
		    regex: "올바른 연락처를 입력해주세요"
		  }
	  },
	  submitHandler: function(form){
		  let pr_amount = $('.am-calc').val();
			let pr_code = $('.pr_code').val();
			let am_calc = 0;
			$('.pr_amount').each(function(){
				if(parseInt($('.pr_amount').val()) < parseInt($('.am-calc').val())){
					alert('제품 남은 수량 : ' + $(this).data('amount'));
					am_calc = parseInt($(this).data('amount'));
				}else{
				  am_calc = parseInt($(this).val());
				}
				$(this).val(am_calc);
			})
			let objs = {
				ad_to : $('#to_name').val(),
				ad_phon : $('#me_phon').val(),
				ad_post : $('.me_post').val(),
				ad_addr : $('.me_addr').val(),
				ad_addr_detail : $('.me_addr_detail').val(),
				bu_request : $('#bu_request').val(),
				bu_me_id : $('.me_id').val(),
				bu_me_name : $('.me_name').val(),
				pr_code : pr_code
			};
			ajaxPost(false, objs, '/ajax/product/buy', function(data){
				let bu_code = data.order_num;
				let str = '<input type="hidden" class="bu_code" value="'+bu_code+'">';
				$('.buy-price').append(str);
				if(data.res){
					alert('해당 제품은 이미 품절되었습니다.');
					return false;
				}	
				requestPay(data.bu_code);
			})
			return false;
		}
	});
	
})
$.validator.addMethod(
		"regex",
		function(value, element, regexp) {
		  var re = new RegExp(regexp);
		  return this.optional(element) || re.test(value);
		},
		"Please check your input."
	);
$(document).on('click','.pr-calc>button',function(){
	let pr_price = parseInt($(this).parents('.buy-amount').siblings('.pr_price').data('ori'));
	let am_calc = parseInt($(this).siblings('.am-calc').val());
	if($(this).hasClass('am-minus') && am_calc > 1){
		am_calc--;
	}else if($(this).hasClass('am-plus')){
		am_calc++;
		if(am_calc >= parseInt($(this).siblings('.am-calc').data('amount'))){
			alert('제품 남은 수량 : ' + $('.pr_amount').val());
			am_calc = parseInt($(this).siblings('.am-calc').data('amount'));;
		}
	}
	$(this).siblings('.am-calc').val(am_calc);
	let totalPrice = pr_price * am_calc;
	$(this).parents('.buy-amount').siblings('.pr_price').val(totalPrice);
	$(this).parents('.buy-amount').siblings('.pr_price_view').text(totalPrice.toLocaleString() + ' 원');
	totalPriceSet()
})
$(document).on('change','.am-calc', function(){
	let am_calc = 0;
	let pr_price = parseInt($(this).parents('.buy-amount').siblings('.pr_price').data('ori'));
	if(parseInt($('.pr_amount').val()) <= parseInt($('.am-calc').val())){
		alert('제품 남은 수량 : ' + $(this).data('amount'));
		am_calc = parseInt($(this).data('amount'));
	}else{
	  am_calc = parseInt($(this).val());
	}
	$(this).val(am_calc);
	let totalPrice = pr_price * am_calc;
	$(this).parents('.buy-amount').siblings('.pr_price').val(totalPrice.toLocaleString() + ' 원');
	totalPriceSet()
})

	totalPriceSet()

function requestPay(order_num) {
	var IMP = window.IMP; // 생략 가능
	IMP.init('imp00476817'); // 예: imp00000000
  // IMP.request_pay(param, callback) 결제창 호출
  let pr_title = $('.pr_title').first().text();
		  if($('.pr_title').length != 1)
		  	 pr_title += ' 외 ' + parseInt($('.pr_title').length -1) + ' 건';
	let price = 0;
		$('.pr_price').each(function(){
			price += parseInt($(this).val());
		})
  IMP.request_pay({ // param
    pg: "kcp",
    pay_method: "card",
    merchant_uid: order_num,
    name: pr_title,
    amount: price,
    buyer_email: "foodfor456@naver.com",
    buyer_name: $('.to_name').val(),
    buyer_tel: $('.me_phon').val(),
    buyer_addr: $('.me_addr').val(),
    buyer_postcode: $('.me_post').val()
  },function (rsp) { // callback
	    if (rsp.success) {
	    	let list = [];
				$('.buy-product').each(function(){
					let obj = {
		   			by_amount : $(this).find('.pr_amount').val(),
		   			by_price : $(this).find('.pr_price').val(),
		   			by_op_name : $(this).find('.op_name').val().trim(),
		   			by_bu_code : $('.bu_code').val(),
		   			by_pr_code : $(this).find('.pr_code').val(),
		   			ca_num : $(this).find('.ca_num').val()
		   		};
					list.push(obj);
				})
   	  	ajaxPost(false, list, '/ajax/product/buySuccess', function(data){
   	  		alert('결재가 완료되었습니다.')
		    	location.href='<%=request.getContextPath()%>/product/buysuccess?bu_code='+$('.bu_code').val()
   	  	})
	    // 결제 성공 시 로직,
	    }else{
	    	alert('결재가 실패하였습니다.' + rsp.error_msg);
	    }
  });
}

function sample4_execDaumPostcode() {
	new daum.Postcode({
	  oncomplete: function(data) {
	    var roadAddr = data.roadAddress; // 도로명 주소 변수
	    var extraRoadAddr = ''; // 참고 항목 변수
	
	    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
      	extraRoadAddr += data.bname;
	    }
	    if(data.buildingName !== '' && data.apartment === 'Y'){
      	extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	    }
	    if(extraRoadAddr !== ''){
      	extraRoadAddr = ' (' + extraRoadAddr + ')';
	    }
	    document.getElementById('sample4_postcode').value = data.zonecode;
	    document.getElementById("sample4_roadAddress").value = roadAddr;
	    var guideTextBox = document.getElementById("guide");
	    if(data.autoRoadAddress) {
	      var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	      guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	      guideTextBox.style.display = 'block';
	    } else {
	      guideTextBox.innerHTML = '';
	      guideTextBox.style.display = 'none';
	    }
	  }
	}).open();
}
function totalPriceSet(){
	let price = 0;
	$('.pr_price').each(function(){
		price += parseInt($(this).val());
	})
	$('.sp-price').text(price.toLocaleString() + ' 원');
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
	  },error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
	})
};
function ajaxPost(async, dataObj, url, success){
	$.ajax({
	  async: async,
	  type:'POST',
	  data:JSON.stringify(dataObj),
	  url:'<%=request.getContextPath()%>'+url,
	  dataType:"json",
	  contentType:"application/json; charset=UTF-8",
	  success : function(data){
		  success(data);
		}
	})
}


</script>
</html>
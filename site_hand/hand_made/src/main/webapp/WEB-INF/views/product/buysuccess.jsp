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
 h2,h4{ margin: 30px 0;}
 .success-view{ text-align: center;}
 .success-view,.buy-info,.product-reco { width: 100%; border-top: 1px solid #000;
  padding: 30px;}
 .info-box{ position: relative;}
 .fa-circle-check { font-size: 50px;}
 .success-box>div{ margin: 30px 0;}
 .success-box>span{ font-size: 30px;}
 .info-box>div{ display: inline-block; vertical-align: top;}
 .info-box>div:nth-child(2n){ position: absolute; left: 150px; top: 0;}
 .clear-fix::after {
	display: block;
	content: '';
	line-height: 0;
	clear: both;
}
</style>
</head>
<body>
	<div class="container">
		<h2>결제 성공</h2>
		<div class="success-view">
			<div class="success-box">
				<div><i class="fa-regular fa-circle-check"></i></div>
				<span>${res.bu_me_name} 님, 주문이 완료되었습니다.</span><br>
				<div><button type="button" class="btn btn-outline-primary buy-select col-6">주문 상세 조회</button></div>
			</div>
		</div>
		<h2>주문 정보</h2>
		<div class="buy-info clear-fix mb-5">
			<div class="info-box"><div>주문 번호</div><div>${res.bu_code}</div></div>
			<div class="info-box"><div>주문 상품</div><div>${pr.pr_title}</div></div>
			<div class="info-box">
				<div>배송지</div>
				<div>
					<div>${addr.ad_to}</div>
					<div>(${addr.ad_post}) ${addr.ad_addr} <c:if test="${addr.ad_addr_detail != null}">${addr.ad_addr_detail}</c:if></div>
					<div>${addr.ad_phon}</div>
				</div>
			</div>
		</div>
		<h4>${res.bu_me_name} 님, 이 상품은 어때요?</h4>
		<div class="product-reco">
			<div class="reco-themb">
				<a></a>
			</div>
		</div>
	</div>
</body>
</html>
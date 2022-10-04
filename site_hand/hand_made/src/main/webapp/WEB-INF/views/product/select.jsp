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

</style>
</head>
<body>
<form class="container mt-4">
	<h1>제품 정보</h1>
	<div class="wa-box">
		<c:if test="${pr.pr_waiting == 'Y'}">
			<span>대기 상태 : <input type="text" value="${wa.wp_state}"></span>
			<span>대기 일자 : <input type="text" value="${wa.wp_date_str}"></span><br>
			<div class="wa_nt mt-3">
				<span>대기 사유 : </span>
				<textarea name="wp_note">${wa.wp_note}</textarea>
			</div>
			<button class="btn btn-outline-primary wa-stop"type="button">대기 해제</button>
		</c:if>
		
	</div>
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
		<div class="price-box">
			<label>수량 :</label>
	    <input type="text" class="form-control" readonly value="${pr.pr_amount}">
	    <label class="mt-5">가격 :</label>
			<input type="text" class="form-control" readonly value="${pr.pr_price}">
			<label class="mt-5">파일 :</label>
			<c:forEach items="${file}" var="fi">
				<a href="" class="form-control" id="pr_file">${fi.fi_ori_name}</a>
			</c:forEach>
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
	  <div class="form-control" style="height: auto; min-height: 300px;">${pr.pr_content}</div>
	</div>
	<a class="btn btn-outline-warning" href="<c:url value="/product/update?pr_code=${pr.pr_code}"></c:url>">제품 수정</a>
	<c:if test="${pr.pr_waiting == 'N'}">
		<button class="btn btn-outline-warning wa-wait" type="button">제품대기로</button>
	</c:if>
</form>
<script type="text/javascript">
$(function(){
	$('.wa-wait').click(function(){
		let str = '';
		str +=	'<span>대기 상태 : <input type="text" id="wp_state" name="wp_state"></span>'
		str +=	'<div class="wa_nt mt-3">'
		str +=		'<span>대기 사유 : </span>'
		str +=		'<textarea id="wp_note" name="wp_note"></textarea>'
		str +=	'</div>'
		str +=	'<button class="btn btn-outline-warning wa-insert" type="button">제품대기로</button>'
		$('.wa-box').html(str);
		$('#wp_state').focus();
	})
	$(document).on('click','.wa-insert', function(){
		let pr_code = $('#pr_code').val();
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
	$("form").validate({
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
</body>
</html>
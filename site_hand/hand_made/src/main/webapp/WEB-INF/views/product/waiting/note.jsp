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
</head>
<body>
<form class="container mt-4" method="post" enctype="multipart/form-data">
	<h2>판매 대기 정보 입력</h2>
	<div class="form-group">
	  <label>제품 코드 :</label>
	  <input type="text" class="form-control" name="wp_pr_code" readonly value="${pr_code}">
	</div>
	<div class="form-group">
	  <label>대기 상태 :</label>
	  <input type="text" class="form-control" id="wp_state" name="wp_state" placeholder="예) 판매중지, 판매정지">
	</div>
	<div class="form-group">
	  <label>사유 입력 :</label>
	  <textarea class="form-control" name="wp_note" placeholder="사유 입력"></textarea>
	</div>
	<button class="btn btn-outline-success">등록</button>
	<a class="btn btn-outline-primary" href="<c:url value="/product/select?pr_code=${pr_code}"></c:url>">취소</a>
</form>
<script type="text/javascript">
$(function(){
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

</script>
	
	
</body>
</html>
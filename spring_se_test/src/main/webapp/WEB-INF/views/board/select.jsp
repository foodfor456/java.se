<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/7a5abb87c2.js" crossorigin="anonymous"></script>
<style>
	.btn-up, .btn-down{
	border : 1px solid black; color : red;
	}
	.btn-up.red, .btn-down.red{
		background-color: red; color: white
	}
	
</style>
</head>
<body>
	<div class="container">
		<c:if test="${board.bd_del == 'N'}">
		<div class="form-group">
		  <label>제목</label>
		  <input type="text" class="form-control" value="${board.bd_title}" readonly>
		</div>
		<div class="form-group">
		  <label>작성자</label>
		  <input type="text" class="form-control" value="${board.bd_me_id}" readonly>
		</div>
		<div class="form-group">
		  <label>작성일</label>
		  <input type="text" class="form-control" value="${board.bd_reg_date_time_str}" readonly>
		</div>
		<div class="form-group">
		  <label>최종수정일</label>
		  <input type="text" class="form-control" value="${board.bd_up_date_time_str}" readonly>
		</div>
		<div class="form-group">
		  <label>조회수</label>
		  <input type="text" class="form-control" value="${board.bd_views}" readonly>
		</div>
		<div class="form-group">
		  <label>내용</label>
		  <textarea class="form-control" rows="10" readonly>${board.bd_content}</textarea>
		</div>
		<div class="form-group">
			<button class="btn btn-up <c:if test="${likes.li_state == 1}">red</c:if>" data-value="1"><i class="fa-solid fa-thumbs-up"></i></button>
			<button class="btn btn-down <c:if test="${likes.li_state == -1}">red</c:if>" data-value="-1"><i class="fa-solid fa-thumbs-down"></i></button>
		</div>
		
		</c:if>
		<c:if test="${board.bd_del == 'Y'}">
			<h1>작성자에 의해 삭제된 게시글입니다.</h1>
		</c:if>
		<c:if test="${board.bd_del == 'A'}">
			<h1>관리자에 의해 삭제된 게시글입니다.</h1>
		</c:if>
		<c:if test="${board.bd_me_id == user.me_id}">
		<div class="container col-12 mb-5 clearfix">
		<a href="<c:url value="/board/update/${board.bd_num}"></c:url>" class="btn btn-outline-danger float-left col-5">수정</a>
		<a href="<c:url value="/board/delete/${board.bd_num}"></c:url>" class="btn btn-outline-danger float-right col-5">삭제</a>
		</div> 
		</c:if>
	</div>
	<script type="text/javascript">
		$(function(){
			$('.btn-up, .btn-down').click(function(){
				let id = '${user.me_id}';
				if(id == ''){
					if(confirm('로그인을 하러 이동하시겠습니까?')){
						location.href = '<%=request.getContextPath()%>/login'
						return;
					}
						
				}
				
				let li_state = $(this).data('value');
				let li_bd_num = '${board.bd_num}';
				let obj ={
						li_state : li_state,
						li_bd_num : li_bd_num
				};
				$.ajax({
		      async:false,
		      type:'POST',
		      data:JSON.stringify(obj),
		      url:'<%=request.getContextPath()%>/check/likes',
		      dataType:"json",
		      contentType:"application/json; charset=UTF-8",
		      success : function(data){
		    	 $('.btn-up, .btn-down').removeClass('red');
		    	 if(data.state == '1'){
		    		 $('.btn-up').addClass('red');
		    		 alert('추천하였습니다.');
		    	 }else if(data.state == '-1'){
		    		 $('.btn-down').addClass('red');
		    		 alert('비추천하였습니다.');
		    	 }else if(data.state == '10'){
		    		 alert('추천을 취소하였습니다.');
		    	 }else if(data.state == '-10'){
		    		 alert('비추천을 취소하였습니다.');
		    	 }else{
		    		 alert('잘못된 접근입니다.');
		    	}
		     }
			  });
			});
		})
		
	</script>
</body>
</html>
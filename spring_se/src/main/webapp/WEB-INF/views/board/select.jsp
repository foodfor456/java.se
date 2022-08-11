<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<c:if test="${board != null && 'N'.charAt(0) == board.bd_del}">
			<h1>게시글 상세</h1>
			<div class="form-group">
			  <input type="text" class="form-control" name="bd_title" value="${board.bd_title}" readonly>
			</div>
			<div class="form-group">
			  <input type="text" class="form-control" name="bd_title" value="${board.bd_me_id}" readonly>
			</div>
			<div class="form-group">
			  <input type="text" class="form-control" name="bd_title" value="${board.bd_reg_date_time_str}" readonly>
			</div>
			<div class="form-group">
			  <input type="text" class="form-control" name="bd_title" value="${board.bd_views}" readonly>
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-outline-primary up btn-like">추천</button>
				<button type="button" class="btn btn-outline-danger down btn-like">비추천</button>
			</div>
			<div class="form-group">
				<textarea class="form-control" rows="10" name="bd_content" readonly>${board.bd_content}</textarea>
			</div>
			<c:if test="${user != null && user.me_id == board.bd_me_id}">
				<a href="<%=request.getContextPath()%>/board/update/${board.bd_num}" class="btn btn-outline-success">수정</a>
				<a href="<%=request.getContextPath()%>/board/delete/${board.bd_num}" class="btn btn-outline-success">삭제</a>
			</c:if>
		</c:if>
		<c:if test="${board != null && 'A'.charAt(0) == board.bd_del}">
			<h1>관리자에 의해 삭제된 게시글입니다.</h1>
		</c:if>
		<c:if test="${board != null && 'Y'.charAt(0) == board.bd_del}">
			<h1>작성자에 의해 삭제된 게시글입니다.</h1>
		</c:if>
		<c:if test="${board == null}">
			<h1>잘못된 경로로 접근했습니다.</h1>
		</c:if>
	</div>
	<script>
		$(function(){
			$('.btn-like').click(function(){
				let li_state = $(this).hasClass('up') ? 1 : -1;
				let obj = {
						li_bd_num : '${board.bd_num}', 
						li_state : li_state, // 속성이름 : 변수이름
						li_me_id : '${user.me_id}'
				}
				if(obj.li_me_id == ''){
					if(confirm('추천/비추천은 로그인을 해야합니다. 로그인을 하시겠습니까?')){
						location.href = '<%=request.getContextPath()%>/login'
					}
					else
						return;
				}
				$.ajax({
					// 비동기 : 작업이 끝날때 까지 기다리지 않음, ajax가 동작중인지 끝났는지 상관없이 다음 작업을 함
					// 동기 : 작업이 끝날때 까지 기다림, ajax가 끝날때 까지 기다린 다음 다음 작업을 함
					async:true, // 비동기 여부 : true(비동기), false(동기)
		      type:'POST', // 보내는 방식
		      data: JSON.stringify(obj), // 실제 보내는 데이터
		      url:'<%=request.getContextPath()%>/board/likes',
		      // dataType:"", //서버에서 보내준 데이터의 타입
		      contentType:"application/json; charset=UTF-8", // 화면에서 ajax로 보내줄 데이터의 타입 data의 타입
		       // ajax가 성공적으로 동작했을때 할 작업
		      success : function(data){
		    		if(data == '1')
		    			alert('해당 게시글을 추천 했습니다.')
		    		else if(data == '-1')
		    			alert('해당 게시글을 비추천 했습니다.')
		    		else if(data == '10')
		    			alert('해당 게시글 추천을 취소 했습니다.')
		    		else if(data == '-10')
			    		alert('해당 게시글 비추천을 취소 했습니다.')
			    	else
			    		alert('잘못된 접근입니다.')
		    	}
				});
			})
		})
	</script>
</body>
</html>
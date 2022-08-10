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
		</c:if>
		<c:if test="${board.bd_del == 'Y'}">
			<h1>작성자에 의해 삭제된 게시글입니다.</h1>
		</c:if>
		<c:if test="${board.bd_del == 'A'}">
			<h1>관리자에 의해 삭제된 게시글입니다.</h1>
		</c:if>
		<c:if test="${board.bd_me_id == user.me_id}">
		<a href="/springtest/board/update/${board.bd_num}" class="btn btn-outline-danger mb-5 col-12">수정</a>
		</c:if>
	</div>
</body>
</html>
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
		<form action="/springtest/login" method="post">
			<div class="form-group">
			  <label for="me_id">아이디:</label>
			  <input type="text" class="form-control" id="me_id" name="me_id">
			</div>
			<div class="form-group">
			  <label for="me_pw">비밀번호:</label>
			  <input type="password" class="form-control" id="me_pw" name="me_pw">
			</div>
			<button class="btn btn-outline-primary">로그인</button>
		</form>
</body>
</html>
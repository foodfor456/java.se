<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset ="UTF-8">
<title>로그인</title>
</head>
<body>
	<div class="container">
		<form action="/spring/login" class = "mt-3" method = "post">
			<h1>로그인</h1>
			<div class="form-group">
		  	<input type="text" class="form-control" name = "me_id" placeholder="아이디">
			</div>
			<div class="form-group">
		  	<input type="password" class="form-control" name = "me_pw" placeholder="비밀번호" autoComplete="off">
			</div>
			<div class="form-check">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="true" name="autoLogin">자동 로그인
			  </label>
			</div>
			<button class="btn btn-outline-success col-12 mb-3">전송</button>	
		</form>
		<a href="<c:url value="/find?type=id"></c:url>">아이디 찾기</a>/
		<a href="<c:url value="/find?type=pw"></c:url>">비번 찾기</a>
	</div>
</body>
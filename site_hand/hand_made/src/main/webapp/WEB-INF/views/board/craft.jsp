<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.left-home{ padding: 30px 0; width: 70%;}
	.left-themb{ width: 100%; height: 90%;}
	.home-thumb>img{ width: 90%; height: 90%;}
</style>
</head>
<body>
<div class="left-home">
	<h2>공방 게시판입니다.</h2>
	<div class="left-themb">
		<a class="home-thumb"><img src="<c:url value="/craft/handmade.jpg"></c:url>"></a>
	</div>
</div>
</body>
</html>
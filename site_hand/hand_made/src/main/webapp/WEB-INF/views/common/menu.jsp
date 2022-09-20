<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<style type="text/css">
	.container-fluid{
	font-size: 14px;}
	</style>
</head>
	
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container-fluid">
		 	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
		   	<span class="navbar-toggler-icon"></span>
		 	</button>
		 	<div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
		   	<ul class="navbar-nav ">
		     	<c:if test="${user == null}">
			     	<li class="nav-item">
			     	 	<a class="nav-link" href="<c:url value="/login"></c:url>">로그인</a>
			     	</li>
			     	<li class="nav-item">
			       	<a class="nav-link" href="<c:url value="/signup"></c:url>">회원가입</a>
			     	</li>
		     	</c:if>
		     	<li class="nav-item">
			    	<a class="nav-link" href="<c:url value="/logout"></c:url>">로그아웃</a>
			    </li>
		     	<li class="nav-item">
		       	<a class="nav-link" href="#">장바구니</a>
		     	</li>    
		   	</ul>
			</div> 
		</div> 
	</nav>
</body>
</html>
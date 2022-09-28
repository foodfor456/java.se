<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
	<div class="container">
	 	<a class="navbar-brand" href="<c:url value="/"></c:url>">홈</a>
	 	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
	   	<span class="navbar-toggler-icon"></span>
	 	</button>
	 	<div class="collapse navbar-collapse" id="collapsibleNavbar">
	   	<ul class="navbar-nav">
	     	<li class="nav-item">
	     	 	<a class="nav-link" href="<c:url value="/product/list"></c:url>">제품</a>
	     	</li>
	     	<li class="nav-item">
	       	<a class="nav-link" href="<c:url value="/product/category"></c:url>">카테고리 등록</a>
	     	</li>
	     	<li class="nav-item">
	       	<a class="nav-link" href="<c:url value="/product/waiting/list"></c:url>">제품대기</a>
	     	</li>    
	   	</ul>
		</div> 
	</div> 
</nav>
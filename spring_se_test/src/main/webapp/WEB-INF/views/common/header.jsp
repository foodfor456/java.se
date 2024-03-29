<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
	<div class="container">
 		<a class="navbar-brand" href="<c:url value="/"></c:url>">HOME</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="collapsibleNavbar">
	   	<ul class="navbar-nav">
	   		<c:if test="${user == null}">
	   		<li class="nav-item">
		     	<a class="nav-link" href="<%=request.getContextPath()%>/login">로그인</a>
		   	</li>
		   	<li class="nav-item">
		     	<a class="nav-link" href="<%=request.getContextPath()%>/signup">회원가입</a>
		   	</li>
		   	</c:if>
		   	<li class="nav-item">
		     	<a class="nav-link" href="<%=request.getContextPath()%>/board/list">게시글</a>
		   	</li>
		   	<c:if test="${user != null}">
		   	<li class="nav-item">
		     	<a class="nav-link" href="<%=request.getContextPath()%>/member/update">회원정보 수정</a>
		   	</li> 
		   	<li class="nav-item">
		     	<a class="nav-link" href="<%=request.getContextPath()%>/logout">로그아웃</a>
		   	</li>
		   	<c:if test="${user.me_authority >= 8}">
			   	<li class="nav-item">
			     	<a class="nav-link" href="<%=request.getContextPath()%>/admin/member/list">회원등급관리</a>
			   	</li>
		   	</c:if>
		   	</c:if>   
	   	</ul>
		</div> 
	</div> 
</nav>
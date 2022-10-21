<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.left-box{ width: 100%; text-align: center;}
	ul,li { list-style: none;}
	.menu-list{ font-size: 20px;}
	.left-item{ margin-top: 20px;}
</style>
</head>
	<div class="left-menu bg-dark navbar-dark">
		<div class="navbar-text left-box" id="collapsibleNavbar">
			<ul class="menu-list navbar-nav">
				<li class="nav-item">
					<a class="nav-link left-item" href="<c:url value="/board/region"></c:url>">지역 게시판</a>
				</li>
				<li class="nav-item">
					<a class="nav-link left-item">공방 판매 게시판</a>
				</li>
				<li class="nav-item">
					<a class="nav-link left-item">등업 도전 게시판</a>
				</li>
				<c:if test="${user.me_authority == 10}">
					<li class="nav-item">
						<a class="nav-link left-item" href="<c:url value="/board/category"></c:url>">카테고리 추가</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</html>
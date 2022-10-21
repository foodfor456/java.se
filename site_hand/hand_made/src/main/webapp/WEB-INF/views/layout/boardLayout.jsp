<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<html>
<head>
<style type="text/css">
	div{ padding: 0; margin: 0;}
	.left-body>div{ vertical-align: top;  display:inline-block;}
	.left{ width: 200px; height: 80vh; margin-right: 50px;}
	.left>div{ height: 100%;}
	.right{ width: 79%; height: 100%;}
	.left-body{ width: 100%; overflow: hidden; min-width: 1250px; height: max-content;}
	.right>div,.right>form{ margin: 0 auto; width: 850px; height: 100%;}
</style>
</head>
<head>
<title>스프링</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<tiles:insertAttribute name="menu"/>
	<tiles:insertAttribute name="header"/>
	<div class="left-body clearfix">
		<div class="left">
			<tiles:insertAttribute name="left" />
		</div>
		<div class="right">
			<tiles:insertAttribute name="body" />
		</div>
	</div>
	<div class="footer">
	<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>
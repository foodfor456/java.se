<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title><tiles:insertAttribute name="title"/></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="shortcut icon" href="<c:url value="/resources/img/lg_farvicon.ico"></c:url>">
<style>
.container-admin, 
.container-menu{
	padding : 0;
}
.container-menu{
	background-color : #efefef;
}
</style>
</head>
<body>

<tiles:insertAttribute name="header"/>
<div class="container-fluid clearfix container-admin">
	<div class="col-3 float-left container-menu" style="min-height: 300px">
		<tiles:insertAttribute name="menu" />
	</div>
	<div class="col-9 float-right">
		<tiles:insertAttribute name="body" />
	</div>
</div>
<tiles:insertAttribute name="footer" />

</body>
</html>
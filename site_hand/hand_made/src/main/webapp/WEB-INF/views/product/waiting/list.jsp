<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	tr>*{ width: 100px;}
	tr>:nth-child(3){	width: 400px;}
	.table-striped tr{	max-height: 75px; height: 75px;}
	tr:first-child{	height: 30px;}
	.table{	border-bottom: 1px solid black;}
</style>
</head>
<body>
<div class="container">
  <h1>제품 대기 목록</h1>
  <table class="table table-striped">
    <thead>
      <tr>
      	<th>썸네일</th>
	      <th>제품코드</th>
	      <th>제품명</th>
	      <th>가격</th>
	      <th>수량</th>
	      <th>등록일</th>
	      <th>작성자</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="pr">
	    <tr>
	    	<td>
				    <c:set var="loop" value="false"></c:set>
	    		<c:forEach items="${files}" var="fi">
			    	<c:if test="${pr.pr_code == fi.fi_code && loop == 'false'}">
			    		<img alt="X" src="<c:url value="/thumb${fi.fi_name}"></c:url>" width="50" height="50">
			    		<c:set var="loop" value="true"/>
			    	</c:if>
					</c:forEach>
	    	</td>
	      <td>${pr.pr_code}</td>
	      <td><a href="<c:url value="/product/select?pr_code=${pr.pr_code}"></c:url>">${pr.pr_title}</a></td>
	      <td>${pr.pr_price}</td>
	      <td>${pr.pr_amount}</td>
	      <td>${pr.pr_date_str}</td>
	      <td>
	      	<c:if test="${pr.pr_me_id == 'qweqwe'}">관리자</c:if>
			    <c:if test="${pr.pr_me_id != 'qweqwe'}">${pr.pr_me_id}</c:if>
				</td>
	    </tr>
    </c:forEach>
    </tbody>
  </table>
  <ul class="pagination justify-content-center pagination-lg">
  	<c:if test="${pm.prev}">
	    <li class="page-item"><a class="page-link" href="<c:url value="/product/waiting?page=${pm.startPage-1}"></c:url>">이전</a></li>
  	</c:if>
    <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
    	<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>"><a class="page-link" href="<c:url value="/product/waiting?page=${i}"></c:url>">${i}</a></li>
    </c:forEach>
    <c:if test="${pm.next}">
	    <li class="page-item"><a class="page-link" href="<c:url value="/product/waiting?page=${pm.endPage+1}"></c:url>">다음</a></li>
    </c:if>
  </ul>
  <div class="container">
  	<a class="btn btn-outline-primary" href="<c:url value="/product/insert"></c:url>">제품 등록</a>
  </div>
</div>
</body>
</html>
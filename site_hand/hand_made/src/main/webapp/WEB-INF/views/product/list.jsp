<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
  <h1>제품 목록</h1>
  <table class="table table-striped">
    <thead>
      <tr>
	      <th>제품코드</th>
	      <th>제품명</th>
	      <th>가격</th>
	      <th>수량</th>
	      <th>등록일</th>
	      <th>작성자</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table>
  <div class="container">
  	<a class="btn btn-outline-primary" href="<c:url value="/product/insert"></c:url>">제품 등록</a>
  </div>
</div>
</body>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	h2{ margin: 30px 0;}
	th{ font-size: 14px; text-align: center;}
	.nav-tabs>li{ display:inline-block; padding: 0px;}
	.nav-tabs a{ padding: 10px;}
	.region-box { margin-bottom: 20px; border-bottom: 1px solid #000;}
	.board-list>.board-title{ width: 55%;}
</style>
</head>
<body>
<div class="region-table">
	<h2>지역 게시판</h2>
	<div class="region-box">
	  <ul class="nav nav-tabs">
	    <li class="nav-item">
	      <a class="nav-link active" href="javascript:0;">전체</a>
	    </li>
	  	<c:forEach items="${pv_name}" var="pv">
		    <li class="nav-item">
		      <a class="nav-link" href="javascript:0;">${pv}</a>
		    </li>
	    </c:forEach>
	  </ul>
  </div>
	<table class="table table-bordered">
    <thead>
      <tr>
        <th>번호</th>
      	<th>지역</th>
        <th>제목</th>
        <th>작성일</th>
        <th>작성자</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
    	<c:forEach items="${list}" var="li">
	      <tr class="board-list">
	      	<td class="bd_num">${li.bd_num}</td>
	      	<td>${li.rb_rg_name}</td>
	        <td class="board-title">${li.bd_title}</td>
	        <td>${li.bd_date_str}</td>
	        <td>${li.bd_me_id}</td>
	        <td>${li.bd_views}</td>
	      </tr>
    	</c:forEach>
	  </tbody>
  </table>
  <ul class="pagination justify-content-center">
		<c:if test="${pm.prev}">
	   <li class="page-item"><a class="page-link" href="<c:url value="/product/list?page=${pm.startPage-1}"></c:url>">이전</a></li>
		</c:if>
	  <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
	  	<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>"><a class="page-link" href="<c:url value="/board/region?page=${i}"></c:url>">${i}</a></li>
	  </c:forEach>
	  <c:if test="${pm.next}">
	   <li class="page-item"><a class="page-link" href="<c:url value="/product/list?page=${pm.endPage+1}"></c:url>">다음</a></li>
	  </c:if>
	</ul>
  <button class="btn btn-outline-primary col-3 input" type="button">글쓰기</button>
  <button class="btn btn-outline-danger col-3 region" type="button">지역 추가</button>
</div>
</body>
<script type="text/javascript">
$(function(){
	$('.nav-tabs').find('a').click(function(){
		$('.nav-tabs').find('a').removeClass('active');
		$(this).addClass('active');
	})
	$('.btn').click(function(){
		if($(this).hasClass('input'))
			location.href='<%=request.getContextPath()%>/board/insertR?board_type='+'지역';
		else
			location.href='<%=request.getContextPath()%>/board/region-insert';
	})
})
</script>
</html>
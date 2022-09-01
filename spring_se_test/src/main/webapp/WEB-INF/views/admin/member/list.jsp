<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
  <h2>회원 등급 관리</h2>
  <table class="table">
    <thead>
      <tr>
        <th>아이디</th>
        <th>등급</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="member">
      <tr>
        <td>${member.me_id}</td>
        <td class="form-group">
				  <select class="form-control me_aythority">
				    <c:forEach begin ="1" end ="${user.me_authority -1}" var ="i">
				    	<option <c:if test="${member.me_authority == i}">selected</c:if>>${i}</option>
				    </c:forEach>
				  </select>
				</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
<script type="text/javascript">
	$(function(){
		$('.me_aythority').change(function(){
			let me_id = $(this).parent().prev().text();
			let me_authority = $(this).val();
			let obj = {
					me_id : me_id,
					me_authority : me_authority
			}
			$.ajax({
			      async:false,
			      type:'POST',
			      data:JSON.stringify(obj),
			      url:"<%=request.getContextPath()%>/ajax/member/list",
			      dataType:"json",
			      contentType:"application/json; charset=UTF-8",
			      success : function(data){
			    	if(data.res)
			    		alert('등급이 변경되었습니다.')
			    	else
			    		alery('등급 변경이 실패하였습니다.')
			 }
			});
		})
	})
</script>
</body>
</html>
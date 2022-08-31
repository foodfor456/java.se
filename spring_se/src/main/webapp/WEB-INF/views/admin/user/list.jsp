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
	<br>
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
	        <td class="me_id">${member.me_id}</td>
	        <td class="form-group">
					  <select class="form-control" id="sel1" name="me_authority">
					    <c:forEach begin="1" end="${user.me_authority -1}" var="i">
					    	<option <c:if test="${i == member.me_authority}">selected</c:if>>${i}</option>
					    </c:forEach>
					  </select>
					</td>
	      </tr>
      </c:forEach>
      
    </tbody>
    <tfoot>
      <tr>
      <td>
      <button class="btn btn-outline-danger btn-authority">회원등급수정</button>
      </td>
      </tr>
    </tfoot>
  </table>
  
</div>
<script type="text/javascript">
	$(function(){
		$('#sel1').change(function(){
			let me_authority = $(this).val();
			let me_id = $(this).parent().siblings('.me_id').text();
			let obj = {
					me_authority : me_authority,
					me_id : me_id
			}
			$('.btn-authority').click(function(){
				$.ajax({
					// 비동기 : 작업이 끝날때 까지 기다리지 않음, ajax가 동작중인지 끝났는지 상관없이 다음 작업을 함
					// 동기 : 작업이 끝날때 까지 기다림, ajax가 끝날때 까지 기다린 다음 다음 작업을 함
					async:false, // 비동기 여부 : true(비동기), false(동기)
		      type:'POST', // 보내는 방식
		      data: JSON.stringify(obj), // 실제 보내는 데이터
		      url:'<%=request.getContextPath()%>/admin/authorityUpdate/update',
		      dataType:"json", //서버에서 보내준 데이터의 타입
		      contentType:"application/json; charset=UTF-8", // 화면에서 ajax로 보내줄 데이터의 타입 data의 타입
		       // ajax가 성공적으로 동작했을때 할 작업
		      success : function(data){
		    	  if(data.res){
		    		  alert('권한 설정이 완료되었습니다.')
		    	  }else{
		    		  alert('권한 설정이 실패되었습니다.')
		    	  }
		    	}
				});
			})
		})
	})
</script>
</body>
</html>
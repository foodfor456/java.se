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
	<form action="" class="mt-5" method="post">
		<select class="form-control op-select col-6">
			<option value="">추가할 카테고리를 선택하세요.</option>
			<option value="1">게시판 타입</option>
			<option value="2">게시판 카테고리</option>
		</select>
		<div class="name-box">
		</div>
		<button class="mt-5 btn btn-outline-success">등록</button>
	</form>
</body>
<script type="text/javascript">
$(function(){
	$('.op-select').change(function(){
		ajaxPost(false, null, '/ajax/board/category', function(data){
			let str = '';
			let op_select = $('.op-select').val();
			if(op_select == 1){
				str +=	'<div class="form-group mt-3">'
				str +=    '<label>게시판 타입</label>'
				str +=    '<input type="text" class="form-control col-6" id="bt_name" name="bt_name">'
				str +=  '</div>'
			}else if(op_select == 2){
				str +=		'<select class="form-control col-6 bt-select" name="bt_name">'
				str +=			'<option value="">게시판 타입을 선택해주세요.</option>'
				for(let bt of data)
					str +=			'<option value="'+bt+'">'+bt+'</option>'
				str +=		'</select>'
				str +=	'<div class="form-group mt-3">'
				str +=    '<label>게시판 카테고리</label>'
				str +=    '<input type="text" class=" col-6 form-control" id="bc_name" name="bc_name">'
				str +=  '</div>'
			}else
				str = '';
			$('.name-box').html(str);
		})
	})
})
function ajaxPost(async, dataObj, url, success){
	$.ajax({
	  async: async,
	  type:'POST',
	  data:JSON.stringify(dataObj),
	  url:"<%=request.getContextPath()%>"+url,
	  dataType:"json",
	  contentType:"application/json; charset=UTF-8",
	  success : function(data){
		  success(data);
	  }
  })
};
function ajaxString(async, dataObj, url, success, dataType){
	$.ajax({
	  async: async,
	  type:'POST',
	  data:dataObj,
	  url:"<%=request.getContextPath()%>"+url,
	  dataType:dataType,
	  contentType:"application/json; charset=UTF-8",
	  success : function(data){
		  success(data);
	  },error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
  })
};
</script>
</html>
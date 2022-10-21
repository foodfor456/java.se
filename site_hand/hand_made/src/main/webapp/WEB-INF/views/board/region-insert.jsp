<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
<style type="text/css">
	.regin-input-box{ border: 1px solid gray; border-radius: 8px; padding: 10px;}
</style>
</head>
<body>
	<form action="">
		<div class="form-group col-6 mt-5 regin-input-box">
			<h2>지역 등록</h2>
			<div class=" region-insert mt-3">
			  <label>지역 등록</label>
			  <select class="form-control region" id="region" name="region">
			  	<option value="0">지역 종류</option>
			    <option value="1">도</option>
			    <option value="2">시</option>
			  </select>
			</div>
			<div class="region-box mt-3"></div>
			<button class="btn btn-outline-warning col-6 mt-5">등록</button>
		</div>
	</form>
</body>
<script type="text/javascript">
$(function(){
	$("form").validate({
	  rules: {
			rg_name: {
		 		required : true
		  },
		  pv_name: {
	    	required : true
	    }
		},
	  //규칙체크 실패시 출력될 메시지
	  messages : {
			rg_name: {
				required : '필수 사항입니다.'
			},
			pv_name: {
				required : '필수 사항입니다.'
			}
		},
	  submitHandler: function(form){
		  let obj = {
				pv_name : $('.pv_name').val(),
				rg_name : $('.rg_name').val()
		  };
		  if($('.rg_name').length == 0)
			  obj = {pv_name : $('.pv_name').val()};
		  ajaxPost(false, obj, "/ajax/region/insert", function(data){
			  if(data.res){
				alert('지역을 추가하였습니다.');
					location.href='<%=request.getContextPath()%>/board/region-insert'
				}
			  else{
					alert('추가에 실패했습니다.');
					location.href='<%=request.getContextPath()%>/board/region-insert'
				}
		  })
		}
	});
	
	
	
	$('.region').change(function(){
		let str = '';
		if($(this).val() == 1){
			str += '<label class="mt-2">도 :</label>'
			str += '<input type="text" class="form-control pv_name" name="pv_name">'
		}
		else if($(this).val() == 2){
			ajaxPost(false, null, '/ajax/region/select', function(data){
				str +=  '<select class="form-control pv_name" name="pv_name">';
				str +=    '<option value="">지역 종류(도)</option>';
				for(let strs of data)
					str += 	  '<option value="'+strs+'">'+strs+'</option>';
				str +=  '</select><br>';
				str +=  '<label class="mt-2">시 :</label>';
				str +=  '<input type="text" class="form-control rg_name" name="rg_name">';
			})
		}
		$('.region-box').html(str);
	})
	
})
function ajaxString(async, dataObj, url, success){
	$.ajax({
	  async: async,
	  type:'POST',
	  data:dataObj,
	  url:"<%=request.getContextPath()%>"+url,
	  dataType:"json",
	  success : function(data){
		  success(data);
	  }
  })
};
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

$.validator.addMethod(
	"regex",
	function(value, element, regexp) {
	  var re = new RegExp(regexp);
	  return this.optional(element) || re.test(value);
	},
	"Please check your input."
);

</script>
</html>
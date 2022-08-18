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
		<c:if test="${board != null && 'N'.charAt(0) == board.bd_del}">
			<h1>게시글 상세</h1>
			<div class="form-group">
			  <input type="text" class="form-control" name="bd_title" value="${board.bd_title}" readonly>
			</div>
			<div class="form-group">
			  <input type="text" class="form-control" name="bd_title" value="${board.bd_me_id}" readonly>
			</div>
			<div class="form-group">
			  <input type="text" class="form-control" name="bd_title" value="${board.bd_reg_date_time_str}" readonly>
			</div>
			<div class="form-group">
			  <input type="text" class="form-control" name="bd_title" value="${board.bd_views}" readonly>
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-outline-primary up btn-like">추천</button>
				<button type="button" class="btn btn-outline-danger down btn-like">비추천</button>
			</div>
			<div class="form-group">
				<textarea class="form-control" rows="10" name="bd_content" readonly>${board.bd_content}</textarea>
			</div>
			
			
			<div class="list-comment">
				<div class="item-comment">
					<div class="co_me_id">작성자</div>
					<div class="co_content">내용</div>
					<div class="co_reg_date">작성일</div>
					<input value="1">
				</div>
			</div>
			<ul class="pagination justify=content-center"></ul>
			<div class="form-group mt-5">
				<textarea class="form-control" name="co_content"></textarea>
				<button class="btn btn-outline-success col-12 btn-comment-insert">댓글등록</button>
			</div>
			<c:if test="${user.me_id != board.bd_me_id}">
				<a href="<%=request.getContextPath()%>/board/insert?bd_ori_num=${board.bd_ori_num}&bd_depth=${board.bd_depth}" class="btn btn-outline-success">답글</a>
			</c:if>
			
			<c:if test="${user != null && user.me_id == board.bd_me_id}">
				<a href="<%=request.getContextPath()%>/board/update/${board.bd_num}" class="btn btn-outline-success">수정</a>
				<a href="<%=request.getContextPath()%>/board/delete/${board.bd_num}" class="btn btn-outline-success">삭제</a>
			</c:if>
		</c:if>
		<c:if test="${board != null && 'A'.charAt(0) == board.bd_del}">
			<h1>관리자에 의해 삭제된 게시글입니다.</h1>
		</c:if>
		<c:if test="${board != null && 'Y'.charAt(0) == board.bd_del}">
			<h1>작성자에 의해 삭제된 게시글입니다.</h1>
		</c:if>
		<c:if test="${board == null}">
			<h1>잘못된 경로로 접근했습니다.</h1>
		</c:if>
	</div>
	
	
<script>
	let criteria = {
		page 				: 1,
		perPageNum	: 5
		};
	$(function(){
		$('.btn-like').click(function(){
			let li_state = $(this).hasClass('up') ? 1 : -1;
			let obj = {
					li_bd_num : '${board.bd_num}', 
					li_state : li_state, // 속성이름 : 변수이름
					li_me_id : '${user.me_id}'
			}
			if(obj.li_me_id == ''){
				if(confirm('추천/비추천은 로그인을 해야합니다. 로그인을 하시겠습니까?')){
					location.href = '<%=request.getContextPath()%>/login'
				}
				else
					return;
			}
			$.ajax({
				// 비동기 : 작업이 끝날때 까지 기다리지 않음, ajax가 동작중인지 끝났는지 상관없이 다음 작업을 함
				// 동기 : 작업이 끝날때 까지 기다림, ajax가 끝날때 까지 기다린 다음 다음 작업을 함
				async:true, // 비동기 여부 : true(비동기), false(동기)
	      type:'POST', // 보내는 방식
	      data: JSON.stringify(obj), // 실제 보내는 데이터
	      url:'<%=request.getContextPath()%>/board/likes',
	      // dataType:"", //서버에서 보내준 데이터의 타입
	      contentType:"application/json; charset=UTF-8", // 화면에서 ajax로 보내줄 데이터의 타입 data의 타입
	       // ajax가 성공적으로 동작했을때 할 작업
	      success : function(data){
	    		if(data == '1')
	    			alert('해당 게시글을 추천 했습니다.')
	    		else if(data == '-1')
	    			alert('해당 게시글을 비추천 했습니다.')
	    		else if(data == '10')
	    			alert('해당 게시글 추천을 취소 했습니다.')
	    		else if(data == '-10')
		    		alert('해당 게시글 비추천을 취소 했습니다.')
		    	else
		    		alert('잘못된 접근입니다.')
	    	}
			});
		})
	})
	$(function(){
		// 댓글 등록 버튼 클릭
		$('.btn-comment-insert').click(function(){
			let co_content = $('[name=co_content]').val();
			let co_bd_num = '${board.bd_num}';
			
			if('${user.me_id}' == ''){
				if(confirm('로그인한 회원만 댓글 작성이 가능합니다. 로그인 하겠습니까?')){
				
					location.href = '<%=request.getContextPath()%>/login'
					return;
				}
			}
			
			let obj = {
				co_content : co_content,
				co_bd_num : co_bd_num
			}
			$.ajax({
				async:true,
	      type:'POST',
	      data: JSON.stringify(obj),
	      url:'<%=request.getContextPath()%>/ajax/comment/insert',
	      dataType:"json",
	      contentType:"application/json; charset=UTF-8",
	      success : function(data){
	    	  alert(data.res);
	    	  getCommentList(criteria, bd_num)
	    	}
			});
		})
	})
	$(function(){
		$(document).on('click','.btn-comment-delete', function(){
			 let co_num = $(this).siblings('[name=co_num]').val()
			 let obj = {
				 co_num : co_num
			 }
			$.ajax({
				async:true,
	      type:'POST',
	      data: JSON.stringify(obj),
	      url:'<%=request.getContextPath()%>/ajax/comment/delete',
	      dataType:"json",
	      contentType:"application/json; charset=UTF-8",
	      success : function(data){
	    	  if(data.res){
	    		  alert('삭제가 완료됐습니다.')
	    		  getCommentList(criteria, bd_num)
	    	  }else{
	    		  alert('댓글 삭제 실패했습니다.')
	    	  }
	    	}
			});
		})
	})
	$(function(){
		$(document).on('click', '.btn-comment-update', function(){
			$('.btn-comment-update-cancle').click();
			// 기존 댓글 내용이 입력창으로 바뀌어야 함
			let co_content = $(this).siblings('.co_content').text();
			let str = '<textarea class="co_content2">'+co_content+'</textarea>';
			$(this).siblings('.co_content').after(str);
			$(this).siblings('.co_content').hide();
			$(this).hide();
			$(this).siblings('.btn-comment-delete').hide();
			str = '<button class="btn-comment-update-complete">수정완료</button>';
			str += '<button class="btn-comment-update-cancle">취소</button>'
			$(this).parent().append(str);
		})
		$(document).on('click','.btn-comment-update-complete', function(){
			let co_num = $(this).siblings('[name=co_num]').val();
			let co_content = $(this).siblings('.co_content2').val();
			let obj = {
			 co_num : co_num,
			 co_content : co_content
			};
			$.ajax({
				async:true,
	      type:'POST',
	      data: JSON.stringify(obj),
	      url:'<%=request.getContextPath()%>/ajax/comment/update',
	      dataType:"json",
	      contentType:"application/json; charset=UTF-8",
	      success : function(data){
	    	  if(data.res){
	    		  alert('수정이 완료됐습니다.')
	    		  getCommentList(criteria, bd_num)
	    	  }else{
	    		  alert('댓글 수정에 실패했습니다.')
	    	  }
	    	}
			});
		})
			$(document).on('click', '.btn-comment-update-cancle', function(){
				// 기존 댓글 내용이 입력창으로 바뀌어야 함
				$(this).siblings('.co_content').show();
				$(this).siblings('.co_content2').remove();
				$(this).siblings('.btn-comment-update').show();
				$(this).siblings('.btn-comment-delete').show();
				$('.btn-comment-update-cancle').remove();
				$('.btn-comment-update-complete').remove();
			})
	})
	
	let bd_num = '${board.bd_num}'
	function getCommentList(cri, bd_num){
		$.ajax({
			async:true,
      type:'POST',
      data: JSON.stringify(cri),
      url:'<%=request.getContextPath()%>/ajax/comment/list/' + bd_num,
      dataType:"json",
      contentType:"application/json; charset=UTF-8",
      success : function(data){
    	  let str = '';
    	 	for( co of data.list){
    	  str +=
	    	  '<div class="item-comment">'+
						'<div class="co_me_id"><b>ID : '+co.co_me_id+'</b></div>'+
						'<div class="co_content mb-3">'+co.co_content+'</div>'+
						'<div class="co_reg_date" style="font-size: 13px;">작성일 : '+co.co_reg_date_str+'</div>'+
						'<input value="'+co.co_num+'" name="co_num" type="hidden">';
						if(co.co_me_id == '${user.me_id}'){
							str +=
						'<button class="btn-comment-delete">삭제</button>' +
						'<button class="btn-comment-update">수정</button>';
						}
						str +=
					'</div>'
    	 	}
    	 	$('.list-comment').html(str);
    	 	let pm = data.pm;
	     	let pmStr =  '';
	     	if(pm.prev){
						pmStr +=
						'<li class="page-item">' +
							'<a class="page-link" href="javascript:0;" onclick="criteria.page='+(pm.startPage-1)+';getCommentList(criteria, bd_num)">이전</a>' +
						'</li>';
					}
			    for(let i = pm.startPage; i <= pm.endPage; i++){
			   		let active = pm.cri.page == i ? 'active' : '';
			    	pmStr +=
			    	'<li class="page-item '+ active + '">'+
			   			'<a class="page-link" href="javascript:0;" onclick="criteria.page='+(i)+
			   			';getCommentList(criteria, bd_num)">' + i + '</a>'+
			   		'</li>';
			    }
			 // onclick="criteria.page = 1; getCommentList(criteria, 17)"
					if(pm.next){
						pmStr +=	
						'<li class="page-item">' + 
							'<a class="page-link" href="javascript:0;" onclick="criteria.page='+(pm.endPage+1)+';getCommentList(criteria, bd_num)">다음</a>' +
						'</li>';
					}
					$('.pagination').html(pmStr);
    	}
		});
	}
	getCommentList(criteria, bd_num)
</script>
</body>
</html>
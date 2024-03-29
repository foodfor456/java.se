<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/7a5abb87c2.js" crossorigin="anonymous"></script>
<style>
	.btn-up, .btn-down{
	border : 1px solid black; color : red;
	}
	.btn-up.red, .btn-down.red{
		background-color: red; color: white
	}
	
</style>
</head>
<body>
	<div class="container">
		<c:if test="${board.bd_del == 'N'}">
		<div class="form-group">
		  <label>제목</label>
		  <input type="text" class="form-control" value="${board.bd_title}" readonly>
		</div>
		<div class="form-group">
		  <label>작성자</label>
		  <input type="text" class="form-control" value="${board.bd_me_id}" readonly>
		</div>
		<div class="form-group">
		  <label>작성일</label>
		  <input type="text" class="form-control" value="${board.bd_reg_date_time_str}" readonly>
		</div>
		<div class="form-group">
		  <label>최종수정일</label>
		  <input type="text" class="form-control" value="${board.bd_up_date_time_str}" readonly>
		</div>
		<div class="form-group">
		  <label>조회수</label>
		  <input type="text" class="form-control" value="${board.bd_views}" readonly>
		</div>
		<div class="form-group">
		  <label>내용</label>
		  <div class="form-control" style="height: auto; min-height: 500px">${board.bd_content}</div>
		</div>
		<c:if test="${board.bd_me_id == user.me_id}">
		<div class="form-group">
			<button class="btn btn-up <c:if test="${likes.li_state == 1}">red</c:if>" data-value="1"><i class="fa-solid fa-thumbs-up"></i></button>
			<button class="btn btn-down <c:if test="${likes.li_state == -1}">red</c:if>" data-value="-1"><i class="fa-solid fa-thumbs-down"></i></button>
		</div>
		</c:if>
		<div>
			<c:forEach items="${list}" var="files">
				<a href="<c:url value="/file${files.fi_name}"></c:url>" download="${files.fi_ori_name}">${files.fi_ori_name}</a> <br>
			</c:forEach>
		</div>
		<div class="content-area">
			<div class="list-comment">
				<div class="media border p-3">
			    <div class="media-body">
			      <h4>John Doe <small><i>Posted on February 19, 2016</i></small></h4>
			      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>      
			    </div>
			    <button class="btn btn-outline-danger mt-1" style="display : block">답글</button>
			    <div class="btn-box">
						<button class="btn btn-outline-danger mt-1" style="display : block">수정</button>
						<button class="btn btn-outline-success" style="display : block">삭제</button>
					</div>
			  </div>
			</div>
			<ul class="pagination-comment pagination justify-content-center mt-3">
		   
		  </ul>
			<div class="form-group">
				<textarea class="form-control" rows="5" name="co_content"></textarea>
			</div>
				<button class="btn btn-outline-primary col-5 btn-co-insert">댓글 등록</button>
		</div>
		
		
		</c:if>
		<c:if test="${board.bd_del == 'Y'}">
			<h1>작성자에 의해 삭제된 게시글입니다.</h1>
		</c:if>
		<c:if test="${board.bd_del == 'A'}">
			<h1>관리자에 의해 삭제된 게시글입니다.</h1>
		</c:if>
		<div class="container col-12 mb-5 clearfix">
		<c:if test="${board.bd_me_id == user.me_id}">
		<a href="<c:url value="/board/update/${board.bd_num}"></c:url>" class="btn btn-outline-danger float-left col-5">수정</a>
		<a href="<c:url value="/board/delete/${board.bd_num}"></c:url>" class="btn btn-outline-danger float-right col-5">삭제</a>
		</c:if>
		<a href="<c:url value="/board/insert?bd_ori_num=${board.bd_ori_num}&bd_depth=${board.bd_depth}&bd_order=${board.bd_order}"></c:url>" class="btn btn-outline-danger float-right col-5">답글등록</a>
		</div> 
		
	</div>
	<script type="text/javascript">
		$(function(){
			$('.btn-up, .btn-down').click(function(){
				let id = '${user.me_id}';
				if(id == ''){
					if(confirm('로그인을 하러 이동하시겠습니까?')){
						location.href = '<%=request.getContextPath()%>/login'
						return;
					}
						
				}
				
				let li_state = $(this).data('value');
				let li_bd_num = '${board.bd_num}';
				let obj ={
						li_state : li_state,
						li_bd_num : li_bd_num
				};
				$.ajax({
		      async:false,
		      type:'POST',
		      data:JSON.stringify(obj),
		      url:'<%=request.getContextPath()%>/check/likes',
		      dataType:"json",
		      contentType:"application/json; charset=UTF-8",
		      success : function(data){
		    	 $('.btn-up, .btn-down').removeClass('red');
		    	 if(data.state == '1'){
		    		 $('.btn-up').addClass('red');
		    		 alert('추천하였습니다.');
		    	 }else if(data.state == '-1'){
		    		 $('.btn-down').addClass('red');
		    		 alert('비추천하였습니다.');
		    	 }else if(data.state == '10'){
		    		 alert('추천을 취소하였습니다.');
		    	 }else if(data.state == '-10'){
		    		 alert('비추천을 취소하였습니다.');
		    	 }else{
		    		 alert('잘못된 접근입니다.');
		    	}
		     }
			  });
			});
		})
		// 댓글
		$(function(){
			$('.btn-co-insert').click(function(){
				let co_me_id = '${user.me_id}';
				// 아이디 체크
				if(co_me_id == ''){
					// 로그인 화면 이동할지 여부
					if(confirm('로그인이 필요합니다 로그인하시겠습니까?')){
						// 로그인 화면으로 이동
						location.href = '<%=request.getContextPath()%>/login'
						return;
					}else{
						return;
					}
				}
				// 댓글 내용 체크
				let co_content = $('[name=co_content]').val();
				// 댓글 내용 비었으면 입력하라고 함.
				if(co_content == ''){
					alert('댓글 내용을 입력하세요.');
					$('[name=co_content]').focus();
					return;
				}
				let obj = {
						co_content : co_content,
						co_bd_num : '${board.bd_num}'
				}
				ajaxPost(false, obj, '/ajax/comment/insert', commentInsertSuccess)
				
			})
			$(document).on('click', '.btn-co-reply', function(){
				let co_me_id = '${user.me_id}';
				// 아이디 체크
				if(co_me_id == ''){
					// 로그인 화면 이동할지 여부
					if(confirm('로그인이 필요합니다 로그인하시겠습니까?')){
						// 로그인 화면으로 이동
						location.href = '<%=request.getContextPath()%>/login'
						return;
					}else{
						return;
					}
				}
				$('.btn-co-cancle').click();
				$('.btn-reply-cancle').click();
				str = '';
				str +=	'<div class="media p-3 box-reply">'
		    str +=		'<div class="media-body">'
		    str +=			'<div class="form-group">'
		    str +=				'<textarea class="form-control" rows="5" name="co_reply_content"></textarea>'
		    str +=			'</div>'
		    str +=		'</div>'
		    str +=		'<div class="box-btn ml-2">'
		    str +=			'<button class="btn btn-outline-primary btn-reply-complete" style="display: block">등록</button>'
		    str +=			'<button class="btn btn-outline-danger btn-reply-cancle" style="display: block">취소</button>'
		    str +=		'</div>'
		    str +=	'</div>'
		    $(this).parent().siblings('.media-body').append(str);
		    $(this).parent().hide(); // 답글 수정 삭제버튼 감춤
			})
			//댓글 등록 버튼 클릭
			$(document).on('click','.btn-reply-complete', function(){
				
				// 댓글 내용 체크
				let co_content = $('[name=co_reply_content]').val();
				// 댓글 내용 비었으면 입력하라고 함.
				if(co_content == ''){
					alert('댓글 내용을 입력하세요.');
					$('[name=co_reply_content]').focus();
					return;
				}
				let co_ori_num = $(this).parents('.comment-body').find('.btn-co-reply').data('orinum');
				let co_depth = $(this).parents('.comment-body').find('.btn-co-reply').data('depth');
				let co_order = $(this).parents('.comment-body').find('.btn-co-reply').data('order');
				let obj = {
						co_content : co_content,
						co_bd_num : '${board.bd_num}',
						co_ori_num : co_ori_num,
						co_depth : co_depth,
						co_order : co_order
				}
				ajaxPost(false, obj, '/ajax/comment/insert', commentInsertSuccess)
			})
			$(document).on('click','.btn-reply-cancle', function(){
				$(this).parents('.comment-body').find('.btn-box').show(); //답글 수정/삭제버튼 보여줌
				$(this).parents('.box-reply').remove();//답글창, 등록, 취소 버튼을 삭제
			})
			
			getCommentList(cri);
			
		})
		// 전역 변수들
		let cri = {
				page : 1,
				perPageNum : 2
		}
		
		
		
		// 함수들
		function getCommentList(cri){
			if(cri == undefined || cri == null || typeof cri != 'object'){
				cri = {};
			}
			if(isNaN(cri.page)) // 숫자가 아닌경우 true
				cri.page = 1;
			ajaxPost(false, cri, '/ajax/comment/list/'+${board.bd_num}, commentListSuccess)
		}
		
		
		function commentInsertSuccess(data){
			if(data.res)
				alert('댓글 등록이 완료됐습니다.')
			else
				alert('댓글 등록이 실패했습니다.')
			getCommentList(cri);
			$('[name=co_content]').val('');
			
		}
		function commentListSuccess(data){
			let list = data.list;
			let pm = data.pm;
			let str = '';
			let str2 = '';
			// 반복문을 이용하여 댓글들 구성
			for(co of list){
			str += '<div class="media border p-3 comment-text comment-body">';
			str += 		'<div class="media-body ">';
			str += 			'<h4>'+co.co_me_id+'<small><i> '+co.co_reg_date_str+'</i></small></h4>';
			str += 			'<p>';
			str +=			'<span class="reply-icon">';
			for(let i = 2; i <= co.co_depth; i++)
				str+= 			'-';
			str +=			'</span>';
			str +=			'<span class="reply-content">';
			str += 				co.co_content;
			str +=			'</span>'
			str +=			'</p>';
			str += 		'</div>';
			str +=		'<div class="btn-box">';
			str +=			'<button data-orinum="'+co.co_ori_num+'" data-depth="'+co.co_depth+'" data-order="'+co.co_order+'" class="btn btn-outline-success btn-co-reply" style="display : block">답글</button>';
			if(co.co_me_id == '${user.me_id}'){
				str +=		'<button data-target="'+co.co_num+'" class="btn btn-outline-danger mt-1 btn-co-update" style="display : block">수정</button>';
				str +=		'<button data-target="'+co.co_num+'" class="btn btn-outline-success btn-co-delete" style="display : block">삭제</button>';
			}
			str +=		'</div>';
			str +=	'</div>';
			
			}
			// 댓글들을 화면에 출력
			$('.list-comment').html(str);
			// 댓글 삭제버튼 이벤트 등록
			$('.btn-co-delete').click(function(){
				let co_num = $(this).data('target');
				let comment = {
						co_num : co_num
				}
				ajaxPost(false, comment, '/ajax/comment/delete', commentDeleteSuccess)
			})
			$('.btn-co-update').click(function(){
				$('.btn-co-cancle').click();
				$('.btn-reply-cancle').click();
				let contentEl = $(this).parent().siblings('.media-body').children('p');
				contentEl.hide();
				let content = contentEl.children('.reply-content').text();
				let str = ''; 
				str += '<div class="form-group box-content">';
				str +=	'<textarea class="form-control" rows="3">'+content+'</textarea>';
				str += '</div>';
				contentEl.after(str);
				$(this).parent().hide();
				let co_num = $(this).data('target');
				str = '';
				str +=	'<div class="btn-box2">'
				str +=		'<button data-target="'+co_num+'" class="btn btn-outline-danger mt-1 btn-co-complete" style="display : block">등록</button>';
				str +=		'<button class="btn btn-outline-success btn-co-cancle" style="display : block">취소</button>';
				str +=	'</div>'
				$(this).parent().after(str);
				$('.btn-co-complete').click(function(){
					let co_num = $(this).data('target');
					let co_content = $(this).parent().siblings('.media-body').find('textarea').val();
					let obj = {
							co_num : co_num,
							co_content : co_content
					}
					ajaxPost(false, obj, '/ajax/comment/update', commentUpdateSuccess)
				})
				$('.btn-co-cancle').click(function(){
					// .box-content
					$(this).parent().siblings('.media-body').find('p').show();
					$(this).parent().siblings('.media-body').find('.box-content').remove();
					$(this).parent().siblings('.btn-box').show();
					$(this).parent().remove();
					
				})
				
			})
			
			
			
			// 댓글 페이지 네이션 구성
			str2 +=
			'<ul class="pagination-comment pagination justify-content-center mt-3">';
		  if(pm.prev){
			str2 +='<li class="page-item" data-page="'+(pm.startPage -1)+'"><a class="page-link" href="javascript:void(0);">이전</a></li>'
			}
		  for(let i = pm.startPage; i <= pm.endPage; i++){
			  if(i == pm.cri.page)
				  str2 +='<li class="page-item active" data-page="'+i+'"><a class="page-link" href="javascript:void(0);">'+i+'</a></li>'
			  else
					str2 +='<li class="page-item" data-page="'+i+'"><a class="page-link" href="javascript:void(0);">'+i+'</a></li>'
		  }
	    if(pm.next){
			str2 +='<li class="page-item" data-page="'+(pm.endPage +1)+'"><a class="page-link" href="javascript:void(0);">다음</a></li>'
			str2 +='</ul>'
			}
	    // 페이지 네이션 화면에 등록
			$('.pagination').html(str2);
	    
	    // 페이지 네이션 이벤트 등록
			$('.pagination-comment .page-item').click(function(){
				cri.page = $(this).data('page');
				getCommentList(cri);
			})
			
		}
		function commentUpdateSuccess(data){
			if(data.res)
				alert('댓글이 수정되었습니다.')
			else
				alert('댓글 등록이 실패했습니다.')
			getCommentList(cri);
		}
		function commentDeleteSuccess(data){
			if(data.res)
				alert('댓글이 삭제되었습니다.')
			else
				alert('댓글 삭제에 실패하였습니다.')
				
			getCommentList(cri);
			
		}
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
		  });
		}
	</script>
</body>
</html>
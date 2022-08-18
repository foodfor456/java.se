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
 .sort i{
 	display : none; cursor : pointer;
 }
 .sort.down .fa-sort-down{
 	display : inline;
 }
 .sort.up .fa-sort-up{
 	display : inline;
 }
</style>
</head>
<body>
	<div class = "container">
		<h1>게시글 리스트</h1>
		<div class=form-group>
			<form class="input-group">
		    <select class="input-group-prepend form-controll col-2" name="searchType">
			    <option value="all"<c:if test="${pm.cri.searchType == 'all'}">selected</c:if> >전체</option>
			    <option value="bd_title" <c:if test="${pm.cri.searchType == 'bd_title'}">selected</c:if>>제목</option>
			    <option value="bd_me_id" <c:if test="${pm.cri.searchType == 'bd_me_id'}">selected</c:if>>작성자</option>
			  </select>
			  <input type="text" class="form-control col-8" name="search" value="${pm.cri.search}">
			  <button class="btn btn-outline-success col-2 btn-search">검색</button>
		  </form>
		</div>
		<table class="table table-striped table-hover">
    	<thead>
	     <tr>
	       <th class="title">
	       <span>번호</span>
	       <span class="sort down" data-target="bd_num">
	       	<i class="fa-solid fa-sort-up"></i>
	       	<i class="fa-solid fa-sort-down"></i>
	       </span>
	       </th>
	       <th class="title">
	       <span>제목</span>
	       <span class="sort" data-target="bd_title">
	       	<i class="fa-solid fa-sort-up"></i>
	       	<i class="fa-solid fa-sort-down"></i>
	       </span>
	       </th>
	       <th class="title">
	       <span>작성자</span>
	       <span class="sort" data-target="bd_me_id">
	       	<i class="fa-solid fa-sort-up"></i>
	       	<i class="fa-solid fa-sort-down"></i>
	       </span>
	       </th>
	       <th>
	       <span>작성일</span>
	       </th>
	       <th class="title">
	       <span>조회수</span>
	       <span class="sort" data-target="bd_views">
	       	<i class="fa-solid fa-sort-up"></i>
	       	<i class="fa-solid fa-sort-down"></i>
	       </span>
	       </th>
	       <th>
	       <span>추천</span>
	       </th>
	     </tr>
   	 </thead>
    <tbody></tbody>
  	</table>
  	<ul class="pagination justify-content-center"></ul>
  	
  	<a href="<%=request.getContextPath()%>/board/insert" class="btn btn-outline-warning">글쓰기</a>
	</div>
	<script>
	let criteria = {
		page 				: 1,
		perPageNum	: 2,
		search 			: '',
		searchType 	: 'all',
		column 			: 'bd_num',
		orderBy 		: 'desc'
		};
		$(function(){
			getBoardList(criteria);
			
			// 검색버튼 클릭 또는 검색창에 입력 후 엔터
			$('form').submit(function(){
				let search = $('[name=search]').val();
				let searchType = $('[name=searchType]').val();
				console.log(1);
				criteria.search = search;
				criteria.searchType = searchType;
				
				getBoardList(criteria);
				return false;
			})
		})
		$('.fa-sort-up, .fa-sort-down').click(function(e){
			e.stopPropagation();
			
			let parent = $(this).parent();
			// 정렬 아이콘 모양 제어
			if(parent.hasClass('down')){
				parent.removeClass('down').addClass('up')
			}else{
				parent.removeClass('up').addClass('down')
			}
			// 정렬할 속성명, 정렬 방식을 설정
			criteria.column = parent.data('target');
			criteria.orderBy = parent.hasClass('down') ? 'desc' : 'asc';
			console.log(criteria.orderBy);
			getBoardList(criteria);
		})
		$('.title').click(function(){
			// 아이콘 모양 제어
			$(this).siblings().children('.sort').removeClass('up').removeClass('down');
			if($(this).children('.sort').addClass('down')){
				$(this).find('.fa-sort-down').click();
			}else{
				$(this).find('.fa-sort-up').click();
			}
			
		})
		
		function getBoardList(cri){
			$.ajax({
				// 비동기 : 작업이 끝날때 까지 기다리지 않음, ajax가 동작중인지 끝났는지 상관없이 다음 작업을 함
				// 동기 : 작업이 끝날때 까지 기다림, ajax가 끝날때 까지 기다린 다음 다음 작업을 함
				async:true, // 비동기 여부 : true(비동기), false(동기)
	      type:'POST', // 보내는 방식
	      data: JSON.stringify(cri), // 실제 보내는 데이터
	      url:'<%=request.getContextPath()%>/ajax/board/list',
	      dataType:"json", //서버에서 보내준 데이터의 타입
	      contentType:"application/json; charset=UTF-8", // 화면에서 ajax로 보내줄 데이터의 타입 data의 타입
	       // ajax가 성공적으로 동작했을때 할 작업
	      success : function(data){
	    	  let str = '';
	    	  console.log(data);
	    	  for(board of data.list){ // of => list에서 꺼낸 값을 하나씩 넣는 것
	    	  str += 
    			`<tr>`+
		        `<td>`+board.bd_num+`</td>`+
		        `<td>`+
			        `<a href="<%=request.getContextPath()%>/board/select/`+
		        board.bd_num+ 
			        `">` +
		        board.bd_title+
			        `</a>`+
		        `</td>`+
		        `<td>`+board.bd_me_id+`</td>`+
		        `<td>`+board.bd_reg_date_str+`</td>`+
		        `<td>`+board.bd_views+`</td>`+
		        `<td>`+board.bd_up+`/`+board.bd_down+`</td>`+
	      	`</tr>`;
	    	}
	  	  $('tbody').html(str);
	     	let pm = data.pm;
	     	let pmStr =  '';
	     	if(pm.prev){
						pmStr +=
						'<li class="page-item">' +
							'<a class="page-link" href="javascript:0;" onclick="criteria.page='+(pm.startPage-1)+';getBoardList(criteria)">이전</a>' +
						'</li>';
					}
			    for(let i = pm.startPage; i <= pm.endPage; i++){
			   		let active = pm.cri.page == i ? 'active' : '';
			    	pmStr +=
			    	'<li class="page-item '+ active + '">'+
			   			'<a class="page-link" href="javascript:0;" onclick="criteria.page='+(i)+';getBoardList(criteria)">' + i + '</a>'+
			   		'</li>';
			    }
					if(pm.next){
						pmStr +=	
						'<li class="page-item">' + 
							'<a class="page-link" href="javascript:0;" onclick="criteria.page='+(pm.endPage+1)+';getBoardList(criteria)">다음</a>' +
						'</li>';
					}
					$('.pagination').html(pmStr);
	    	}
			});
		}
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.tui-grid-cell .tui-grid-cell-content {
		text-align: center;
	}
</style>

<!-- Toast grid -->
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<script type="text/javascript" src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.js"></script>
<script src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<title>강의 조회 페이지</title>

<div align = "center">
	<h2>강의 조회 페이지</h2>
	<div id = "grid"></div>
</div> 

<script>

// 그리드

	var lecData = [
		
		<c:forEach items = "${lec}" var = "lec">{
			
			lnum 		: '${lec.lnum}' + '-' + '${lec.dividenum}',
			lname 		: '${lec.lname}',
			division 	: '${lec.division}',
			credit 		: '${lec.credit}',
			target 		: '${lec.target}',
			pname		: '<a href = "professorSelect?pname=${lec.pname}">${lec.pname}</a>',
			<!-- 교수 이름 클릭시 모달창 띄우고 교수 정보 불러오기 -->
			<!-- 페이지 넘어가면 안 되는데 a 링크 태우나? -->
			timetable 	: '${lec.timetable}',
			lrname 		: '${lec.lrname}'
		}
		
		<c:if test='${!empty lec.lnum}'>
		,
		</c:if>
		
		</c:forEach>
	];
	
// 그리드 api-source

	const dataSource = {
		
		withCredentials	: false,
		initialRequest	: false,
		contentType		: 'application/json',
		api : {
			
			readData	: {},
			updateData	: {
				
				url		: '',
				method	: ''
			}
		}
		
	};


// 그리드를 보여준다
	var grid = new tui.Grid({
		
		el: document.getElementById('grid'),
		data: dataSource,
		//rowHeaders: ['checkbox'],
		/* pagination: false,		//페이징 처리
	    pageOptions: {
	    	useClient: false,	//페이징 처리
	    	perPage: 10   		//페이징 갯수
	    }
		, */
		columns: [
			{header: '강의코드', name: 'lnum'},
			{header: '강의명', name: 'lname'},
			{header: '이수구분', name: 'division'},
			{header: '학점', name: 'credit'},
			{header: '대상학년', name: 'target'},
			{header: '교수', name: 'pname'},
			{header: '강의시간', name: 'timetable'},
			{header: '강의실', name: 'lrname'}
		] //컬럼갯수
		
	});

	grid.resetData(lecData) //그리드를 그려놓고 데이터를 넣음
	
// 그리드 끝

</script>
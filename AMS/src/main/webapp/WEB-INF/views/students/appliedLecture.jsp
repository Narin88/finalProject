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

<title>수강 신청된 과목 확인</title>

<div align = "center">
	<h2>수강 신청된 강의 리스트</h2>
</div>
<div id = "grid"></div>

<script>

// 그리드

	var lecData = [
		
		<c:forEach items = "${st}" var = "st">{
			
			lnum 		: '${st.lnum}' + '${st.dividenum}',
			lname 		: '${st.lname}',
			division 	: '${st.division}',
			credit 		: '${st.credit}',
			timetable 	: '${st.timetable}',
			lrname 		: '${st.lrname}',
			pname 		: '${st.pname}'
		}
		<c:if test='${!empty st.lnum}'>
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
		pagination: false,		//페이징 처리
	    pageOptions: {
	    	useClient: false,	//페이징 처리
	    	perPage: 10   		//페이징 갯수
	    }
		,
		columns: [
			{header: '강의코드', name: 'lnum', width: 100},
			{header: '강의명', name: 'lname', width: 100},
			{header: '이수구분', name: 'division', width: 100},
			{header: '학점', name: 'credit', width: 100},
			{header: '강의시간', name: 'timetable', width: 200},
			{header: '강의실', name: 'lrname', width: 200},
			{header: '교수', name: 'pname', width: 100}
			
			/* {header: '정원',name: 'newLimitCount',width: 80},
			{header: '강의실',name: 'lrName',width: 80},
			{header: '시간표',name: 'timeTable',width: 150, editor: 'text'} */
		] //컬럼갯수
		
	});

	grid.resetData(lecData) //그리드를 그려놓고 데이터를 넣음
	
// 그리드 끝

</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<script type="text/javascript" src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.js"></script>
<script src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
<div id="grid"></div>
	<script> 
		var clsData = [
			{lNum: '11111', pId: '11111', lrCode: '100100', newLimitCount: '50', timeTable: '월12:50~14:00', lYear: '2021', term: '1학기', book: '혼공자바', divideNum: '-01', dateStatus: '수강중'},
			{lNum: '11111', pId: '11111', lrCode: '100100', newLimitCount: '50', timeTable: '월12:50~14:00', lYear: '2021', term: '1학기', book: '혼공자바', divideNum: '-01', dateStatus: '수강중'},
			{lNum: '22222', pId: '11111', lrCode: '100100', newLimitCount: '50', timeTable: '월12:50~14:00', lYear: '2021', term: '1학기', book: '혼공자바', divideNum: '-01', dateStatus: '수강중'},
			{lNum: '33333', pId: '11111', lrCode: '100100', newLimitCount: '50', timeTable: '월12:50~14:00', lYear: '2021', term: '1학기', book: '혼공자바', divideNum: '-01', dateStatus: '수강중'},
			{lNum: '11111', pId: '11111', lrCode: '100100', newLimitCount: '50', timeTable: '월12:50~14:00', lYear: '2021', term: '1학기', book: '혼공자바', divideNum: '-01', dateStatus: '수강중'},
			{lNum: '22222', pId: '11111', lrCode: '100100', newLimitCount: '50', timeTable: '월12:50~14:00', lYear: '2021', term: '1학기', book: '혼공자바', divideNum: '-01', dateStatus: '수강중'},
			{lNum: '33333', pId: '11111', lrCode: '100100', newLimitCount: '50', timeTable: '월12:50~14:00', lYear: '2021', term: '1학기', book: '혼공자바', divideNum: '-01', dateStatus: '수강중'},
			{lNum: '11111', pId: '11111', lrCode: '100100', newLimitCount: '50', timeTable: '월12:50~14:00', lYear: '2021', term: '1학기', book: '혼공자바', divideNum: '-01', dateStatus: '수강중'},
			{lNum: '22222', pId: '11111', lrCode: '100100', newLimitCount: '50', timeTable: '월12:50~14:00', lYear: '2021', term: '1학기', book: '혼공자바', divideNum: '-01', dateStatus: '수강중'}
		]; //컬럼DATA

        // GRID 를 보여준다.
		var grid = new tui.Grid( {
			el: document.getElementById('grid'),
			pagination: true,   //페이징 처리
		    pageOptions: {
		    	useClient: true,   //페이징 처리
		    	perPage: 3   //페이징 갯수
		    }
			,
			columns: [
				{header: '강의번호',name: 'lNum', filter: 'text'},
				{header: '교수번호',name: 'pId'},
				{header: '강의실 번호',name: 'lrCode'},
				{header: '정원',name: 'newLimitCount'},
				{header: '강의시간',name: 'timeTable'},
				{header: '년도',name: 'lYear'},
				{header: '학기',name: 'term'},
				{header: '교재',name: 'book'},
				{header: '분반',name: 'divideNum'},
				{header: '강의 상태',name: 'dateStatus'}
			], //컬럼갯수
			data: clsData
		} );
	</script>
</body>
</html>
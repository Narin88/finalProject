<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Toast grid -->
	<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
	<link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
	<script type="text/javascript" src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.js"></script>
	<script src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>강의 꾸러미 :: No.M University</title>
</head>
<body>
<div align="center">
 
</div>
<div id="grid"></div>

<script>
var grid = new tui.Grid( {
	el: document.getElementById('grid'),
	data: {
			api:{
				readData:{ url: 'PreEnrolmentList',method: 'GET' }
			},
	contentType: 'application/json'
	},

	pagination: true,   //페이징 처리
    pageOptions: {
    	useClient: true,   //페이징 처리
    	perPage: 10   //페이징 갯수
    },
	columns: [
		{header: '강의번호',name: 'lnum', width: 100},
		{header: '과목명',name: 'lname', width: 100}, //강의번호+분반
		{header: '학점',name: 'credit',width: 100}, //년도+학기
		{header: '이수구분',name: 'division',width: 90},
		{header: '강의시간/강의실',name: 'timeTable',width: 100},
		{header: '재수강 여부',name: 'reTake',width: 100}
	] //컬럼갯수
} );
</script>
</body>
</html>
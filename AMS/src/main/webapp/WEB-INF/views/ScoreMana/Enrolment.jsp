<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
<title>Insert title here</title>
</head>
<body>

<div id="grid"></div>

 
<script>

//grid start
//grid api-source
	const dataSource = {
	  contentType: 'application/json',
	  api: {
		readData: {
			url: 'EnrolmentList',
			method: 'GET'
		}
	  }
	};
		
		
       // GRID 를 보여준다.
	var grid = new tui.Grid( {
		el: document.getElementById('grid'),
		data: {
				api:{
					readData:{ url: 'EnrolmentList',method: 'GET' }
				}
		},

		rowHeaders: ['checkbox'],
		pagination: true,   //페이징 처리
	    pageOptions: {
	    	useClient: true,   //페이징 처리
	    	perPage: 10   //페이징 갯수
	    },
		columns: [
			{header: '강의등록번호',name: 'openNum', width: 100},
			{header: '강의번호',name: 'lNum', width: 100}, //강의번호+분반
			{header: '년도',name: 'lYear',width: 100}, //년도+학기
			{header: '학년',name: 'grade',width: 100},
			{header: '과목명',name: 'lName',width: 200},
			{header: '이수구분',name: 'division',width: 100},
			{header: '강의실',name: 'lrName',width: 80},
			{header: '시간표',name: 'timeTable',width: 150},
			{header: '수강신청인원',name: 'enCount',width: 80},
			{header: '수강정원',name: 'newLimitCount',width: 80}
		] //컬럼갯수
	} );
//grid end

</script>
</body>
</html>
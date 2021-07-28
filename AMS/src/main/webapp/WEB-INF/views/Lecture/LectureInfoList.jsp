<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		var Btn = $('<button>');
		var clsData = [
			<c:forEach items="${Lectures }" var="Lec">
			{
				lName: '${Lec.lName}', lCode: '${Lec.lCode}', pId: '${Lec.pId}', pName: '${Lec.pName}',
				grade: '${Lec.grade}', limitCount: '${Lec.limitCount}', dCode: '${Lec.dCode}',
				division: '${Lec.division}', credit: '${Lec.credit}', Btn: Btn
			},
			</c:forEach>
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
				{header: '강의이름',name: 'lName'},
				{header: '과목코드',name: 'lCode'},
				{header: '교수코드',name: 'pId'},
				{header: '교수이름',name: 'pName'},
				{header: '학년',name: 'grade'},
				{header: '정원',name: 'limitCount'},
				{header: '이수코드',name: 'dCode'},
				{header: '이수구분',name: 'division'},
				{header: '학점',name: 'credit'},
				{header: '기능',name: 'Btn'}
			], //컬럼갯수
			data: clsData
		} );
	</script>
</body>
</html>
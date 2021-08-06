<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<title>성적관리</title>
</head>
<body>

<div align="center">
	<h2>{lYear}년도 {term}학기 강의 목록</h2>
</div>


<div id="grid"></div>
	<script> 
	//grid start
		var clsData = [
			<c:forEach items="${Lectures }" var="Lec">
			{
				lNum: '${Lec.LNum}', lName: '${Lec.LName}', pId: '${Lec.PId}',
				grade: '${Lec.grade}', limitCount: '${Lec.limitCount}', dCode: '${Lec.DCode}',
				division: '${Lec.division}', credit: '${Lec.credit}'
			},
			</c:forEach>
			]; //컬럼DATA

        // GRID 를 보여준다.
		var grid = new tui.Grid( {
			el: document.getElementById('grid'),
			pagination: true,   //페이징 처리
		    pageOptions: {
		    	useClient: true,   //페이징 처리
		    	perPage: 10   //페이징 갯수
		    }
			,
			columns: [
				{header: '강의번호',name: 'lNum'},
				{header: '강의이름',name: 'lName'},
				{header: '교수코드',name: 'pId'},
				{header: '학년',name: 'grade'},
				{header: '정원',name: 'limitCount'},
				{header: '이수코드',name: 'dCode'},
				{header: '이수구분',name: 'division'},
				{header: '학점',name: 'credit'},
			], //컬럼갯수
			data: clsData
		} );
	//grid end
	
		</script>
<script>

//그리드 이벤트
	$(function(){
		grid.on('click', ev => {
			console.log('더블클릭!', ev.rowKey);
			var data = grid.getRow(ev.rowKey); //그리드 한 행의 전체값
			location.href="/ScoreCheckLectureStudent";
		});
</script>
</body>
</html>
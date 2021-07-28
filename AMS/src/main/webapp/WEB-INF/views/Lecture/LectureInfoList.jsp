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
<div align="center">
<h2>수강 등록</h2>
</div>

<div class="modal">
	<div class="modal_content" title="클릭하면 창이 닫힙니다."> 여기에 모달창 내용을 적어줍니다.<br> 이미지여도 좋고 글이어도 좋습니다.
	</div>
</div>




<div id="grid"></div>
	<script> 
		var clsData = [
			<c:forEach items="${Lectures }" var="Lec">
			{
				lName: '${Lec.LName}', lCode: '${Lec.LCode}', pId: '${Lec.PId}',
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
				{header: '강의이름',name: 'lName'},
				{header: '과목코드',name: 'lCode'},
				{header: '교수코드',name: 'pId'},
				{header: '학년',name: 'grade'},
				{header: '정원',name: 'limitCount'},
				{header: '이수코드',name: 'dCode'},
				{header: '이수구분',name: 'division'},
				{header: '학점',name: 'credit'},
			], //컬럼갯수
			data: clsData
		} );
			
		grid.on('dblclick', ev => {
			console.log('더블클릭!', ev.rowKey);
			console.log(grid.getRow(ev.rowKey));
		});
	</script>
</body>
</html>
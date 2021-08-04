<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<script type="text/javascript"
	src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.js"></script>
<script
	src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
.tui-grid-cell .tui-grid-cell-content {
	text-align: center;
	align-content: center;
}
.container2{

}
.wrap{

}
.grid{
width: 110px;
height: 80px;
border:  1px solid black;
}
.tablehead{
border:  1px solid black;
width: 770px;
height: 100px;
}
.tbody{
border:  1px solid black;
}
table{
border:  1px solid black;
}
th tr td{
border:  1px solid black;
}
th.blank{
width: 40px;
height: 20px;

}
.time{
width: 130px;
border-bottom:  1px solid black;

}
.hours{

}
.hour{
width: 50px;
height: 800px;
border-bottom:  1px solid black;

}
</style>
<script>
    var _timetableGridInfo = [{"no":"1A","rows":[96,102],"hidden":false},{"no":"1B","rows":[102,108],"hidden":false},{"no":"2A","rows":[108,114],"hidden":false},{"no":"2B","rows":[114,120],"hidden":false},{"no":"3A","rows":[120,126],"hidden":false},{"no":"3B","rows":[126,132],"hidden":false},{"no":"4A","rows":[132,138],"hidden":false},{"no":"4B","rows":[138,144],"hidden":false},{"no":"5A","rows":[144,150],"hidden":false},{"no":"5B","rows":[150,156],"hidden":false},{"no":"6A","rows":[156,162],"hidden":false},{"no":"6B","rows":[162,168],"hidden":false},{"no":"7A","rows":[168,174],"hidden":false},{"no":"7B","rows":[174,180],"hidden":false},{"no":"8A","rows":[180,186],"hidden":false},{"no":"8B","rows":[186,192],"hidden":false},{"no":"9A","rows":[192,198],"hidden":false},{"no":"9B","rows":[198,204],"hidden":false},{"no":"10A","rows":[204,210],"hidden":false},{"no":"10B","rows":[210,216],"hidden":false},{"no":"11","rows":[216,226],"hidden":false},{"no":"12","rows":[226,236],"hidden":false},{"no":"13","rows":[236,246],"hidden":false},{"no":"14","rows":[246,256],"hidden":false},{"no":"15","rows":[256,266],"hidden":false},{"no":"16","rows":[266,276],"hidden":false},{"no":"","rows":[276,288],"hidden":false}];
    </script>
<title>내 강의 목록</title>
</head>
<body>
	<div></div>
	<div id="grid"></div>
	<script> 
		var Btn = $('<button>');
		var clsData = [
			<c:forEach items="${spList }" var="s">
				<c:choose>
					<c:when test="${empty s.content}">
						{
							lYear:'${s.LYear}', term:'${s.term}', lName: '${s.LName}', LNum: '${s.LNum}${s.dividenum}', PName: '${s.PName}',
							MName:'${s.MName}',DName: '${s.DName}', grade: '${s.grade}', 학점: '${s.credit}',
							division: '${s.division}', credit: '${s.credit}', 
							Btn: '<button  onclick=location.href="studyPlanInsertPage?opennum=${s.opennum}">등록</button>'
						},
					</c:when>
					<c:otherwise>
						{
								lYear:'${s.LYear}', term:'${s.term}', lName: '${s.LName}', LNum: '${s.LNum}${s.dividenum}', PName: '${s.PName}',
								MName:'${s.MName}',DName: '${s.DName}', grade: '${s.grade}', 학점: '${s.credit}',
								division: '${s.division}', credit: '${s.credit}', 
								Btn: '<button onclick=location.href="studyPlanUpdatePage?opennum=${s.opennum}">수정</button><button onclick=location.href="readOnly2?opennum=${s.opennum}">읽기전용</button>'
										
						},
					</c:otherwise>
				</c:choose>
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
				{header: '강의년도',name: 'lYear'},
				{header: '강의학기',name: 'term'},
				{header: '강의이름',name: 'lName'},
				{header: '강의코드',name: 'LNum'},
				{header: '교수이름',name: 'PName'},
				{header: '개설대학',name: 'MName'},
				{header: '수강학과',name: 'DName'},
				{header: '대상학년',name: 'grade'},
				{header: '학점',name: 'credit'},
				{header: '이수구분',name: 'division'},
				{header: '강의계획서등록',name: 'Btn'}
			], //컬럼갯수
			data: clsData
		} );
	</script>

</body>

</html>
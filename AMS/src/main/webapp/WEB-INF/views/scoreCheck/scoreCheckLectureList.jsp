<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="toDay" class="java.util.Date" />
<fmt:formatDate value='${toDay}' pattern='yyyy' var="nowDate"/>

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

<title>성적 관리 :: No.M University</title>
</head>
<body>
<div class="content-page">
	<div class="card-body">
		<div align="center">
			<h2>${nowDate }년도 학기 강의 목록</h2>
		</div>
		<div id="grid"></div>
	</div>
</div>
<script> 

//grid start

	let open = [];

	 $(function(){
		grid.on('dblclick', ev => {
				   var data = grid.getRow(ev.rowKey);
				   var open = data.opennum;

				   location.href ="ScoreCheckLectureStudent?opennum="+open; 
		}); 
	 });
	 
		var clsData = [
			<c:forEach items="${lectures }" var="lec">{
				opennum: '${lec.opennum}', lnum: '${lec.lnum}-${lec.dividenum}', lyear: '${lec.lyear}', grade: '${lec.grade}', lname: '${lec.lname}', book: '${lec.book}', division: '${lec.division}', newlimitcount: '${lec.newlimitcount}', lrname: '${lec.lrname}', timetable: '${lec.timetable}'
			}
			<c:if test='${!empty lec.opennum}'>
			,
			</c:if>
			</c:forEach>
			]; 

		
       // GRID 를 보여준다.
	var grid = new tui.Grid( {
		el: document.getElementById('grid'),
		data: clsData,
		
		pagination: true,   //페이징 처리
	    pageOptions: {
	    	useClient: true,   //페이징 처리
	    	perPage: 10   //페이징 갯수
	    }
		,
		columns: [
			{header: '강의등록번호',name: 'opennum',width: 130},
			{header: '강의번호',name: 'lnum',width: 130}, //강의번호+분반
			{header: '년도',name: 'lyear' ,width: 150}, //년도+학기
			{header: '학년',name: 'grade',width: 100},
			{header: '과목명',name: 'lname'},
			{header: '교재',name: 'book'},
			{header: '이수구분',name: 'division'},
			{header: '정원',name: 'newlimitcount',width: 100},
			{header: '강의실',name: 'lrname'},
			{header: '시간표',name: 'timetable'}
		] //컬럼갯수

	} );
       

//grid end

	//grid end
	

//그리드 이벤트

</script>

</body>
</html>
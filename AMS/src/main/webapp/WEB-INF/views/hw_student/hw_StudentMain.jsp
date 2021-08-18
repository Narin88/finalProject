<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>과제 리스트::No.M University</title>
<style>

.tui-grid-cell .tui-grid-cell-content {
	text-align: center;
}
.modalBtn{ 
	margin-left: -30px;
	border-radius: 1em;
	background-color: lightpink;
	color: white;
	padding-left: 2em;
	padding-right: 2em;
	padding-top: 8px;
	padding-bottom: 5px;
	font-size: 20px;
	border: none;
}	
.btn15 {
	height: 15px;
}
.movebox{
	display: inline;
	float: right;
}

</style>
</head>
<body>
<div class="content-page">
	<div class="card-body">
		<div align="center" style="margin-top: 10px;">	
			
			<h2 style="display: inline;"> 수강중인 강의목록</h2>		
			<div class="movebox"style=" width:100%;">
				<button style="float:right;" type="button" class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light" onclick="location.href='submitList'">제출한 과제</button>
				
			</div>
			<div>		
				<b style="font-weight: bold;float:right;"># 과제버튼을 클릭시 해당강의 <font color="red">과제목록이</font> 출력됩니다. <br># 제출한 과제 클릭시 <font color="red">제출한 과제목록이</font> 출력됩니다.</b>
			</div>	
		</div>
		<div class="gridTb1">
			<div id="grid" ></div>
		</div>
		<form id="hwStFrm" name="hwStFrm" action="hwSelect" method="post">
			<sec:csrfInput/>
			<input type="hidden" id="opennum" name="opennum">
			<!-- 히든값 -->
			<input type="hidden" id="lname" name="lname">
		</form>
	</div>
</div>

<script>
//grid start
	var clsData = [
		<c:forEach items="${result }" var="list">
		{
			mname: '${list.mname}', lname: '${list.lname}', lyear : '${list.lyear}',
			term: '${list.term}', lrcode: '${list.lrcode}', pname: '${list.pname}',schedule: '${list.schedule}',
			hwBtn:'<button type="button" id="hwClick" data-id="${list.opennum}" data-name="${list.lname}"class ="btn btn-facebook m-l-10 waves-effect waves-light btn15">과제</button>'
			,opennum:'${list.opennum}'
		},
		</c:forEach>
	]; //컬럼DATA	

		
// GRID 를 보여준다.
	var grid = new tui.Grid( {
		el: document.getElementById('grid'),
		bodyHeight:230,
		pagination: true,   //페이징 처리
		pageOptions: {
			useClient: true,   //페이징 처리
			perPage: 5   //페이징 갯수
		},
	columns: [
		{header: '전공이름',name: 'mname',width:150},
		{header: '과목명',name: 'lname',width:130}, //강의번호+분반
		{header: '강의년도',name: 'lyear',width:90}, //년도+학기
		{header: '학기',name: 'term',width:80},
		{header: '강의실',name: 'lrcode',width:100},
		{header: '교수명',name: 'pname',width:140},
		{header: '시간표',name: 'schedule'},
		{header: '과제',name: 'hwBtn',width:120},
	], //컬럼갯수
	data: clsData
	});

	/*	
				grid.on('dblclick', ev => {
	      		//console.log('더블클릭!', ev.rowKey);
	      		var data = grid.getRow(ev.rowKey); //그리드 한 행의 전체값
	      		var opennum = data.opennum;
	      		
	      		hwStFrm.opennum.value=opennum;
	     			hwStFrm.submit(); 		
	      		
	      	});
		*/
	$(".card-body").on("click","#hwClick",function(){
		var a=$(this).data('id');
		var b=$(this).data('name');
		console.log(a);
		hwStFrm.lname.value=b;
		hwStFrm.opennum.value=a;
		hwStFrm.submit()
	});
</script>
</body>
</html>
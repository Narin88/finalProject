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
<title>강의 꾸러미 :: No.M University</title>
<style>
.seachBox{
	padding-left : 20px;
	font-size: 13px;
	margin-bottom: 10px;
}
</style>
</head>
<body>
<div class="seachBox">
대학 : <select id ="depart" name="depart">
 	<option value="defaultV">선택</option>
 	<c:forEach items="${depart }" var="dvo">	
 		<option value="${dvo.dcode }">${dvo.dname }</option>
 	</c:forEach>
 </select>
 전공 : <select id="major" name="major">
 	<option value="defaultV">선택</option>
 </select>
 <button onclick="getSeach()">검색</button>
</div>
<div id="grid"></div>

<script>
var grid = new tui.Grid( {
	el: document.getElementById('grid'),
	data: {
			api:{
				readData:{ url: 'PreEnrolmentList',method: 'POST' }
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
		{header: '강의시간/강의실',name: 'timetable',width: 100},
		{header: '재수강 여부',name: 'retake',width: 100}
	] //컬럼갯수
} );
function getSeach(){
	var major = $('#major').val();
	var depart = $('#depart').val();
	var seachD = {dcode:depart, mcode:major};
	console.log(seachD);
	grid.readData(1,seachD,true);
}


$("#depart").change(function(){
	var depart = $(this).val();
	var major;
	if(depart == 'defaultV'){
		$("select[name='major'] option").remove();
		major += '<option value="defaultV">선택</option>';
		$('#major').append(major);
	}else{
		$("select[name='major'] option").remove();
		$.ajax({
			url:'getMajorList',
			type: 'GET',
			data:{dcode: depart},
			success: function(result){
			$.each(result, function(i,v){
		 		major += '<option value="'+v.mcode+'">'+v.mname+'</option>';			
			})
		 	$('#major').append(major);
			}
		})
	}
})




</script>
</body>
</html>
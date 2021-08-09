<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.tui-grid-cell .tui-grid-cell-content {
   text-align: center;
}
.tbl{
	width: 80%;
	border-spacing: 0;
    border-collapse: collapse;
}
.infotitle{
	border-bottom: 1px solid #dedede !important;
    color: #212121;
    font-size: 15px;
    text-transform: uppercase;
    text-align: center;
    font-weight: 600;
    height: 30px;
}
.info{
	border-bottom: 1px solid #dedede !important;
    color: #212121;
    font-size: 15px;
    text-transform: uppercase;
    text-align: center;
    color: darkgray;
    }
.grid{
	margin-top: 20px;
	margin-bottom: 10px;
}
.scoreList{
	margin-top: 30px;
}
</style>
<!-- Toast grid -->
	<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
	<link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
	<script type="text/javascript" src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.js"></script>
	<script src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
<title>수강신청 :: No.M University</title>
</head>
<body>
<div align="center">
	<div align="center">
		<table id="tbl" class="tbl">
			<tr>
				<td class = "infotitle">년도/학기</td><td class = "info">${student.lyear }/${student.target }</td>
				<td class = "infotitle">학번</td><td class = "info">${student.sid }</td>
				<td class = "infotitle">성명</td><td class = "info">${student.sname }</td>
			</tr>
			<tr>
				<td class = "infotitle">학과</td><td class = "info">${student.dname }</td>
				<td class = "infotitle">학년</td><td class = "info">${student.grade }</td>
				<td class = "infotitle">인정학기</td>
				<td class = "info">${(student.grade*2) - (2-student.term) }</td>
			</tr>
			<tr >
				<td colspan="3" class = "infotitle">신청가능학점</td><td colspan="3" id="credit" class = "info"></td>
			</tr>
		</table>
	</div>
</div>

<div id="grid" class="grid">
	<h2 align="center"> 수강신청 리스트 </h2>
	<div class="seachbox" align="right">
		<select id="seachgubun">
			<option value="lname">과목명</option>
			<option value="lnum">과목번호</option>
		</select>
		<input type="text" id="seach" name="seach">
		<button type="button" onclick="getList()">검색</button>
	</div>
</div>
<div id="scoreList" class="scoreList">
	<h3 align="center"> 나의 수강 목록</h3>
	<div align="right">
		<button type="button" id="deleteBtn">수강 취소</button>
	</div>
</div>
 
<script>

$(function(){
	//학생 학점 체크
	//window.open("resources/html/popup.html","팝업 테스트","width=500, height=500, top=10, left=500");
	$.ajax({
		url: 'AjaxcreditCheck',
		type: 'GET',
		success: function(result){
			$('#credit').append(20-result);
			console.log(20-result);
		}
	})
})
//grid start
       // GRID 를 보여준다.
	var grid = new tui.Grid( {
		el: document.getElementById('grid'),
		data: {
				api:{
					readData:{ url: 'EnrolmentList',method: 'POST' }
				},
		contentType: 'application/json'
		},

		pagination: true,   //페이징 처리
	    pageOptions: {
	    	useClient: true,   //페이징 처리
	    	perPage: 5   //페이징 갯수
	    },
		columns: [
			{header: '등록번호',name: 'opennum', width: 100},
			{header: '강의번호',name: 'lnum', width: 100}, //강의번호+분반
			{header: '년도',name: 'lyear',width: 100}, //년도+학기
			{header: '학년',name: 'grade',width: 90},
			{header: '과목명',name: 'lname'},
			{header: '학점',name: 'credit',width: 100},
			{header: '학과',name: 'dname',width: 100},
			{header: '전공',name: 'mname',width: 100},
			{header: '이수구분',name: 'division',width: 100},
			{header: '강의실',name: 'lrname',width: 90},
			{header: '시간표',name: 'timetable',width: 100},
			{header: '신청인원',name: 'encount',width: 100},
			{header: '수강정원',name: 'newlimitcount',width: 80}
		] //컬럼갯수
	} );
	
	//수강등록된 리스트
	var scoreList = new tui.Grid( {
	el: document.getElementById('scoreList'),
	data: {
			api:{
				readData:{ url: 'scoreList', method: 'POST' }
			},
	contentType: 'application/json'
	},
	rowHeaders: ['checkbox'],
	columns: [
		{header: '등록번호',name: 'opennum', width: 100},
		{header: '강의번호',name: 'lnum', width: 100}, //강의번호+분반
		{header: '년도',name: 'lyear',width: 100}, //년도+학기
		{header: '학년',name: 'grade',width: 90},
		{header: '과목명',name: 'lname'},
		{header: '학점',name: 'credit',width: 100},
		{header: '학과',name: 'dname',width: 100},
		{header: '전공',name: 'mname',width: 100},
		{header: '이수구분',name: 'division',width: 100},
		{header: '강의실',name: 'lrname',width: 90},
		{header: '시간표',name: 'timetable',width: 100}
	] //컬럼갯수
} );
	//수강 취소
	$('#deleteBtn').click(function(){
		var data = scoreList.getCheckedRows();
		var con = confirm('정말로 취소하시겠습니까?');
		if(con){
			$.ajax({
				url:'deletescore',
				type:'POST',
				data: JSON.stringify(data),
				contentType: 'application/json',
				success: function(result){
					alert(result.success+'건이 취소 되었습니다.');
					location.href="ScoreManaPage";
				}
			})
		}else{
			return false;
		}
	});
	
	//검색
    function getList(){
    	var seachgubun = $('#seachgubun').val()
    	console.log(seachgubun);
    	var seach = {seach:$('#seach').val(), seachgubun: seachgubun};
    	console.log(seach);
    	grid.readData(1,seach,true);
    }
    //grid 더블클릭 이벤트
	grid.on('dblclick', ev => {
		//console.log('더블클릭!', ev.rowKey);
		var data = grid.getRow(ev.rowKey); //그리드 한 행의 전체값
		
		var encount = data.encount;
		var limit = data.newlimitcount;
		var opennum = data.opennum;
		var lname = data.lname;
		var credit = data.credit;
		console.log(data);
		//조건 검사
		 //중복x -> 재이수 확인
			if(encount>=limit){ //정원 초과시
				alert("수강정원이 마감되었습니다."); 
			}
			 var remain = $('#credit').html();
		 		console.log(remain,credit);
			if(remain-credit<0){ //20학점 초과검사
				alert('20학점을 초과하였습니다.');
				return false;
			}
			 $.ajax({
				url: 'AjaxRetakeChek',
				type: 'POST',
				data: {opennum: opennum},
				success: function(result){
				if(result=='001'){ //insert
					var con = confirm('재수강 과목입니다. 재수강 할 경우 최종점수 B학점 입니다.')
					if(con){
						location.href='AjaxEnrolmentInsert?opennum='+opennum
					}else{
						return false;
						}
					}
				else{ //insert
					var con = confirm('강의번호 '+opennum+'의 과목 '+lname+' 신청하시겠습니까?')
					if(con){
						location.href='AjaxEnrolmentInsert?opennum='+opennum
					}else{
						return false;
					}
				}
			}
			})
	});


//grid end


</script>
</body>
</html>
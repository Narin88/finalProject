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
    height: 50px;
}
.info{
	border-bottom: 1px solid #dedede !important;
    color: #212121;
    font-size: 15px;
    text-transform: uppercase;
    text-align: center;
    color: darkgray;
    }
.seachbox{
	margin-bottom: 5px;
}
</style>
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
<div align="center">
	<h2>수강 신청</h2>
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
	<div>
		<h3>수강신청 주의사항</h3>
		수강신청은 더블클릭 하셔야 신청이 됩니다. 
	</div>
</div>
<div class="seachbox" align="right">
	<select id="seachgubun">
		<option value="lname">과목명</option>
		<option value="lnum">과목번호</option>
	</select>
	<input type="text" id="seach" name="seach">
	<button type="button" onclick="getList()">검색</button>
</div>
<div id="grid"></div>

 
<script>

$(function(){
	//학생 학점 체크
	
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
	    	perPage: 10   //페이징 갯수
	    },
		columns: [
			{header: '등록번호',name: 'openNum', width: 100},
			{header: '강의번호',name: 'lnum', width: 100}, //강의번호+분반
			{header: '년도',name: 'lyear',width: 100}, //년도+학기
			{header: '학년',name: 'grade',width: 90},
			{header: '과목명',name: 'lname',width: 100},
			{header: '학점',name: 'credit',width: 100},
			{header: '학과',name: 'dname',width: 100},
			{header: '전공',name: 'mname',width: 100},
			{header: '이수구분',name: 'division',width: 100},
			{header: '강의실',name: 'lrName',width: 90},
			{header: '시간표',name: 'timeTable',width: 100},
			{header: '신청인원',name: 'enCount',width: 100},
			{header: '수강정원',name: 'newLimitCount',width: 80}
		] //컬럼갯수
	} );
    function getList(){
    	var seachgubun = $('#seachgubun').val()
    	console.log(seachgubun);
    	var seach = {seach:$('#seach').val(), seachgubun: seachgubun};
    	console.log(seach);
    	grid.readData(1,seach,true);
    }
    //grid 이벤트
	grid.on('dblclick', ev => {
		//console.log('더블클릭!', ev.rowKey);
		var data = grid.getRow(ev.rowKey); //그리드 한 행의 전체값
		
		var enCount = data.enCount;
		var limit = data.newLimitCount;
		var opennum = data.openNum;
		var lname = data.lname;
		var credit = data.credit;
		console.log(data);
		//조건 검사
		


			$.ajax({
				url: 'AjaxConfirm',
				type:'POST',
				data: {openNum: opennum},
				success: function(result){
					
					 if(result>0){ //이미 등록된 수강일 경우
						var con1 = confirm('이미 수강신청 되었습니다. 취소하시겠습니까?')
						if(con1){ //수강 취소(삭제)
							location.href='AjaxEnrolmentDelete?openNum='+opennum
						}else{
							return false;
						}
					}
					 else{ //중복x -> 재이수 확인
						if(enCount>=limit){ //정원 초과시
							alert("수강정원이 마감되었습니다."); 
						}
						 var remain = $('#credit').html();
					 		console.log(remain,credit);
							if(remain-credit<0){
								alert('20학점을 초과하였습니다.');
								return false;
							}
						 $.ajax({
							 url: 'AjaxRetakeChek',
							 type: 'POST',
							 data: {openNum: opennum},
						 success: function(result){
							if(result=='001'){ //insert
								var con = confirm('재수강 과목입니다. 재수강 할 경우 최종점수 B학점 입니다.')
								if(con){
									location.href='AjaxEnrolmentInsert?openNum='+opennum
								}else{
									return false;
									}
								}
							else{ //insert
								var con = confirm('강의번호 '+opennum+'의 과목 '+lname+' 신청하시겠습니까?')
									if(con){
										location.href='AjaxEnrolmentInsert?openNum='+opennum
									}else{
										return false;
									}
								}
							}
						 })
					 }
				}
			});
	});


//grid end


</script>
</body>
</html>
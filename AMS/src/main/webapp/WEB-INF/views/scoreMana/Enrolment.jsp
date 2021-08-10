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

#showmodal {
  display: none;
  width: 80%;
  height: 40%;
  padding: 30px 60px;
  background-color: #fefefe;
  border: 1px solid #888;
  border-radius: 3px;
}
#showmodal .modal_close_btn {
  position: absolute;
  top: 10px;
  right: 10px;
}

.modal-body {
  font-size: 10pt;
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
				<td colspan="2" class = "infotitle">신청가능학점</td><td colspan="2" id="credit" class = "info"></td>
				<td colspan="2" class = "info"><button id="preEnrolList">내 수강 꾸러미</button> </td>
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
 
 
  <!-- model -->

    <div id="showmodal" align="center">
      <a class="modal_close_btn">닫기</a>
      <div class="modal-body" id="pdfwrap">
        <h2>수강 등록</h2>
          <sec:csrfInput />
          <table class="tbl" id="preEnroltbl" border="1">
            <thead>
              <tr>
                <th class = "infotitle">등록번호</th>
                <th class = "infotitle">강의번호/분반</th>
                <th class = "infotitle">과목명</th>
                <th class = "infotitle">학점</th>
                <th class = "infotitle">이수구분</th>
                <th class = "infotitle">강의시간/강의실</th>
                <th class = "infotitle">재수강 여부</th>
                <th class = "infotitle">비고</th>
              </tr>
            </thead>

            <tbody></tbody>
          </table>
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
				return false;
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
$('#preEnrolList').click(function(){
	preEnrolmentList();
})

//모달 start
function preEnrolmentList() {
	modal('showmodal');
	$.ajax({
		url: 'getpreenrolment',
		type: 'POST',
		success: function(result){
     			var row='<tr>';
     			if($.isEmptyObject(result)){
     				row += '<td colspan="8" align="center" class="info"> 수강 꾸러미 내역이 비어 있습니다 :)</td></tr>';
     			}
      			$.each(result,function(i){
     				row += '<td class="info">'+result[i].opennum+'</td><td class="info">'+result[i].lnum+'</td><td class="info">'+result[i].lname+'</td><td class="info">'+result[i].credit+
     				'</td><td class="info">'+result[i].division+'</td><td class="info">'+result[i].timetable+'</td><td class="info">'+result[i].retake+'</td><td class="info">'+
     				'<button id = \'preinsertbtn'+result[i].opennum+'\' onclick=\'preinsert('+result[i].opennum+')\'>신청</button></td></tr>';
     			})

     			$("#preEnroltbl tbody").empty();
     			$("#preEnroltbl tbody").append(row);
		}
	})

}

function preinsert(num){
	var remain = $('#credit').html();
	var opennum = num;
	$.ajax({
		url:'oneselectLecture',
		data:{opennum: opennum},
		type: 'POST',
		success: function(one){
			console.log(one);
			if(one.encount>=one.newlimitcount){ //정원 초과시
				alert("수강정원이 마감되었습니다."); 
				return false;
			}
			if(remain-one.credit<0){ //20학점 초과검사
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
						location.href='AjaxEnrolmentInsert?opennum='+opennum;
						location.href='AjaxPreEnrolmentdelete?opennum='+opennum;
					}else{
						return false;
						}
					}
				else{ //insert
					var con = confirm('수강신청 하시겠습니까?')
					if(con){
						location.href='AjaxEnrolmentInsert?opennum='+opennum;
						location.href='AjaxPreEnrolmentdelete?opennum='+opennum;
					}else{
						return false;
					}
				}
			}
			})
		}
		
	})
}

function modal(mm) {
    var zIndex = 9999;
    var modal = document.getElementById(mm);

    // 모달 div 뒤에 희끄무레한 레이어
    var bg = document.createElement('div');
    bg.setStyle({
        position: 'fixed',
        zIndex: zIndex,
        left: '0px',
        top: '0px',
        width: '100%',
        height: '100%',
        overflow: 'auto',
        // 레이어 색갈은 여기서 바꾸면 됨
        backgroundColor: 'rgba(0,0,0,0.4)'
    });
    document.body.append(bg);

    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
    modal.querySelector('.modal_close_btn').addEventListener('click', function() {
        bg.remove();
        modal.style.display = 'none';
    });

    modal.setStyle({
        position: 'fixed',
        display: 'block',
        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

        // 시꺼먼 레이어 보다 한칸 위에 보이기
        zIndex: zIndex + 1,

        // div center 정렬
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        msTransform: 'translate(-50%, -50%)',
        webkitTransform: 'translate(-50%, -50%)'
    });
}

// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
Element.prototype.setStyle = function(styles) {
    for (var k in styles) this.style[k] = styles[k];
    return this;
};

</script>
</body>
</html>
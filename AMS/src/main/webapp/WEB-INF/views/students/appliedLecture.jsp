<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 


할 일

1. 테이블 높이 일정하도록 css 먹이기



 -->


<style>
	#my_offer {
		display: none;
		width: 80%;
		height: 40%;
		padding: 30px 60px;
		background-color: #fefefe;
		border: 1px solid #888;
		border-radius: 3px;
	}
	
	#my_offer .modal_close_btn {
		position: absolute;
		top: 10px;
		right: 10px;
	}
	
	.modal-body {
		font-size: 10pt;
	}
	
	.professorInfo { -
		-bs-table-bg: transparent; -
		-bs-table-striped-color: #212529; -
		-bs-table-striped-bg: rgba(0, 0, 0, 0.05); -
		-bs-table-active-color: #212529; -
		-bs-table-active-bg: rgba(0, 0, 0, 0.1); -
		-bs-table-hover-color: #212529; -
		-bs-table-hover-bg: rgba(0, 0, 0, 0.075);
		width: 100%;
		color: #212529;
		vertical-align: top;
		border-color: #dee2e6;
	}
	
	.tui-grid-cell .tui-grid-cell-content {
		text-align: center;
	}
	
	th, td {
		border: 1;
		border-color: inherit;
		border-style: solid;
		/*border-width: 0;*/
		text-align: center;
		padding: 10px;
		width: 150px;
	}
	
	td[data-column-name="pname"] {
		color : skyblue;
	}
	
	td[data-column-name="lname"] {
		color : skyblue;
	}
	
</style>

<!-- Toast grid -->
<link rel="stylesheet" href="resources/css/studentsInfo.css" />

<title>수강 신청된 과목 확인</title>

<div align="center">
	<h2>수강 신청된 강의 리스트</h2>
	<div id="grid"></div>
	<div class="total">
		<div class="scheduleTime"></div>
		<p></p>
		<div id="scheduleShow"></div>
	</div>
</div>

<!-- 모달 뷰-->
<div id="my_offer" align="center">
	<a class="modal_close_btn">닫기</a>
	<div class="modal-body">
		<h2>교수 정보</h2>
		<table class="professorInfo" id="professorInfo" border="1">
			<thead>
				<tr>
					<th>교수명</th>
					<th>연락처</th>
					<th>이메일</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
</div>
<!-- 모달 끝 -->

<!-- 히든 -->
<%-- <div id = "hiddenData">
	<c:forEach items = "${st }" var = "hi" varStatus = "seq">
		<input type = "hidden" id = "hidden_lname${seq.count }" value = "${hi.lname }">
		<input type = "hidden" id = "hidden_timetable${seq.count }" value = "${hi.timetable }">
		<input type = "hidden" id = "hidden_lrname${seq.count }" value = "${hi.lrname }">
	</c:forEach>
</div> --%>

<script>
	let colorArr = ['table-danger', 'table-warning', 'table-info', 'table-success', 'table-primary', 'table-active'];
	//let totaltime = "";
	
	// 강의 시간을 한 문자로 묶기(ex : 월1화2...)
	let getValue = [];
 	<c:forEach items = "${st}" var = "st" varStatus = "seq">
		//totaltime += '${st.timetable}'
		getValue["${st.timetable }"] = ['${st.lname}','${st.lrname}', colorArr[${seq.index}]];
	</c:forEach>
	
	//console.log("밸류 : " ,getValue);	
		
	////////////////////////////////////
	
	// 그리드
	var lecData = [
		
		<c:forEach items = "${st}" var = "st">{
			// 이 페이지 실질적 데이터
			lnum 		: '${st.lnum}' +'-' + '${st.dividenum}',
			lname 		: '${st.lname}',
			division 	: '${st.division}',
			credit 		: '${st.credit}',
			timetable 	: '${st.timetable}',
			lrname 		: '${st.lrname}',
			pname 		: '${st.pname}',
			
			// 필요에 의한 값 땡겨오기.
			email		: '${st.email}',
			pphone		: '${st.pphone}',
			pid			: '${st.pid}',
			opennum		: '${st.opennum}',
			evaluation: '<button id="openbtn${st.opennum}" onclick="openpage(${st.opennum})">확인</button>'
				
		}
		<c:if test='${!empty st.lnum}'>
		,
		</c:if>
		</c:forEach>
	];
	
	// 그리드를 보여준다
	var grid = new tui.Grid({
		
		el: document.getElementById('grid'),
		data: lecData,
		columns: [
			{header: '강의코드', name: 'lnum'},
			{header: '강의명', name: 'lname'},
			{header: '이수구분', name: 'division'},
			{header: '학점', name: 'credit'},
			{header: '강의시간', name: 'timetable'},
			{header: '강의실', name: 'lrname'},
			{header: '교수', name: 'pname'},
			{header:'강의평가',name:'evaluation'}
			
		] //컬럼갯수
	});

	grid.resetData(lecData) //그리드를 그려놓고 데이터를 넣음
	// 그리드 끝

	//모달 start
	document.addEventListener("DOMContentLoaded", function(){
		grid.on('click', ev =>{
			
			var data = grid.getRow(ev.rowKey);
			
			if (ev.columnName == "pname") {
				showOffer(data);
			}
			
			if (ev.columnName == "lname"){
				// 쿼리에 필요한 값 적용시키기
				let pid 	= data.pid;
				let opennum = data.opennum;
				
				console.log("pid 값 : " + pid);
				console.log("opennum 값 : " + opennum);
				
				location.href = "/readOnly2?pid=" + pid + "&opennum=" + opennum;
			}
		});
	
		function showOffer(data) {
			
			modal('my_offer');
			
			var pname = data.pname;
			var email = data.email;
			var pphone = data.pphone;
			
			$("#professorInfo tbody").empty();
			$('<tr>')
			.append($('<td>').html(pname))
			.append($('<td>').html(pphone))
			.append($('<td>').html(email))
			.appendTo("#professorInfo tbody"); 
			
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

	});
</script>
<script>

	// 테이블에 타이틀 추가하기 기능
	function addTitle() {
		
		let thead = $("<thead />").attr("class", "thead-dark");
		let title = $('<tr />');
		title.append(
			$('<th scope="col" style="width: 15%"  />').html(''),
			$('<th scope="col" style="width: 17%" />').html('월'),
			$('<th scope="col" style="width: 17%" />').html('화'),
		   	$('<th scope="col" style="width: 17%" />').html('수'),
		   	$('<th scope="col" style="width: 17%" />').html('목'),
		   	$('<th scope="col" style="width: 17%" />').html('금')
		);
		thead.append(title);
		
		return thead;
	};

	document.addEventListener("DOMContentLoaded", function(){
		
		// 테이블 생성
		let sTable = $('<table />').attr('class', 'table showSchedule').attr("style", "width:1000px; height: 550px;");
		sTable.append(addTitle());
		
		let week = [
			"",
			"월",
			"화",
			"수",
			"목",
			"금"
		];
		
		let timeseq =[
			`1교시<br>09:00 ~ 10:00`,
			`2교시<br>09:00 ~ 10:00`,
			`3교시<br>09:00 ~ 10:00`,
			`4교시<br>09:00 ~ 10:00`,
			`5교시<br>09:00 ~ 10:00`,
			`6교시<br>09:00 ~ 10:00`,
			`7교시<br>09:00 ~ 10:00`,
			`8교시<br>09:00 ~ 10:00`,
			`9교시<br>09:00 ~ 10:00`,
		];
		/* "1교시" + "<br>" + "09:00 ~ 10:00",
		"2교시" + "<br>" + "09:00 ~ 10:00",
		"3교시" + "<br>" + "09:00 ~ 10:00",
		"4교시" + "<br>" + "09:00 ~ 10:00",
		"5교시" + "<br>" + "09:00 ~ 10:00",
		"6교시" + "<br>" + "09:00 ~ 10:00",
		"7교시" + "<br>" + "09:00 ~ 10:00",
		"8교시" + "<br>" + "09:00 ~ 10:00",
		"9교시" + "<br>" + "09:00 ~ 10:00" */
		
		for(let i = 0; i < timeseq.length; i++){
			let tr = $('<tr />');
			for(let j = 0; j < week.length; j++){
				
			//	console.log("위크 : " + week[j] + i);
			//	console.log("토탈 : " + totaltime.indexOf(week[j] + i));
				/* 
				let time = null;
				let lec = null;
				let room = null;
				try {
					// for문 반복 횟수보다 아이디가 부족할 경우 value 없다고 에러뜸
					
					time = document.getElementById('hidden_timetable' + i).value;
					lec = document.getElementById('hidden_lname' + i).value;
					room = document.getElementById('hidden_lrname' + i).value;
				} catch (e) {
					console.log(e);
				}
				 */
				// console.log('시간 : ' + time);
				// console.log('강의명 : ' + lec);
				// console.log('장소 : ' + room);
				
				if (j == 0){
					// 테이블 첫 번째 자리에 강의 시간 집어넣기
					
					// td에 아이디값 안 줘도 될 듯? 
					// tr.append($('<td class="table-secondary timeCol" id = "jackpot'+ i + '-' + j +'"/>').html(timeseq[i]));
					tr.append($(`<td class = table-secondary timeCol id = jackpot${i}-${j}>)`).html(timeseq[i]));
	
				} else {
					
					let curTime = week[j] + (i + 1);
					//console.log("컬타임 : " + curTime);
					
					//과목찾기
					let lectureName = "";
					let tColor = "";
					for(lectureTime in getValue){
						if(lectureTime.indexOf(curTime) != -1){
							tColor = " class = '" + getValue[lectureTime][2] + " detailCul'";
							lectureName = getValue[lectureTime][0] + "<br>" + lectureTime + "<br>" + getValue[lectureTime][1];
						}
					}
					//console.log(lectureName);
						
					// 강의 집어넣기
					tr.append($('<td '+ tColor +' id =  "jackpot'+ i+ '-' + j + '"/>').html(lectureName));
				}
			}
			sTable.append(tr);
		}
		$('#scheduleShow').append(sTable);
	});
	
	
	function openpage(data){
		var opennum = data;
		location.href="Evaluation?opennum="+opennum
	}
	
</script>
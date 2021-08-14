<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>
	.tui-grid-cell .tui-grid-cell-content {
		text-align: center;
	}
	
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

<title>수정 :: No.M University</title>

<!-- 본체 -->
<div class="content-page">
<div align = "center">
	<h2>강의 조회 페이지</h2>
		<div class = "selectArea">
			<font>학과 : </font>
			<select name = "dname" id = "dname">
				<option value = "">전체</option>
				<!-- 
				<option value = "전기전자공학">전기전자공학</option>
				<option value = "컴퓨터공학">컴퓨터공학</option>
				<option value = "화공신소재공학">화공신소재공학</option>
				 -->
				<c:forEach items = "${depart }" var = "depart">
					<option value = "${depart.dname }">${depart.dname }</option>
				</c:forEach>
			</select>
			<font>전공 : </font>
			<select name = "mcode" id = "mcode">
				<option value = "">선택</option>
				<!-- 
				<option value = "301">게임모바일 공학전공</option>
				<option value = "302">디지펜게임 공학전공</option>
				<option value = "304">신소재 공학전공</option>
				<option value = "306">전기에너지 공학전공</option>
				<option value = "305">전자 공학전공</option>
				<option value = "300">컴퓨터 공학전공</option>
				<option value = "303">화학 공학전공</option>
				 -->
			</select>
			<div class = "lecture_division">
				<font>구분 : </font>
				<input type = "radio" name = "division" value = "교양">교양
				<input type = "radio" name = "division" value = "전공">전공
				<input type = "radio" name = "division" value = "대학원">대학원	<!-- 없음 -->
				<input type = "radio" name = "division" value = "" checked>전체
			</div>
			<font>위치 : </font>
			<select name = "location">
				<option value = "">전체</option>
				<!-- 
				<option value = "경영대">경영대</option>
				<option value = "공대">공대</option>
				<option value = "사회대">사회대</option>
				<option value = "인문대">인문대</option>
				 -->
				 <c:forEach items = "${room }" var = "room">
				 	<option value = "${room.location }">${room.location }</option>
				 </c:forEach>
			</select>
			<br>
			<font>학년 : </font>
			<select name = "grade">
				<option value = "">전체</option>
				<option value = "1">1</option>
				<option value = "2">2</option>
				<option value = "3">3</option>
				<option value = "4">4</option>
			</select>
			<br>
			<font>요일 : </font>
			<select name = "day">
				<option value = "">전체</option>
				<option value = "월">월</option>
				<option value = "화">화</option>
				<option value = "수">수</option>
				<option value = "목">목</option>
				<option value = "금">금</option>
			</select>
			<font>교시 : </font>
			<select name = "time">
				<option value = "">전체</option>
				<option value = "1">1교시</option>
				<option value = "2">2교시</option>
				<option value = "3">3교시</option>
				<option value = "4">4교시</option>
				<option value = "5">5교시</option>
				<option value = "6">6교시</option>
				<option value = "7">7교시</option>
				<option value = "8">8교시</option>
				<option value = "9">9교시</option>
			</select>
			<button id = "searchBtn">검색</button>
		</div>
	<div id = "grid"></div>
</div>
<!-- 본체 끝 -->


<!-- 모달 뷰-->
<div id="my_offer" align="center">
	<a class="modal_close_btn">닫기</a>
	<div class="modal-body">
		<h2>교수 정보</h2>
		<table class="professorInfo" id="professorInfo" border="1">
			<thead>
				<tr>
					<th>교수</th>
					<th>연락처</th>
					<th>이메일</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
</div>
<!-- 모달 끝 -->
</div>

<script>
	 
	// 아이디가 searchBtn인 버튼을 누르면 searchLecture function을 실행한다.
	document.getElementById('searchBtn').addEventListener('click', searchLecture);
	 
	function searchLecture(){
		 
		let mc = document.getElementsByName('mcode')[0].value;
		let dn = document.getElementsByName('dname')[0].value;
		 
		let divi_value;
		let divi = document.getElementsByName('division');
		for (let i = 0; i < divi.length; i++){
			if (divi[i].checked){
				divi_value = divi[i].value;
			}
		}
		 
		let loca 	= document.getElementsByName('location')[0].value;
		let gra 	= Number(document.getElementsByName('grade')[0].value);
		let day		= document.getElementsByName('day')[0].value;
		let time	= document.getElementsByName('time')[0].value;
		
		let timetable = day + time;
		 
		let data = {
				mcode 		: mc,
				dname 		: dn,
				division 	: divi_value,
				location 	: loca,
				grade 		: gra,
				timetable	: timetable
		};
		 
		grid.readData(1, data, true);
	}
	 
	 
	// 그리드
	// api 쓰게 되면서 얘 의미 없게 되긴 했는데, 주석 처리하자니 교수 이름 때문에 걸리네?
	// seq 값도 못 받음
	var lecData = [
		<c:forEach items = "${lec}" var = "lec" varStatus = "seq">{
			// 실질적 값
			/* seq			: '${seq.count}',
			lnum 		: '${lec.lnum}' + '-' + '${lec.dividenum}',
			lname 		: '${lec.lname}',
			division 	: '${lec.division}',
			credit 		: '${lec.credit}',
			target 		: '${lec.target}',
			pname		: '${lec.pname}',
			timetable 	: '${lec.timetable}',
			lrname 		: '${lec.lrname}',
			limitcount	: '${lec.limitcount}', */
			
			// 필요에 의한 값 땡겨오기.
			email		: '${lec.email}',
			pphone		: '${lec.pphone}',
			pid			: '${lec.pid}',
			opennum		: '${lec.opennum}',
			evaluation: '<button id="openbtn${lec.opennum}" onclick="openpage(${lec.opennum})">확인</button>'
			
		}
		<c:if test='${!empty lec.lnum}'>
		,
		</c:if>
		</c:forEach>
	];
	

	// 그리드를 보여준다
	var grid = new tui.Grid({
		
		el: document.getElementById('grid'),
		data: {
			api: {
				readData: {
					url: "wantLectureList", method: "POST" 
				},
			},
			contentType: "application/json"
		},
		//rowHeaders: ['checkbox'],
		pagination: true,		//페이징 처리
	    pageOptions: {
	    	useClient: true,	//페이징 처리
	    	perPage: 5   		//페이징 갯수
	    }
		,
		columns: [
			//{header: ' ', name: 'seq'},
			{header: '강의코드', name: 'lnum'},
			{header: '강의명', name: 'lname'},
			{header: '이수구분', name: 'division'},
			{header: '학점', name: 'credit'},
			{header: '대상학년', name: 'target'},
			{header: '교수', name: 'pname'},
			{header: '강의시간', name: 'timetable'},
			{header: '강의실', name: 'lrname'},
			{header: '수강정원', name: 'limitcount'},
			{header:'강의평가',name:'evaluation'}
		] //컬럼갯수
		
	});

	grid.resetData(lecData) //그리드를 그려놓고 데이터를 넣음
	// 그리드 끝

	// 그리드 클릭 이벤트
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
			
			// location.href = "/readOnly2?pid=" + pid + "&opennum=" + opennum;
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
	
	function openpage(data){
		var opennum = data;
		location.href="Eresultst?opennum="+opennum
	}
	
	// 검색 컬럼 변화
	$("#dname").change(function(){
		
		let dname = $(this).val();
		let mcode;
		
		if (dname == "") {
			$(`select[name = mcode] option`).remove();
			mcode += `<option value = "">선택</option>`;
			$('#mcode').append(mcode);
		} else {
			$(`select[name = mcode] option`).remove();
			
			$.ajax({
				url: 'getMajorList',
				type: 'GET',
				data: {dname: dname},
				success: function(result) {
					$.each(result, function(i, v){
						//mcode += `<option value = ${v.mcode}>${v.mname}</option>`;
						//console.log(v);
						//console.log(v.mcode);
						mcode += '<option value="'+v.mname+'">'+v.mname+'</option>';
					});
					$('#mcode').append(mcode);
				}
			});
		}
	});
</script>
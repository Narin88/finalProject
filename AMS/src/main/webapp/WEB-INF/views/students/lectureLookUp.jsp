<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- 

할 일

1. 컬럼 추가		== 완
	- 순번
	- 정원
	
2. 컬럼 출력 순서 및 양식 통일

3. 검색기 만들기
	- 이수구분(교양, 전공, ...)				== 
	- 개설년도		~> 필요한가? 이번 년도 이번 학기만 보여주면 되는 거 아닌가?
	- 캠퍼스 (위치)						== 완
	- 요일 및 교시							== 
	- 대상 학년							== 완
	- 학과 코드, 전공 코드					== 미확인

4. 클릭 이벤트
	- 교과목 누르면 강의 계획서 보이기			== 미완
	- 담당 교수 이름 누르면 교수 정보 보이기		== 완
	- 강의 만족도 (미)
	- 시인성
 -->

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



<title>강의 조회 페이지</title>

<!-- 본체 -->
<div align = "center">
	<h2>강의 조회 페이지</h2>
		<div class = "selectArea">
			<select name = "mcode">
				<option value = "">전공 선택</option>
				<option value = "301">게임모바일 공학전공</option>
				<option value = "302">디지펜게임 공학전공</option>
				<option value = "304">신소재 공학전공</option>
				<option value = "306">전기에너지 공학전공</option>
				<option value = "305">전자 공학전공</option>
				<option value = "300">컴퓨터 공학전공</option>
				<option value = "303">화학 공학전공</option>
				<option value = "">전체</option>
			</select>
			<select name = "dname">
				<option value = "">학과 선택</option>
				<option value = "전기전자공학">전기전자공학</option>
				<option value = "컴퓨터공학">컴퓨터공학</option>
				<option value = "화공신소재공학">화공신소재공학</option>
				<option value = "">전체</option>
			</select>
			<!-- <select name = "dcode">	dcode???? 이거로 division 구분하면 전공은ㅇ ㅓ떻게 구분??
				<option value = "">교양 전공 선택</option>
				<option value = "001">전공</option>
				<option value = "002">전공선택</option>
				<option value = "003">공통교양</option>
				<option value = "">전체</option>
			</select> -->
			<div class = "lecture_division">
				<font>구분 : </font>
				<input type = "radio" name = "division" value = "교양">교양
				<input type = "radio" name = "division" value = "전공">전공	<!-- 교양 체크하면 일반교양 공통교양, 전공 체크하면 전공필수 전공선택으로 결과값이 나와야하는데 쿼리 어떻게 짜지?-->
				<input type = "radio" name = "division" value = "대학원">대학원	<!-- 없음 -->
				<input type = "radio" name = "division" value = "" checked>전체
			</div>
			<select name = "location">
				<option value = "">위치 선택</option>
				<option value = "경영대">경영대</option>
				<option value = "공대">공대</option>
				<option value = "사회대">사회대</option>
				<option value = "인문대">인문대</option>
				<option value = "">전체</option>
			</select>
			<select name = "grade">
				<option value = "">학년 선택</option>
				<option value = "1">1</option>
				<option value = "2">2</option>
				<option value = "3">3</option>
				<option value = "4">4</option>
				<option value = "">전체</option>
			</select>
			<select name = "day">	<!-- 미 -->
				<option value = "">요일 선택</option>
				<option value = "1">1</option>
				<option value = "2">2</option>
				<option value = "3">3</option>
				<option value = "4">4</option>
				<option value = "">전체</option>
			</select>
			<select name = "time">	<!-- 미 -->
				<option value = "">교시 선택</option>
				<option value = "1">1</option>
				<option value = "2">2</option>
				<option value = "3">3</option>
				<option value = "4">4</option>
				<option value = "">전체</option>
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
					<th>교수명</th>
					<th>이메일</th>
					<th>연락처</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
</div>
<!-- 모달 끝 -->


<script>
	/* 
	//window.onload = function() {}
	document.addEventListener("DOMContentLoaded", function(){
		
		// 비동기
		var btn = document.getElementById("searchBtn");
		
		btn.addEventListener("click", () => {
			
			// XMLHttpRequest 객체 생성
			var xhr = new XMLHttpRequest();
			
			// 요청을 보낼 방식, 주소, 비동기 여부 설정
			xhr.open('GET', '/lectureLookUp', true);
			
			// 요청 전송
			xhr.send();
			
			// 통신 뒤 작업
			xhr.onload = () => {
				
				if(xhr.status == 200){
					
					console.log('성공');
				} else {
					
					console.log('실패');
				}
			}
		});
		
	});
	 */

	 /* 
	 var xhr = new XMLHttpRequest();
	 
	 xhr.onreadystatechange = function(){
		 
		 if (xhr.readyState == XMLHttpRequest.DONE){
			
			 if (xhr.status == 200){
				 
				 
			 } else if (xhr.status == 400){
				 
				 alert('400');
			 } else {
				 
				 alert('something else other than 200 was returned');
			 }
		 }
	 };
	 
	 xhr.open("GET", "lectureLookUp", true);
	 xhr.send();
	 
	 
	 ajax
	 xmlhttprequest
	 fetch()
	 
	 */
	 
	 // 아이디가 searchBtn인 버튼을 누르면 searchLecture function을 실행한다.
	 document.getElementById('searchBtn').addEventListener('click', searchLecture);
	 
	 function searchLecture(){
		 
		 let mc 	= document.getElementsByName('mcode')[0].value;
		 let dn 	= document.getElementsByName('dname')[0].value;
		 
		 let divi 	= document.getElementsByName('division');
		 let divi_value;
		 for (let i = 0; i < divi.length; i++){
			 
			 if (divi[i].checked){
				 
				 divi_value = divi[i].value;
			 }
		 }
		 
		 let loca 	= document.getElementsByName('location')[0].value;
		 let gra 	= document.getElementsByName('grade')[0].value;
		 
		 let data = {
				 "mcode" 	: mc,
				 "dname" 	: dn,
				 "division" : divi_value,
				 "location" : loca,
				 "grade" 	: gra
		 }
		 
		 $.ajax({
			 
			 url: 'lectureLookUp',
			 data: data,
			 type: 'GET',
			 //dataType: 'json',
			 success: function(response){
				 
				 console.log(response);
			 },
			 error: function(err){
				 
				 console.log(err);
			 }
		 });
	 }
	 
	 
	// 그리드
	var lecData = [
		
		<c:forEach items = "${lec}" var = "lec" varStatus = "seq">{
			
			// 실질적 값
			seq			: '${seq.count}',
			lnum 		: '${lec.lnum}' + '-' + '${lec.dividenum}',
			lname 		: '${lec.lname}',
			division 	: '${lec.division}',
			credit 		: '${lec.credit}',
			target 		: '${lec.target}',
			pname		: '${lec.pname}',
			timetable 	: '${lec.timetable}',
			lrname 		: '${lec.lrname}',
			limitcount	: '${lec.limitcount}',
			
			// 필요에 의한 값 땡겨오기.
			email		: '${lec.email}',
			pphone		: '${lec.pphone}',
			pid			: '${lec.pid}',
			opennum		: '${lec.opennum}'
		}
		
		<c:if test='${!empty lec.lnum}'>
		,
		</c:if>
		
		</c:forEach>
	];
	
	// 그리드 api-source
	
	/* 	const dataSource = {
			
			withCredentials	: false,
			initialRequest	: false,
			contentType		: 'application/json',
			api : {
				
				readData	: {},
				updateData	: {
					
					url		: '',
					method	: ''
				}
			}
			
		}; */


	// 그리드를 보여준다
	var grid = new tui.Grid({
		
		el: document.getElementById('grid'),
		data: lecData,
		//rowHeaders: ['checkbox'],
		pagination: true,		//페이징 처리
	    pageOptions: {
	    	useClient: true,	//페이징 처리
	    	perPage: 5   		//페이징 갯수
	    }
		,
		columns: [
			{header: ' ', name: 'seq'},
			{header: '강의코드', name: 'lnum'},
			{header: '강의명', name: 'lname'},
			{header: '이수구분', name: 'division'},
			{header: '학점', name: 'credit'},
			{header: '대상학년', name: 'target'},
			{header: '교수', name: 'pname'},
			{header: '강의시간', name: 'timetable'},
			{header: '강의실', name: 'lrname'},
			{header: '최대수용인원', name: 'limitcount'}
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
		.append($('<td>').html(email))
		.append($('<td>').html(pphone))
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
	
</script>
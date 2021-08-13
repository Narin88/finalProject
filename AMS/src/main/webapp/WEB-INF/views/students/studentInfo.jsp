<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>학사정보</title>

<link rel="stylesheet" href="resources/css/studentsInfo.css" />
</head>
<body>
	<div>
		<div class="bigDiv">
			<div>
				<img src="resources/image/students/${st.picture }" alt="증명사진" class="infoImg" id="infoImg" />
			</div>
			<div>
				<table class="table table-bordered">
					<tr>
						<th class="table-secondary">학번</th>
						<td>${st.sid }</td>
						<th class="table-secondary">이름</th>
						<td>${st.sname}</td>
						<th class="table-secondary">전화번호</th>
						<td>${st.sphone}</td>
						<th class="table-secondary">담당교수</th>
						<td>${st.pname}</td>
						<th class="table-secondary">학년</th>
						<td>${st.grade}학년</td>
					</tr>
					<tr>
						<th class="table-secondary">생일</th>
						<td>${st.sbirth}</td>
						<th class="table-secondary">성별</th>
						<td><c:if test="${st.sgender eq 1 }">남자</c:if> <c:if
								test="${st.sgender eq 2 }">여자</c:if></td>
						<th class="table-secondary">학과</th>
						<td>${st.dname}</td>
						<th class="table-secondary">전공</th>
						<td>${st.mname}</td>
						<th class="table-secondary">상태</th>
						<td>${st.sstatus }</td>
					</tr>
					<tr>
						<th class="table-secondary">주소</th>
						<td colspan="4">${st.saddress }</td>
						<th class="table-secondary">이메일</th>
						<td colspan="2">${st.email }</td>
						<th class="table-secondary">입학일</th>
						<td>${st.enterDate }</td>
					</tr>
				</table>
			</div>
		</div>
		<%-- <sec:authorize access="hasRole('ROLE_PRO')"> --%>
			<div align="left" style="margin-left: 120px;">
				<form id="frm" name="frm" method="post" encType="multipart/form-data" action="updatePic">
					<label class="btn btn-secondary btn-sm" style="margin-top: 7px;">
		    		    사진변경 <input type="file" style="display: none;" id="changeImg" name="pic">&nbsp;
	   				 </label>
	   				 <button type="submit" class="btn btn-secondary btn-sm">확인</button>
	   			</form>
			</div>
		<%-- </sec:authorize> --%>
		<br /> <br />
		<div class="bigDiv2">
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<a class="nav-link active" data-toggle="tab" href="#score">시험점수</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#abc">지도교수정보</a>
				</li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane fade show active" id="score">
					<div style="background-color: rgb(244, 244, 244)">
						<c:set var="now" value="<%=new java.util.Date()%>" />
						<!-- 현재 년도 출력을위한 설정 -->
						<c:set var="sysYear">
							<fmt:formatDate value="${now }" pattern="yyyy" />
						</c:set>
          				&nbsp;&nbsp;&nbsp;&nbsp;
          				년도<input type="number" id="year" name="year" value="${sysYear }" style="width: 3.8em;" />
          				&nbsp;
          				학기<select id="term">
								<option value="1">1학기</option>
								<option value="2">2학기</option>
							</select>
						&nbsp;
						<button class="btn btn-outline-dark btn-sm" type="button" onclick="search()">검색</button>
						<button class="btn btn-outline-dark btn-sm" type="button" onclick="cancel()">전체보기</button>
					</div>
					<div id="scoreGrid"></div>
				</div>
				<div class="tab-pane fade" id="abc">
					<div class="proInfo">
						<table class="table table-bordered">
							<tr>
								<th>지도교수</th>
								<td>${pro.pname }</td>
								<th>전화번호</th>
								<td>${pro.pphone}</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>${pro.email }</td>
								<th>현재상태</th>
								<td>
									<c:if test="${pro.pstatus eq '001' }">재직중</c:if>
									<c:if test="${pro.pstatus eq '002' }">휴가중</c:if>
								</td>
							</tr>
							<tr>
								<th>직책</th>
								<td>
									<c:if test="${pro.position eq '001' }">부교수</c:if>
									<c:if test="${pro.position eq '002' }">정교수</c:if>
									<c:if test="${pro.position eq '003' }">시간교수</c:if>
								</td>
								<th>성별</th>
								<td>
									<c:if test="${pro.pgender eq 1 }">남자</c:if>
									<c:if test="${pro.pgender eq 2 }">여자</c:if>
								</td>
							</tr>
							<tr>
								<td colspan="4" align="center" id="showTimeSchedule"><b>시간표</b></td>
							</tr>
							<tr id="addActive">
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
		integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
		crossorigin="anonymous"></script>
	<script src="resources/js/studentInfo.min.js"></script>
	<script>
	  	//grid start
	  	// GRID 를 보여준다.
	     var grid = new tui.Grid( {
	      el: document.getElementById('scoreGrid'),
	      data: {
	    	  api: {
	    		  readData: {
	    			  url: "scoreGetList", method: "POST" //컬럼DATA
	    		  },
	    	  },
	    	  contentType: "application/json"
	      },
	      pagination: true,   //페이징 처리
	        /* pageOptions: {
	          useClient: true,   //페이징 처리
	          perPage: 5   //페이징 갯수
	        }, */
	        scrollX: true, // x축 스크롤on
	        scrollY: true, // y축 스크롤on,
	      columns: [
	        {header: '과목이름',name: 'lname', align: "center", width: 200},
	        {header: '학년',name: 'lyear', align: "center", width: 150},	
	        {header: '학기',name: 'term', align: "center", width: 150},
	        {header: '중간고사',name: 'middlescore', value:"1", align: "center", width: 100},
	        {header: '기말고사',name: 'finalscore', align: "center", width: 100},
	        {header: '과제점수',name: 'homework', align: "center", width: 100},
	        {header: '출석점수',name: 'attendancescore', align: "center", width: 100},
	        {header: '총점',name: 'total', align: "center", width: 100},
	        {header: '등급',name: 'rank', align: "center", width: 100},
	        {header: '학점',name: 'credit', align: "center", width: 100},
	        {header: '이수구분',name: 'division', align: "center", width: 150},
	        {header: '교수이름',name: 'pname', align: "center", width: 150},
	      ], //컬럼갯수
	    });
	  	
	// 학년학기 검색
    function search() {
    	const year = $("#year").val();
    	const term = $("#term").val();
    	console.log(year + " " + term);
    	
    	const data = {year: year, term: term};
    	
    	grid.readData(1, data, true);
    }
    
    // 검색취소
    function cancel() {
    	const data = {year: null, term: null};
    	
    	grid.readData(1, data, true);
    }
    
    let colorArr = ['table-danger', 'table-warning', 'table-info', 'table-success', 'table-primary', 'table-active'];
	//let totaltime = "";
	
	// 강의 시간을 한 문자로 묶기(ex : 월1화2...)
	let getValue = [];
 	<c:forEach items = "${al}" var = "al" varStatus = "seq">
		//totaltime += '${st.timetable}'
		getValue["${al.timetable }"] = ['${al.lname}','${al.lrname}', colorArr[${seq.index}]];
	</c:forEach>
	
	// 눌렀을때 시간표가 보이고 꺼지도록
	$("#showTimeSchedule").on("click", function() {
		if (typeof $("#addActive").attr("class") === "undefined" || $("#addActive").attr("class") == null || $("#addActive").attr("class") == "") {
			$("#addActive").attr("class", "timeActive");

			$("#addActive").append("<td colspan='4'><div id='scheduleShow'></div></td>");
			
			addShowTable();

		} else {
			console.log($(".timeActive").children().remove());
			$("#addActive").removeClass();
		}
	});
	
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

	function addShowTable() {
		
		// 테이블 생성
		let sTable = $('<table />').attr('class', 'table showSchedule');
		sTable.append(addTitle());
		
		let week = [
			"",
			"",
			"월",
			"화",
			"수",
			"목",
			"금"
		];
		
		let timeseq =[
			"1교시" + "<br>" + "09:00 ~ 10:00",
			"2교시" + "<br>" + "09:00 ~ 10:00",
			"3교시" + "<br>" + "09:00 ~ 10:00",
			"4교시" + "<br>" + "09:00 ~ 10:00",
			"5교시" + "<br>" + "09:00 ~ 10:00",
			"6교시" + "<br>" + "09:00 ~ 10:00",
			"7교시" + "<br>" + "09:00 ~ 10:00",
			"8교시" + "<br>" + "09:00 ~ 10:00",
			"9교시" + "<br>" + "09:00 ~ 10:00"
		];
		
		for(let i = 1; i < 10; i++){
			
			let tr = $('<tr />');
			
			for(let j = 1; j < 7; j++){
				
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
				
				if (j == 1){
					// 테이블 첫 번째 자리에 강의 시간 집어넣기
					
					// td에 아이디값 안 줘도 될 듯? 
					tr.append($('<td class="table-secondary timeCol" id = "jackpot'+ i + '-' + j +'"/>').html(timeseq[i - 1]));
	
				} else {
					
					let curTime = week[j] + i;
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
	};
	
	function readImage(input) {

	    // 인풋 태그에 파일이 있는 경우
	    if(input.files && input.files[0]) {

	        // 이미지 파일인지 검사 (생략)

	        // FileReader 인스턴스 생성
	        const reader = new FileReader()

	        // 이미지가 로드가 된 경우
	        reader.onload = e => {
	            const previewImage = document.getElementById("infoImg")
	            previewImage.src = e.target.result
	        }

	        // reader가 이미지 읽도록 하기
	        reader.readAsDataURL(input.files[0])
	    }
	}

	// input file에 change 이벤트 부여
	const inputImage = document.getElementById("changeImg")
	inputImage.addEventListener("change", e => {
	    readImage(e.target)
	})
</script>
</body>
</html>

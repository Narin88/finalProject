<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<img src="resources/image/students/st1.png" alt="증명사진" class="infoImg" />
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
		<br /> <br />
		<div class="bigDiv2">
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<a class="nav-link active" data-toggle="tab" href="#score">시험점수</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#pro">지도교수정보</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#zxc">ZXC</a>
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
				<div class="tab-pane fade" id="pro">
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
				<div class="tab-pane fade" id="zxc">
					<p>Curabitur dignissim quis nunc vitae laoreet. Etiam ut mattis
						leo, vel fermentum tellus. Sed sagittis rhoncus venenatis. Quisque
						commodo consectetur faucibus. Aenean eget ultricies justo.</p>
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
    
    $("#showTimeSchedule").on("click", function() {
    	console.log($("#addActive").attr("class"));
    	
    	if (typeof $("#addActive").attr("class") === "undefined" || $("#addActive").attr("class") == null || $("#addActive").attr("class") == "") {
    		$("#addActive").attr("class", "timeActive");
    		
    		$("#addActive").append("<td colspan='4'><div id='timeSchedule'></div></td>");
    		
    		// 풀 캘린더 시작
    	   	 var calendarEl = document.getElementById('timeSchedule');
    	             var calendar = new FullCalendar.Calendar(calendarEl, {
    	           	  height: "800px",
    	           	  expandRows: true, // 화면에 맞게 높이 재설정
    	           	  slotMinTime: '08:30', // Day 캘린더에서 시작 시간
    	           	  slotMaxTime: '18:30', // Day 캘린더에서 종료 시간
    	           	  // 해더에 표시할 툴바
    	           	  headerToolbar: {
    	           	  left: 'prev,next today',
    	           	  center: 'title',
    	           	  right: 'dayGridMonth,timeGridWeek,timeGridDay'
    	           	  },
    	           	  initialView: 'timeGridWeek', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
    	           	  nowIndicator: true, // 현재 시간 마크
    	           	  events: [
    	           		  {
    	           		  title: 'All Day Event',
    	           		  start: '2021-08-05',
    	           		  },
    	           		  {
    	           		  title: 'Long Event',
    	           		  start: '2021-08-05',
    	           		  end: '2021-08-10'
    	           		  },
    	           		  {
    	           		  groupId: 999,
    	           		  title: 'Repeating Event',
    	           		  start: '2021-08-09T16:00:00'
    	           		  },
    	           		  {
    	           		  groupId: 999,
    	           		  title: 'Repeating Event',
    	           		  start: '2021-08-16T16:00:00'
    	           		  },
    	           		  {
    	           		  title: 'Conference',
    	           		  start: '2021-08-11',
    	           		  end: '2021-08-13'
    	           		  },
    	           		  {
    	           		  title: 'Meeting',
    	           		  start: '2021-08-12T10:30:00',
    	           		  end: '2021-08-12T12:30:00'
    	           		  },
    	           		  {
    	           		  title: 'Lunch',
    	           		  start: '2021-08-12T12:00:00'
    	           		  },
    	           		  {
    	           		  title: 'Meeting',
    	           		  start: '2021-08-12T14:30:00'
    	           		  },
    	           		  {
    	           		  title: 'Happy Hour',
    	           		  start: '2021-08-12T17:30:00'
    	           		  },
    	           		  {
    	           		  title: 'Dinner',
    	           		  start: '2021-08-12T20:00:00'
    	           		  },
    	           		  {
    	           		  title: 'Birthday Party',
    	           		  start: '2021-08-13T07:00:00'
    	           		  },
    	           		  {
    	           		  title: 'Click for Google',
    	           		  url: 'http://google.com/', // 클릭시 해당 url로 이동
    	           		  start: '2021-08-28'
    	           		  }
    	           		  ]

    	             });
    	             calendar.render();
    	} else {
    		console.log($(".timeActive").children().remove());
    		$("#addActive").removeClass();
    	}
    	
    
    })
</script>
</body>
</html>

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
				<img src="resources/image/students/st1.png" alt="증명사진"
					class="infoImg" />
			</div>
			<div>
				<table class="table table-bordered">
					<tr>
						<th>학번</th>
						<td>${st.sid }</td>
						<th>이름</th>
						<td>${st.sname}</td>
						<th>전화번호</th>
						<td>${st.sphone}</td>
						<th>담당교수</th>
						<td>${st.pname}</td>
						<th>학년</th>
						<td>${st.grade}학년</td>
					</tr>
					<tr>
						<th>생일</th>
						<td>${st.sbirth}</td>
						<th>성별</th>
						<td><c:if test="${st.sgender eq 1 }">남자</c:if> <c:if
								test="${st.sgender eq 2 }">여자</c:if></td>
						<th>학과</th>
						<td>${st.dname}</td>
						<th>전공</th>
						<td>${st.mname}</td>
						<th>상태</th>
						<td>${st.sstatus }</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="4">${st.saddress }</td>
						<th>이메일</th>
						<td colspan="2">${st.email }</td>
						<th>입학일</th>
						<td>${st.enterDate }</td>
					</tr>
				</table>
			</div>
		</div>
		<br /> <br />
		<div class="bigDiv2">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active"
					data-toggle="tab" href="#score">시험점수</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#asd">ASD</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#zxc">ZXC</a></li>
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
						<button class="btn btn-outline-dark btn-sm" type="button" onclick="search('${count}')">검색</button>
					</div>
					<div id="scoreGrid"></div>
				</div>
				<div class="tab-pane fade" id="asd">
					<p>Nunc vitae turpis id nibh sodales commodo et non augue.
						Proin fringilla ex nunc. Integer tincidunt risus ut facilisis
						tristique.</p>
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
	    var clsData = [
	      <c:forEach items="${score }" var="score">
	      {
	        lname: '${score.lname}', lyear: '${score.lyear}년', term: '${score.term}', middlescore: '${score.middlescore}',
	        finalscore: '${score.finalscore}', homework: '${score.homework}', attendancescore: "${score.attendancescore}",
	        total: "${score.total}", rank: "${score.rank}", credit: "${score.credit}", division: "${score.division}",
	        pname: "${score.pname}"
	      },
	      </c:forEach>
	      ]; //컬럼DATA
	
	        // GRID 를 보여준다.
	    var grid = new tui.Grid( {
	      el: document.getElementById('scoreGrid'),
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
	      data: clsData,
	    });
	      
	    const state = {
	    	code: 'eq',
	    	value: "컴퓨터개론"
	    };

	    grid.filter("lname", state);
	    //grid end
	    </script>
</body>
</html>

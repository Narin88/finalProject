<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>강의 조회 페이지</title>

<div align = "center">
	<table border = "1">
		<tr>
			<th>강의코드</th>
			<th>강의명</th>
			<th>이수구분</th>
			<th>학점</th>
			<th>대상학년</th>
			<th>교수</th>
			<th>강의시간</th>
			<th>강의실</th>
		</tr>
	<c:forEach items="${lec }" var = "lec" varStatus = "status" >
		<tr>
			<th>${lec.lnum }</th>
			<th>${lec.lname }</th>
			<th>${lec.division }</th>
			<th>${lec.credit }</th>
			<th>${lec.target }</th>
			<!-- 교수 이름 클릭시 모달창 띄우고 교수 정보 불러오기 -->
			<th>
				<a href = "professorSelect.do?pname=${lec.pname }">${lec.pname }</a>
				<!-- 페이지 넘어가면 안 되는데 a 링크 태우나? -->
			</th>
			<th>${lec.timetable }</th>
			<th>${lec.lrname }</th>
		</tr>
	</c:forEach>
	</table>
</div>
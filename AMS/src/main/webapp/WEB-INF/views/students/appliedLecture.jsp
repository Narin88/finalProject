<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>수강 신청된 과목 확인</title>

<div align = "center">
	<table border = "1">
		<tr>
			<th>강의코드</th>
			<th>강의명</th>
			<th>이수구분</th>
			<th>학점</th>
			<th>강의시간</th>
			<th>강의실</th>
			<th>교수</th>
		</tr>
	<c:forEach items="${st }" var = "st" varStatus = "status" >
		<tr>
			<th>${st.lnum }</th>
			<th>${st.lname }</th>
			<th>${st.division }</th>
			<th>${st.credit }</th>
			<th>${st.timetable }</th>
			<th>${st.lrname }</th>
			<th>${st.pname }</th>
		</tr>
	</c:forEach>
	</table>
</div>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>학생 성적 확인</title>
<div align = "center">
	<table border = "1">
		<tr>
			<th>년도</th>
			<th>학기</th>
			<th>강의명</th>
			<th>이수구분</th>
			<th>학점</th>
			<th>총점</th>
			<th>등급</th>
		</tr>
	<c:forEach items="${st }" var = "st" varStatus = "status" >
		<tr>
			<th>${st.lyear }</th>
			<th>${st.term }</th>
				<!-- 년도랑 학기가 같은 값일 때, 강의 개수 만큼 묶어서 출력해야 하는데. 어떡해야 하지? -->
			<th>${st.lname }</th>
			<th>${st.division }</th>
			<th>${st.credit }</th>
			<th>${st.total }</th>
			<th>${st.rank }</th>
		</tr>
	</c:forEach>
	</table>
</div>

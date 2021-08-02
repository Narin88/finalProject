<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<title>학생 정보 조회 페이지</title>

<script>
	function updateBtn(){
		
		location.href = "infoConfirmPage";
	}
</script>

<div align = "center">
	<div>
		<button onclick ="updateBtn()">정보 수정하기</button>
	</div>
	<table border = "1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>전공</th>
			<th>담당교수</th>
			<th>학년</th>
			<th>학기</th>
			<th>연락처</th>
			<th>주소</th>
			<th>입학일자</th>
			<th>생년월일</th>
			<th>성별</th>
			<th>전형</th>
			<th>학적</th>
		</tr>
		<tr>
			<th>${st.sid }</th>
			<th>${st.sname }</th>
			<th>${st.mname }</th>
			<th>${st.pname }</th>
			<th>${st.grade }</th>
			<th>${st.term }</th>
			<th>${st.sphone }</th>
			<th>${st.saddress }</th>
			<th>${st.enterDate }</th>
			<th>${st.sbirth }</th>
			<c:if test="${st.sgender eq 2 }">
				<th>여자</th>
			</c:if>
			<c:if test="${st.sgender eq 1 }">
				<th>남자</th>
			</c:if>
			<c:if test="${st.disabled eq 'n' }">
				<th>일반</th>
			</c:if>
			<c:if test="${st.disabled eq 'y' }">
				<th>특별</th>
			</c:if>
			<th>${st.sstatus }</th>
		</tr>
	</table>
</div>
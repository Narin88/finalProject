<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="stinfo" value="stinfo" />

<div class="leftNav">
	<sec:authorize access="hasRole('ROLE_STD')">
		<div align="center" class="topHeader">
		
			<ul>	
				<li><a href="<%=request.getContextPath() %>/studentInfo">학적관리</a></li>
				<li><a href="<%=request.getContextPath() %>/scoreView" >영구성적 조회</a></li>
			</ul>
		
			<ul>
				<li><a href="<%=request.getContextPath() %>/appliedLecture">나의 수강 확인</a></li>
				<li><a href="<%=request.getContextPath() %>/lectureLookUp" >전체 강의 시간표 조회</a></li>
				<li><a href="<%=request.getContextPath() %>/ScoreManaPage">수강신청</a></li>
				<li><a href="<%=request.getContextPath() %>/PreEnrolmentPage">수강꾸러미 신청#</a></li>
				<li><a href="<%=request.getContextPath() %>/hwStudent">과제페이지</a></li>
			</ul>
		</div>
	</sec:authorize>

	<sec:authorize access="hasRole('ROLE_PRO')">
	<div align="center" class="topHeader">
		<ul>
			<li><a href="<%=request.getContextPath() %>/#">내 정보#</a></li>
		</ul>
		<ul>
			<li><a href="<%=request.getContextPath() %>/ProfessorLectureList">나의 강의 확인</a></li>
			<li><a href="<%=request.getContextPath() %>/ScoreCheckLectureList" >성적 관리</a></li>
			<li><a href="<%=request.getContextPath() %>/hwList">과제 관리</a></li>
			<li><a href="<%=request.getContextPath() %>/ProfessorLectureList" >학기 시간표 조회</a></li>
			<li><a href="<%=request.getContextPath() %>/LectureInfo">강의 개설</a></li>
			<li><a href="<%=request.getContextPath() %>/studyPlanList" >강의 계획서</a></li>
		</ul>
	</div>
	</sec:authorize>
	<div class="logoutBtn">
		<button class="btn btn-secondary btn-sm" onclick="location.href='logout'">로그아웃</button>
	</div>
</div>

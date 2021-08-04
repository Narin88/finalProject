<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="stinfo" value="stinfo" />
<h1></h1>
<c:if test="${sid eq sid}">
<ul>
<li>=</li>
<li><span>학생 메뉴</span></li>
<li>=</li>


<li><a href="<%=request.getContextPath() %>/studentInfo.do">학적관리</a></li>
<li><a href="<%=request.getContextPath() %>/scoreView" >영구성적 조회</a></li>
</ul>

    <c:out value="" />

</c:if>


<ul>
<li>=</li>
<li><span>학생 메뉴</span></li>
<li>=</li>


<li><a href="<%=request.getContextPath() %>/studentInfo.do">학적관리</a></li>
<li><a href="<%=request.getContextPath() %>/scoreView" >영구성적 조회</a></li>
</ul>

<ul>
<li><a href="<%=request.getContextPath() %>/professorSelect.do" >학생이 교수 정보 확인 페이지 @</a></li>
<li><a href="<%=request.getContextPath() %>/appliedLecture">나의 수강 확인</a></li>
<li><a href="<%=request.getContextPath() %>/#" >학기 시간표 조회#</a></li>
<li><a href="<%=request.getContextPath() %>/lectureLookUp.do" >강의 시간표 조회</a></li>
<li><a href="<%=request.getContextPath() %>/ScoreManaPage">수강신청</a></li>
<li><a href="<%=request.getContextPath() %>/#">수강꾸러미 신청#</a></li>
</ul>
<ul>

<li>=</li>
<li><span>교수 메뉴</span></li>
<li>=</li>

<li><a href="<%=request.getContextPath() %>/#">내 정보#</a></li>
</ul>



<ul>
<li><a href="<%=request.getContextPath() %>/ProfessorLectureList">나의 강의 확인</a></li>
<li><a href="<%=request.getContextPath() %>/#" >성적 관리#</a></li>
<li><a href="<%=request.getContextPath() %>/#">과제 관리#</a></li>
<li><a href="<%=request.getContextPath() %>/lectureList" >학기 시간표 조회</a></li>
<li><a href="<%=request.getContextPath() %>/LectureInfo">강의 개설</a></li>
<li><a href="<%=request.getContextPath() %>/studyPlanList" >강의 계획서</a></li>
</ul>

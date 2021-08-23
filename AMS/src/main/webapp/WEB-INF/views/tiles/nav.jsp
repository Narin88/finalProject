<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="stinfo" value="stinfo" />
<style>
.logo-img{
	height: 130px;
}
.topbar-left{
	background-size: 100%;
}
</style>
<body class="fixed-left">
<!-- Loader -->
<div id="preloader"><div id="status"><div class="spinner"></div></div></div>

<!-- ========== Left Sidebar Start ========== -->
 <div class="left side-menu">
     <button type="button" class="button-menu-mobile button-menu-mobile-topbar open-left waves-effect">
         <i class="ion-close"></i>
     </button>

     <!-- LOGO -->
     <div class="topbar-left" align="center" style="background-image: url(${pageContext.request.contextPath }/resources/assets/images/back01.png)">
		<a href="home2" class="logo">
			<img src="${pageContext.request.contextPath }/resources/assets/images/noM_logo1.png" alt="" class="logo-img">
		</a>
     </div>

     <div class="sidebar-inner niceScrollleft">
		<sec:authorize access="hasRole('ROLE_STD')">
         <div id="sidebar-menu">
             <ul>
                 <li class="menu-title">학생</li>

                 <li>
                     <a href="studentInfo" class="waves-effect">
                         <i class="mdi mdi-airplay"></i>
                         <span> 학적관리 </span>
                     </a>
                 </li>
                 <li>
                     <a href="<%=request.getContextPath() %>/scoreView" class="waves-effect">
                         <i class="mdi mdi-airplay"></i>
                         <span> 영구성적 조회 </span>
                     </a>
                 </li>
                 <li>
                     <a href="<%=request.getContextPath() %>/appliedLecture" class="waves-effect">
                         <i class="mdi mdi-airplay"></i>
                         <span> 21-1학기 시간표 조회</span>
                     </a>
                 </li>
                 <li>
                     <a href="<%=request.getContextPath() %>/lectureLookUp" class="waves-effect">
                         <i class="mdi mdi-airplay"></i>
                         <span> 강의 조회 </span>
                     </a>
                 </li>
                 <li>
                     <a href="<%=request.getContextPath() %>/ScoreManaPage" class="waves-effect">
                         <i class="mdi mdi-airplay"></i>
                         <span> 수강신청</span>
                     </a>
                 </li>
                 <li>
                     <a href="<%=request.getContextPath() %>/PreEnrolmentPage" class="waves-effect">
                         <i class="mdi mdi-airplay"></i>
                         <span> 수강꾸러미 신청</span>
                     </a>
                 </li>
                 <li>
                     <a href="<%=request.getContextPath() %>/hwStudent" class="waves-effect">
                         <i class="mdi mdi-airplay"></i>
                         <span> 과제 관리</span>
                     </a>
                 </li>
                 <li>
                     <a href="<%=request.getContextPath() %>/logout" class="waves-effect">
                         <i class="mdi mdi-airplay"></i>
                         <span> 로그아웃 </span>
                     </a>
                 </li>
             </ul>
         </div>
         </sec:authorize>
         <sec:authorize access="hasRole('ROLE_PRO')">
         <div id="sidebar-menu">
             <ul>
                 <li class="menu-title">교수</li>

                 <li>
                     <a href="<%=request.getContextPath() %>/professorinfo" class="waves-effect">
                         <i class="mdi mdi-airplay"></i>
                         <span> 내 정보 </span>
                     </a>
                 </li>
                 <li>
                     <a href="<%=request.getContextPath() %>/ProfessorLectureListed" class="waves-effect">
                         <i class="mdi mdi-airplay"></i>
                         <span> 강의내역 </span>
                     </a>
                 </li>
                 <li>
                     <a href="<%=request.getContextPath() %>/ProfessorLectureList" class="waves-effect">
                         <i class="mdi mdi-airplay"></i>
                         <span> 21-1학기 시간표 조회 </span>
                     </a>
                 </li>
                 <li>
                     <a href="<%=request.getContextPath() %>/ScoreCheckLectureList" class="waves-effect">
                         <i class="mdi mdi-airplay"></i>
                         <span> 성적 관리 </span>
                     </a>
                 </li>
                 <li>
                     <a href="<%=request.getContextPath() %>/hwList" class="waves-effect">
                         <i class="mdi mdi-airplay"></i>
                         <span> 과제 관리 </span>
                     </a>
                 </li>
                 <li>
                     <a href="<%=request.getContextPath() %>/LectureInfo" class="waves-effect">
                         <i class="mdi mdi-airplay"></i>
                         <span> 강의 개설 </span>
                     </a>
                 </li>
                 <li>
                     <a href="<%=request.getContextPath() %>/studyPlanList" class="waves-effect">
                         <i class="mdi mdi-airplay"></i>
                         <span> 강의 계획서 </span>
                     </a>
                 </li>
                 <li>
                     <a href="<%=request.getContextPath() %>/logout" class="waves-effect">
                         <i class="mdi mdi-airplay"></i>
                         <span> 로그아웃 </span>
                     </a>
                 </li>
             </ul>
         </div>
         </sec:authorize>
         <div class="clearfix"></div>
     </div> <!-- end sidebarinner -->
 </div>
 </body>
            <!-- Left Sidebar End -->
<%-- <div class="leftNav">
	

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
</div> --%>

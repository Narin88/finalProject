<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<script type="text/javascript"
	src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.js"></script>
<script
	src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
<style>
.tui-grid-cell .tui-grid-cell-content {
	text-align: center;
	align-content: center;
}
	.HwSearch23{
			padding: 1em;
		    border-radius: 3em;
		    width: 570px;
			border:1px solid gray;
		}
</style>
<title>강의 목록 :: No.M University</title>
</head>
<body>
<div class="content-page">
			
			<!-- TEST -->
			<h3> 강의 계획서</h3>	
			<!-- 강의년도 / 강의학기  설정하면 해당하는 강의명만 나오도록 -->
			<!-- 년도,학기,강의명 별,진행중,마감 select 설정 -->
			<div class="HwSearch23">		
				<form id="frm" name="frm"  method="post">
				<sec:csrfInput/>
				
						<label>년도:</label>						
							<select name="lyear" id="lyear">		
									<option value="0">선택 </option>			  
								<c:forEach items="${ySelect}" var="ySelect">
									  <option value="${ySelect.lyear }"  <c:if test="${ySelect.lyear}"> selected="selected"</c:if> >${ySelect.lyear }</option>
								 </c:forEach>	 
							</select>
								
					<label for="term">강의학기:</label>
							<select name="term" id="term">
							  <option value="0">선택</option>	
							 <option value="1" >1학기</option>
							  <option value="2">2학기</option> 
						</select> 
							
						
		 				<span> 
						
							<button type="button" onclick="selectSubmit();">검색</button>
							<button type="button" onclick="resetFunction();">초기화</button>
						</span> 
				 </form>
			 </div>	
			 			<script>
			 				function selectSubmit(){
			 					frm.submit();
			 				}
			 				
			 			</script>
					
						<div>
							
				 		</div>
				<br>
						
				 			
				 			
	<div></div>
	<div id="grid"></div>
	<script> 
		var Btn = $('<button>');
		var clsData = [
			<c:forEach items="${spList }" var="s">
				<c:choose>
					<c:when test="${empty s.content}">
						{
							lyear:'${s.lyear}', term:'${s.term}', lname: '${s.lname}', lnum: '${s.lnum}-${s.dividenum}', pname: '${s.pname}',
							mname:'${s.mname}',dname: '${s.dname}', grade: '${s.grade}', 학점: '${s.credit}',
							division: '${s.division}', credit: '${s.credit}', 
							Btn: '<button  onclick=location.href="studyPlanInsertPage?opennum=${s.opennum}">등록</button>'
						},
					</c:when>
					<c:otherwise>
						{
								lyear:'${s.lyear}', term:'${s.term}', lname: '${s.lname}', lnum: '${s.lnum}-${s.dividenum}', pname: '${s.pname}',
								mname:'${s.mname}',dname: '${s.dname}', grade: '${s.grade}', 학점: '${s.credit}',
								division: '${s.division}', credit: '${s.credit}', 
								Btn: '<button onclick=location.href="studyPlanUpdatePage?opennum=${s.opennum}">수정</button>'
										
						},
					</c:otherwise>
				</c:choose>
			</c:forEach>
			]; //컬럼DATA
			
		
			
        // GRID 를 보여준다.
		var grid = new tui.Grid( {
			el: document.getElementById('grid'),
			pagination: true,   //페이징 처리
		    pageOptions: {
		    	useClient: true,   //페이징 처리
		    	perPage: 10   //페이징 갯수
		    }
			,
			columns: [
				{header: '강의년도',name: 'lyear'},
				{header: '강의학기',name: 'term'},
				{header: '강의이름',name: 'lname'},
				{header: '강의코드',name: 'lnum'},
				{header: '교수이름',name: 'pname'},
				{header: '개설대학',name: 'mname'},
				{header: '수강학과',name: 'dname'},
				{header: '대상학년',name: 'grade'},
				{header: '학점',name: 'credit'},
				{header: '이수구분',name: 'division'},
				{header: '강의계획서등록',name: 'Btn'}
			], //컬럼갯수
			data: clsData
		} );
	</script>
	
<!-- <button onclick=location.href="readOnly2?opennum=${s.opennum}">읽기전용</button> -->
</div>
</body>
</html>
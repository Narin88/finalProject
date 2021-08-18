<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- 현재날짜 -->
<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss" /></c:set> 
<!DOCTYPE html>
<html>
<head>
<title>과제 리스트 :: No.M University</title>
<style>
.btn15 {
  height: 15px;
}
      
.tui-grid-cell .tui-grid-cell-content {
text-align: center;
}

.movebox{
	float: right;
	display: inline;
}
.box{
	text-align: left;
	padding-left: 5px;
	float: left;
	width: 100%
}
.btn-hover.color-9 {
border-radius: 2em;
    font-size: 12px;
    border: none;
    color: white;
    padding: 2px 1.5em;
    background-image: linear-gradient(to right, #25aae1, #4481eb, #04befe, #3f86ed);
    box-shadow: 0 4px 15px 0 rgba(65, 132, 234, 0.75);
}
.btn-hover:focus {
    outline: none;
}
.btn-hover.color-11 {
border-radius: 2em;
    font-size: 12px;
    border: none;
    color: white;
    padding: 2px 1.5em;
       background-image: linear-gradient(to right, #eb3941, #f15e64, #e14e53, #e2373f);  box-shadow: 0 5px 15px rgba(242, 97, 103, .4);
}
</style>
</head>
<body>
<div class="content-page">
	<div class="card-body">
		<div align="center">
			<h2><span style="color:cornflowerblue;">${lname }</span> 과제 목록 (${count })</h2>
			<div class="box">			
				<div class="movebox"style=" width:100%;">
					<button style="float:right;"class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light" onclick=history.back()>과제 리스트</button>
				</div>	
				<div>
					<b style="font-weight: bold;float:right;"># 제출기한이 지나면 등록이 <font color="red">불가능</font>합니다. <br># 과제는 <font color="red">더블클릭</font>해야 제출 가능합니다.</b>
				</div>
			</div>
		</div>

		<div id="grid" ></div>	
		<!-- 클릭한 해당과제 제출페이지로 이동할값 -->		  			
		<form action="hwSInsert" method="post" id="hwSInsertFrm" name="hwSInsertFrm">
			<sec:csrfInput/>
			<input type="hidden" id="registerId" name="registerId">
			<input type="hidden" id="opennum" name="opennum">
		</form>		  		
	</div>	
</div>

<script>
//grid start
	var a=1;
	var clsData = [
		<c:forEach items="${result }" var="list">
			{
				lname: '${list.lname}',
				lyear: '${list.lyear}',
				term : '${list.term}',
				pcomment: '<div class="underline">${list.pcomment}</div>',
				pperiod: '<fmt:formatDate value="${list.registerDate }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${list.pperiod }" pattern="yyyy-MM-dd"/>',
				status: '<c:if test="${list.hwstatus >= 0 }"><span style="color:red;">진행중</span> </c:if><c:if test="${list.hwstatus < 0}"><span style="color:blue;">마감</span></c:if>',
				score: '<c:if test="${list.score == 0 || list.score eq null}">등록된 점수없음</c:if><c:if test="${list.score > 0}">${list.score } / 20</c:if>',
				submitCheck: '<c:if test="${list.submitCheck > 0 }"><button class="btn-hover color-9">제출완료</button></c:if><c:if test="${list.submitCheck == 0 }"><button class="btn-hover color-11">미제출</button></c:if>',
				registerId: '${list.registerId}',
				opennum:'${list.opennum}',
				hwstatus:'${list.hwstatus}',
				submitCheckVal:'${list.submitCheck}'
			},
		</c:forEach>
		]; //컬럼DATA	

	
	// GRID 를 보여준다.
	var grid = new tui.Grid( {
		bodyHeight:300,
		el: document.getElementById('grid'),
		pagination: true,   //페이징 처리
		pageOptions: {
			useClient: true,   //페이징 처리
			perPage: 6  //페이징 갯수
		},
		columns: [
			{header: '강의명',name: 'lname'},
			{header: '년도',name: 'lyear'}, //강의번호+분반
			{header: '학기',name: 'term'}, //년도+학기
			{header: '과제제목',name: 'pcomment'},
			{header: '제출기간',name: 'pperiod',width:200},
			{header: '진행상태',name: 'status'},
			{header: '점수',name: 'score'},
			{header: '제출여부',name: 'submitCheck'},
		], //컬럼갯수
		data: clsData
	});


	grid.on('dblclick', ev => {	
		//console.log('더블클릭!', ev.rowKey);
		var data = grid.getRow(ev.rowKey); //그리드 한 행의 전체값
		var a=data.registerId;
		var b=data.opennum;
		var c=data.submitCheckVal;
		var d=data.hwstatus;
		console.log(d);
		if(d<0){
 			alert("마감되었습니다");
		}else{
			if(c>0){
				alert("제출한 과제입니다.")
			}else{
				hwSInsertFrm.registerId.value=a;
				hwSInsertFrm.opennum.value=b;
				hwSInsertFrm.submit();
			}
		}
	});
</script>			
</body>
</html>
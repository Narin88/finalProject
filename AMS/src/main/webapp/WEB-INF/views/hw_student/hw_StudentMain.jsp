<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>

		.tui-grid-cell .tui-grid-cell-content {
    text-align: center;
}
</style>
</head>
<body>
	<div id="hwSMain">	
		<h4>(과제페이지)수강중인 강의</h4>
		<br>
		<div id="grid" ></div>
			<script>
			
					  		//grid start
					  		
					  				var clsData = [
								<c:forEach items="${result }" var="list">
								{
									mname: '${list.mname}', lname: '${list.lname}', lyear : '${list.lyear}',
									term: '${list.term}', lrcode: '${list.lrcode}', pname: '${list.pname}',
									schedule: '${list.schedule}'
									,hwBtn:'<button type="button">과제</button>'
								},
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
					  				{header: '전공이름',name: 'mname',width:150},
					  				{header: '과목명',name: 'lname',width:130}, //강의번호+분반
					  				{header: '강의년도',name: 'lyear',width:90}, //년도+학기
					  				{header: '학기',name: 'term',width:80},
					  				{header: '강의실',name: 'lrcode',width:100},
					  				{header: '교수명',name: 'pname',width:140},
					  				{header: '시간표',name: 'schedule'},
					  				{header: '과제',name: 'hwBtn',width:120}
					  			], //컬럼갯수
					  			data: clsData
					  		} );
						
								
					  			grid.on('dblclick', ev => {
					        		//console.log('더블클릭!', ev.rowKey);
					        		var data = grid.getRow(ev.rowKey); //그리드 한 행의 전체값
					        		
					        		
					        		console.log(data); 	
					        	});
								
					  			</script>
	</div>
</body>
</html>
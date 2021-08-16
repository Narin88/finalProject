<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>수정 :: No.M University</title>
<style>

		.tui-grid-cell .tui-grid-cell-content {
    text-align: center;
}
.menu01 {
				width:100%;
				height: 80px;
			    padding: 1em;
			    margin-left: -40px;
				}
				.menu01 ul li{
					list-style-type:none;
					float:left;			
					margin-left:20px;
					font-weight:bold;		
				}
				.modalBtn{ 
				margin-left: -30px;
		  border-radius: 1em;
		    background-color: lightpink;
		    color: white;
		    padding-left: 2em;
		    padding-right: 2em;
		    padding-top: 8px;
		    padding-bottom: 5px;
		    font-size: 20px;
		    border: none;
	     	}	

</style>
</head>
<body>
<div class="content-page">



	<div class="hwSMain">	
	<div class="menu01">		
				<ul>
					<li><a class="modalBtn" href="hwStudent">과제 메인페이지</a></li>			
					
					<li><a class="modalBtn" href="submitList" style="    margin-left: 20px;">제출한 과제</a></li>	
				</ul>
			
				
				</div>
		<div style="margin-left:20px;">
			<h4> * 현재 수강중인 강의 *</h4>
			<h6> 'lecture datastatus '수강중'인 목록만</h6>
			<br>
		</div>
		<div id="grid" ></div>
			<script>
			
					  		//grid start
					  		
					  				var clsData = [
								<c:forEach items="${result }" var="list">
								{
									mname: '${list.mname}', lname: '${list.lname}', lyear : '${list.lyear}',
									term: '${list.term}', lrcode: '${list.lrcode}', pname: '${list.pname}',
									schedule: '${list.schedule}'
									,hwBtn:'<button type="button" id="hwClick" data-id="${list.opennum}">과제</button>'
									,opennum:'${list.opennum}'
								},
								</c:forEach>
								]; //컬럼DATA	

					  		
					  	       // GRID 를 보여준다.
					  			var grid = new tui.Grid( {
									el: document.getElementById('grid'),
									bodyHeight:230,
									pagination: true,   //페이징 처리
								    pageOptions: {
								    	useClient: true,   //페이징 처리
								    	perPage: 5   //페이징 갯수
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
					  				{header: '과제',name: 'hwBtn',width:120},
					  			], //컬럼갯수
					  			data: clsData
					  		} );
						
							/*	
					  			grid.on('dblclick', ev => {
					        		//console.log('더블클릭!', ev.rowKey);
					        		var data = grid.getRow(ev.rowKey); //그리드 한 행의 전체값
					        		var opennum = data.opennum;
					        		
					        		hwStFrm.opennum.value=opennum;
					       			hwStFrm.submit(); 		
					        		
					        	});
								*/
					  			$(".hwSMain").on("click","#hwClick",function(){
					  				var a=$(this).data('id');
					  				console.log(a);
					  				hwStFrm.opennum.value=a;
					  				hwStFrm.submit();
					  			
					  			});
					  			</script>
	</div>
	
	<form id="hwStFrm" name="hwStFrm" action="hwSelect" method="post">
	<sec:csrfInput/>
	 	<input type="hidden" id="opennum" name="opennum">
	</form>
</div>
</body>
</html>
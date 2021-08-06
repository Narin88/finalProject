<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교수 과제 등록 Page</title>
<style>	
			.menu01 {
				height: 30px;
			    margin-top: -30px;
			    padding: 1em;
			    margin-left: -40px;
				}
					.HwSearch{
			margin-top:50px;
			padding: 1em;
		    border-radius: 3em;
		    width: 570px;
			border:1px solid gray;
		}
				.menu01 ul li{
					list-style-type:none;
					float:left;			
					margin-left:20px;
					font-weight:bold;		
				}
		.modalBtn{ 
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
	<div class="menu01">		
				<ul>
					<li><a class="modalBtn" href="hwList">과제 페이지</a></li>
					<li><a class="modalBtn" href="hwPfInsert" >등록 페이지</a></li>
					
				</ul>			
			</div>
				<div id="grid" ></div>
	<script>
					  		//grid start
					  		
					  				var clsData = [
								<c:forEach items="${result }" var="list">
								{
									lyear: '${list.lyear}', lterm: '${list.term}', lname : '${list.lname}',
									lrcode: '${list.lrcode}', lnum: '${list.lnum}', pid: '${list.pid}',
									,inquiryBtn:'<button type="button" id="inquiry" data-id="${list.register_id}" data-num="${list.opennum }">조회</button> '
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
					  				{header: '강의년도',name: 'lyear',width:100},
					  				{header: '학기',name: 'lterm',width:60}, //강의번호+분반
					  				{header: '강의명',name: 'lname',width:90}, //년도+학기
					  				{header: '강의실',name: 'lrcode',width:80},
					  				{header: '과목번호',name: 'lnum'},
					  				{header: 'pId',name: 'pid',width:140},
					  				{header: '조회',name: 'inquiryBtn',width:120}
					  			], //컬럼갯수
					  			data: clsData
					  		} );
						
								
							
								
					  			</script>
			<script>
			 				function hwPfIn(){
			 					var a=$("#lnum option:checked").text();	
			 					hwPfinsert.ln.value=a;
			 					hwPfinsert.submit();
			 				}
			 				
			 			</script>
</body>
</html>
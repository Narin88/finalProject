<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>평균처리 페이지</title>
<style>
.tui-grid-border-line-top {
    border: none;
    }
	.tui-grid-cell .tui-grid-cell-content {
    text-align: center;
}
	.tui-grid-pagination{
	    margin-left: -500px;
	}
.tui-grid-header-area {
    background-color: #fff;
    border: none;
}
.tui-grid-content-area{
	border: none;
    width: 690px;
}
#grid2 .tui-grid-content-area{
	border: none;
    width: 300px;
}
.menu01 {
				height: 30px;
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
		#grid .tui-grid-pagination {
		margin-left:-1000px;
		}
		#grid2 .tui-grid-pagination {
		margin-left:-1400px;
		}
</style>
</head>
<body>
<div class="leftContainer">
	<div class="menu01" style="margin-left:200px;">		
				<ul>
					<li><a class="modalBtn" href="hwList">과제 페이지</a></li>
					<li><a class="modalBtn" href="hwPfInsert" >등록 페이지</a></li>
					<li><a class="modalBtn" href="hwPfScoreAvg" >평균처리 페이지</a></li>
					
				</ul>	
				
	</div>
		
			<h6 style="clear:both;float:left;margin-left:280px;margin-top:50px;"> 평균처리 가능 수강목록 </h6>
			<div id="grid" style="margin-left:260px;" >
				
			</div>
			
			<script>
		
					  		//grid start
					  		
					  				var clsData = [
								<c:forEach items="${result }" var="list">
								{
									lyear: '${list.lyear}', lterm: '${list.term}', lname : '${list.lname}',
									lrcode: '${list.lrcode}', lnum: '${list.lnum}', pid: '${list.pid}',
									referBtn:'<button type="button" id="referId" data-id="${list.register_id}" data-num="${list.opennum }">조회</button> '
								},
								</c:forEach>
								]; //컬럼DATA	

					  		
					  	       // GRID 를 보여준다.
					  			var grid = new tui.Grid( {
									el: document.getElementById('grid'),
									pagination: true,   //페이징 처리
								    pageOptions: {
								    	useClient: true,   //페이징 처리
								    	perPage: 5   //페이징 갯수
								    }
									,
					  			columns: [
					  				{header: '강의년도',name: 'lyear',width:100},
					  				{header: '학기',name: 'lterm',width:60}, //강의번호+분반
					  				{header: '강의명',name: 'lname',width:90}, //년도+학기
					  				{header: '강의실',name: 'lrcode',width:80},
					  				{header: '과목번호',name: 'lnum',width:80},
					  				{header: 'pId',name: 'pid',width:140},
					  				{header: '조회',name: 'referBtn',width:120}
					  			], //컬럼갯수
					  			data: clsData
					  		} );
						
			
								
								//해당강의 등록된 학생조회
					  		$(".leftContainer").on("click","#referId",function(){
					  	           var a= $(this).data('num'); //
					  	           console.log(a);
					  	         $.ajax({
										type:"post",
										url:"referAvgList",
										data:{ 
											opennum : a
											},
										dataType:"json",
										success: function(data){		
											console.log(data);
											
											$('#grid2').empty();
											$('<button type="button" style="margin-left: 170px;margin-top: 47px;">처리</button>').appendTo("#grid2");
											$('<h2>=></h2>').appendTo("#referClass");
											//grid start
									  	
							  		
							  	       // GRID 를 보여준다.
							  			var grid = new tui.Grid( {
							  				bodyHeight:450,
											el: document.getElementById('grid2'),
											pagination: true,   //페이징 처리
										    pageOptions: {
										    	useClient: true,   //페이징 처리
										    	perPage: 10   //페이징 갯수
										    }
											,
							  			columns: [
							  				{header: '학생번호',name: 'sid',width:100},
							  				{header: '학생이름',name: 'name',width:200} 
							  			], //컬럼갯수
							  			data:data
							  		} );
										}
					  	         })
					  		});
			
			</script>
			
			<h6 style="clear:both;float:left;margin-left:280px;margin-top:50px;"> 조회목록 </h6>
			<div id="grid2" style="margin-left:260px; width:300px;" >
				
			</div>
			<div id="referClass" style="float:left; margin-left:600px; margin-top: -350px;">
				
			</div>
			
		
					  	
						
			
					
	
		
</div>
</body>
</html>
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
	<div class="menu01">		
				<ul>
					<li><a class="modalBtn" href="hwStudent">과제 메인페이지</a></li>			
					
					<li><a class="modalBtn" href="submitList" style="    margin-left: 20px;">제출한 과제</a></li>	
				</ul>
			
				
				</div>			
			<h6> 'lecture datastatus '수강중'인 강의들의 제출한 과제전체 리스트</h6>
			
			<div id="grid" ></div>
	
			<script>
			
					  		//grid start
					  			var a=1;
					  				var clsData = [
								<c:forEach items="${result }" var="list">
								
								{
									
									lname: '${list.lname}'
									, lyear: '${list.lyear}'
									, term : '${list.term}'
									,pcomment: '<div class="underline">${list.pcomment}</div>'
									,pperiod: '<fmt:formatDate value="${list.registerDate }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${list.pperiod }" pattern="yyyy-MM-dd"/><c:if test="${list.hwstatus >= 0 }"><br><span style="color:red;">진행중</span> </c:if><c:if test="${list.hwstatus < 0}"><br><span style="color:blue;">마감</span></c:if>'
									,score: '<c:if test="${list.score eq null}">등록된 점수없음</c:if> ${list.score}'
									,registerId: '${list.registerId}'
									,alterBtn:'<c:if test="${list.hwstatus > 0 }" ><button type="button" id="alterBtn" data-id="${list.registerId}" data-id2="${list.opennum}" data-id3="${list.hwstatus}" data-id4="${list.score}"> 수정 </button></c:if><c:if test="${list.hwstatus < 0 }"><span style="color:brown;">수정불가</span></c:if>'
								},
								
								</c:forEach>
								]; //컬럼DATA	

					  		
					  	       // GRID 를 보여준다.
					  			var grid = new tui.Grid( {
					  				bodyHeight:265,
									el: document.getElementById('grid'),
									pagination: true,   //페이징 처리
								    pageOptions: {
								    	useClient: true,   //페이징 처리
								    	perPage: 6  //페이징 갯수
								    }
									,
					  			columns: [
					  				{header: '강의명',name: 'lname',width:100},
					  				{header: '년도',name: 'lyear',width:60}, //강의번호+분반
					  				{header: '학기',name: 'term',width:90}, //년도+학기
					  				{header: '과제제목',name: 'pcomment',width:350},
					  				{header: '제출기간',name: 'pperiod'},
					  				{header: '점수',name: 'score',width:140},
					  				{header: '수정',name: 'alterBtn',width:120},
					  			], //컬럼갯수
					  			data: clsData
					  		} );
						
								/*
					  			grid.on('dblclick', ev => {	
					        		//console.log('더블클릭!', ev.rowKey);
					        		var data = grid.getRow(ev.rowKey); //그리드 한 행의 전체값
					        		var a=data.registerId;
					        		var b=data.opennum;
									var c=data.submitCheckVal;
									var d=data.hwstatus;
									console.log(d);
									if(d<=0){
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
								*/
					  			$("#grid").on("click","#alterBtn",function(){
									var a=$(this).data('id');
									var b=$(this).data('id2');
									var c=$(this).data('id3');
									var d=$(this).data('id4');			
						
									console.log(a);
									console.log(b);
									console.log(c);
									deleteHwSFrm.registerId.value=a;
									deleteHwSFrm.opennum.value=b;
									if(c <= 0){
										alert("수정이 불가능합니다.");
									}else{
										if(confirm("수정을 하게되면 데이터가 삭제됩니다.   삭제 하시겠습니까?")==true){
											alert("작성페이지로 이동합니다.")		
											deleteHwSFrm.submit();
											}else{
												alert("취소되었습니다");
												return false;
											}
									}
					            
					  			});
					  			
					  			</script>
					  			
					  	<!-- 수정버튼 클릭  폼 -->		
				<form action="deleteHwS" method="post" id="deleteHwSFrm" name="deleteHwSFrm">
				<sec:csrfInput/>
					<input type="hidden" id="registerId" name="registerId">
					<input type="hidden" id="opennum" name="opennum">
			</form>
</div>
</body>
</html>
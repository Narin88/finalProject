<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.tui-grid-cell .tui-grid-cell-content {
   text-align: center;
}
</style>
<!-- Toast grid -->
	<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
	<link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
	<script type="text/javascript" src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.js"></script>
	<script src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<h2>수강 신청</h2>
	<div>
		<h3>수강신청 주의사항</h3>
		수강신청은 더블클릭 하셔야 신청이 됩니다. 
	</div>
</div>
<div id="grid"></div>

 
<script>
$(function(){
//grid start
//grid api-source
	const dataSource = {
	  contentType: 'application/json',
	  api: {
		readData: {
			url: 'EnrolmentList',
			method: 'GET'
		}
	  }
	};
		
		
       // GRID 를 보여준다.
	var grid = new tui.Grid( {
		el: document.getElementById('grid'),
		data: {
				api:{
					readData:{ url: 'EnrolmentList',method: 'GET' }
				}
		},
		pagination: true,   //페이징 처리
	    pageOptions: {
	    	useClient: true,   //페이징 처리
	    	perPage: 10   //페이징 갯수
	    },
		columns: [
			{header: '강의등록번호',name: 'openNum', width: 100},
			{header: '강의번호',name: 'lnum', width: 100}, //강의번호+분반
			{header: '년도',name: 'lyear',width: 100}, //년도+학기
			{header: '학년',name: 'grade',width: 100},
			{header: '과목명',name: 'lname',width: 200},
			{header: '이수구분',name: 'division',width: 100},
			{header: '강의실',name: 'lrName',width: 80},
			{header: '시간표',name: 'timeTable',width: 150},
			{header: '수강신청인원',name: 'enCount',width: 80},
			{header: '수강정원',name: 'newLimitCount',width: 80}
		] //컬럼갯수
	} );
    
       
    //grid 이벤트
	grid.on('dblclick', ev => {
		//console.log('더블클릭!', ev.rowKey);
		var data = grid.getRow(ev.rowKey); //그리드 한 행의 전체값
		
		var enCount = data.enCount;
		var limit = data.newLimitCount;
		var opennum = data.openNum;
		console.log(data);
		//조건 검사
		
		if(enCount>=limit){ 
			alert("수강정원이 마감되었습니다.");
		}else{
			$.ajax({
				url: 'AjaxConfirm',
				type:'POST',
				data: {openNum: opennum},
				success: function(result){
					 if(result>0){ 
						var con1 = confirm('이미 수강신청 되었습니다. 취소하시겠습니까?')
						if(con1){ //수강 취소(삭제)
							location.href='AjaxEnrolmentDelete?openNum='+opennum
						}else{
							return false;
						}
					}
					 else{
							location.href='AjaxEnrolmentInsert?openNum='+opennum
					 }
				},
				error:function(){}
			});
		}
	});
    
})
//grid end


</script>
</body>
</html>
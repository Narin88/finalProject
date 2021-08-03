<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<title>Insert title here</title>
</head>
<body>
<div align="center">
	<h2>수강등록 리스트</h2>
</div>
<div align = "right">
<button id="updateBtn">수정하기</button>
<button id="deleteBtn">삭제하기</button>
</div>

<div id="grid"></div>


<script> 

//grid start

var clsData = [
	<c:forEach items="${lectures }" var="lec">{
		openNum: '${lec.openNum}', lNum: '${lec.LNum}-${lec.divideNum}', lYear: '${lec.LYear}-${lec.term}', grade: '${lec.grade}', lName: '${lec.LName}', book: '${lec.book}', division: '${lec.division}', newLimitCount: '${lec.newLimitCount}', lrName: '${lec.lrName}', timeTable: '${lec.timeTable}'
	}
	<c:if test='${!empty lec.openNum}'>
	,
	</c:if>
	</c:forEach>
	]; 

//grid api-source
	const dataSource = {
	  withCredentials: false,  
	  initialRequest: false,
	  contentType: 'application/json',
	  api: {
		readData: {},
	    updateData: {
	      url: 'lectureUpdate', //업데이트 url
	      method: 'PUT' //funtion 메서드
	    },
	    deleteData: {
	    	url: 'lectureDelete',
	    	method: 'PUT' 
	    	}
	  }
	};
		
		
       // GRID 를 보여준다.
	var grid = new tui.Grid( {
		el: document.getElementById('grid'),
		data: dataSource,
		rowHeaders: ['checkbox'],
		pagination: true,   //페이징 처리
	    pageOptions: {
	    	useClient: true,   //페이징 처리
	    	perPage: 10   //페이징 갯수
	    }
		,
		columns: [
			{header: '강의등록번호',name: 'openNum', width: 100},
			{header: '강의번호',name: 'lNum', width: 100}, //강의번호+분반
			{header: '년도',name: 'lYear',width: 100}, //년도+학기
			{header: '학년',name: 'grade',width: 100},
			{header: '과목명',name: 'lName',width: 200},
			{header: '교재',name: 'book',width: 200, editor: 'text'},
			{header: '이수구분',name: 'division',width: 100},
			{header: '정원',name: 'newLimitCount',width: 80},
			{header: '강의실',name: 'lrName',width: 80},
			{header: '시간표',name: 'timeTable',width: 150, editor: 'text'}
		] //컬럼갯수

	} );
//grid end

grid.resetData(clsData) //그리드를 그려놓고 데이터를 새로 넣음 (기존datasource -> clsData)

//업데이트 버튼 누를때 lectureUpdate 함수 실행
document.getElementById('updateBtn').addEventListener('click', lectureUpdate);

//삭제 버튼 누를때 함수실행
document.getElementById('deleteBtn').addEventListener('click', lectureDelete);

function lectureDelete(){
	grid.removeCheckedRows(false);   
    grid.request('deleteData', {checkedOnly: true});
}


//작업중인 행들을 저장해줌
	function lectureUpdate(){
		const { rowKey, columnName } = grid.getFocusedCell();
	
		  if (rowKey && columnName) {
		    grid.finishEditing(rowKey, columnName);
		  }
	
		  grid.request('updateData', {
		    checkedOnly: false
		  });
	}
// 업데이트 실행 이벤트
	grid.on('response', ev => {
		  var {response} = ev.xhr;
		  var responseObj = JSON.parse(response);
	
		  console.log('result : ', responseObj.result);
		  console.log('data : ', responseObj.data);
		});

	
</script>

</body>
</html>
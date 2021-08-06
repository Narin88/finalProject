<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
.tui-grid-cell .tui-grid-cell-content {
	text-align: center;
}
</style>
<!-- Toast grid -->
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<title>성적관리</title>
</head>
<body>

	<div align="center">
		<h2>{lName } - 수강생 리스트</h2>
	</div>

	<div align="right">
		<button id="updateBtn">수정하기</button>
	</div>

	<div id="grid"></div>



	<script> 


	// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
	Element.prototype.setStyle = function(styles) {
	    for (var k in styles) this.style[k] = styles[k];
	    return this;
	};
	

	

//grid start

var clsData = [
	<c:forEach items="${lectures }" var="lec">{
		opennum: '${lec.opennum}',sid: '${lec.sid}', sname: '${lec.sname}', lnum: '${lec.lnum}', lname: '${lec.lname}', 
		middlescore: '${lec.middlescore}', finalscore: '${lec.finalscore}', attendancescore: '${lec.attendancescore}', 
		homework: '${lec.homework}', total: '${lec.total}', rank: '${lec.rank}'
	}
	<c:if test='${!empty lec.opennum}'>
		
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
	      url: 'ScoreInsert', //업데이트 url
	      method: 'PUT' //funtion 메서드
	    },
	    
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
	    	perPage: 50   //페이징 갯수
	    }
		,
		columns: [
			{header: '강의등록번호',name: 'opennum', width: 100},
			{header: '학번',name: 'sid', width: 150}, 
			{header: '학생이름',name: 'sname',width: 150}, 
			{header: '강의번호',name: 'lnum',width: 150}, 
			{header: '강의이름',name: 'lname',width: 200}, 
			{header: '중간고사',name: 'middlescore',width: 150, editor: 'text'},
			{header: '기말고사',name: 'finalscore',width: 150, editor: 'text'},
			{header: '출석점수',name: 'attendancescore',width: 150, editor: 'text'},
			{header: '과제',name: 'homework',width: 150, editor: 'text'},
			{header: '총점',name: 'total',width: 150},
			{header: '등급',name: 'rank',width: 130},
		
		] //컬럼갯수

	} );
//grid end

grid.resetData(clsData) //그리드를 그려놓고 데이터를 새로 넣음 (기존datasource -> clsData)

//업데이트 버튼 누를때 lectureUpdate 함수 실행
document.getElementById('updateBtn').addEventListener('click', ScoreInsert);


//작업중인 행들을 저장해줌
	function ScoreInsert(){
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
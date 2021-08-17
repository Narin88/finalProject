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
<script type = "text/javascript" src = "http://code.jquery.com/jquery-latest.min.js"></script> 
<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type = "text/javascript" src = "https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>

<title>성적 관리 :: No.M University</title>
</head>
<body>
<div class="content-page">
	<div class="card-body">
		<div align="center">
			<button id="createpdf" class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light">pdf 생성</button>
		</div>
		<div id="pdfwrap">
			<div align="center">
				<h2>수강생 리스트</h2>
			</div>
			<div align="right">
				<button id="updateBtn" class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light">수정하기</button>
			</div>
			<div id="grid"></div>
		</div>
	</div>
</div>
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
	    	perPage: 50   //페이징 갯수
	    }
		,
		columns: [
			{header: '강의등록번호',name: 'opennum', width: 130},
			{header: '학번',name: 'sid', width: 130}, 
			{header: '학생이름',name: 'sname',width: 130}, 
			{header: '강의번호',name: 'lnum',width: 150}, 
			{header: '강의이름',name: 'lname'}, 
			{header: '중간고사',name: 'middlescore',width: 130, editor: 'text'},
			{header: '기말고사',name: 'finalscore',width: 130, editor: 'text'},
			{header: '출석점수',name: 'attendancescore',width: 130, editor: 'text'},
			{header: '과제',name: 'homework',width: 130, editor: 'text'},
			{header: '총점',name: 'total',width: 130},
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
<script>
$('#createpdf').click(function() {
	  //pdf_wrap을 canvas객체로 변환
/* 	  html2canvas($('#pdfwrap')[0]).then(function(canvas) {
	    var doc = new jsPDF('p', 'mm', 'a4'); //jspdf객체 생성
	    var imgData = canvas.toDataURL('image/png'); //캔버스를 이미지로 변환
	    doc.addImage(imgData, 'PNG', 0, 0); //이미지를 기반으로 pdf생성
	    doc.save('LecturePlan-file.pdf'); //pdf저장
	    alert('클릭됨');
	  }); */
	  
	  html2canvas($('#pdfwrap')[0]).then(function (canvas) {
		  var filename = 'LecturePlan_' + Date.now() + '.pdf'; 
		  var doc = new jsPDF('p', 'mm', 'a4'); 
		  var imgData = canvas.toDataURL('image/png'); 
		  var imgWidth = 210; 
		  var pageHeight = 295; 
		  var imgHeight = canvas.height * imgWidth / canvas.width; 
		  var heightLeft = imgHeight; 
		  var position = 0; doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight); heightLeft -= pageHeight; 
		  while (heightLeft >= 0) { position = heightLeft - imgHeight; doc.addPage(); doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight); heightLeft -= pageHeight; } doc.save(filename); 
		  alert('클릭됨');
	  });

	});
	
</script>

</body>
</html>
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
	.showmodal {
        display: none;
        width: 80%;
        height: 50%;	
        padding: 30px 60px;
        background-color: #fefefe;
        border: 1px solid #888;
        border-radius: 3px;
    }
     .showmodal .modal_close_btn {
        position: absolute;
        top: 10px;
        right: 10px;
    }
    
    .modal-body{
    	font-size: 10pt;
    }
    
.ScoStudent{
	width: 80%;
	border-spacing: 0;
    border-collapse: collapse;
}
.infotitle{
	border-bottom: 1px solid #dedede !important;
    color: #212121;
    font-size: 15px;
    text-transform: uppercase;
    text-align: center;
    font-weight: 600;
    height: 50px;
}
.info{
	border-bottom: 1px solid #dedede !important;
    color: #212121;
    font-size: 15px;
    text-transform: uppercase;
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

<title>강의 목록 :: No.M University</title>
</head>
<body>
<div align="center">
	<h2>강의 목록</h2>
</div>
<div align = "right">
<button id="updateBtn">수정하기</button>
<button id="deleteBtn">삭제하기</button>
</div>

<div id="grid"></div>


<!-- 모달 div -->
<div id="showmodal" align="center" class="showmodal">
    <a class="modal_close_btn">닫기</a>
    <div class="modal-body">
	   <h2> 수강 등록 </h2>
	   <sec:csrfInput/>
	   <table class="ScoStudent" id="ScoStudent">
	   		<thead>
	   		<tr>
	   			<th class="infotitle">학번</th>
	   			<th class="infotitle">이름</th>
	   			<th class="infotitle">전공</th>
	   			<th class="infotitle">E-mail</th>
	   			<th class="infotitle">연락처</th>
	   			<th class="infotitle">성별</th>
	   			<th class="infotitle">장애여부</th>
	   		</tr>
	   		</thead>
	   		<tbody></tbody>
	   </table>
	</div>
</div>

<script> 
$(function(){
	grid.on('dblclick', ev => {
		//console.log('더블클릭!', ev.rowKey);
		var data = grid.getRow(ev.rowKey); //그리드 한 행의 전체값
		var opennum = data.openNum;
		$.ajax({
			url:'ScoreStudentList',
			type: 'GET',
			data: {opennum: opennum},
			success: function(result){
				StudentList(result);
			}
			
		})
		
	});

	function StudentList(result) {
		modal('showmodal');

		var row = '<TR>';
		if(result.length==0){
			row += '<td colspan=\"7\" class=\'info\'> 현재 수강등록한 학생이 없습니다</td>';
			row += '</tr>';
		}else{
			$.each(result,function(i){
				row += '<td class=\'info\'>'+result[i].sid+'</td><td class=\'info\'>'+result[i].sname+'</td><td class=\'info\'>'+result[i].mname+'</td><td class=\'info\'>'+result[i].email+'</td><td class=\'info\'>'//
					+result[i].sphone+'</td><td class=\'info\'>'+result[i].sgender+'</td><td class=\'info\'>'+result[i].disabled;
				row += '</tr>';
			});
		}
		
		
		$("#ScoStudent tbody").empty();
		$("#ScoStudent tbody").append(row);
		
		
	}
				
	function modal(mm) {
	    var zIndex = 9999;
	    var modal = document.getElementById(mm);

	    // 모달 div 뒤에 희끄무레한 레이어
	    var bg = document.createElement('div');
	    bg.setStyle({
	        position: 'fixed',
	        zIndex: zIndex,
	        left: '0px',
	        top: '0px',
	        width: '100%',
	        height: '100%',
	        overflow: 'auto',
	        // 레이어 색갈은 여기서 바꾸면 됨
	        backgroundColor: 'rgba(0,0,0,0.4)'
	    });
	    document.body.append(bg);

	    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
	    modal.querySelector('.modal_close_btn').addEventListener('click', function() {
	        bg.remove();
	        modal.style.display = 'none';
	    });

	    modal.setStyle({
	        position: 'fixed',
	        display: 'block',
	        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

	        // 시꺼먼 레이어 보다 한칸 위에 보이기
	        zIndex: zIndex + 1,

	        // div center 정렬
	        top: '50%',
	        left: '50%',
	        transform: 'translate(-50%, -50%)',
	        msTransform: 'translate(-50%, -50%)',
	        webkitTransform: 'translate(-50%, -50%)'
	    });
	}

	// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
	Element.prototype.setStyle = function(styles) {
	    for (var k in styles) this.style[k] = styles[k];
	    return this;
	};
	
	
});


	

//grid start

var clsData = [
	<c:forEach items="${lectures }" var="lec">{
		opennum: '${lec.opennum}', lnum: '${lec.lnum}-${lec.dividenum}', lyear: '${lec.lyear}-${lec.term}', grade: '${lec.grade}',
		lname: '${lec.lname}', book: '${lec.book}', division: '${lec.division}', newlimitcount: '${lec.newlimitcount}', lrname: '${lec.lrname}',
		timetable: '${lec.timetable}' , evaluation: '<button id="openbtn${lec.opennum}" onclick="openpage(${lec.opennum})">확인</button>'
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
			{header: '강의등록번호',name: 'opennum', width: 100},
			{header: '강의번호',name: 'lnum', width: 100}, //강의번호+분반
			{header: '년도',name: 'lyear',width: 100}, //년도+학기
			{header: '학년',name: 'grade',width: 100},
			{header: '과목명',name: 'lname',width: 200},
			{header: '교재',name: 'book',width: 200, editor: 'text'},
			{header: '이수구분',name: 'division',width: 100},
			{header: '정원',name: 'newlimitcount',width: 80},
			{header: '강의실',name: 'lrname',width: 80},
			{header: '시간표',name: 'timetable',width: 150, editor: 'text'},
			{header: '강의평가', name: 'evaluation', width:150}
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

function openpage(data){
	var opennum = data;
	location.href="Eresultpro?opennum="+opennum
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

	#my_offer {
        display: none;
        width: 80%;
        height: 40%;	
        padding: 30px 60px;
        background-color: #fefefe;
        border: 1px solid #888;
        border-radius: 3px;
    }
    
     #my_offer .modal_close_btn {
        position: absolute;
        top: 10px;
        right: 10px;
    }
    
    .modal-body{
    	font-size: 10pt;
    }	
    
    .professorInfo{
		--bs-table-bg: transparent;
		--bs-table-striped-color: #212529;
		--bs-table-striped-bg: rgba(0, 0, 0, 0.05);
		--bs-table-active-color: #212529;
		--bs-table-active-bg: rgba(0, 0, 0, 0.1);
		--bs-table-hover-color: #212529;
		--bs-table-hover-bg: rgba(0, 0, 0, 0.075);
		width: 100%;
	    color: #212529;
	    vertical-align: top;
	    border-color: #dee2e6;
	}
	
	th,td{
		border-color: inherit;
	    border-style: solid;
	    border-width: 0;
	    text-align: center;
	    padding: 10px; 
	}

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

<title>수강 신청된 과목 확인</title>

<div align = "center">
	<h2>수강 신청된 강의 리스트</h2>
	<div id = "grid"></div>
</div>

<!-- 모달 뷰-->
<div id="my_offer" align="center">
    <a class="modal_close_btn">닫기</a>
    <div class="modal-body">
	   <h2> 교수 정보 </h2>
	   <table class="professorInfo" id="professorInfo"  border="1">
	   		<thead>
	   		<tr>
	   			<th>교수명</th>
	   			<th>이메일</th>
	   			<th>연락처</th>
	   		</tr>
	   		</thead>
	   		<tbody></tbody>
	   </table>
	</div>
</div>
<!-- 모달 끝 -->

<script>

// 그리드

	var lecData = [
		
		<c:forEach items = "${st}" var = "st">{
			
			lnum 		: '${st.lnum}' + '${st.dividenum}',
			lname 		: '${st.lname}',
			division 	: '${st.division}',
			credit 		: '${st.credit}',
			timetable 	: '${st.timetable}',
			lrname 		: '${st.lrname}',
			pname 		: '${st.pname}',
			email		: '${st.email}',
			pphone		: '${st.pphone}'
		}
		<c:if test='${!empty st.lnum}'>
		,
		</c:if>
		</c:forEach>
	];
	
// 그리드 api-source

	const dataSource = {
		
		withCredentials	: false,
		initialRequest	: false,
		contentType		: 'application/json',
		api : {
			
			readData	: {},
			updateData	: {
				
				url		: '',
				method	: ''
			}
		}
		
	};


// 그리드를 보여준다
	var grid = new tui.Grid({
		
		el: document.getElementById('grid'),
		data: dataSource,
		//rowHeaders: ['checkbox'],
		/* pagination: false,		//페이징 처리
	    pageOptions: {
	    	useClient: false,	//페이징 처리
	    	perPage: 10   		//페이징 갯수
	    }
		, */
		columns: [
			{header: '강의코드', name: 'lnum'},
			{header: '강의명', name: 'lname'},
			{header: '이수구분', name: 'division'},
			{header: '학점', name: 'credit'},
			{header: '강의시간', name: 'timetable'},
			{header: '강의실', name: 'lrname'},
			{header: '교수', name: 'pname'}
			
		] //컬럼갯수
		
	});

	grid.resetData(lecData) //그리드를 그려놓고 데이터를 넣음
	
// 그리드 끝

//모달 start
	document.addEventListener("DOMContentLoaded", function(){
		
		grid.on('click', ev =>{
			
			var data = grid.getRow(ev.rowKey);
			showOffer(data);
		});
	
		function showOffer(data) {
			
			modal('my_offer');
			
			var pname = data.pname;
			var email = data.email;
			var pphone = data.pphone;
			
			$("#professorInfo tbody").empty();
			$('<tr>')
			.append($('<td>').html(pname))
			.append($('<td>').html(email))
			.append($('<td>').html(pphone))
			.appendTo("#professorInfo tbody"); 
			
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
</script>
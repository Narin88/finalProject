
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과제등록 :: No.M University</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style>	
	.tui-grid-cell .tui-grid-cell-content {
    text-align: center;
}
	.tui-grid-pagination{
	    margin-left: -100px;
	}
.tui-grid-header-area {
    background-color: #fff;
    border: none;
}
.tui-grid-content-area{
	border: none;
  
}
.tui-grid-border-line-top {
    border: none;
    }
		 /* The Modal (background) */
        .modalEE {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin-top: 8%;/* 15% from the top and centered */
            margin-left: 28%;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
    		min-height: 350px; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        .btn15 {
       		height: 15px;
      	}
		.dateform-control{
			height: 30px;
			width: 30%;
		    font-size: 14px;
		    display: inline;
		    padding: .375rem .75rem;
		    font-size: 1rem;
		    font-weight: 400;
		    line-height: 1.5;
		    color: #495057;
		    background-color: #fff;
		    background-clip: padding-box;
		    border: 1px solid #ced4da;
		    border-radius: .25rem;
		    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
		}
</style>
</head>
<body>
<div class="content-page">
	<div id="card" class="card-body">
		<div class="gridC">
			<div id="grid" >
				<h2 align="center">등록가능한 과제 목록</h2>
			</div>
		</div>	
<!-- The Modal -->
		<div id="myModal" class="modalEE">
		<!-- Modal content -->
			 <div class="modal-content">                                                             
				<div class="hwContainer">
				<span class="close">&times;</span>  
						<!-- 조회눌렀을때  모달창안에 들어갈 내용들 -->
					<div class="noSubmit">
					<!-- 과제등록 정보 폼 -->
						<form method="post" enctype="multipart/form-data" action="hwInsertForm" id="hwInsertFrm" name="hwInsertFrm" >
						<sec:csrfInput/>
						<input type="hidden" id="opennum" name="opennum">
						<input type="hidden" id="pperiod" name="pperiod">
						<input type="hidden" id="pcomment" name="pcomment">
							<table id="hwInsertTb" class="table table-bordered">
								<thead>
									<th colspan="2">과제 등록</th>
								</thead>
								<tbody>
								</tbody>
							</table>
							<div align="center">
								<button type="button" onclick="hwInsertSubmit();" class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light">등록하기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		<!-- MODAL HTML END-->
		</div>
	</div>
</div>

<script>
//grid start

	var clsData = [
		<c:forEach items="${result }" var="list">
		{
			lyear: '${list.lyear}', lterm: '${list.term}', lname : '${list.lname}',
			lrcode: '${list.lrcode}', lnum: '${list.lnum}', pid: '${list.pid}',
			insertBtn:'<button type="button" id="hwInsert" data-id="${list.register_id}" data-num="${list.opennum }" class ="btn btn-facebook m-l-10 waves-effect waves-light btn15">등록</button> '
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
    },
	columns: [
		{header: '강의년도',name: 'lyear'},
		{header: '학기',name: 'lterm'}, //강의번호+분반
		{header: '강의명',name: 'lname'}, //년도+학기
		{header: '강의실',name: 'lrcode'},
		{header: '과목번호',name: 'lnum'},
		{header: '교수번호',name: 'pid'},
		{header: '등록하기',name: 'insertBtn'}
	], //컬럼갯수
		data: clsData
	});
	
	// Get the modal
	var modal = document.getElementById('myModal');
	 
	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");
	 
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];                                          
	 
	// When the user clicks on the button, open the modal 
	
	$(".gridC").on("click","#hwInsert",function(){
		var a= $(this).data('num'); //
		console.log(a);
        grid.on('click', ev => {
			var data = grid.getRow(ev.rowKey); //그리드 한 행의 전체값
			ClickData(data,a);
		});
		
		//클릭한 행의 값
		function ClickData(data,a){
			var lyear=data.lyear;
			var lterm=data.lterm;
			var lname=data.lname;
			var lrcode=data.lrcode;
			hwInsertFrm.opennum.value=a;
			modal.style.display = "block";
				
			$("#hwInsertTb tbody").empty();
			$('<tr>')
				.append($('<td>">').html('과제제목'))
				.append($('<td>').html('<input type="text" id="area" name="area" class="form-control">'))
			.appendTo("#hwInsertTb tbody");
			$('<tr>')
				.append($('<td>').html('양식파일'))
				.append($('<td style="text-align: left;">').html('<input type="file" id="file" name="file">'))
			.appendTo("#hwInsertTb tbody");
			$('<tr>')
				.append($('<td>').html('과제 시작/마감일'))
				.append($('<td style="text-align: left;">').html('<input type="text" id="startDate" value="${today }" disabled class="dateform-control"> ~ <input type="text" id="endDate" class="dateform-control">'))
			.appendTo("#hwInsertTb tbody");
		}
	});
    span.onclick = function() {
    	modal.style.display = "none";
    }
 
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
	
	function hwInsertSubmit(){
		var a=$('#endDate').val();
		var year=a.substring(0,4);
		var month=a.substring(4,6);
		var day=a.substring(6,8);
		var resultDate=year+'-'+month+'-'+day;
		var bbb=$('#area').val();
		var date= new Date(resultDate);
		if(a =="" || bbb==""){
			alert("날짜 또는 제목을 입력해주세요");
		}else{
			hwInsertFrm.pperiod.value=date;
			hwInsertFrm.pcomment.value=bbb;
			if(confirm(' 등록하시겠습니까 ?')==true){
				alert("등록이 완료되었습니다.");
				hwInsertFrm.submit();
			}else{
				return false;
			}
		}
	}
	$(".card-body").on("click","#hwInsert",function(){
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#startDate" ).datepicker({
                // changeMonth: true, 
                 //changeYear: true,
                // nextText: '다음 달',
                 //prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yymmdd",
                 minDate:0,
                 maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                      //시작일(startDate) datepicker가 닫힐때
                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                     $("#endDate").datepicker( "option", "minDate", selectedDate);
                 }    
 
            });
            $( "#endDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yymmdd",
                 minDate:1,
                 maxDate: 100,                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                     // 종료일(endDate) datepicker가 닫힐때
                     // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                     $("#startDate").datepicker( "option", "maxDate", selectedDate );
                 }    
 
            });    
    });
</script>
</body>
</html>
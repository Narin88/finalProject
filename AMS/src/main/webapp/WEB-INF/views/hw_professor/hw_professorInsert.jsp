
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css"
    />
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

      .modal-body {
        font-size: 10pt;
      }
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
				<h2 align="center">과제 등록가능한 강의 목록</h2>
			</div>
		</div>	
		 <!-- model -->

        <div id="my_offer" align="center">
        

          <a class="modal_close_btn">닫기</a>
          <div class="modal-body">
            <h2>과제 등록</h2>
           			<form method="post" enctype="multipart/form-data" action="hwInsertForm" id="hwInsertFrm" name="hwInsertFrm" >
              <sec:csrfInput/>
						<input type="hidden" id="opennum" name="opennum">
						<input type="hidden" id="pperiod" name="pperiod">
						<input type="hidden" id="pcomment" name="pcomment">
							<table id="hwInsertTb" class="table table-bordered">
                <thead>
     
                </thead>

                <tbody></tbody>
              </table>
              <div align="center">
                <button type="button" onclick="hwInsertSubmit();" class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light">등록하기</button>
              </div>
            </form>
          </div>
        </div>
        <!-- model end -->
		
<!-- The Modal
		<div id="myModal" class="modalEE">
		<!-- Modal content
			 <div class="modal-content">                                                             
				<div class="hwContainer">
				<span class="close">&times;</span>  
						<!-- 조회눌렀을때  모달창안에 들어갈 내용들
					<div class="noSubmit">
					<!-- 과제등록 정보 폼 
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
			lyear: '${list.lyear}', lterm: '${list.term}', lname : '${list.lname}',lrname:'${list.lrname}',
			opennum:'${list.opennum}', lnum: '${list.lnum}', book:'${list.book}', dividenum:'${list.dividenum}',
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
		{header: '강의등록번호',name: 'opennum',width:100},
		{header: '강의번호',name: 'lnum',width:100},
		{header: '강의년도',name: 'lyear',width:120},
		{header: '학기',name: 'lterm',width:120}, //강의번호+분반
		{header: '강의명',name: 'lname'}, //년도+학기
		{header: '강의실 이름',name: 'lrname'},
		{header: '교재',name: 'book'},
		{header: '분반',name: 'dividenum'},
		{header: '등록하기',name: 'insertBtn'}
	], //컬럼갯수
		data: clsData
	});
	

	
	$(".gridC").on("click","#hwInsert",function(){
		var a= $(this).data('num'); //
		console.log(a);
        grid.on('click', ev => {
			var data = grid.getRow(ev.rowKey); //그리드 한 행의 전체값
			ClickData(data,a);
			modal('my_offer');
		});
		
		//클릭한 행의 값
		function ClickData(data,a){
			var lyear=data.lyear;
			var lterm=data.lterm;
			var lname=data.lname;
			var lrcode=data.lrcode;
			hwInsertFrm.opennum.value=a;

			//modal.style.display = "block";
			
			$("#hwInsertTb tbody").empty();
			$('<tr>')
				.append($('<td>">').html('과제제목'))
				.append($('<td>').html('<input type="text" id="area" name="area" class="form-control" maxlength="30" placeholder="최대 30자이하 입력이 가능합니다.">'))
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
		
		 $(document).ready(function(){
			 $('#area').keyup(function(){
				 if ($(this).val().length > $(this).attr('maxlength')) {
					 alert('제한길이 초과');
					$(this).val($(this).val().substr(0, $(this).attr('maxlength')));
					} 
				 });
			 }); 

	
		
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
 
	
	function hwInsertSubmit(){
		var a=$('#endDate').val();
		var year=a.substring(0,4);
		var month=a.substring(4,6);
		var day=a.substring(6,8);
		var resultDate=year+'-'+month+'-'+day;
		var bbb=$('#area').val();
		var date= new Date(resultDate);
		
		var c=$('#file').val();
		if(c ==""){
			alert("파일을 입력해주세요!");
		}else{
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교수 과제 등록 Page</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style>	
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
			.menu01 {
				height: 30px;
			    padding: 1em;
			    margin-left: -40px;
				}
					.HwSearch{
			margin-top:50px;
			padding: 1em;
		    border-radius: 3em;
		    width: 570px;
			border:1px solid gray;
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
		div #grid{
		margin-top: 40px;
		width: 1150px;
		}
		.leftContainer{
			width:700px;
			float:left;
			padding:
		}
		.rightContainer{
		    z-index: 1;
		    position: absolute;
		    margin-left: 750px;
		}
		.hwInsertFormC{
		    padding: 1em;
    margin-left: 380px;
		}
</style>
</head>
<body>

	<div class="leftContainer">
			<div class="menu01">		
				<ul>
					<li><a class="modalBtn" href="hwList">과제 페이지</a></li>
					<li><a class="modalBtn" href="hwPfInsert" >등록 페이지</a></li>
					
				</ul>	
				
			</div>
			<div id="grid" >
				<p style="float:left;"> #(' ')교수님 [과제]등록가능한 수강목록</p>
			</div>
	<script>
		
					  		//grid start
					  		
					  				var clsData = [
								<c:forEach items="${result }" var="list">
								{
									lyear: '${list.lyear}', lterm: '${list.term}', lname : '${list.lname}',
									lrcode: '${list.lrcode}', lnum: '${list.lnum}', pid: '${list.pid}',
									insertBtn:'<button type="button" id="hwInsert" data-id="${list.register_id}" data-num="${list.opennum }">등록</button> '
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
					  				{header: '등록하기',name: 'insertBtn',width:120}
					  			], //컬럼갯수
					  			data: clsData
					  		} );
						
								
							
								
					  			</script>
	</div>
	<div class="rightContainer" style="visibility:hidden;">
	<form action="hwInsertForm" id="hwInsertFrm" name="hwInsertFrm">
	<sec:csrfInput/>
			<input type="hidden" id="opennum" name="opennum">
			<input type="hidden" id="pperiod" name="pperiod">
		 	<input type="hidden" id="registerFile" name="registerFile"> 
			<input type="hidden" id="pcomment" name="pcomment">
		<table id="hwInsertTb" border="1">
			<tbody>
				</tbody>	
		</table>
				<div class="hwInsertFormC">
				</div>
				
				
	</form>
		<script>
			function  checkDate(){
				
			}
		</script>
		<script>
		$(".leftContainer").on("click","#hwInsert",function(){
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
				
				$("#hwInsertTb tbody").empty();
				$(".hwInsertFormC").empty();
				$('<tr>')
				.append($('<td colspan="2" align="center" width="600px" height="80px" >').html(' * 과제등록 *<br>'+lyear+' 년 '+lterm+' 학기 '+lname+',  '+lrcode+' 강의실 '))
				.append($('</td>'))
				.append($('</tr>'))
				.appendTo("#hwInsertTb tbody");			
				$('<tr>')
				.append($('<th width="120px;">').html('과제제목'))
				.append($('<td  width="500px" height="140px" style="padding:0;" >').html('<textarea cols="100" rows="10"></textarea>'))
						.appendTo("#hwInsertTb tbody");
				$('<tr>')
				.append($('<th width="120px;">').html('과제파일 :'))
				.append($('<td  width="500px" height="80px" >').html('<input type="file">'))
						.appendTo("#hwInsertTb tbody");
				$('<tr>')
				.append($('<th width="120px;">').html('날짜설정'))
				.append($('<td  width="500px" height="80px" >').html('<input type="text" id="startDate" value="${today }" disabled><input type="text" id="endDate">'))
						.appendTo("#hwInsertTb tbody");
				$('<button type="button" onclick="hwInsertSubmit();" >등록하기</button><button type="reset">취소</button>')
				.appendTo(".hwInsertFormC");
			}
        });
		</script>
		<!-- 날짜 형식변환 -->
				<script>
				function hwInsertSubmit(){
					var a=$('#endDate').val();
					var year=a.substring(0,4);
					var month=a.substring(4,6);
					var day=a.substring(6,8);
					var resultDate=year+'-'+month+'-'+day;
					
					var date= new Date(resultDate);
					console.log(date);
					
					hwInsertFrm.pperiod.value=date;
					hwInsertFrm.registerFile.value=null;
					hwInsertFrm.pcomment.value=null;
					hwInsertFrm.submit();
					
				}
				</script>
	</div>
	<div>
	
	</div>
	<script type="text/javascript">
	$(".leftContainer").on("click","#hwInsert",function(){
		$('.rightContainer').css("visibility","visible");
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
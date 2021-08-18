<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE HTML>
<html>
<head>
<META charset="UTF-8">
<head> 
	<title>과제 리스트 :: No.M University</title>
<style>
.form-control{
	display: inline;
	width: 150px;
}
.mbox{
	margin-top: 20px; 
}
.form-control:disabled, .form-control[readonly]{
	background-color: white;
}
.btn15 {
  height: 15px;
}
.movbox{
	display: inline;
	float: right;
}
</style>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hwList.css"/>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<body>
<div class="content-page">
	<div class="card-body">
		<!-- 강의년도 / 강의학기  설정하면 해당하는 강의명만 나오도록 -->
		<!-- 년도,학기,강의명 별,진행중,마감 select 설정 -->
		<h4 align="center">과제 목록</h4>
		<div class="mbox">
		<form id="frmHw" name="frmHw"  method="post">
		<sec:csrfInput/>
			<input type="hidden" id="ye" name="ye">
			<input type="hidden" id="te" name="te">
			<input type="hidden" id="ln" name="ln">  
				<label for="lyear">강의년도:</label>						
				<select name="lyear" id="lyear" class="form-control">			
						<option value="2021" selected="selected">2021</option>  
						<c:forEach items="${ySelect}" var="ySelect">
							<option value="${ySelect.lyear }" <c:if test="${ySelect.lyear==param.lyear }"> selected="selected"</c:if>>${ySelect.lyear }</option>
					 </c:forEach>	 
				</select>
							
				<label for="term">강의학기:</label>
				<select name="term" id="term" class="form-control">
				  <option value="">선택</option>	
				  <option value="1" <c:if test="${param.term==1 }"> selected="selected"</c:if>>1학기</option>
				  <option value="2" <c:if test="${param.term==2 }"> selected="selected"</c:if>>2학기</option>
				</select>
						
				<label for="lnum">강의명:</label>
					<select name="lnum" id="lnum" class="form-control">
					<option value="">선택</option>	
					  <c:forEach items="${lName}" var="lName">
						  <option value="${lName.lnum }" <c:if test="${lName.lnum==param.lnum }"> selected="selected"</c:if>> ${lName.lname } </option>	
							 </c:forEach>	 
						</select>
						<button type="button" onclick="selectSubmit();" class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light">검색</button>
						<button type="button" onclick="resetFunction();" class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light">초기화</button>
						<div class="movbox">
							<button type="button" class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light" onclick="location.href='hwPfInsert'">과제 등록</button>
						</div>
			 </form>
			</div>
			<!-- 과제 조회 END -->
			
			<div class="hwTable1">
				<!-- gird 첫번째 -->
				<div id="grid" ></div>
					<!-- The Modal -->
					<div id="myModal" class="modalEE">
						<!-- Modal content -->
						<div class="modal-content">                                                             
							<div class="hwContainer">
								<span class="close">&times;</span>  
								<!-- 조회눌렀을때  모달창안에 들어갈 내용들 -->
									<div class="noSubmit"></div>
										<button style="float:right; margin-right: 10px" type="button" id="selectDelBtn" class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light">삭제</button>
										<button style="float:right;" id="selectScoreBtn" class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light">점수정정</button>
								<!-- gird 두번째 -->
									<div id="grid2"></div>
							</div>
						</div>
					</div>
					<!-- MODAL HTML END-->
					    

					<!-- The Modal -->
					<div id="myModal2" class="modal2">
							 
						<!-- Modal content -->
						 <div class="modal-content2">      
							<span class="close2">&times;</span>                                                         
							<div class="hwContainer">
								<div class="" style="border-radius:10px;">
									<h4 align="center">과제변경전</h4>
									<table border="1" id="noSubmit2" class="table table-bordered">
										<thead>
											<tr>
												<th>강의년도</th>
												<th>학기</th>
												<th>강의명</th>
												<th>제출기간</th>
												<th>과제제목</th>
												<th>양식파일</th>
											</tr>
										</thead>
										<tbody></tbody>
									</table>
								</div>
				<!-- 변경 눌렀을때 실행되는 form -->		
								<form action="hwUpdate" id="udFrm" name="udFrm" method="post" enctype="multipart/form-data" >
								<sec:csrfInput/>
									<input type="hidden" id="pperiod" name="pperiod">
									<input type="hidden" id="pcomment" name="pcomment">
									<input type="hidden" id="registerId" name="registerId">
										<br><br>
										<table border="1" id="noSubmit3" class="table table-bordered">
											<thead>
												<tr>
													<th>제출기간</th>
													<th>과제제목</th>
													<th>양식파일</th>
													<th>비고</th>
												</tr>
											</thead>
											<tbody></tbody>
										</table>
								</form>
							</div>
						</div>
					</div>
<!-- MODAL HTML END-->
				</div>
			</div>
		</div>
		<form id="hwPfDeleteFrm" name="hwPfDeleteFrm"  method="post" action="hwPfDelete">
			<input type="hidden" id="registerId" name="registerId">
		</form>
<script>
	function selectSubmit(){
		var a=$("#lnum option:checked").text();	
		frmHw.ln.value=a;
		frmHw.submit();
	}
	<!-- 삭제버튼을 클릭했을때  -->
	$(".hwTable1").on("click","#hwDelete",function(){
		var a=	$(this).data('id');
		var b= $(this).data('num');
		hwPfDeleteFrm.registerId.value=a;
		if(confirm(' * '+b+' '+' * ' + '삭제 하시겠습니까 ?')==true){
			alert("삭제가 완료되었습니다.");
			hwPfDeleteFrm.submit();
		}else{
			return false;
		}
	});
				

// Get the modal
	var modal = document.getElementById('myModal');

// Get the button that opens the modal
	var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];                                          

// When the user clicks on the button, open the modal 
	       
	        	// 조회 버튼을 클릭했을때 
$(".hwTable1").on("click","#inquiry",function(){
	modal.style.display = "block";
	$(this).data('id'); //
	var a= $(this).data('id');
	var b= $(this).data('num');
	var count=$(this).data('count');
	var checkVal=0;
	$.ajax({
		type:"post",
		url:"inquiry",
		data:{ registerId :a, opennum :b},
		dataType:"json",
		success: function(data){	
			$("#grid2").empty();
			$("tfoot").empty();		
			$(".noSubmit").empty();
			$('<h4 style="color:brown; float:left;"> 제출학생 리스트 </h4>').appendTo('.noSubmit');
			$('<h6 style="color:gray; float:left;margin-left:30px;"> 점수를 정정하면 성적에 자동 반영됩니다. </h6>').appendTo('.noSubmit');
					
/* grid start 조회했을때 모달창에서 뜨는 그리드
** 제출한 학생과제 삭제 delete & 점수 수정 update
** grid api-source 
*/
		const dataSource = {
		  withCredentials: false,  
		  initialRequest: false,
		  contentType: 'application/json',
		  api: {
			readData: {},
			deleteData: {
				url: 'hwSubmitDel',
				method: 'PUT'
				},
		    updateData: {
		      url: 'scoreIn', //점수 기능
		      method: 'PUT' //funtion 메서드
		    }
		  }
		};
		 // GRID 를 보여준다.
		var grid = new tui.Grid( {
			data:dataSource,
			rowHeaders: ['checkbox'],	
			bodyHeight:430,
			el: document.getElementById('grid2'),
			pagination: true,   //페이징 처리
			pageOptions: {
				useClient: true,   //페이징 처리
				perPage: 10   //페이징 갯수
			},
			columns: [
				{header: '학생학번',name: 'submitSid',width:100},
				{header: '학생이름',name: 'name',width:100},
				{header: '제출파일',name: 'submit_file',width:280},
				{header: '제출날짜',name: 'submit_date',width:140},
				{header: '학생코멘트',name: 's_comment'},
				//	{header: '강의번호',name: 'opennum'},
				{header: '점수',name: 'score',width:70,editor:'text'},
			], //컬럼갯수
		});
		//grid end

		grid.resetData(data)
		//그리드가 실행된후 eachTest 0.5초후 함수 실행 " 과제 미제출자 구분 "
		setInterval(eachTest , 500);
		function eachTest(){	
			$('[data-column-name="submit_file"]').each(function(i, item){	
				if($(this).text()==""){
					$(this).html("<p align='center' style='color:red;'>과제 미제출자</p>");
				  	}
		  		});			  			
			}	
		//삭제 버튼 누를때  함수 실행
		document.getElementById('selectDelBtn').addEventListener('click', hwSubmitDel);
		//점수정정 버튼 누를때 함수 실행
		document.getElementById('selectScoreBtn').addEventListener('click', scoreIn);
						
		//과제제출한 학생 선택한 목록 처리
		function hwSubmitDel(){
			grid.removeCheckedRows(false);
		  	grid.request('deleteData', { checkedOnly: true  });
		}

		//작업중인 행들을 저장해줌
		function scoreIn(){
			const { rowKey, columnName } = grid.getFocusedCell();
				if (rowKey && columnName) {
			  		grid.finishEditing(rowKey, columnName);
			  	}
			grid.request('updateData', {
				checkedOnly: false
			});		  	  
		}
			  		    
	
						
		//파일명이 저장된 값이 있는 것은 다운되고 없는것은 파일없다는 alert경고창
	  	grid.on('dblclick', ev => {
			var data = grid.getRow(ev.rowKey); //그리드 한 행의 전체값
			const isHeader= ev.targetType==="columnHeader";
	  		var a=data.submit_file;
		    var b=data.name;
			if(ev.columnName =="submit_file" && !isHeader && a != null){
				if(confirm(b+ '학생 과제파일')==true){
					var filePath = "C:/Users/User/git/finalProject/AMS/src/main/webapp/resources/upload/hw_student/"+a
					var fileName = a;
					location.href = "fileDownload?filePath="+filePath+"&fileName="+fileName;
				}else{
					return false;
				}	
			}
			if(a==null){
				alert("제출한 파일이 없습니다");
	  		}
	  	})
		},
		error: function(error){
			alert("error");
		}
	});
});	
	        	
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	    modal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
	        
	//제출한 학생의 과제삭제 FUNCTION
	function hwDeleteFunc(a){
		$.ajax({
			type:"post",
			url:"hwSubmitDel",
			data:{submitId: a},
		dataType:"JSON",
		success:function(){
			if(confirm(' 삭제하시겠습니까 ? ')==true){
				alert("삭제가 완료되었습니다");
				alert("삭제 되었습니다");
				location.reload();
			}else{
				return false;
			}	
		}
		});
	}
	//과제페이지 grid
	//grid start
	var clsData = [
		<c:forEach items="${result }" var="list">
		{
			lyear: '${list.lyear}', lterm: '${list.term}', lname : '${list.lname}',
			lrcode: '${list.lrcode}', pcomment: '${list.pcomment}', register_date: '<fmt:formatDate value="${list.register_date }" pattern="yy.MM.dd HH:mm" /> ',
			pperiod: '<fmt:formatDate value="${list.pperiod }" pattern="yy년MM월dd일"/>까지',status:'<c:if test="${list.hwstatus > 0 }"><span style="color:red;">진행중</span></c:if><c:if test="${list.hwstatus <= 0}"><span style="color:blue;">마감</span></c:if>',
			register_file: '${list.register_file}' ,submitCount:'<span style="color:red;">${list.submitCount }</span>&nbsp;/&nbsp;<span style="font-weight:bold;">${list.newlimitcount }</span>',
			inquiryBtn:'<button type="button" id="inquiry" data-id="${list.register_id}" data-num="${list.opennum }" data-count="${list.submitCount}" class ="btn btn-facebook m-l-10 waves-effect waves-light btn15"">조회</button> ',
			deleteBtn:'<c:if test="${list.submitCount == 0}"><button type="button" id="hwDelete" data-id="${list.register_id}" data-num="${list.pcomment}" class ="btn btn-facebook m-l-10 waves-effect waves-light btn15">삭제</button></c:if> <c:if test="${list.submitCount > 0}"><span style="color: crimson;">삭제불가</span></c:if>',
			updateBtn:'<button type="button" id="updateBtn" data-id="${list.register_id}" data-id2="${list.pperiod}" data-id3="${list.pcomment}" data-id4="${list.register_file}" data-id5="${list.lyear}" data-id6="${list.term}" data-id7="${list.lname}" class ="btn btn-facebook m-l-10 waves-effect waves-light btn15">변경</button>',
			opennum:'${list.opennum}'
		},
		</c:forEach>
	]; //컬럼DATA	
					  		
	// GRID 를 보여준다.
	var grid = new tui.Grid( {
		bodyHeight:250,
		el: document.getElementById('grid'),
		pagination: true,   //페이징 처리
		pageOptions: {
			useClient: true,   //페이징 처리
			perPage: 5   //페이징 갯수
		},
		columns: [
			//{header: '강의번호',name: 'opennum',width:70},
			{header: '강의년도',name: 'lyear',width:70},
			{header: '학기',name: 'lterm',width:60}, //강의번호+분반
			{header: '강의명',name: 'lname',width:90}, //년도+학기
			{header: '강의실',name: 'lrcode',width:80},
			{header: '과제제목',name: 'pcomment'},
			{header: '등록날짜',name: 'register_date',width:140},
			{header: '과제기간',name: 'pperiod',width:180},
			{header: '진행상태',name: 'status',width:100},
			{header: '양식파일',name: 'register_file'},
			{header: '제출현황',name: 'submitCount',width:100},
			{header: '조회',name: 'inquiryBtn',width:100},
			{header: '삭제',name: 'deleteBtn',width:100},
			{header: '변경',name: 'updateBtn',width:100}
		], //컬럼갯수
		data: clsData
	});
	
	grid.on('dblclick', ev => {
		var data = grid.getRow(ev.rowKey); //그리드 한 행의 전체값
	});
			
	//과제페이지 변경버튼눌렀을때 모달창 
	$(".hwTable1").on("click","#updateBtn",function(){
		// Get the modal
		var a=$(this).data('id');
		var b=$(this).data('id2');
		var c=$(this).data('id3');
		var d=$(this).data('id4');
		var e=$(this).data('id5');
		var f=$(this).data('id6');
		var g=$(this).data('id7');
		udFrm.registerId.value=a;
		var dateStr=String(b);
		var year=dateStr.substring(0,4);
		var month=dateStr.substring(5,7);
		var day=dateStr.substring(8,10);
		var resultDate=year+month+day;	
		var modal = document.getElementById('myModal2');
		
		// Get the button that opens the modal
		var btn = document.getElementById("myBtn2");
		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close2")[0];  
		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
		modal.style.display = "block";
		$('#noSubmit2 tbody').empty();
		$('<tr>')
			.append($('<td>'+e+'</td>'))
			.append($('<td>'+f+'</td>'))
			.append($('<td>'+g+'</td>'))
			.append($('<td>'+b+'</td>'))	
			.append($('<td>'+c+'</td>'))
			.append($('<td>'+d+'</td>'))
			.appendTo('#noSubmit2 tbody');		
						
		$('#noSubmit3 tbody').empty();
		$('<tr>')	
			.append($('<td><input class="form-control" type="text" id="startDate"  value="'+resultDate+'" disabled></td>'))	
			.append($('<td><input class="form-control" tpye="text" id="pcoId" value="'+c+'" disabled></td>'))
			.append($('<td><input type="file" id="file" name="file"></td>'))
			.append($('<td><button type="button" class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light" onclick="updateSubmit();">변경</button></td>'))
			.appendTo('#noSubmit3 tbody');		
		            
		$('.dateTd').on("click", function(){
			$('#startDate').attr("disabled",false);
			$('#startDate').attr("value",null);
		});
		
		$('.pcommentTd').on("dblclick", function(){
			$('#pcoId').attr("disabled",false);
			$('#pcoId').attr("value",null);
		});
						
		$('.updateReset').on("click", function(){
			$('#startDate').attr("disabled",true);
			$('#startDate').attr("value",resultDate);
			$('#pcoId').attr("disabled",true);
			$('#pcoId').attr("value",c);
		});
						
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
			maxDate: 30,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
			onClose: function( selectedDate ) {    
			//시작일(startDate) datepicker가 닫힐때
			//종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
				$("#endDate").datepicker( "option", "minDate", selectedDate);
			}    
		});
	});
	
	function updateSubmit(){
		var a=$('#startDate').val();	
		var year=a.substring(0,4);
		var month=a.substring(4,6);
		var day=a.substring(6,8);
		var resultDate=year+'-'+month+'-'+day;
		var date= new Date(resultDate);
		var date= new Date(resultDate);
		udFrm.pperiod.value=date;
						
		var b=$("#pcoId").val();
		udFrm.pcomment.value=b;
		var filen=$('#file').val();
		if(filen == ""){
			alert("파일을 입력해주세요");
		}else{
			if(confirm(' 입력값으로 변경하시겠습니까 ? ')==true){
				alert("변경이 완료되었습니다");
				udFrm.submit();
			}else{
				return false;
			}
		}
	}
	<!-- 점수 IN MEXLENGTH -->
	function maxLengthCheck(object){
		if (object.value.length > object.maxLength){
			object.value = object.value.slice(0, object.maxLength);
		}    
	}
	
	<!-- 검색조건 초기화 function -->
	function resetFunction(){
		$("#lyear option:eq(0)").prop("selected",true);
		$("#term option:eq(0)").prop("selected",true);
		$("#lnum option:eq(0)").prop("selected",true);
		frmHw.submit();
	}
</script>
</body>
</html>
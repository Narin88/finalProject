<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE HTML>
<html>
<head>
<META charset="UTF-8">
<head>
<title>과제 리스트 :: No.M University</title>
<style>
.form-control {
	display: inline;
	width: 150px;
}

.mbox {
	margin-top: 20px;
}

.form-control:disabled, .form-control[readonly] {
	background-color: white;
}

.btn15 {
	height: 15px;
}

.movbox {
	display: inline;
	float: right;
}
</style>
</head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/hwList.css" />
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<body>
	<div class="content-page">
		<div class="card-body">
			<!-- 강의년도 / 강의학기  설정하면 해당하는 강의명만 나오도록 -->
			<!-- 년도,학기,강의명 별,진행중,마감 select 설정 -->
			<h4 align="center">등록한 과제 목록</h4>
			<div class="mbox">
				<form id="frmHw" name="frmHw" method="post">
					<sec:csrfInput />
					<input type="hidden" id="ye" name="ye"> <input
						type="hidden" id="te" name="te"> <input type="hidden"
						id="ln" name="ln"> <label for="lyear">강의년도:</label> <select
						name="lyear" id="lyear" class="form-control">
						<option value="2021" selected="selected">2021</option>
						<c:forEach items="${ySelect}" var="ySelect">
							<option value="${ySelect.lyear }"
								<c:if test="${ySelect.lyear==param.lyear }"> selected="selected"</c:if>>${ySelect.lyear }</option>
						</c:forEach>
					</select> <label for="term">강의학기:</label> <select name="term" id="term"
						class="form-control">
						<option value="">선택</option>
						<option value="1"
							<c:if test="${param.term==1 }"> selected="selected"</c:if>>1학기</option>
						<option value="2"
							<c:if test="${param.term==2 }"> selected="selected"</c:if>>2학기</option>
					</select> <label for="lnum">강의명:</label> <select name="lnum" id="lnum"
						class="form-control">
						<option value="">선택</option>
						<c:forEach items="${lName}" var="lName">
							<option value="${lName.lnum }"
								<c:if test="${lName.lnum==param.lnum }"> selected="selected"</c:if>>
								${lName.lname }</option>
						</c:forEach>
					</select>
					<button style="margin-top: 5px;" type="button"
						onclick="selectSubmit();"
						class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light">검색</button>
					<button style="margin-top: 5px;" type="button"
						onclick="resetFunction();"
						class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light">초기화</button>
					<div class="movbox">

						<button type="button"
							class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light"
							onclick="location.href='hwPfInsert'">과제 등록</button>
					</div>
					<div>
						<b style="font-weight: bold; float: right;"># 제출학생이 한명이라도 있으면
							삭제가 <font color="red">불가능</font>합니다. <br># 양식파일을 클릭하면 다운로드가
							<font color="red">가능 </font>합니다. <br># 검색의 기본값은 <font
							color="red">2021년 </font>입니다. <br>
						</b>
					</div>
				</form>
			</div>
			<!-- 과제 조회 END -->

			<div class="hwTable1">
				<!-- gird 첫번째 -->
				<div id="grid"></div>
				<!-- model -->

				<div id="my_offer" align="center">

					<a class="modal_close_btn">닫기</a>
					<div class="modal-body">
						<div class="noSubmit"></div>
							<div style="width: 100%;height:100px; float: right;">							
								<b
									style="width: 100%; font-weight: bold; float: right; text-align: right; margin-bottom: 5px;">
									 <font color="gray"> 점수를 정정하면 성적에 자동 반영됩니다. </font><br>
									# 점수는 <u>최대 20점</u> <font color="red"> 입력 </font> 가능 합니다.<br>#
									제출파일은 클릭시 다운로드가 <font color="red"> 가능 </font>합니다.
									 <br>
								</b>
								<span style="font-size:18px;color:brown;margin-top: 15px;float: left;margin-left:50px;">과제 미제출자</span><span style="font-size:18px;color:brown;float: left;margin-top: 15px; margin-left: 330px;">과제 제출자</span>
								
								<button
									style="float: right;  "
									type="button" id="selectDelBtn"
									class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light">삭제</button>
								<button style="float: right;"
									id="selectScoreBtn"
									class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light">점수정정</button>
							</div>
							<!-- gird 두번째 -->
							<div style="margin-top:15px;float:left;margin-left:50px;width:400px;">
								<div id="grid3">
								</div>
							</div> 
							<!-- gird 두번째 -->
							<div style="margin-top:15px;float:right; width:720px;">
								<div id="grid2"></div>
							</div>
					</div>
				</div>
				<!-- model end -->

				<!-- model2 -->

				<div id="my_offer2" align="center">


					<a class="modal_close_btn" style="float: right;">닫기</a>
					<div class="modal-body">
						<div class="" style="border-radius: 10px;">
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
						<form action="hwUpdate" id="udFrm" name="udFrm" method="post"
							enctype="multipart/form-data">
							<sec:csrfInput />
							<input type="hidden" id="pperiod" name="pperiod"> <input
								type="hidden" id="pcomment" name="pcomment"> <input
								type="hidden" id="registerId" name="registerId"> <br>
							<br>
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
			<!-- model end -->


			<%-- 	<!-- The Modal -->
					<div id="myModal2" class="modal2">
							 
						<!-- Modal content -->
						 <div class="modal-content2">      
							<span class="close2">&times;</span>                                                         
							<div class="hwContainer">
								
									
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
<!-- MODAL HTML END--> --%>
		</div>
	</div>
	<form id="hwPfDeleteFrm" name="hwPfDeleteFrm" method="post"
		action="hwPfDelete">
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
		if(confirm('제목 :  "'  + b + '"  을 삭제 하시겠습니까 ?')==true){
			alert("삭제가 완료되었습니다.");
			hwPfDeleteFrm.submit();
		}else{
			return false;
		}
	});
	$(".hwTable1").on("click","#hwNDelete",function(){
		alert("제출학생이 있어 삭제가 불가능합니다.");
	});			

		
	       
	        	// 조회 버튼을 클릭했을때 
$(".hwTable1").on("click","#inquiry",function(){
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
			modal('my_offer');
			$("#grid2").empty();
			$("tfoot").empty();		
			$(".noSubmit").empty();
			$(".noSubmitSub").empty();
			//$('<h4 style="margin-left:80px;color:brown; text-align:center;"> 제출학생 리스트</h4>').appendTo('.noSubmit');
			
			
	
					
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
			bodyHeight:400,
			el: document.getElementById('grid2'),
			pagination: true,   //페이징 처리
			pageOptions: {
				useClient: true,   //페이징 처리
				perPage: 10   //페이징 갯수
			},
			columns: [
				{header: '학생학번',name: 'submitSid',width:90},
				{header: '학생이름',name: 'name',width:90},
				{header: '제출파일',name: 'submit_file',width:150},
				{header: '제출날짜',name: 'submit_date',width:140},
				{header: '학생코멘트',name: 's_comment'},
				//	{header: '강의번호',name: 'opennum'},
				{header: '점수',name: 'score',width:70,editor: {
												            type: 'select',
												            options: {
												              listItems: [
												            	{ text: '0점', value: '0' },
												                { text: '1점', value: '1' },
												                { text: '2점', value: '2' },
												                { text: '3점', value: '3' },
												                { text: '4점', value: '4' },
												                { text: '5점', value: '5' },
												                { text: '6점', value: '6' },
												                { text: '7점', value: '7' },
												                { text: '8점', value: '8' },
												                { text: '9점', value: '9' },
												                { text: '10점', value: '10' },
												                { text: '11점', value: '11' },
												                { text: '12점', value: '12' },
												                { text: '13점', value: '13' },
												                { text: '14점', value: '14' },
												                { text: '15점', value: '15' },
												                { text: '16점', value: '16' },
												                { text: '17점', value: '17' },
												                { text: '18점', value: '18' },
												                { text: '19점', value: '19' },
												                { text: '20점', value: '20' }
												              ]
												            }
												          }
				},
			], //컬럼갯수
		});
		//grid end

		grid.resetData(data)
		//그리드가 실행된후 eachTest 0.5초후 함수 실행 " 과제 미제출자 구분 "
		
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
		 // 업데이트 실행 이벤트
      	grid.on('response', ev => {
      		  var {response} = ev.xhr;
      		  var responseObj = JSON.parse(response);

      		  console.log('result : ', responseObj.result);
      		  console.log('data : ', responseObj.data);
      		});
		
		
		
	
		
						
		//파일명이 저장된 값이 있는 것은 다운되고 없는것은 파일없다는 alert경고창
	  	grid.on('dblclick', ev => {
			var data = grid.getRow(ev.rowKey); //그리드 한 행의 전체값
			const isHeader= ev.targetType==="columnHeader";
	  		var a=data.submit_file;
		    var b=data.name;
		    console.log(a);
		    console.log(b);
			if(ev.columnName =="submit_file" && !isHeader && a != null){
				if(confirm(b+ '학생 과제파일')==true){
					var filePath ="/usr/local/apache-tomcat-9.0.52/webapps/AMS/resources/upload/hw_student/"+a;
						//"C:/Users/User/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/finalProject/resources/upload/hw_student/"+a;
							//"C:/Users/User/git/finalProject/AMS/src/main/webapp/resources/upload/hw_student/"+a
					var fileName = a;
					location.href = "fileDownload?filePath="+filePath+"&fileName="+fileName;
				}else{
					return false;
				}	
			}
			if(ev.columnName =="submit_file" && a==null){
				alert("제출파일이 없습니다");
	  		}
	  	})
	  	
	  	
	 
	  	
	  	
	  	
	  	
	  	
	  	
	  	
	  	
	  
	  	
		},
		error: function(error){
			alert("error");
		}
	});
	
	$.ajax({
		type:"post",
		url:"inquiry2",
		data:{ registerId :a, opennum :b},
		dataType:"json",
		success: function(data){	
			$("#grid3").empty();
/* 			 //과제페이지 grid3
			//grid3 start
			var clsData3 = [
				<c:forEach items="${nSubmit}" var="nSubmit">
				{
					id: '${nSubmit.submitSid}', name: '${nSubmit.name}'
				},
				</c:forEach> 
			]; //컬럼DATA	
				console.log(clsData3);	*/
			// GRID 를 보여준다.
			var grid3 = new tui.Grid( {
				bodyHeight:400,
				el: document.getElementById('grid3'),
				pagination: true,   //페이징 처리
				pageOptions: {
					useClient: true,   //페이징 처리
					perPage: 10   //페이징 갯수
				},
				columns: [
					{header: '학생번호',name: 'submitSid',width:130},
					{header: '이름',name: 'name',width:70}, //강의번호+분반
					{header: '제출상태', name:'nSubmit',width:200}
				], //컬럼갯수
				data:data
			});
				
			setInterval(eachTest , 500);
			function eachTest(){	
				$('[data-column-name="nSubmit"]').each(function(i, item){	
					if($(this).text()==""){
						$(this).html("<p align='center' style='color:red;'>과제 미제출자</p>");
					  	}
			  		});			  			
				}	
				
				
				
			
		}
		})
	
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
			lyear: '${list.lyear}', lterm: '${list.term}', lname : '${list.lname}',lnum:'${list.lnum}',register_id:'${list.register_id}',
			lrcode: '${list.lrcode}', pcomment: '${list.pcomment}', register_date: '<fmt:formatDate value="${list.register_date }" pattern="yy.MM.dd HH:mm" /> ',
			pperiod: '<fmt:formatDate value="${list.pperiod }" pattern="yy년MM월dd일"/>까지',status:'<c:if test="${list.hwstatus >= 0 }"><span style="color:red;">진행중</span></c:if><c:if test="${list.hwstatus < 0}"><span style="color:blue;">마감</span></c:if>',
			register_file: '<i id="download2" data-id="${list.register_file }" class="mdi mdi-file-import" style="cursor:pointer;">${list.register_file }</i>' ,
			submitCount:'<span style="color:red;">${list.submitCount }</span>&nbsp;/&nbsp;<span style="font-weight:bold;">${list.newlimitcount }</span>',
			inquiryBtn:'<button type="button" id="inquiry" data-id="${list.register_id}" data-num="${list.opennum }" data-count="${list.submitCount}" class ="btn btn-facebook m-l-10 waves-effect waves-light btn15"">조회</button> ',
			deleteBtn:'<c:if test="${list.submitCount == 0}"><button type="button" id="hwDelete" data-id="${list.register_id}" data-num="${list.pcomment}" class ="btn btn-facebook m-l-10 waves-effect waves-light btn15">삭제</button></c:if> <c:if test="${list.submitCount > 0}"><button type="button" id="hwNDelete" class ="btn btn-facebook m-l-10 waves-effect waves-light btn15">삭제</button></c:if>',
			updateBtn:'<button type="button" id="updateBtn" data-id="${list.register_id}" data-id2="<fmt:formatDate value="${list.pperiod }" pattern="yyyy-MM-dd"/>" data-id3="${list.pcomment}" data-id4="${list.register_file}" data-id5="${list.lyear}" data-id6="${list.term}" data-id7="${list.lname}" class ="btn btn-facebook m-l-10 waves-effect waves-light btn15">변경</button>',
			opennum:'${list.opennum}',dividenum:'${list.dividenum}',datastatus:'${list.datastatus}'
		},
		</c:forEach>
	]; //컬럼DATA	
					  		
	// GRID 를 보여준다.
	var grid = new tui.Grid( {
		bodyHeight:330,
		el: document.getElementById('grid'),
		pagination: true,   //페이징 처리
		pageOptions: {
			useClient: true,   //페이징 처리
			perPage: 8   //페이징 갯수
		},
		columns: [
			{header: '강의등록번호',name: 'opennum',width:100},
			{header: '과제등록번호',name: 'register_id',width:100},
			{header: '강의번호',name: 'lnum',width:80},
			{header: '강의년도',name: 'lyear',width:70},
			{header: '학기',name: 'lterm',width:40}, //강의번호+분반
			{header: '분반',name: 'dividenum',width:40}, //강의번호+분반
			{header: '강의명',name: 'lname',width:90}, //년도+학기
			{header: '수강상태',name: 'datastatus',width:60}, //강의번호+분반
			{header: '과제제목',name: 'pcomment'},
			{header: '등록날짜',name: 'register_date',width:140},
			{header: '과제기간',name: 'pperiod',width:180},
			{header: '진행상태',name: 'status',width:100},
			{header: '양식파일',name: 'register_file',width:100},
			{header: '제출현황',name: 'submitCount',width:70},
			{header: '조회',name: 'inquiryBtn',width:75},
			{header: '삭제',name: 'deleteBtn',width:75},
			{header: '변경',name: 'updateBtn',width:75}
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
		
		modal('my_offer2');
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
			.append($('<td class="dateTd"><input class="form-control" type="text" id="startDate"  value="'+resultDate+'" disabled></td>'))	
			.append($('<td class="pcommentTd"><input class="form-control" tpye="text" id="pcoId" value="'+c+'" disabled></td>'))
			.append($('<td><input type="file" id="file" name="file"></td>'))
			.append($('<td><button type="button" class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light" onclick="updateSubmit();">변경</button><button type="button" class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light" id="updateReset">취소</button></td></td>'))
			.append($('<td>'))
			.appendTo('#noSubmit3 tbody');		
		            
		$('.dateTd').on("click", function(){
			$('#startDate').attr("disabled",false);
			$('#startDate').attr("value",null);
		});
		
		$('.pcommentTd').on("dblclick", function(){
			$('#pcoId').attr("disabled",false);
			$('#pcoId').attr("value",null);
		});
						
		$('#updateReset').on("click", function(){
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
	
	$("#download2").click(function(){
		var a=$(this).data('id');
		console.log(a);
		var filePath ="/usr/local/apache-tomcat-9.0.52/webapps/AMS/resources/upload/hw_professor/"+a;
			//"C:/Users/User/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/finalProject/resources/upload/hw_professor/"+a;
			//"C:/Users/User/git/finalProject/AMS/src/main/webapp/resources/upload/hw_student/"+a;
		console.log(filePath);
		var fileName = a;
		location.href = "fileDownload?filePath="+filePath+"&fileName="+fileName;
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
		if(a=="" || b==""){
			alert("제출기간 및 과제제목 확인");
		}else{
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
	        transform: 'translate(-50%, -10%)',
	        msTransform: 'translate(-50%, -50%)',
	        webkitTransform: 'translate(-50%, -50%)'
	    });
	}

	// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
	Element.prototype.setStyle = function(styles) {
	    for (var k in styles) this.style[k] = styles[k];
	    return this;
	};
</script>
</body>
</html>
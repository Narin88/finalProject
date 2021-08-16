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

<button id="createpdf">
  pdf 생성
</button>
<div id="pdfwrap">
<div class="content-page">
	<div align="center">
		<h2>수강생 리스트</h2>
	</div>

	<div align="right">
		
	</div>

	<div id="grid"></div>

</div>
<table align="center" border="1">
	<thead>
			<tr>
					<th style="width:130px" >강의등록번호</th>
					<th style="width:150px">학번</th>
					<th style="width:150px">학생이름</th>
					<th style="width:150px">강의번호</th>
					<th style="width:200px">강의이름</th>
					<th style="width:130px">중간고사</th>
					<th style="width:130px">기말고사</th>
					<th style="width:130px">출석점수</th>
					<th style="width:130px">과제</th>
					<th style="width:130px">총점</th>
					<th style="width:130px">등급</th>
					<th></th>
			</tr>
	</thead>
	<tbody>
	
		<c:forEach items="${lectures }" var="lec">
			<input type="hidden" id="hiddenOpenNum" value="${lec.opennum }">
			<tr>
					<th>${lec.opennum}</th>
					<th>${lec.sid}</th>
					<th>${lec.sname}</th>
					<th>${lec.lnum}</th>
					<th>${lec.lname}</th>
					<th><input type="text" id="middlescore${lec.sid }" name="middle" value="${lec.middlescore}"> </th>
					<th><input type="text" id="finalscore${lec.sid }" name="final" value="${lec.finalscore}"></th>
					<th><input type="text" id="attendancescore${lec.sid }" name="attend" value="${lec.attendancescore}"></th>
					<th>${lec.homework}</th>
					<th>${lec.total}</th>
					<th>${lec.rank}</th> 
					<th>
						<button id="updateBtn" onclick="update('${lec.sid}', ${lec.opennum })">수정하기</button>
					</th>
			</tr>
				</c:forEach>
			
	</tbody>
</table>
<script>


function update(students_code, open_num) {
	var middlescore = parseInt($('#middlescore' + students_code).val());
	var finalscore = parseInt($('#finalscore' + students_code).val());
	var attendancescore = parseInt($('#attendancescore' + students_code).val());
	
	console.log(students_code + middlescore + finalscore + attendancescore + open_num);
	 $.ajax({
			url: 'ScoreInsert',
			data:{
				middlescore: middlescore,
				finalscore: finalscore,
				attendancescore: attendancescore,
				sid : students_code,
				opennum : open_num
			},
			type: 'POST',
			success: function(result){
					location.href = "ScoreCheckLectureStudent?opennum=" + open_num
			}
		})
}

 $(function(){
	/*  $('#updateBtn').click(function (){
		 console.log($(this).val()); */
		 /* $.ajax({
				url: 'ScoreInsert',
				data:{
					middlescore: mcore,
					finalscore: fcore,
					attendancescore: acore
				},
				type: 'POST',
				contentType: 'application/json',
				success: function(result){
							console.log(result);
				}
			}) */
	 //})
}) 


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
<script>


</script>
</div>
</body>
</html>
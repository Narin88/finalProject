<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="frm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교수 정보 :: No.M University</title>
<link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<script type = "text/javascript" src = "http://code.jquery.com/jquery-latest.min.js"></script> 
<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type = "text/javascript" src = "https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<style>
	.pdfbox{
		width: 1200px;
		margin: 40px auto;
		padding: 30px;
	}
.infoImg{
	width: 90x;
	height: 100px;
}
</style>
</head>
<body>
<div class="content-page">
	<div class="card-body">
		<div>
		<div class="bigDiv">
			<div>
				<h4 align="center">내 정보 확인</h4>
				<table class="table table-bordered">
					<tr>
						<th class="table-secondary">교수번호</th>
						<td>${pro.pid}</td>
						<th class="table-secondary">이름</th>
						<td>${pro.pname }</td>
						<th class="table-secondary">성별</th>
						<td><c:if test="${pro.pgender eq 1}">남자</c:if>
							<c:if test="${pro.pgender eq 2}">여자</c:if></td>
						<th class="table-secondary">생년월일</th>
						<td>${pro.pbirth } </td>
					</tr>
					<tr>
						<th class="table-secondary">이메일</th>
						<td colspan="2">${pro.email }</td>
						<th class="table-secondary">전화번호</th>
						<td colspan="2">${pro.pphone }</td>
						<th class="table-secondary">직책</th>
						<td>${pro.position }</td>
					</tr>
					<tr>
						<th class="table-secondary">학과</th>
						<td colspan="2">${pro.dname }</td>
						<th class="table-secondary">전공</th>
						<td colspan="2">${pro.mname }</td>
						<th class="table-secondary">비고</th>
						<td>${pro.pstatus }</td>
					</tr>
				</table>
			</div>
			<button id="createpdf" class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light">pdf 생성</button>
			<div id="pdfwrap" class="pdfbox">
				<h4 align="center" >지도 학생</h4>
				<table class="table table-bordered">
					<thead>
						<c:if test="${!empty guid}">
							<c:forEach items="${guid }" var="vo"> 
								<tr>
									<th rowspan="2" width="100px" style="padding: 0"> <img src="resources/image/students/${vo.picture }" alt="증명사진" class="infoImg" id="infoImg" /> </th>
									<th class="table-secondary" height="50px">학번</th>
									<th class="table-secondary">이름</th>
									<th class="table-secondary">생년월일</th>
									<th class="table-secondary">연락처</th>
									<th class="table-secondary">학년</th>
									<th class="table-secondary">성별</th>
									<th class="table-secondary">장애여부</th>
									<th class="table-secondary">비고</th>
								</tr>
								<tr>
									<td height="50px">${vo.sid }</td>
									<td>${vo.sname }</td>
									<td>${vo.sbirth }</td>
									<td>${vo.sphone }</td>
									<td>${vo.grade }</td>
									<td><c:if test="${vo.sgender eq 1}">남자</c:if>
										<c:if test="${vo.sgender eq 2}">여자</c:if></td>
									<td>${vo.disabled }</td>
									<td>${vo.sstatus }</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty guid}">
							<tr>
								<th>학번</th>
								<th>이름</th>
								<th>생년월일</th>
								<th>연락처</th>
								<th>학년</th>
								<th>성별</th>
								<th>장애여부</th>
								<th>비고</th>
							</tr>
							<tr>
								<td colspan="8">지도 학생이 없습니다 :)</td>
							</tr>
						</c:if>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<script>
$('#createpdf').click(function() {
	  html2canvas($('#pdfwrap')[0]).then(function (canvas) {
		  var filename = '수강학생_' + Date.now() + '.pdf'; 
		  var doc = new jsPDF('p', 'mm', 'a4'); 
		  var imgData = canvas.toDataURL('image/png'); 
		  var imgWidth = 210; 
		  var pageHeight = 295; 
		  var imgHeight = canvas.height * imgWidth / canvas.width; 
		  var heightLeft = imgHeight; 
		  var position = 0; doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight); heightLeft -= pageHeight; 
		  while (heightLeft >= 0) { position = heightLeft - imgHeight; doc.addPage(); doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight); heightLeft -= pageHeight; } doc.save(filename); 
	  });
});
</script>
</body>
</html>
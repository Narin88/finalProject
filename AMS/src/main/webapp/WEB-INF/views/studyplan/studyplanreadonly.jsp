<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<head>
<script type = "text/javascript" src = "http://code.jquery.com/jquery-latest.min.js"></script> 
<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type = "text/javascript" src = "https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>

<style>
 .container23{
 	width: 1200px;
 	border: 1px solid black;
 	margin: 40px;
 	padding: 30px;
}
 .innercontainer23{
 	align : center;
	width: 100%;
	
 }
 .ns23{
 font-family: 'Noto Sans KR', sans-serif;
 align: center;
 }
 textarea{
 word-break: break-all;
}
 

 </style>

<meta charset="UTF-8">
<title>강의 계획서 수정</title>
</head>
<body>

<button id="createpdf">
  pdf 생성
</button>

<script>
/* var str = document.getElementById("textarea").value;
str = str.replace(/(?:\r\n|\r|\n)/g, '<br />');
document.getElementById("text").innerHTML = str;

var str = $("#textarea").val();
str = str.replace(/(?:\r\n|\r|\n)/g, '<br />');
$("#text").html(str);

 */
$('textarea').each(function() {
    if(!$(this).hasClass('d-none')){
        $(this).replaceWith("<div contenteditable=\"true\">"+$(this).html()+"</div>")
    }
});


</script>
<div class="container23" id="pdfwrap">
	<h1 align="center" class="ns23">강 의 계 획 서</h1>
	
	<p>${spList.LYear}년도 ${spList.term} 학기</p>
	
<div class="innercontainer23">

					<table align="center" bgcolor="#d2d2d2" width="100%"  class="ns23">
								<tr width="200" height="100%">
									<th><font size="3">교과목 명</font></th>	 <th><input type="text" style="height:25px;" value="${spList.lname}" readonly> </th>
									<th ><font size="3">담당교수</font></th>	 <th><input type="text" style="height:25px;" value="${spList.pname}" readonly> </th>
									<th ><font size="3">이메일</font></th><th><input type="text" style="height:25px;" value="${spList.email}" readonly> </th>
									<th ><font size="3">교수 연락처</font></th>	 <th><input type="text" style="height:25px;" value="${spList.pphone} " readonly> </th>
								</tr>
								
					</table>
		
		<br/>

					<table align="center" bgcolor="#d2d2d2" width="100%"  class="ns23">

								
										<tr>
												<th><font size="3">수강학과</font></th>	 <th><input type="text" style="height:25px;" value="${spList.mname} " readonly></th>
												<th ><font size="3">수강학부</font></th>	 <th><input type="text" style="height:25px;" value="${spList.dname} " readonly></th>
												<th ><font size="3">강의실</font></th>	 <th><input type="text" style="height:25px;" value="${spList.lrname} " readonly></th>
												<th ><font size="3">교재</font></th>	 <th><input type="text" style="height:25px;" value="${spList.book} " readonly></th>
										</tr>
										<tr>				
														
											<th ><font size="3">강의코드</font></th>	 <th><input type="text" style="height:25px;" value="${spList.lnum} " readonly></th><th>- <input type="text" style="height:25px;" value="${spList.dividenum}" readonly> </th>
											<th></th>
											<th><font size="3">강의 시간</font></th>	 <th colspan="3" ><input type="text" style="height:25px;width:95.5%;" value="${spList.schedule}" readonly></th>
											
										
									</tr>
									<tr>				
														
											<th ><font size="3">학점</font></th>	 <th><input type="text" style="height:25px;" value="${spList.credit}" readonly></th>
											<th><font size="3">대상학년</font></th>	 <th><input type="text" style="height:25px;" value="${spList.grade}" readonly></th>
											<th ><font size="3">정원</font></th>	 <th><input type="text" style="height:25px;" value="${spList.newlimitcount}" readonly></th>
											<th><font size="3">이수구분</font></th>	 <th><input type="text" style="height:25px;" value="${spList.division}"readonly> </th>
									</tr>
									
					</table>
				</div>
		<br/>

		<input type="hidden" name="opennum" value="${spList.opennum}">
					<table width="100%"  align="center" bgcolor="#d2d2d2" class="ns23">						
							
									<tr>					
											<th>	<p align="left"> &nbsp; 1. 교과목 개요</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="content" rows="3" style="resize: none;width:99%;" readonly>${spList.content}</textarea></td>						
									</tr>					
					</table>
								
		<br/>
					<label class="ns23">3. 주차별 강의 진행 과정 <span style="color:#aaa;"> (최대 300자) </span></label>
					<table width="100%"  bgcolor="#d2d2d2" class="ns23">						
							
							<br/>
							
									<tr>					
											<th>	<p align="left">  &nbsp; 1주차 강의</p></th>
									</tr>					
									<tr height="20">					
										<td><textarea name="w1" rows="3"  style="resize: none;width:99%;"wrap="hard" readonly>${spList.w1 }</textarea></td>				
									</tr>					
							
					<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp; 2주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w2" rows="3"  style="resize: none;width:99%;"wrap="hard" readonly>${spList.w2}</textarea></td>						
									</tr>					
									
									<tr></tr>
									
								<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  3주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w3" rows="3"  style="resize: none;width:99%;" readonly>${spList.w3}</textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  4주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w4" rows="3"  style="resize: none;width:99%;" readonly>${spList.w4}</textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  5주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w5" rows="3"  style="resize: none;width:99%;" readonly>${spList.w5}</textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  6주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w6" rows="3"  style="resize: none;width:99%;" readonly>${spList.w6}</textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  7주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w7" rows="3"  style="resize: none;width:99%;" readonly>${spList.w7}</textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  8주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea  placeholder="중간고사 기간" name="w8" rows="3"  style="resize: none;width:99%;" readonly>${spList.w8}</textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  9주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w9" rows="3"  style="resize: none;width:99%;" readonly>${spList.w9}</textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  10주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w10" rows="3"  style="resize: none;width:99%;" readonly>${spList.w10}</textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  11주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w11" rows="3"  style="resize: none;width:99%;" readonly>${spList.w11}</textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  12주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w12" rows="3"  style="resize: none;width:99%;" readonly>${spList.w12}</textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  13주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w13" rows="3"  style="resize: none;width:99%;" readonly>${spList.w13}</textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  14주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w14" rows="3"  style="resize: none;width:99%;" readonly>${spList.w14}</textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  15주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w15" rows="3"  style="resize: none;width:99%;" readonly>${spList.w15}</textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  16주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w16" rows="3"  style="resize: none;width:99%;" placeholder="기말고사 기간" readonly>${spList.w16}</textarea></td>						
									</tr>					
									
									
								
								
								
								
								
								</table>
								
					
						
</div>


	
</div>

</body>
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
</html>






							
							
							
							
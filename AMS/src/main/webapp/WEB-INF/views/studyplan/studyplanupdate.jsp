<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib
uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>

<style>
.form-control{
	height: 30px;
	width: 90%;
}
b{
font-weight: bold;
}
.longform-control{
	height: 30px;
	width: 96%;
    font-size: 14px;
    display: block;
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

.areaform-control{
	height: 30px;
	width: 96%;
    font-size: 14px;
    display: block;
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
.container23 {
	width: 1200px;
	margin: 40px auto;
	padding: 30px;
</style>

<script type="text/javascript">
  function sub() {
    if (frm2.content.value == "") {
      alert("강의개요를 입력하세요");
      frm2.content.focus();
      return false;
    }
    frm2.submit();
    alert("정상등록 되었습니다");
  }
</script>
<script>
  $(document).ready(function () {
    $("#limit").on("keyup", function () {
      $("#limit_cnt").html("(" + $(this).val().length + " / 150)");

      if ($(this).val().length > 150) {
        $(this).val($(this).val().substring(0, 150));
        $("#limit_cnt").html("(150 / 150)");
      }
    });
  });
</script>
<meta charset="UTF-8" />
<title>강의 계획서 수정 :: No.M University</title>
</head>
<body>
	<div class="content-page">
		<div class="card-body">
			<div align="center">
			    <button id="createpdf" class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light">pdf 생성</button>
			</div>
			<div class="container23" id="pdfwrap">
				<h1 align="center" class="ns23">강 의 계 획 서</h1>

				<div class="col-sm-6 col-md-4 col-lg-3">
					<h5><i class="ion-compose"></i>${spList.lyear}년도${spList.term} 학기</h5>
                </div>


					<table class="table table-bordered">
						<tbody>
							<tr>
								<td width="90px"><b>교과목 명</b></td>		<td><input type="text" value="${spList.lname}" class="form-control"></td>
								<td width="90px"><b>담당교수</b></td>		<td><input type="text" value="${spList.pname}" class="form-control"></td>
								<td width="90px"><b>이메일</b></td>		<td><input type="text" value="${spList.email}" class="form-control"></td>
								<td width="100px"><b>교수 연락처</b></td>	<td><input type="text" value="${spList.pphone}" class="form-control"></td>
							</tr>
						</tbody>
					</table>

					<table class="table table-bordered">
						<tbody>
							<tr>
								<td width="100px"><b>수강학과</b></td>		<td><input type="text" class="form-control" value="${spList.mname}"></td>
								<td width="100px"><b>수강학부</b></td>		<td><input type="text" class="form-control" value="${spList.dname}"></td>
								<td width="90px"><b>강의실</b></td>		<td><input type="text" class="form-control" value="${spList.lrname}"></td>
								<td width="90px"><b>교재</b></td> 		<td><input type="text" class="form-control" value="${spList.book}"></td>
							</tr>
							<tr>
								<td><b>강의코드</b></td> 		<td colspan="3"><input type="text" class="longform-control" width="500px" value="${spList.lnum }-${spList.dividenum }"></td>
								<td><b>강의시간</b></td>		<td colspan="3"><input type="text" class="longform-control" value="${spList.schedule }">
							</tr>
							<tr>
								<td><b>학점</b></td>			<td><input type="text" value="${spList.credit}"	class="form-control"></td>
								<td><b>대상학년</b></td> 		<td><input type="text" value="${spList.grade}" class="form-control"></td>
								<td><b>정원</b></td> 		<td><input type="text" value="${spList.newlimitcount}" class="form-control"></td>
								<td><b>이수구분</b></td> 		<td><input type="text" value="${spList.division}" class="form-control"></td>
							</tr>
						</tbody>
					</table>
					<form action="studyPlanInsert" method="post" id="frm2" name="frm2">
						<sec:csrfInput />
						<input type="hidden" name="opennum" value="${spList.opennum}">
						<div class="col-sm-6 col-md-4 col-lg-3">
							<h5><i class="ion-compose"></i>과목개요</h5>
						</div>
						<table class="table table-bordered">
							<thead>
								<tr>
									<td><b>1. 교과목 개요</b></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><textarea name="content" id="limit" rows="3" required class="form-control" style="resize: none; width: 100%;">${spList.content}</textarea></td>
								</tr>
							</tbody>
						</table>

						<br />
						<table class="table table-bordered">
							<thead>
								<tr>
									<td><b font-size="14px">2. 주차별 강의 진행 과정</b><span style="color: #aaa;"> (최대 300자) </span></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="text-align: left">1주차 강의</td>
								</tr>
								<tr>
									<td><textarea name="w1" id="limit" rows="3" class="form-control" style="resize: none; width: 100%;">${spList.w1 }</textarea></td>
								</tr>
								<tr>
										<td style="text-align: left">2주차 강의</td>
								</tr>
								<tr>
									<td><textarea name="w2" id="limit" rows="3" class="form-control" style="resize: none; width: 100%;">${spList.w2 }</textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">3주차 강의</td>
								</tr>
								<tr>
									<td><textarea name="w3" id="limit" rows="3" class="form-control" style="resize: none; width: 100%;">${spList.w3 }</textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">4주차 강의</td>
								</tr>
								<tr>
									<td><textarea name="w4" id="limit" rows="3" class="form-control" style="resize: none; width: 100%;">${spList.w4 }</textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">5주차 강의</td>
								</tr>
								<tr>
									<td><textarea name="w5" id="limit" rows="3" class="form-control" style="resize: none; width: 100%;">${spList.w5 }</textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">6주차 강의</td>
								</tr>
								<tr>
									<td><textarea name="w6" id="limit" rows="3"	class="form-control" style="resize: none; width: 100%;">${spList.w6 }</textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">7주차 강의</td>
								</tr>
								<tr>
									<td><textarea name="w7" id="limit" rows="3" class="form-control" style="resize: none; width: 100%;">${spList.w7 }</textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">8주차 강의</td>
								</tr>

								<tr>
									<td><textarea name="w16" id="limit" rows="3" class="form-control" style="resize: none; width: 100%;">${spList.w8 }</textarea></td>
								</tr>
							</table>
							<br><br><br>
							<table class="table table-bordered">
							<tbody>
								<tr>
									<td style="text-align: left">9주차 강의</td>
								</tr>
								<tr>
									<td><textarea name="w9" rows="3" id="limit"	class="form-control" style="resize: none; width: 100%;">${spList.w9 }</textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">10주차 강의</td>
								</tr>
								<tr>
									<td><textarea name="w10" rows="3" id="limit" class="form-control" style="resize: none; width: 100%;">${spList.w10 }</textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">11주차 강의</td>
								</tr>
								<tr>
									<td><textarea name="w11" rows="3" id="limit" class="form-control" style="resize: none; width: 100%;">${spList.w11 }</textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">12주차 강의</td>
								</tr>
								<tr>
									<td><textarea name="w12" rows="3" id="limit" class="form-control" style="resize: none; width: 100%;">${spList.w12 }</textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">13주차 강의</td>
								</tr>
								<tr>
									<td><textarea name="w13" rows="3" id="limit" class="form-control" style="resize: none; width: 100%;">${spList.w13 }</textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">14주차 강의</td>
								</tr>
								<tr>
									<td><textarea name="w14" rows="3" id="limit" class="form-control" style="resize: none; width: 100%;">${spList.w14 }</textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">15주차 강의</td>
								</tr>
	
								<tr>
									<td><textarea name="w15" rows="3" id="limit" class="form-control" style="resize: none; width: 100%;">${spList.w15 }</textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">16주차 강의</td>
								</tr>
								<tr height="20">
									<td><textarea name="w16" id="limit" rows="3" class="form-control" style="resize: none; width: 100%;">${spList.w16 }</textarea></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<div align="center">
					<button type="button" class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light" onclick="sub()">등록</button>
					<button type="reset" class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light">취소</button>
					<button type="button" onClick="location.href='studyPlanList'" class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light">뒤로가기</button>
				</div>

			</div>
		</div>
	</div>
  </body>
  <script>
    $("#createpdf").click(function () {
      //pdf_wrap을 canvas객체로 변환
      /* 	  html2canvas($('#pdfwrap')[0]).then(function(canvas) {
	    var doc = new jsPDF('p', 'mm', 'a4'); //jspdf객체 생성
	    var imgData = canvas.toDataURL('image/png'); //캔버스를 이미지로 변환
	    doc.addImage(imgData, 'PNG', 0, 0); //이미지를 기반으로 pdf생성
	    doc.save('LecturePlan-file.pdf'); //pdf저장
	    alert('클릭됨');
	  }); */

      html2canvas($("#pdfwrap")[0]).then(function (canvas) {
        var filename = "LecturePlan_" + Date.now() + ".pdf";
        var doc = new jsPDF("p", "mm", "a4");
        var imgData = canvas.toDataURL("image/png");
        var imgWidth = 210;
        var pageHeight = 295;
        var imgHeight = (canvas.height * imgWidth) / canvas.width;
        var heightLeft = imgHeight;
        var position = 0;
        doc.addImage(imgData, "PNG", 0, position, imgWidth, imgHeight);
        heightLeft -= pageHeight;
        while (heightLeft >= 0) {
          position = heightLeft - imgHeight;
          doc.addPage();
          doc.addImage(imgData, "PNG", 0, position, imgWidth, imgHeight);
          heightLeft -= pageHeight;
        }
        doc.save(filename);
        alert("클릭됨");
      });
    });
  </script>
</html>

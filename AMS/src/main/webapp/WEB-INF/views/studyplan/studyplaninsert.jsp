<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css"	rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>

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
}
</style>

<meta charset="UTF-8">
<title>강의 계획서 등록 :: No.M University</title>
</head>
<body>
	<div class="content-page">
		<div class="card-body">
			<div class="container23">
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
						<br />
						<div class="col-sm-6 col-md-4 col-lg-3">
							<h5><i class="ion-compose"></i>과목개요는 필수 입니다.</h5>
						</div>
						<table class="table table-bordered">
							<thead>
								<tr>
									<td><b>1. 교과목 개요</b></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><textarea name="content" id="limit" rows="3" required class="form-control" style="resize: none; width: 100%;" maxlength="300"></textarea></td>
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
									<td><textarea name="w1" id="limit" rows="3" class="form-control" style="resize: none; width: 100%; "  maxlength="300"></textarea></td>
								</tr>
								<tr>
										<td style="text-align: left">2주차 강의</td>
								</tr>
								<tr>
									<td><textarea name="w2" id="limit" rows="3" class="form-control" style="resize: none; width: 100%;"  maxlength="300"></textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">3주차 강의</td>
								</tr>
								<tr>
									<td><textarea name="w3" id="limit" rows="3" class="form-control" style="resize: none; width: 100%;"  maxlength="300"></textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">4주차 강의</td>
								</tr>
								<tr>
									<td><textarea name="w4" id="limit" rows="3" class="form-control" style="resize: none; width: 100%;"  maxlength="300"></textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">5주차 강의</td>
								</tr>
								<tr>
									<td><textarea name="w5" id="limit" rows="3" class="form-control" style="resize: none; width: 100%;" maxlength="300"> </textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">6주차 강의</td>
								</tr>
								<tr>
									<td><textarea name="w6" id="limit" rows="3"	class="form-control" style="resize: none; width: 100%;"  maxlength="300"></textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">7주차 강의</td>
								</tr>
								<tr>
									<td><textarea name="w7" id="limit" rows="3" class="form-control" style="resize: none; width: 100%;"  maxlength="300"></textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">8주차 강의</td>
								</tr>
								<tr>
									<td><textarea placeholder="중간고사 기간" name="w16" id="limit" rows="3" class="form-control" style="resize: none; width: 100%;"  maxlength="300"></textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">9주차 강의</td>
								</tr>
								<tr>
									<td><textarea name="w9" rows="3" id="limit"	class="form-control" style="resize: none; width: 100%;"  maxlength="300"></textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">10주차 강의</td>
								</tr>
								<tr>
									<td><textarea name="w10" rows="3" id="limit" class="form-control" style="resize: none; width: 100%;"  maxlength="300"></textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">11주차 강의</td>
								</tr>
								<tr>
									<td><textarea name="w11" rows="3" id="limit" class="form-control" style="resize: none; width: 100%;"  maxlength="300"></textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">12주차 강의</td>
								</tr>
								<tr>
									<td><textarea name="w12" rows="3" id="limit" class="form-control" style="resize: none; width: 100%;"  maxlength="300"></textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">13주차 강의</td>
								</tr>
								<tr>
									<td><textarea name="w13" rows="3" id="limit" class="form-control" style="resize: none; width: 100%;"  maxlength="300"></textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">14주차 강의</td>
								</tr>
								<tr>
									<td><textarea name="w14" rows="3" id="limit" class="form-control" style="resize: none; width: 100%;"  maxlength="300"></textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">15주차 강의</td>
								</tr>
	
								<tr>
									<td><textarea name="w15" rows="3" id="limit" class="form-control" style="resize: none; width: 100%;"  maxlength="300"></textarea></td>
								</tr>
								<tr>
									<td style="text-align: left">16주차 강의</td>
								</tr>
								<tr height="20">
									<td><textarea placeholder="기말고사 기간" name="w16" id="limit" rows="3" class="form-control" style="resize: none; width: 100%;"  maxlength="300"></textarea></td>
								</tr>
							</tbody>
						</table>
						<div align="center">
							<button type="button" class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light" onclick="sub()">등록</button>
							<button type="reset" class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light">취소</button>
							<button type="button" onClick=history.back() class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light">뒤로가기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>










<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css"
	rel="stylesheet">
<head>

<style>
.container23 {
	width: 1200px;
	border: 1px solid black;
	margin: 40px;
	padding: 30px;
}

.innercontainer23 {
	align: center;
	width: 100%;
}

.ns23 {
	font-family: 'Noto Sans KR', sans-serif;
	align: center;
}

.small23 {
	border: 1px solid;
	padding: 20px;
	margin: 20px;
}
.small223 {
	border: 1px solid;
	padding: 20px;
	margin: 20px;
	align-content: center;
	widows: 1098px;
}
tr td th{
	border: 1px solid;
	align-content: center;
	margin: 5px;
}
</style>
  <script>
 
    $(document).ready(function() {
        $('#limit').on('keyup', function() {
            $('#limit_cnt').html("("+$(this).val().length+" / 50)");
 
            if($(this).val().length > 50) {
                $(this).val($(this).val().substring(0, 150));
                $('#limit_cnt').html("(50 / 50)");
            }
        });
    });
        
    
    </script>
<script>
	function insertBtn(id){
		if(frm.a1.value == ""){
    		alert("문항1 답변을 입력하세요");
    		frm.a1.focus();
    		return false;
    	}
		if(frm.a2.value == ""){
    		alert("문항2 답변을 입력하세요");
    		frm.a2.focus();
    		return false;
    	}
		if(frm.a2.value == ""){
    		alert("문항2 답변을 입력하세요");
    		frm.a2.focus();
    		return false;
    	}
		if(frm.a3.value == ""){
    		alert("문항3 답변을 입력하세요");
    		frm.a3.focus();
    		return false;
    	}
		if(frm.a4.value == ""){
    		alert("문항4 답변을 입력하세요");
    		frm.a1.focus();
    		return false;
    	}
		if(frm.a5.value == ""){
    		alert("문항5 답변을 입력하세요");
    		frm.a5.focus();
    		return false;
    	}
		if(frm.a6.value == ""){
    		alert("문항6 답변을 입력하세요");
    		frm.a6.focus();
    		return false;
    	}
		
		frm.submit();
		alert("한 학기 동안 고생하셨습니다.");
		
};
		


</script>
<head>
<meta charset="UTF-8">
<title>설문조사지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div class="content-page">
	<div class="container23">
		<div align="center">
			<div>
				<h2 align="center" class="ns23">${eva.lyear}   년도 ${eva.term }   학기   ${eva.lname}   <br>강의 평가 및 만족도
					조사</h2>
			</div>
			<br />
			<div class="innercontainer23">
				<div class="small23">
					<span> 본 조사는 우리 대학교 재학생에게 제공하는 교육 서비스에 대한 만족도를 측정하기 위한 것으로,<br>
						여러분의 응답은 향후 NO.M 대학교 발전을 위한 소중한 자료로 활용될 것입니다.<br> <br>
						응답하신 내용은 익명성이 철저히 보장되며,<br> 우리 NO.M대학교의 교육 서비스 품질을 향상시키는 목적
						이외에 다른 목적으로 사용하지 않을 것을 약속드립니다.<br> <br> 본 설문지는 총 8개
						문항으로 구성되어 있으며, 응답시간은 3분 정도 소요됩니다.<br> 설문 문항의 내용은 아래와 같이
						구성되어 있습니다.<br><br>1번부터 7번까지는 필수체크 문항, 8번은 선택 문항입니다. 모든 문항에 성실하게
						답해주시기를 부탁드립니다.<br> 감사합니다. <br>
					</span>
				</div>

				<br />


				<form id="frm" name="frm" action="EvaluationInsert" method="post">
					<sec:csrfInput />
					<input type="hidden" name="opennum" value="${eva.opennum }">
					<input type="hidden" name="evalcheck" value="${eva.evalcheck }">
					<div class="small223">
						<table border="1px">
							<tr >
								<th rowspan="2" style="height: 40px; width: 500px;">설문 내용</th>
								<th colspan="5" style="height: 40px; width: 800px;">응답 지수</th>
							</tr>
										<tr>
											<th>매우<br>만족
											</th>
											<th>만족</th>
											<th>보통</th>
											<th>불만</th>
											<th>매우<br>불만
										</th>
							</tr>
							<tr>
								<th>1. 교수는 수업시간을 잘 지켰습니까?</th>
								<td><input type="radio" name="a1" value="5">매우만족</td>
								<td><input type="radio" name="a1" value="4">만족</td>
								<td><input type="radio" name="a1" value="3">보통</td>
								<td><input type="radio" name="a1" value="2">불만족</td>
								<td><input type="radio" name="a1" value="1">매우불만족</td>
							</tr>
							<tr>
								<th>2. 강의 교재 및 자료는 학습에 도움이 되었습니까?</th>
								<td><input type="radio" name="a2" value="5">매우만족</td>
								<td><input type="radio" name="a2" value="4">만족</td>
								<td><input type="radio" name="a2" value="3">보통</td>
								<td><input type="radio" name="a2" value="2">불만족</td>
								<td><input type="radio" name="a2" value="1">매우불만족</td>
							</tr>
							<tr>
								<th>3. 교수는 수업을 위한 준비를 잘했습니까?</th>
								<td><input type="radio" name="a3" value="5">매우만족</td>
								<td><input type="radio" name="a3" value="4">만족</td>
								<td><input type="radio" name="a3" value="3">보통</td>
								<td><input type="radio" name="a3" value="2">불만족</td>
								<td><input type="radio" name="a3" value="1">매우불만족</td>
							</tr>
							<tr>
								<th>4. 수업의 내용과 분량은 학습을 하기에 충분했습니까?</th>
								<td><input type="radio" name="a4" value="5">매우만족</td>
								<td><input type="radio" name="a4" value="4">만족</td>
								<td><input type="radio" name="a4" value="3">보통</td>
								<td><input type="radio" name="a4" value="2">불만족</td>
								<td><input type="radio" name="a4" value="1">매우불만족</td>
							</tr>
							<tr>
								<th>5. 강의는 학습 내용을 이해하기 쉽게 설명되었습니까?</th>
								<td><input type="radio" name="a5" value="5">매우만족</td>
								<td><input type="radio" name="a5" value="4">만족</td>
								<td><input type="radio" name="a5" value="3">보통</td>
								<td><input type="radio" name="a5" value="2">불만족</td>
								<td><input type="radio" name="a5" value="1">매우불만족</td>
							</tr>
							<tr>
								<th>6. 강의를 통해 많은 것을 배웠습니까?</th>
								<td><input type="radio" name="a6" value="5">매우만족</td>
								<td><input type="radio" name="a6" value="4">만족</td>
								<td><input type="radio" name="a6" value="3">보통</td>
								<td><input type="radio" name="a6" value="2">불만족</td>
								<td><input type="radio" name="a6" value="1">매우불만족</td>
							</tr>
							
							<tr>
							<th>7. 강의 코멘트를 남겨주세요.</th>
								<td colspan="5"><textarea id="limit" name="a7" placeholder="선택문항_50자까지 작성 가능합니다."style="resize: none;width:100%;"></textarea></td>
							
							</tr>
						</table>
						<div>
							<br>
							<button type="button" onclick="insertBtn('${id}')">결과제출</button>
							<button type="reset">취 소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>


</body>
</html>
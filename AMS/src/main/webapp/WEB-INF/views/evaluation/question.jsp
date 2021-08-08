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
</style>
<head>
<meta charset="UTF-8">
<title>설문조사지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function insertBtn() {
		var test = nope("input[id='qOrder']").length;
		var data = new Array(test);
		for (var i = 1; i <= test; i++) {
			console.log(document.getElementById('qOrder[' + i + 1 + ']').value);
		}

	}
</script>
</head>
<body>
	<div class="container23">
		<div align="center">
			<div>
				<h2 align="center" class="ns23">{lyear}년도 {lname} 강의 평가 및 만족도
					조사</h2>
			</div>
			<br />
			<div class="innercontainer23">
				<div class="small23">
					<span> 본 조사는 우리 대학교 재학생에게 제공하는 교육 서비스에 대한 만족도를 측정하기 위한 것으로,<br>
						여러분의 응답은 향후 NO.M 대학교 발전을 위한 소중한 자료로 활용될 것입니다.<br> <br>
						응답하신 내용은 익명성이 철저히 보장되며,<br> 우리 NO.M대학교의 교육 서비스 품질을 향상시키는 목적
						이외에 다른 목적으로 사용하지 않을 것을 약속드립니다.<br> <br> 본 설문지는 총 ????개
						문항으로 구성되어 있으며, 응답시간은 ???여분 정도 소요됩니다.<br> 설문 문항의 내용은 아래와 같이
						구성되어 있습니다.<br> <br> 〈Ⅰ. 정보대학원 수업에 대한 만족도〉 ------ 11문항<br>
						〈Ⅱ. 정보대학원 전체에 대한 만족도〉 ------ 9문항<br> 〈Ⅲ. 건의사항〉
						--------------------------- 3문항<br> <br> 모든 문항에 성실하게
						답해주시기를 부탁드립니다.<br> 감사합니다. <br>
					</span>
				</div>

				<table align="center" bgcolor="#d2d2d2" width="100%" class="ns23">
					<tr width="200" height="100%">
						<th><font size="3">교과목 명</font></th>
						<th><input type="text" value="{eva.lname} "></th>
						<th><font size="3">담당교수</font></th>
						<th><input type="text" value="{eva.pname}"></th>
					</tr>

				</table>

				<br />


				<form id="frm" name="frm" action="researchAppendwrite.do"
					method="post">
					<div>
						<table border="1">
							<tr>
								<td colspan="2" width="700" height="200" align="center">
									<h1>{researchTitle.title }</h1>
									<h1>{researchTitle.id }</h1>
									<h4>종료일자 : {researchTitle.edate }</h4> <input id="id"
									type="hidden" name="id" value="{researchTitle.id }">
									{fn:length(qlist) }건
								</td>
							</tr>
							<c:forEach items="{qlist }" var="q">
								<input id="qOrder" type="hidden" name="qOrder"
									value="nope{q.qOrder }">
								<tr>
									<th width="50">문항 nope{q.qOrder}</th>
									<td>nope{q.qTitle }</td>
								</tr>
								<c:set var="qstr" value="nope{fn:split(q.qSubtitle, ',') }"></c:set>
								<tr>
									<td colspan="2" width="700"><c:choose>
											<!-- 라디오 클릭 질문  -->
											<c:when test="nope{q.section eq 'R' }">
												<c:forEach items="nope{qstr }" var="str">
													<input id="radio" type="radio"
														name="qResult[nope{q.section }]" value="nope{str }">nope{str }
											</c:forEach>
											</c:when>
											<c:when test="nope{q.section eq 'W }">
												<c:forEach var="str" items="nope{qstr }">
												nope{q.qSubtitle } : <input id="text" type="text"
														name="qResult[nope{q.qOrder }]">
												</c:forEach>
											</c:when>
											
										</c:choose></td>
								</tr>
							</c:forEach>
						</table>
						<div>
							<br>
							<button type="button" onclick="insertBtn()">결과제출</button>
							<button type="reset">취 소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>
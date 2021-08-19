<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과제 제출 :: No.M University</title>
<style>
.container23 {
	width: 1200px;
	margin: 40px auto;
	padding: 30px;
}
</style>
</head>
<body>
	<!-- 현재날짜 -->
	<c:set var="today" value="<%=new java.util.Date()%>" />
	<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss" /></c:set> 
	<div class="content-page">
		<div class="card-body">
			<div class="container23" align="center">
				<h4>과제 정보</h4>
				<c:forEach items="${result }" var="list">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<th width="100px;">제출 기간</th>
								<td><fmt:formatDate value="${list.registerDate }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${list.pperiod }" pattern="yyyy-MM-d"/></td>
							</tr>
							<tr>
								<th style="padding-top: 70px;">주의 사항</th>
								<td style="text-align:left;color:red;font-size:12px;padding">
										  1. 과제제출기간이 지난 이후에는 더 이상 제출이 불가하므로 기간 안에 제출바랍니다.<br>
										  2. 파일명의 오류로 인해 채점이 안 될 경우, 불이익이 발생할 수 있습니다. 따라서 필히 정해진 양식대로 제출해주시기 바랍니다.(첨부된 과제물 제출 양식에 작성, 한글 파일로 제출)<br>
										  3. 다른 학습자와 동일한 중복과제, 80% 이상 모사답안, 주제와 관계없는 의미 없는 글, 빈 파일등으로 필터링 될 경우 0점 또는 최저점을 받게 됩니다. 이에 해당되는 경우에는 이의신청 되지 않습니다.		
										<br><br><br>
									★ 간혹 모사율을 피하기 위해 상식에 어긋나는 과도한 외국어 사용이나 캡쳐본을 사용하여 제출하는 경우가 있습니다. <br>
									교수님께서 과제 하나하나 채점하시기 때문에 상식에서 벗어난 외국어 사용을 할 경우 감점이 될 수 있으니 참고 부탁드립니다. ★<br>

								★ 제출 후, 과제를 다운로드 하셔서 맞게 제출하셨는지 확인하시기 바랍니다. 타 과목의 과제, 공란, 파일 오류 등의 문제가 발생하여도 추가 제출이 불가하오니 주의하시기 바랍니다. ★
									
								</td>
							</tr>
							<tr>
								<th style="padding-top: 5	0px;"> 제출요령 </th>
								<td style="text-align:left;color:red;font-size:12px;">1. 글자체는 굴림, 글자 크기는 10, 줄간격 160으로 기준합니다.<br>
									2. 과제 분량은 2~3p로 작성합니다.<br>
									[2장 초과 : 0점 감점/ 1.5장 초과~2장 이하 : 1점 감점 / 1장 초과~1.5장 이하 : 2점 감점 / 1장 이하 : 3점 감점]<br>
									※ 단, 계산식 문제 등 부득이 해당 과제가 분량을 채우기 힘든 과제의 경우 제외<br>
									3. 과제 제출 시 별도의 표지를 만들지 않으며, 한글 파일로 저장합니다.<br>
									4. 파일명은 필히! ‘2021년 과목명_이름“으로 제출합니다.
								</td>
							</tr>
							<tr>
								<th> 과제제출<br>양식</th>
								<td><i id="download" data-id="${list.registerFile }" class="mdi mdi-file-import" style="cursor:pointer;">${list.registerFile }</i></td>
							</tr>
						</tbody>
					</table>
					<br>
					<h4>과제 제출</h4>
					<form id="hwSSubmitFrm" name="hwSSubmitFrm" action="hwSSubmit" method="post" enctype="multipart/form-data">
						<sec:csrfInput/>
						<input type="hidden" id="registerId" name="registerId" value="${list.registerId }">
						<input type="hidden" id="scomment" name="scomment">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th style="padding-top: 60px;">교수님께 한마디</th>
									<td style="text-align: left;"><textarea id="scomment" name="scomment" style="border:none; resize: none;" rows="5" cols="90" class="form-control" placeholder="교수님께 하실말이 있으시면 글을 남겨주세요."></textarea></td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td style="text-align: left;"><input type="file" id="file" name="file"></td>
								</tr>
								<tr>
									<th> 제출날짜 </th>
									<td style="text-align: left;"><input type="text" value="${date }" disabled></td>
								</tr>
							</tbody>
						</table>
						<button class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light" type="button" onclick="submitFunc();">제출하기</button>
					</form>
					</c:forEach>
				</div>
		</div>
	</div>
<script>
$("#download").click(function(){
	var a=$(this).data('id');
	console.log(a);
	var filePath ="C:/Users/User/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/finalProject/resources/upload/hw_professor/"+a;
		//"C:/Users/User/git/finalProject/AMS/src/main/webapp/resources/upload/hw_student/"+a;
	console.log(filePath);
	var fileName = a;
	location.href = "fileDownload?filePath="+filePath+"&fileName="+fileName;
});
function submitFunc(){
	var a=$("#scomment").val();
	var b=$("#file").val();
	hwSSubmitFrm.scomment.value=a;
		if(b == ""){
			alert("첨부파일을 등록해주세요.");
		}else{
			if(confirm("제출하시겠습니까?")==true){
			alert("제출완료!");
			hwSSubmitFrm.submit();
		}else{
			return false;
		}	
	}	
}
</script>
</body>
</html>
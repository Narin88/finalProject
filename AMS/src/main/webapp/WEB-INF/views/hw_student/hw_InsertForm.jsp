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
								<th>제출 기간</th>
								<td><fmt:formatDate value="${list.registerDate }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${list.pperiod }" pattern="yyyy-MM-d"/></td>
							</tr>
							<tr>
								<th> 과제제출양식</th>
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
									<th>교수님께 한마디</th>
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
				</div>
			</c:forEach>
		</div>
	</div>
<script>
$("#download").click(function(){
	var a=$(this).data('id');
	console.log(a);
	var filePath = "C:/Users/User/git/finalProject/AMS/src/main/webapp/resources/upload/hw_professor/"+a;
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
<title>수정 :: No.M University</title>
</head>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
<link rel="stylesheet" href="resources/css/loginCss.css" />
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
	#explanation {
	 	color : red;
		padding-top: 30px;
    	margin-bottom: 0px;
	 }
</style>
<body>
<div class="content-page">
<form name = "frmPwd" method = "POST" action = "studentUpdate">

	<!-- form 태그 안에 추가해야 함 -->
	<sec:csrfInput/>

	<div class = "wrapper fadeInDown">
		<div id = "formContent">
			<div class = "fadeIn first">
				<img src="resources/assets/images/noM_logo2.png" id="icon" alt="No.M mark" style="width: 130px; height: 130px;"/>
				<p id = explanation>비밀번호는 숫자, 대소문자, 특수문자를 각각 하나씩 포함시킨 6 ~ 12자리 글자여야 합니다.</p>
			</div>
			<div class = "card-body">
				<div class="form-group">
					<input type = "password" name = "nPwd" placeholder = "New Password" maxlength = "12" onkeyup ="keyEvent()">
				</div>
				<div class="form-group">
					<input type = "password" name = "pwd" placeholder = "Cofirm New Password" maxlength = "12" onkeyup ="keyEvent()">
					<p id = "check"></p>
				</div>
			</div>
			<div class="card-footer">
				<button type = "button" class = "btn btn-success" id = "updateBtn">수정</button>
				<button type = "button" class = "btn btn-danger">돌아가기</button>
			</div>
		</div>
	</div>
</form>

<script>
	
	var bool = false;
	
	// 정규식 = 대문자, 특수문자가 반드시 하나 이상 포함된 최소 6글자 비밀번호 (한글 x)
	const idReg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,}/;
	
	document.getElementById('updateBtn').addEventListener('click', studentUpdate);
	document.getElementsByClassName('btn btn-danger')[0].addEventListener('click', goBack);

	// 비번 변경
	function studentUpdate() {
		
		if (!idReg.test(frmPwd.nPwd.value)) {
			alert('비밀번호 조건이 맞지 않습니다!');
			document.frmPwd.nPwd.focus();
			return;
		} else if (bool == false) {
			alert('비밀번호가 일치하지 않습니다!');
			document.frmPwd.pwd.focus();
			return;
		} else {
			alert('비밀번호가 변경되었습니다.');
			document.frmPwd.submit();
		}
		
	}

	// 돌아가기
	function goBack() {
		
		location.href = 'studentInfo';
	}
	
	// 비밀번호 일치 여부 실시간 검사 
	//$("#pwd, #npwd").on("propertychange change keyup paste input", function() {
	function keyEvent() {
		
		let nPwd 	= document.getElementsByName('nPwd')[0].value;
		let cPwd 	= document.getElementsByName('pwd')[0].value;
		let write 	= document.getElementById('check');
		
		if (nPwd == '' || cPwd == '') {
			write.innerText = '';
			bool = false;
		}
		
		if (nPwd != '' && cPwd != '') {
			if (nPwd != cPwd){
				write.innerText = '비밀번호가 일치하지 않습니다.';
				write.style.color = 'hotpink';
				bool = false;
			} else {
				write.innerText = '비밀번호가 일치합니다.';
				write.style.color = 'skyblue';
				bool = true;
			}
		}
	}
</script>
</div>
</body>
</html>
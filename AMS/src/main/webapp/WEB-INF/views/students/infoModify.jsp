<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
<title>정보 수정 페이지</title>
</head>

<style>
	
	/* #check{
		position: absolute;
		left: 60%;
	} */

	.pwdArea {
		/* padding-left: 45%; */
		padding-bottom: 1%;
	}
	
	#leftSide {
		padding-top: 3px;
		float: left;
		left: 60%;
	}
	
	.check {
		float: right;
		right : 40%;
		position: absolute;
	}
	
</style>
<body>

<form name = "frmPwd" method = "POST" action = "studentUpdate">

	<!-- form 태그 안에 추가해야 함 -->
	<sec:csrfInput/>

	<div class = "all">
		<div align = "center">
			비밀번호만 수정할 수 있다.<br>
			주소나 연락처는 해당 학과 행정실 이용 바람.<br>
			<p>비밀번호에는 숫자, 문자, 특수문자 각각 최소 1개씩 포함돼야 합니다.</p>
		</div>
		<div class = "pwdArea">
			<div>
				<input type = "password" name = "nPwd" placeholder = "New Password" maxlength = "12" onkeyup ="keyEvent()">
			</div>
			<div class = "leftSide">
				<input type = "password" name = "pwd" placeholder = "Cofirm New Password" maxlength = "12" onkeyup ="keyEvent()">
				<span id = "check"></span>
			</div>
		</div>
		<div align = "center">
			<button type = "button" id = "updateBtn">비번 수정하기</button>
		</div>
	</div>
</form>

<script>
	
	document.getElementById('updateBtn').addEventListener('click', studentUpdate);

	var bool = false;

	// 정규식
	let idReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[`~!@#$%^&*()-_+|=])[A-Za-z\d`~!@#$%^&*()-_+|=]{6,12}$/;
			// 숫자, 문자, 특문 무조건 1개 이상. 6~12글자로.
	///^[0-9][a-zA-Z][`~!@#$%^&*()-_=+\|]$/	
	function studentUpdate(){
				
		if(!idReg.test(frmPwd.nPwd.value)){
			alert('비밀번호 조건을 맞춰 주세요!\n6 글자 이상 12 글자 이하\n숫자, 문자, 특수문자 최소 1 개 포함');
			document.frmPwd.pwd.focus();
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
	/* 
	$("#pwd, #npwd").on("propertychange change keyup paste input", function() {
		
		let nPwd = document.getElementsByName('nPwd')[0].value;
		let cPwd = document.getElementsByName('pwd')[0].value;
		
		let write = document.getElementById('check');
		
		if(nPwd != '' && cPwd != ''){
			
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
	})
	 */
	 
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
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<title>정보 수정 페이지</title>

<form id = "frm" method = "POST" action = "studentUpdate.do">

	<!-- form 태그 안에 추가해야 함 -->
	<sec:csrfInput/>

	<div align = "center">
		<div>
			비밀번호만 수정할 수 있다.<br>
			주소나 연락처는 해당 학과 행정실 이용 바람.<br>
		</div>
		<div>
			<input type = "password" name = "nPwd" placeholder = "New Password">
		</div>
		<div>
			<input type = "password" name = "pwd" placeholder = "Cofirm New Password">
		</div>
		<button type = "button" id = "updateBtn">비번 수정하기</button>
	</div>
</form>

<script>
	
	document.getElementById('updateBtn').addEventListener('click', studentUpdate);
	
	function studentUpdate(){
		
		let nPwd = document.getElementsByName('nPwd')[0].value;
		let cPwd = document.getElementsByName('pwd')[0].value;
		
		if (nPwd != cPwd) {
			
			alert('비밀번호가 일치하지 않습니다!');
			frm.pwd.focus();	// 왜 작동 안 함.
		} else {
			
			alert('비밀번호가 변경되었습니다.');
			frm.submit();		// 왜 작동 안 함.
		}
	}
</script>
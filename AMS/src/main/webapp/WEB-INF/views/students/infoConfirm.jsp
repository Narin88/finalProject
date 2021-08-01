<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>본인 확인 페이지</title>

<script>
	
	let btn = document.getElementById("confirmBtn");
	
	btn.addEventListener("clcik", () => {
		// XMLHttpRequest 객체 생성
		var xhr = new XMLHttpRequest();
		
		// 요청 보낼 방식, 주소, 비동기 여부 설정
		xhr.open('POST', '/infoConfirm.do', true);
		
		// HTTP 요청 헤더 설정 - POST 방식에 필요
		xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		
		// 요청 전송
		xhr.send();
		
		// 통신 뒤 작업
		xhr.onload = confirmBtn() => {
			
			// 통신 성공
			if (xhr.status == 200){
				
				console.log('성공');
				//location.href = "infoModifingPage";
			} else {
				
				console.log('실패');
				return;
			}
		}
		
	});
		

</script>

<form id = "frm" method = "POST" action = "infoConfirm.do">
	<div align = "center">
		<div class = "idConfirm">
			<input type = "text" name = "sid" placeholder = "ID">
		</div>
		<div class = "pwdConfirm">
			<input type = "password" name = "pwd" placeholder = "Password">
		</div>
		<div class = "btnClass">
			<button id = "confirmBtn" onclick = "confirmBtn()">확인</button>
		</div>
	</div>
</form>
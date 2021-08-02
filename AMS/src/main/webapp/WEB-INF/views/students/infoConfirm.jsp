<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<title>본인 확인 페이지</title>

<!-- <script>
	
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
		
</script> -->

<!-- form 태그 추가 사항 있음 -->
<!-- 
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
</form>  -->


<link
      href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      rel="stylesheet"
      id="bootstrap-css"
/>
<link rel="stylesheet" href="resources/css/loginCss.css" />
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<div class="wrapper fadeInDown">
	<div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
	<div class="fadeIn first">
		<img
			src="resources/loginpicture/logo.png"
			id="icon"
			alt="No.M mark"
		/>
    </div>

	<div class="fadeIn second" style = "margin-top: 20px; margin-bottom: 20px;">
		본인 확인을 위해 학번과 비밀번호를 입력해 주세요.
	</div>

    <!-- Login Form -->
	<form action="infoConfirm.do" method="post">
    	<sec:csrfInput/>
		<input
	        type="text"
	        id="login"
	        class="fadeIn third"
	        name="sid"
	        placeholder="ID"
		/>
		<input
			type="password"
			id="password"
			class="fadeIn fourth"
			name="pwd"
			placeholder="Password"
		/>
		<input type="submit" class="fadeIn fourth" value="확인" />
	</form>
	</div>
</div>
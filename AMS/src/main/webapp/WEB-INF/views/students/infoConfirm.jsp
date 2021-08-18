<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<title>강의 꾸러미 :: No.M University</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"/>
<link rel="stylesheet" href="resources/css/loginCss.css" />
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<div class="content-page">

	<div class="wrapper fadeInDown">
		<div id="formContent">
	    <!-- Tabs Titles -->
	
		    <!-- Icon -->
		    <!-- "resources/loginpicture/logo.png" id="icon" -->
			<div class="fadeIn first">
				<img src="resources/assets/images/noM_logo2.png" 
				alt="No.M mark" style="width: 130px; height: 130px;" />
		    </div>
			<div class="fadeIn second" style = "margin-top: 20px; margin-bottom: 20px;">
				본인 확인을 위해 학번과 비밀번호를 입력해 주세요.
			</div>
		    <!-- Login Form -->
			<form name = "frm" action="infoConfirm" method="post" onsubmit = "return confirmUser();">
		    	<sec:csrfInput/>
				<input type="text" class="fadeIn third" name="sid" placeholder="ID" maxlength = "20" />
				<input type="password" class="fadeIn fourth" name="pwd" placeholder="Password" maxlength = "20"/>
				<input type="submit" class="fadeIn fourth" value="확인" />
			</form>
		</div>
	</div>
</div>

<script>
	//document.getElementById('confirmBtn').addEventListener('click', confirmUser);

	function confirmUser() {
		
		let id 	= document.getElementsByName('sid')[0].value;
		let pwd = document.getElementsByName('pwd')[0].value;
		
		if (id == '' || id == null) {
			alert('학번을 입력해 주세요');
			document.frm.sid.focus();
			return false;
		}
		
		if (pwd == '' || pwd == null) {
			alert('비밀번호를 입력해 주세요');
			document.frm.pwd.focus();
			return false;
		}
		
		// frm.submit();
	}
</script>
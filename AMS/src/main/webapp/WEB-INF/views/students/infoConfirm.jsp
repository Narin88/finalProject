<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<title>본인 확인 페이지</title>

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
	<form action="infoConfirm" method="post">
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
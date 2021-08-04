<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>로그인 페이지</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css" />
<link rel="stylesheet" href="resources/css/loginCss.css" />
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
	<div class="wrapper fadeInDown">
		<div id="formContent">
			<!-- Tabs Titles -->

			<!-- Icon -->
			<div class="fadeIn first">
				<img src="resources/loginpicture/logo.png" id="icon" alt="No.M mark" />
			</div>

			<div class="forgot">
				<h2>비밀번호찾기</h2>
			</div>
			<form class="card mt-4" action="forgetPwdNew" method="post" id="forgetPwdNew">
				<div class="card-body">
					<div class="form-group">
						<label for="email-for-pass">인증번호를 입력해주세요</label> <input
							class="form-control" name="authNum" type="text" id="authNum"
							placeholder="인증번호를 입력하세요"/>
					</div>
				</div>
				<div class="card-footer">
					<button class="btn btn-success" type="button" onclick="authCheck('${num}')">인증하기</button>
					<button class="btn btn-danger" type="button" onclick="location.href='goLogin'">돌아가기</button>
				</div>
			</form>
		</div>
	</div>
	<script src="resources/js/forgetPwd.min.js"></script>
</body>
</html>

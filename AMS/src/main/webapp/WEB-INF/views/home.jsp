<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<html>

<head>
<meta charset="UTF-8">
<title>Home</title>
</head>

<body>
	<div>
		<form action="uploadTest" method="post" enctype="multipart/form-data">
			<input type="file" name="file"><br />
			<input type="file" name="file2"> <br />
			이름: <input type="text" name="name"><br />
			나이: <input type="text" name="age"><br />
			성별: <input type="text" name="gender"><br />
			<input type="submit" value="업로드">
		</form>
		<sec:authorize access="isAuthenticated()">
			로그인 유저 ${user}
		<form action="logout" method="post">
			<sec:csrfInput/>
			<button>로그아웃</button>
		</form>
</sec:authorize>
	</div>
</body>

</html>
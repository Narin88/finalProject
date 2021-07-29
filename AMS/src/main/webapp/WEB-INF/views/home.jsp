<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<html>

<head>
<meta charset="UTF-8">
<title>Home</title>
</head>

<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>
	<div>
		<form action="uploadTest" method="post" enctype="multipart/form-data">
			<input type="file" name="file">
			<input type="file" name="file2"> 
			<input type="submit" value="업로드">
		</form>
	</div>
</body>

</html>
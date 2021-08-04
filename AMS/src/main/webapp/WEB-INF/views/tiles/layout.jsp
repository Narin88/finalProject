<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="tiles"
uri="http://tiles.apache.org/tags-tiles"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib uri="http://www.springframework.org/security/tags" prefix = "sec" %>


<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  
<style>

	div.container {
        width: 100%;
        border: 1px solid gray;
	}
	
</style>
</head>

<body>
<div class="container">
	<header>
		<tiles:insertAttribute name = "header" />
	</header>
	<nav>
		<tiles:insertAttribute name="nav" />
	</nav>
	<article>
		<tiles:insertAttribute name="content" />
	</article>
</div>
</body>
</html>

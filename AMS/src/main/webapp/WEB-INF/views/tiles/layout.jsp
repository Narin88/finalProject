<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<style>
div.container {
	width: 100%;
	border: 1px solid gray;
}
.mainImg{
	text-align:center;
}
header {
	height:38px;
	color: white;
	background-color: black;
	clear: left;
	text-align: center;
}

nav {
	float: left;
	max-width: 160px;
	margin: 0;
	padding: 1em;
}

nav ul {
	list-style-type: none;
	padding: 0;
}

nav ul a {
	text-decoration: none;
}

article {
	margin-left: 170px;
	border-left: 1px solid gray;
	padding: 1em;
	overflow: hidden;
	min-height: 600px;
}
</style>
</head>

<body>
	<div class="container">
		<div class="mainImg">
			<h3>이미지 영역</h3>
		</div>
		<header>	
				<h2>Spring project(ver 1.0)</h2>
		</header>
		<nav>
			<tiles:insertAttribute name="header" />
		</nav>
		<article>
			<tiles:insertAttribute name="content"/>
		</article>
		
	</div>
</body>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>
<meta charset="utf-8">
<head>

	<title>Home</title>
</head>
<body>
<div class="content-page">
	<a href="#"><img
					src="${pageContext.request.contextPath }/resources/loginpicture/loginicon.jpg"
					onclick="goHome()"></a>
					
</div>
</body>
</html>

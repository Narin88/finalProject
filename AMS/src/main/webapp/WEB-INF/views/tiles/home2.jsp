<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<meta charset="utf-8">
<head>
	<title>Home</title>
</head>
<body>
<sec:authorize access="hasRole('ROLE_STD')">
	<script>
		window.open("showSlide", "수강 신청 기간", "width=750, height=700");
	</script>
</sec:authorize>
<div class="content-page">
	<img src="${pageContext.request.contextPath }/resources/assets/images/noM_logo5.png" style="height: 817px; width: ">
</div>
</body>
</html>

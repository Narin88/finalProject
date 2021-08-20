<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>


<meta charset="UTF-8">
<title>강의 만족도 조사 :: No.M University</title>
</head>

<body>
<h1>강의 만족도 결과 공개</h1>
<table border="1" align="center">

		<tr>	
			<th>년도/학기</th> 
			<th>강의번호</th>
			<th>강의 명</th>
			<th>담당교수</th>
			<th>평점</th>
		</tr>
<c:forEach items="${st }" var="st">
		<tr>
			<th>${st.lyear} - ${st.term}</th>
			<th>${st.lnum } - ${st.dividenum }</th>
			<th>${st.lname }</th>
			<th>${st.pname }</th>	
		</tr>
</c:forEach>
</table>
</body>
</html>
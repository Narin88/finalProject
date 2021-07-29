<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
<META charset="UTF-8">
<head>
	<title>(교수)과제</title>
	<style>
		.hwTable1{
		width:100%;
		border:1px solid gray;
		height:200px;
		}
		.hwTable2{
		width:100%;
		border:1px solid gray;
		height:500px;
		}
	</style>
</head>
<body>

		<h3> ' ' 교수님 등록한 과제 LIST</h3>	
		<h6> 구분할수있는것들.. (예정)</h6>
	<input type="radio" name="ing" value="진행중" checked="checked">진행중
	<input type="radio" name="end" value="마감">마감
		<div class="hwTable1">
			<table BORDER="1" style="width:100%;">
				<tr>
					<th>강의명</th>	<th>강의년도</th>	<th>강의학기</th>	<th>등록날짜</th> 	<th>과제기간</th>		<th>양식파일</th>			<th>교수코멘트</th>	<th>제출현황</th>	<th> 조희</th>
				</tr>
				<c:forEach items="${result}" var="list">
				<tr>
					<td>${list.lname }</td> <td>${list.lyear }년</td>  <td>${list.term }학기</td>
					 <td><fmt:formatDate value="${list.register_date }" pattern="yy.MM.d H시mm분" /> </td> 
					 <td>~<fmt:formatDate value="${list.pperiod }" pattern="yy년MM월d일"/>까지 <br><span style="color:red;">00:00분 남음(예정)</span></td> 
					 <td>${list.register_file }</td>	 <td style="text-align:center;"> <button>확인</button><br><span style="color:red;">(모듈창 확인후 수정예정)</span></td>      
					  <td><span style="color:red;">4</span>/<span style="font-weight:bold;">${list.newlimitcount }</span></td>	<td> <button>조회하기</button></td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<h3> ' ??  ' 조회목록</h3>
		<!-- submit_SID값으로 학생정보 가져오기 -->
		<div class="hwTable2">
			<table border="1" style="width:100%; text-align:center;">
				<tr>
					<th>학생학번</th>	<th>학생이름(SNAME)</th>	 <th>제출파일</th>	
					<th>제출날짜</th>	<th>학생코멘트</th>	<th>점수</th>		<th>점수IN</th>
				</tr>
				<c:forEach items="${submitList}" var="submitList">
				<tr>
					<td>${submitList.sid }</td>	<td>${submitList.sname }</td> <td>${submitList.submit_file }</td>
					<td><fmt:formatDate value="${submitList.submit_date }" pattern="yy-MM-d HH:mm:s" /></td>	<td>${submitList.scomment }</td>
					<td > 
						<c:if test="${submitList.score eq null}">
							<span style="color:red;">NULL</span>
						</c:if> 
							${submitList.score }
						</td>
						<td> <button>바튼</button></td>
				</tr>
				</c:forEach>
			</table>
		</div>
		
</body>
</html>
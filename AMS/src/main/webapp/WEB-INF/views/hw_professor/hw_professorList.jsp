<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<META charset="UTF-8">
<head>
	<title>(교수)과제</title>
	<style>
		.box1{
		height:500px;
		}
		.hwTable1{
		width:100%;
		border:1px solid gray;
		height:380px;
		}
		.hwTable2{
		width:100%;
		border:1px solid gray;
		height:500px;
		}
		.hwContainer{
			margin-top:150px;
		}
		.HwSearch{
			padding: 1em;
		    border-radius: 3em;
		    width: 570px;
			border:1px solid gray;
		}
	</style>
</head>
<body>
		<div class="box1">	
			<h3> ' ' 교수님 등록한 과제 LIST</h3>	
			<!-- 강의년도 / 강의학기  설정하면 해당하는 강의명만 나오도록 -->
			<!-- 년도,학기,강의명 별,진행중,마감 select 설정 -->
			<div class="HwSearch">		
				<form id="frm" name="frm"  method="post">
						<label for="lyear">강의년도:</label>						
							<select name="lyear" id="lyear">		
									<option value="">선택 </option>			  
								<c:forEach items="${ySelect}" var="ySelect">
									
									  <option value="${ySelect.lyear }"  <c:if test="${ySelect.lyear==param.lyear }"> selected="selected"</c:if>    >${ySelect.lyear }</option>
									  
								 </c:forEach>	 
							</select>
								
						<label for="term">강의학기:</label>
							<select name="term" id="term">
							  <option value="">선택</option>	
							  <option value="1" <c:if test="${param.term==1 }"> selected="selected"</c:if>>1학기</option>
							  <option value="2" <c:if test="${param.term==2 }"> selected="selected"</c:if>>2학기</option>
							</select>
							
						<label for="lcode">강의명:</label>
							<select name="lcode" id="lcode">
							<option value="">선택 </option>	
							  <c:forEach items="${lName}" var="lName">
									  <option value="${lName.lcode }" <c:if test="${lName.lcode==param.lcode }"> selected="selected"</c:if>>${lName.lname } </option>
								 </c:forEach>	 
							</select>
						<span> 
							<button type="submit">검색</button>
							<button type="button" onclick="resetFunction();">초기화</button>
						</span>
				 </form>
			 </div>	
			 <div>
				 	<h4>검색</h4>
			</div>
				<br>
					<input type="radio" name="ing" value="진행중" checked="checked">진행중
					<input type="radio" name="end" value="마감">마감
				<br>
				<br>
			
			<div class="hwTable1">
				<table BORDER="1" style="width:100%;text-align:center;">
					<tr>
						<th>강의년도</th>	
						<th>강의학기</th>	
						<th>강의명</th> 
						<th>강의실코드</th>
						<th>과제제목</th>		
						<th>등록날짜</th> 
						<th>과제기간</th>		
						<th>양식파일</th>			
						<th>제출현황</th>	
						<th> 조희</th>
					</tr>
					<c:forEach items="${result}" var="list">
					<tr>
						 <td>${list.lyear }년</td>  <td>${list.term }학기</td>	<td>${list.lname }</td> <td>${list.lrcode }</td>
						 <td style="text-align:center;"> <span style="color:red;">( ' - ' )</span></td>
						 <td><fmt:formatDate value="${list.register_date }" pattern="yy.MM.d H시mm분" /> </td> 
						 <td>~<fmt:formatDate value="${list.pperiod }" pattern="yy년MM월d일"/>까지 <br><span style="color:red;">00:00분 남음(예정)</span></td> 
						 <td>${list.register_file }</td>	       
						  <td><span style="color:red;">4</span>/<span style="font-weight:bold;">${list.newlimitcount }</span></td>	<td> <button>조회</button></td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="hwContainer">
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
		</div>
		<!-- select 값 가져오는 쿼리 -->
		<script>
		
		var year=$("#hwYears").prop("selectedIndex");
		$("select[name=hwYears]").change(function(){
			var result1=($(this).val());
		//	console.log($("select[name=hwYears] option:selected").text());
		});
		var term=$("#hwTerm").prop("selectedIndex");
		$("select[name=hwTerm]").change(function(){
			var result2=($(this).val());	
			frm.hwT.value=result2;
		});
		var lname=$("#hwLname").prop("selectedIndex");
		$("select[name=hwLname]").change(function(){
			var result3=($(this).val());
			frm.hwL.value=result3;
		});
		</script>
		<script>
		function resetFunction(){
			$("#lyear option:eq(0)").prop("selected",true);
			$("#term option:eq(0)").prop("selected",true);
			$("#lcode option:eq(0)").prop("selected",true);
			frm.submit();
		}
		</script>
</body>
</html>
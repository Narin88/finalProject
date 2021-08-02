<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE HTML>
<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
		height:480px;
		}
		.hwTable2{
		width:100%;
		border:1px solid gray;
		height:500px;
		}
		.hwContainer{
			margin-top:240px;
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

			
			<!-- TEST -->
			
			
			<h3> ' ' 교수님 등록한 과제 LIST</h3>	
			<!-- 강의년도 / 강의학기  설정하면 해당하는 강의명만 나오도록 -->
			<!-- 년도,학기,강의명 별,진행중,마감 select 설정 -->
			<div class="HwSearch">		
				<form id="frm" name="frm"  method="post">
				<sec:csrfInput/>
					<input type="hidden" id="ye" name="ye">
					<input type="hidden" id="te" name="te">
					<input type="hidden" id="ln" name="ln">
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
							<option value="">선택</option>	
							  <c:forEach items="${lName}" var="lName">
									  <option value="${lName.lcode }" <c:if test="${lName.lcode==param.lcode }"> selected="selected"</c:if>>${lName.lname } </option>	
								 </c:forEach>	 
							</select>
						<span> 
						
							<button type="button" onclick="selectSubmit();">검색</button>
							<button type="button" onclick="resetFunction();">초기화</button>
						</span>
				 </form>
			 </div>	
			 			<script>
			 				function selectSubmit(){
			 					var a=$("#lcode option:checked").text();	
				 				frm.ln.value=a;
				 				frm.submit();
			 				}
			 				
			 			</script>
						 <div>					 
				 			<h4> 			 			
				 				<c:choose>
					 				<c:when test="${reName eq '선택'}">
					 					<span style="color:brown;">'  ${reYear } 년   ${reTerm }  학기  '  </span>로 검색한 결과..
					 				</c:when>		
				 					<c:otherwise>
				 						<span style="color:brown;">'  ${reYear } 년  ${reTerm }  학기   ${reName } '  </span>로 검색한 결과..
				 					</c:otherwise>
				 				</c:choose>
				 			</h4>
						</div>
						<div>
							
				 		</div>
				<br>
							 <h4>
								 <c:if test="${reYear eq '' and reTerm eq '' and reName eq '선택' }">
					 				<span style="color:cornflowerblue;">전체리스트 조회결과</span>
					 			</c:if>	
				 			</h4>	
			
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
						 <td><fmt:formatDate value="${list.register_date }" pattern="yy.MM.d HH:mm" /> </td> 
						 <td>~<fmt:formatDate value="${list.pperiod }" pattern="yy년MM월d일 HH시mm분"/>까지 <br>
						 <!-- 진행중 ,마감 (음수,양수값으로) -->
						 <c:if test="${list.hwstatus > 0 }">
						 <span style="color:red;">진행중</span>
						  </c:if>
						  <c:if test="${list.hwstatus <= 0}">
						  <span style="color:blue;">마감</span>
						  </c:if>
						 </td> 						
						 <td>${list.register_file }</td>	       
						  <td>
						  <span style="color:red;">${list.submitCount }</span>
						  /
						  <span style="font-weight:bold;">${list.newlimitcount }</span>
						  </td>	
						  <!-- 교수가 올린과제의 제출학생 리스트 출력 -->
						  <td> 
						  	<button type="button" id="inquiry" data-id="${list.register_id }">조회</button>
						  <!-- <button type="button" onclick="inquiry('${list.register_id}')">조회</button> -->			  		  	
						  </td>
					</tr>
					</c:forEach>
				</table>
					 <!--  register_id 값을 넘겨서 hw_student에서 중복된값을 가져와서 과제제출 목록리스트 뜨게하기 -->
						<script>
					//과제제출 조회요청
							$(".hwTable1").on("click","#inquiry",function(){
								$(this).data('id'); //
								var a= $(this).data('id');
								console.log(a);
								$.ajax({
									type:"post",
									url:"inquiry",
									data:{ 
										registerId :a
										},
									dataType:"json",
									success: function(data){
										$("tfoot").empty();
										for(var i of data){
											$('<tr>')
											.append($('<td id="sId">').html(i.sid))
											.append($('<td>').html(i.sname))
											.append($('<td>').html(i.submit_file))
											.append($('<td>').html(i.submit_date))
											.append($('<td id="sc">').html(i.s_comment))
											.append($('<td>').html(i.score))
											.append($('<td>').html('<button type="button" onclick="scoreIn();">점수IN</button>'))
											.appendTo('tfoot');					
										}			
									},
									error: function(error){
										alert("error");
									}
								});
							});
					
					//점수IN
					function scoreIn(){
						//
							var a=$(event.target).closest('tr').find('td').eq(0).text();
							console.log(a);
							
										
						
					}
					
					</script>
						
						 <!--<form id="frm2" name="frm2" method="post">
						<sec:csrfInput/>
							<input type="hidden" id="register_id" name="register_id"/>
						</form>
					  END -->
			</div>
		</div>
		<div class="hwContainer">
		<h3> 조회목록</h3>
		<!-- submit_SID값으로 학생정보 가져오기 -->
			<div class="hwTable2">
				<table border="1" style="width:100%; text-align:center;">
					<tr>
						<th>학생학번</th>	<th>학생이름(SNAME)</th>	 <th>제출파일</th>	
						<th>제출날짜</th>	<th>학생코멘트</th>	<th>점수</th>		<th>점수IN</th>
					</tr>
					<tfoot></tfoot>
				</table>
			</div>
		</div>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix = "sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<script type="text/javascript"
	src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.js"></script>
<script
	src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
<style>
.tui-grid-cell .tui-grid-cell-content {
	text-align: center;
	align-content: center;
}
</style>
<title>내 강의 목록</title>
</head>
<body>

			
			<!-- TEST -->
			
			
			<h3> 강의 계획서</h3>	
			<!-- 강의년도 / 강의학기  설정하면 해당하는 강의명만 나오도록 -->
			<!-- 년도,학기,강의명 별,진행중,마감 select 설정 -->
			<div class="HwSearch">		
				<form id="frm" name="frm"  method="post">
				<sec:csrfInput/>
					<input type="hidden" id="ye" name="ye">
					<input type="hidden" id="te" name="te">
					<input type="hidden" id="ln" name="ln">
						<label for="lyear">년도:</label>						
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
				 			
				 			
				 			
	<div></div>
	<div id="grid"></div>
	<script> 
		var Btn = $('<button>');
		var clsData = [
			<c:forEach items="${spList }" var="s">
				<c:choose>
					<c:when test="${empty s.content}">
						{
							lYear:'${s.LYear}', term:'${s.term}', lName: '${s.LName}', LNum: '${s.LNum}-${s.dividenum}', PName: '${s.PName}',
							MName:'${s.MName}',DName: '${s.DName}', grade: '${s.grade}', 학점: '${s.credit}',
							division: '${s.division}', credit: '${s.credit}', 
							Btn: '<button  onclick=location.href="studyPlanInsertPage?opennum=${s.opennum}">등록</button>'
						},
					</c:when>
					<c:otherwise>
						{
								lYear:'${s.LYear}', term:'${s.term}', lName: '${s.LName}', LNum: '${s.LNum}${s.dividenum}', PName: '${s.PName}',
								MName:'${s.MName}',DName: '${s.DName}', grade: '${s.grade}', 학점: '${s.credit}',
								division: '${s.division}', credit: '${s.credit}', 
								Btn: '<button onclick=location.href="studyPlanUpdatePage?opennum=${s.opennum}">수정</button><button onclick=location.href="readOnly2?opennum=${s.opennum}">읽기전용</button>'
										
						},
					</c:otherwise>
				</c:choose>
			</c:forEach>
			]; //컬럼DATA
			
		
			
        // GRID 를 보여준다.
		var grid = new tui.Grid( {
			el: document.getElementById('grid'),
			pagination: true,   //페이징 처리
		    pageOptions: {
		    	useClient: true,   //페이징 처리
		    	perPage: 10   //페이징 갯수
		    }
			,
			columns: [
				{header: '강의년도',name: 'lYear'},
				{header: '강의학기',name: 'term'},
				{header: '강의이름',name: 'lName'},
				{header: '강의코드',name: 'LNum'},
				{header: '교수이름',name: 'PName'},
				{header: '개설대학',name: 'MName'},
				{header: '수강학과',name: 'DName'},
				{header: '대상학년',name: 'grade'},
				{header: '학점',name: 'credit'},
				{header: '이수구분',name: 'division'},
				{header: '강의계획서등록',name: 'Btn'}
			], //컬럼갯수
			data: clsData
		} );
	</script>
	<script>
	
	const rowCnt = 10;
	const columnCnt = 7;

	document.write('<table border="1">');
	for (let i = 0; i < rowCnt; i++) {
	  document.write('<tr>');
	  for (let j = 0; j < columnCnt; j++)  {
	    document.write('<td>');
	    document.write(i + ", " + j);
	    document.write('</td>');
	  }
	  document.write('</tr>')
	}
	document.write('</table>');
	
	
	
	                 for(let i = 0; i < result.length; i++){
                      
                      let tr = $('<tr />');
                
                      tr.append(
                         $('<td />').append($('<input type = "text" disabled id = "dName'+i+'">').val(result[i].dName)),
                         $('<td />').append($('<input type = "text" id = "species'+i+'">').val(result[i].species)),
                         $('<td />').append($('<input type = "text" id = "age'+i+'">').val(result[i].age)),
                         $('<td />').append($('<input type = "text" id = "dColor'+i+'">').val(result[i].dColor)),
                         $('<td />').append($('<input type = "text" id = "dSize'+i+'">').val(result[i].dSize)),
                         $('<td />').html(modifyBtn)
                      );
                      
                      sTable.append(tr);
                   }
                   
                   $('#show').append(sTable);
                },
                </script>

	<TABLE border="1" width="133" bgcolor="lime">

		<%
		for (int i = 1; i < 10; i++) {
		%>

		<TR>

			<%
			for (int j = 1; j < 7; j++) {
			%>

			<TD><%=(j + "*" + i + "=" + i * j)%></TD>

			<%
			}
			%>

		</TR>

		<%
		}
		%>

	</table>

</body>
</html>
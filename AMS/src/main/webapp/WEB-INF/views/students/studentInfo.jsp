<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>학생 정보 조회 페이지</title>

<style>
	.shape {
		width: 70%;
		margin-left: 70px;
    	margin-top: 70px;
	}
	
	.dBody {
		/*display: table-row-group;*/
		
	}
	
	.dTr {
		display: table-row;
	}
	
	.dTh {
		border: 1px solid #999999;
		display: table-cell;
		padding: 3p 10px;
	}
	
	.btnGroup {
		display: flex;
		justify-content: flex-end;
		margin-top: 25px;
	}
	
	.table{
		border-top: solid black 1px;
		width: 100%;
	}
	
	th {
		background : #d2d2d2;
	}
</style>



<div class="shape">
	
	<label>학생정보 확인</label>						
	<table border = "1" class="table">
		<tr>
			<th width="150"><font size="3">학번</font></th>	 <td width="150">${st.sid}</td>
			<th width="150"><font size="3">이름</font></th>	 <td width="150" colspan="3">${st.sname}</td>
		</tr>
		<tr>
			<th width="150"><font size="3">학과</font></th>		<td width="150">${st.mname}</td>
			<th width="150"><font size="3">담당교수</font></th>	 <td colspan="3" width="150">${st.pname}</td>
		</tr>
		<tr>
			<th width="150"><font size="3">학년</font></th>	 <td width="150">${st.grade}</td>
			<th width="150"><font size="3">이수학기</font></th>	 <td colspan="3" width="150">${st.term} </td>
		</tr>
		<tr>
			<th width="150"><font size="3">연락처</font></th>	 <td width="150">${st.sphone}</td>
			<th width="150"><font size="3">주소</font></th>	 <td colspan="3" width="150">${st.saddress}</td>
		</tr>
		<tr>				
						
		</tr>
		<tr>				
			<th width="150"><font size="3">입학일자</font></th>	 <td width="150">${st.enterDate}</td>
			<th width="150"><font size="3">생년월일</font></th>	 <td colspan="3" width="150">${st.sbirth} </td>
		</tr>
		<tr>
			<th width="100"><font size="3">성별</font></th>
				<c:if test = "${st.sgender eq 2 }">
					<td width="100">여자</td>
				</c:if>
				<c:if test = "${st.sgender eq 1 }">
					<td width="100">남자</td>
				</c:if>
			<th width="100"><font size="3">전형</font></th>
				<c:if test = "${st.disabled eq 'y' }">
					<td width="100">특별</td>
				</c:if>
				<c:if test = "${st.disabled eq 'n' }">
					<td width="100">일반</td>
				</c:if>
			<th width="100"><font size="3">학적</font></th>	 <td width="100">${st.sstatus} </td>
		</tr>
	</table>
		
<div class = "btnGroup">
	<button id ="pageMoveBtn">정보 수정하기</button>
</div>

</div>



<script>
	
	document.getElementById('pageMoveBtn').addEventListener('click', pageMove);
	
	function pageMove(){
		
		location.href = "infoConfirmPage";
	}
	
</script>









<%-- <div class = "shape" align = "center">
	
	<div class = "dBody">	<!-- div 테이블 시작 -->
	
		<div class = "dTr">
			<div class = "dTh">
				학번
			</div>
			<div class = "dTh">
				<input type = "text" readonly placeholder = "${st.sid }">
			</div>
			<div class = "dTh">
				이름
			</div>
			<div class = "dTh">
				<input type = "text" readonly placeholder = "${st.sname }">
			</div>
		</div>
		
		<div class = "dTr">
			<div class = "dTh">
				전공
			</div>
			<div class = "dTh">
				<input type = "text" readonly placeholder = "${st.mname }">
			</div>
			<div class = "dTh">
				담당교수
			</div>
			<div class = "dTh">
				<input type = "text" readonly placeholder = "${st.pname }">
			</div>
		</div>
		
		<div class = "dTr">
			<div class = "dTh">
				학년
			</div>
			<div class = "dTh">
				<input type = "text" readonly placeholder = "${st.grade }">
			</div>
			<div class = "dTh">
				학기
			</div>
			<div class = "dTh">
				<input type = "text" readonly placeholder = "${st.term }">
			</div>
		</div>
		
		<div class = "dTr">
			<div class = "dTh">
				연락처
			</div>
			<div class = "dTh">
				<input type = "text" readonly placeholder = "${st.sphone }">
			</div>
			<div class = "dTh">
				주소
			</div>
			<div class = "dTh">
				<input type = "text" readonly placeholder = "${st.saddress }">
			</div>
		</div>
		<div class = "dTr">
			<div class = "dTh">
				입학일자
			</div>
			<div class = "dTh">
				<input type = "text" readonly placeholder = "${st.enterDate }">
			</div>
			<div class = "dTh">
				생년월일
			</div>
			<div class = "dTh">
				<input type = "text" readonly placeholder = "${st.sbirth }">
			</div>
		</div>
		
		<div class = "dTr">
			<div class = "dTh">
				성별
			</div>
			<div class = "dTh">
				<c:if test = "${st.sgender eq 2 }">
					<input type = "text" readonly placeholder = "여자">					
				</c:if>
				<c:if test = "${st.sgender eq 1 }">
					<input type = "text" readonly placeholder = "남자">					
				</c:if>
			</div>
			<div class = "dTh">
				전형
			</div>
			<div class = "dTh">
				<c:if test = "${st.disabled eq 'y' }">
					<input type = "text" readonly placeholder = "특별">					
				</c:if>
				<c:if test = "${st.disabled eq 'n' }">
					<input type = "text" readonly placeholder = "일반">					
				</c:if>
			</div>
			<div class = "dTh">
				학적
			</div>
			<div class = "dTh">
				<input type = "text" readonly placeholder = "${st.sstatus }">
			</div>
		</div>
		
	</div>	<!-- div 테이블 끝 --> --%>
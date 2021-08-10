<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.tui-grid-cell .tui-grid-cell-content {
		text-align: center;
	}
</style>

<title>학생 성적 확인</title>
<div align = "center">
	<h2>학생 성적 확인</h2>
	<div id = "grid"></div>
</div>

<script>

// 그리드

	var scrData = [
		
		<c:forEach items = "${st}" var = "st">{
			
			lyear 		: '${st.lyear}',
			term 		: '${st.term}',
			lname 		: '${st.lname}',
			division 	: '${st.division}',
			credit 		: '${st.credit}',
			total 		: '${st.total}',
			rank 		: '${st.rank}'
		}
		<c:if test='${!empty st.lyear}'>
		,
		</c:if>
		</c:forEach>
	];
	
// 그리드 api-source

	const dataSource = {
		
		withCredentials	: false,
		initialRequest	: false,
		contentType		: 'application/json',
		api : {
			
			readData	: {},
			updateData	: {
				
				url		: '',
				method	: ''
			}
		}
		
	};

// 그리드를 보여준다
	var grid = new tui.Grid({
		
		el: document.getElementById('grid'),
		//data: dataSource,
		data: scrData,
		//rowHeaders: ['checkbox'],
		/* pagination: false,		//페이징 처리
	    pageOptions: {
	    	useClient: false,	//페이징 처리
	    	perPage: 10   		//페이징 갯수
	    }
		, */
		columns: [
			{header: '년도', name: 'lyear'},
			{header: '학기', name: 'term'},	<!-- 년도랑 학기가 같은 값일 때, 강의 개수 만큼 묶어서 출력해야 하는데. 어떡해야 하지? -->
			{header: '강의명', name: 'lname'},
			{header: '이수구분', name: 'division'},
			{header: '학점', name: 'credit'},
			{header: '총점', name: 'total'},
			{header: '등급', name: 'rank'}
			
		] //컬럼갯수
		
	});

	grid.resetData(scrData) //그리드를 그려놓고 데이터를 넣음
	
// 그리드 끝

</script>
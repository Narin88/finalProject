<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>

		.tui-grid-cell .tui-grid-cell-content {
    text-align: center;
}
.btn-hover.color-9 {
    background-image: linear-gradient(to right, #25aae1, #4481eb, #04befe, #3f86ed);
    box-shadow: 0 4px 15px 0 rgba(65, 132, 234, 0.75);
}
.btn-hover.color-10 {
        background-image: linear-gradient(to right, #ed6ea0, #ec8c69, #f7186a , #FBB03B);
    box-shadow: 0 4px 15px 0 rgba(236, 116, 149, 0.75);
}
.btn-hover.color-11 {
       background-image: linear-gradient(to right, #eb3941, #f15e64, #e14e53, #e2373f);  box-shadow: 0 5px 15px rgba(242, 97, 103, .4);
}
.btn-hover {
    font-size: 11px;
    color: #fff;
    cursor: pointer;
    text-align:center;
    border: none;
    
    border-radius: 50px;
    moz-transition: all .4s ease-in-out;
    -o-transition: all .4s ease-in-out;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
}

.btn-hover:hover {
    background-position: 100% 0;
    moz-transition: all .4s ease-in-out;
    -o-transition: all .4s ease-in-out;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
}

.btn-hover:focus {
    outline: none;
}

</style>
</head>
<body>
	<div id="grid" ></div>
			<script>
			
					  		//grid start
					  		
					  				var clsData = [
								<c:forEach items="${result }" var="list">
								{
									lname: '${list.lname}'
									, lyear: '${list.lyear}'
									, term : '${list.term}'
									,pcomment: '${list.pcomment}'
									,pperiod: '<fmt:formatDate value="${list.registerDate }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${list.pperiod }" pattern="yyyy-MM-d"/><c:if test="${list.hwstatus > 0 }"><br><span style="color:red;">진행중</span> </c:if><c:if test="${list.hwstatus <= 0}"><br><span style="color:blue;">마감</span></c:if>'
									,score: '${list.score}'
									,submitCheck: '<c:if test="${list.submitCheck > 0 }"><button class="btn-hover color-9">제출완료</button></c:if> <c:if test="${list.submitCheck == 0 }"><button class="btn-hover color-11">미제출</button></c:if>'
									
								},
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
					  				{header: '강의명',name: 'lname',width:100},
					  				{header: '년도',name: 'lyear',width:60}, //강의번호+분반
					  				{header: '학기',name: 'term',width:90}, //년도+학기
					  				{header: '과제제목',name: 'pcomment',width:200},
					  				{header: '제출기간',name: 'pperiod'},
					  				{header: '점수',name: 'score',width:140},
					  				{header: '제출여부',name: 'submitCheck',width:120}
					  			], //컬럼갯수
					  			data: clsData
					  		} );
						
								
					  			grid.on('dblclick', ev => {
					        		//console.log('더블클릭!', ev.rowKey);
					        		var data = grid.getRow(ev.rowKey); //그리드 한 행의 전체값
					        		
					        		
					        		console.log(data); 	
					        	});
								
					  			</script>
</body>
</html>
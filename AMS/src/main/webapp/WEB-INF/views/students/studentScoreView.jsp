<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix= "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<style>
	.tui-grid-cell .tui-grid-cell-content {
	  text-align: center;
	}
	
	.pdfwrap{
		text-align: center;
		width: 1200px;
		margin: 40px auto;
		padding: 30px;
	}
	
	.form-control{
		width: 100px;
		display: inline;
		margin-right: 10px;
	}
	
	#resultBody > th{
		background-color : #f4f4f4;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>

<title>성적 확인 :: No.M University</title>
<body>
<div class="content-page">
	<div class="card-body">
	<div align="center">
		<button id="createpdf" class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light">pdf 생성</button>
	</div>
		<div id="pdfwrap" class ="pdfwrap">
			<h2>학생 성적 확인</h2>
			<c:set var="now" value="<%=new java.util.Date()%>" />
			<!-- 현재 년도 출력을위한 설정 -->
			<c:set var="sysYear" >
				<fmt:formatDate value="${now }" pattern="yyyy" />
			</c:set>
			<%-- <table class = "table table-bordered" style = "vertical-align: middle;">
				<tbody>
					<tr>
						<td>
							<input type = "number" name = "year" id = "year" value = "${sysYear }" class = "form-control">년
						</td>
						<td>
							<select name = "term" id ="term" class = "form-control">
								<option value = "1">1학기</option>
								<option value = "2">2학기</option>
							</select>
						</td>
						<td>
							<button class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light" type="button" onclick="search()">검색</button>
							<button class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light" type="button" onclick="cancel()">전체보기</button>
						</td>
					</tr>
				</tbody>
			</table> --%>
			<table class = "table table-bordered" style = "vertical-align: middle;">
				<tbody>
					<tr>
						<td colspan = "3">
							<input type = "number" name = "lyear" id = "year" value = "${sysYear }" class = "form-control">년
							<select name = "term" id ="term" class = "form-control">
								<option value = "1">1학기</option>
								<option value = "2">2학기</option>
							</select>
							<button class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light" type="button" onclick="search()">검색</button>
							<!-- <button class="btn btn-facebook m-b-10 m-l-10 waves-effect waves-light" type="button" onclick="cancel()">전체보기</button> -->
						</td>
					</tr>
					<tr>
						<th>년도</th>
						<th>학기</th>
						<th>점수</th>
					</tr>
					<tr id = "resultBody">
						<th id = "getLyear">${sc.lyear }</th>
						<th id = "getTerm">${sc.term }</th>
						<c:choose>
							<c:when test = "${sc.evalcheck ne 0}"> 
								<th id = "getTotal">${sc.totalscore }</th>
							</c:when>
							<c:otherwise>
								<th id = "getTotal" colspan = "3">강의평가 진행 요망</th>
							</c:otherwise>
						</c:choose>
					</tr>
				</tbody>
			</table>
			<div id="grid"></div>
			<h2>이수구분별 취득 학점</h2>
			<div id="grid2"></div>
		</div>
	</div>
</div>
</body>
<script>

    var grid;
    var scrData = [];
/* 
    // 첫번쨰 그리드
   	scrData = [
   		<c:forEach items = "${st}" var = "st">{
   			lyear 		: '${st.lyear}',
   			term 		: '${st.term}',
   			lname 		: '${st.lname}',
   			division 	: '${st.division}',
   			credit 		: '${st.credit}',
   			<c:choose>
   				<c:when test = "${st.finalscore eq ''}">
   					total		: '강의평가를 해야',
   					rank		: '확인 가능합니다.'
   				</c:when>
   				<c:otherwise>
		   			total 		: '${st.total}',
		   			rank 		: '${st.rank}'
   				</c:otherwise>
   			</c:choose>
   		}
   		<c:if test='${!empty st.lyear}'>
   		,
   		</c:if>
   		</c:forEach>
   	];
   
	// 그리드를 보여준다
   	grid = new tui.Grid({

   		el: document.getElementById('grid'),
   		data: scrData,
   		columns: [
   			{header: '년도', name: 'lyear'},
   			{header: '학기', name: 'term'},
   			{header: '강의명', name: 'lname'},
   			{header: '이수구분', name: 'division'},
   			{header: '학점', name: 'credit'},
   			{header: '총점', name: 'total'},
   			{header: '등급', name: 'rank'}

   		] //컬럼갯수

   	});
	
   	grid.resetData(scrData) //그리드를 그려놓고 데이터를 넣음

	
	grid = new tui.Grid({
		el: document.getElementById('grid'),
		data: {
			api: {
				readData: {
					url: "achievementView",
					method: "POST"
				},
			},
			contentType: "application/json",
			headers: { "x-custom-header": "custom-header" }
		},
		columns:[
			{ header: "년도", name: "lyear" },
			{ header: "학기", name: "term" },
			{ header: "총점", name: "total" }
		]
	});
*/	 

    // 그리드2
   	scrData = [
   		<c:forEach items = "${tt}" var = "tt">{
   			lyear 	: '${tt.lyear}',
   			term 	: '${tt.term}',
   			jp 		: '${tt.jp}',
   			js 		: '${tt.js}',
   			nk 		: '${tt.nk}',
   			pk 		: '${tt.pk}',
   		}
   		<c:if test='${!empty tt.lyear}'>
   		,
   		</c:if>
   		</c:forEach>
   	];


   // 그리드를 보여준다
   	grid = new tui.Grid({

   		el: document.getElementById('grid2'),
   		data: scrData,
   		columns: [
   			{header: '년도', name: 'lyear'},
   			{header: '학기', name: 'term'},	<!-- 년도랑 학기가 같은 값일 때, 강의 개수 만큼 묶어서 출력해야 하는데. 어떡해야 하지? -->
   			{header: '전공필수', name: 'jp'},
   			{header: '전공선택', name: 'js'},
   			{header: '일반교양', name: 'nk'},
   			{header: '선택교양', name: 'pk'},
   			

   		] //컬럼갯수

   	});

   	grid.resetData(scrData) //그리드를 그려놓고 데이터를 넣음

    // 그리드 끝
    $("#createpdf").click(function () {
      //pdf_wrap을 canvas객체로 변환
      /* 	  html2canvas($('#pdfwrap')[0]).then(function(canvas) {
	    var doc = new jsPDF('p', 'mm', 'a4'); //jspdf객체 생성
	    var imgData = canvas.toDataURL('image/png'); //캔버스를 이미지로 변환
	    doc.addImage(imgData, 'PNG', 0, 0); //이미지를 기반으로 pdf생성
	    doc.save('LecturePlan-file.pdf'); //pdf저장
	    alert('클릭됨');
	  }); */

      html2canvas($("#pdfwrap")[0]).then(function (canvas) {
        var filename = "성적_" + Date.now() + ".pdf";
        var doc = new jsPDF("p", "mm", "a4");
        var imgData = canvas.toDataURL("image/png");
        var imgWidth = 210;
        var pageHeight = 295;
        var imgHeight = (canvas.height * imgWidth) / canvas.width;
        var heightLeft = imgHeight;
        var position = 0;
        doc.addImage(imgData, "PNG", 0, position, imgWidth, imgHeight);
        heightLeft -= pageHeight;
        while (heightLeft >= 0) {
          position = heightLeft - imgHeight;
          doc.addPage();
          doc.addImage(imgData, "PNG", 0, position, imgWidth, imgHeight);
          heightLeft -= pageHeight;
        }
        doc.save(filename);
      });
    });
   	
	// 학년학기 검색
    /* function search() {
    	const year = $("#year").val();
    	const term = $("#term").val();
    	
    	const data = {year: year, term: term};
    	
    	grid.readData(1, data, true);
    } */
    
    function search() {
    	
    	const lyear = document.getElementsByName('lyear')[0].value;
    	const term 	= document.getElementsByName('term')[0].value;
    	$('#resultBody').empty();
    	
    	$.ajax({
    		url: 'achievementView',
    		data: {
    			lyear : lyear,
    			term : term
    		},
    		success: function(result) {
    			
    			if (result.lyear == undefined) {
    				$('#resultBody').append(
       	    			$("<th colspan = '3'>" + '기간이 잘못 설정되었습니다' + '</th>')
        	    	);
    				return false;
    			} 
    			
    			if (result != '' && result.evalcheck != 0) {
	    			$('#resultBody').append(
	    				$("<th>" + result.lyear + '</th>'),
	    				$("<th>" + result.term + '</th>'),
	    				$("<th>" + result.totalscore + '</th>')
	    			);
	    			return false;
    			} else {
    				$('#resultBody').append(
   	    				$("<th colspan = '3'>" + '강의평가 진행 요망' + '</th>')
    	    		);
    				return false;
    			}
    			
    		},
    		error: function(err) {
    			console.log(err);
    		}
    	});
    }
    
</script>


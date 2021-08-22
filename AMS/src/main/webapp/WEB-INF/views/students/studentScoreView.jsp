<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

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

    // 첫번쨰 그리드
   	scrData = [

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
</script>


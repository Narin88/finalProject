<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
.modal{ 
  position:fixed;
  top:50%; 
  left:50%;
  transform: translate(-50%,-50%);
  width:100%;
  height:100%;
  background: rgba(0,0,0,0.8);
  display:none;
}

.modal_content{
  width:400px; height:200px;
  background:#fff; border-radius:10px;
  position:relative; top:50%; left:50%;
  margin-top:-100px; margin-left:-200px;
  text-align:center;
  box-sizing:border-box; padding:74px 0;
  line-height:23px; cursor:pointer;
}
</style>
<meta charset="UTF-8">
<!-- Toast grid -->
	<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
	<link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
	<script type="text/javascript" src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.js"></script>
	<script src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--plugins-->
	<link href="assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
	<link href="assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
	<link href="assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet" />
<!-- loader-->
	<link href="assets/css/pace.min.css" rel="stylesheet" />
	<script src="assets/js/pace.min.js"></script>
<!-- Bootstrap CSS -->
	<link href="assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="assets/css/app.css" rel="stylesheet">
	<link href="assets/css/icons.css" rel="stylesheet">
<!-- Theme Style CSS -->
	<link rel="stylesheet" href="assets/css/dark-theme.css" />
	<link rel="stylesheet" href="assets/css/semi-dark.css" />
	<link rel="stylesheet" href="assets/css/header-colors.css" />
	
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h2>수강 등록</h2>
</div>

<div class="modal fade" id="exampleExtraLargeModal" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>



<div id="grid"></div>
	<script> 
		var clsData = [
			<c:forEach items="${Lectures }" var="Lec">
			{
				lName: '${Lec.LName}', lCode: '${Lec.LCode}', pId: '${Lec.PId}',
				grade: '${Lec.grade}', limitCount: '${Lec.limitCount}', dCode: '${Lec.DCode}',
				division: '${Lec.division}', credit: '${Lec.credit}'
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
				{header: '강의이름',name: 'lName'},
				{header: '과목코드',name: 'lCode'},
				{header: '교수코드',name: 'pId'},
				{header: '학년',name: 'grade'},
				{header: '정원',name: 'limitCount'},
				{header: '이수코드',name: 'dCode'},
				{header: '이수구분',name: 'division'},
				{header: '학점',name: 'credit'},
			], //컬럼갯수
			data: clsData
		} );
			
		$(function(){
			grid.on('dblclick', ev => {
				console.log('더블클릭!', ev.rowKey);
				console.log(grid.getRow(ev.rowKey));
				$('#exampleExtraLargeModal').fadeIn();
			});
		})

	</script>
</body>
</html>
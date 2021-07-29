<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
	#my_offer {
        display: none;
        width: 60%;
        padding: 30px 60px;
        background-color: #fefefe;
        border: 1px solid #888;
        border-radius: 3px;
    }
    #my_offer .modal_close_btn {
        position: absolute;
        top: 10px;
        right: 10px;
    }
    
    .modal-body{
    	font-size: 10pt;
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h2>수강 등록</h2>
</div>

<div id="my_offer" align="center">
    <a class="modal_close_btn">닫기</a>
    <div class="modal-body">
	    Hello!
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
				var data = grid.getRow(ev.rowKey);
				showOffer(data);
			});
			
			
			function showOffer(data) {
				modal('my_offer');
				
				var lnum = data.lCode;
			}
						
			function modal(mm) {
			    var zIndex = 9999;
			    var modal = document.getElementById(mm);
		
			    // 모달 div 뒤에 희끄무레한 레이어
			    var bg = document.createElement('div');
			    bg.setStyle({
			        position: 'fixed',
			        zIndex: zIndex,
			        left: '0px',
			        top: '0px',
			        width: '100%',
			        height: '100%',
			        overflow: 'auto',
			        // 레이어 색갈은 여기서 바꾸면 됨
			        backgroundColor: 'rgba(0,0,0,0.4)'
			    });
			    document.body.append(bg);
		
			    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
			    modal.querySelector('.modal_close_btn').addEventListener('click', function() {
			        bg.remove();
			        modal.style.display = 'none';
			    });
		
			    modal.setStyle({
			        position: 'fixed',
			        display: 'block',
			        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
		
			        // 시꺼먼 레이어 보다 한칸 위에 보이기
			        zIndex: zIndex + 1,
		
			        // div center 정렬
			        top: '50%',
			        left: '50%',
			        transform: 'translate(-50%, -50%)',
			        msTransform: 'translate(-50%, -50%)',
			        webkitTransform: 'translate(-50%, -50%)'
			    });
			}
		
			// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
			Element.prototype.setStyle = function(styles) {
			    for (var k in styles) this.style[k] = styles[k];
			    return this;
			};
			
			
		});

		
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<!-- Toast grid -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<script type="text/javascript"
	src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.js"></script>
<script
	src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
</head>
<body>
	<div id="grid"></div>
	<script>
      //grid start
      var clsData = [
        <c:forEach items="${logList }" var="log">
        {
          visitId: '${log.visitid}', visitName: '${log.visitname}', visitIp: '${log.visitip}', visitTime: '${log.visittime}',
          visitAgent: '${log.visitagent}', visitCookie: '${log.visitcookie}'
        },
        </c:forEach>
        ]; //컬럼DATA

          // GRID 를 보여준다.
      var grid = new tui.Grid( {
        el: document.getElementById('grid'),
        pagination: true,   //페이징 처리
          pageOptions: {
            useClient: true,   //페이징 처리
            perPage: 15   //페이징 갯수
          },
          scrollX: true,
          scrollY: true,
        columns: [
          {header: '사용자ID',name: 'visitid', align: "center", width: 250, filter: {type: "text"}},
          {header: '사용자이름',name: 'visitname', align: "center", width: 250, filter: {type: "text"}},
          {header: '사용자IP',name: 'visitip', align: "center", width: 250},
          {header: '방문시간',name: 'visittime', align: "center", width: 250, filter: {type: "date"}},
          {header: '사용브라우저',name: 'visitagent', align: "center", width: 250},
          {header: '쿠키값',name: 'visitcookie', align: "center"},
        ], //컬럼갯수
        data: clsData
      });
      //grid end
    </script>
</body>
</html>

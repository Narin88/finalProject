<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습 페이지</title>
</head>
<body>

</body>
</html>



	<div id="container2" class="timetable" style="height: 857px;">
		<hr>
		<aside>
			<form class="select">
				<select id="semesters"><!-- foreach로 년도 돌리기 --></select></form>

		</aside>
		<div class="wrap" style="width: 669px;">
			<div class="tablehead">
				<table class="tablehead" style="table-layout: fixed"  >
					<tbody align="center">
						<tr>
							<td width="58px"></td>
							<td>월</td>
							<td>화</td>
							<td>수</td>
							<td>목</td>
							<td>금</td>
							<td style="display: none;">토</td>
							<td style="display: none;">일</td>
							<td width="100px"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="tblcontainer">
				<table class="tablebody" >
					<tbody>
						<tr>
							<th><div class="hours">
									<div class="hour"
										style="height: 25px; top: 400px; line-height: 25px;">1교시</div>
							
									<div class="hour"
										style="height: 25px; top: 450px; line-height: 25px;">2교시</div>
									
									<div class="hour"
										style="height: 25px; top: 500px; line-height: 25px;">3교시</div>
								
									<div class="hour"
										style="height: 25px; top: 550px; line-height: 25px;">4교시</div>
									
									<div class="hour"
										style="height: 25px; top: 600px; line-height: 25px;">5교시</div>
									
									<div class="hour"
										style="height: 25px; top: 650px; line-height: 25px;">6교시</div>
							
									<div class="hour"
										style="height: 25px; top: 700px; line-height: 25px;">7교시</div>
						
									<div class="hour"
										style="height: 25px; top: 750px; line-height: 25px;">8교시</div>
								
									<div class="hour"
										style="height: 25px; top: 800px; line-height: 25px;">9교시</div>
									
									
								</div></th>
							<td></div>
								<div class="grids">
									<td class="grid"></td>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
								
								</div></td>
							<td><div class="cols" style="width: 108px;"></div>
								<div class="grids">
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
								</div></td>
							<td><div class="cols" style="width: 108px;"></div>
								<div class="grids">
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
								</div></td>
							<td><div class="cols" style="width: 108px;"></div>
								<div class="grids">
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
								</div></td>
							<td><div class="cols" style="width: 109px;"></div>
								<div class="grids">
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
								</div></td>
							<td style="display: none;"><div class="cols"></div>
								<div class="grids">
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
								</div></td>
							<td style="display: none;"><div class="cols"></div>
								<div class="grids">
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									
								</div></td>
							<th><div class="times">
								
									<div class="time">오전 9시</div>
									<div class="time">오전 10시 30분</div>
									<div class="time">오후 12시</div>
									<div class="time">오후 1시 30분</div>
									<div class="time">오후 3시</div>
									<div class="time">오후 4시 30분</div>
									<div class="time">오후 6시</div>
									<div class="time">오후 7시 30분</div>
									<div class="time">오후 9시</div>
									</div></th>
						</tr>
					</tbody>
				</table>
			
			</div>
		</div>
	</div>

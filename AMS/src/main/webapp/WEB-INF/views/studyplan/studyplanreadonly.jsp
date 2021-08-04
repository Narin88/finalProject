<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<head>

<style>
 .container2{
 	width: 1200px;
 	border: 1px solid black;
 	margin: 40px;
 	padding: 30px;
}
 .innercontainer{
 	align : center;
	width: 100%;
	
 }
 .ns{
 font-family: 'Noto Sans KR', sans-serif;
 align: center;
 }
 </style>

<meta charset="UTF-8">
<title>강의 계획서 수정</title>
</head>
<body>
<div class="container2">
	<h1 align="center" class="ns">강 의 계 획 서</h1>
	
	<p>${spList.LYear}년도 ${spList.term} 학기</p>
	
<div class="innercontainer">

							
					<table align="center" bgcolor="#d2d2d2" width="100%"  class="ns">
								<tr width="200" height="100%">
									<th><font size="3">교과목 명</font></th>	 <th><input type="text" value="${spList.LName} " readonly></th>
									<th ><font size="3">담당교수</font></th>	 <th><input type="text" value="${spList.PName}" readonly> </th>
									<th ><font size="3">이메일</font></th><th><input type="text"  value="${spList.email}" readonly></th>
									<th ><font size="3">교수 연락처</font></th>	 <th><input type="text" value="${spList.PPhone} " readonly > </th>
								</tr>
								
					</table>
		
		<br/>

					<table align="center" bgcolor="#d2d2d2" width="100%"  class="ns">

								
										<tr  width="200">
												<th><font size="3">수강학과</font></th>	 <th><input type="text" value="${spList.MName}" readonly></th>
												<th ><font size="3">수강학부</font></th>	 <th><input type="text" value="${spList.DName}" readonly> </th>
												<th ><font size="3">강의실</font></th>	 <th><input type="text" value="${spList.lrName}"  readonly></th>
												<th ><font size="3">교재</font></th>	 <th><input type="text" value="${spList.book}"  size=20 readonly></th>
										</tr>
										<tr>				
														
											<th ><font size="3">강의코드</font></th>	 <th><input type="text" value="${spList.LNum}"  size=20 readonly></th> <th>- <input type="text" value="${spList.dividenum}"  size=20 readonly> </th>
											<th></th>
											<th><font size="3">강의 시간</font></th>	 <th colspan="3" ><input type="text" style="width:470px" value="${spList.schedule}"  readonly></th>
											
										
									</tr>
									<tr>				
														
											<th ><font size="3">학점</font></th>	 <th><input type="text" value="${spList.credit}"  size=20 readonly></th>
											<th><font size="3">대상학년</font></th>	 <th><input type="text" value="${spList.grade}"  size=20 readonly> </th>
											<th ><font size="3">정원</font></th>	 <th><input type="text" value="${spList.newlimitCount}"  size=20 readonly></th>
											<th><font size="3">이수구분</font></th>	 <th><input type="text" style="width:200px;" value="${spList.division}" size=20 readonly> </th>
									</tr>
									
					</table>
	
		<br/>

		<input type="hidden" name="opennum" value="${spList.opennum}">
					<table width="100%"  align="center" bgcolor="#d2d2d2" class="ns">						
							
									<tr>					
											<th>	<p align="left"> &nbsp; 1. 교과목 개요</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="content" rows="3" style="resize: none;width:99%;" readonly>${spList.content}</textarea></td>						
									</tr>					
					</table>
								
		<br/>
		<br/>
					<label class="ns">3. 주차별 강의 진행 과정 <span style="color:#aaa;"> (최대 300자) </span></label>
					<table width="100%"  bgcolor="#d2d2d2" class="ns">						
							
							<br/>
							
									<tr>					
											<th>	<p align="left">  &nbsp; 1주차 강의</p></th>
									</tr>					
									<tr height="20">					
										<td><textarea name="w1" rows="3"  style="resize: none;width:99%;" readonly>${spList.w1 }</textarea></td>				
									</tr>					
							
					<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp; 2주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w2" rows="3"  style="resize: none;width:99%;" readonly>${spList.w2}</textarea></td>						
									</tr>					
									
									<tr></tr>
									
								<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  3주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w3" rows="3"  style="resize: none;width:99%;" readonly>${spList.w3}</textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  4주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w4" rows="3"  style="resize: none;width:99%;" readonly>${spList.w4}</textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  5주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w5" rows="3"  style="resize: none;width:99%;" readonly>${spList.w5}</textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  6주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w6" rows="3"  style="resize: none;width:99%;" readonly>${spList.w6}</textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  7주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w7" rows="3"  style="resize: none;width:99%;" readonly>${spList.w7}</textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  8주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea  placeholder="중간고사 기간" name="w8" rows="3"  style="resize: none;width:99%;" readonly>${spList.w8}</textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  9주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w9" rows="3"  style="resize: none;width:99%;" readonly>${spList.w9}</textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  10주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w10" rows="3"  style="resize: none;width:99%;" readonly>${spList.w10}</textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  11주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w11" rows="3"  style="resize: none;width:99%;" readonly>${spList.w11}</textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  12주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w12" rows="3"  style="resize: none;width:99%;" readonly>${spList.w12}</textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  13주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w13" rows="3"  style="resize: none;width:99%;" readonly>${spList.w13}</textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  14주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w14" rows="3"  style="resize: none;width:99%;" readonly>${spList.w14}</textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  15주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w15" rows="3"  style="resize: none;width:99%;" readonly>${spList.w15}</textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  16주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w16" rows="3"  style="resize: none;width:99%;" placeholder="기말고사 기간" readonly>${spList.w16}</textarea></td>						
									</tr>					
									
									
								
								
								
								
								
								</table>
								
								</h3>
						
</div>


	
</div>

</body>
</html>






							
							
							
							
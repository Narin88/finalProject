<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
 .container{
 	width: 120px;
}
 .innercontainer{
 	align : center;
	width: 100%;
	
 }
 </style>

<meta charset="UTF-8">
<title>강의 계획서 등록</title>
</head>
<body>
<div class="container">
	<h1 align="center">강 의 계 획 서</h1>
	
	<p>lyear, term</p> <p align="right"> 대학교</p>
	
<div class="innercontainer">
							<table align="center" bgcolor="gray" width="100%"  >
								<tr width="200" height="100%">
									<th bgcolor="white"><font size="3">교과목 명</font></th>	 <th><input type="text" value=lname > </type></th>
										<th bgcolor="gray"><font size="3">담당교수</font></th>	 <th><input type="text" value=lname> </type></th>
									<th bgcolor="gray"><font size="3">교수 연락처</font></th>	 <th><input type="text" value=pphone  > </type></th>
									<th bgcolor="pink"><font size="3">이메일</font></th><th><input type="text" size=20  value=E-mail></th>
								</tr>
								
								</table>
		
		<br/>

								<table align="center" bgcolor="gray" width="100%"  >
								
										<tr  width="200">
												
												<th bgcolor="gray"><font size="3">수강번호</font></th>	 <th><input type="text" value=dname> </type></th>
												<th bgcolor="gray"><font size="3">수강학과</font></th>	 <th><input type="text" value=mname> </type></th>
												<th bgcolor="white"><font size="3">강의실</font></th>	 <th><input type="text" value=lecture_room > </type></th>
												<th bgcolor="gray"><font size="3">강의 시간</font></th>	 <th><input type="text" value=schedule > </type></th>
										</tr>
										<tr>				
														
											<th bgcolor="gray"><font size="3">학점</font></th>	 <th><input type="text" value=credit  size=20> </type></th>
											<th bgcolor="gray"><font size="3">대상학년</font></th>	 <th><input type="text" value=grade  size=20> </type></th>
											<th bgcolor="gray"><font size="3">정원</font></th>	 <th><input type="text" value=newlimitcount  size=20> </type></th>
											<th bgcolor="gray"><font size="3">이수구분</font></th>	 <th><input type="text" value=division size=20> </type></th>
									</tr>
									
									
								</table>
	
		<br/>
									<table width="100%"  align="center" bgcolor="gray">						
							
									<tr>					
											<th>	<p align="left">1. 교과목 개요</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="content" rows="2" cols="100%" style="resize: none;">				
														
								</textarea></td>						
									</tr>					
								</table>
								
		<br/>
								
									<table width="100%"  align="center" bgcolor="gray">						
							
									<tr>					
											<th>	<p align="left">2.  교과목 개요</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="content" rows="2" cols="100%" style="resize: none;">				
														
								</textarea></td>						
									</tr>					
								</table>
			
			<br/>
			
																	<table width="100%"  align="center" bgcolor="gray">						
							
									<tr>					
											<th>	<p align="left">3.  주차별 강의 진행 과정</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="content" rows="2" cols="100%" style="resize: none;"  placeholder="1주차 진행 계획">				
										    		</textarea></td>						
									</tr>					
								
									
									<tr></tr>
										
										<tr>
										<td><textarea name="content" rows="2" cols="100%" style="resize: none;"  placeholder="1주차 진행 계획">				
										    		</textarea></td>						
										</tr>
								
									
									<tr></tr>
									
											<tr>
										<td><textarea name="content" rows="2" cols="100%" style="resize: none;"  placeholder="1주차 진행 계획">				
										    		</textarea></td>						
										</tr>
								
									
									<tr></tr>
										<tr>
										<td><textarea name="content" rows="2" cols="100%" style="resize: none;"  placeholder="1주차 진행 계획">				
										    		</textarea></td>						
										</tr>
								
									
									<tr></tr>
										<tr>
										<td><textarea name="content" rows="2" cols="100%" style="resize: none;"  placeholder="1주차 진행 계획">				
										    		</textarea></td>						
										</tr>
								
									
									<tr></tr>
										<tr>
										<td><textarea name="content" rows="2" cols="100%" style="resize: none;"  placeholder="1주차 진행 계획">				
										    		</textarea></td>						
										</tr>
								
									
									<tr></tr>
									
								
								
								
								
								
								</table>
								
								
	
																					<p align="center">
									<input type="submit" value="● 등록">		<input type="submit" value="● 취소">
								</p>
</div>


	
</div>
</body>
</html>






							
							
							
							
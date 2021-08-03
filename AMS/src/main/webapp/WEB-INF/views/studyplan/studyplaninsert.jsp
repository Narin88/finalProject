<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix = "sec" %>
<!DOCTYPE html>
<html>
<link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<head>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 
    
    <script>
 
    $(document).ready(function() {
        $('#limit').on('keyup', function() {
            $('#limit_cnt').html("("+$(this).val().length+" / 150)");
 
            if($(this).val().length > 150) {
                $(this).val($(this).val().substring(0, 150));
                $('#limit_cnt').html("(150 / 150)");
            }
        });
    });
        
    
    </script>
    <script>
 
    function sub(){
    	
    
    	
    	if(frm2.content.value == ""){
    		alert("강의개요를 입력하세요");
    		frm2.content.focus();
    		return false;
    	}
    		frm2.submit();
    		alert("정상등록 되었습니다");
    	
    }
    </script>

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
<title>강의 계획서 등록</title>
</head>
<body>
<div class="container2">
	<h1 align="center" class="ns">강 의 계 획 서</h1>
	
	<p>${spList.LYear}년도 ${spList.term} 학기</p>
	
<div class="innercontainer">

							
					<table align="center" bgcolor="#d2d2d2" width="100%"  class="ns">
								<tr width="200" height="100%">
									<th><font size="3">교과목 명</font></th>	 <th><input type="text" value="${spList.LName} "></th>
									<th ><font size="3">담당교수</font></th>	 <th><input type="text" value="${spList.PName}"> </th>
									<th ><font size="3">이메일</font></th><th><input type="text"  value="${spList.email}"></th>
									<th ><font size="3">교수 연락처</font></th>	 <th><input type="text" value="${spList.PPhone} " > </th>
								</tr>
								
					</table>
		
		<br/>

					<table align="center" bgcolor="#d2d2d2" width="100%"  class="ns">

								
										<tr  width="200">
												<th><font size="3">수강학과</font></th>	 <th><input type="text" value="${spList.MName}"></th>
												<th ><font size="3">수강학부</font></th>	 <th><input type="text" value="${spList.DName}"> </th>
												<th ><font size="3">강의실</font></th>	 <th><input type="text" value="${spList.lrName}" ></th>
												<th ><font size="3">교재</font></th>	 <th><input type="text" value="${spList.book}"  size=20></th>
										</tr>
										<tr>				
														
											<th ><font size="3">강의코드</font></th>	 <th><input type="text" value="${spList.LNum}"  size=20></th> <th>-<input type="text" value="${spList.dividenum}"  size=20> </th>
											<th></th>
											<th><font size="3">강의 시간</font></th>	 <th colspan="3" ><input type="text" style="width:470px" value="${spList.schedule}" ></th>
											
										
									</tr>
									<tr>				
														
											<th ><font size="3">학점</font></th>	 <th><input type="text" value="${spList.credit}"  size=20></th>
											<th><font size="3">대상학년</font></th>	 <th><input type="text" value="${spList.grade}"  size=20> </th>
											<th ><font size="3">정원</font></th>	 <th><input type="text" value="${spList.newlimitCount}"  size=20></th>
											<th><font size="3">이수구분</font></th>	 <th><input type="text" style="width:200px;" value="${spList.division}" size=20> </th>
									</tr>
									
					</table>
	
		<br/>
		<form action="studyPlanInsert" method="post" id="frm2" name="frm2" >
		<sec:csrfInput/>
		<input type="hidden" name="opennum" value="${spList.opennum}">
		
					<label>#과목개요는 필수 입력 사항입니다</label>
					<table width="100%"  align="center" bgcolor="#d2d2d2" class="ns">						
							
									<tr>					
											<th>	<p align="left"> &nbsp; 1. 교과목 개요</p> </th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="content" id="limit" rows="3" style="resize: none;width:99%;" ></textarea></td>						 
 
										
										
									</tr>					
					</table>
								
		<br/>
		<br/>
					<label class="ns">3. 주차별 강의 진행 과정 <span style="color:#aaa;"> (최대 300자) </span></label>
					<table width="100%" bgcolor="#d2d2d2" class="ns">						
							
							<br>
							
									<tr>					
											<th>	<p align="left"> &nbsp;  1주차 강의</p></th>
									</tr>					
									<tr height="20">					
										<td><textarea name="w1" rows="3"  style="resize: none;width:99%;"></textarea></td>				
									</tr>					
							
					<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  2주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w2" rows="3"  style="resize: none;width:99%;"></textarea></td>						
									</tr>					
									
									<tr></tr>
									
								<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  3주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w3" rows="3"  style="resize: none;width:99%;"></textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  4주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w4" rows="3"  style="resize: none;width:99%;"></textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  5주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w5" rows="3"  style="resize: none;width:99%;"></textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  6주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w6" rows="3"  style="resize: none;width:99%;"></textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  7주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w7" rows="3"  style="resize: none;width:99%;"></textarea></td></tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  8주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
												<td><textarea placeholder="중간고사 기간" name="w16" rows="3"  style="resize: none;width:99%;"></textarea></td>				
									
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  9주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w9" rows="3"  style="resize: none;width:99%;"></textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  10주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w10" rows="3"  style="resize: none;width:99%;"></textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  11주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w11" rows="3"  style="resize: none;width:99%;"></textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  12주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w12" rows="3"  style="resize: none;width:99%;"></textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  13주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w13" rows="3"  style="resize: none;width:99%;"></textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  14주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w14" rows="3"  style="resize: none;width:99%;"></textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  15주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea name="w15" rows="3"  style="resize: none;width:99%;"></textarea></td>						
									</tr>					
									<tr></tr>
										
									<tr>					
											<th>	<p align="left"> &nbsp;  16주차 강의</p></th>
									</tr>					
														
									<tr height="20">					
										<td><textarea placeholder="기말고사 기간" name="w16" rows="3"  style="resize: none;width:99%;"></textarea></td>						
									</tr>					
									
									
								
								
								
								
								
								</table>
								
								
	
																					<h3 align="center">
								
									<button type="button" class="ns" onclick="sub()">●등록</button>
									<input type="reset"  class="ns" value="● 취소" >
									<input type="button" class="ns" name="back" value="● 뒤로가기" onClick="location.href='studyPlanList'">
								</h3>
								</form>
</div>


	
</div>

</body>
</html>






							
							
							
							
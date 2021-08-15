<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과제 제출 :: No.M University</title>
<style>
.menu01 {
				width:100%;
				height: 80px;
			    padding: 1em;
			    margin-left: -40px;
				}
				.menu01 ul li{
					list-style-type:none;
					float:left;			
					margin-left:20px;
					font-weight:bold;		
				}
				.modalBtn{ 
				margin-left: -30px;
		  border-radius: 1em;
		    background-color: lightpink;
		    color: white;
		    padding-left: 2em;
		    padding-right: 2em;
		    padding-top: 8px;
		    padding-bottom: 5px;
		    font-size: 20px;
		    border: none;
	     	}
	     	.hwSTable th{
	     	    background-color: linen;
	     	    text-align:center;
	     	}	
	     	.hwSTable td{
	     		padding:1em;
	     	}
	     	.submitBtn{
	     	    background-color: wheat;
    			border-radius: 1em;
    			    margin-left: 400px;
	     	}
</style>
</head>
<body>
<div class="content-page">
<!-- 현재날짜 -->
<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss" /></c:set> 
		<div class="menu01">		
				<ul>
					<li><a class="modalBtn" href="hwStudent">과제 메인페이지 이동</a></li>			
				</ul>		
		</div>
		<c:forEach items="${result }" var="list">
			<div class="" style="width:800px;    margin: auto;">
			
				<br>
				<h6> * 과제정보 *</h6>
				<br>
				<table	class="hwSTable" border="1" style="border-collpase:collpase;width:800px;">
					
						<tr>
							<th width="130px;">제출 기간</th>	 <td><fmt:formatDate value="${list.registerDate }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${list.pperiod }" pattern="yyyy-MM-d"/></td>
						</tr>
						<tr>
							<th> 과제제출양식<br> (첨부파일) </th> 	<td>${list.registerFile }</td>
						</tr>
					
				</table>
			</div>
			<div  style="width:800px;    margin: auto;">
				<br>
				<h6> * 과제정보 *</h6>
				<br>
				<form id="hwSSubmitFrm" name="hwSSubmitFrm" action="hwSSubmit" method="post" enctype="multipart/form-data">
				<sec:csrfInput/>
					<input type="hidden" id="registerId" name="registerId" value="${list.registerId }">
					<input type="hidden" id="scomment" name="scomment">
					<table	class="hwSTable" border="1" style="border-collpase:collpase;width:800px;">
						<tr style="border-top: 2px solid orange;">
							<th width="130px"> 교수님께 한마디 </th>	<td> <textarea id="scomment" name="scomment" style="border:none;" rows="5" cols="90" placeholder="교수님께 하실말이 있으시면 글을 남겨주세요."></textarea></td>
						</tr>
						<tr>
							<th width="130px"> 첨부파일 </th>	<td> <input type="file" id="file" name="file"></td>
						</tr>
						<tr>
							<th width="130px"> 제출날짜 </th>	<td> <input type="text" value="${date }" disabled></td>
						</tr>
					</table>
					<br>
						<button class="submitBtn" type="button" onclick="submitFunc();">제출하기</button>
				</form>
			</div>
		</c:forEach>
		
		<script>
	function submitFunc(){
				var a=$("#scomment").val();
				var b=$("#file").val();
				console.log(b);
				console.log(a);
				hwSSubmitFrm.scomment.value=a;
				if(b == ""){
						alert("첨부파일을 등록해주세요.");
							}else{
									if(confirm("제출하시겠습니까?")==true){
											alert("제출완료!");
											hwSSubmitFrm.submit();
										}else{
											return false;
											}	
								}	
					
						}
		</script>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE HTML>
<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<META charset="UTF-8">
<head> 
	<title>(교수)과제</title>
	<style>
		.box1{
		padding:1em;
		height:500px;
		}
		.hwTable1{
		width:100%;
		border:1px solid gray;
		height:300px;
		}

		.hwContainer{
			    margin-top: 100px;
		}
		.HwSearch{
			padding: 1em;
		    border-radius: 3em;
		    width: 570px;
			border:1px solid gray;
		}
		
			.menu01 {
				height: 30px;
			    margin-top: -30px;
			    padding: 1em;
			    margin-left: -40px;
				}
				.menu01 ul li{
					list-style-type:none;
					float:left;			
					margin-left:20px;
					font-weight:bold;		
				}
		 .trC{
		 background-color:white;
		 }
		 .modalBtn{ 
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
		.modal_close{
			    border-radius: 1em;
			    background-color: darkslategrey;
			    color: white;
			    font-family: sans-serif;
			    font-weight: bold;
			    padding-left: 1.5em;
			    padding-right: 1.5em;
			    padding-top: 8px;
			    padding-bottom: 8px;
			    font-size: 20px;
			    border: none;
		}	
		.modal{ 
		 position: absolute;
		    width: 80%;
		    height: 600px;
		    background: rgba(0,0,0,0.6);
		}
		.modal_container{
			
		}
		.modal_head{
			height:100px;
			border:1px solid black;
		}
		.modal_content{
			height:450px;
		
		}
		.modal_footer{
		
   		 margin-left: 700px;		
		}
	</style>
		<!-- 모달 -->
					<script>
					$(function(){ 
						  $(".modalBtn").click(function(){
						    $(".modal").fadeIn();
						  });
						  
						  $(".modal_close").click(function(){
						    $(".modal").fadeOut();
						  });
						  
						});
					</script>
</head>
<body>
			<div class="menu01">		
				<ul>
					<li><button type="button" class="modalBtn" onclick="modalFunction();" >Update</button></li>
				</ul>
					
					<div class="modal" style="display:none;">
					  <div class="modal_container" > 		
					  		<div class="modal_head">
					  		
					  		</div>
					  		
					  		<div class="modal_content">
					  		
					  		</div>
					  		
					  		<div class="modal_footer">
					  			<button type="button" class="modal_close">CLOSE</button>
					  		</div>
					  </div>
					</div>
				
			</div>
		<div class="box1">			
			<!-- TEST -->
			<ul></ul>
			<h3> ' ' 교수님 등록한 과제 LIST</h3>	
			<!-- 강의년도 / 강의학기  설정하면 해당하는 강의명만 나오도록 -->
			<!-- 년도,학기,강의명 별,진행중,마감 select 설정 -->
			<div class="HwSearch">		
				<form id="frmHw" name="frmHw"  method="post">
				<sec:csrfInput/>
					<input type="hidden" id="ye" name="ye">
					<input type="hidden" id="te" name="te">
					<input type="hidden" id="ln" name="ln">
					  
						<label for="lyear">강의년도:</label>						
							<select name="lyear" id="lyear">			
									<option value="2021" selected="selected">2021</option>  
								<c:forEach items="${ySelect}" var="ySelect">
									  <option value="${ySelect.lyear }"	<c:if test="${ySelect.lyear==param.lyear }"> selected="selected"</c:if>>${ySelect.lyear }</option>
									 
								 </c:forEach>	 
							</select>
								
						<label for="term">강의학기:</label>
							<select name="term" id="term">
							  <option value="">선택</option>	
							  <option value="1" <c:if test="${param.term==1 }"> selected="selected"</c:if>>1학기</option>
							  <option value="2" <c:if test="${param.term==2 }"> selected="selected"</c:if>>2학기</option>
							</select>
							
						<label for="lnum">강의명:</label>
							<select name="lnum" id="lnum">
							<option value="">선택</option>	
							  <c:forEach items="${lName}" var="lName">
									  <option value="${lName.lnum }" 
									  <c:if test="${lName.lnum==param.lnum }"> selected="selected"</c:if>
									  > ${lName.lname } </option>	
								 </c:forEach>	 
							</select>
						<span> 
						
							<button type="button" onclick="selectSubmit();">검색</button>
							<button type="button" onclick="resetFunction();">초기화</button>
						</span>
				 </form>
			 </div>	
			 			<script>
			 				function selectSubmit(){
			 					var a=$("#lnum option:checked").text();	
				 				frmHw.ln.value=a;
				 				frmHw.submit();
			 				}
			 				
			 			</script>
						 <div>					 
				 			<h4> 			 			
				 				<c:choose>
					 				<c:when test="${reName eq '선택'}">
					 					<span style="color:brown;">'  ${reYear } 년   ${reTerm }  학기  '  </span>로 검색한 결과..
					 				</c:when>		
				 					<c:otherwise>
				 						<span style="color:brown;">'Default : 2021  ${reYear } 년  ${reTerm }  학기   ${reName } '  </span>로 검색한 결과..
				 					</c:otherwise>
				 				</c:choose>
				 			</h4>
						</div>
						<div>
							
				 		</div>
				<br>

			
			<div class="hwTable1">
				<table BORDER="1" style="width:100%;text-align:center;">
					<tr>
						<th>강의년도</th>	
						<th>강의학기</th>	
						<th>강의명</th> 
						<th>강의실코드</th>
						<th>과제제목</th>		
						<th>등록날짜</th> 
						<th>과제기간</th>		
						<th>양식파일</th>			
						<th>제출현황</th>	
						<th> 조희</th>
					</tr>
					<c:forEach items="${result}" var="list">
					<c:set var="count" value="${count +1 }"></c:set>
					<tr id="trSelect"><!--${count }  -->
						 <td>${list.lyear }년</td>  <td>${list.term }학기</td>	<td>${list.lname }</td> <td>${list.lrcode }</td>
						 <td style="text-align:center;"> <span style="color:red;">( ' - ' )</span></td>
						 <td><fmt:formatDate value="${list.register_date }" pattern="yy.MM.d HH:mm" /> </td> 
						 <td>~<fmt:formatDate value="${list.pperiod }" pattern="yy년MM월d일 HH시mm분"/>까지 <br>
						 <!-- 진행중 ,마감 (음수,양수값으로) -->
						 <c:if test="${list.hwstatus > 0 }">
						 <span style="color:red;">진행중</span>
						  </c:if>
						  <c:if test="${list.hwstatus <= 0}">
						  <span style="color:blue;">마감</span>
						  </c:if>
						 </td> 						
						 <td>${list.register_file }</td>	       
						  <td>
						  <span style="color:red;">${list.submitCount }</span>
						  /
						  <span style="font-weight:bold;">${list.newlimitcount }</span>
						  </td>	
						  <!-- 교수가 올린과제의 제출학생 리스트 출력 -->
						  <td> 
						  	<button type="button" id="inquiry" onclick="test();" data-id="${list.register_id}" data-num="${list.opennum }">조회</button>
						  <!-- <button type="button" onclick="inquiry('${list.register_id}')">조회</button> -->			  		  	
						  </td>
					</tr>
					</c:forEach>
				</table>
					 <!--  register_id 값을 넘겨서 hw_student에서 중복된값을 가져와서 과제제출 목록리스트 뜨게하기 -->
						<!-- 클릭시 클릭한 것 강조표시 -->
						<script>
					//과제제출 조회요청(클릭시)
							$(".hwTable1").on("click","#inquiry",function(){
								//$(event.target).closest('tr').toggleClass("trC");	
								//tr클래스 css적용되어있는것을 삭제한후
								$(".trC").css("backgroundColor", "white");
								$(".trC").removeClass("trC");
								//클릭한 값의 css를 추가한다.
								$(event.target).closest('tr').addClass("trC");
								$('.trC').css("backgroundColor","beige");
								//$(event.target).closest('tr').removeClass("trC");
								$(this).data('id'); //
								var a= $(this).data('id');
								var b= $(this).data('num');
								$.ajax({
									type:"post",
									url:"inquiry",
									data:{ 
										registerId :a,
										opennum :b
										},
									dataType:"json",
									success: function(data){		
										$("tfoot").empty();		
										$(".noSubmit").empty();
										//$('<form name="selectFrm" id="selectFrm">')
										$('<select name="submitList" id="submitList" onChange="check(this);" style="width: 100px;height:30px;margin-left: 25px;margin-top: 20px;">')
										.append($('<option value="submitAll">전체보기</option>'))
										.append($(' <option value="submit">제출자</option>'))
										.append($('<option value="noSubmit">미제출자</option>">'))
										.append($('</select>>'))	
										.appendTo('.noSubmit');		
										//$('</form>')
										$('<h4 style="color:brown; float:left;"> 목록 선택 </h4>').appendTo('.noSubmit');
											for(var i of data){
											var a="";
											var c="";
											var d="";
											var e="";
											var f="";
											//과제 미제출자일때 조건
											if(! i.registerId  ){
												a=' class="unsubmit"';
												b=' style="visibility:hidden;"';
												c=' colspan="6" style="color:red;"';
												d=' style="display:none;"'
												e=' 과제 미제출자';
												
											}else{								
													a=' class="submit"';	
													f=' style="background-color: lavender;"'
											}
											//submit_file undefined hide
											if(! i.submit_file ){
												i.submit_file="";
											}
											$('<tr id="tr1"'+a+'>')
											.append($('<td>').html(i.submitSid))		
											.append($('<td '+f+'>').html(i.name))
											.append($('<td id="tdN"'+c+'>').html(i.submit_file+e))
											.append($('<td'+d+'>').html(i.submit_date))
											.append($('<td'+d+'>').html(i.s_comment))
											.append($('<td'+d+'>').html(i.score))
											.append($('<td id="sc"'+d+'>').html())	
											.append($('<td id="scIn"'+d+'>').html('<input type="hidden" id="setRid" value="'+i.registerId+'"><input type="number" maxlength="2" oninput="maxLengthCheck(this)"'+b+'style="width:80px;"><button type="button"'+b+'class="scoreBtn" onclick="scoreIn();">IN</button>'))										
											.appendTo('tfoot');
											//if(('#setRid')!=null){
											//	console.log('b');		
											//	console.log(a);
											//}
											
										}
									},
									error: function(error){
										alert("error");
									}
								});
							});
					
					//점수IN
					function scoreIn(){	
					    	//$(".scoreBtn").on("click", function(){
					       		//var a=$(this).prev().val();
					       		var a=$(event.target).prev().val();	
					       		if(a>20){
					       			alert('20점미만 입력가능');
					       		}else{
						       		frmScoreIn.score.value=a;
						       			var b=$(event.target).closest('tr').find('td').eq(0).html();
						       			var d=$(event.target).closest('tr').find('td').eq(1).html();
									frmScoreIn.submitSid.value=b;
										var c=$(event.target).prev().prev().val();
									frmScoreIn.registerId.value=c;
									if(confirm('* '+d+' *'+" 학생 \n 점수 :      [ "+a+" ]  점 "+"입력하시겠습니까?")==true){
										frmScoreIn.submit();
									}else{
										return false;
									}
								
					       		}
					    //});
							
					}
							
							//var b=$('#scoreIn').val();`
							//var c=$('.scoreIn').val();
							//var a=$(event.target).closest('tr').find('td').eq(0).html();
						
			
					
					</script>
						
			
			</div>
		</div>
		<div class="hwContainer">
		<h3> 조회목록</h3>
		<div class="noSubmit">
		
			<!-- select option  -->
			<script>
				function check(e){
				if(e.value=="submitAll"){
						$('.unsubmit').show();
						$('.submit').show();
					}else if(e.value=="submit"){
						$('.submit').show();
						$('.unsubmit').hide();
					}else if(e.value=="noSubmit"){
						$('.submit').hide();
						$('.unsubmit').show();
					}
				}
			</script>
		</div>
		<!-- submit_SID값으로 학생정보 가져오기 -->
			<div class="hwTable2">
				<table border="1" style="width:100%; text-align:center;">
					<tr>
						<th>학생학번</th>	<th>학생이름(SNAME)</th>	 <th>제출파일</th>	
						<th>제출날짜</th>	<th>학생코멘트</th>	<th>점수</th>		<th>점수IN</th>
					</tr>
					<tfoot></tfoot>
				</table>
			</div>
		</div>
		
		<!--과제제출한 학생리스트 점수in 값 저장  -->
		<form id="frmScoreIn" method="post" action="scoreIn">
		<sec:csrfInput/>
			<input type="hidden" id="registerId" name="registerId">
			<input type="hidden" id="score" name="score">
			<input type="hidden" id="submitSid" name="submitSid">
		</form>
			<!-- 점수 IN MEXLENGTH -->
			<script>
			function maxLengthCheck(object){
			    if (object.value.length > object.maxLength){
			      object.value = object.value.slice(0, object.maxLength);
			    }    
			  }
			</script>
		<!-- 검색조건 초기화 function -->
		<script>
		function resetFunction(){
			$("#lyear option:eq(0)").prop("selected",true);
			$("#term option:eq(0)").prop("selected",true);
			$("#lnum option:eq(0)").prop("selected",true);
			frmHw.submit();
		}
		</script>
</body>
</html>
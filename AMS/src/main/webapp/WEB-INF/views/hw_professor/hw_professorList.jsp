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
		margin-top:70px;
		width:100%;
		height:300px;
		}

		.hwContainer{

		}
		.HwSearch{
			padding: 1em;
		    border-radius: 3em;
		    width: 570px;
			border:1px solid gray;
		}
		.tui-grid-cell .tui-grid-cell-content {
    text-align: center;
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
		.modalBtn2{ 
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
		 /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 70%;
    		height: 500px; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
	</style>
	<!-- Toast grid -->
	<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
	<link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
	<script type="text/javascript" src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.js"></script>
	<script src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
			<div class="menu01">		
				<ul>
					<li><a class="modalBtn" href="hwList">과제 페이지</a></li>
					<li><a class="modalBtn" href="hwPfInsert" >등록 페이지</a></li>
					
				</ul>
			
				
			</div>
		<div class="box1">			
			<!-- TEST -->
			<ul></ul>
			<h3> ' ' 교수님 과제조회</h3>	
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
						 <br><br>			 
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
	 
		    <!-- The Modal -->
		    <div id="myModal" class="modal">
		 
		      <!-- Modal content -->
		      <div class="modal-content">
		        <span class="close">&times;</span>                                                               
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
													<table border="1" style="width:100%; text-align:center;">
															<tr>
																<th>학생학번</th>	<th>학생이름(SNAME)</th>	 <th>제출파일</th>	
																<th>제출날짜</th>	<th>학생코멘트</th>	<th>점수</th>		<th>점수IN</th>
															</tr>
															<tfoot></tfoot>
														</table>
								</div>
		       	
		      </div>
		 
		    </div>
			<!-- MODAL HTML END-->
			
			<!-- MODAL SCRIPT -->
			
			<script>
			  // Get the modal
	        var modal = document.getElementById('myModal');
	 
	        // Get the button that opens the modal
	        var btn = document.getElementById("myBtn");
	 
	        // Get the <span> element that closes the modal
	        var span = document.getElementsByClassName("close")[0];                                          
	 
	        // When the user clicks on the button, open the modal 
	       // btn.onclick = function() {
	        	$(".hwTable1").on("click","#inquiry",function(){
	            modal.style.display = "block";
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
	 
	        // When the user clicks on <span> (x), close the modal
	        span.onclick = function() {
	            modal.style.display = "none";
	        }
	 
	        // When the user clicks anywhere outside of the modal, close it
	        window.onclick = function(event) {
	            if (event.target == modal) {
	                modal.style.display = "none";
	            }
	        }

			</script>
			
			<!-- model end -->
			<div id="grid" ></div>
			<script>
					  		//grid start
					  		
					  				var clsData = [
								<c:forEach items="${result }" var="list">
								{
									lyear: '${list.lyear}', lterm: '${list.term}', lname : '${list.lname}',
									lrcode: '${list.lrcode}', pcomment: '${list.pcomment}', register_date: '<fmt:formatDate value="${list.register_date }" pattern="yy.MM.d HH:mm" /> ',
									pperiod: '<fmt:formatDate value="${list.pperiod }" pattern="yy년MM월d일 HH시mm분"/>까지 <c:if test="${list.hwstatus > 0 }"><br><span style="color:red;">진행중</span> </c:if><c:if test="${list.hwstatus <= 0}"><br><span style="color:blue;">마감</span></c:if>'
									, register_file: '${list.register_file}' ,submitCount:'<span style="color:red;">${list.submitCount }</span>&nbsp;/&nbsp;<span style="font-weight:bold;">${list.newlimitcount }</span>'
									,inquiryBtn:'<button type="button" id="inquiry" data-id="${list.register_id}" data-num="${list.opennum }">조회</button> '
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
					  				{header: '강의년도',name: 'lyear',width:100},
					  				{header: '학기',name: 'lterm',width:60}, //강의번호+분반
					  				{header: '강의명',name: 'lname',width:90}, //년도+학기
					  				{header: '강의실',name: 'lrcode',width:80},
					  				{header: '교수코멘트',name: 'pcomment'},
					  				{header: '등록날짜',name: 'register_date',width:140},
					  				{header: '과제기간',name: 'pperiod',width:220},
					  				{header: '양식파일',name: 'register_file',width:200},
					  				{header: '제출현황',name: 'submitCount',width:120},
					  				{header: '조회',name: 'inquiryBtn',width:120}
					  			], //컬럼갯수
					  			data: clsData
					  		} );
						
								
							
								
					  			</script>
					
					<!-- 과제 클릭시 해당과제제출 학생리스트 출력 
					<script>
					$(".hwTable1").on("click","#inquiry",function(){
						

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
					
					});
					</script>-->
					  			
					  			
					  			
				
				
					 <!--  register_id 값을 넘겨서 hw_student에서 중복된값을 가져와서 과제제출 목록리스트 뜨게하기 -->
						<!-- 클릭시 클릭한 것 강조표시 -->
						 <script>
					<!--//과제제출 조회요청(클릭시)
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
					-->
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
<!-- 
<!--  
				
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
					<tr id="trSelect">
						 <td>${list.lyear }년</td>  <td>${list.term }학기</td>	<td>${list.lname }</td> <td>${list.lrcode }</td>
						 <td style="text-align:center;"> <span style="color:red;">( ' - ' )</span></td>
						 <td><fmt:formatDate value="${list.register_date }" pattern="yy.MM.d HH:mm" /> </td> 
						 <td>~<fmt:formatDate value="${list.pperiod }" pattern="yy년MM월d일 HH시mm분"/>까지 <br>
						 <!-- 진행중 ,마감 (음수,양수값으로) 
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
						  <!-- 교수가 올린과제의 제출학생 리스트 출력 
						  <td> 
						  			  	
						  </td>
					</tr>
					</c:forEach>
				</table>
				-->

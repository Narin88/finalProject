<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE HTML>
<html>
<head>
<META charset="UTF-8">
<head> 
	<title>(교수)과제</title>
	<style>
	.noSubmit2{ 
		text-align:center;
		margin:auto;
		background-color:aliceblue;
 		 border-collapse: collapse;
		  border-radius: 10px;
 		border-style: hidden;
  		box-shadow: 0 0 0 0.1px #000;
    border: none;
		
	}
	.noSubmit2 th{					
	}
	.noSubmit3{
		text-align:center;
		margin:auto;
	}
	.noSubmit3 th{
		color:red;
	}
	.tui-grid-border-line-top {
    border: none;
    }
		
		.box1{
		padding:1em;
		height:700px;
		margin-left:280px;
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
		    width: 700px;
			border:1px solid gray;
		}
		.tui-grid-cell .tui-grid-cell-content {
    text-align: center;
}
			.menu01 {
				height: 30px;
			    padding: 1em;
			    margin-left: 200px;
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
        .modalEE {
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
    		height: 700px; /* Could be more or less, depending on screen size */                          
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
         /* The Modal (background) */
        .modal2 {
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
        .modal-content2 {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
    		height: 300px; /* Could be more or less, depending on screen size */                          
         }
         .close2 {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close2:hover,
        .close2:focus {
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
</head>
<body>

			<div class="menu01">	
				<ul>
					<li><a class="modalBtn" href="hwList">과제 페이지</a></li>
					<li><a class="modalBtn" href="hwPfInsert" >등록 페이지</a></li>
				</ul>
			<!--  -->
									<c:forEach items="${list }" var="data">
										${data }
									
									</c:forEach>
				
			</div>
			<div>
			<button type="button" id="download">버튼</button>					
			
			</div>
			<script>
			$("#download").click(function(){
	            
			    var filePath = "C:/tmp/test.txt";
			    var fileName = "test.txt";
			                
			    location.href = "fileDownload?filePath="+filePath+"&fileName="+fileName;
			    
			});

			</script>
		<div class="box1">				
		<br>
			<h5> ' ' 교수님 과제조회</h5>	
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
						 <br>		 
				 			<h4> 			 			
				 				<c:choose>
				 					<c:when test="${reTerm eq '선택'}">
					 					<span style="color:brown;">' ${reYear } 년   ${reTerm }  학기  '  </span>로 등록된 과제 목록
					 				</c:when>
					 				<c:when test="${reName eq '선택'}">
					 					<span style="color:brown;">' ${reYear } 년    ${reTerm }  학기  '  </span>로 등록된 과제 목록
					 				</c:when>		
				 					<c:otherwise>
				 						<span style="color:brown;">'  ${reYear } 년  ${reTerm }  학기   ${reName } '  </span>로 등록된 과제 목록
				 					</c:otherwise>
				 				</c:choose>
				 			</h4>
						</div>
						<div>
							
				 		</div>
				<br>
			
			
			<div class="hwTable1">
	 		<div id="grid" ></div>
		    <!-- The Modal -->
		    <div id="myModal" class="modalEE">
		 
		      <!-- Modal content -->
		      <div class="modal-content">                                                             
			<div class="hwContainer">
							 <span class="close">&times;</span>  
								<div class="noSubmit">

									<!-- select option  -->
									<script>
										function check(e){
										if(e.value=="submitAll"){
											
												$('.unsubmit').show();
												$('.submit').show();
											}else if(e.value=="submit"){
											var a=	$('#grid2').data('column-name');
											console.log(a);
												$('.submit').show();
												$('.unsubmit').hide();
											}else if(e.value=="noSubmit"){
												$('.submit').hide();
												$('.unsubmit').show();
											}
										}
									</script>
								</div>
								
								
							
   								  <div id="select-box" style="width: 200px"></div>
   								  <button style="float:right;margin-top: -5px; margin-right: 30px;"type="button" id="selectDelBtn">삭제</button>
   								  <button style="clear:both;float:right;margin-right: 100px;margin-top: -42px;" id="selectScoreBtn"">점수정정</button>
								<div id="grid2"></div>
								
								<!-- submit_SID값으로 학생정보 가져오기 -->
								 <br>
													
														
														<br>
														<!-- <button type="button" id="delete" style="margin-left: 480px;">선택삭제</button> -->
								</div>
		       	
		      </div>
		 
		    </div>
		    
		
		    	
		    
		    <!--테이블 페이징 -->
<!-- 		    <script>
		    function scoreBtn(){
		    	console.log("ㅎ냥ㅎㄴㅇㅎ");
		    }
		    </script> -->
		    
		    
		    
			<!-- MODAL HTML END-->
			
			
			<!-- The Modal -->
		    <div id="myModal2" class="modal2">
		 
		      <!-- Modal content -->
		      <div class="modal-content2">      
		      <span class="close2">&times;</span>                                                         
			<div class="hwContainer">
								<div class="" style="border-radius:10px;">
									<h4 align="center">과제변경전</h4>
									<table border="1" class="noSubmit2" >
									</table>
								</div>
								<form action="hwUpdate" id="udFrm" name="udFrm" method="post" enctype="multipart/form-data" >
								<sec:csrfInput/>
								<input type="hidden" id="pperiod" name="pperiod">
								<input type="hidden" id="pcomment" name="pcomment">
								<input type="hidden" id="registerId" name="registerId">
								<div class="" style="    margin-top: 60px;">
									<table border="1" class="noSubmit3" >
						
									</table>
									
									
								</div>
								</form>
							</div>
		       	
		      </div>
		 
		    </div>
			<!-- MODAL HTML END-->
			
		
			<script>
			    
			$(".hwTable1").on("click","#hwDelete",function(){
			var a=	$(this).data('id');
			var b= $(this).data('num');
				console.log(a);
				hwPfDeleteFrm.registerId.value=a;
				
				if(confirm(' * '+b+' '+' * ' + '삭제 하시겠습니까 ?')==true){
					alert("삭제가 완료되었습니다.");
					hwPfDeleteFrm.submit();
				}else{
					
					return false;
				}
				
				
			});
			
			
			
			
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
				
				var count=$(this).data('count');
				console.log(count);
				
				
				var checkVal=0;
				$.ajax({
					type:"post",
					url:"inquiry",
					data:{ 
						registerId :a,
						opennum :b
						},
					dataType:"json",
					success: function(data){	
						$("#grid2").empty();
						$("tfoot").empty();		
						$(".noSubmit").empty();
						//$('<form name="selectFrm" id="selectFrm">')
					/*	$('<select name="submitList" id="submitList" onChange="check(this);" style="width: 100px;height:30px;margin-left: 25px;">')
						.append($('<option value="submitAll">전체보기</option>'))
						.append($(' <option value="submit">제출자</option>'))
						.append($('<option value="noSubmit">미제출자</option>">'))
						.append($('</select>>'))		
						.appendTo('.noSubmit');		
						//$('</form>')*/
						$('<h4 style="color:brown; float:left;"> 제출학생 리스트 </h4>').appendTo('.noSubmit');
						$('<h6 style="color:gray; float:left;margin-left:30px;"> 점수를 정정하면 성적에 반영됩니다. </h6>').appendTo('.noSubmit');
					
						
						
					
					
					
					//grid start
			  					
					
							//제출한 학생과제 삭제 delete & 점수 수정 update
							//grid api-source
							const dataSource = {
							  withCredentials: false,  
							  initialRequest: false,
							  contentType: 'application/json',
							  api: {
								readData: {},
								deleteData: {
									url: 'hwSubmitDel',
									method: 'PUT'
									},
							    updateData: {
							      url: 'scoreIn', //점수 기능
							      method: 'PUT' //funtion 메서드
							    }
							    
							  }
							};
					
					
			
					
	  			
					
						
			  				 // GRID 를 보여준다.
				  			var grid = new tui.Grid( {
				  				data:dataSource,
				  				rowHeaders: ['checkbox'],	
				  				bodyHeight:430,
								el: document.getElementById('grid2'),
								pagination: true,   //페이징 처리
							    pageOptions: {
							    	useClient: true,   //페이징 처리
							    	perPage: 10   //페이징 갯수
							    }
								,
					  			columns: [
					  				{header: '학생학번',name: 'submitSid',width:100},
					  				{header: '학생이름',name: 'name',width:100},
					  				{header: '제출파일',name: 'submit_file',width:280},
					  				{header: '제출날짜',name: 'submit_date',width:140},
					  				{header: '학생코멘트',name: 's_comment'},
					  			//	{header: '강의번호',name: 'opennum'},
					  				{header: '점수',name: 'score',width:70,editor:'text'},
	
					  			], //컬럼갯수
				  		
				  		    } );
							//grid end
			  				 
			  				 
			  				 
			  		
			  			grid.resetData(data)
			  			
			  			setInterval(eachTest , 500);
							
						function eachTest(){	
				  			$('[data-column-name="submit_file"]').each(function(index, item){
				  				if($(this).text()==""){
				  			
				  					$(this).html("<p align='center' style='color:red;'>과제 미제출자</p>");
				  				}if($(this).text()=="제출파일"){
				  					$(this).html("<p align='center' style='color:red;'>과제 미제자</p>");
				  				}else{
				  					$(this).html("<p align='center' style='color:red;'>과제 자</p>");
				  				}
				  				
				  					
				  			});			  			
						}	
						
			  			//삭제 버튼 누를때  함수 실행
			  			document.getElementById('selectDelBtn').addEventListener('click', hwSubmitDel);
						
						//점수정정 버튼 누를때 함수 실행
						document.getElementById('selectScoreBtn').addEventListener('click', scoreIn);
			  		   
						
						//과제제출한 학생 선택한 목록 처리
			  			function hwSubmitDel(){
		  				
		  			   		
		  					grid.removeCheckedRows(false);
		  					grid.request('deleteData', { checkedOnly: true  });
		  						 	 
		  				}
			  		    
			  			//작업중인 행들을 저장해줌
			  			function scoreIn(){
			  					
			  				
			  				const { rowKey, columnName } = grid.getFocusedCell();
			  			
			  				  if (rowKey && columnName) {
			  				    grid.finishEditing(rowKey, columnName);
			  				 
			  				  }
			  			
			  				  grid.request('updateData', {
			  				    checkedOnly: false
			  				  });
			  				  
			  				  
			  			}
			  		    
			  		    	  		    
			  		   
			  		  	// 업데이트 실행 이벤트
	  					grid.on('response', data => {
	  						  	
	  						  console.log('data : ', data);
	  					});
				
				
			  		  
			  		  
			  		  
			  		  
			  		  
						
							/*for(var i of data){
							var a="";
							var c="";
							var d="";
							var e="";
							var f="";
							//제출자일때 checkval 증가변수 
							if(i.registerId){
								checkVal++;
							}
							//과제 미제출자일때 조건
							if(! i.registerId  ){
								a=' class="unsubmit"';
								b=' style="visibility:hidden;"';
								c=' colspan="7" style="color:red;"';
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
							$('<tr id="tr1"'+a+' data-tr_value="'+checkVal+'">')
							//.append($('<td><input '+d+' type="checkbox" name="checkRow" value="'+checkVal+'"></td>'))
							.append($('<td>').html(i.submitSid))		
							.append($('<td '+f+'>').html(i.name))
							.append($('<td id="tdN"'+c+'>').html(i.submit_file+e))
							.append($('<td'+d+'>').html(i.submit_date))
							.append($('<td'+d+'>').html(i.s_comment))
							.append($('<td'+d+'>').html(i.score))
							.append($('<td id="sc"'+d+'>').html())	
							.append($('<td id="scIn"'+d+'>').html('<input type="hidden" id="setRid" value="'+i.registerId+'"><input type="number" maxlength="2" oninput="maxLengthCheck(this)"'+b+'style="width:80px;"><button type="button"'+b+'class="scoreBtn" onclick="scoreIn();">IN</button>'))										
							.append($('<td'+d+'>').html('<button type="button" onclick="hwDeleteFunc('+i.submitId+');">삭제</button>'))
							.appendTo('tfoot');

							
						}*/
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
			
	        
	        
	        
	        
	        
			//과제제출 학생 삭제 FUNCTION
			function hwDeleteFunc(a){
				$.ajax({
				type:"post",
				url:"hwSubmitDel",
				data:{
					submitId: a
		
				},
				dataType:"JSON",
				success:function(){
					if(confirm(' 삭제하시겠습니까 ? ')==true){
						alert("삭제가 완료되었습니다");
						alert("삭제 되었습니다");
						location.reload();
					}else{
						
						return false;
					}	
				
					
				}
				
				});
				
				
			}
			
			
			</script>
			
		
			
			
			
			</div>
			<script>
			
					  		//grid start
					  		
					  				var clsData = [
								<c:forEach items="${result }" var="list">
								{
									lyear: '${list.lyear}', lterm: '${list.term}', lname : '${list.lname}',
									lrcode: '${list.lrcode}', pcomment: '${list.pcomment}', register_date: '<fmt:formatDate value="${list.register_date }" pattern="yy.MM.dd HH:mm" /> ',
									pperiod: '<fmt:formatDate value="${list.pperiod }" pattern="yy년MM월dd일"/>까지<c:if test="${list.hwstatus > 0 }"><span style="color:red;margin-left:20px;">진행중</span></c:if><c:if test="${list.hwstatus <= 0}"><span style="color:blue;margin-left:20px;">마감</span></c:if>'
									, register_file: '${list.register_file}' ,submitCount:'<span style="color:red;">${list.submitCount }</span>&nbsp;/&nbsp;<span style="font-weight:bold;">${list.newlimitcount }</span>'
									,inquiryBtn:'<button type="button" id="inquiry" data-id="${list.register_id}" data-num="${list.opennum }" data-count="${list.submitCount}"">조회</button> '
									,deleteBtn:'<c:if test="${list.submitCount == 0}"><button type="button" id="hwDelete" data-id="${list.register_id}" data-num="${list.pcomment}">삭제</button></c:if> <c:if test="${list.submitCount > 0}"><span style="color: crimson;">삭제불가</span></c:if>'
										,updateBtn:'<button type="button" id="updateBtn" data-id="${list.register_id}" data-id2="${list.pperiod}" data-id3="${list.pcomment}" data-id4="${list.register_file}" data-id5="${list.lyear}" data-id6="${list.term}" data-id7="${list.lname}">변경</button>'
										,opennum:'${list.opennum}'
								},
								</c:forEach>
								]; //컬럼DATA	

					  		
					  	       // GRID 를 보여준다.
					  			var grid = new tui.Grid( {
					  				
					  				bodyHeight:250,
									el: document.getElementById('grid'),
									pagination: true,   //페이징 처리
								    pageOptions: {
								    	useClient: true,   //페이징 처리
								    	perPage: 5   //페이징 갯수
								    }
									,
					  			columns: [
					  				{header: '강의번호',name: 'opennum',width:70},
					  				{header: '강의년도',name: 'lyear',width:70},
					  				{header: '학기',name: 'lterm',width:60}, //강의번호+분반
					  				{header: '강의명',name: 'lname',width:90}, //년도+학기
					  				{header: '강의실',name: 'lrcode',width:80},
					  				{header: '과제제목',name: 'pcomment',width:200},
					  				{header: '등록날짜',name: 'register_date',width:140},
					  				{header: '과제기간',name: 'pperiod',width:180},
					  				{header: '양식파일',name: 'register_file',width:150},
					  				{header: '제출현황',name: 'submitCount',width:100},
					  				{header: '조회',name: 'inquiryBtn',width:100},
					  				{header: '삭제',name: 'deleteBtn',width:100},
					  				{header: '변경',name: 'updateBtn',width:100}
					  			], //컬럼갯수
					  			data: clsData
					  		} );
						
								
					  			grid.on('dblclick', ev => {
					  			
					  			
					        		//console.log('더블클릭!', ev.rowKey);
					        		var data = grid.getRow(ev.rowKey); //그리드 한 행의 전체값
					        		
					        		
					        	//	console.log(data); 	
					        	});
								
					  			</script>
				<script>
				

		

					$(".hwTable1").on("click","#updateBtn",function(){
						// Get the modal
						var a=$(this).data('id');
						var b=$(this).data('id2');
						var c=$(this).data('id3');
						var d=$(this).data('id4');
						var e=$(this).data('id5');
						var f=$(this).data('id6');
						var g=$(this).data('id7');
						udFrm.registerId.value=a;
					console.log(b);
					
					var dateStr=String(b);
					console.log(dateStr);	
					var year=dateStr.substring(0,4);
				//	console.log(year);
					var month=dateStr.substring(5,7);
					//console.log(month);
					var day=dateStr.substring(8,10);
				//	console.log(day);
					var resultDate=year+month+day;	
						
					
				        var modal = document.getElementById('myModal2');
				 
				        // Get the button that opens the modal
				        var btn = document.getElementById("myBtn2");
				 
				        // Get the <span> element that closes the modal
				        var span = document.getElementsByClassName("close2")[0];  
					
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
		            modal.style.display = "block";
						$('.noSubmit2').empty();	
						$('<tr class="updateTr">')
						.append($('<th width="100px;">강의년도</th>'))
						.append($('<th width="80px;">학기</th>'))
						.append($('<th width="170px;">강의명</th>'))
						.append($('<th width="200px;">제출기간</th>'))
						.append($('<th  width="250px;">과제제목</th>'))
						.append($('<th  width="170px;">양식파일</th>'))
					
						.append($('</tr>'))
						.appendTo('.noSubmit2');	
						$('<tr>')
						.append($('<td>'+e+'</td>'))
						.append($('<td>'+f+'</td>'))
						.append($('<td>'+g+'</td>'))
						.append($('<td>'+b+'</td>'))	
						.append($('<td>'+c+'</td>'))
						.append($('<td>'+d+'</td>'))
						.appendTo('.noSubmit2');		
						
						
						
						
						
						$('.noSubmit3').empty();
						$('<tr class="updateTr">')
						.append($('<th width="200px;">제출기간</th>'))
						.append($('<th  width="250px;">과제제목</th>'))
						.append($('<th  width="170px;">양식파일</th>'))
					
						.append($('</tr>'))
						.appendTo('.noSubmit3');	
						$('<tr>')	
						.append($('<td class="dateTd"><input type="text" id="startDate"  value="'+resultDate+'" disabled></td>'))	
						.append($('<td class="pcommentTd"><input tpye="text" id="pcoId" value="'+c+'" disabled></td>'))
						.append($('<td class="fileTd"><input type="file" id="file" name="file"></td>'))
						.append($('<td><button type="button" onclick="updateSubmit();">변경</button></td>'))
						.append($('<td class="updateReset"><button type="button">취소</button></td>'))
						.appendTo('.noSubmit3');		
		            
						
						$('.dateTd').on("click", function(){
			            	$('#startDate').attr("disabled",false);
			            	$('#startDate').attr("value",null);
			            });
						$('.pcommentTd').on("dblclick", function(){
			            	$('#pcoId').attr("disabled",false);
			            	$('#pcoId').attr("value",null);
			            });
						
						$('.updateReset').on("click", function(){
			            	$('#startDate').attr("disabled",true);
			            	$('#startDate').attr("value",resultDate);
			            	$('#pcoId').attr("disabled",true);
			            	$('#pcoId').attr("value",c);
			            });
						
						$.datepicker.setDefaults($.datepicker.regional['ko']); 
			            $( "#startDate" ).datepicker({
			                // changeMonth: true, 
			                 //changeYear: true,
			                // nextText: '다음 달',
			                 //prevText: '이전 달', 
			                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
			                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
			                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			                 dateFormat: "yymmdd",
			                 minDate:0,
			                 maxDate: 30,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
			                 onClose: function( selectedDate ) {    
			                      //시작일(startDate) datepicker가 닫힐때
			                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
			                     $("#endDate").datepicker( "option", "minDate", selectedDate);
			                 }    
			 
			            });
			            
			           
			            
				});
					function updateSubmit(){
					
						var a=$('#startDate').val();	
						var year=a.substring(0,4);
						var month=a.substring(4,6);
						var day=a.substring(6,8);
						var resultDate=year+'-'+month+'-'+day;
						
						var date= new Date(resultDate);
					//	var year=a.substring(0,4);
					//	console.log(year);
					//	var month=a.substring(5,7);
						//console.log(month);
					//	var day=a.substring(8,10);
					//	console.log(day);
					//	var resultDate=year+'-'+month+'-'+day;
						//console.log(resultDate);
						var date= new Date(resultDate);
						
						console.log(date);
						udFrm.pperiod.value=date;
						
	
					var b=$("#pcoId").val();
					udFrm.pcomment.value=b;
					var filen=$('#file').val();
					console.log(filen);
					if(filen == ""){
						alert("파일을 입력해주세요");
					}else{
							if(confirm(' 입력값으로 변경하시겠습니까 ? ')==true){
								alert("변경이 완료되었습니다");
								udFrm.submit();
							}else{
								
								return false;
							}
					}
				}
					
					/*점수IN
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
						*/	
							//var b=$('#scoreIn').val();`
							//var c=$('.scoreIn').val();
							//var a=$(event.target).closest('tr').find('td').eq(0).html();
						
			
					
					</script>
						
			
			</div>
		</div>
		<!-- 교수 등록한 과제 삭제 -->
		<form id="hwPfDeleteFrm" name="hwPfDeleteFrm"  method="post" action="hwPfDelete">
			<input type="hidden" id="registerId" name="registerId">
		</form>

		
		<!--과제제출한 학생리스트 점수in 값 저장 
		<form id="frmScoreIn" method="post" action="scoreIn">
		<sec:csrfInput/>
			<input type="hidden" id="registerId" name="registerId">
			<input type="hidden" id="score" name="score">
			<input type="hidden" id="submitSid" name="submitSid">
		</form>
		 -->
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
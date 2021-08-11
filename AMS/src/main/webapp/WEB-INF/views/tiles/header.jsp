<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<style>
	a { 
    	text-decoration:none;
    } 
    
	a:visited { color: black; text-decoration: none;}

	div.menu {
        button: type= "button";
        display: inline-block;
	}
	
	header,
	footer {
        padding: 1em;
        color: black;
        background-color: white;
        clear: left;
        text-align: center;
	}

	nav {
        float: left;
        max-width: 160px;
        margin: 0;
        padding: 1em;
	}

	nav ul {
        list-style-type: none;
        padding: 0;
	}

	nav ul a {
        text-decoration: none;
	}

	article {
        margin-left: 170px;
        border-left: 1px solid gray;
        padding: 1em;
        overflow: hidden;
        min-height: 600px;
	}
      
	div.menu2{
		display: flex;
		align-content: left;
		border-bottom: 1px solid gray;
	}
	
	div.icon{
		height: 128px;
		width: 289px;
	}
	
	div.select{
		height: 100px;
		width:  200px;
		margin-top: 50px;
	}

	button.main{
		border: none;
		width: 100px;
		font-size: 30px;
		font-weight: bold;
		background-color: white;
		margin-top: 20px;
	}
</style>
<script>
     function studyfunction(){
    	
    	 location.href="home2";
     }
     
     function enrollfunction(){
	    	
    	 location.href="home2";
     }
     
     function pfinfofunction(){
	    	
    	 location.href="home2";
     }
     
     function lecturefunction(){
	    	
    	 location.href="home2";
     }
</script>
<header>
     	<div class="menu2">   
			<div class="icon">
				<a href="home2">
					<img src="${pageContext.request.contextPath }/resources/loginpicture/newlogo.png">
				</a>
			</div>       
	     
			<div class="select">
				<button type="button" class="main" name="stinfo" onclick="studyfunction()">학적</button>
			</div>
		  
			<div class="select">
				<button type="button" class="main" id="stenroll" onclick="enrollfunction()">수강</button>
			</div>
		     
			<div class="select">
	   			<h1>@ㅓ매</h1>
			</div>
		     
			<div class="select">
				<button type="button" class="main" id="pfinfo" onclick="pfinfofunction()">정보</button>
			</div>
		     
			<div class="select">
		     	<button type="button" class="main" id="pflecture" onclick="lecturefunction()">강의</button>
			</div>
        </div>
	</header>
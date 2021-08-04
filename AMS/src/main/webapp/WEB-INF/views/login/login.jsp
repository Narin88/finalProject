<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>로그인 페이지</title>
    <link
      href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      rel="stylesheet"
      id="bootstrap-css"
    />
    <link rel="stylesheet" href="resources/css/loginCss.css" />
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  </head>
  <body>
    <div class="wrapper fadeInDown">
      <div id="formContent">
        <!-- Tabs Titles -->

        <!-- Icon -->
        <div class="fadeIn first">
          <img
            src="resources/loginpicture/logo.png"
            id="icon"
            alt="No.M mark"
          />
        </div>

        <!-- Login Form -->
        <form action="logincheck" method="post">
 		  <sec:csrfInput/>       
          <input
            type="text"
            id="login"
            class="fadeIn second"
            name="id"
            placeholder="login"
          />
          <input
            type="password"
            id="password"
            class="fadeIn third"
            name="pwd"
            placeholder="password"
          />
          <input type="submit" class="fadeIn fourth" value="Log In" />
        </form>

        <!-- Remind Passowrd -->
        <div id="formFooter">
          <a class="underlineHover" href="forgetPwd">Forgot Password?</a>
        </div>
      </div>
    </div>
  </body>
</html>

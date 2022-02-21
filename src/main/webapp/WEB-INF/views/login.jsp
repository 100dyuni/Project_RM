<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<script src="js/jquery.min.js"></script>
<!DOCTYPE html>
<html lang="ko">
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	
    	<title>Enex 자산관리 시스템 | </title>

	   	<!-- Bootstrap -->
	    <link href="css/bootstrap.min.css" rel="stylesheet">
	    <!-- Font Awesome -->
	    <link href="css/font-awesome.min.css" rel="stylesheet">
	    <!-- NProgress -->
	    <link href="css/nprogress.css" rel="stylesheet">
	    <!-- Animate.css -->
	    <!-- <link href="../vendors/animate.css/animate.min.css" rel="stylesheet"> -->
	    <!-- Custom Theme Style -->
	    <link href="css/custom.min.css" rel="stylesheet">
    
 	</head>

  	<body class="login">
	    <div>
	    	<a class="hiddenanchor" id="signup"></a>
	      	<a class="hiddenanchor" id="signin"></a>
	
	      	<div class="login_wrapper">
		        <div class="animate form login_form">
		        	<section class="login_content">
			        	<form name="loginForm" id ="loginForm" method="get" action="login.do" accept-charset="utf-8">
			            	<h1>ENEX </h1>
			              	<div>
			                	<input type="text" class="form-control" placeholder="Username" required="required" id="loginID" name="loginID" />
			              	</div>
					        <div>
					           	<input type="password" class="form-control" placeholder="Password" required="required" id="loginPasswd" name="loginPasswd"/>
					        </div>
					        <div>
					           	<a class="btn btn-default submit" onclick="loginFunction()">Log in</a>
					        </div>
			              	<div class="clearfix"></div>
			              	<div class="separator">
			                   	<div class="clearfix"></div>
				               	<br />
				               	<div>
					              	<h1><i class="fa fa-paw"></i> ENEX 자산관리 시스템</h1>
					               	<p>©2020 System Development, HW/SW Management System</p>
				               	</div>
			              	</div>
			            </form>
		        	</section>
		        </div>
	    	</div>
	    </div>
	</body>
</html>

<script type="text/javascript">
	$(document).ready(function(){
		$("#loginPasswd").keyup(function(event){
			if((event.keyCode == 13)){
				loginFunction();
			}
		})
	});
	
	function loginFunction(){
		document.loginForm.submit();	
	}
</script>

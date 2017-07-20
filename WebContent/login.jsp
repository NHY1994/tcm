<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>TCM登录</title>
	<link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<link href="http://cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="login/login.css">
	<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
</head>
<body style="background-image:url(download.jpg);background-size: cover;">
	<div class="htmleaf-container" style="margin-top:100px;">
		<div class="demo form-bg">
	        <div class="container">
	            <div class="row">
	                <div class="col-md-offset-3 col-md-6">
<!-- 	                    <form class="form-horizontal" > -->
<div class="form-horizontal">
	                        <span class="heading">TCM用户登录</span>
	                        <div class="form-group">
	                            <input type="text" class="form-control" name="userid" id="userid" placeholder="账号">
	                            <i class="fa fa-user"></i>
	                        </div>
	                        <div class="form-group help">
	                            <input type="password" class="form-control" name="Password" id="Password" placeholder="密码">
	                            <i class="fa fa-lock"></i>
	                            <a href="#" class="fa fa-question-circle"></a>
	                        </div>
	                        <div class="form-group">
	                            <div class="main-checkbox">
	                                <input type="checkbox" value="None" id="checkbox1" name="check"/>
	                                <label for="checkbox1"></label>
	                            </div>
	                            <span class="text">记住我</span>
	                             <button id="login" class="btn btn-default" style="outline:none;">登录</button>
	                        </div>
	                        </div>
<!-- 	                    </form> -->
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<script type="text/javascript">
 	$(document).ready(function(){	
 		  $("button").click(function(){
 			  var name=$("#userid").val();
 			 var psd=$("#Password").val();
 		    $.post("/TCM/login",
 		    {
 		      name:name,
 		      psd:psd
 		    },
 		    function(data,status){
 		      alert(data);
 		      if(data=="success")
 		         document.cookie="name=nihongyan";
 		      else
 		    	  document.cookie="name=";
 		    });
 		  });
 		});
	</script>
</body>
</html>
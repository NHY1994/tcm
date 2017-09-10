<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--<script type="text/javascript" src="jquery.particleground.js"></script>-->
    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="http://apps.bdimg.com/libs/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <style>
        body
        {
            display:block;position:absolute;left:0px;top:0px;width:100%;height:100%;overflow:hidden;
        }
        #test
        {
            position: absolute;
            left: 50%;
            top: 50%;
            width:500px;
            height:300px;
            margin-left:-250px;
            margin-top:-200px;
        }
        .myButton {
            background-color:#00aeff;
            -moz-border-radius:4px;
            -webkit-border-radius:4px;
            border-radius:4px;
            display:inline-block;
            cursor:pointer;
            width: 100%;
            color:#ffffff;
            border: none;
            outline: none;
            font-family:Arial;
            font-size:17px;
            padding:10px 76px;
            text-decoration:none;
            /*text-shadow:0px 1px 0px #2f6627;*/
        }
        .myButton:hover {
            background-color: #31beff;
        }
        .myButton:active {
            position:relative;
            top:1px;
        }
        input{
            border-color: #e9e9e9 !important;
        }
    </style>
    <script src="js/app.js"></script>
</head>
<body style="background-color: #f7fafc">
<div id="particles-js" style="height: 100%;width: 100%; position: absolute;">
</div>
<div id="test" style="position: absolute;z-index: 1;background-color:rgba(255, 255, 255, 0);opacity: 1;border-radius: 3px;text-align: center;font-size: 18px">
    <div style="font-size: 50px;color: #858585;font-family: Tahoma">T C M</div>
    <div>
        <div style="width: 140px;margin:0 auto;"><a href="#" id="login" style="width: 70px;display: inline-block;margin-top: 15px;margin-bottom: 0px;text-decoration:none;color:#00aeff">登录</a><a href="#" id="reg" style="width: 70px;display: inline-block;text-decoration:none;color:#858585">注册</a>
            <div id="pro" style="width: 70px;height: 3px;background-color: #00aeff"></div>
        </div>
            <br>
        <div style="width: 150px;margin:0 auto;">

        </div>
    </div>
    <div id="login1" style="display: block">
    <div><input type="text" id="username" placeholder="账号" style="height: 50px;width: 80%;margin-top: 5px;border-width: 2px 2px 1px 2px;border-style:solid;border-color: #f2f2f2;outline: none;padding: 15px;border-radius: 5px 5px 0px 0px;-webkit-appearance: none;-moz-appearance: normal"></div>
    <div><input type="password" id="Password" placeholder="密码" style="height: 50px;width: 80%;border-width: 0px 2px 2px 2px;border-style:solid;border-color: #f2f2f2;outline: none;padding: 15px;border-radius: 0px 0px 5px 5px"></div>
    <div style="margin-top: 10px"><button class="myButton" style="margin-top: 10px;width: 80%">登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录</button></div>
    </div>

    <div id="reg1" style="display: none">
        <div><input type="text" placeholder="公司名称" style="height: 50px;width: 80%;margin-top: 5px;border-width: 2px 2px 1px 2px;border-style:solid;border-color: #f2f2f2;outline: none;padding: 15px;border-radius: 5px 5px 0px 0px;-webkit-appearance: none;-moz-appearance: normal"></div>
        <div><input type="text" placeholder="账号" style="height: 50px;width: 80%;border-width: 0px 2px 1px 2px;border-style:solid;border-color: #f2f2f2;outline: none;padding: 15px;border-radius: 0px 0px 0px 0px;-webkit-appearance: none;-moz-appearance: normal"></div>
        <div><input type="password" placeholder="密码" style="height: 50px;width: 80%;border-width: 0px 2px 2px 2px;border-style:solid;border-color: #f2f2f2;outline: none;padding: 15px;border-radius: 0px 0px 5px 5px"></div>
        <div style="margin-top: 10px"><button class="myButton" style="margin-top: 10px;width: 80%">注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;册</button></div>
    </div>

    </div>


<script type="text/javascript" src="js/particles.js"></script>
<script type="text/javascript" src="js/app.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $("a").click(function () {
            if($(this).text()=='注册'){
                $('#login1').css('display','none');
                $('#reg1').css('display','block');
                $('#pro').animate({marginLeft:"70px"});
                $('#reg').css('color','#00aeff');
                $('#login').css('color','#858585');
            }
            else
            {
                $('#login1').css('display','block');
                $('#reg1').css('display','none');
                $('#pro').animate({marginLeft:"0px"});
                $('#reg').css('color','#858585');
                $('#login').css('color','#00aeff');
            }
        })
    });
</script>
<script type="text/javascript">
 	$(document).ready(function(){	
 		  $("button").click(function(){
 			  if($(this).text()=='登      录'){
 			  var name=$("#username").val();
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
 		    });}
 			  else
 				 console.log($(this).text());
 		  });
 		});
	</script>
</body>
</html>
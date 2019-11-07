<%@ page language="java" contentType="text/html; charset=utf-8"
    import="java.util.*" pageEncoding="utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>欢迎回来</title>
    <script src="<%=basePath %>js/jquery/jquery.min.js"></script>
    <script src="<%=basePath %>js/bootstrap/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/login/login.css">
	<style>
		body{
    		background: url("<%=basePath %>img/login/zhibei_dangao.jpg");
    		background-repeat: no-repeat;
			background-size: 100% 100%;
			background-attachment: fixed;
		}
		@keyframes myfirst
		{
		    0%   {background:url("<%=basePath %>img/login/zhibei_dangao.jpg");
		    		background-repeat: no-repeat;
					background-size: 100% 100%;
					background-attachment: fixed;
		    	}
		    34%  {background:url("<%=basePath %>img/login/zhibei_dangao-001.jpg");
		    		background-repeat: no-repeat;
					background-size: 100% 100%;
					background-attachment: fixed;
		    	}
		    67%  {background:url("<%=basePath %>img/login/zhibei_dangao-003.jpg");
		    		background-repeat: no-repeat;
					background-size: 100% 100%;
					background-attachment: fixed;
		    	}
		    100% {background:url("<%=basePath %>img/login/zhibei_dangao-005.jpg");
		    		background-repeat: no-repeat;
					background-size: 100% 100%;
					background-attachment: fixed;
		    	}
		}
	</style>
	<script type="text/javascript">
			$(document).keydown(function(event){
				if(event.keyCode==13){
					$(".submit_login").click();
				}
			});
		
			$(document).ready(function(){
				$(".submit_login").click(function(){
					if($("#username").val() == ""){
						alert("用户名不能为空");
						return;
					}else if($("#password").val() == ""){
						alert("密码不能为空");
						return;
					}
					$.ajax({
                 	   	type: "POST",
                  	  	url: "<%=path%>/toHome",
                  	  	data: {
                  	  		"username":$("#username").val(),
                  	  		"password":$("#password").val()
                  	  	},
                  	  	dataType: "json",
                    	success: function (result) {
                     		if(result.status == "SUCCESS"){
                     			window.location.href='<%=path%>/home';
                     		}else{
                     			alert("密码错误");
                     		}
                    	},
                    	error: function(data) {
                    		alert("账户不存在");
                     	}
                	});
				});
			});
		</script>
	
</head>
<body>
    <div class="container">
        <div class="form row">
            <div class="form-horizontal col-md-offset-3" id="login_form">
                <h3 style="color:white" class="form-title">蓝鲸博客</h3>
                <div class="col-md-9">
                    <div class="form-group">
                        <span class="fa glyphicon glyphicon-user"></span>
                        <input class="form-control required" type="text" placeholder="Username" id="username" name="username" autofocus="autofocus" maxlength="20"/>
                    </div>
                    <div class="form-group">
                       	<span class="fa glyphicon glyphicon glyphicon-lock"></span>
                       	<input class="form-control required" type="password" placeholder="Password" id="password" name="password" maxlength="8"/>
                    </div>
                    <div class="form-group">
                        <!-- <label class="checkbox">
                            <input type="checkbox" name="remember" value="1"/>记住我
                        </label> -->
                    </div>
                    <div class="form-group col-md-offset-9">
                        <button type="submit" class="btn btn-success pull-right submit_login" name="submit">登录</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
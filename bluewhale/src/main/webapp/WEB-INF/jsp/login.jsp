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
    <script type="text/javascript" src="<%=basePath %>js/login/login.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/login/login.css">
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
                    	<span class="fa glyphicon glyphicon-send"></span>
                        <input style="width: 60%;" class="form-control required" type="text" placeholder="VerifyCode" id="verifyCode" name="verifyCode" autofocus="autofocus" maxlength="20"/>
                    	<img style="float: right; margin-top: -34px;" src="RandomPictrue" height="34px" width="80px" onclick="this.src=this.src+'?random='+Math.random();"/>
                    </div>
                    <div class="form-group">
                        <!-- <label class="checkbox">
                            <input type="checkbox" name="remember" value="1"/>记住我
                        </label> -->
                        <button type="button" class="btn btn-default pull-right submit_fbpword" name="forgetPassword">忘记密码？点我</button>
                    </div>
                    <div class="form-group col-md-offset-9">
                    	<button type="button" class="btn btn-primary pull-left submit_regist" name="regist">去注册</button>
                        <button type="submit" class="btn btn-primary pull-right submit_login" name="submit">登录</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
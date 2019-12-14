<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>找回密码</title>
    <link href="<%=basePath %>css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <script src="<%=basePath %>js/jquery/jquery.min.js"></script>
    <script src="<%=basePath %>js/bootstrap/bootstrap.min.js"></script>
    <script src="<%=basePath %>js/login/fbpassword.js"></script>
    <style>
    	html{
    		background: url("/bluewhale/img/baseLayout/home-bg.jpg");
			background-repeat: no-repeat;
			background-size: 100% 100%;
			width: 100%;
			height: 100%;
    	} 
       .container1 { 
            margin-top: 70px;
            width: 70%;
            margin-left: 15%;
        }
        /* 需要在一行的元素 */
        .inline-style {
            display: inline-block;
        }
        /* 文字需要靠右 */
        .font-position-right{
            text-align: right;
        }
    </style>
</head>
<body>
<div class="container1">

    <div class="form-horizontal col-md-offset-3">
        <div class="col-md-9">
        <div class="form-group">
        	<h2 align="center" class="form-signin-heading">找回密码</h2>
            <!-- class="sr-only"将label标签隐藏 -->
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label inline-style font-position-right">邮箱</label>
            <div class="col-sm-9 inline-style ">
                <input name="email" type="text" class="form-control" id="email" placeholder="邮箱">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label inline-style font-position-right">验证码</label>
            <div class="col-sm-9 inline-style ">
                <input name="verifyCode" type="text" class="form-control" id="verifyCode" placeholder="验证码">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-9">
            	<button type="button" class="btn btn-xs btn-primary pull-left submit_getCode">获取验证码</button>
                <button type="button" class="btn btn-xs btn-default pull-right submit_toLogin">去登录</button>
            	<button type="button" class="btn btn-xs btn-default pull-right submit_toRegist">去注册</button>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-9">
                <button type="button" class="btn btn-lg btn-primary submit_fbpword">找回密码</button>
            </div>
        </div>
        </div>
    </div>

</div>

</body>
</html>
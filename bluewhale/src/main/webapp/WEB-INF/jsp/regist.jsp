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
    <title>用户注册</title>
    <link href="<%=basePath %>css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <script src="<%=basePath %>js/jquery/jquery.min.js"></script>
    <script src="<%=basePath %>js/bootstrap/bootstrap.min.js"></script>
    <script src="<%=basePath %>js/login/regist.js"></script>
    <style>
    	html{
    		background: url("/bluewhale/img/baseLayout/main-bg.jpg");
			background-repeat: no-repeat;
			background-size: 100% 100%;
			width:100%;
			height:100%;
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
        	<h2 align="center" class="form-signin-heading">注册</h2>
            <!-- class="sr-only"将label标签隐藏 -->
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label inline-style font-position-right">用户名</label>
            <div class="col-sm-9 inline-style ">
                <input name="username" type="text" class="form-control" id="exampleInputUsername1" placeholder="用户名">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label  inline-style font-position-right">密码</label>
            <div class="col-sm-9  inline-style">
                <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="密码">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label  inline-style font-position-right">确认密码</label>
            <div class="col-sm-9  inline-style">
                <input name="repassword" type="password" class="form-control" id="exampleInputRePassword1" placeholder="确认密码">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label inline-style font-position-right">邮箱</label>
            <div class="col-sm-9 inline-style ">
                <input name="email" type="text" class="form-control" id="exampleInputEmail1" placeholder="邮箱">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-1 col-sm-9">
            	<button type="button" class="btn btn-xs btn-default pull-right toLogin">已有账号，去登录</button>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-9">
                <button type="button" class="btn btn-lg btn-primary submit_regist">注册</button>
            </div>
        </div>
        </div>
    </div>

</div>

</body>
</html>
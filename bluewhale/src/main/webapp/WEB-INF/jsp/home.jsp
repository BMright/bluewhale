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
	<meta charset="utf-8"> 
	<title>Bootstrap</title>
	<link rel="stylesheet" href="<%=basePath %>css/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="<%=basePath %>css/home/home.css" />
	<script type="text/javascript" src="<%=basePath %>js/jquery/jquery.min.js" ></script>
	<script type="text/javascript" src="<%=basePath %>js/bootstrap/bootstrap.min.js" ></script>
	<script type="text/javascript" src="<%=basePath %>js/home/home.js" ></script>
	<script type="text/javascript" src="<%=basePath %>js/bootstrap/bootstrap-hover-dropdown.min.js" ></script>
</head>
<body>

<!--遮挡层-->
<div id="navbar-inner" class="navbar navbar-default navbar-fixed-top  navbar-fixed-top"></div>

<!--导航头-->
<nav id="navbar-outer" class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header" style="margin-left: 5%;">
			<a class="navbar-brand" href="#">蓝鲸博客</a>
		</div>
		
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav" id="mytab">
				<li class="active"><a href="#">首页</a></li>
				<li>
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"><span class="glyphicon glyphicon-edit"></span> 归档</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">hello</a></li>
						<li><a href="#">hello</a></li>
						<li><a href="#">hello</a></li>
						<li><a href="#">hello</a></li>
					</ul>
				</li>
				<li>
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"><span class="glyphicon glyphicon-book"></span> 清单</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">hello</a></li>
						<li><a href="#">hello</a></li>
						<li><a href="#">hello</a></li>
						<li><a href="#">hello</a></li>
					</ul>
				</li>
				<li><a href="#" data-hover="dropdown">留言板</a></li>
				<li><a href="#" data-hover="dropdown">友人帐</a></li>
				<li><a href="#" data-hover="dropdown">关于我们</a></li>
			</ul>
			
			<div class="nav navbar-nav navbar-right" id="myinfo">
				<a href="#"><span class="glyphicon glyphicon-search"></span></a>
				<a href="#"><span class="glyphicon glyphicon-user"></span></a>
			</div>
		</div>
		
	</div>	
</nav>

<!--轮播图-->
<div id="myCarousel" data-ride="carousel" data-interval="5000" class="carousel slide">
	<!-- 轮播（Carousel）指标 -->
	<!--<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>   -->
	<!-- 轮播（Carousel）项目 -->
	<div class="carousel-inner">
		<div class="item active">
			<img src="<%=basePath %>img/login/zhibei_dangao.jpg" width="100%" alt="First slide">
			<div class="carousel-caption">
				<h1>
					HELLO,Welcome To Here
				</h1>
			</div>
		</div>
		<div class="item">
			<img src="<%=basePath %>img/login/zhibei_dangao-001.jpg" width="100%" alt="Second slide">
			<div class="carousel-caption">标题 2</div>
		</div>
		<div class="item">
			<img src="<%=basePath %>img/login/zhibei_dangao-003.jpg" width="100%" alt="Third slide">
			<div class="carousel-caption">标题 3</div>
		</div>
	</div>
	<!-- 轮播（Carousel）导航 -->
	<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	</a>
</div> 
<div class="container" style="margin-top: 40px;">
	
	<ul class="media-left">
		<li class="media">
			<a class="media-left" href="#">
				<img width="400" height="300" src="<%=basePath %>img/login/zhibei_dangao.jpg" alt=""/>
			</a>
			<div class="media-body">
				<h4 class="media-heading">
					他叫楚子航
				</h4>
				<p>
					是龙族中的角色，路明非很喜欢他
				</p>
			</div>
		</li>
		
		<li class="media">
			<a class="media-left" href="#">
				<img width="400" height="300" src="<%=basePath %>img/login/zhibei_dangao.jpg" alt=""/>
			</a>
			<div class="media-body">
				<h4 class="media-heading">
					他叫楚子航
				</h4>
				<p>
					是龙族中的角色，路明非很喜欢他
				</p>
			</div>
		</li>
		
	</ul>
	
	你好
	<br /><br /><br /><br /><br /><br /><br /><br /><br />
	<br /><br /><br /><br /><br /><br /><br /><br /><br />
	你好
</div>

</body>
</html>
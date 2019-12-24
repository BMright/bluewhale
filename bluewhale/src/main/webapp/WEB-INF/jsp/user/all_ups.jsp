<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>所有用户</title>
  	<link rel="icon" href="<%=basePath%>img/baseLayout/whale.png" type="image/x-icon" />
	<link href="<%=basePath%>css/baseLayout/bootstrap.min.css" rel="stylesheet">
	<link href="<%=basePath%>css/baseLayout/all.min.css" rel="stylesheet" type="text/css">
	<link href="<%=basePath%>css/baseLayout/clean-blog.min.css" rel="stylesheet">
	<link href="<%=basePath%>css/baseLayout/index.css" rel="stylesheet" />
	<link href="<%=basePath%>css/layui/layui.css" media="all">
	<script src="<%=basePath%>js/jquery/jquery.min.js"></script>
	<script src="<%=basePath%>js/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="<%=basePath%>js/baseLayout/clean-blog.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/baseLayout/index.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/layui/layui.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/user/all_ups.js"></script>
</head>
<body>

  <!-- Navigation -->
 <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
	    <div class="container">
	      <a class="navbar-brand" href="#"><img src="<%=basePath%>img/baseLayout/whale.png" style="width: 43px;height: 43px;margin-right: 20px;">欢迎您！</a>
	      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
	        Menu
	        <i class="fas fa-bars"></i>
	      </button>
	      <div class="collapse navbar-collapse" id="navbarResponsive">
	        <ul class="navbar-nav ml-auto">
					<li class="nav-item" id="search"><input type="text"
						id="search_input" placeholder="搜索" /> <img
						src="<%=basePath%>img/baseLayout/search.png" id="search_btn" /></li>
					<li class="nav-item"><a class="nav-link"
						href="/bluewhale/user" style="margin-left: 20px;">首页</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/bluewhale/toEditArticle">写博文</a></li>
					<li class="nav-item"><a class="nav-link" href="/bluewhale/toMBoard">留言板</a></li>
					<li class="nav-item"><a class="nav-link" href="/bluewhale/toAllUser">所有用户</a></li>
					<li class="nav-item" id="head_image"
						style="margin-right: 50px; margin-left: 20px;""><img
						src="<%=basePath%>img/baseLayout/post-sample-image.jpg"
						style="width: 50px; height: 50px; border-radius: 50%; cursor: pointer;" />
						<div class="list-group" id="down_menu"
							style="display: none; position: absolute; z-index: 999;">
							<a href="/bluewhale/selfInfo" class="list-group-item list-group-item-action">个人信息</a> 
							<a href="/bluewhale/userBlogs" class="list-group-item list-group-item-action">我的博文</a> 
							<a href="/bluewhale/userBlogs" class="list-group-item list-group-item-action">我的收藏</a> 
							<a href="/bluewhale/exitLogin" class="list-group-item list-group-item-action">退出</a>
						</div>
					</li>
				</ul>
	      </div>
	    </div>
	  </nav>
 
  <!-- Page Header -->
  <header class="masthead" style="background-image: url('<%=basePath%>img/baseLayout/home-bg.jpg');height: 70px;">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="site-heading">
            <h1 id="eng_title">Welcome to Blue Whale Blog!</h1>
          </div>
        </div>
      </div>
    </div>
  </header>

<div class="col-lg-10 col-md-10 mx-auto">
    <ul class="nav nav-tabs">
      <li class="active">
        <a href="#"><b>所有用户</b></a>
      </li>
    </ul>
   </div>
   
   
   <div class="list-group col-lg-10 col-md-10 mx-auto up_lists" id="cont">
     <a href="#" class="list-group-item list-group-item-action">
		 <img  src="<%=basePath%>img/baseLayout/post-sample-image.jpg"  style="width: 50px;height: 50px; border-radius: 50%; cursor: pointer;" />
		 <span class="name">用户名</span>
		 <span class="sex">性别</span>
		 <span class="intro">简介</span>
	 </a>
   
     <%-- <a href="#" class="list-group-item list-group-item-action list-group-item-primary">
		 <img  src="<%=basePath%>img/baseLayout/post-sample-image.jpg"  style="width: 50px;height: 50px; border-radius: 50%; cursor: pointer;" />
		 <span class="name">用户名</span>
		 <span class="sex">性别</span>
		 <span class="intro">简介</span>
	 </a>
     <a href="#" class="list-group-item list-group-item-action list-group-item-secondary">
		 <img  src="<%=basePath%>img/baseLayout/post-sample-image.jpg"  style="width: 50px;height: 50px; border-radius: 50%; cursor: pointer;" />
		 <span class="name">用户名</span>
		 <span class="sex">性别</span>
		 <span class="intro">简介</span>
	 </a>
     <a href="#" class="list-group-item list-group-item-action list-group-item-success">
		 <img  src="<%=basePath%>img/baseLayout/post-sample-image.jpg"  style="width: 50px;height: 50px; border-radius: 50%; cursor: pointer;" />
		 <span class="name">用户名</span>
		 <span class="sex">性别</span>
		 <span class="intro">简介</span>
	 </a>
     <a href="#" class="list-group-item list-group-item-action list-group-item-danger">
		 <img  src="<%=basePath%>img/baseLayout/post-sample-image.jpg"  style="width: 50px;height: 50px; border-radius: 50%; cursor: pointer;" />
		 <span class="name">用户名</span>
		 <span class="sex">性别</span>
		 <span class="intro">简介</span>
	 </a>
     <a href="#" class="list-group-item list-group-item-action list-group-item-info">
		 <img  src="<%=basePath%>img/baseLayout/post-sample-image.jpg"  style="width: 50px;height: 50px; border-radius: 50%; cursor: pointer;" />
		 <span class="name">用户名</span>
		 <span class="sex">性别</span>
		 <span class="intro">简介</span>
	 </a>
     <a href="#" class="list-group-item list-group-item-action list-group-item-light">
     		 <img  src="<%=basePath%>img/baseLayout/post-sample-image.jpg"  style="width: 50px;height: 50px; border-radius: 50%; cursor: pointer;" />
     		 <span class="name">用户名</span>
     		 <span class="sex">性别</span>
     		 <span class="intro">简介</span>
     </a> --%>
   </div> 
   
   <div id="userpage" align="center" class="vpage"></div>
   
   <!-- 分页 -->
      <!-- <nav aria-label="Page navigation example" class="topages">
        <ul class="pagination justify-content-center">
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
              <span class="sr-only">Previous</span>
            </a>
          </li>
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
              <span class="sr-only">Next</span>
            </a>
          </li>
   	   <li><form class="form-inline">
       
     <div class="form-group mx-sm-3 mb-2">
       <label>到第</label>
       <input type="number" name="pages" class="form-control pages" min="1" max="20" />
   	<label>页</label>
     </div>
     <a href="#">
     <button type="button" class="btn btn-lg btn-primary sure_btn">确认</button>
     </a>
     <div class="col-auto my-1">
           <label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
     <select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
             <option selected>每页4条</option>
             <option value="1">每页8条</option>
             <option value="2">每页12条</option>
           </select>
   		</div>
   </form>
   	   </li>
        </ul>
      </nav> -->
      
     <!-- Footer -->
     <footer>
       <div class="container">
         <div class="row">
           <div class="col-lg-8 col-md-10 mx-auto">
             <ul class="list-inline text-center">
               <li class="list-inline-item">
                 <a href="#">
                   <span class="fa-stack fa-lg">
                     <i class="fas fa-circle fa-stack-2x"></i>
                     <i class="fab fa-twitter fa-stack-1x fa-inverse"></i>
                   </span>
                 </a>
               </li>
               <li class="list-inline-item">
                 <a href="#">
                   <span class="fa-stack fa-lg">
                     <i class="fas fa-circle fa-stack-2x"></i>
                     <i class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
                   </span>
                 </a>
               </li>
               <li class="list-inline-item">
                 <a href="#">
                   <span class="fa-stack fa-lg">
                     <i class="fas fa-circle fa-stack-2x"></i>
                     <i class="fab fa-github fa-stack-1x fa-inverse"></i>
                   </span>
                 </a>
               </li>
             </ul>
             <p class="copyright text-muted">Copyright &copy; Your Blog 2019</p>
           </div>
         </div>
       </div>
     </footer>
   </body>
   </html>

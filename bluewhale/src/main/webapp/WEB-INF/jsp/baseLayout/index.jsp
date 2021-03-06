<%@ page language="java" contentType="text/html; charset=utf-8"
    import="java.util.*" pageEncoding="utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>游客首页</title>
  <link rel="icon" href="/bluewhale/img/baseLayout/whale.png" type="image/x-icon" />

  <link href="/bluewhale/css/baseLayout/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="/bluewhale/css/baseLayout/aos.css" /> 
  
  <link href="/bluewhale/css/baseLayout/all.min.css" rel="stylesheet" type="text/css">

  <link href="/bluewhale/css/baseLayout/clean-blog.min.css" rel="stylesheet">
  <link href="/bluewhale/css/baseLayout/index.css"  rel="stylesheet"/>
</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand" href="/bluewhale/visitor"><img src="/bluewhale/img/baseLayout/whale.png" style="width: 43px;height: 43px;"></a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          
          <li class="nav-item" id="search">
            <input type="text" id="search_input" placeholder="搜索"/>
            <img src="/bluewhale/img/baseLayout/search.png" id="search_btn"/>
          </li>
		  <li class="nav-item">
            <a class="nav-link" href="#">首页</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/bluewhale/toLogin">登录/注册</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Header -->
  <header class="masthead" style="background-image: url('/bluewhale/img/baseLayout/main-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="site-heading">
            <h1>蓝鲸博客</h1>
            <span class="subheading">Blue Whale Blog</span>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-10 col-md-10 mx-auto">
        <c:forEach items="${articleList }" var="article">
        <div class="post-preview" id="blog_context" data-aos="fade-right">
          	<!-- 链接 -->
          <a href="/bluewhale/blogContent?id=${article.id }"> 
            <h2 class="post-title">
            	${article.title }
            </h2>
            <h3 class="post-subtitle">
              	${article.summary }
            </h3>
          </a>
          <p class="post-meta">${article.ownername }</p>
        </div>
        </c:forEach>
       
        <!-- Pager -->
        <div class="clearfix">
          	<!-- 链接 -->
          <a class="btn btn-primary float-right" href="/bluewhale/visitorBlogs">更多博客 &rarr;</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Footer -->
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <ul class="list-inline text-center">
            <li class="list-inline-item">
              	<!-- 链接 -->
              <a href="#">
                <span class="fa-stack fa-lg">
                  <i class="fas fa-circle fa-stack-2x"></i>
                  <i class="fab fa-twitter fa-stack-1x fa-inverse"></i>
                </span>
              </a>
            </li>
            <li class="list-inline-item">
              	<!-- 链接 -->
              <a href="#">
                <span class="fa-stack fa-lg">
                  <i class="fas fa-circle fa-stack-2x"></i>
                  <i class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
                </span>
              </a>
            </li>
            <li class="list-inline-item">
              	<!-- 链接 -->
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

  <!-- Bootstrap core JavaScript -->
  <script src="/bluewhale/js/jquery/jquery.min.js"></script>
  <script src="/bluewhale/js/bootstrap/bootstrap.bundle.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/bluewhale/js/baseLayout/clean-blog.min.js"></script>
  <script type="text/javascript" src="/bluewhale/js/baseLayout/aos.js"></script>

</body>

</html>
<script>
	AOS.init({
                easing: 'ease-out-back',
                duration: 1000
            });
</script>
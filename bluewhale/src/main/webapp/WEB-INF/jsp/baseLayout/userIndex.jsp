<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>博主首页</title>
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
      <a class="navbar-brand" href="/bluewhale/admin"><img src="/bluewhale/img/baseLayout/whale.png" style="width: 43px;height: 43px;margin-right: 20px;">欢迎您！</a>
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
            <a class="nav-link" href="#">写博文</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/bluewhale/userBlogs">我的博文</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/bluewhale/userBlogs">我的收藏</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">留言</a>
           </li>
          <li class="nav-item">
            <a class="nav-link" href="up_User_info.html">个人信息</a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="#">所有博主</a>
          </li>

        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Header -->
  <header class="masthead" style="background-image: url('/bluewhale/img/baseLayout/home-bg.jpg')">
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
        <a href="#"><b>我的博客</b></a>
      </li>
    </ul>
   </div>
  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-10 col-md-10 mx-auto">
      	
      	<!--博客一-->
        <div class="post-preview" id="blog_context" data-aos="fade-right">
          <a href="/bluewhale/blogContent">
            <h2 class="post-title">
              博客题目
            </h2>
            <h3 class="post-subtitle">
              博客简介
            </h3>
          </a>
          <p class="post-meta">作者</p>
        </div>
        
        <!--博客二-->
        <div class="post-preview" id="blog_context" data-aos="fade-left">
          <a href="/bluewhale/blogContent">
            <h2 class="post-title">
              I believe every human has a finite number of heartbeats. I don't intend to waste any of mine.
            </h2>
          </a>
          <p class="post-meta">Posted by
            <a href="#">Start Bootstrap</a>
            on September 18, 2019</p>
        </div>
        
        <!--博客三-->
        <div class="post-preview" id="blog_context" data-aos="fade-right">
          <a href="/bluewhale/blogContent">
            <h2 class="post-title">
              Science has not yet mastered prophecy
            </h2>
            <h3 class="post-subtitle">
              We predict too much for the next year and yet far too little for the next ten.
            </h3>
          </a>
          <p class="post-meta">Posted by
            <a href="#">Start Bootstrap</a>
            on August 24, 2019</p>
        </div>
        
        <!--博客四-->
        <div class="post-preview" id="blog_context" data-aos="fade-left">
          <a href="/bluewhale/blogContent">
            <h2 class="post-title">
              Failure is not an option
            </h2>
            <h3 class="post-subtitle">
              Many say exploration is part of our destiny, but it’s actually our duty to future generations.
            </h3>
          </a>
          <p class="post-meta">Posted by
            <a href="#">Start Bootstrap</a>
            on July 8, 2019</p>
        </div>
       
        <!-- Pager -->
        <div class="clearfix">
          <a class="btn btn-primary float-right" href="/bluewhale/userBlogs">更多博客 &rarr;</a>
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

  <script src="/bluewhale/js/jquery/jquery.min.js"></script>
  <script src="/bluewhale/js/bootstrap/bootstrap.bundle.min.js"></script>

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
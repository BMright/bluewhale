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
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>博客编辑</title>
	<link href="/bluewhale/css/baseLayout/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="<%=basePath %>resources/editormd/css/editormd.css" />
	<script type="text/javascript" src="/bluewhale/js/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="/bluewhale/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>resources/editormd/editormd.min.js"></script>
<script type="text/javascript">
  $(function() {
      var testEditor = editormd("test-editormd", {
          width   : "90%",
          height  : 600,
          syncScrolling : "single",
          //你的lib目录的路径，我这边用JSP做测试的
          path    : "<%=request.getContextPath()%>/resources/editormd/lib/",
          //这个配置在simple.html中并没有，但是为了能够提交表单，使用这个配置可以让构造出来的HTML代码直接在第二个隐藏的textarea域中，方便post提交表单。
          saveHTMLToTextarea : true,
          
          imageUpload: true, //开启图片上传
          imageUploadURL: '/bluewhale/uploadImg', //图片上传后台地址
          onload: function() {
              // 引入插件 执行监听方法
              editormd.loadPlugin("/bluewhale/resources/editormd/plugins/image-handle-paste/image-handle-paste", function(){
                  testEditor.imagePaste();
              });
          }
      });
  });
  
</script>
</head>
<body>
	<div class="container">
		<form action="/bluewhale/addArticle" method="post">
			<div class="row">
				<label>文章名：</label><input name="title"/>
			</div>
			<div class="row">
				<label>文章摘要：</label><input name="summary" />
			</div>
			<div class="row">
				<div class="editormd" id="test-editormd">
  					<textarea class="editormd-markdown-textarea" name="content">${article.content }</textarea>
  					<!-- 第二个隐藏文本域，用来构造生成的HTML代码，方便表单POST提交，这里的name可以任意取，后台接受时以这个name键为准 -->
  					<textarea class="editormd-html-textarea" name="htmlcontent"></textarea>
				</div>
			</div>
			<div class="row">
				<input class="btn btn-primary" type="submit" value="添加"/>
			</div>
		</form>
	</div>
</body>
</html>
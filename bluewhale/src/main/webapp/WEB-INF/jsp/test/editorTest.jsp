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
<title>EditorMd测试</title>
<link rel="stylesheet" href="<%=basePath %>resources/editormd/css/editormd.css" />
<script type="text/javascript" src="<%=basePath %>js/jquery/jquery.min.js" ></script>
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
	<form action="/bluewhale/addArticle" method="post">
		<div class="editormd" id="test-editormd">
  			<textarea class="editormd-markdown-textarea" name="content">${article.content }</textarea>
  			<!-- 第二个隐藏文本域，用来构造生成的HTML代码，方便表单POST提交，这里的name可以任意取，后台接受时以这个name键为准 -->
  			<textarea class="editormd-html-textarea" name="htmlcontent"></textarea>
		</div>
		<button type="submit">提交</button>
	</form>

</body>
</html>
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
  <meta charset="utf-8">
  <title>上传文件</title>
  <link rel="stylesheet" href="<%=basePath %>/css/layui/layui.css" media="all">
</head>
<body>
 
<!-- <button type="button" class="layui-btn" id="test1"  lay-data="{url: '/b/', accept: 'file'}">
  <i class="layui-icon">&#xe67c;</i>上传文件
</button> -->

<div class="layui-inline layui-upload">
    <button type="button" class="layui-btn" id="uploadfile"><i class="layui-icon"></i>上传文件</button>
</div>

<script src="<%=basePath %>/js/layui/layui.js"></script>
<script>
layui.use('upload', function(){
  var upload = layui.upload;
   
  //执行实例
  var uploadInst=upload.render({
	    elem: '#uploadfile', //绑定元素
	    url: "<%=path %>/upLoadFile", //上传接口
	    method:'POST',
	    accept: 'file', //允许上传的文件类型
	    size: 204800, //设置文件最大可允许上传的大小，单位 KB
	    done: function(res){ //上传完毕回调
	    	console.log(res)
	    	if(res.code == 1){
	    		layer.msg(res.msg,{icon: 1});
	    	}else{
	    		layer.msg(res.msg,{icon: 0});
	    	}
			//parent.location.reload();
	    },
	    error: function(res){
	      	//请求异常回调
	      	layer.msg("上传失败",{icon: 0});
	    	layer.msg(res.msg,{icon: 0});
	    }
	  });
});
</script>
</body>
</html>
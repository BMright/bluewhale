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
<title>文件列表</title>
<link rel="stylesheet" href="<%=basePath %>css/layui/layui.css"
	media="all">
</head>
<body>

	<table id="demo" lay-filter="test"></table>

	<script src="<%=basePath %>js/layui/layui.js"></script>
	<script src="<%=basePath %>js/jquery/jquery.min.js"></script>
	<script>
		layui.use('table', function() {
			var table = layui.table;

			//第一个实例
			table.render({
				elem : '#demo',
				height : 412,
				url : '<%=path %>/getFileList',
				page : true ,
				cols : [ [ //表头
				{
					field : 'id',
					title : 'ID',
					width : 80,
					sort : true,
					fixed : 'left'
				}, {
					field : 'filename',
					title : '文件名',
					align:'center',
					width : 400
				}, {
					field : 'filesize',
					title : '文件大小',
					align:'center',
					width : 178,
					sort : true
				},
				{
					field : 'filedate',
					title : '上传日期',
					align:'center',
					width : 250,
					sort : true
				},
				{
					fixed: 'right',
					title : '操作',
					width:250,
					align:'center', 
					toolbar: '#barDemo'
				}
				] ]
			});
			
			table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
				  var data = obj.data; //获得当前行数据
				  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
				  var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
				 
				  if(layEvent === 'detail'){ //查看
				    alert("查看");
				  } else if(layEvent === 'del'){ //删除
					alert("删除");
				    layer.confirm('真的删除行么', function(index){
				      obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
				      layer.close(index);
				      //向服务端发送删除指令
				    });
				  } else if(layEvent === 'edit'){ //下载
				    window.open('<%=path %>/download?id=' + data.id,"_blank");
				  } else if(layEvent === 'LAYTABLE_TIPS'){
				    layer.alert('Hi，头部工具栏扩展的右侧图标。');
				  }
				});
		});
		
	</script>
	<script type="text/html" id="barDemo">
		  <a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
		  <a class="layui-btn layui-btn-xs" lay-event="edit">下载</a>
		  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		  
		  <!-- 这里同样支持 laytpl 语法，如： -->
		  {{#  if(d.auth > 2){ }}
		    <a class="layui-btn layui-btn-xs" lay-event="check">审核</a>
		  {{#  } }}
	</script>
</body>
</html>
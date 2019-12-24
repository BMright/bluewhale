var total;
	
$(document).ready(function() {
	$.ajax({
		type : "POST",
		url : "/bluewhale/getUserTotal",
		dataType : "json",
		success : function(result) {
			total = result.total;
		},
		error : function(data) {
			alert("获取数据出错！");
		}
	});
});	
		
	layui.use(['laypage', 'layer'], function(){
		var laypage = layui.laypage,layer = layui.layer;
		//完整功能
		laypage.render({
			elem: 'userpage'
			,count: total
			,layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
	    	,jump: function(obj){
	    		console.log(obj)
	    		$.ajax({
	    			type : "POST",
	    			url : "/bluewhale/userPageData",
	    			data : {
	    				"currentPage" : obj.curr,
	    				"pageSize" : obj.limit
	    			},
	    			dataType : "json",
	    			success : function(result) {
	    				if (result.status == "SUCCESS") {
							 html = "";
							 for(var i=0;i<result.length;i++){
								 html += "<a href='#' class='list-group-item list-group-item-action'>";
								 html += "<img  src='/bluewhale/img/baseLayout/post-sample-image.jpg' style='width: 50px;height: 50px; border-radius: 50%; cursor: pointer;' />";
								 html += "<span class='name'>"+ result.qv.queryList[i].username + "</span>\t<span class='sex'>" + result.qv.queryList[i].sex +"</span>\t<span class='intro'>" + result.qv.queryList[i].selfintroduce + "</span></a>";
							 }
							 document.getElementById('cont').innerHTML = html;
							/* alert(html);
							alert(document.getElementById('cont').innerHTML);*/
	    				} else {
	    					alert(result.info);
	    				}
	    			},
	    			error : function(data) {
	    				alert("获取数据出错！");
	    			}
	    		});
	    	},limit: 8,
	    	limits: [4, 8, 12],
	    	groups: 5
		});	
	 });
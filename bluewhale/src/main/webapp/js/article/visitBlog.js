var total;
	
$(document).ready(function() {
	$.ajax({
		type : "POST",
		url : "/bluewhale/getTotalArticle",
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
			elem: 'demo',count: total
			,layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
	    	,jump: function(obj){
	    		console.log(obj)
	    		$.ajax({
	    			type : "POST",
	    			url : "/bluewhale/visitorBlogsPageData",
	    			data : {
	    				"currentPage" : obj.curr,
	    				"pageSize" : obj.limit
	    			},
	    			dataType : "json",
	    			success : function(result) {
	    				if (result.status == "SUCCESS") {
							 html = "";
							 for(var i=0;i<result.length;i++){
								 html+= "<a href='/bluewhale/blogContent?id=" + result.qv.queryList[i].id + "' class='card border-success col-lg-3 col-md-6 col-sm-10 mx-auto1 mb-3' id='small_blog' data-aos='zoom-in' style='max-width: 16rem;'>";
								 html+= "<div class='card-header border-success'>" + result.qv.queryList[i].title +"</div>";
								 html+= "<div class='card-body text-success'><img src='/bluewhale/img/baseLayout/post-bg.jpg' /></div>";
								 html+= "<div class='card-footer border-success'>" + result.qv.queryList[i].summary + "</div></a>";
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
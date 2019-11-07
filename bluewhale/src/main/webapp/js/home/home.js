$(document).ready(function(){
	/*控制导航头的淡入淡出*/
	$("#navbar-inner").mouseenter(function(){
		$("#navbar-outer").fadeIn();
	});
	$("#navbar-outer").mouseleave(function(){
		$("#navbar-outer").fadeOut();
	});
	
	/*控制导航间页面的切换*/
	$("#mytab a").click(function(e){
		e.preventDefault();
		$(this).tab("show");
	});
	
	
	
})

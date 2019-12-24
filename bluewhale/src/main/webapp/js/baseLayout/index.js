$(function(){
	$(".edit").click(function(){
	  $(".user_name").removeAttr('readonly');
	  $(".password").removeAttr('readonly');
	});
	$(".edit_sure").click(function(){
	  $(".user_name").attr('readonly','readonly');
	  $(".password").attr('readonly','readonly');
	});
});
	$(function() {
		$('#head_image').hover(function() {
				$('#down_menu').slideDown('slow');
			},
			function() {
				$('#down_menu').slideUp(100);
			});
	});
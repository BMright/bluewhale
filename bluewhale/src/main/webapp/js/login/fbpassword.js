$(document).keydown(function(event) {
	if (event.keyCode == 13) {
		$(".submit_fbpword").click();
	}
});

$(document).ready(function() {
	$(".submit_toLogin").click(function() {
		window.location.href = '/bluewhale/toLogin';
	});
	
	$(".submit_toRegist").click(function() {
		window.location.href = '/bluewhale/toRegist';
	});
	
	$(".submit_getCode").click(function() {
		if ($("#email").val() == "" || !$("#email").val().match("^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$")) {
			alert("请正确输入邮箱");
			return;
		}
		$.ajax({
			type : "POST",
			url : "/bluewhale/getPasswordKey",
			data : {
				"email" : $("#email").val(),
			},
			dataType : "json",
			success : function(result) {
				if (result.status == "SUCCESS") {
					alert(result.msg);
				} else {
					alert(result.msg);
				}
			},
			error : function(data) {
				alert("获取验证码失败");
			}
		});
	});
	
	$(".submit_fbpword").click(function() {
		if ($("#email").val().trim() == "" || !$("#email").val().match("^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$")) {
			alert("请正确输入邮箱");
			return;
		} else if ($("#verifyCode").val().trim() == "") {
			alert("验证码不能为空");
			return;
		}
		$.ajax({
			type : "POST",
			url : "/bluewhale/getPaaword",
			data : {
				"email" : $("#email").val(),
				"verifyCode" : $("#verifyCode").val(),
			},
			dataType : "json",
			success : function(result) {
				if (result.status == "SUCCESS") {
					alert(result.msg);
					window.location.href = '/bluewhale/toLogin';
				} else {
					alert(result.msg);
				}
			},
			error : function(data) {
				alert("找回密码失败！");
			}
		});
	});
});
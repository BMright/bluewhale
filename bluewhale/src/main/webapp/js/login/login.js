$(document).keydown(function(event) {
	if (event.keyCode == 13) {
		$(".submit_login").click();
	}
});

$(document).ready(function() {
	$(".submit_regist").click(function() {
		window.location.href = '/bluewhale/toRegist';
	});
	
	$(".submit_fbpword").click(function() {
		window.location.href = '/bluewhale/findBackPassword';
	});
	
	$(".submit_login").click(function() {
		if ($("#username").val().trim() == "") {
			alert("用户名不能为空");
			return;
		} else if ($("#password").val().trim() == "") {
			alert("密码不能为空");
			return;
		} else if ($("#verifyCode").val().trim() == "") {
			alert("验证码不能为空");
			return;
		}
		$.ajax({
			type : "POST",
			url : "/bluewhale/getIsLogin",
			data : {
				"username" : $("#username").val(),
				"password" : $("#password").val(),
				"verifyCode" : $("#verifyCode").val()
			},
			dataType : "json",
			success : function(result) {
				if (result.status == "SUCCESS") {
					if (result.root == 2) {
						window.location.href = '/bluewhale/fileManage';
					} else {
						window.location.href = '/bluewhale/user';
					}
				} else {
					alert(result.info);
				}
			},
			error : function(data) {
				alert("账户不存在");
			}
		});
	});
});
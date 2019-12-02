$(document).keydown(function(event) {
	if (event.keyCode == 13) {
		$(".submit_login").click();
	}
});

$(document).ready(function() {
	$(".submit_login").click(function() {
		if ($("#username").val() == "") {
			alert("用户名不能为空");
			return;
		} else if ($("#password").val() == "") {
			alert("密码不能为空");
			return;
		}
		$.ajax({
			type : "POST",
			url : "/bluewhale/getIsLogin",
			data : {
				"username" : $("#username").val(),
				"password" : $("#password").val()
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
					alert("密码错误");
				}
			},
			error : function(data) {
				alert("账户不存在");
			}
		});
	});
});
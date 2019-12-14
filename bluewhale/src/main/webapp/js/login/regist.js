$(document).keydown(function(event) {
	if (event.keyCode == 13) {
		$(".submit_regist").click();
	}
});

$(document).ready(function() {
	$(".toLogin").click(function() {
		window.location.href = '/bluewhale/toLogin';
	});
	
	$(".submit_regist").click(function() {
		if ($("#exampleInputUsername1").val() == "") {
			alert("用户名不能为空");
			return;
		} else if ($("#exampleInputPassword1").val().trim() == "" ) {
			alert("请正确输入密码");
			return;
		} else if ($("#exampleInputRePassword1").val() != $("#exampleInputPassword1").val()) {
			alert("两次密码不一致");
			return;
		} else if ($("#exampleInputEmail1").val() == "" || !$("#exampleInputEmail1").val().match("^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$")) {
			alert("请正确输入邮箱");
			return;
		}
		$.ajax({
			type : "POST",
			url : "/bluewhale/addUser",
			data : {
				"username" : $("#exampleInputUsername1").val(),
				"password" : $("#exampleInputPassword1").val(),
				"email" : $("#exampleInputEmail1").val(),
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
				alert("注册失败");
			}
		});
	});
});
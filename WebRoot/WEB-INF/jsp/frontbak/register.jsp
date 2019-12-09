<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="inc/inc_inc.jsp"%>
</head>

<body>
 <div class="container">

      <form class="form-signin" id="registerFormuser">
        <h2 class="form-signin-heading">欢迎您注册</h2>
        
        <input class="form-control" type="text" value="" name="username" id="user_username" placeholder="账号">
        <input type="password" value="" class="form-control"  name="password" id="user_password" placeholder="密码">
        <input type="password" value="" class="form-control"  name="password2" id="user_password2" placeholder="确认密码">
        <input type="text" class="form-control" value="" name="name" id="user_name" placeholder="姓名">
        <input type="text" class="form-control" value="" name="phone" id="user_phone" placeholder="手机号码">
        <select name="sex" class="form-control">
        	<option value="男">男</option>
        	<option value="女">女</option>
        </select>
        <input type="text" class="form-control" value="" name="age" id="user_age" placeholder="年龄">
        <input type="text" class="form-control" value="" name="address" id="user_address" placeholder="家庭住址">
        <input type="text" class="form-control" value="" name="idcard" id="user_idcard" placeholder="身份证">
        
        <button class="btn btn-lg btn-primary btn-block" type="button"  onclick="registerSaveuser();">注册</button>
      </form>

    </div> <!-- /container -->

</body>
<script type="text/javascript">
	
	function registerSaveuser() {
		var username = $("#user_username").val();
		var password = $("#user_password").val();
		var password2 = $("#user_password2").val();
		var phone = $("#user_phone").val();
		if (username == '' || password == '') {
			alert('用户名和密码必须填写');
			return false;
		}
		if (password2 !=password) {
			alert('两次密码输入不一致');
			return false;
		}
		$.ajax({
			type : "POST",
			async : false, // 设置同步方式
			cache : false,
			url : "${ctx}/front/registerSave.html",
			data : $("#registerFormuser").serializeArray(),
			success : function(result) {
				result = eval("(" + result + ")");
				if (result.status == 'true' || result.status == true) {
					alert('注册成功');
					window.parent.location.href = "${ctx}/front/index.html";
				}
			}
		});
	}
</script>
</html>

<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="inc/inc_inc.jsp"%>
</head>

<body>

 <div class="container">

      <form class="form-signin" id="login_form">
        <h2 class="form-signin-heading">欢迎您登录</h2>
        <label for="inputEmail" class="sr-only">账号</label>
        
        <input type="text" value="" class="form-control" name="username" id="login_username" placeholder="账号">
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" value="" class="form-control" name="password" id="login_password" placeholder="密码">
        
        <div class="checkbox">
          <label>
            <a href="find.html" target="query">忘记密码？</a>
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="button"  onclick="login();">登录</button>
        
      </form>

    </div> <!-- /container -->

</body>
<script type="text/javascript">
function login() {
		var username = $("#login_username").val();
		var password = $("#login_password").val();
		var type = $("#type").val();
		if (username == '' || password == '') {
			alert('用户名和密码必须填写');
			return false;
		}
		var aa = "";
		var bb = "";
		aa = "${ctx}/front/save.html";
		bb = "${ctx}/front/index.html";
		$.ajax({
			type : "POST",
			async : false, // 设置同步方式
			cache : false,
			url : aa,
			data : $("#login_form").serializeArray(),
			success : function(result) {
				result = eval("(" + result + ")");
				if (result.status == 'true' || result.status == true) {
					if (result.msg == '1') {
						alert('登录成功');
						window.parent.location.href = bb;
					} else if (result.msg == '0') {
						alert('密码或用户名错误');
					}
				}
			}
		});
	}
	
	
</script>
</html>

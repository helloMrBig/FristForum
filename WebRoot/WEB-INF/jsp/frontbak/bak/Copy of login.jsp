<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="inc_top.jsp"%>
<!DOCTYPE html>
<html lang="en">
     <head>
     	<%@ include file="inc_head.jsp"%>
     </head>
     <body>
       <div class="main">
<!--==============================header=================================-->
<%@ include file="inc_menu.jsp"%>
<!--=======content================================-->

<div class="content">
  <div class="container_12">
  <form id="login_form" class="lllform">
    <div class="grid_5 prefix_1">
      <h2>登录</h2>
      <fieldset>
      <label class="name">
      <input type="text" value="" name="username" id="login_username" placeholder="账号">
      <br class="clear">
       </label>
      <label class="password">
      <input type="password" value="" name="password" id="login_password" placeholder="密码">
      <br class="clear">
      </label>
      <div class="clear"></div>
      <div class="btns"><a data-type="reset" class="btn" onclick="login();">登录</a>
      <div class="clear"></div>
      </div>
     </fieldset>
    </div>
    </form>
   
    <div class="clear"></div>
    <div class="bottom_block">
      </div>
      <div class="clear"></div>
    </div>
  </div>
</div>
<%@ include file="inc_foot.jsp"%>
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
		bb = "${ctx}/front/main.html";
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
						window.location.href = bb;
					} else if (result.msg == '0') {
						alert('密码或用户名错误');
					}
				}
			}
		});
	}
	
	
	function registerSaveuser() {
		var username = $("#user_username").val();
		var password = $("#user_password").val();
		var phone = $("#user_phone").val();
		if (username == '' || password == '') {
			alert('用户名和密码必须填写');
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
					window.location.href = "${ctx}/front/main.html";
				}
			}
		});
	}
</script>
</html>
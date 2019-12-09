<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="inc_top.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>两湖绿谷-注册</title>
<link rel="stylesheet" type="text/css"  href="${ctx }/resource/front/css/页首和页尾.css">
<link rel="stylesheet" type="text/css" href="${ctx }/resource/front/css/注册.css">
</head>

<body>
<%@ include file="inc_menu.jsp"%>
<div class="div_line"> </div>
<div class="home_block"> </div>

<div class="register1"> 
	<div class="regblock1"></div>
	<div class="register2">
    	<div class="regblock2"> </div>
    	<table class="reg_table">
        	<tr>
            	<form  method="post" action="" id="registerFormuser">
               	   <span class="reg_span1">用户名　：</span> <input class="reg_input1" type="text" value="" name="username" id="user_username" placeholder="账号">
               	   
                   <br><br>
                   <span class="reg_span1">密　　码：</span> <input type="password" value="" class="reg_input1"  name="password" id="user_password" placeholder="密码">
                   <br><br>
                   <span class="reg_span1">确认密码：</span> <input type="password" value="" class="reg_input1"  name="password2" id="user_password2" placeholder="密码">
                   <br><br>
                   <span class="reg_span1">电话号码：</span><input type="text" class="reg_input1" value="" name="phone" id="user_phone" placeholder="手机号码">
                   <br><br>
                   <input type="button" value="注册" onclick="registerSaveuser();" class="reg_input2">
                </form>
            	
            </tr>
        </table>
    </div>
</div>

<div class="home_block"> </div>
<%@ include file="inc_top.jsp"%>
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
					window.location.href = "${ctx}/front/main.html";
				}
			}
		});
	}
</script>
</html>

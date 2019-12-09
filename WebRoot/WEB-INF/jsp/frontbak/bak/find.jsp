<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="inc_top.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>两湖绿谷-登录</title>
<link rel="stylesheet" type="text/css"  href="${ctx }/resource/front/css/页首和页尾.css">
<link rel="stylesheet" type="text/css" href="${ctx }/resource/front/css/登录.css">
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
            	<td><form method="post" action="" style="text-align: center;">
                	<span class="reg_span1">用户名：</span> <input type="text" value="" class="reg_input1" name="username" id="login_username" placeholder="账号"> 
                    <br>
                    <br>
                    <span class="reg_span1">手机：</span><input type="text" class="reg_input1" value="" name="password" id="login_phone" placeholder="手机号码">
                    <br>
                    <br>
                    <br>
                    <br>
                    <input  type="button" onclick="login();" value="找回" class="reg_input2"> 
                	</form>
                </td>
       		</tr>
        </table>
    </div>
</div>



<div class="home_block"> </div>
<%@ include file="inc_top.jsp"%>
</body>
<script type="text/javascript">
function login() {
		var username = $("#login_username").val();
		var phone = $("#login_phone").val();
		var type = $("#type").val();
		if (username == '' || phone == '') {
			alert('用户名和手机必须填写');
			return false;
		}
		var aa = "";
		var bb = "";
		aa = "${ctx}/front/findSave.html";
		bb = "${ctx}/front/main.html";
		$.ajax({
			type : "POST",
			async : false, // 设置同步方式
			cache : false,
			url : aa,
			data : {username:username,phone:phone},
			success : function(result) {
				result = eval("(" + result + ")");
				if (result.status == 'true' || result.status == true) {
					var sex=prompt("请输入密码",'您的新密码');
					loginConfirm(sex);
				}else{
					alert('手机或用户名错误');
				}
			}
		});
	}
	
function loginConfirm(password) {
		var username = $("#login_username").val();
		var phone = $("#login_phone").val();
		var type = $("#type").val();
		var aa = "";
		var bb = "";
		aa = "${ctx}/front/findSaveConfirm.html";
		bb = "${ctx}/front/main.html";
		$.ajax({
			type : "POST",
			async : false, // 设置同步方式
			cache : false,
			url : aa,
			data : {username:username,phone:phone,password:password},
			success : function(result) {
				result = eval("(" + result + ")");
				if (result.status == 'true' || result.status == true) {
					alert('修改成功');
					window.location.href="main.html";
				}else{
					alert('修改失败');
				}
			}
		});
	}	
	
	
</script>
</html>

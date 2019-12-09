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
            	<td><form method="post" action="" style="text-align: center;" id="login_form">
                	<span class="reg_span1">用户名：</span> <input type="text" value="" class="reg_input1" name="username" id="login_username" placeholder="账号">
                    <br>
                    <br>
                    <span class="reg_span1">密　码：</span><input type="password" value="" class="reg_input1" name="password" id="login_password" placeholder="密码">
                    <br>
                    <br>
                    <a href="find.html" >忘记密码？</a>
                    <br>
                    <br>
                    <input  type="button" onclick="login();" value="登录" class="reg_input2"> 
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
	
	
</script>
</html>

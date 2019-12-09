<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="inc/inc_inc.jsp"%>
</head>

<body>
 <div class="container">

      <form class="form-signin" id="registerFormuser">
        <h2 class="form-signin-heading">个人信息中心</h2>
        <input type="hidden" value="${customer.id }" name="id"/>
        <input type="password" class="form-control" value="${customer.password }" name="password" id="user_password" placeholder="密码">
        <input type="text" class="form-control" value="${customer.name }" name="name" id="user_name" placeholder="姓名">
        <input type="text" class="form-control" value="${customer.phone }" name="phone" id="user_phone" placeholder="手机号码">
        <select name="sex" class="form-control">
        	<option value="男" ${customer.sex=='男'?'selected':'' }>男</option>
        	<option value="女" ${customer.sex=='女'?'selected':'' }>女</option>
        </select>
        <input type="text" class="form-control" value="${customer.age }" name="age" id="user_age" placeholder="年龄">
        <input type="text" class="form-control" value="${customer.address }" name="address" id="user_address" placeholder="家庭住址">
        <input type="text" class="form-control" value="${customer.idcard }" name="idcard" id="user_idcard" placeholder="身份证">
        
        <button class="btn btn-lg btn-primary btn-block" type="button"  onclick="registerSaveuser();">修改保存</button>
      </form>

    </div> <!-- /container -->

</body>
<script type="text/javascript">
	
	function registerSaveuser() {
		$.ajax({
			type : "POST",
			async : false, // 设置同步方式
			cache : false,
			url : "${ctx}/front/registerModifySave.html",
			data : $("#registerFormuser").serializeArray(),
			success : function(result) {
				result = eval("(" + result + ")");
				if (result.status == 'true' || result.status == true) {
					alert('修改成功');
					window.parent.location.href = "${ctx}/front/index.html";
				}
			}
		});
	}
</script>
</html>

<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script>
var ctx='${ctx}';
</script>
<!DOCTYPE HTML>
<html>
<head>
<title>E互联论坛</title>
<link href="${ctx }/resource/mine/one/login/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${ctx}/resource/admin/js/jquery-1.7.1.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
</head>
<body>
<div class="login"  id="login_form">
	<h2>E互联论坛</h2>
	<div class="login-top">
		<h1>登录</h1>
		<form id="login_form_form">
			<input type="text" id="login_username" name="username" placeholder="用户名">
			<input type="password" name="password" id="login_password" placeholder="密码">
            <select class="username" name="type" id="type">
            	<option value="超级管理员">超级管理员</option>
            </select>
	    </form>
	    <div class="forgot">
	    	<%--<a href="#">forgot Password</a> --%>
	    	<input type="button"  onclick="loginCheck();" class="loginClass" value="登录" >
	    </div>
	</div>
			<%--
	<div class="login-bottom">
	</div>
			 --%>
</div>


</body>
<script type="text/javascript">
	function showLogin(){
		$("#login_form").show();
	}	
	function loginCheck(){
		var username = $("#login_username").val();
		var password = $("#login_password").val();
		var type = $("#type").val();
		if(username==''||password==''){
			alert('用户名和密码必须填写');
			return false;
		}
		var aa="";
		var bb="";
			aa="${ctx}/adminLogin/save.html";
			bb="${ctx}/admin/index.html";
		$.ajax({
		      type: "POST",
		      async:false,  // 设置同步方式
		      cache:false,
		      url: aa,
				data:$("#login_form_form").serializeArray(),
				success:function(result){
				result = eval("("+result+")");
				if(result.status=='true'||result.status==true){
					if(result.msg=='1'){
						alert('登录成功');
						window.location.href=bb;
					}else if(result.msg=='0'){
						alert('密码或用户名错误');
					}
				}
		      }
			});
	}
</script>
</html>

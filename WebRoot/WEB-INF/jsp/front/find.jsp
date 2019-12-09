<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en-US">
<%@ include file="inc/head.jsp"%>
<!-- Start of Page Container -->
<div class="page-container">
	<div class="container">
		<div class="row">

			<!-- start of page content -->
			<div class="span8 page-content">

				<article class="type-page hentry clearfix">
					<h1 class="post-title">
						<a href="#">欢迎使用找回密码</a>
					</h1>
					<hr>
					<p>欢迎您使用E互联论坛</p>
				</article>
				<form id="login_form" class="row"
					method="post" novalidate="novalidate">

					<div class="span2">
						<label for="name">账号 <span>*</span> </label>
					</div>
					<div class="span6">
						<input type="text" name="username" id="login_username" placeholder="账号">
					</div>

					<div class="span2">
						<label for="email">手机<span>*</span>
						</label>
					</div>
					<div class="span6">
						<input type="text" name="phone" id="login_phone" placeholder="手机号码">
					</div>
					<div class="checkbox">
          <label>
            <font color="red">模拟手机找回密码，不是真的</font>
          </label>
        </div>
					<div class="span6 offset2 bm30">
						<button class="btn btn-lg btn-primary btn-block" type="button"  onclick="login();">找回</button>
					</div>
				</form>
			</div>
			<!-- end of page content -->
		</div>
	</div>
</div>
<!-- End of Page Container -->
<%@ include file="inc/foot.jsp"%>
<%@ include file="inc/js.jsp"%>
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
					window.parent.location.href="index.html";
				}else{
					alert('修改失败');
				}
			}
		});
	}	
	
	
</script>
</html>
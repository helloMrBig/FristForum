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
						<a href="#">个人信息中心(用户等级：${customer.level })</a>
					</h1>
					<hr>
				</article>
				<form id="registerFormuser" class="row"
					method="post" novalidate="novalidate">
					<input type="hidden" value="${customer.id }" name="id"/>

					<div class="span2">
						<label for="email">密码<span>*</span>
						</label>
					</div>
					<div class="span6">
						<input type="password" name="password"  value="${customer.password }" id="user_password" placeholder="密码">
					</div>
					<div class="span2">
						<label for="email">姓名<span>*</span>
						</label>
					</div>
					<div class="span6">
						<input type="text" name="name" value="${customer.name }" id="user_name" placeholder="姓名">
					</div>
					<div class="span2">
						<label for="email">手机号码<span>*</span>
						</label>
					</div>
					<div class="span6">
						<input type="text" value="${customer.phone }" name="phone" id="user_phone" placeholder="手机号码">
					</div>
					<div class="span2">
						<label for="email">性别<span>*</span>
						</label>
					</div>
					<div class="span6">
						<select name="sex" class="form-control">
				        		<option value="男" ${customer.sex=='男'?'selected':'' }>男</option>
        				<option value="女" ${customer.sex=='女'?'selected':'' }>女</option>
				        </select>
					</div>
					<div class="span2">
						<label for="email">年龄<span>*</span>
						</label>
					</div>
					<div class="span6">
						<input type="text" name="age" value="${customer.age }" id="user_age" placeholder="年龄">
					</div>
					<div class="span2">
						<label for="email">家庭住址<span>*</span>
						</label>
					</div>
					<div class="span6">
						<input type="text"  value="${customer.address }" name="address" id="user_address" placeholder="家庭住址">
					</div>
					<div class="span2">
						<label for="email">家庭住址<span>*</span>
						</label>
					</div>
					<div class="span6">
						<input type="text"  value="${customer.idcard }" name="idcard" id="user_idcard" placeholder="身份证">
					</div>
					<div class="span2">
						<label for="email">头像<span>*</span>
						</label>
					</div>
					<div class="span6">
						<input  class="form-control" id="f_fileImg0" name="cmfile"
						onchange="triggerUploadImg0(this);" title="选择图片" type="file">
						<input class="text"  type="hidden" name="headPic" id="bbbbbImg0"
						value="${customer.headPic }"> <c:if test="${customer.headPic!=null }">
							<img style='width:100px;' src="${ctx }/${customer.headPic}" id="aaaaaImg0" />
						</c:if>
					</div>
					<div class="span6 offset2 bm30">
						<button class="btn btn-lg btn-primary btn-block" type="button"  onclick="registerSaveuser();">修改保存</button>
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
	
	
	function triggerUploadImg0(src) {
		$
				.ajaxFileUpload({
					url : '${ctx}/file/upload.json',
					secureuri : false,
					fileElementId : 'f_fileImg0',
					dataType : 'json',
					data : {
						fileloc : 'upload/',
						dir : 'temp'
					},
					success : function(data, status) {
						$("#bbbbbImg0").val(data.data.filepath);
						$("#aaaaaImg0").remove();
						$("#bbbbbImg0")
								.after(
										"<img  id='aaaaaImg0' style='width:100px;' src='${ctx}/"+data.data.filepath+"' />");
					},
					error : function(data, status, e) {
						alert('文件上传失败');
					}
				});
	}
</script>
</html>
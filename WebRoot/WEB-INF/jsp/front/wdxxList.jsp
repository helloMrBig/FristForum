<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en-US">
<%@ include file="inc/head.jsp"%>
<!-- Start of Page Container -->
<div class="page-container">
	<div class="container">
	<c:if test="${param.dpc!=1&&customerBean!=null&&customerBean.isft!='否' }">
    <a class="btn btn-primary" href="wdxxEdit.html"  role="button">发布一条帖子</a></c:if>
		<div class="row">
			<div class="span8 main-listing">
				<c:forEach items="${list }" var="lists">
				<article class=" type-post format-image hentry clearfix">
					<header class="clearfix">
						<h3 class="post-title">
							<a href="wdxxShow.html?id=${lists.id }">${lists.title }</a>
						</h3>
						<div class="post-meta clearfix">
							<span class="date">${lists.insertDate }</span> <span class="category">
							</span>
							<c:if test="${param.dpc!=1 }">
							<a class="btn btn-danger" href="#" onclick="deleteOne('${lists.id}');" role="button">删除</a>
							<a class="btn btn-default" href="wdxxEdit.html?id=${lists.id }" role="button">修改</a>
							</c:if>
						</div>
						<!-- end of post meta -->
					</header>
					<p>${lists.content }</p>
				</article>
				</c:forEach>
			</div>
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
	
	
	function deleteOne(id){
		if(!confirm("确定要删除吗?")){
			return false;
		}
		var params={id:id};
		$.post("wdxxDelete.html",params,function(
				result){
			result=eval("("+result+")");
			if(result.status=="true"||result.status==true){
				alert('成功');
			window.location.reload();
			}
		});
	}
</script>
</html>
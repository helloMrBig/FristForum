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

                                                <!-- Basic Home Page Template -->
                                                <div class="row separator">
                                                        <section class="span8 articles-list">
                                                                <h3>${map.bkName }</h3>
                                                                <ul class="articles">
                                                                        <c:forEach items="${list }" var="listss">
                                            		<li class="article-entry standard">
                                                            <h4><a href="wdxxShow.html?id=${listss.id }">${listss.title }[${listss.bkName }]</a></h4>
                                                            <span class="article-meta">(${listss.insertDate })<a href="wdxxShow.html?id=${listss.id }" >${listss.customerName }</a></span>
                                                            <span class="like-count">${listss.zan }</span>
                                                    </li>
                                            		
                                            	</c:forEach>
                                                                </ul>
                                                        </section>
                                                </div>
                                        </div>
                                        <!-- end of page content -->


                                        <%@include file="inc/right.jsp" %>
                                        <!-- end of sidebar -->
                                </div>
                        </div>
                </div>
<!-- End of Page Container -->
<%@ include file="inc/foot.jsp"%>
<%@ include file="inc/js.jsp"%>
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
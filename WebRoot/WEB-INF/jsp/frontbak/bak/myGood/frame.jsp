<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/taglibs.jsp"%>
<link rel="StyleSheet" href="${ctx }/resource/admin/css/mobile_main.css"
	type="text/css" />
<html>
<body class="mobile">
	<form id="form1" name="form1" method="post" action="list.html"
		target="query">
		<input type="hidden" value="${param.apps }" name="apps" />
		<table class="mobile">
			<tr class="pageheader" height="6%">
				<td colspan="2">商品管理</td>
			</tr>
			<tr class="pagesearch" height="5%">
				<td style="text-align: left;">&nbsp;&nbsp; 商品名称模糊查询： <input
					type="text" name="goodName" style="width:100px;">
					&nbsp;&nbsp; 运输方式： <select name="transport">
						<option value="">请选择...</option>
						<option value="快递">快递</option>
						<option value="平邮">平邮</option>
						<option value="直送">直送</option>
				</select> <input type="button" class="btn" value="查 询 " onClick="sch();" />
					&nbsp;&nbsp; <c:if test="${param.apps!='kc' }"><input type="button" class="btn" value="新 增 "
					onClick="add();" /></c:if> <c:choose>
						<c:when test="${param.flag==1 }"></c:when>
						<c:when test="${param.flag==2 }"></c:when>
						<c:when test="${param.flag==3 }"></c:when>
						<c:otherwise>

						</c:otherwise>
					</c:choose> <c:if test="${1==1 }"></c:if></td>
			</tr>
		</table>
		<iframe id="query" name="query" frameborder="0" height="88%"
			width="100%" scrolling="yes"></iframe>
	</form>
	<script>
		sch();
		function sch() {
			form1.action = "myGoodList.html";
			form1.submit();
		}
		function keylog() {
			if (window.event.keyCode == 13) {
				sch();
			}
		}

		function add() {
			MyWindow.OpenCenterWindow('myGoodEdit.html', 'addOld',
					500, 600);
		}
	</script>
</body>
</html>

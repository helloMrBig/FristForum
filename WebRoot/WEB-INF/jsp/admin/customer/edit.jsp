<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/taglibs.jsp"%>
<script type="text/javascript" src="${ctx}/js/easy_validator.pack.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.bgiframe.min.js"></script>
<script type="text/javascript"
	src="${ctx }/resource/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="${ctx}/resource/admin/js/ajaxfileupload.js"></script>
<link href="${ctx}/css/validate.css" rel="stylesheet" type="text/css" />
<link rel="StyleSheet" href="${ctx }/resource/mine/one/mine.css"
	type="text/css" />
<html>
<head>
<title>信息内容功能</title>
</head>
<body>
	<form id="form1" name="form1" action="" method="post">
		<input type="hidden" value="${param.flag }" name="flag" /> <input
			type="hidden" value="${map.id }" name="id" id="id" />
		<center>
			<table class="mobile" style="width: 95%;">
				<tr class="pageheader">
					<td colspan="2"><strong>信息处理</strong></td>
				</tr>
				<%--
				<tr height="25">
					<td class="outDetail" style="width: 30%">账号： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input type="text" id="username"
						value="${map.username }" name="username" /></td>
				</tr> --%>
				<tr height="25">
					<td class="outDetail" style="width: 30%">密码： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input type="text" id="password"
						value="${map.password }" name="password" /></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">姓名： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input type="text" id="name"
						value="${map.name }" name="name" /></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">手机： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input type="text" id="phone"
						value="${map.phone }" name="phone" /></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">性别： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><select id="sex" name="sex">
							<option value="男" ${map.sex=='男'?'selected':'' }>男</option>
							<option value="女" ${map.sex=='女'?'selected':'' }>女</option>
					</select></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">年龄： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input type="text" id="age"
						value="${map.age }" name="age" /></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">家庭住址： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input type="text" id="address"
						value="${map.address }" name="address" /></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">身份证： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input type="text" id="idcard"
						value="${map.idcard }" name="idcard" /></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">发帖权限： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><select id="isft" name="isft">
							<option value="是" ${map.isft=='是'?'selected':'' }>是</option>
							<option value="否" ${map.isft=='否'?'selected':'' }>否</option>
					</select></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">评论权限： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><select id="ispl" name="ispl">
							<option value="是" ${map.ispl=='是'?'selected':'' }>是</option>
							<option value="否" ${map.ispl=='否'?'selected':'' }>否</option>
					</select></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">级别： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><select id="level" name="level">
							<option value="初级" ${map.level=='初级'?'selected':'' }>初级</option>
							<option value="中级" ${map.level=='中级'?'selected':'' }>中级</option>
							<option value="高级" ${map.level=='高级'?'selected':'' }>高级</option>
					</select></td>
				</tr>
				<c:if test="${1==1 }"></c:if>
				<%--<input name="newDate" id="newDate" value="${map.newDate }" type="text" onClick="WdatePicker()"/> --%>
				<%--
				<tr height="25">
					<td class="outDetail" style="width: 30%">图片： <label
						style="font-weight: bold; color: red"> * </label></td>
					<td class="outDetail2"><input id="f_file" name="cmfile"
						onchange="triggerUpload(this);" title="选择图片" type="file">
						<input class="text" type="hidden" name="img" value="${map.img }">
						<img id="imgUrlShow" style="width: 100px;" src="${ctx}/${map.img }" />
					</td>
				</tr>
				--%>
				<%--
				<tr height="25">
					<td class="outDetail" style="width: 30%">是否特价： <label
						style="font-weight: bold; color: red"> * </label></td>
					<td class="outDetail2">
					<select name="isSale">
							<option value="是" ${map.isSale=='是'?'selected':'' }>是</option>
							<option value="否" ${map.isSale=='否'?'selected':'' }>否</option>
					</select>
				</tr>
				 --%>
				<%--
				<tr height="25">
					<td class="outDetail" style="width: 30%">图书分类的外键： <label
						style="font-weight: bold; color: red"> * </label></td>
					<td class="outDetail2">
					<select name="typeId">
							<c:forEach items="${typeList }" var="lists">
								<option value="${lists.id }" ${map.typeId==lists.id?'selected':'' }>${lists.typeName
									}</option>
							</c:forEach>
					</select>
				</tr>
				 --%>
			</table>
		</center>
		<p align="center">
			<br> <input type="button" class="btn" value="保  存"
				onclick="save(this);" /> <input type="button" class="btn"
				value="关  闭" onclick="window.close();" />
		</p>
	</form>
</body>
<script type="text/javascript">
	function save(src) {
		$.post("editSave.html", $("#form1").serializeArray(), function(result) {
			result = eval("(" + result + ")");
			if (result.status == "true" || result.status == true) {
				alert('成功');
				saveAnd();
			} else {
				alert('保存失败，请重试');
			}
		});
	}
	function triggerUpload(src) {
		$.ajaxFileUpload({
			url : '${ctx}/file/upload.json',
			secureuri : false,
			fileElementId : 'f_file',
			dataType : 'json',
			data : {
				fileloc : 'upload/',
				dir : 'temp'
			},
			success : function(data, status) {
				$("input[name='img']").val(data.data.filepath);
				$("#imgUrlShow").attr("src",
						"${ctx}/" + data.data.filepath + "");
			},
			error : function(data, status, e) {
				alert('文件上传失败');
			}
		});
	}
</script>
</html>

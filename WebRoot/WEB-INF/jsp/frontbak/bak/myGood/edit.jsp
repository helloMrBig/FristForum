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
<html>
<head>
<title>信息内容功能</title>
</head>
<body>
	<form id="form1" name="form1" action="" method="post">
		 <input type="hidden" value="${map.id }" name="id" id="id" />
		<center>
			<table class="mobile" style="width: 95%;">
				<tr class="pageheader">
					<td colspan="2"><strong>信息处理</strong></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">商品名称： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input type="text" id="goodName"
						value="${map.goodName }" name="goodName" /></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">单价： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input id="price" type="text"
						value="${map.price }" name="price" /></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">单位： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input id="dw" type="text"
						value="${map.dw }" name="dw" /></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">起订量： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input id="leastNum" type="text"
						value="${map.leastNum }" name="leastNum" /></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">货源地： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input type="text" id="place"
						value="${map.place }" name="place" /></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">原产地： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input type="text" id="place2"
						value="${map.place2 }" name="place2" /></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">该商品的一级分类： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2">
					
					<select name="oneClassifyId" id="oneClassifyId" onchange="changeTwo(this);">
							<option value="" >请选择...</option>
							<c:forEach items="${oneClassifyList }" var="lists">
								<option value="${lists.id }" ${map.oneClassifyId==lists.id?'selected':'' }>${lists.classifyName
									}</option>
							</c:forEach>
					</select>
					
					</td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">该商品的二级分类： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2">
					
					<select name="twoClassifyId" id="twoClassifyId"  onchange="changeThree(this);">
					<option value="" >请选择...</option>
							<c:forEach items="${twoClassifyList }" var="lists">
								<option value="${lists.id }" ${map.twoClassifyId==lists.id?'selected':'' }>${lists.classifyName
									}</option>
							</c:forEach>
					</select>
					
					
					</td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">该商品的三级分类： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2">
					<select name="threeClassifyId" id="threeClassifyId">
					<option value="" >请选择...</option>
							<c:forEach items="${threeClassifyList }" var="lists">
								<option value="${lists.id }" ${map.threeClassifyId==lists.id?'selected':'' }>${lists.classifyName
									}</option>
							</c:forEach>
					</select>
					
					</td>
				</tr>
				<%--
				<tr height="25">
					<td class="outDetail" style="width: 30%">运输方式： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><select id="transport" name="transport">
							<option value="快递" ${map.transport=='快递'?'selected':'' }>快递</option>
							<option value="平邮" ${map.transport=='平邮'?'selected':'' }>平邮</option>
							<option value="直送" ${map.transport=='直送'?'selected':'' }>直送</option>
					</select></td>
				</tr> --%>
				<tr height="25">
					<td class="outDetail" style="width: 30%">库存： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input type="text" id="kc"
						value="${map.kc }" name="kc" /></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">商品介绍： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2">
						<textarea rows="3" cols="50" name="miaoshu" id="miaoshu">${map.miaoshu }</textarea>
					</td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">该蔬菜的保险日期： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input name="freshTime" id="freshTime" value="<fmt:formatDate  value="${map.freshTime }" type="both" pattern="yyyy-MM-dd" />" type="text" onClick="WdatePicker()"/></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">图片一： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input id="f_fileImg0" name="cmfile"
						onchange="triggerUploadImg0(this);" title="选择图片" type="file">
						<input class="text" type="hidden" name="picOne" id="bbbbbImg0"
						value="${map.picOne }"> <c:if test="${map.picOne!=null }">
							<img style='width:100px;' src="${ctx }/${map.picOne}"
								id="aaaaaImg0" />
						</c:if></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">图片二： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input id="f_fileImg1" name="cmfile"
						onchange="triggerUploadImg1(this);" title="选择图片" type="file">
						<input class="text" type="hidden" name="picTwo" id="bbbbbImg1"
						value="${map.picTwo }"> <c:if test="${map.picTwo!=null }">
							<img style='width:100px;' src="${ctx }/${map.picTwo}"
								id="aaaaaImg1" />
						</c:if></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">图片三： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input id="f_fileImg2" name="cmfile"
						onchange="triggerUploadImg2(this);" title="选择图片" type="file">
						<input class="text" type="hidden" name="picThree" id="bbbbbImg2"
						value="${map.picThree }"> <c:if
							test="${map.picThree!=null }">
							<img style='width:100px;' src="${ctx }/${map.picThree}"
								id="aaaaaImg2" />
						</c:if></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">图片四： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input id="f_fileImg3" name="cmfile"
						onchange="triggerUploadImg3(this);" title="选择图片" type="file">
						<input class="text" type="hidden" name="picFour" id="bbbbbImg3"
						value="${map.picFour }"> <c:if
							test="${map.picFour!=null }">
							<img style='width:100px;' src="${ctx }/${map.picFour}"
								id="aaaaaImg3" />
						</c:if></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">图片五： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input id="f_fileImg4" name="cmfile"
						onchange="triggerUploadImg4(this);" title="选择图片" type="file">
						<input class="text" type="hidden" name="picFive" id="bbbbbImg4"
						value="${map.picFive }"> <c:if
							test="${map.picFive!=null }">
							<img style='width:100px;' src="${ctx }/${map.picFive}"
								id="aaaaaImg4" />
						</c:if></td>
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
	function changeTwo(src){
		var oneId = $(src).val();
		if(oneId!=''&&oneId!=undefined){
			$.post("changeTwo.html", {oneId:oneId}, function(result) {
			result = eval("(" + result + ")");
			if (result.status == "true" || result.status == true) {
				var ou ="<option value=\"\" >请选择...</option>";
				for(var i=0;i<result.data.length;i++){
					ou+="<option value=\""+result.data[i].id+"\" >"+result.data[i].classifyName+"</option>";
				}
				$("#twoClassifyId").html(ou);
			} else {
			}
		});
		}else{
			$("#twoClassifyId").html("<option value=\"\" >请选择...</option>");
		}
	}
	
	function changeThree(src){
		var twoId = $(src).val();
		if(twoId!=''&&twoId!=undefined){
			$.post("changeThree.html", {twoId:twoId}, function(result) {
			result = eval("(" + result + ")");
			if (result.status == "true" || result.status == true) {
				var ou ="<option value=\"\" >请选择...</option>";
				for(var i=0;i<result.data.length;i++){
					ou+="<option value=\""+result.data[i].id+"\" >"+result.data[i].classifyName+"</option>";
				}
				$("#threeClassifyId").html(ou);
			} else {
			}
		});
		}else{
			$("#threeClassifyId").html("<option value=\"\" >请选择...</option>");
		}
	}



	function save(src) {
		var goodName = $("#goodName").val();
		if ($.trim(goodName) == '') {
			alert('商品名称不能为空');
			return false;
		}
		$.post("myGoodEditSave.html", $("#form1").serializeArray(), function(result) {
			result = eval("(" + result + ")");
			if (result.status == "true" || result.status == true) {
				alert('成功');
				saveAnd();
			} else {
				alert('保存失败，请重试');
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
	function triggerUploadImg1(src) {
		$
				.ajaxFileUpload({
					url : '${ctx}/file/upload.json',
					secureuri : false,
					fileElementId : 'f_fileImg1',
					dataType : 'json',
					data : {
						fileloc : 'upload/',
						dir : 'temp'
					},
					success : function(data, status) {
						$("#bbbbbImg1").val(data.data.filepath);
						$("#aaaaaImg1").remove();
						$("#bbbbbImg1")
								.after(
										"<img  id='aaaaaImg1' style='width:100px;' src='${ctx}/"+data.data.filepath+"' />");
					},
					error : function(data, status, e) {
						alert('文件上传失败');
					}
				});
	}
	function triggerUploadImg2(src) {
		$
				.ajaxFileUpload({
					url : '${ctx}/file/upload.json',
					secureuri : false,
					fileElementId : 'f_fileImg2',
					dataType : 'json',
					data : {
						fileloc : 'upload/',
						dir : 'temp'
					},
					success : function(data, status) {
						$("#bbbbbImg2").val(data.data.filepath);
						$("#aaaaaImg2").remove();
						$("#bbbbbImg2")
								.after(
										"<img  id='aaaaaImg2' style='width:100px;' src='${ctx}/"+data.data.filepath+"' />");
					},
					error : function(data, status, e) {
						alert('文件上传失败');
					}
				});
	}
	function triggerUploadImg3(src) {
		$
				.ajaxFileUpload({
					url : '${ctx}/file/upload.json',
					secureuri : false,
					fileElementId : 'f_fileImg3',
					dataType : 'json',
					data : {
						fileloc : 'upload/',
						dir : 'temp'
					},
					success : function(data, status) {
						$("#bbbbbImg3").val(data.data.filepath);
						$("#aaaaaImg3").remove();
						$("#bbbbbImg3")
								.after(
										"<img  id='aaaaaImg3' style='width:100px;' src='${ctx}/"+data.data.filepath+"' />");
					},
					error : function(data, status, e) {
						alert('文件上传失败');
					}
				});
	}
	function triggerUploadImg4(src) {
		$
				.ajaxFileUpload({
					url : '${ctx}/file/upload.json',
					secureuri : false,
					fileElementId : 'f_fileImg4',
					dataType : 'json',
					data : {
						fileloc : 'upload/',
						dir : 'temp'
					},
					success : function(data, status) {
						$("#bbbbbImg4").val(data.data.filepath);
						$("#aaaaaImg4").remove();
						$("#bbbbbImg4")
								.after(
										"<img  id='aaaaaImg4' style='width:100px;' src='${ctx}/"+data.data.filepath+"' />");
					},
					error : function(data, status, e) {
						alert('文件上传失败');
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

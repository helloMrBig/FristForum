<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@include file="/taglibs.jsp"%>
<%@taglib uri="http://displaytag.sf.net/el" prefix="display"%>
<style type="text/css">
@import url("${ctx}/resource/admin/displaytag/zdisplaytag.css");
@import url("${ctx}/resource/admin/displaytag/alternative.css");
</style>
<html>
	<body>
		<display:table name="list"
			requestURI="myGood.html" class="list"
			id="row" cellspacing="0" cellpadding="0" pagesize="5">
			<display:column style="width:60px;" media="html" title="编号">
				<c:out value="${row_rowNum}"/>
			</display:column>
			<display:column title="用户ID" property="userId"/>
			<display:column title="商品名称" property="goodName"/>
			<display:column title="单价" property="price"/>
			<display:column title="起订量" property="leastNum"/>
			<display:column title="起源地" property="place"/>
			<display:column title="该商品的一级分类" property="oneClassifyId"/>
			<display:column title="该商品的二级分类" property="twoClassifyId"/>
			<display:column title="该商品的三级分类" property="threeClassifyId"/>
			<display:column title="运输方式" property="transport"/>
			<display:column title="该蔬菜的保险日期" property="freshTime"/>
			<display:column title="图片一">
				<img style="width:100px;" src="${ctx}/${row.picOne}"/>
			</display:column>
			<display:column title="图片二">
				<img style="width:100px;" src="${ctx}/${row.picTwo}"/>
			</display:column>
			<display:column title="图片三">
				<img style="width:100px;" src="${ctx}/${row.picThree}"/>
			</display:column>
			<display:column title="图片四">
				<img style="width:100px;" src="${ctx}/${row.picFour}"/>
			</display:column>
			<display:column title="图片五">
				<img style="width:100px;" src="${ctx}/${row.picFive}"/>
			</display:column>
						<c:choose>
							<c:when test="${param.flag==1 }"></c:when>
							<c:when test="${param.flag==2 }"></c:when>
							<c:when test="${param.flag==3 }"></c:when>
							<c:otherwise>
							
							</c:otherwise>
						</c:choose>
			<display:column title="修改" style="width:40px;">
				<img src="${ctx}/resource/admin/images/pencil.png"
					onclick="return modifyOne('${row.id}');" style="cursor:hand;"/>
			</display:column>
			<display:column title="删除" style="width:40px;">
				<img src="${ctx}/resource/admin/images/delete.png"
					onclick="return deleteOne('${row.id}');" style="cursor:hand;"/>
			</display:column>
		<c:if test="${1==1 }"></c:if>
		</display:table>
	</body>
	<script type="text/javascript">
	function updateColumntransport(transport,id){
		if(!confirm("确定要更新为"+transport+"吗?")){
			return false;
		}
		var params={id:id,transport:transport};
		$.post("updateColumntransport.html",params,function(
				result){
			result=eval("("+result+")");
			if(result.status=="true"||result.status==true){
				alert('成功');
			window.parent.form1.submit();
			}
		});
	}
	function deleteOne(id){
		if(!confirm("确定要删除吗?")){
			return false;
		}
		var params={id:id};
		$.post("editDelete.html",params,function(
				result){
			result=eval("("+result+")");
			if(result.status=="true"||result.status==true){
				alert('成功');
			window.parent.form1.submit();
			}
		});
	}
	function modifyOne(id){
			MyWindow.OpenCenterWindow('edit.html?id='+id+'&flag=${param.flag}','modify',500,600);
	}
</script>
</html>

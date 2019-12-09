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
			requestURI="myOrderList.html" class="list"
			id="row" cellspacing="0" cellpadding="0" pagesize="5">
			<display:column style="width:60px;" media="html" title="编号">
				<c:out value="${row_rowNum}"/>
			</display:column>
			<display:column title="买家的ID" property="buyerName"/>
			<display:column title="卖家的ID" property="sellerName"/>
			<display:column title="商品Id" property="goodId"/>
			<display:column title="商品名称" property="goodName"/>
			<display:column title="单价" property="price"/>
			<display:column title="数量" property="amount"/>
			<display:column title="留言" property="message"/>
			<display:column title="运输方式" property="transport"/>
			<display:column title="总价" property="sum"/>
			<display:column title="生成日期" property="insertDate"/>
			<display:column title="状态">
				<c:if test="${row.status==1 }">已经发货</c:if>
				<c:if test="${row.status==2 }">确认收货</c:if>
			</display:column>
						<c:choose>
							<c:when test="${param.flag==1 }"></c:when>
							<c:when test="${param.flag==2 }"></c:when>
							<c:when test="${param.flag==3 }"></c:when>
							<c:otherwise>
							
							</c:otherwise>
						</c:choose>
			<display:column title="查看详情" style="width:40px;">
				<img src="${ctx}/resource/admin/images/pencil.png"
					onclick="return shows('${row.igId}','${row.goodId }');" style="cursor:hand;"/>
			</display:column>
			<display:column title="确定收货" style="width:40px;">
				<img src="${ctx}/resource/admin/images/pencil.png"
					onclick="return deleteOne('${row.id}');" style="cursor:hand;"/>
			</display:column>
			<display:column title="申请仲裁" style="width:40px;">
				<img src="${ctx}/resource/admin/images/pencil.png"
					onclick="return zc('${row.id}');" style="cursor:hand;"/>
			</display:column>
		</display:table>
	</body>
	<script type="text/javascript">

	function deleteOne(id){
		if(!confirm("确定要收货吗")){
			return false;
		}
		var params={id:id};
		$.post("saveOrder.html",params,function(
				result){
			result=eval("("+result+")");
			if(result.status=="true"||result.status==true){
				alert('成功');
			window.parent.form1.submit();
			}
		});
	}
	
	function zc(id){
			MyWindow.OpenCenterWindow('myOrderEdit.html?id='+id+'&flag=${param.flag}','modify',500,600);
	}
	
	function shows(id,goodId){
			window.open('xq.html?id='+goodId+'&tp=d&xjdId='+id);
	}
</script>
</html>

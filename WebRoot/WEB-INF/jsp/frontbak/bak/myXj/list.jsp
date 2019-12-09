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
			requestURI="myXjList.html" class="list"
			id="row" cellspacing="0" cellpadding="0" pagesize="5">
			<display:column style="width:60px;" media="html" title="编号">
				<c:out value="${row_rowNum}"/>
			</display:column>
			<display:column title="买家" property="buyerName"/>
			<display:column title="卖家" property="sellerName"/>
			<display:column title="商品Id" property="goodId"/>
			<display:column title="需求" property="a6"/>
			<display:column title="数量" property="amount"/>
			<display:column title="总价" property="a11"/>
			<display:column title="运输方式" property="a10"/>
			
			<display:column title="状态" property="status"/>
			<display:column title="生成日期" property="insertDate"/>
						<c:choose>
							<c:when test="${param.flag==1 }"></c:when>
							<c:when test="${param.flag==2 }"></c:when>
							<c:when test="${param.flag==3 }"></c:when>
							<c:otherwise>
							
							</c:otherwise>
						</c:choose>
			<display:column title="查看详情" style="width:40px;">
				<img src="${ctx}/resource/admin/images/pencil.png"
					onclick="return shows('${row.id}','${row.goodId }');" style="cursor:hand;"/>
			</display:column>
			<display:column title="买卖付款" style="width:40px;">
				<img src="${ctx}/resource/admin/images/pencil.png"
					onclick="return dddfe('${row.id}');" style="cursor:hand;"/>
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
	
	function shows(id,goodId){
			window.open('xq.html?id='+goodId+'&tp=b&xjdId='+id);
	}
	
	
	function dddfe(id){
		if(!confirm("确定要买吗")){
			return false;
		}
		var params={id:id};
		$.post("inquirySaveOne.html",{id,status:'卖家确定'},function(
				result){
			result=eval("("+result+")");
			if(result.status=="true"||result.status==true){
				alert('成功');
			window.parent.form1.submit();
			}
		});
	}
	
</script>
</html>

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
			requestURI="myZcList.html" class="list"
			id="row" cellspacing="0" cellpadding="0" pagesize="5">
			<display:column style="width:60px;" media="html" title="编号">
				<c:out value="${row_rowNum}"/>
			</display:column>
			<display:column title="订单Id" property="orderId"/>
			<display:column title="申请人" property="username"/>
			<display:column title="文字描述" property="des"/>
			<display:column title="申请日期" property="insertDate"/>
			<display:column title="希望处理方式" property="wish"/>
			<display:column title="管理员" property="adminName"/>
			<display:column title="仲裁结果" property="zcOut"/>
			<display:column title="仲裁日期" property="zcDate"/>
			<display:column title="仲裁状态">
				<c:if test="${row.status==1 }">处理中</c:if>
				<c:if test="${row.status==2 }">处理完成</c:if>
			</display:column>
						<c:choose>
							<c:when test="${param.flag==1 }"></c:when>
							<c:when test="${param.flag==2 }"></c:when>
							<c:when test="${param.flag==3 }"></c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
		<c:if test="${1==1 }"></c:if>
		</display:table>
	</body>
	<script type="text/javascript">
	function updateColumnuserId(userId,id){
		if(!confirm("确定要更新为"+userId+"吗?")){
			return false;
		}
		var params={id:id,userId:userId};
		$.post("updateColumnuserId.html",params,function(
				result){
			result=eval("("+result+")");
			if(result.status=="true"||result.status==true){
				alert('成功');
			window.parent.form1.submit();
			}
		});
	}
	function updateColumnwish(wish,id){
		if(!confirm("确定要更新为"+wish+"吗?")){
			return false;
		}
		var params={id:id,wish:wish};
		$.post("updateColumnwish.html",params,function(
				result){
			result=eval("("+result+")");
			if(result.status=="true"||result.status==true){
				alert('成功');
			window.parent.form1.submit();
			}
		});
	}
	function updateColumnstatus(status,id){
		if(!confirm("确定要更新为"+status+"吗?")){
			return false;
		}
		var params={id:id,status:status};
		$.post("updateColumnstatus.html",params,function(
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

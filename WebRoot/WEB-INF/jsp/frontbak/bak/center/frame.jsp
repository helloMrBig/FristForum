<%@ page language="java" pageEncoding= "UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/taglibs.jsp"%>
<link rel="StyleSheet" href="${ctx }/resource/admin/css/mobile_main.css" type="text/css" />
<html>
	<body class= "mobile">
		<form id= "form1" name="form1" method="post" action= "myXjList.html"
			target= "query">
			我的账号：${user.username }<br/>
			我的电话号码：${user.phone }<br/>
			我的可以使用钱款：${user.Money }<br/>
			我的冻结钱款：${user.frozen }<br/>
			  
		</form>
		<script>
		
   </script>
	</body>
</html>

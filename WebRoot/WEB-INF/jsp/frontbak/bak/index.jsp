<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="inc_top.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>两湖绿谷首页</title>
<link rel="stylesheet" type="text/css"  href="${ctx }/resource/front/css/页首和页尾.css">
<link rel="stylesheet" type="text/css"  href="${ctx }/resource/front/css/首页.css">
</head>
<style>
	.dposdijf div{float: left;border:1px solid #000}
</style>
<body>
<%@ include file="inc_menu.jsp"%>
<div class="div_line"> </div>
<!--中间商品列表部分-->
<div class="home_block"> </div>


<!--新鲜蔬菜部分-->
<div class="home_block"> </div>

<div class="div_two">
	<div class="home_div_line2"></div>
    <div style="float: left;" class="dposdijf">
    	<c:forEach items="${list }" var="listss">
    	<div style="float: left;" onclick=""><a href="detail.html?id=${listss.id }">
    		<img src="${ctx }/${listss.picOne}" width="230" height="194">
    		<p>${listss.goodName }</p><br>
    		起定量：${listss.leastNum }，单价：<font color="red">${listss.price }/${listss.dw }</font>
    		</a>
    	</div>
    	</c:forEach>
    </div>
</div>

<div class="home_block"> </div>
<%@ include file="inc_top.jsp"%>
</body>
</html>

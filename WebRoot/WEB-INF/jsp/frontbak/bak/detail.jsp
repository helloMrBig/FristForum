<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="inc_top.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>两湖绿谷-商品详情页</title>
<style>
div.div_one{ 
			width:100%; 
			margin:0 auto; 
			padding:0;
			}
div.div_two{
			 width:70%; 
			 margin:2px auto; 
			 padding:0;
			 }
div.div_line{
	 		 width:80%; 
			 margin:0 auto; 
			 padding:0; 
			 background-color:#999; 
			 height:1px;
			 }
input.input_one{ 
			 border-style:solid;
			 border-color:#090; 
			 border-width:4px; 
			 height:38px; 
			 width:70%; 
			 font-size:18px;
			 color:#CCC;
			 }
input.input_two{
			 border-style:solid; 
			 border-color:#090; 
			 background-color:#090; 
			 color:#FFF; 
			 width:10%; 
			 height:48px; 
			 font-size:18px; 
			 padding:1px;
			 }
table.table_one{ width:100%; color:#999}
body{
    margin:0;
	padding:0;
}
a{
    text-decoration:none ;
}
#contain{
    width:80%;
	left:10%;
	position:relative;
}
#top{
    position:relative;
    height:20px;
	margin-top:10px;
}
#detail{
    width:100%;
	
}
#description{
    font-size:20px;
	font-weight:bold;
	font-family: inherit;
	text-rendering: optimizelegibility;
}
#left{
    margin-top:20px;
    float:left;
    width:30%;
	bottom:0px;
}
#right{
    position:relative;
	left:70px;
    float:left;
	width:65%;
}
#money-num{
    margin-top:8%;
	margin-bottom:5%;
    display:block;
}
#phone{
    font-size: 25px;
	color: #666;
    font-family: "Microsoft YaHei";
}
#order{
    width: 158px;
    height: 30px;
	background-color: #299030;
	color:white;
	text-align:center;
	font-size: 17.5px;
	vertical-align: middle;
	padding:11px 19px;
}
#place-order{
    margin-top:30px;
    position:relative;
	left:20%;
}
#describe{
    margin-top:40px;
	font-size:20px;
	line-height:30px;
}
</style>
</head>

<body>
<%@ include file="inc_menu.jsp"%>
<div class="div_line"> </div>
<div id="contain">
    <div id="top">
        <a style="font-size:20px ;left:40px" href="main.html">首页</a>
    </div>
	<div id="detail">
	    <div id="left">
	        <img src="${ctx }/${map.picOne }">
	    </div>
	    <div id="right">
	        <p id="description">${map.goodName}</p>
			<hr width="100%">
			<div id="money-num">
			    <div style="display:inline;"><span>参考价：</span><span id="price" style="font-size: 25px;color: #E4393C">¥${map.price }/${map.dw }</span></div>
				<div style="display:inline; left:10%;position:relative"><span style="font-size:20px;font-weight:bold">起定量：</span><span id="leastnum">${map.leastNum }${map.dw }</span></div>
			</div>
			<table width="80%">
				<tr>
				    <td><p id="address" width="30%">联系电话:${map.phone }</p></td>
					<td><p id="number" width="30%">发货地:${map.place2 }</p></td>
				</tr>
				<tr>
				    <td><p id="origin" width="30%">原产地:${map.place }</p></td>
			        <td><p id="format" width="30%">库存:${map.kc }</p></td>
				</tr>
			</table>
			<div id="phone">
			    <span style="">
			        联系电话 :<b style="color: #E4393C;font-weight: bolder"> ${map.phone }</b>
			    </span>
			</div>
			<div id="place-order">
			    <a href="xq.html?id=${map.id }&tp=a" ><div id="order"><span>填写询价单<span></div></a>
			</div>
			<div id="describe">
			    <p>${map.miaoshu }</p>
			</div>
		</div>
	</div>
</div>

</body>
</html>
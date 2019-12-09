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

<body>
<%@ include file="inc_menu.jsp"%>
<div class="div_line"> </div>
<!--中间商品列表部分-->
<div class="home_block"> </div>
<div class="div_two">
	<table class="home_table1">
    	<tr>
        	<td width="20%" style="width:20%; height:100%;margin:0; border:0;">	
            	<div class="home_div_block" style="background-color:#090"> </div>
            	<div class="home_left_top">全部商品分类</div>  
                <div class="home_div_block" style="background-color:#090"> </div>
            </td>
            <td width="55%" rowspan="4" style="text-align:center">
                <div class="home_left_list" id="img"><img src="${ctx }/resource/front/images/sy/导航图片1.png" width="743" height="419"> </div> 
            </td>
            <td width="25%" rowspan="4" style="text-align:center">
            	<table class="home_table1">
                	<tr>
                    	<td>
                        	<span style="text-align:center; font-size:24px; font-weight:bold; color:#FFF">今日推荐</span>
                        </td>
                    </tr>
                  	<tr>
                    	<td>
                      	  <a href="detail.html?id=11"><img src="${ctx }/resource/front/images/sy/蔬菜0.png" width="226" height="388"></a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
        	<td style="width:20%; height:100%; margin:0; border:0;"> 
            	<div class="home_left_list" onclick="javascript:window.location.href='index.html?oneClassifyId=3'">
                	<span class="left1">水果</span><br>
                    <div class="home_div_line"></div>
                    <span class="left2">苹果 | 桃子 | 香蕉</span><br>
                    <span class="left2">橘子 | 西瓜 | 梨</span><br>
                    <span class="left2">火龙果 | 柠檬 | 柚子</span><br>
                    <div class="home_div_block"></div>
                </div>
            </td>
        </tr>
       <tr >
        	<td style="width:20%; height:100%; margin:0; border:0;"> 
            	<div class="home_left_list" onclick="javascript:window.location.href='index.html?oneClassifyId=2'">
                	<span class="left1">蔬菜</span><br>
                    <div class="home_div_line"></div>
                    <span class="left2">大白菜 | 小白菜 | 韭菜</span><br>
                    <span class="left2">韭黄 | 大葱 | 大蒜</span><br>
                    <span class="left2">黄瓜 | 苦瓜 | 油菜</span><br>
                    <div class="home_div_block"></div>
                </div>
            </td>
      </tr>
        <tr >
        	<td style="width:20%; height:100%; margin:0; border:0;"> 
            	<div class="home_left_list" onclick="javascript:window.location.href='index.html?oneClassifyId=4'">
                	<span class="left1">粮油</span><br>
                    <div class="home_div_line"></div>
                    <span class="left2">阴米 | 香大米 | 黑米</span><br>
                    <span class="left2">大豆油 | 橄榄油 | 玉米油</span><br>
                    <span class="left2">花生油 | 山茶油 | 糯米</span><br>
                    <div class="home_div_block"></div>
                </div>
            </td>
        </tr>
    </table>
</div>

<!--新鲜蔬菜部分-->
<div class="home_block"> </div>

<div class="div_two">
	<span class="span_headline">鲜享水果</span>
	<div class="home_div_line2"></div>
    <table class="home_table3" cellspacing="0">
    	<tr>
        	<td class="table2_td" width="20%" rowspan="2"><a href="detail.html?id=17"><img src="${ctx }/resource/front/images/sy/水果0.png" width="257" height="477"></a></td>
            <td class="table2_td" width="24%" height="230"><img src="${ctx }/resource/front/images/sy/水果1.png" width="260" height="204"></td>
            <td class="table2_td" width="28%"><img src="${ctx }/resource/front/images/sy/水果2.png" width="272" height="161"></td>
            <td class="table2_td" width="28%"><img src="${ctx }/resource/front/images/sy/水果3.png" width="280" height="182"></td>
        </tr>
        <tr>
        	<td class="table2_td"><img src="${ctx }/resource/front/images/sy/水果4.png" width="230" height="194"></td>
            <td class="table2_td"><img src="${ctx }/resource/front/images/sy/水果5.png" width="258" height="184"></td>
			<td class="table2_td"><img src="${ctx }/resource/front/images/sy/水果6.png" width="269" height="181"></td>
        </tr>
    </table>
</div>

<!--新鲜水果部分-->
<div class="home_block"> </div>

<div class="div_two">
	<span class="span_headline">新鲜蔬菜</span>
	<div class="home_div_line2"></div>
    <table class="home_table3" cellspacing="0">
    	<tr>
        	<td class="table2_td" width="20%" rowspan="2"><img src="${ctx }/resource/front/images/sy/蔬菜0.png" width="257" height="477"></td>
            <td class="table2_td" width="24%" height="230"><img src="${ctx }/resource/front/images/sy/蔬菜1.png" width="260" height="204"></td>
            <td class="table2_td" width="28%"><img src="${ctx }/resource/front/images/sy/蔬菜2.png" width="272" height="161"></td>
            <td class="table2_td" width="28%"><img src="${ctx }/resource/front/images/sy/蔬菜3.png" width="280" height="182"></td>
        </tr>
        <tr>
        	<td class="table2_td"><img src="${ctx }/resource/front/images/sy/蔬菜4.png" width="230" height="194"></td>
            <td class="table2_td"><img src="${ctx }/resource/front/images/sy/蔬菜5.png" width="258" height="184"></td>
			<td class="table2_td"><img src="${ctx }/resource/front/images/sy/蔬菜6.png" width="269" height="181"></td>
        </tr>
    </table>
</div>

<!--安全粮油部分-->
<div class="home_block"> </div>

<div class="div_two">
	<span class="span_headline">安全粮油</span>
	<div class="home_div_line3"></div>
    <table class="home_table3" cellspacing="0">
    	<tr>
        	<td class="table2_td" width="20%" rowspan="2"><a href="detail.html?id=11"><img src="${ctx }/resource/front/images/sy/粮油0.png" width="257" height="477"></a></td>
            <td class="table2_td" width="24%" height="230"><a href="detail.html?id=10"><img src="${ctx }/resource/front/images/sy/粮油1.png" width="260" height="204"></a></td>
            <td class="table2_td" width="28%"><a href="detail.html?id=12"><img src="${ctx }/resource/front/images/sy/粮油2.png" width="272" height="161"></a></td>
            <td class="table2_td" width="28%"><a href="detail.html?id=13"><img src="${ctx }/resource/front/images/sy/粮油3.png" width="280" height="182"></a></td>
        </tr>
        <tr>
        	<td class="table2_td"><a href="detail.html?id=14"><img src="${ctx }/resource/front/images/sy/粮油4.png" width="230" height="194"></a></td>
            <td class="table2_td"><a href="detail.html?id=15"><img src="${ctx }/resource/front/images/sy/粮油5.png" width="258" height="184"></a></td>
			<td class="table2_td"><a href="detail.html?id=16"><img src="${ctx }/resource/front/images/sy/粮油6.png" width="269" height="181">
			<p>粮油5</p><br>起定量：12，单价：<font color="red">100/元</font></a></td>
        </tr>
    </table>
</div>
<div class="home_block"> </div>
<%@ include file="inc_top.jsp"%>
</body>
</html>

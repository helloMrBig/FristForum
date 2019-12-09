<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="inc_top.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>两湖绿谷-卖家确认询价单</title>
<link rel="stylesheet" type="text/css" href="${ctx }/resource/front/css/页首和页尾.css">
<link rel="stylesheet" type="text/css" href="${ctx }/resource/front/css/买家询价单.css">
</head>

<body>
<%@ include file="inc_menu.jsp"%>
<form id="form1">
<input type="hidden" value="${map.id }" name="goodId"/>
	<input type="hidden" value="${map.userId }" name="sellerId"/>
<div class="div_line"> </div>
<!-- 产品信息-->
<div class="home_block"></div>
<div class="div_two">
	<table>
    	<tr>
        	<td></td>
        </tr>
    </table>
</div>

<!--产品信息模块-->
<div class="home_block"></div>
<div class="div_two"> 
	<table>
    	<tr>
        	<td style="text-align:left; width:25%"><span class="xunspan1">产品信息</span></td>
        </tr>
        <tr>
        	<td style="width:25%"><div class="tablediv"></div> </td>
        </tr>
    </table>
    <table class="xuntable1" cellspacing="0">
    	<tr>
        	<th class="xuntable1_td" style="text-align:center; width:20%">缩略图</th>
            <th class="xuntable1_td" style="text-align:center; width:10%">货品名称</th>
            <th class="xuntable1_td" style="text-align:center; width:10%">货品编号</th>
            <th class="xuntable1_td" style="text-align:center; width:10%">所在地</th>
            <th class="xuntable1_td" style="text-align:center; width:10%">数量单位</th>
            <th class="xuntable1_td" style="text-align:center; width:10%">挂牌价（元）</th>
            <th class="xuntable1_td" style="text-align:center; width:10%">库存</th>
            <th class="xuntable1_td" style="text-align:center; width:10%">可选配送方式</th>
        </tr>
        <tr>
        	<td class="xuntable1_td" rowspan="2" style="text-align:center">
            	<img src="${ctx }/${map.picOne}">
            </td>
            <td class="xuntable1_td" rowspan="2" style="text-align:center">
            	<span class="xunspan3">${map.goodName }</span>
            </td>
            <td class="xuntable1_td" rowspan="2" style="text-align:center">
            	<span class="xunspan3">${map.id }</span>
            </td>
            <td class="xuntable1_td" rowspan="2" style="text-align:center">
            	<span class="xunspan3">${map.place }</span>
            </td>
            <td class="xuntable1_td" rowspan="2" style="text-align:center">
            	<span class="xunspan3">${map.dw }</span>
            </td>
            <td class="xuntable1_td" rowspan="2" style="text-align:center">
            	<span class="xunspan3">${map.price }</span>
            </td>
            <td class="xuntable1_td" rowspan="2" style="text-align:center">
            	<span class="xunspan3">${map.kc }</span>
            </td>
            <td class="xuntable1_td" style="text-align:center"><span class="xunspan3">两湖配送</span></td>
        </tr>
        <tr><td class="xuntable1_td" style="text-align:center"><span class="xunspan3">上门自提</span></td></tr>

    </table>
</div>

<!--收货人信息模块-->
<div class="home_block"></div>
<div class="div_two">
	<table>
    	<tr>
        	<td style="text-align:left; width:25%"><span class="xunspan1">收货人信息</span></td>
        </tr>
        <tr>
        	<td style="width:25%"><div class="tablediv"></div> </td>
        </tr>
    </table>
    <table class="xuntable2" cellspacing="0">
    <tr>
    	<td style="text-align:right; width:10%"><span class="xunspan3">*收货人姓名：</span></td>
        <td><input class="xuninput1" type="text" name="a1" value="${xjd.a1 }"></td>
    </tr>
    <tr>
    	<td style="text-align:right; width:10%"><span class="xunspan3">*地址：</span></td>
        <td><input class="xuninput1" type="text" name="a2" value="${xjd.a2 }"></td>
    </tr>
    <tr>
    	<td style="text-align:right; width:10%"><span class="xunspan3">*邮编：</span></td>
        <td><input class="xuninput1" type="text"  name="a3" value="${xjd.a3 }"></td>
    </tr>
    <tr>
    	<td style="text-align:right; width:10%"><span class="xunspan3">*联系电话：</span></td>
        <td><input class="xuninput1" type="text" name="a4" value="${xjd.a4 }"></td>
    </tr>
    </table>
</div>
<!--需求信息-->
<div class="home_block"></div>
<div class="div_two">
	<table>
    	<tr>
        	<td style="text-align:left; width:25%"><span class="xunspan1">需求信息</span></td>
        </tr>
        <tr>
        	<td style="width:25%"><div class="tablediv"></div> </td>
        </tr>
    </table>
    <table class="xuntable2" cellspacing="0">
    <tr>
    	<td style="text-align:right; width:10%"><span class="xunspan3">*交货期：</span></td>
        <td><input class="xuninput1" type="text"  name="a5" value="${xjd.a5 }"></td>
    </tr>
    <tr>
    	<td style="text-align:right; width:10%"><span class="xunspan3">*需求单价：</span></td>
        <td><input class="xuninput1" type="text" onchange="changesdw();"  value="${xjd.a6 }"  name="a6"></td>
    </tr>
    <tr>
    	<td style="text-align:right; width:10%"><span class="xunspan3">*需求数量：</span></td>
        <td><input class="xuninput1" type="text" onchange="changesdw();"  value="${xjd.amount }"  name="amount"></td>
    </tr>
    <tr>
    	<td style="text-align:right; width:10%"><span class="xunspan3">*买家留言：</span></td>
        <td><input class="xuninput2" type="text"  name="a8" value="${xjd.a8 }"></td>
    </tr>
    </table>
</div>

<!--配送方式-->
<div class="home_block"></div>
<div class="div_two">
	<table>
    	<tr>
        	<td style="text-align:left; width:25%"><span class="xunspan1">配送方式</span></td>
        </tr>
        <tr>
        	<td style="width:25%"><div class="tablediv"></div> </td>
        </tr>
    </table>
    <table class="xuntable3" cellspacing="0">
    	<tr>
        	<td>
        			<c:if test="${param.tp=='a' }">
        				<label><input  type="radio" checked="checked" onclick="changesdw();" value="两湖配送"  name="a10"><span class="xuninput2">两湖配送</span></label><br><br>
                    	<label><input type="radio" value="上门自提" onclick="changesdw();"  name="a10"><span class="xuninput2">上门自提</span></label>
        			</c:if>
        			<c:if test="${param.tp=='b'||param.tp=='c'||param.tp=='d' }">
        				<label><input  type="radio" ${xjd.a10=='两湖配送'?'checked':'' } onclick="changesdw();" value="两湖配送"  name="a10"><span class="xuninput2">两湖配送</span></label><br><br>
                    	<label><input type="radio" ${xjd.a10=='上门自提'?'checked':'' } value="上门自提" onclick="changesdw();"  name="a10"><span class="xuninput2">上门自提</span></label>
        			</c:if>
                	
            </td>
        </tr>
    </table>
</div>
<!--结算信息-->
<div class="home_block"></div>
<c:if test="${param.tp=='a' }">
<div class="div_two">
	<table>
    	<tr>
        	<td style="text-align:left; width:25%"><span class="xunspan1">结算信息</span></td>
        </tr>
        <tr>
        	<td style="width:25%"><div class="tablediv"></div> </td>
        </tr>
    </table>
    <table class="xuntable4" cellspacing="0">
    <tr>
    	<td style="text-align:right; width:10%"><span class="xunspan3">数量：</span></td>
        <td id="numsShow"></td>
        <td style="text-align:center; font-size:36px; font-weight:600">总金额:</td>
        <td rowspan="3">
        	
            	<input type="button" onclick="javascript:window.history.go(-1);" value="放弃" class="xuninput3"><br><br>
                <input type="button" value="提交" onclick="send();" class="xuninput3">
            
        </td>
    </tr>
    <tr>
    	<td style="text-align:right; width:10%"><span class="xunspan3">产品总金额：</span></td>
        <td><input type="text" readonly="readonly" name="a12"/></td>
        <td rowspan="2" style="text-align:center; font-size:36px; font-weight:700"><input type="text" readonly="readonly" name="a11"/></td>
    </tr>
    <tr>
    	<td style="text-align:right; width:10%"><span class="xunspan3">运费：</span></td>
        <td>200(自提免运费)</td>
    </tr>
    </table>
</div>
</c:if>
<c:if test="${param.tp=='b'||param.tp=='c' }">
<div class="div_two">
	<table>
    	<tr>
        	<td style="text-align:left; width:25%"><span class="xunspan1">结算信息</span></td>
        </tr>
        <tr>
        	<td style="width:25%"><div class="tablediv"></div> </td>
        </tr>
    </table>
    <table class="xuntable4" cellspacing="0">
    <tr>
    	<td style="text-align:right; width:10%"><span class="xunspan3">数量：</span></td>
        <td>${xjd.amount }</td>
        <td style="text-align:center; font-size:36px; font-weight:600">总金额</td>
    </tr>
    <tr>
    	<td style="text-align:right; width:10%"><span class="xunspan3">产品总金额：</span></td>
        <td>${xjd.a6*xjd.amount }</td>
        <td rowspan="2" style="text-align:center; font-size:36px; font-weight:700">${xjd.a11 }</td>
    </tr>
    <tr>
    	<td style="text-align:right; width:10%"><span class="xunspan3">运费：</span></td>
        <td>200.0(自提免运费)</td>
    </tr>
    </table>
</div>


</c:if>
<c:if test="${param.tp=='b' }">

</c:if>
<c:if test="${param.tp=='c' }">
<!--卖家确认-->
<div class="home_block"></div>
<div class="div_two">
	<table>
    	<tr>
        	<td style="text-align:left; width:25%"><span class="xuninput4">卖家确认</span></td>
        </tr>
        <tr>
        	<td style="width:25%"><div class="tablediv"></div> </td>
        </tr>
    </table>
    <table class="xuntable3" cellspacing="0">
    <tr>
    	<td>
            	<label><input name="a13" type="radio" value="1"><span class="xuninput3">是</span></label><br>
                <hr>
                <label><input name="a13" type="radio"  value="2"><span class="xuninput3">否</span></label>
        </td>
    </tr>
    <tr>
    	<td style="width:10%; text-align:right"><span class="xunspan3">建议价格：</span></td>
        <td>
            <form><input type="text" name="a14" class="xuninput1"></form>
        </td> 
    </tr>
    <tr>
    	<td style="width:10%; text-align:right"><span class="xunspan3">建议：</span></td>
        <td>
        	<input type="text" name="a15" class="xuninput2">
        </td>
    </tr>
    <tr>
   		<td></td>
    	<td style="width:100%; text-align:center">
        <form><input type="button" onclick="tj();" class="xuninput4" value="提交"></form>
        </td>
    </tr>
    </table>
</div>
</c:if>
</form>
<%@ include file="inc_top.jsp"%>
</body>
<script type="text/javascript">
		function send(){
			var amount = $("input[name='amount']").val();//数量
			var a6 = $("input[name='a6']").val();//单价
			var kc = '${map.kc}';
			
			if(kc==''){
				kc=0;
			}
			if(new Number(amount)>kc){
				alert('数量不能大于库存');
				return false;
			}
			$.post("inquirySave2.html", $("#form1").serializeArray(), function(result) {
			result = eval("(" + result + ")");
			if (result.status == "true" || result.status == true) {
				alert('询价成功');
				window.location.reload();
			} else {
				alert('保存失败，请重试');
			}
		});
		}
		
		function  changesdw(){
			var amount = $("input[name='amount']").val();//数量
			$("#numsShow").html(amount);
			var a6 = $("input[name='a6']").val();//单价
			$("input[name='a12']").val(a6*amount);
			//判定选择的
			var a10 = $("input[name='a10']:checked").val();
			if(a10=='两湖配送'){
				$("input[name='a11']").val(a6*amount+200);
			}else{
				$("input[name='a11']").val(a6*amount);
			}
			
		}
		
		
		
		function tj(){
		var a13 = $("input[name='a13']:checked").val();//单价
		var a14 = $("input[name='a14']").val();//单价
		var a15 = $("input[name='a15']").val();//单价
		var id = '${xjd.id}';
		var params={id:id,a13:a13,a14:a14,a15:a15};
		$.post("flowSave.html",params,function(
				result){
			result=eval("("+result+")");
			if(result.status=="true"||result.status==true){
				alert('成功');
			window.close();
			}
		});
	}
	
	
	</script>
</html>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="inc_top.jsp"%>
<!DOCTYPE html>
<html lang="en">
     <head>
     	<%@ include file="inc_head.jsp"%>
     </head>
     <body>
       <div class="main">
<!--==============================header=================================-->
<%@ include file="inc_menu.jsp"%>
<!--=======content================================-->

  <div class="container_12">
    <div class="grid_6">
      <h2>${map.goodName }</h2>
      <hr>
      <table style="border: ">
      	<tr>
      		<td>价格：</td>
      		<td>${map.price }/元${map.dw }</td>
      		<td>规格：</td>
      		<td>${map.leastNum }</td>
      	</tr>
      	<tr>
      		<td>商品编号：</td>
      		<td>${map.id }</td>
      		<td>起定量：</td>
      		<td>${map.price }/元${map.dw }</td>
      	</tr>
      	<tr>
      		<td>发货地：</td>
      		<td>${map.place }</td>
      		<td>原产地：</td>
      		<td>${map.place }</td>
      	</tr>
      	<tr>
      		<td>联系电话：</td>
      		<td>${map.phone }</td>
      		<td>商家：</td>
      		<td>${map.username }</td>
      	</tr>
      	<tr>
      		<td>剩余库存：</td>
      		<td>${map.kc }</td>
      	</tr>
      </table>
            <div class="map">
            <c:if test="${map.picOne!=null }">
            <img src="${ctx }/${map.picOne}">
 			</c:if>
 			<c:if test="${map.picTwo!=null }">
            <img src="${ctx }/${map.picTwo}">
 			</c:if>
 			<c:if test="${map.picThree!=null }">
            <img src="${ctx }/${map.picThree}">
 			</c:if>
 			<c:if test="${map.picFour!=null }">
            <img src="${ctx }/${map.picFour}">
 			</c:if>
 			<c:if test="${map.picFive!=null }">
            <img src="${ctx }/${map.picFive}">
 			</c:if>
          </div>
    </div>
    
    
    <form id="form1" class="lllform">
	<input type="hidden" value="${map.id }" name="goodId"/>
	<input type="hidden" value="${map.userId }" name="sellerId"/>
    <div class="grid_5 prefix_1">
      <h2>询价</h2>
      <fieldset>
      <label class="name">
      	单价：${map.price }/元<input type="hidden" value="${map.price }" name="price">
      <br class="clear">
       </label>
      <label class="password">
     	 数量：<input type="text" value="1" name="amount"  onchange="changesdw();">
      <br class="clear">
      </label>
      <label class="password">
     	 希望单价：<input type="text" value="${map.price }" name="xwdj" onchange="changesdw();">
      <br class="clear">
      </label>
      <label class="password">
     	 总价：<input type="text" readonly="readonly" value="" name="sum">
      <br class="clear">
      </label>
      <label class="password">
     	 询价单：<input type="text" value="" name="xjd">
      <br class="clear">
      </label>
      <label class="password">
     	 运输方式：
     	 <select id="transport" name="transport">
							<option value="快递" >快递</option>
							<option value="平邮" >平邮</option>
							<option value="直送" >直送</option>
					</select>
      <br class="clear">
      </label>
      <label class="password">
     	 留言：
     	<textarea rows="5" id="message"
							cols="50" name="message"></textarea>
      <br class="clear">
      </label>
      <div class="clear"></div>
      <div class="btns"><a data-type="reset" class="btn" onclick="send();">发送</a>
      <div class="clear"></div>
      </div>
     </fieldset>
    </div>
    </form>
    
    
    
    
    <div class="clear"></div>
    <div class="bottom_block">
     
      </div>
      <div class="clear"></div>
    </div>
  </div>
</div>
<!--==============================footer=================================-->

<%@ include file="inc_foot.jsp"%>
</body>
	<script type="text/javascript">
		function send(){
			var amount = $("input[name='amount']").val();
			var kc = '${map.kc}';
			
			if(kc==''){
				kc=0;
			}
			if(new Number(amount)>kc){
				alert('数量不能大于库存');
				return false;
			}
			$.post("inquirySave.html", $("#form1").serializeArray(), function(result) {
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
			var amount = $("input[name='amount']").val();
			var xwdj=$("input[name='xwdj']").val();
			var sum = $("input[name='sum']").val(amount*xwdj);
		}
	</script>
</html>
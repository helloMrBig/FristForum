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
<div class="div_one" >
    <table style="width:100%; height:25px; background-color:#C9C9C9;" border="0">
       <tr>
       	 <td style="width:1%"></td>
       	 <td style="width:70%;"><big><strong>欢迎来到两湖绿谷网!</strong></big></td>
       	 <td style="width:10%; text-align:center;"><a href="main.html"><strong>首页</strong></a></td>
         
         <c:choose>
         	<c:when test="${userBean!=null }">
         		<td><a href="mine.html"><strong>${userBean.username }(${userBean.phone })</strong></a></td>
         	</c:when>
         	<c:otherwise>
         		<td style="width:10%; text-align:right"><a href="login.html"><strong>登录</strong></a></td>
         		<td style="width:1%; text-align:center"><p>|</p></td>
         		<td><a href="register.html"><strong>注册</strong></a></td>
         	</c:otherwise>
         </c:choose>
         <c:if test="${userBean!=null }"><td><a href="out.html"><strong>注销</strong></a></td></c:if>
         
         
         
         
       </tr>
    </table>
</div>
<!--页头的搜索栏部分-->
<div class="div_two">
	<table width="100%" style="width:100%">
    	<tr>
        	<td style="width:20%;"><img src="${ctx }/resource/front/images/sy/logo.jpg" width="290" height="65"></td>  
            <td style="width:52%; text-align:center;">
            </td>	
            <td style="width:8%; text-align:right;"></td>
        	<td style="width:1%; text-align:center"></td>
         	<td style="width:%"></td>
      </tr>
    </table>
</div>
<!--=======content================================-->
<form id= "form1" name="form1" method="post" action= ""
			target= "queryaa">
<div class="content">
  <div class="container_12">
  	<div class="bottom_block">
        <nav style="font-size: 22px;"><ul>
        		<li><a href="#" onclick="goppp(0);">个人中心</a></li>
                <li><a href="#" onclick="goppp(1);">我的商品</a></li>
				<li><a href="#" onclick="goppp(2);">我的订单</a></li>
				<li><a href="#" onclick="goppp(3);">我的询价</a></li>
				<li><a href="#" onclick="goppp(4);">我的被询价</a></li>
				<li><a href="#" onclick="goppp(5);">我的仲裁</a></li>
				<li><a href="#" onclick="goppp(6);">仓库管理</a></li>
             </ul>
        </nav>
      </div>
  <iframe id= "queryaa" name= "queryaa" frameborder= "0" height= "98%"
				width= "100%" scrolling= "yes"></iframe>
    <div class="clear"></div>
    <div class="bottom_block">
      </div>
      <div class="clear"></div>
    </div>
  </div>
</div>
</form>
<%@ include file="inc_foot.jsp"%>
</body>
<script type="text/javascript">
	function goppp(flag){
		var aa="";
		if(flag==1){
			aa="myGoodFrame.html";
		}else if(flag==2){
			aa="myOrderFrame.html";
		}else if(flag==3){
			aa="myXjFrame.html";
		}else if(flag==4){
			aa="myXjBeiFrame.html";
		}else if(flag==5){
			aa="myZcFrame.html";
		}else if(flag==6){
			aa="myGoodFrame.html?apps=kc";
		}else if(flag==0){
			aa="center.html";
		}
		form1.action=aa;
		form1.submit();
	}
</script>
</html>
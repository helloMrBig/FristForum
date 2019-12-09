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
      <div class="grid_12">
      
      <c:forEach items="${list }" var="lists" varStatus="vs">
      	<div class="car_wrap">
        <h2>${flList[vs.index].classifyName }</h2>
        <ul class="carousel1">
        	<c:forEach items="${lists }" var="listss">
        		<li><a href="detail.html?id=${listss.id }"><div><img src="${ctx }/${listss.picOne}" alt="">
		          <div class="col1 upp"> ${listss.goodName }</div>
		          <span> ${listss.oneClassifyName }>${listss.twoClassifyName }>${listss.threeClassifyName }</span>
		          <div class="price">${listss.price }</div></div>
		          </a></li>
        	</c:forEach>
        </ul>
      </div>
      </c:forEach>
      
    </div>
    <div class="clear"></div>
    <div class="bottom_block">
      </div>
      <div class="clear"></div>
    </div>
  </div>
</div>
<%@ include file="inc_foot.jsp"%>
</body>
</html>
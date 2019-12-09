<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
    <%@ include file="inc/inc_inc.jsp"%>
  <body>

    <div class="container containermine">
    	<c:forEach items="${rdList }" var="lists">
    		<div class="jumbotron">
		        <p><a class="btn btn-lg btn-success" href="${lists.url }" target="_blank" role="button">${lists.title }</a></p>
		      </div>
    	</c:forEach>
      
		<div class="row">
		
		<c:forEach items="${cwList }" var="lists">
    		<div class="col-lg-4">
	          <h2>宠物名称：${lists.cwName }</h2>
	          <p>宠物种类：${lists.zl }</p>
	          <p>宠物品种：${lists.pz }</p>
	          <p>宠物性别：${lists.sex }</p>
	          <p><a class="btn btn-primary" href="cwshow.html?id=${lists.id }" role="button" >查看详情</a></p>
	        </div>
    	</c:forEach>
		
        
      </div>
    </div> <!-- /container -->
  </body>
</html>

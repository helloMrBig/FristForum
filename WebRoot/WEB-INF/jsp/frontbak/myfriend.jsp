<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
    <%@ include file="inc/inc_inc.jsp"%>
  <body>

    <div class="container containermine">
    
    
      <div class="row">
      	<c:forEach items="${list }" var="lists">
      		<div class="col-lg-4">
          	<h2>${lists.name }</h2>
          	<p>
          	<c:choose>
          		<c:when test="${lists.isGz==1 }">
          			<a class="btn btn-danger" href="#" onclick="qxgz('${lists.id}');" role="button">取消关注</a>
          		</c:when>
          		<c:otherwise>
          			<a class="btn btn-primary" href="#"  onclick="gz('${lists.id}');" role="button">关注</a>
          		</c:otherwise>
          	</c:choose>
          	
          	
          	</p>
        	</div>
      	</c:forEach>
        
      </div>

    </div> <!-- /container -->
  </body>
  <script type="text/javascript">
  	function qxgz(id){
		$.ajax({
			type : "POST",
			async : false, // 设置同步方式
			cache : false,
			url : "qxgz.html",
			data : {id:id},
			success : function(result) {
				result = eval("(" + result + ")");
				if (result.status == 'true' || result.status == true) {
					alert('取消成功');
						window.location.reload();
				}
			}
		});
  	}
  	
  	function gz(id){
		$.ajax({
			type : "POST",
			async : false, // 设置同步方式
			cache : false,
			url : "gz.html",
			data : {id:id},
			success : function(result) {
				result = eval("(" + result + ")");
				if (result.status == 'true' || result.status == true) {
					alert('关注成功');
						window.location.reload();
				}
			}
		});
  	}
  </script>
</html>

<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
    <%@ include file="inc/inc_inc.jsp"%>
  <body>
	
    <div class="container containermine">
    <c:if test="${param.dpc!=1 }">
    <a class="btn btn-primary" href="wdxxEdit.html"  role="button">发布一条动态</a></c:if>
    <main id="content" class="content" role="main">

<c:forEach items="${list }" var="lists">
<article class="post">
    <header class="post-header">
        <h2 class="post-title"><a href="wdxxShow.html?id=${lists.id }">${lists.title }</a></h2>
    </header>
    <section class="post-excerpt">
        <p>${lists.content }</p>
    </section>
    <footer class="post-meta">
        <time class="post-date" datetime="2016-06-21">${lists.insertDate }</time>
    </footer>
</article>
</c:forEach>


</main>
    

    </div> <!-- /container -->
  </body>
  <script type="text/javascript">
  	function search(){
  		form1.submit();
  	}
  
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

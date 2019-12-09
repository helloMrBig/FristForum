<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
    <%@ include file="inc/inc_inc.jsp"%>
  <body>
	
    <div class="container containermine">
    <main id="content" class="content" role="main">

<article class="post">
    <header class="post-header">
        <h2 class="post-title">${map.title }<span class="label label-danger" style="cursor: pointer;" onclick="zan('${map.id}');">赞(${map.zan })</span></h2>
    </header>
    <section class="post-excerpt">
    	<img src="${ctx }/${map.pic}">
        <p>${map.content }</p>
    </section>
    <footer class="post-meta">
        <time class="post-date" datetime="2016-06-21">${map.insertDate }</time>
    </footer>
</article>
</main>

<ul class="list-group">
	<c:forEach items="${list }" var="lists">
		<li class="list-group-item">${lists.customerName }:${lists.content }(${lists.insertDate })</li>
	</c:forEach>
</ul>
<form id="form1">
	<input type="hidden" name="wdxxId" value="${map.id }"/>
    <table class="mobile" style="width: 95%;">
				<tr height="25">
					<td class="outDetail" style="width: 30%">评论内容： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><textarea  class="form-control" rows="5" id="content"
							cols="50" name="content"></textarea></td>
				</tr>
			</table>
    <input type="button" class="btn btn-default" value="发表评论"
				onclick="save(this);" />
    
    </form>
    

    </div> <!-- /container -->
  </body>
  <script type="text/javascript">
  	function save(src) {
		$.post("pinglunSave.html", $("#form1").serializeArray(), function(result) {
			result = eval("(" + result + ")");
			if (result.status == "true" || result.status == true) {
				alert('成功');
				window.location.reload();
			} else {
				alert('保存失败，请重试');
			}
		});
	}
	
	function zan(id) {
		$.post("zanSave.html", {id:id}, function(result) {
			result = eval("(" + result + ")");
			if (result.status == "true" || result.status == true) {
				alert('点赞成功');
				window.location.reload();
			} else {
				alert('保存失败，请重试');
			}
		});
	}
  </script>
</html>

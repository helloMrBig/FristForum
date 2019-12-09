<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
    <%@ include file="inc/inc_inc.jsp"%>
  <body>
   <%@ include file="inc/inc_menu.jsp"%>

    <div class="container containermine" style="height: 1500px;" >
		<iframe id= "query" name= "query" frameborder= "0" height= "100%"
				width= "100%" ></iframe>
      <form id= "form1" name="form1" method="post" action= "home.html"
			target= "query">
	</form>
    </div> <!-- /container -->
  </body>
  <script type="text/javascript">
  	form1.submit();
  </script>
</html>

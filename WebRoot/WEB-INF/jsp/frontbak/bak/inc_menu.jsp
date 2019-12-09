<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!--页头--><!--页头的顶部-->
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
            <form>
            	<input type="text" name="searchName" placeholder="" class="input_one" > 
                <input type="button" onclick="search();" value="搜索" class="input_two">
            </form>
            </td>	
            <td style="width:8%; text-align:right;"></td>
        	<td style="width:1%; text-align:center"></td>
         	<td style="width:%"></td>
      </tr>
    </table>
</div>
    <script>
    	function search(){
    		var searchName = $("input[name='searchName']").val();
    		window.location.href="index.html?searchName="+searchName;
    	}
    </script>

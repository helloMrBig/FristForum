<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

 <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <!-- The mobile navbar-toggle button can be safely removed since you do not need it in a non-responsive implementation -->
          <img src="${ctx }/resource/head.png" style="width: 50px;padding-right: 10px;">
        </div>
        <div class="navbar-header">
          <!-- The mobile navbar-toggle button can be safely removed since you do not need it in a non-responsive implementation -->
          <a class="navbar-brand" href="#">宠物领养系统</a>
          
        </div>
        <!-- Note that the .navbar-collapse and .collapse classes have been removed from the #navbar -->
        <div id="navbar">
          <ul class="nav navbar-nav">
            <li class="active"><a href="home.html"  target="query">首页</a></li>
            <c:if test="${customerBean!=null }">
            <li class="active"><a href="friend.html"  target="query">搜索朋友</a></li>
            <li class="active"><a href="hywdxxList.html?dpc=1"  target="query">好友动态</a></li>
            
            </c:if>
            <%--
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li role="separator" class="divider"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">Separated link</a></li>
                <li><a href="#">One more separated link</a></li>
              </ul>
            </li>
             --%>
          </ul>
          <ul class="nav navbar-nav navbar-right">
          <c:choose>
         	<c:when test="${customerBean!=null }">
         	
         		<li><a href="#">${customerBean.username }(${customerBean.phone })</a></li>
         		<c:if test="${customerBean!=null }">
         		<li class="active"><a href="myfriend.html"  target="query">我的好友</a></li>
         		<li class="active"><a href="wdxxList.html"  target="query">我的动态</a></li>
         		<li class="active"><a href="mycw.html"  target="query">我的领养宠物</a></li>
         		
         		<li><a href="mine.html" target="query">个人信息</a></li>
         		<li><a href="out.html">注销</a></li>
         		</c:if>
         	</c:when>
         	<c:otherwise>
         		<li><a href="login.html" target="query">登录</a></li>
            	<li><a href="register.html" target="query">注册</a></li>
         	</c:otherwise>
         </c:choose>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
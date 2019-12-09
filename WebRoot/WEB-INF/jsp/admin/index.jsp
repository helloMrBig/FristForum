<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script>
var ctx='${ctx}';
</script>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>E互联论坛</title>
    <link href="${ctx }/resource/mine/one/css/bootstrap.css" rel="stylesheet" />
    <link href="${ctx }/resource/mine/one/css/font-awesome.css" rel="stylesheet" />
    <link href="${ctx }/resource/mine/one/css/custom-styles.css" rel="stylesheet" />
</head>

<body>
    <div id="wrapper">
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <a class="navbar-brand" href="index.html"><strong><i class="icon fa"></i>E互联论坛</strong></a>
            </div>

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="${ctx}/admin/password.html" target="ifContent"><i class="fa fa-gear fa-fw"></i> 修改密码</a></li>
                        <li class="divider"></li>
                        <li><a href="${ctx }/adminLogin/out.html"><i class="fa fa-sign-out fa-fw"></i> 注销(${adminBean.username })</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                   
                    <li>
                        <a href="#"><i class="fa fa-file"></i>用户管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                             <li><a href="${ctx}/admin/customer/frame.html?flag=1" target="ifContent"><i class="fa fa-file"></i>全部用户</a></li>
                            <li><a href="${ctx}/admin/customer/frame.html?flag=1&app=123" target="ifContent"><i class="fa fa-file"></i>禁言用户</a></li>
						</ul>
					</li>
                    <%--<li><a href="${ctx}/admin/pinglun/frame.html?flag=1" target="ifContent"><i class="fa fa-file"></i>评论管理</a></li> --%>
                    <li><a href="${ctx}/admin/wdxx/frame.html?flag=1" target="ifContent"><i class="fa fa-file"></i>帖子管理</a></li>
                    <li><a href="${ctx}/admin/bk/frame.html?flag=1" target="ifContent"><i class="fa fa-file"></i>论坛板区管理</a></li>
                    <li><a href="${ctx}/admin/ltsm/edit.html" target="ifContent"><i class="fa fa-file"></i>论坛说明列表</a></li>
                    <li><a href="${ctx}/admin/mgc/frame.html?flag=1" target="ifContent"><i class="fa fa-file"></i>敏感词列表</a></li>
                    <li>
                        <a href="#"><i class="fa fa-file"></i>统计中心<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="${ctx}/admin/tj/tj1.html" target="ifContent"><i class="fa fa-file"></i>按天统计维护发送数量</a></li>
                            <li><a href="${ctx}/admin/tj/tj2.html" target="ifContent"><i class="fa fa-file"></i>按天统计注册用户数量</a></li>
						</ul>
					</li>
					<%--<li>
                        <a href="#"><i class="fa fa-file"></i>其他<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="chart.html"  target="ifContent">Charts JS</a></li>
                            <li><a href="morris-chart.html"  target="ifContent">Morris Chart</a></li>
						</ul>
					</li> --%>	
                </ul>
            </div>
        </nav>
		<div id="page-wrapper" style="min-height: auto;height: 90%;">
			<iframe name="ifContent" id="ifContent"  src="${ctx }/admin/main.html" width="100%" height="100%" frameborder="0" scrolling="no"></iframe>
        </div>
    </div>
    <script src="${ctx }/resource/mine/one/js/jquery-1.10.2.js"></script>
    <script src="${ctx }/resource/mine/one/js/bootstrap.min.js"></script>
    <script src="${ctx }/resource/mine/one/js/jquery.metisMenu.js"></script>
    <script src="${ctx }/resource/mine/one/js/morris/raphael-2.1.0.min.js"></script>
    <script src="${ctx }/resource/mine/one/js/morris/morris.js"></script>
    <script src="${ctx }/resource/mine/one/js/custom-scripts.js"></script>
</body>
</html>

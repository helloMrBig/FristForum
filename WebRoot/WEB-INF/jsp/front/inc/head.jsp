<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<head>
<!-- META TAGS -->
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>E互联论坛</title>
<!-- Style Sheet-->
<link rel='stylesheet' id='bootstrap-css-css' href='${ctx }/resource/front/css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
<link rel='stylesheet' id='responsive-css-css' href='${ctx }/resource/front/css/responsive5152.css?ver=1.0' type='text/css' media='all' />
<link rel='stylesheet' id='pretty-photo-css-css' href='${ctx }/resource/front/js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css' media='all' />
<link rel='stylesheet' id='main-css-css' href='${ctx }/resource/front/css/main5152.css?ver=1.0' type='text/css' media='all' />
<link rel='stylesheet' id='red-skin-css' href='${ctx }/resource/front/css/red-skin5152.css?ver=1.0' type='text/css' media='all' />
<link rel='stylesheet' id='custom-css-css' href='${ctx }/resource/front/css/custom5152.html?ver=1.0' type='text/css' media='all' />
<script type='text/javascript' src='${ctx }/resource/front/js/jquery-1.8.3.min.js'></script>
    <script type="text/javascript" src="${ctx }/resource/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/resource/admin/js/ajaxfileupload.js"></script>


<script type="text/javascript">
function checkIsLogin(){
		var out =false;
		$.ajax({
		      type: "POST",
		      async:false,  // 设置同步方式
		      cache:false,
		      url: "${ctx}/front/checkIsLogin.html",
				data:{id:1},
				success:function(result){
				result = eval("("+result+")");
				if(result.status=='true'||result.status==true){
					out=true;
				}else{
					out=false;
				}
		      }
			});
			return out;
	}

<%-- 
		if(!checkIsLogin()){
			alert('请先登录');
			window.location.href='${ctx}/front/login.html';
			return false;
		}
--%>


</script>


</head>
<body>
	<!-- Start of Header -->
	<div class="header-wrapper">
		<header>
			<div class="container">
				<div class="logo-container">
					<!-- Website Logo -->
					<a href="index.html" title="Knowledge Base Theme"> <img
						src="${ctx }/resource/front/images/logo.png" alt="Knowledge Base Theme"> </a> <span
						class="tag-line">E互联论坛</span>
				</div>


				<!-- Start of Main Navigation -->
				<nav class="main-nav">
					<div class="menu-top-menu-container">
						<ul id="menu-top-menu" class="clearfix">
							<li><a href="index.html" >论坛首页</a></li>
			         		<li><a href="ltgz.html" >论坛规则</a></li>
						 <c:choose>
			         	<c:when test="${customerBean!=null }">
			         		<c:if test="${customerBean!=null }">
			         		<li><a href="wdxxList.html">我的帖子</a></li>
			         		<li><a href="mine.html" >个人信息</a></li>
			         		<li><a href="#"><img src="${ctx }/${customerBean.headPic }" style="height: 30px;">${customerBean.username }(${customerBean.phone })</a></li>
			         		<li><a href="out.html">注销</a></li>
			         		</c:if>
			         	</c:when>
			         	<c:otherwise>
			         		
			         		<li><a href="login.html" >登录</a></li>
			            	<li><a href="register.html" >注册</a></li>
			         	</c:otherwise>
			         </c:choose>
						
						
							
							<%--
							<li><a href="#">Skins</a>
								<ul class="sub-menu">
									<li><a href="blue-skin.html">Blue Skin</a>
									</li>
									<li><a href="green-skin.html">Green Skin</a>
									</li>
									<li class="current-menu-item"><a href="red-skin.html">Red
											Skin</a>
									</li>
									<li><a href="index-2.html">Default Skin</a>
									</li>
								</ul></li> --%>
							
						</ul>
					</div>
				</nav>
				<!-- End of Main Navigation -->

			</div>
		</header>
	</div>
	<div class="search-area-wrapper">
                        <div class="search-area container">
                                <h3 class="search-header">欢迎使用 E互联论坛</h3>

                                <form id="searchform" name="searchform" class="search-form clearfix" method="POST" action="${ctx }/front/index.html" autocomplete="off" novalidate="novalidate">
                                        <input class="search-term required" type="text" id="searchName" name="searchName" placeholder="帖子标题模糊查询" title="">
                                        <input class="search-btn" type="button" onclick="searchAA();" value="搜索帖子">
                                        <div id="search-error-container"></div>
                                </form>
                        </div>
                </div>
                <script type="text/javascript">
                
                	function searchAA(){
                		searchform.submit();
                	}
                </script>
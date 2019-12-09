<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!-- start of sidebar -->
                                        <aside class="span4 page-sidebar">

                                                <section class="widget">
                                                        <div class="support-widget">
                                                                <h3 class="title">E互联论坛</h3>
                                                                <p class="intro">欢迎使用E互联论坛</p>
                                                        </div>
                                                </section>

                                                <section class="widget">
                                                        <div class="quick-links-widget">
                                                                <h3 class="title">版块选择</h3>
                                                                <ul id="menu-quick-links" class="menu clearfix">
                                                                	<c:forEach items="${rightBkList }" var="lists">
                                                                		<li><a href="bk.html?id=${lists.id }">${lists.bkName }</a></li>
                                                                	</c:forEach>
                                                                </ul>
                                                        </div>
                                                </section>


                                        </aside>
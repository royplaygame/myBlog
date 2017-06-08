<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="sidebar" id="sidebar">
		<script type="text/javascript">
			try {
				ace.settings.check('sidebar', 'fixed')
			} catch (e) {
			}
		</script>

		<div class="sidebar-shortcuts" id="sidebar-shortcuts">
			<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
				<span class="btn btn-success"></span> <span class="btn btn-info"></span>

				<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
			</div>
		</div>
		<!-- #sidebar-shortcuts -->

		<ul id="navlist" class="nav nav-list">
			<li class="active"><a href="${pageContext.request.contextPath}/console/toConsoleList"> <i
					class="icon-dashboard"></i> <span class="menu-text"> 控制台 </span>
			</a></li>

			<li><a href="${pageContext.request.contextPath}/article/toArticleList"> <i class="icon-user"></i> <span
					class="menu-text"> 文章管理</span>
			</a></li>

			<li><a href="${pageContext.request.contextPath}/user/toUserList"> <i class="icon-desktop"></i> <span
					class="menu-text"> 账号管理 </span>
			</a></li>
		</ul>
		<!-- /.nav-list -->

		<div class="sidebar-collapse" id="sidebar-collapse">
			<i class="icon-double-angle-left" data-icon1="icon-double-angle-left"
				data-icon2="icon-double-angle-right"></i>
		</div>

		<script type="text/javascript">
			try {
				ace.settings.check('sidebar', 'collapsed')
			} catch (e) {
			}
		</script>
	</div>
</body>
</html>
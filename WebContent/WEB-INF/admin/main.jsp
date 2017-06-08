<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>控制台-微商后台管理系统</title>
<!-- 统一添加表单验证提示颜色 -->
<style type="text/css">
.error {
	color: red;
}
</style>
<meta name="keywords"
	content="Bootstrap模版,Bootstrap模版下载,Bootstrap教程,Bootstrap中文" />
<meta name="description"
	content="站长素材提供Bootstrap模版,Bootstrap教程,Bootstrap中文翻译等相关Bootstrap插件下载" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- basic styles -->
<link
	href="../admin/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="../admin/assets/css/font-awesome.min.css"
	rel="stylesheet" />

<!--[if IE 7]>
		  <link rel="stylesheet" href="../admin/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

<!-- page specific plugin styles -->
<link rel="stylesheet" href="../admin/assets/css/jquery.gritter.css" />
<link rel="stylesheet" href="../admin/assets/css/ui.jqgrid.css" />


<!-- ace styles -->

<link rel="stylesheet" href="../admin/assets/css/ace.min.css" />
<link rel="stylesheet" href="../admin/assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="../admin/assets/css/ace-skins.min.css" />

<!--[if lte IE 8]>
		  <link rel="stylesheet" href="../admin/assets/css/ace-ie.min.css" />
		<![endif]-->

<!-- inline styles related to this page -->

<!-- basic scripts -->

<!--[if !IE]> -->

<!-- <script src="assets/js/jquery-2.0.3.min.js"></script> -->
<script src="../admin/assets/js/jquery-1.10.2.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="../admin/assets/js/jquery-1.10.2.min.js"></script>
<![endif]-->

<!--[if !IE]> -->

<script type="text/javascript">
	window.jQuery
			|| document.write("<script src='../admin/assets/js/jquery-2.0.3.min.js'>"
					+ "<"+"script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='../admin/assets/js/jquery-1.10.2.min.js'>"+"<"+"script>");
</script>
<![endif]-->

<!--[if lt IE 9]>
		<script src="../admin/assets/js/html5shiv.js"></script>
		<script src="../admin/assets/js/respond.min.js"></script>
		<![endif]-->

<script src="../admin/assets/js/bootstrap.min.js"></script>
<script src="../admin/assets/js/typeahead-bs2.min.js"></script>


<!--[if lte IE 8]>
		  <script src="assets/js/excanvas.min.js"></script>
		<![endif]-->

<script src="../admin/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="../admin/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="../admin/assets/js/jquery.slimscroll.min.js"></script>
<script src="../admin/assets/js/jquery.easy-pie-chart.min.js"></script>
<script src="../admin/assets/js/jquery.sparkline.min.js"></script>
<script src="../admin/assets/js/flot/jquery.flot.min.js"></script>
<script src="../admin/assets/js/flot/jquery.flot.pie.min.js"></script>
<script src="../admin/assets/js/flot/jquery.flot.resize.min.js"></script>
<script src="../admin/assets/js/jquery.gritter.min.js"></script>

<script src="../admin/assets/js/jqGrid/jquery.jqGrid.min.js"></script>
<script src="../admin/assets/js/jqGrid/i18n/grid.locale-cn.js"></script>
<script type="text/javascript" src="../admin/assets/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="../admin/assets/js/messages.cn.js"></script>

<!-- ace scripts -->
<script src="../admin/assets/js/ace-extra.min.js"></script>
<script src="../admin/assets/js/ace-elements.min.js"></script>
<script src="../admin/assets/js/ace.min.js"></script>
<script src="../admin/layer/layer.js"></script>


<!-- highchart图表 -->
<script type="text/javascript" src="../admin/js/highcharts.js"></script>
<script type="text/javascript" src="../admin/js/highcharts-3d.js"></script>
<script type="text/javascript" src="../admin/js/highcharts-more.js"></script>
<script type="text/javascript" src="../admin/js/exporting.js"></script>

</head>
<body>
	<div class="navbar navbar-default" id="navbar">
		<script type="text/javascript">
			try {
				ace.settings.check('navbar', 'fixed')
			} catch (e) {
			}
		</script>

		<div class="navbar-container" id="navbar-container">
			<div class="navbar-header pull-left">
				<a href="#" class="navbar-brand"> <small> <i
						class="icon-desktop"></i> 博客后台管理系统
				</small>
				</a>
				<!-- /.brand -->
			</div>
			<!-- /.navbar-header -->

			<div class="navbar-header pull-right" role="navigation">
				<ul class="nav ace-nav">
					<li class="light-blue"><a data-toggle="dropdown" href="#"
						class="dropdown-toggle"> <img class="nav-user-photo"
							src="../admin/assets/avatars/user.jpg" alt="Jason's Photo" /> <span
							class="user-info"> <small>欢迎光临,</small>
								${userInfo.userName}
						</span> <i class="icon-caret-down"></i>
					</a>

						<ul
							class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							<li><a href="#"> <i class="icon-cog"></i> 设置
							</a></li>

							<li><a href="#"> <i class="icon-user"></i> 个人资料
							</a></li>

							<li class="divider"></li>

							<li><a
								href="${pageContext.request.contextPath}/user/toLogin"> <i
									class="icon-off"></i> 退出
							</a></li>
						</ul></li>
				</ul>
				<!-- /.ace-nav -->
			</div>
			<!-- /.navbar-header -->
		</div>
		<!-- /.container -->
	</div>

	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>

		<div class="main-container-inner">
			<a class="menu-toggler" id="menu-toggler" href="#"> <span
				class="menu-text"></span>
			</a>

			<!-- 左侧导航条 -->
			<%@include file="admin_left.jsp"%>

			<div class="main-content">
				<div class="breadcrumbs" id="breadcrumbs">
					<script type="text/javascript">
						try {
							ace.settings.check('breadcrumbs', 'fixed')
						} catch (e) {
						}
					</script>

					<ul class="breadcrumb">
						<li><i class="icon-ok green"></i> 欢迎使用 <strong class="green">
								博客后台管理系统 </strong></li>
					</ul>
					<!-- .breadcrumb -->
					<!-- #nav-search -->
				</div>

				<div class="page-content" id="mainContent">
					<div class="page-header">
						<h1>
							控制台 <small> <i class="icon-double-angle-right"></i> 查看
							</small>
						</h1>
					</div>
					<!-- /.page-header -->

					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->
							<div class="row">
								<div class="space-6"></div>

								<div class="col-sm-7 infobox-container">
									<div class="infobox infobox-blue  ">
										<div class="infobox-icon">
											<i class="icon-user"></i>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number">11</span>
											<div class="infobox-content">用户数量</div>
										</div>

										<div class="badge badge-success">
											+32% <i class="icon-arrow-up"></i>
										</div>
									</div>

									<div class="infobox infobox-pink  ">
										<div class="infobox-icon">
											<i class="icon-shopping-cart"></i>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number">8</span>
											<div class="infobox-content">新订单</div>
										</div>
										<div class="stat stat-important">4%</div>
									</div>
									<div class="infobox infobox-orange2  ">
										<div class="infobox-chart">
											<span class="sparkline"
												data-values="196,128,202,177,154,94,100,170,224"></span>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number">6,251</span>
											<div class="infobox-content">页面查看次数</div>
										</div>

										<div class="badge badge-success">
											7.2% <i class="icon-arrow-up"></i>
										</div>
									</div>

									<div class="infobox infobox-red  ">
										<div class="infobox-icon">
											<i class="icon-beaker"></i>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number">7</span>
											<div class="infobox-content">调查</div>
										</div>
									</div>

									<div class="infobox infobox-orange2  ">
										<div class="infobox-chart">
											<span class="sparkline"
												data-values="196,128,202,177,154,94,100,170,224"></span>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number">6,251</span>
											<div class="infobox-content">页面查看次数</div>
										</div>

										<div class="badge badge-success">
											7.2% <i class="icon-arrow-up"></i>
										</div>
									</div>

									<div class="infobox infobox-blue2  ">
										<div class="infobox-progress">
											<div class="easy-pie-chart percentage" data-percent="42"
												data-size="46">
												<span class="percent">42</span>%
											</div>
										</div>

										<div class="infobox-data">
											<span class="infobox-text">交易使用</span>

											<div class="infobox-content">
												<span class="bigger-110">~</span> 剩余58GB
											</div>
										</div>
									</div>

									<div class="space-6"></div>

								</div>
							</div>

							<div class="vspace-sm"></div>

							<!-- /span -->
						</div>
						<!-- /row -->

						<div class="hr hr32 hr-dotted"></div>

						<!-- /row -->
						<!-- PAGE CONTENT ENDS -->
					</div>
					<!-- /.row -->
					<!-- /.page-content -->
				</div>
				<!-- /.page-content -->
			</div>
			<!-- /.main-content -->

			<div class="ace-settings-container" id="ace-settings-container">
				<div class="btn btn-app btn-xs btn-warning ace-settings-btn"
					id="ace-settings-btn">
					<i class="icon-cog bigger-150"></i>
				</div>

				<div class="ace-settings-box" id="ace-settings-box">
					<div>
						<div class="pull-left">
							<select id="skin-colorpicker" class="hide">
								<option data-skin="default" value="#438EB9">#438EB9</option>
								<option data-skin="skin-1" value="#222A2D">#222A2D</option>
								<option data-skin="skin-2" value="#C6487E">#C6487E</option>
								<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
							</select>
						</div>
						<span>&nbsp; 选择皮肤</span>
					</div>

					<div>
						<input type="checkbox" class="ace ace-checkbox-2"
							id="ace-settings-navbar" /> <label class="lbl"
							for="ace-settings-navbar"> 固定导航条</label>
					</div>

					<div>
						<input type="checkbox" class="ace ace-checkbox-2"
							id="ace-settings-sidebar" /> <label class="lbl"
							for="ace-settings-sidebar"> 固定滑动条</label>
					</div>

					<div>
						<input type="checkbox" class="ace ace-checkbox-2"
							id="ace-settings-breadcrumbs" /> <label class="lbl"
							for="ace-settings-breadcrumbs">固定面包屑</label>
					</div>

					<div>
						<input type="checkbox" class="ace ace-checkbox-2"
							id="ace-settings-rtl" /> <label class="lbl"
							for="ace-settings-rtl">切换到左边</label>
					</div>

					<div>
						<input type="checkbox" class="ace ace-checkbox-2"
							id="ace-settings-add-container" /> <label class="lbl"
							for="ace-settings-add-container"> 切换窄屏 <b></b>
						</label>
					</div>
				</div>
			</div>
			<!-- /#ace-settings-container -->
		</div>
		<!-- /.main-container-inner -->
	</div>
	<!-- /.main-container -->
</body>
</html>
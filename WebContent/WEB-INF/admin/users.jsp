<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>控制台-微博后台管理系统</title>
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
								href="${pageContext.request.contextPath}/userInfo/logout"> <i
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
							帐号<small> <i class="icon-double-angle-right"></i> 管理
							</small>
						</h1>
					</div>

					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->
							<table id="grid-table"></table>
							<div id="grid-pager"></div>
							<!-- PAGE CONTENT ENDS -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
					<!-- Modal -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel">添加新用户</h4>
								</div>
								<div class="modal-body">
									<form class="form-horizontal" role="form">
										<input type="hidden" id="userId" />
										<div class="form-group">
											<label for="userName" class="col-sm-2 control-label">用户帐号</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="userName"
													id="userName" placeholder="请输入用户帐号" />
											</div>
										</div>
										<div class="form-group">
											<label for="userPass" class="col-sm-2 control-label">用户密码</label>
											<div class="col-sm-6">
												<input type="password" class="form-control" name="userPass"
													id="userPass" placeholder="请输入用户密码" />
											</div>
										</div>

										<div class="form-group">
											<label for="mobile" class="col-sm-2 control-label">手机号码</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" id="mobile"
													name="mobile" placeholder="请输入手机号码" />
											</div>
										</div>
										<div class="form-group">
											<label for="address" class="col-sm-2 control-label">用户地址</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" id="address"
													name="address" placeholder="请输入用户地址" />
											</div>
										</div>
										<div class="form-group">
											<label for="role" class="col-sm-2 control-label">用户角色</label>
											<div class="col-sm-6">
												<select id="roleType">
													<!-- <option value="0" selected>系统管理员</option>
								<option value="1">普通用户</option>
								<option value="2">仓库管理员</option> -->
												</select>
											</div>
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<button type="button" id="modal-ok" class="btn btn-primary">保存</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->
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

	<!-- <script type="text/javascript" src="assets/js/ajaxfileupload.js"></script> -->
	<script type="text/javascript">
		jQuery(function() {
			/*表单校验*/
			function validateForm() {
				return $("#myModal").find("form").first().validate({
					rules : {
						userName : {
							required : true,
							rangelength : [ 5, 10 ]
						},
						userPass : {
							required : true,
							rangelength : [ 6, 10 ]
						},
						mobile : {
							required : true,
							rangelength : [ 11, 11 ]
						},
						address : {
							required : true,
							maxlength : 50
						},
						role : {
							required : true,
						}
					},
				}).form();
			}
			/*modal关闭时候取消绑定事件*/
			$('#myModal').on('hidden.bs.modal', function(e) {
				$("#modal-ok").unbind('click');
				//清空表单
				$('#myModal :input').not(':button').val('');
				$('#id-input-file-2').show().nextAll().remove();
			});
			$("#grid-table")
					.jqGrid(
							{
								url : "${pageContext.request.contextPath}/user/findUserList",
								//data : mydata,
								datatype : "json",
								height : '340',//表格高度
								mtype : 'POST',
								colNames : [ "用户编号", '用户帐号','密码', '角色' ],
								colModel : [
										{
											name : 'id',
											index : 'id',
											align : "center",
											editable : false,
											key : true/*pk*/,
										},
										{
											name : 'userName',
											index : 'userName',
											align : "center",
											editable : true
										},	
										{
											name : 'passWord',
											index : 'userName',
											align : "center",
											editable : true
										},	
										{
											name : 'role',
											index : 'role',
											align : "center",
											editable : true,
											formatter : function(cell, options,
													obj) {
												if (cell == 1001) {
													return '<span class="label label-success label-xlg  arrowed-in-right arrowed">系统管理员</span>';
												} else if (cell == 1002) {
													return '<span class="label label-xlg  arrowed-in-right arrowed">仓库管理员</span>';
												} else if (cell == 1003) {
													return '<span class="label label-info label-xlg  arrowed-in-right arrowed">采购员</span>'
												} else if (cell == 1004) {
													return '<span class="label label-info label-xlg  arrowed-in-right arrowed">大老板</span>'
												} else {
													return '<span class="label label-xlg  arrowed-in-right arrowed">普通用户</span>';
												}
											}
										} ],
								jsonReader : {
									root : "list",
									page : "page",
									total : "total",
									records : "records",
									repeatitems : false
								},
								rowNum : 10,
								caption : "用户列表",
								pager : $("#grid-pager"),
								viewrecords : true,
								rowList : [ 10, 20, 30 ],
								altRows : true,
								multiselect : false,
								multiboxonly : false,
								loadComplete : function() {
									//修改样式
									var table = this;
									setTimeout(function() {
										updatePagerIcons(table);
										enableTooltips(table);
									}, 0);
								},
								autowidth : true
							})
					.navGrid(
							'#grid-pager',
							{
								edit : true,
								editicon : 'icon-pencil blue',
								add : true,
								addicon : 'icon-plus-sign purple',
								del : true,
								delicon : 'icon-trash red',
								search : false,
								searchicon : 'icon-search orange',
								refresh : true,
								refreshicon : 'icon-refresh green',
								view : true,
								viewicon : 'icon-zoom-in grey',
								addfunc : function() {
									$('#myModal').modal({ //打开对话框
										keyboard : true
									});
									$('#myModalLabel').text('添加帐号');
									//为窗口确定按钮绑定事件
									$("#modal-ok").show();
									$("#myModal").find('#userName').removeAttr(
											"readonly");
									$("#myModal").find('#userPass').removeAttr(
											"readonly");
									$("#myModal").find('#mobile').removeAttr(
											"readonly");
									$("#myModal").find('#address').removeAttr(
											"readonly");
									$("#myModal").find('#role').removeAttr(
											'disabled');
									//给用户角色动态赋值
									$
											.post(
													"${pageContext.request.contextPath}/userInfo/getRoleList",
													function(data) {
														$(JSON.parse(data))
																.each(
																		function() {
																			var opt = $(
																					"<option/>")
																					.text(
																							this.roleName)
																					.attr(
																							"value",
																							this.roleId);
																			$(
																					"#roleType")
																					.append(
																							opt);
																		});
													});

									$("#modal-ok").on("click", {
										oper : 'save'
									}, addUser);
								},
								editfunc : function(x) {
									$('#myModal').modal({ //打开对话框
										keyboard : true
									});
									$('#myModalLabel').text('修改用户');
									$("#modal-ok").show();
									var srcrowid = $("#grid-table").jqGrid(
											"getGridParam", "selrow");
									var data = $("#grid-table").jqGrid(
											'getRowData', srcrowid);
									$("#myModal").find('#userId').val(
											data.userId);
									$("#myModal").find('#userName').val(
											data.userName).removeAttr(
											"readonly");
									$("#myModal").find('#userPass').val(
											data.userPass).removeAttr(
											"readonly");
									$("#myModal").find('#mobile').val(
											data.mobile).removeAttr("readonly");
									$("#myModal").find('#address').val(
											data.address)
											.removeAttr("readonly");
									$("#myModal").find('#role').removeAttr(
											'disabled');
									var roleIds = $("#myModal").find(
											'#role option');
									for (var i = 0; roleIds.length; i++) {
										if (roleIds[i].text == $(data.role)
												.html()) {
											roleIds[i].selected = true;
										}
									}
									$("#modal-ok").on("click", {
										oper : 'edit'
									}, editUser);
								},
								delfunc : function() {
									var srcrowid = $("#grid-table").jqGrid(
											"getGridParam", "selrow");
									var data = $("#grid-table").jqGrid(
											'getRowData', srcrowid);
									var userId = data.userId;
									//弹出提示信息
									layer
											.confirm(
													'您确定要删除这条记录吗？',
													{
														btn : [ '确认', '取消' ]
													},
													function() {
														$
																.post(
																		'${pageContext.request.contextPath}/userInfo/delUserInfo',
																		$
																				.param(
																						{
																							userId : userId
																						},
																						true),
																		function() {
																			layer
																					.msg(
																							'帐号删除成功！',
																							{
																								icon : 1
																							});
																			$(
																					"#grid-table")
																					.jqGrid(
																							"setGridParam",
																							{
																								page : $(
																										"#grid-table")
																										.jqGrid(
																												"getGridParam",
																												'page')
																							})
																					.trigger(
																							'reloadGrid');
																		});
													}, function() {
														layer.msg('想好了再点我！', {
															time : 2000
														});
													});
								},
								viewfunc : function() {
									$('#myModal').modal({ //打开对话框
										keyboard : true
									});
									$('#myModalLabel').text('查看帐号');
									var srcrowid = $("#grid-table").jqGrid(
											"getGridParam", "selrow");
									var data = $("#grid-table").jqGrid(
											'getRowData', srcrowid);
									$("#myModal").find('#userName').val(
											data.userName).attr('readonly',
											'readonly');
									$("#myModal").find('#userPass').val(
											data.userPass).attr('readonly',
											'readonly');
									$("#myModal").find('#mobile').val(
											data.mobile).attr('readonly',
											'readonly');
									$("#myModal").find('#address').val(
											data.address).attr('readonly',
											'readonly');
									$("#myModal").find('#role').attr(
											'disabled', 'disabled');
									var roleIds = $("#myModal").find(
											'#role option');
									for (var i = 0; roleIds.length; i++) {
										if (roleIds[i].text == $(data.role)
												.html()) {
											roleIds[i].selected = true;
										}
									}
									$("#modal-ok").hide();
								},
								alerttext : "请选择要操作的数据行"
							});

			//add
			function addUser(evt) {
				if (validateForm()) {//如果验证通过,通过ajax提交后台处理，并再grid中新增记录
					var $this = $(this);
					$this.attr("disabled", "disabled");
					var f = $this.parent().prev().find("form").first();
					var oper = evt.data.oper;
					//获取表单的内容
					var userName = $("#myModal").find('#userName').val();
					var userPass = $("#myModal").find('#userPass').val();
					var mobile = $("#myModal").find('#mobile').val();
					var address = $("#myModal").find('#address').val();
					var role = $("#myModal").find('#role').val();
					var dat = {
						"userName" : userName,
						"userPass" : userPass,
						"mobile" : mobile,
						"address" : address,
						"role" : role
					};

					$
							.ajax(
									"${pageContext.request.contextPath}/userInfo/saveUserInfo",
									{
										type : "POST",
										data : dat,
										success : function(data) { //添加成功，返回新记录的id
											//刷新列表
											$("#grid-table")
													.jqGrid(
															"setGridParam",
															{
																page : $(
																		"#grid-table")
																		.jqGrid(
																				"getGridParam",
																				'page')
															}).trigger(
															'reloadGrid');
											layer.msg('添加帐号成功！', {
												icon : 1
											});
										},
										error : function() {
											layer.msg('添加帐号失败！', {
												icon : 2
											});
										}
									});
					$this.removeAttr("disabled");
					$('#myModal').modal('hide');
				}
			}
			;
			//edit
			function editUser(evt) {
				if (validateForm()) {//如果验证通过,通过ajax提交后台处理，并再grid中新增记录
					var $this = $(this);
					$this.attr("disabled", "disabled");
					var f = $this.parent().prev().find("form").first();
					var oper = evt.data.oper;
					//获取表单的内容
					var userId = $("#myModal").find('#userId').val();
					var userName = $("#myModal").find('#userName').val();
					var userPass = $("#myModal").find('#userPass').val();
					var mobile = $("#myModal").find('#mobile').val();
					var address = $("#myModal").find('#address').val();
					var role = $("#myModal").find('#role').val();
					var dat = {
						"userId" : userId,
						"userName" : userName,
						"userPass" : userPass,
						"mobile" : mobile,
						"address" : address,
						"role" : role
					};
					$
							.ajax(
									"${pageContext.request.contextPath}/userInfo/updateUserInfo",
									{
										type : "POST",
										data : dat,
										success : function(data) { //添加成功，返回新记录的id
											//刷新列表
											$("#grid-table")
													.jqGrid(
															"setGridParam",
															{
																page : $(
																		"#grid-table")
																		.jqGrid(
																				"getGridParam",
																				'page')
															}).trigger(
															'reloadGrid');
											layer.msg('帐号修改成功！', {
												icon : 1
											});
										},
										error : function() {
											layer.msg('帐号修改失败！', {
												icon : 2
											});
										}
									});
					$this.removeAttr("disabled");
					$('#myModal').modal('hide');
				}
			}
			;

			//升级用户按钮
			jQuery("#grid-table")
					.navButtonAdd(
							'#grid-pager',
							{
								caption : "",
								title : "用户升级",
								buttonicon : "icon-upload-alt yellow",
								onClickButton : function() {
									var srcrowid = $("#grid-table").jqGrid(
											"getGridParam", "selrow");
									var data = $("#grid-table").jqGrid(
											'getRowData', srcrowid);
									if (data.userId) {
										layer
												.confirm(
														'您确定要升级用户吗？升级后不能退回。',
														{
															btn : [ '确认', '取消' ]
														},
														function() {
															$
																	.post(
																			"${pageContext.request.contextPath}/userInfo/upgradeUserInfo?userId="
																					+ data.userId,
																			function(
																					data) {
																				if (data == "success") {
																					$(
																							"#grid-table")
																							.jqGrid(
																									"setGridParam",
																									{
																										page : $(
																												"#grid-table")
																												.jqGrid(
																														"getGridParam",
																														'page')
																									})
																							.trigger(
																									'reloadGrid');
																					layer
																							.msg(
																									'用户升级成功！',
																									{
																										icon : 1
																									});
																				} else {
																					layer
																							.msg(
																									'用户已经是最高等级，不能再升级了！',
																									{
																										icon : 1
																									});
																				}
																			});
														},
														function() {
															layer
																	.msg(
																			'想好了再点我！',
																			{
																				time : 2000
																			});
														});
									} else {
										layer.msg('请选择一个用户，再进行升级！', {
											time : 2000
										});
									}
								},
								position : "last"
							});

			//replace icons with FontAwesome icons like above
			function updatePagerIcons(table) {
				var replacement = {
					'ui-icon-seek-first' : 'icon-double-angle-left bigger-140',
					'ui-icon-seek-prev' : 'icon-angle-left bigger-140',
					'ui-icon-seek-next' : 'icon-angle-right bigger-140',
					'ui-icon-seek-end' : 'icon-double-angle-right bigger-140'
				};
				$(
						'.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon')
						.each(
								function() {
									var icon = $(this);
									var $class = $.trim(icon.attr('class')
											.replace('ui-icon', ''));

									if ($class in replacement)
										icon.attr('class', 'ui-icon '
												+ replacement[$class]);
								})
			}

			function enableTooltips(table) {
				$('.navtable .ui-pg-button').tooltip({
					container : 'body'
				});
				$(table).find('.ui-pg-div').tooltip({
					container : 'body'
				});
			}
		});
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
							<input type="text" class="form-control" name="userName" id="userName"
								placeholder="请输入用户帐号" />
						</div>
					</div>
					<div class="form-group">
						<label for="userPass" class="col-sm-2 control-label">用户密码</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" name="userPass" id="userPass"
								placeholder="请输入用户密码" />
						</div>
					</div>
					
					<div class="form-group">
						<label for="mobile" class="col-sm-2 control-label">手机号码</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="mobile" name="mobile"
								placeholder="请输入手机号码" />
						</div>
					</div>
					<div class="form-group">
						<label for="address" class="col-sm-2 control-label">用户地址</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="address" name="address"
								placeholder="请输入用户地址" />
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
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" id="modal-ok" class="btn btn-primary">保存</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<!-- /.page-content -->
<!-- <script type="text/javascript" src="assets/js/ajaxfileupload.js"></script> -->
<script type="text/javascript">

	jQuery(function() {
		/*表单校验*/
		function validateForm() {
			return $("#myModal").find("form").first().validate({
				rules : {
					userName : {
						required : true,
						rangelength:[5,10]
					},
					userPass : {
						required : true,
						rangelength:[6,10]
					},
					mobile : {
						required : true,
						rangelength:[11,11]
					},
					address : {
						required : true,
						maxlength :50
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
		$("#grid-table").jqGrid({
			url:"${pageContext.request.contextPath}/userInfo/userList",
			//data : mydata,
			datatype : "json",
			height : '280',//表格高度
			mtype: 'POST',
			colNames : [ "用户编号", '用户帐号', '手机', '地址', '用户等级','角色' ],
			colModel : [ {
				name : 'userId',
				index : 'userId',
				align : "center",
				editable : false,
				key : true/*pk*/,
			}, {
				name : 'userName',
				index : 'userName',
				align : "center",
				editable : true
			},  {
				name : 'mobile',
				index : 'mobile',
				align : "center",
				editable : true
			}, {
				name : 'address',
				index : 'address',
				align : "center",
				editable : true
			}, {
				name : 'userLevel',
				index : 'userLevel',
				align : "center",
				editable : true,
				formatter:function(cell,option,obj){
					if(cell==0){
						return '<span class="label label-success label-xlg  arrowed-in-right arrowed">零售</span>';
					}else if(cell==1){
						return '<span class="label label-success label-xlg  arrowed-in-right arrowed">营销</span>';
					}else if(cell==2){
						return '<span class="label label-success label-xlg  arrowed-in-right arrowed">市代</span>';
					}else if(cell==3){
						return '<span class="label label-success label-xlg  arrowed-in-right arrowed">省代</span>';
					}else if(cell==4){
						return '<span class="label label-success label-xlg  arrowed-in-right arrowed">总代</span>';
					}else{
						return '<span class="label label-success label-xlg  arrowed-in-right arrowed">大区</span>';
					}
				}
			},{
				name : 'role',
				index : 'role',
				align : "center",
				editable : true,
				formatter:function(cell,options,obj){
					if(cell==1001){
						return '<span class="label label-success label-xlg  arrowed-in-right arrowed">系统管理员</span>';
					}else if(cell==1002){
						return '<span class="label label-xlg  arrowed-in-right arrowed">仓库管理员</span>';
					}else if(cell==1003){
						return '<span class="label label-info label-xlg  arrowed-in-right arrowed">采购员</span>'
					}else if(cell==1004){
						return '<span class="label label-info label-xlg  arrowed-in-right arrowed">大老板</span>'
					}else{
						return '<span class="label label-xlg  arrowed-in-right arrowed">普通用户</span>';
					}
				}
			}],
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
		}).navGrid(
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
						$("#myModal").find('#userName').removeAttr("readonly");
						$("#myModal").find('#userPass').removeAttr("readonly");
						$("#myModal").find('#mobile').removeAttr("readonly");
						$("#myModal").find('#address').removeAttr("readonly");
						$("#myModal").find('#role').removeAttr('disabled');
						//给用户角色动态赋值
						$.post("${pageContext.request.contextPath}/userInfo/getRoleList",function(data){
							$(JSON.parse(data)).each(function(){
								var opt=$("<option/>").text(this.roleName).attr("value",this.roleId);
								$("#roleType").append(opt);
							});
						});
						
						$("#modal-ok").on("click", {oper : 'save'}, addUser);
					},
					editfunc : function(x) {
						$('#myModal').modal({ //打开对话框
							keyboard : true
						});
						$('#myModalLabel').text('修改用户');
						$("#modal-ok").show();
						var srcrowid = $("#grid-table").jqGrid("getGridParam","selrow");
						var data= $("#grid-table").jqGrid('getRowData',srcrowid);
						$("#myModal").find('#userId').val(data.userId);
						$("#myModal").find('#userName').val(data.userName).removeAttr("readonly");
						$("#myModal").find('#userPass').val(data.userPass).removeAttr("readonly");
						$("#myModal").find('#mobile').val(data.mobile).removeAttr("readonly");
						$("#myModal").find('#address').val(data.address).removeAttr("readonly");
						$("#myModal").find('#role').removeAttr('disabled');
						var roleIds=$("#myModal").find('#role option');
						for(var i=0;roleIds.length;i++){
							if(roleIds[i].text==$(data.role).html()){
								roleIds[i].selected=true;
							}
						}
						$("#modal-ok").on("click", {oper : 'edit'}, editUser);
					},
					delfunc : function() {
						var srcrowid = $("#grid-table").jqGrid("getGridParam","selrow");
						var data = $("#grid-table").jqGrid('getRowData',srcrowid);
						var userId=data.userId;
						//弹出提示信息
						layer.confirm('您确定要删除这条记录吗？',{
							btn :['确认','取消']
						},function(){
							$.post('${pageContext.request.contextPath}/userInfo/delUserInfo', $.param({
								userId : userId
							},true), function() {
								layer.msg('帐号删除成功！', {icon: 1});
								$("#grid-table").jqGrid(
										"setGridParam",
										{
											page : $("#grid-table").jqGrid(
													"getGridParam", 'page')
										}).trigger('reloadGrid');
							}); 
						},function(){
							layer.msg('想好了再点我！',{time:2000});
						});
					},
					viewfunc:function(){
						$('#myModal').modal({ //打开对话框
							keyboard : true
						});
						$('#myModalLabel').text('查看帐号');
						var srcrowid = $("#grid-table").jqGrid("getGridParam","selrow");
						var data= $("#grid-table").jqGrid('getRowData',srcrowid);
						$("#myModal").find('#userName').val(data.userName).attr('readonly','readonly');
						$("#myModal").find('#userPass').val(data.userPass).attr('readonly','readonly');
						$("#myModal").find('#mobile').val(data.mobile).attr('readonly','readonly');
						$("#myModal").find('#address').val(data.address).attr('readonly','readonly');
						$("#myModal").find('#role').attr('disabled','disabled');
						var roleIds=$("#myModal").find('#role option');
						for(var i=0;roleIds.length;i++){
							if(roleIds[i].text==$(data.role).html()){
								roleIds[i].selected=true;
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

				$.ajax("${pageContext.request.contextPath}/userInfo/saveUserInfo", {
							type : "POST",
							data : dat,
							success : function(data) { //添加成功，返回新记录的id
								//刷新列表
								$("#grid-table").jqGrid(
										"setGridParam",
										{
											page : $("#grid-table").jqGrid(
													"getGridParam", 'page')
										}).trigger('reloadGrid');
								layer.msg('添加帐号成功！',{icon: 1});
							},
							error : function() {
								layer.msg('添加帐号失败！',{icon: 2});
							}
						});
				$this.removeAttr("disabled");
				$('#myModal').modal('hide');
			}
		};
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
				$.ajax(
						"${pageContext.request.contextPath}/userInfo/updateUserInfo", {
							type : "POST",
							data : dat,
							success : function(data) { //添加成功，返回新记录的id
								//刷新列表
								$("#grid-table").jqGrid(
										"setGridParam",
										{
											page : $("#grid-table").jqGrid(
													"getGridParam", 'page')
										}).trigger('reloadGrid');
								layer.msg('帐号修改成功！',{icon: 1});
							},
							error : function() {
								layer.msg('帐号修改失败！',{icon: 2});
							}
						});
				$this.removeAttr("disabled");
				$('#myModal').modal('hide');
			}
		};
		
		//升级用户按钮
		jQuery("#grid-table").navButtonAdd('#grid-pager',{
			   caption:"",
			   title:"用户升级",
			   buttonicon:"icon-upload-alt yellow", 
			   onClickButton: function(){ 
				   var srcrowid = $("#grid-table").jqGrid("getGridParam","selrow");
				   var data= $("#grid-table").jqGrid('getRowData',srcrowid);
				   if(data.userId){
					   layer.confirm('您确定要升级用户吗？升级后不能退回。',{
							btn :['确认','取消']
						},function(){
							$.post("${pageContext.request.contextPath}/userInfo/upgradeUserInfo?userId="+data.userId,function(data){
						    	if(data=="success"){
						    		$("#grid-table").jqGrid("setGridParam",{page : $("#grid-table").jqGrid("getGridParam", 'page')}).trigger('reloadGrid');
							    	layer.msg('用户升级成功！', {icon: 1});
						    	}else{
						    		layer.msg('用户已经是最高等级，不能再升级了！', {icon: 1});
						    	}
							});
						},function(){
							layer.msg('想好了再点我！',{time:2000});
						});
			    	}else{
			    		layer.msg('请选择一个用户，再进行升级！', {time: 2000});
			    	}	
			   }, 
			   position:"last"
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
								var $class = $.trim(icon.attr('class').replace(
										'ui-icon', ''));

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
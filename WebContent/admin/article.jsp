<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="page-header">
	<h1>
		文章<small> <i class="icon-double-angle-right"></i> 管理
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
				<h4 class="modal-title" id="myModalLabel">添加新文章</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" role="form">
					<input type="hidden" id="custId" />
					<div class="form-group">
					   <label for="custName" class="col-sm-2 control-label">客户名称</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="custName" id="custName"
								placeholder="请输入客户名称" />
						</div>
						<label for="userName" class="col-sm-2 control-label">账号</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="userName" id="userName"
								placeholder="请输入客户账号" />
						</div>
					</div>
					<div class="form-group">
						<label for="userPass" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-4">
							<input type="password" class="form-control" name="userPass" id="userPass"
								placeholder="请输入密码" />
						</div>
						<label for="secUserPass" class="col-sm-2 control-label">重复密码</label>
						<div class="col-sm-4">
							<input type="password" class="form-control" name="secUserPass" id="secUserPass"
								placeholder="请再次输入密码" />
						</div>
					</div>
					<div class="form-group">
						<label for="mobile" class="col-sm-2 control-label">手机号</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="mobile" name="mobile"
								placeholder="请输入手机号" />
						</div>
						<label for="weiChat" class="col-sm-2 control-label">微信号</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="weiChat" name="weiChat"
								placeholder="请输入手机号" />
						</div>
					</div>

					<div class="form-group">
						<label for="sex" class="col-sm-2 control-label">性别</label>
						<div class="col-sm-4">
						   <input type="radio" name="sex"  value="0" checked="checked"/>男
						   <input type="radio" name="sex"  value="1" />女
						</div>
						<label for="status" class="col-sm-2 control-label">状态</label>
						<div class="col-sm-4">
							<input type="radio" name="status" id="qstatus" value="0" checked="checked"/>启用
						   <input type="radio" name="status" id="jstatus"  value="1"/>禁用
						</div>
					</div>

					<div class="form-group">
						<label for="address" class="col-sm-2 control-label">客户地址</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="address" name="address"
								placeholder="请输入客户地址" />
						</div>
					</div>

					<div class="form-group">
						<label for="custType" class="col-sm-2 control-label">客户类型</label>
						<div class="col-sm-10">
							<select id="custType">
							<option value="0" selected="selected">零售</option>
							<option value="1">营销</option>
							<option value="2">市代</option>
							<option value="3">省代</option>
							<option value="4">总代</option>
							<option value="5">大区</option>
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
<script type="text/javascript">

	jQuery(function() {
		/*表单校验*/
		function validateForm() {
			return $("#myModal").find("form").first().validate({
				rules : {
					custName : {
						required : true,
						rangelength:[2,10]
					},
					userName : {
						required : true,
						rangelength : [5, 15]
					},
					userPass : {
						required : true,
						rangelength : [6, 10]
					},
					secUserPass : {
						required : true,
						rangelength : [6, 10],
						equalTo : userPass
					},
					mobile : {
						required : true,
						maxlength:11
					},
					weiChat : {
						required : true,
						rangelength : [6, 20]
					},
					sex : {
						required : true,
					},
					status : {
						required : true,
					},
					address : {
						required : true,
						maxlength:30
					},
					custType : {
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
			url:"${pageContext.request.contextPath}/customer/findCustomerList",
			//data : mydata,
			datatype : "json",
			height : '280',//表格高度
			mtype: 'POST',
			colNames : [ "客户编号", '账号','客户名称','性别', '手机号','微信号','地址', '状态', '帐户余额', '帐户类型' ],
			colModel : [ {
				name : 'custId',
				index : 'custId',
				align : "center",
				width: 40,
				editable : false,
				key : true/*pk*/,
				sortable:false
				//hidden : true
			}, {
				name : 'userName',
				index : 'userName',
				align : "center",
				width: 60,
				editable : true,
				sortable:false
			}, {
				name : 'custName',
				index : 'custName',
				align : "center",
				width: 60,
				editable : true,
				sortable:false
			}, {
				name : 'sex',
				index : 'sex',
				align : "center",
				width: 40,
				editable : true,
				sortable:false,
				//写法二：
				formatter:function(cellvalue,options,rowObject){
					if(cellvalue==0){
						return "<span class='label label-sm label-success'>男</span>";
					}else{
						return "<span class='label label-sm label-warning'>女</span>";
					}
				},
			}, {
				name : 'mobile',
				index : 'mobile',
				align : "center",
				width: 80,
				editable : true,
				sortable:false
			},{
				name : 'weiChat',
				index : 'weiChat',
				align : "center",
				width: 80,
				editable : true,
				sortable:false
			}, {
				name : 'address',
				index : 'address',
				align : "center",
				width: 200,
				editable : true,
				sortable:false
			}, {
				name : 'status',
				index : 'status',
				align : "center",
				width: 40,
				editable : true,
				sortable:false,
				formatter:function(cellvalue,options,rowObject){
					if(cellvalue==0){
						return "<span class='label label-sm label-success'>启用</span>";
					}else{
						return "<span class='label label-sm label-warning'>禁用</span>";
					}
					
				},
			}, {
				name : 'balance',
				index : 'balance',
				width: 60,
				align : "center",
				editable : true,
				sortable:false
			}, {
				name : 'custType',
				index : 'custType',
				width: 40,
				editable : false,
				sortable:false,
				formatter:function(cell,options,obj){
					if(cell==0){
						return "<span class='label label-sm label-success'>零售</span>";
					}else if(cell==1){
						return "<span class='label label-sm label-success'>营销</span>";
					}else if(cell==2){
						return "<span class='label label-sm label-success'>市代</span>";
					}else if(cell==3){
						return "<span class='label label-sm label-success'>省代</span>";
					}else if(cell==4){
						return "<span class='label label-sm label-success'>总代</span>";
					}else if(cell==5){
						return "<span class='label label-sm label-success'>大区</span>";
					}	
				}, 
				//hidden : true
			}],
			jsonReader : {
				root : "list",
				page : "page",
				total : "total",
				records : "records",
				repeatitems : false
			},
			rowNum : 10,
			caption : "文章列表",
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
					resizeJqGrid("#grid-table");
				}, 0);
			},
			autowidth : true,
			shrinkToFit:true
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
						$('#myModalLabel').text('添加客户');
						//为窗口确定按钮绑定事件
						$("#modal-ok").show();
						$("#myModal").find('#custName').removeAttr("readonly");
						$("#myModal").find('#userName').removeAttr("readonly");
						$("#myModal").find('#userPass').removeAttr("readonly");
						$("#myModal").find('#secUserPass').removeAttr("readonly");
						$("#myModal").find('#weiChat').removeAttr("readonly");
						$("#myModal").find('#mobile').removeAttr("readonly");
						$("#myModal").find('#address').removeAttr("readonly");
						$("#myModal").find('input[type=radio]').removeAttr("disabled");
						$("#myModal").find('#custType').removeAttr("disabled");
						//给radio设置默认的value
						$("[name='sex']").each(function(i,item){$(item).val(i)});
						$("[name='status']").each(function(i,item){$(item).val(i)})
						var options=$("#myModal").find('#custType option');
						options[0].selected=true;
						$("#modal-ok").on("click", {
							oper : 'save'
						}, addCustomer);
					},
					editfunc : function(x) {
						$('#myModal').modal({ //打开对话框
							keyboard : true
						});
						$('#myModalLabel').text('修改客户');
						$("#modal-ok").show();
						var srcrowid = $("#grid-table").jqGrid("getGridParam","selrow");
						var data= $("#grid-table").jqGrid('getRowData',srcrowid);
						//给radio设置默认的value
						$("[name='sex']").each(function(i,item){$(item).val(i)});
						$("[name='status']").each(function(i,item){$(item).val(i)})
						//删除readonly属性
						$("#myModal").find('#custId').val(data.custId);
						$("#myModal").find('#custName').val(data.custName).removeAttr("readonly");
						$("#myModal").find('#userName').val(data.userName).removeAttr("readonly");
						$("#myModal").find('#userPass').removeAttr("readonly");
						$("#myModal").find('#secUserPass').removeAttr("readonly");
						$("#myModal").find('#weiChat').val(data.weiChat).removeAttr("readonly");
						var sexRadio=$("#myModal").find('input[type=radio][name=sex]');
						var dSex;
						if($(data.sex).html()=="男"){
							dSex=0;
						}else{
							dSex=1;
						}
						//sexRadio[parseInt(data.sex)].checked = true;
						sexRadio[dSex].checked = true;
						
						$("#myModal").find('#mobile').val(data.mobile).removeAttr("readonly");
						$("#myModal").find('#address').val(data.address).removeAttr("readonly");
						var radioStatus=$("#myModal").find('input[type=radio][name=status]');
						var dStatus;
						if($(data.status).html()=="启用"){
							dStatus=0;
						}else{
							dStatus=1;
						}
						radioStatus[dStatus].checked = true;
						$("#myModal").find('input[type=radio]').removeAttr("disabled");
						$("#myModal").find('#balance').val(data.balance).removeAttr("readonly");	
						var options=$("#myModal").find('#custType option');
						for(var i=0;i<options.length;i++){
							if(options[i].text==$(data.custType).html()){
								options[i].selected=true;
							}
						}
						$("#myModal").find('#custType').removeAttr("disabled");
						$("#modal-ok").on("click", {oper : 'edit'}, editCustomer);
					},
					delfunc : function() {
						var srcrowid = $("#grid-table").jqGrid("getGridParam","selrow");
						var data = $("#grid-table").jqGrid('getRowData',srcrowid);
						var custId=data.custId;
						//弹出提示信息
						layer.confirm("您确定要删除这条记录吗？",{
							btn :['确认','取消']
						},function(){
							$.post('${pageContext.request.contextPath}/customer/deleteCustomer', $.param({
								custId : custId
							}, true), function() {
								layer.msg('客户删除成功！', {icon: 1});
								$("#grid-table").jqGrid("setGridParam",
										{
											page : $("#grid-table").jqGrid(
													"getGridParam", 'page')
										}).trigger('reloadGrid');
							});
						},function(){
							layer.msg('想好了再点我！',{time:2000});
						})
					},
					viewfunc:function(){
						$('#myModal').modal({ //打开对话框
							keyboard : true
						});
						$('#myModalLabel').text('查看客户');
						var srcrowid = $("#grid-table").jqGrid("getGridParam","selrow");
						var data= $("#grid-table").jqGrid('getRowData',srcrowid);
						$("#myModal").find('#custName').val(data.custName).attr('readonly','readonly');
						$("#myModal").find('#userName').val(data.userName).attr('readonly','readonly');
						$("#myModal").find('#userPass').attr('readonly','readonly');
						$("#myModal").find('#secUserPass').attr('readonly','readonly');
						$("#myModal").find('#weiChat').val(data.weiChat).attr('readonly','readonly');
						var sexRadio=$("#myModal").find('input[type=radio][name=sex]');
						var dSex;
						if($(data.sex).html()=="男"){
							dSex=0;
						}else{
							dSex=1;
						}
						//sexRadio[parseInt(data.sex)].checked = true;
						sexRadio[dSex].checked = true;
						
						$("#myModal").find('#mobile').val(data.mobile).attr('readonly','readonly');
						$("#myModal").find('#address').val(data.address).attr('readonly','readonly');
						var radioStatus=$("#myModal").find('input[type=radio][name=status]');
						var dStatus;
						if($(data.status).html()=="启用"){
							dStatus=0;
						}else{
							dStatus=1;
						}
						radioStatus[dStatus].checked = true;
						$("#myModal").find('input[type=radio]').attr("disabled","disabled");
						$("#myModal").find('#balance').val(data.balance).attr('readonly','readonly');
						var options=$("#myModal").find('#custType option');
						for(var i=0;i<options.length;i++){
							if(options[i].text==$(data.custType).html()){
								options[i].selected=true;
							}
						}
						$("#myModal").find('#custType').attr("disabled","disabled");
						$("#modal-ok").hide();
						//$("#myModal").find('#name').attr('readonly','readonly');
					},
					alerttext : "请选择要操作的数据行"
				});

		//add
		function addCustomer(evt) {
			if (validateForm()) {//如果验证通过,通过ajax提交后台处理，并再grid中新增记录
				var $this = $(this);
				$this.attr("disabled", "disabled");
				var f = $this.parent().prev().find("form").first();
				//var oper = evt.data.oper;
				//获取表单的内容
				var custName = $("#myModal").find('#custName').val();
				var userName = $("#myModal").find('#userName').val();
				var userPass = $("#myModal").find('#userPass').val();
				var weiChat = $("#myModal").find('#weiChat').val();
				var sex=$("#myModal").find('input[type=radio][name=sex]:checked').val();
				var status=$("#myModal").find('input[type=radio][name=status]:checked').val();
				var mobile = $("#myModal").find('#mobile').val();
				var address = $("#myModal").find('#address').val();
				var custType = $("#myModal").find('#custType option:selected').val();
				var dat = {
					"custName" : custName,
					"userName" : userName,
					"userPass" : userPass,
					"weiChat" : weiChat,
					'status' : status,
					'sex' : sex,
					'mobile' : mobile,
					'address' : address,
					'custType' : custType,
				};

				$.ajax("${pageContext.request.contextPath}/customer/addCustomer", {
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
		function editCustomer(evt) {
			if (validateForm()) {//如果验证通过,通过ajax提交后台处理，并再grid中新增记录
				var $this = $(this);
				$this.attr("disabled", "disabled");
				var f = $this.parent().prev().find("form").first();
				var oper = evt.data.oper;
				//获取表单的内容
				var custId = $("#myModal").find('#custId').val();
				var custName = $("#myModal").find('#custName').val();
				var userName = $("#myModal").find('#userName').val();
				var userPass = $("#myModal").find('#userPass').val();
				var secUserPass = $("#myModal").find('#secUserPass').val();
				var weiChat = $("#myModal").find('#weiChat').val();
				var sex=$("#myModal").find('input[type=radio][name=sex]:checked').val();
				var status=$("#myModal").find('input[type=radio][name=status]:checked').val();
				var mobile = $("#myModal").find('#mobile').val();
				var address = $("#myModal").find('#address').val();
				var custType = $("#myModal").find('#custType option:selected').val();
				var dat = {
					"custId" : custId,
					"custName" : custName,
					"userName" : userName,
					"userPass" : userPass,
					"secUserPass" : secUserPass,
					"weiChat" : weiChat,
					'status' : status,
					'sex' : sex,
					'mobile' : mobile,
					'address' : address,
					'custType' : custType
				};

				$.ajax("${pageContext.request.contextPath}/customer/editCustomer", {
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
						layer.msg('修改帐号成功！',{icon: 1});
					},
					error : function() {
						layer.msg('修改帐号失败！',{icon: 2});
					}
				});
				$this.removeAttr("disabled");
				$('#myModal').modal('hide');
			}
		};
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
		
		function resizeJqGrid(grid_selector){
			var parent_column = $(grid_selector).closest('[class*="col-"]');
			//resize to fit page size
			$(window).on('resize.jqGrid', function () {
				$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
		    })
			
			//resize on sidebar collapse/expand
			$(document).on('settings.ace.jqGrid' , function(ev, event_name, collapsed) {
				if( event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed' ) {
					//setTimeout is for webkit only to give time for DOM changes and then redraw!!!
					setTimeout(function() {
						$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
					}, 20);
				}
		    })
		}

	});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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


<script type="text/javascript">
	jQuery(function($) {
		$('.sparkline').each(
				function() {
					var $box = $(this).closest('.infobox');
					var barColor = !$box.hasClass('infobox-dark') ? $box
							.css('color') : '#FFF';
					$(this).sparkline('html', {
						tagValuesAttribute : 'data-values',
						type : 'bar',
						barColor : barColor,
						chartRangeMin : $(this).data('min') || 0
					});
				});
	})
</script>
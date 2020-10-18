<?php echo $header; ?><?php echo $column_left; ?>
<div id="content" class="setting-content">
	<div class="page-header">
		<div class="container-fluid">
		  <div class="pull-right">
			<div class="buttons">
				<a onclick="$('#setting_form').submit();" class="btn btn-success btn-sm"><?php echo $button_save; ?></a>
				<a onclick="javascript:location.href='<?php echo $cancel; ?>';" class="btn btn-danger btn-sm"><?php echo $button_cancel; ?></a>
			</div>
		  </div>
		  <h1><?php echo $heading_title; ?></h1>
		  <ul class="breadcrumb">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
			<?php } ?>
		  </ul>
		</div>
	</div>
	<div id="notifications"></div>
	<div class="container-fluid setting-form">
    <?php if ($error_license) { ?>
    <div class="alert alert-danger"><i class="fa fa-check-circle"></i> <?php echo $error_license; ?><button type="button" class="close">&times;</button></div>
    <?php } ?>
	<div class="panel panel-default">
	
	<div class="panel-heading">
		<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_heading; ?></h3><span class="version"><a href="https://opencart-group.ru/orderpro_v2" target="_blank"><?php echo $orderpro_version; ?></a></span>
	</div>
	
	<div class="panel-body">
		<form action="<?php echo $action; ?>" method="post" id="setting_form" enctype="multipart/form-data">
		<div class="nwell">
			<div class="row">
				<div class="col-sm-12">
					<div class="well form-inline">
						<div class="form-group">
							<label class="big-label"><?php echo $entry_license; ?></label>
							<input type="text" class="form-control input-license" name="orderpro_license" value="<?php echo $orderpro_license; ?>" />
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<div class="nwell">
			<div class="row">
				<div class="col-xs-12 setting-order">
					<div class="well">
						<h4><?php echo $column_setting_order; ?></h4>
						<div class="row">
							<div class="col-lg-6 col-md-8 col-xs-6">
								<div class="row">
									<div class="col-md-6 col-xs-12">
										<div class="form-group">
											<div class="checkbox">
												<?php if ($orderpro_show_pid) { ?>
													<label><input type="checkbox" name="orderpro_show_pid" value="1" checked="checked" /><?php echo $entry_show_pid; ?></label>
												<?php } else { ?>
													<label><input type="checkbox" name="orderpro_show_pid" value="1" /><?php echo $entry_show_pid; ?></label>
												<?php } ?>
											</div>
											<div class="checkbox">
												<?php if ($orderpro_show_image) { ?>
													<label><input type="checkbox" name="orderpro_show_image" value="1" checked="checked" /><?php echo $entry_show_image; ?></label>
												<?php } else { ?>
													<label><input type="checkbox" name="orderpro_show_image" value="1" /><?php echo $entry_show_image; ?></label>
												<?php } ?>
											</div>
											<div class="checkbox">
												<?php if ($orderpro_show_model) { ?>
													<label><input type="checkbox" name="orderpro_show_model" value="1" checked="checked" /><?php echo $entry_show_model; ?></label>
												<?php } else { ?>
													<label><input type="checkbox" name="orderpro_show_model" value="1" /><?php echo $entry_show_model; ?></label>
												<?php } ?>
											</div>
											<div class="checkbox">
												<?php if ($orderpro_show_sku) { ?>
													<label><input type="checkbox" name="orderpro_show_sku" value="1" checked="checked" /><?php echo $entry_show_sku; ?></label>
												<?php } else { ?>
													<label><input type="checkbox" name="orderpro_show_sku" value="1" /><?php echo $entry_show_sku; ?></label>
												<?php } ?>
											</div>
											<div class="checkbox">
												<?php if ($orderpro_show_upc) { ?>
													<label><input type="checkbox" name="orderpro_show_upc" value="1" checked="checked" /><?php echo $entry_show_upc; ?></label>
												<?php } else { ?>
													<label><input type="checkbox" name="orderpro_show_upc" value="1" /><?php echo $entry_show_upc; ?></label>
												<?php } ?>
											</div>
											<div class="checkbox">
												<?php if ($orderpro_show_ean) { ?>
													<label><input type="checkbox" name="orderpro_show_ean" value="1" checked="checked" /><?php echo $entry_show_ean; ?></label>
												<?php } else { ?>
													<label><input type="checkbox" name="orderpro_show_ean" value="1" /><?php echo $entry_show_ean; ?></label>
												<?php } ?>
											</div>
											<div class="checkbox">
												<?php if ($orderpro_show_jan) { ?>
													<label><input type="checkbox" name="orderpro_show_jan" value="1" checked="checked" /><?php echo $entry_show_jan; ?></label>
												<?php } else { ?>
													<label><input type="checkbox" name="orderpro_show_jan" value="1" /><?php echo $entry_show_jan; ?></label>
												<?php } ?>
											</div>
										</div>
									</div>
									<div class="col-md-6 col-xs-12">
										<div class="form-group">
											<div class="checkbox">
												<?php if ($orderpro_show_isbn) { ?>
													<label><input type="checkbox" name="orderpro_show_isbn" value="1" checked="checked" /><?php echo $entry_show_isbn; ?></label>
												<?php } else { ?>
													<label><input type="checkbox" name="orderpro_show_isbn" value="1" /><?php echo $entry_show_isbn; ?></label>
												<?php } ?>
											</div>
											<div class="checkbox">
												<?php if ($orderpro_show_mpn) { ?>
													<label><input type="checkbox" name="orderpro_show_mpn" value="1" checked="checked" /><?php echo $entry_show_mpn; ?></label>
												<?php } else { ?>
													<label><input type="checkbox" name="orderpro_show_mpn" value="1" /><?php echo $entry_show_mpn; ?></label>
												<?php } ?>
											</div>
											<div class="checkbox">
												<?php if ($orderpro_show_location) { ?>
													<label><input type="checkbox" name="orderpro_show_location" value="1" checked="checked" /><?php echo $entry_show_location; ?></label>
												<?php } else { ?>
													<label><input type="checkbox" name="orderpro_show_location" value="1" /><?php echo $entry_show_location; ?></label>
												<?php } ?>
											</div>
											<div class="checkbox">
												<?php if ($orderpro_show_weight) { ?>
													<label><input type="checkbox" name="orderpro_show_weight" value="1" checked="checked" /><?php echo $entry_show_weight; ?></label>
												<?php } else { ?>
													<label><input type="checkbox" name="orderpro_show_weight" value="1" /><?php echo $entry_show_weight; ?></label>
												<?php } ?>
											</div>
											<div class="checkbox">
												<?php if ($orderpro_show_realqty) { ?>
													<label><input type="checkbox" name="orderpro_show_realqty" value="1" checked="checked" /><?php echo $entry_show_realqty; ?></label>
												<?php } else { ?>
													<label><input type="checkbox" name="orderpro_show_realqty" value="1" /><?php echo $entry_show_realqty; ?></label>
												<?php } ?>
											</div>
											<div class="checkbox">
												<?php if ($orderpro_show_nowprice) { ?>
													<label><input type="checkbox" name="orderpro_show_nowprice" value="1" checked="checked" /><?php echo $entry_show_nowprice; ?></label>
												<?php } else { ?>
													<label><input type="checkbox" name="orderpro_show_nowprice" value="1" /><?php echo $entry_show_nowprice; ?></label>
												<?php } ?>
											</div>
											<div class="checkbox">
												<?php if ($orderpro_show_discount) { ?>
													<label><input type="checkbox" name="orderpro_show_discount" value="1" checked="checked" /><?php echo $entry_show_discount; ?></label>
												<?php } else { ?>
													<label><input type="checkbox" name="orderpro_show_discount" value="1" /><?php echo $entry_show_discount; ?></label>
												<?php } ?>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-md-4 col-xs-6">
								<div class="row">
									<div class="col-lg-6 col-xs-12">
										<div class="form-group">
											<div class="checkbox">
												<?php if ($orderpro_invoice_type) { ?>
													<label><input type="checkbox" name="orderpro_invoice_type" value="1" checked="checked" /><?php echo $entry_invoice_type; ?></label>
												<?php } else { ?>
													<label><input type="checkbox" name="orderpro_invoice_type" value="1" /><?php echo $entry_invoice_type; ?></label>
												<?php } ?>
											</div>
											<div class="checkbox has-popover">
												<?php if ($orderpro_virtual_customer) { ?>
													<label><input type="checkbox" name="orderpro_virtual_customer" value="1" checked="checked" /><?php echo $entry_virtual_customer; ?></label>
												<?php } else { ?>
													<label><input type="checkbox" name="orderpro_virtual_customer" value="1" /><?php echo $entry_virtual_customer; ?></label>
												<?php } ?>
												<a tabindex="0" class="btn btn-primary btn-xs btn-popover" title="" data-content="<?php echo $help_virtual_customer; ?>" role="button"><i class="fa fa-question-circle" aria-hidden="true"></i></a>
											</div>
											<div class="checkbox">
												<?php if ($orderpro_autocomplete_type) { ?>
													<label><input type="checkbox" name="orderpro_autocomplete_type" value="1" checked="checked" /><?php echo $entry_autocomplete_type; ?></label>
												<?php } else { ?>
													<label><input type="checkbox" name="orderpro_autocomplete_type" value="1" /><?php echo $entry_autocomplete_type; ?></label>
												<?php } ?>
											</div>
											<div class="checkbox">
												<?php if ($orderpro_show_affiliate) { ?>
													<label><input type="checkbox" name="orderpro_show_affiliate" value="1" checked="checked" /><?php echo $entry_show_affiliate; ?></label>
												<?php } else { ?>
													<label><input type="checkbox" name="orderpro_show_affiliate" value="1" /><?php echo $entry_show_affiliate; ?></label>
												<?php } ?>
											</div>
											<div class="checkbox">
												<?php if ($orderpro_auto_addreward) { ?>
													<label><input type="checkbox" name="orderpro_auto_addreward" value="1" checked="checked" /><?php echo $entry_auto_addreward; ?></label>
												<?php } else { ?>
													<label><input type="checkbox" name="orderpro_auto_addreward" value="1" /><?php echo $entry_auto_addreward; ?></label>
												<?php } ?>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-xs-12">
										<div class="form-group">
											<div class="checkbox">
												<?php if ($orderpro_neworder_notify) { ?>
													<label><input type="checkbox" name="orderpro_neworder_notify" value="1" checked="checked" /><?php echo $entry_neworder_notify; ?></label>
												<?php } else { ?>
													<label><input type="checkbox" name="orderpro_neworder_notify" value="1" /><?php echo $entry_neworder_notify; ?></label>
												<?php } ?>
											</div>
											<div class="checkbox">
												<?php if ($orderpro_neworder_notify_admin) { ?>
													<label><input type="checkbox" name="orderpro_neworder_notify_admin" value="1" checked="checked" /><?php echo $entry_neworder_notify_admin; ?></label>
												<?php } else { ?>
													<label><input type="checkbox" name="orderpro_neworder_notify_admin" value="1" /><?php echo $entry_neworder_notify_admin; ?></label>
												<?php } ?>
											</div>
											<div class="checkbox">
												<?php if ($orderpro_notabs_mode) { ?>
													<label><input type="checkbox" name="orderpro_notabs_mode" value="1" checked="checked" /><?php echo $entry_tabs_mode; ?></label>
												<?php } else { ?>
													<label><input type="checkbox" name="orderpro_notabs_mode" value="1" /><?php echo $entry_tabs_mode; ?></label>
												<?php } ?>
											</div>
											<div class="checkbox">
												<?php if ($orderpro_show_similar) { ?>
													<label><input type="checkbox" name="orderpro_show_similar" value="1" checked="checked" /><?php echo $entry_show_similar; ?></label>
												<?php } else { ?>
													<label><input type="checkbox" name="orderpro_show_similar" value="1" /><?php echo $entry_show_similar; ?></label>
												<?php } ?>
											</div>
											<div class="form-inline">
												<div class="form-group">
													<label><?php echo $entry_decimal_place; ?></label>
													<input type="text" name="orderpro_decimal_place" class="form-control input-sm" value="<?php echo $orderpro_decimal_place; ?>" placeholder="2" style="width: 40px;text-align: center;" />
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
	
				<div class="col-xs-6 setting-invoice">
					<div class="well">
						<h4><?php echo $column_setting_invoice; ?></h4>
						<div class="row">
							<div class="col-md-6 col-xs-12">
								<div class="form-group">
									<div class="checkbox">
										<?php if ($orderpro_invoice_pid) { ?>
											<label><input type="checkbox" name="orderpro_invoice_pid" value="1" checked="checked" /><?php echo $entry_show_pid; ?></label>
										<?php } else { ?>
											<label><input type="checkbox" name="orderpro_invoice_pid" value="1" /><?php echo $entry_show_pid; ?></label>
										<?php } ?>
									</div>
									<div class="checkbox">
										<?php if ($orderpro_invoice_image) { ?>
											<label><input type="checkbox" name="orderpro_invoice_image" value="1" checked="checked" /><?php echo $entry_show_image; ?></label>
										<?php } else { ?>
											<label><input type="checkbox" name="orderpro_invoice_image" value="1" /><?php echo $entry_show_image; ?></label>
										<?php } ?>
									</div>
									<div class="checkbox">
										<?php if ($orderpro_invoice_model) { ?>
											<label><input type="checkbox" name="orderpro_invoice_model" value="1" checked="checked" /><?php echo $entry_show_model; ?></label>
										<?php } else { ?>
											<label><input type="checkbox" name="orderpro_invoice_model" value="1" /><?php echo $entry_show_model; ?></label>
										<?php } ?>
									</div>
									<div class="checkbox">
										<?php if ($orderpro_invoice_sku) { ?>
											<label><input type="checkbox" name="orderpro_invoice_sku" value="1" checked="checked" /><?php echo $entry_show_sku; ?></label>
										<?php } else { ?>
											<label><input type="checkbox" name="orderpro_invoice_sku" value="1" /><?php echo $entry_show_sku; ?></label>
										<?php } ?>
									</div>
									<div class="checkbox">
										<?php if ($orderpro_invoice_upc) { ?>
											<label><input type="checkbox" name="orderpro_invoice_upc" value="1" checked="checked" /><?php echo $entry_show_upc; ?></label>
										<?php } else { ?>
											<label><input type="checkbox" name="orderpro_invoice_upc" value="1" /><?php echo $entry_show_upc; ?></label>
										<?php } ?>
									</div>
									<div class="checkbox">
										<?php if ($orderpro_invoice_ean) { ?>
											<label><input type="checkbox" name="orderpro_invoice_ean" value="1" checked="checked" /><?php echo $entry_show_ean; ?></label>
										<?php } else { ?>
											<label><input type="checkbox" name="orderpro_invoice_ean" value="1" /><?php echo $entry_show_ean; ?></label>
										<?php } ?>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-xs-12">
								<div class="form-group">
									<div class="checkbox">
										<?php if ($orderpro_invoice_jan) { ?>
											<label><input type="checkbox" name="orderpro_invoice_jan" value="1" checked="checked" /><?php echo $entry_show_jan; ?></label>
										<?php } else { ?>
											<label><input type="checkbox" name="orderpro_invoice_jan" value="1" /><?php echo $entry_show_jan; ?></label>
										<?php } ?>
									</div>
									<div class="checkbox">
										<?php if ($orderpro_invoice_isbn) { ?>
											<label><input type="checkbox" name="orderpro_invoice_isbn" value="1" checked="checked" /><?php echo $entry_show_isbn; ?></label>
										<?php } else { ?>
											<label><input type="checkbox" name="orderpro_invoice_isbn" value="1" /><?php echo $entry_show_isbn; ?></label>
										<?php } ?>
									</div>
									<div class="checkbox">
										<?php if ($orderpro_invoice_mpn) { ?>
											<label><input type="checkbox" name="orderpro_invoice_mpn" value="1" checked="checked" /><?php echo $entry_show_mpn; ?></label>
										<?php } else { ?>
											<label><input type="checkbox" name="orderpro_invoice_mpn" value="1" /><?php echo $entry_show_mpn; ?></label>
										<?php } ?>
									</div>
									<div class="checkbox">
										<?php if ($orderpro_invoice_location) { ?>
											<label><input type="checkbox" name="orderpro_invoice_location" value="1" checked="checked" /><?php echo $entry_show_location; ?></label>
										<?php } else { ?>
											<label><input type="checkbox" name="orderpro_invoice_location" value="1" /><?php echo $entry_show_location; ?></label>
										<?php } ?>
									</div>
									<div class="checkbox">
										<?php if ($orderpro_invoice_weight) { ?>
											<label><input type="checkbox" name="orderpro_invoice_weight" value="1" checked="checked" /><?php echo $entry_show_weight; ?></label>
										<?php } else { ?>
											<label><input type="checkbox" name="orderpro_invoice_weight" value="1" /><?php echo $entry_show_weight; ?></label>
										<?php } ?>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
	
				<div class="col-xs-6 setting-mail">
					<div class="well">
						<h4><?php echo $column_setting_mail; ?></h4>
						<div class="row">
							<div class="col-md-6 col-xs-12">
								<div class="form-group">
									<div class="checkbox">
										<?php if ($orderpro_neworder_pid) { ?>
											<label><input type="checkbox" name="orderpro_neworder_pid" value="1" checked="checked" /><?php echo $entry_show_pid; ?></label>
										<?php } else { ?>
											<label><input type="checkbox" name="orderpro_neworder_pid" value="1" /><?php echo $entry_show_pid; ?></label>
										<?php } ?>
									</div>
									<div class="checkbox">
										<?php if ($orderpro_neworder_image) { ?>
											<label><input type="checkbox" name="orderpro_neworder_image" value="1" checked="checked" /><?php echo $entry_show_image; ?></label>
										<?php } else { ?>
											<label><input type="checkbox" name="orderpro_neworder_image" value="1" /><?php echo $entry_show_image; ?></label>
										<?php } ?>
									</div>
									<div class="checkbox">
										<?php if ($orderpro_neworder_model) { ?>
											<label><input type="checkbox" name="orderpro_neworder_model" value="1" checked="checked" /><?php echo $entry_show_model; ?></label>
										<?php } else { ?>
											<label><input type="checkbox" name="orderpro_neworder_model" value="1" /><?php echo $entry_show_model; ?></label>
										<?php } ?>
									</div>
									<div class="checkbox">
										<?php if ($orderpro_neworder_sku) { ?>
											<label><input type="checkbox" name="orderpro_neworder_sku" value="1" checked="checked" /><?php echo $entry_show_sku; ?></label>
										<?php } else { ?>
											<label><input type="checkbox" name="orderpro_neworder_sku" value="1" /><?php echo $entry_show_sku; ?></label>
										<?php } ?>
									</div>
									<div class="checkbox">
										<?php if ($orderpro_neworder_upc) { ?>
											<label><input type="checkbox" name="orderpro_neworder_upc" value="1" checked="checked" /><?php echo $entry_show_upc; ?></label>
										<?php } else { ?>
											<label><input type="checkbox" name="orderpro_neworder_upc" value="1" /><?php echo $entry_show_upc; ?></label>
										<?php } ?>
									</div>
									<div class="checkbox">
										<?php if ($orderpro_neworder_ean) { ?>
											<label><input type="checkbox" name="orderpro_neworder_ean" value="1" checked="checked" /><?php echo $entry_show_ean; ?></label>
										<?php } else { ?>
											<label><input type="checkbox" name="orderpro_neworder_ean" value="1" /><?php echo $entry_show_ean; ?></label>
										<?php } ?>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-xs-12">
								<div class="form-group">
									<div class="checkbox">
										<?php if ($orderpro_neworder_jan) { ?>
											<label><input type="checkbox" name="orderpro_neworder_jan" value="1" checked="checked" /><?php echo $entry_show_jan; ?></label>
										<?php } else { ?>
											<label><input type="checkbox" name="orderpro_neworder_jan" value="1" /><?php echo $entry_show_jan; ?></label>
										<?php } ?>
									</div>
									<div class="checkbox">
										<?php if ($orderpro_neworder_isbn) { ?>
											<label><input type="checkbox" name="orderpro_neworder_isbn" value="1" checked="checked" /><?php echo $entry_show_isbn; ?></label>
										<?php } else { ?>
											<label><input type="checkbox" name="orderpro_neworder_isbn" value="1" /><?php echo $entry_show_isbn; ?></label>
										<?php } ?>
									</div>
									<div class="checkbox">
										<?php if ($orderpro_neworder_mpn) { ?>
											<label><input type="checkbox" name="orderpro_neworder_mpn" value="1" checked="checked" /><?php echo $entry_show_mpn; ?></label>
										<?php } else { ?>
											<label><input type="checkbox" name="orderpro_neworder_mpn" value="1" /><?php echo $entry_show_mpn; ?></label>
										<?php } ?>
									</div>
									<div class="checkbox">
										<?php if ($orderpro_neworder_location) { ?>
											<label><input type="checkbox" name="orderpro_neworder_location" value="1" checked="checked" /><?php echo $entry_show_location; ?></label>
										<?php } else { ?>
											<label><input type="checkbox" name="orderpro_neworder_location" value="1" /><?php echo $entry_show_location; ?></label>
										<?php } ?>
									</div>
									<div class="checkbox">
										<?php if ($orderpro_neworder_weight) { ?>
											<label><input type="checkbox" name="orderpro_neworder_weight" value="1" checked="checked" /><?php echo $entry_show_weight; ?></label>
										<?php } else { ?>
											<label><input type="checkbox" name="orderpro_neworder_weight" value="1" /><?php echo $entry_show_weight; ?></label>
										<?php } ?>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
	
	</div>
	</div>
<script type="text/javascript"><!--
$('.setting-order .btn-popover').popover({
	trigger: "hover",
	placement: "top"
});
//--></script>
</div><?php echo $footer; ?>
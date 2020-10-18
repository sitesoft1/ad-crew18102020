<?php echo $header; ?><?php echo $column_left; ?>
<div id="content" class="setting-content">
	<div class="page-header">
		<div class="container-fluid">
		  <div class="pull-right">
			<div class="buttons">
				<a onclick="$('#setting_form').submit();" class="btn btn-success btn-sm"><?php echo $button_save; ?></a>
				<a href="<?php echo $cancel; ?>" class="btn btn-danger btn-sm"><?php echo $button_cancel; ?></a>
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
		<div class="alert alert-danger"><i class="fa fa-check-circle"></i> <?php echo $error_license; ?></div>
	<?php } ?>
	<?php if ($bom_files) { ?>
		<div class="alert alert-warning">
			<div><i class="fa fa-check-circle"></i> <?php echo $error_bom; ?></div>
			<?php foreach ($bom_files as $bom_file) { ?>
				<div class="text-danger"><?php echo $bom_file; ?></div>
			<?php } ?>
		</div>
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
							<div class="col-lg-12 col-md-6 col-xs-12">
								<div class="row">
									<div class="col-lg-6 col-xs-12">
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_show_pid" value="1" <?php if ($orderpro_show_pid) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon full-addon"><?php echo $entry_show_pid; ?></div>
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_show_image" value="1" <?php if ($orderpro_show_image) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon full-addon"><?php echo $entry_show_image; ?></div>
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_show_model" value="1" <?php if ($orderpro_show_model) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon full-addon"><?php echo $entry_show_model; ?></div>
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_show_sku" value="1" <?php if ($orderpro_show_sku) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon full-addon"><?php echo $entry_show_sku; ?></div>
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_show_upc" value="1" <?php if ($orderpro_show_upc) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon full-addon"><?php echo $entry_show_upc; ?></div>
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_show_ean" value="1" <?php if ($orderpro_show_ean) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon full-addon"><?php echo $entry_show_ean; ?></div>
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_show_jan" value="1" <?php if ($orderpro_show_jan) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon full-addon"><?php echo $entry_show_jan; ?></div>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-xs-12">
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_show_isbn" value="1" <?php if ($orderpro_show_isbn) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon full-addon"><?php echo $entry_show_isbn; ?></div>
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_show_mpn" value="1" <?php if ($orderpro_show_mpn) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon full-addon"><?php echo $entry_show_mpn; ?></div>
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_show_location" value="1" <?php if ($orderpro_show_location) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon full-addon"><?php echo $entry_show_location; ?></div>
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_show_weight" value="1" <?php if ($orderpro_show_weight) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon full-addon"><?php echo $entry_show_weight; ?></div>
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_show_realqty" value="1" <?php if ($orderpro_show_realqty) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon full-addon"><?php echo $entry_show_realqty; ?></div>
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_show_nowprice" value="1" <?php if ($orderpro_show_nowprice) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon full-addon"><?php echo $entry_show_nowprice; ?></div>
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_show_discount" value="1" <?php if ($orderpro_show_discount) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon full-addon"><?php echo $entry_show_discount; ?></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-12 visible-lg"><hr></div>
							<div class="col-lg-12 col-md-6 col-xs-12">
								<div class="row">
									<div class="col-lg-6 col-xs-12">
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_invoice_type" value="1" <?php if ($orderpro_invoice_type) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon full-addon"><?php echo $entry_invoice_type; ?></div>
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_show_affiliate" value="1" <?php if ($orderpro_show_affiliate) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon full-addon"><?php echo $entry_show_affiliate; ?></div>
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_auto_addreward" value="1" <?php if ($orderpro_auto_addreward) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon full-addon"><?php echo $entry_auto_addreward; ?></div>
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_merge_orders" value="1" <?php if ($orderpro_merge_orders) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon full-addon"><?php echo $entry_merge_orders; ?></div>
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_clone_orders" value="1" <?php if ($orderpro_clone_orders) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon full-addon"><?php echo $entry_clone_orders; ?></div>
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_autocomplete_type" value="1" <?php if ($orderpro_autocomplete_type) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon full-addon"><?php echo $entry_autocomplete_type; ?></div>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-xs-12">
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_neworder_notify" value="1" <?php if ($orderpro_neworder_notify) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon full-addon"><?php echo $entry_neworder_notify; ?></div>
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_neworder_notify_admin" value="1" <?php if ($orderpro_neworder_notify_admin) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon full-addon"><?php echo $entry_neworder_notify_admin; ?></div>
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_notabs_mode" value="1" <?php if ($orderpro_notabs_mode) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon full-addon"><?php echo $entry_tabs_mode; ?></div>
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_show_similar" value="1" <?php if ($orderpro_show_similar) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon full-addon"><?php echo $entry_show_similar; ?></div>
											</div>
											<div class="input-group">
												<div class="input-group-addon full-addon"><?php echo $entry_decimal_place; ?></div>
												<input type="text" name="orderpro_decimal_place" class="form-control small-control" value="<?php echo $orderpro_decimal_place; ?>" placeholder="2" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><?php echo $entry_return_page; ?></div>
												<input type="text" name="orderpro_return_page" class="form-control" value="<?php echo $orderpro_return_page; ?>" placeholder="sale/order" />
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
	
				<div class="col-lg-6 col-xs-12 setting-invoice">
					<div class="well">
						<h4><?php echo $column_setting_invoice; ?></h4>
						<div class="row">
							<div class="col-lg-12 col-md-6 col-xs-12">
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon"><input type="checkbox" name="orderpro_invoice_pid" value="1" <?php if ($orderpro_invoice_pid) { ?>checked="checked" <?php } ?>/></div>
										<div class="input-group-addon full-addon"><?php echo $entry_show_pid; ?></div>
									</div>
									<div class="input-group">
										<div class="input-group-addon"><input type="checkbox" name="orderpro_invoice_image" value="1" <?php if ($orderpro_invoice_image) { ?>checked="checked" <?php } ?>/></div>
										<div class="input-group-addon full-addon"><?php echo $entry_show_image; ?></div>
									</div>
									<div class="input-group">
										<div class="input-group-addon"><input type="checkbox" name="orderpro_invoice_model" value="1" <?php if ($orderpro_invoice_model) { ?>checked="checked" <?php } ?>/></div>
										<div class="input-group-addon full-addon"><?php echo $entry_show_model; ?></div>
									</div>
									<div class="input-group">
										<div class="input-group-addon"><input type="checkbox" name="orderpro_invoice_sku" value="1" <?php if ($orderpro_invoice_sku) { ?>checked="checked" <?php } ?>/></div>
										<div class="input-group-addon full-addon"><?php echo $entry_show_sku; ?></div>
									</div>
									<div class="input-group">
										<div class="input-group-addon"><input type="checkbox" name="orderpro_invoice_upc" value="1" <?php if ($orderpro_invoice_upc) { ?>checked="checked" <?php } ?>/></div>
										<div class="input-group-addon full-addon"><?php echo $entry_show_upc; ?></div>
									</div>
									<div class="input-group">
										<div class="input-group-addon"><input type="checkbox" name="orderpro_invoice_ean" value="1" <?php if ($orderpro_invoice_ean) { ?>checked="checked" <?php } ?>/></div>
										<div class="input-group-addon full-addon"><?php echo $entry_show_ean; ?></div>
									</div>
								</div>
							</div>
							<div class="col-lg-12 col-md-6 col-xs-12">
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon"><input type="checkbox" name="orderpro_invoice_jan" value="1" <?php if ($orderpro_invoice_jan) { ?>checked="checked" <?php } ?>/></div>
										<div class="input-group-addon full-addon"><?php echo $entry_show_jan; ?></div>
									</div>
									<div class="input-group">
										<div class="input-group-addon"><input type="checkbox" name="orderpro_invoice_isbn" value="1" <?php if ($orderpro_invoice_isbn) { ?>checked="checked" <?php } ?>/></div>
										<div class="input-group-addon full-addon"><?php echo $entry_show_isbn; ?></div>
									</div>
									<div class="input-group">
										<div class="input-group-addon"><input type="checkbox" name="orderpro_invoice_mpn" value="1" <?php if ($orderpro_invoice_mpn) { ?>checked="checked" <?php } ?>/></div>
										<div class="input-group-addon full-addon"><?php echo $entry_show_mpn; ?></div>
									</div>
									<div class="input-group">
										<div class="input-group-addon"><input type="checkbox" name="orderpro_invoice_location" value="1" <?php if ($orderpro_invoice_location) { ?>checked="checked" <?php } ?>/></div>
										<div class="input-group-addon full-addon"><?php echo $entry_show_location; ?></div>
									</div>
									<div class="input-group">
										<div class="input-group-addon"><input type="checkbox" name="orderpro_invoice_weight" value="1" <?php if ($orderpro_invoice_weight) { ?>checked="checked" <?php } ?>/></div>
										<div class="input-group-addon full-addon"><?php echo $entry_show_weight; ?></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
	
				<div class="col-lg-6 col-xs-12 setting-mail">
					<div class="well">
						<h4><?php echo $column_setting_mail; ?></h4>
						<div class="row">
							<div class="col-lg-12 col-md-6 col-xs-12">
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon"><input type="checkbox" name="orderpro_neworder_pid" value="1" <?php if ($orderpro_neworder_pid) { ?>checked="checked" <?php } ?>/></div>
										<div class="input-group-addon full-addon"><?php echo $entry_show_pid; ?></div>
									</div>
									<div class="input-group">
										<div class="input-group-addon"><input type="checkbox" name="orderpro_neworder_image" value="1" <?php if ($orderpro_neworder_image) { ?>checked="checked" <?php } ?>/></div>
										<div class="input-group-addon full-addon"><?php echo $entry_show_image; ?></div>
									</div>
									<div class="input-group">
										<div class="input-group-addon"><input type="checkbox" name="orderpro_neworder_model" value="1" <?php if ($orderpro_neworder_model) { ?>checked="checked" <?php } ?>/></div>
										<div class="input-group-addon full-addon"><?php echo $entry_show_model; ?></div>
									</div>
									<div class="input-group">
										<div class="input-group-addon"><input type="checkbox" name="orderpro_neworder_sku" value="1" <?php if ($orderpro_neworder_sku) { ?>checked="checked" <?php } ?>/></div>
										<div class="input-group-addon full-addon"><?php echo $entry_show_sku; ?></div>
									</div>
									<div class="input-group">
										<div class="input-group-addon"><input type="checkbox" name="orderpro_neworder_upc" value="1" <?php if ($orderpro_neworder_upc) { ?>checked="checked" <?php } ?>/></div>
										<div class="input-group-addon full-addon"><?php echo $entry_show_upc; ?></div>
									</div>
									<div class="input-group">
										<div class="input-group-addon"><input type="checkbox" name="orderpro_neworder_ean" value="1" <?php if ($orderpro_neworder_ean) { ?>checked="checked" <?php } ?>/></div>
										<div class="input-group-addon full-addon"><?php echo $entry_show_ean; ?></div>
									</div>
								</div>
							</div>
							<div class="col-lg-12 col-md-6 col-xs-12">
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon"><input type="checkbox" name="orderpro_neworder_jan" value="1" <?php if ($orderpro_neworder_jan) { ?>checked="checked" <?php } ?>/></div>
										<div class="input-group-addon full-addon"><?php echo $entry_show_jan; ?></div>
									</div>
									<div class="input-group">
										<div class="input-group-addon"><input type="checkbox" name="orderpro_neworder_isbn" value="1" <?php if ($orderpro_neworder_isbn) { ?>checked="checked" <?php } ?>/></div>
										<div class="input-group-addon full-addon"><?php echo $entry_show_isbn; ?></div>
									</div>
									<div class="input-group">
										<div class="input-group-addon"><input type="checkbox" name="orderpro_neworder_mpn" value="1" <?php if ($orderpro_neworder_mpn) { ?>checked="checked" <?php } ?>/></div>
										<div class="input-group-addon full-addon"><?php echo $entry_show_mpn; ?></div>
									</div>
									<div class="input-group">
										<div class="input-group-addon"><input type="checkbox" name="orderpro_neworder_location" value="1" <?php if ($orderpro_neworder_location) { ?>checked="checked" <?php } ?>/></div>
										<div class="input-group-addon full-addon"><?php echo $entry_show_location; ?></div>
									</div>
									<div class="input-group">
										<div class="input-group-addon"><input type="checkbox" name="orderpro_neworder_weight" value="1" <?php if ($orderpro_neworder_weight) { ?>checked="checked" <?php } ?>/></div>
										<div class="input-group-addon full-addon"><?php echo $entry_show_weight; ?></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
	
				<div class="col-xs-12 setting-export">
					<div class="well">
						<h4><?php echo $column_setting_export; ?></h4>
						<div class="row">
							<div class="col-md-12 col-sm-12">
								<div class="row">
									<div class="col-md-6 col-xs-12">
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export_orders" value="1" <?php if ($orderpro_export_orders) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon full-addon"><?php echo $entry_export_orders; ?></div>
											</div>
											
										</div>
									</div>
									<div class="col-md-6 col-xs-12">
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export_orders_one" value="1" <?php if ($orderpro_export_orders_one) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon full-addon"><?php echo $entry_export_orders_one; ?></div>
											</div>
											
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-12"><hr></div>
						</div>
						<div class="row">
							<div class="col-md-12 col-sm-12">
								<div class="row">
									<div class="col-md-6 col-xs-12">
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[order_id][status]" value="1" <?php if (!empty($orderpro_export['order_id']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_order_id; ?></div>
												<input type="text" name="orderpro_export[order_id][name]" class="form-control has-sort" placeholder="<?php echo $text_name_placeholder; ?>" value="<?php echo !empty($orderpro_export['order_id']['name']) ? $orderpro_export['order_id']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[order_id][sort_order]" class="form-control sort-control" placeholder="<?php echo $text_sort_placeholder; ?>" value="<?php echo !empty($orderpro_export['order_id']['sort_order']) ? $orderpro_export['order_id']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[invoice_no][status]" value="1" <?php if (!empty($orderpro_export['invoice_no']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_invoice_no; ?></div>
												<input type="text" name="orderpro_export[invoice_no][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['invoice_no']['name']) ? $orderpro_export['invoice_no']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[invoice_no][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['invoice_no']['sort_order']) ? $orderpro_export['invoice_no']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[store_id][status]" value="1" <?php if (!empty($orderpro_export['store_id']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_store_id; ?></div>
												<input type="text" name="orderpro_export[store_id][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['store_id']['name']) ? $orderpro_export['store_id']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[store_id][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['store_id']['sort_order']) ? $orderpro_export['store_id']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[store_name][status]" value="1" <?php if (!empty($orderpro_export['store_name']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_store_name; ?></div>
												<input type="text" name="orderpro_export[store_name][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['store_name']['name']) ? $orderpro_export['store_name']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[store_name][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['store_name']['sort_order']) ? $orderpro_export['store_name']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[store_url][status]" value="1" <?php if (!empty($orderpro_export['store_url']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_store_url; ?></div>
												<input type="text" name="orderpro_export[store_url][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['store_url']['name']) ? $orderpro_export['store_url']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[store_url][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['store_url']['sort_order']) ? $orderpro_export['store_url']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[customer_id][status]" value="1" <?php if (!empty($orderpro_export['customer_id']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_customer_id; ?></div>
												<input type="text" name="orderpro_export[customer_id][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['customer_id']['name']) ? $orderpro_export['customer_id']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[customer_id][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['customer_id']['sort_order']) ? $orderpro_export['customer_id']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[customer_group][status]" value="1" <?php if (!empty($orderpro_export['customer_group']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_customer_group; ?></div>
												<input type="text" name="orderpro_export[customer_group][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['customer_group']['name']) ? $orderpro_export['customer_group']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[customer_group][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['customer_group']['sort_order']) ? $orderpro_export['customer_group']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[firstname][status]" value="1" <?php if (!empty($orderpro_export['firstname']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_firstname; ?></div>
												<input type="text" name="orderpro_export[firstname][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['firstname']['name']) ? $orderpro_export['firstname']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[firstname][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['firstname']['sort_order']) ? $orderpro_export['firstname']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[lastname][status]" value="1" <?php if (!empty($orderpro_export['lastname']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_lastname; ?></div>
												<input type="text" name="orderpro_export[lastname][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['lastname']['name']) ? $orderpro_export['lastname']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[lastname][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['lastname']['sort_order']) ? $orderpro_export['lastname']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[customer][status]" value="1" <?php if (!empty($orderpro_export['customer']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_customer; ?></div>
												<input type="text" name="orderpro_export[customer][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['customer']['name']) ? $orderpro_export['customer']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[customer][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['customer']['sort_order']) ? $orderpro_export['customer']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[email][status]" value="1" <?php if (!empty($orderpro_export['email']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_email; ?></div>
												<input type="text" name="orderpro_export[email][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['email']['name']) ? $orderpro_export['email']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[email][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['email']['sort_order']) ? $orderpro_export['email']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[telephone][status]" value="1" <?php if (!empty($orderpro_export['telephone']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_telephone; ?></div>
												<input type="text" name="orderpro_export[telephone][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['telephone']['name']) ? $orderpro_export['telephone']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[telephone][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['telephone']['sort_order']) ? $orderpro_export['telephone']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[fax][status]" value="1" <?php if (!empty($orderpro_export['fax']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_fax; ?></div>
												<input type="text" name="orderpro_export[fax][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['fax']['name']) ? $orderpro_export['fax']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[fax][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['fax']['sort_order']) ? $orderpro_export['fax']['sort_order'] : ''; ?>" />
											</div>
										</div>
									</div>
									<div class="col-md-6 col-xs-12">
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[comment][status]" value="1" <?php if (!empty($orderpro_export['comment']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_comment; ?></div>
												<input type="text" name="orderpro_export[comment][name]" class="form-control has-sort" placeholder="<?php echo $text_name_placeholder; ?>" value="<?php echo !empty($orderpro_export['comment']['name']) ? $orderpro_export['comment']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[comment][sort_order]" class="form-control sort-control" placeholder="<?php echo $text_sort_placeholder; ?>" value="<?php echo !empty($orderpro_export['comment']['sort_order']) ? $orderpro_export['comment']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[total][status]" value="1" <?php if (!empty($orderpro_export['total']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_total; ?></div>
												<input type="text" name="orderpro_export[total][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['total']['name']) ? $orderpro_export['total']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[total][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['total']['sort_order']) ? $orderpro_export['total']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[order_status][status]" value="1" <?php if (!empty($orderpro_export['order_status']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_order_status; ?></div>
												<input type="text" name="orderpro_export[order_status][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['order_status']['name']) ? $orderpro_export['order_status']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[order_status][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['order_status']['sort_order']) ? $orderpro_export['order_status']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[affiliate_id][status]" value="1" <?php if (!empty($orderpro_export['affiliate_id']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_affiliate_id; ?></div>
												<input type="text" name="orderpro_export[affiliate_id][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['affiliate_id']['name']) ? $orderpro_export['affiliate_id']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[affiliate_id][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['affiliate_id']['sort_order']) ? $orderpro_export['affiliate_id']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[affiliate][status]" value="1" <?php if (!empty($orderpro_export['affiliate']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_affiliate; ?></div>
												<input type="text" name="orderpro_export[affiliate][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['affiliate']['name']) ? $orderpro_export['affiliate']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[affiliate][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['affiliate']['sort_order']) ? $orderpro_export['affiliate']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[commission][status]" value="1" <?php if (!empty($orderpro_export['commission']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_commission; ?></div>
												<input type="text" name="orderpro_export[commission][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['commission']['name']) ? $orderpro_export['commission']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[commission][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['commission']['sort_order']) ? $orderpro_export['commission']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[marketing_id][status]" value="1" <?php if (!empty($orderpro_export['marketing_id']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_marketing_id; ?></div>
												<input type="text" name="orderpro_export[marketing_id][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['marketing_id']['name']) ? $orderpro_export['marketing_id']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[marketing_id][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['marketing_id']['sort_order']) ? $orderpro_export['marketing_id']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[tracking][status]" value="1" <?php if (!empty($orderpro_export['tracking']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_tracking; ?></div>
												<input type="text" name="orderpro_export[tracking][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['tracking']['name']) ? $orderpro_export['tracking']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[tracking][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['tracking']['sort_order']) ? $orderpro_export['tracking']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[language][status]" value="1" <?php if (!empty($orderpro_export['language']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_language; ?></div>
												<input type="text" name="orderpro_export[language][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['language']['name']) ? $orderpro_export['language']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[language][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['language']['sort_order']) ? $orderpro_export['language']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[currency_code][status]" value="1" <?php if (!empty($orderpro_export['currency_code']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_currency_code; ?></div>
												<input type="text" name="orderpro_export[currency_code][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['currency_code']['name']) ? $orderpro_export['currency_code']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[currency_code][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['currency_code']['sort_order']) ? $orderpro_export['currency_code']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[currency_value][status]" value="1" <?php if (!empty($orderpro_export['currency_value']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_currency_value; ?></div>
												<input type="text" name="orderpro_export[currency_value][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['currency_value']['name']) ? $orderpro_export['currency_value']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[currency_value][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['currency_value']['sort_order']) ? $orderpro_export['currency_value']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[date_added][status]" value="1" <?php if (!empty($orderpro_export['date_added']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_date_added; ?></div>
												<input type="text" name="orderpro_export[date_added][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['date_added']['name']) ? $orderpro_export['date_added']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[date_added][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['date_added']['sort_order']) ? $orderpro_export['date_added']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[date_modified][status]" value="1" <?php if (!empty($orderpro_export['date_modified']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_date_modified; ?></div>
												<input type="text" name="orderpro_export[date_modified][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['date_modified']['name']) ? $orderpro_export['date_modified']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[date_modified][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['date_modified']['sort_order']) ? $orderpro_export['date_modified']['sort_order'] : ''; ?>" />
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-12"><hr></div>
							<div class="col-md-6 col-sm-12">
								<div class="row">
									<div class="col-xs-12">
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[payment_firstname][status]" value="1" <?php if (!empty($orderpro_export['payment_firstname']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_payment_firstname; ?></div>
												<input type="text" name="orderpro_export[payment_firstname][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['payment_firstname']['name']) ? $orderpro_export['payment_firstname']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[payment_firstname][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['payment_firstname']['sort_order']) ? $orderpro_export['payment_firstname']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[payment_lastname][status]" value="1" <?php if (!empty($orderpro_export['payment_lastname']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_payment_lastname; ?></div>
												<input type="text" name="orderpro_export[payment_lastname][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['payment_lastname']['name']) ? $orderpro_export['payment_lastname']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[payment_lastname][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['payment_lastname']['sort_order']) ? $orderpro_export['payment_lastname']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[payment_customer][status]" value="1" <?php if (!empty($orderpro_export['payment_customer']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_payment_customer; ?></div>
												<input type="text" name="orderpro_export[payment_customer][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['payment_customer']['name']) ? $orderpro_export['payment_customer']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[payment_customer][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['payment_customer']['sort_order']) ? $orderpro_export['payment_customer']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[payment_company][status]" value="1" <?php if (!empty($orderpro_export['payment_company']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_payment_company; ?></div>
												<input type="text" name="orderpro_export[payment_company][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['payment_company']['name']) ? $orderpro_export['payment_company']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[payment_company][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['payment_company']['sort_order']) ? $orderpro_export['payment_company']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[payment_country][status]" value="1" <?php if (!empty($orderpro_export['payment_country']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_payment_country; ?></div>
												<input type="text" name="orderpro_export[payment_country][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['payment_country']['name']) ? $orderpro_export['payment_country']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[payment_country][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['payment_country']['sort_order']) ? $orderpro_export['payment_country']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[payment_zone][status]" value="1" <?php if (!empty($orderpro_export['payment_zone']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_payment_zone; ?></div>
												<input type="text" name="orderpro_export[payment_zone][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['payment_zone']['name']) ? $orderpro_export['payment_zone']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[payment_zone][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['payment_zone']['sort_order']) ? $orderpro_export['payment_zone']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[payment_city][status]" value="1" <?php if (!empty($orderpro_export['payment_city']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_payment_city; ?></div>
												<input type="text" name="orderpro_export[payment_city][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['payment_city']['name']) ? $orderpro_export['payment_city']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[payment_city][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['payment_city']['sort_order']) ? $orderpro_export['payment_city']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[payment_address_1][status]" value="1" <?php if (!empty($orderpro_export['payment_address_1']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_payment_address_1; ?></div>
												<input type="text" name="orderpro_export[payment_address_1][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['payment_address_1']['name']) ? $orderpro_export['payment_address_1']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[payment_address_1][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['payment_address_1']['sort_order']) ? $orderpro_export['payment_address_1']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[payment_address_2][status]" value="1" <?php if (!empty($orderpro_export['payment_address_2']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_payment_address_2; ?></div>
												<input type="text" name="orderpro_export[payment_address_2][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['payment_address_2']['name']) ? $orderpro_export['payment_address_2']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[payment_address_2][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['payment_address_2']['sort_order']) ? $orderpro_export['payment_address_2']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[payment_postcode][status]" value="1" <?php if (!empty($orderpro_export['payment_postcode']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_payment_postcode; ?></div>
												<input type="text" name="orderpro_export[payment_postcode][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['payment_postcode']['name']) ? $orderpro_export['payment_postcode']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[payment_postcode][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['payment_postcode']['sort_order']) ? $orderpro_export['payment_postcode']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[payment_method][status]" value="1" <?php if (!empty($orderpro_export['payment_method']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_payment_method; ?></div>
												<input type="text" name="orderpro_export[payment_method][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['payment_method']['name']) ? $orderpro_export['payment_method']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[payment_method][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['payment_method']['sort_order']) ? $orderpro_export['payment_method']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[payment_code][status]" value="1" <?php if (!empty($orderpro_export['payment_code']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_payment_code; ?></div>
												<input type="text" name="orderpro_export[payment_code][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['payment_code']['name']) ? $orderpro_export['payment_code']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[payment_code][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['payment_code']['sort_order']) ? $orderpro_export['payment_code']['sort_order'] : ''; ?>" />
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-12 hidden-md hidden-lg"><hr></div>
							<div class="col-md-6 col-sm-12">
								<div class="row">
									<div class="col-xs-12">
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[shipping_firstname][status]" value="1" <?php if (!empty($orderpro_export['shipping_firstname']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_shipping_firstname; ?></div>
												<input type="text" name="orderpro_export[shipping_firstname][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['shipping_firstname']['name']) ? $orderpro_export['shipping_firstname']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[shipping_firstname][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['shipping_firstname']['sort_order']) ? $orderpro_export['shipping_firstname']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[shipping_lastname][status]" value="1" <?php if (!empty($orderpro_export['shipping_lastname']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_shipping_lastname; ?></div>
												<input type="text" name="orderpro_export[shipping_lastname][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['shipping_lastname']['name']) ? $orderpro_export['shipping_lastname']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[shipping_lastname][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['shipping_lastname']['sort_order']) ? $orderpro_export['shipping_lastname']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[shipping_customer][status]" value="1" <?php if (!empty($orderpro_export['shipping_customer']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_shipping_customer; ?></div>
												<input type="text" name="orderpro_export[shipping_customer][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['shipping_customer']['name']) ? $orderpro_export['shipping_customer']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[shipping_customer][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['shipping_customer']['sort_order']) ? $orderpro_export['shipping_customer']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[shipping_company][status]" value="1" <?php if (!empty($orderpro_export['shipping_company']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_shipping_company; ?></div>
												<input type="text" name="orderpro_export[shipping_company][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['shipping_company']['name']) ? $orderpro_export['shipping_company']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[shipping_company][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['shipping_company']['sort_order']) ? $orderpro_export['shipping_company']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[shipping_country][status]" value="1" <?php if (!empty($orderpro_export['shipping_country']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_shipping_country; ?></div>
												<input type="text" name="orderpro_export[shipping_country][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['shipping_country']['name']) ? $orderpro_export['shipping_country']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[shipping_country][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['shipping_country']['sort_order']) ? $orderpro_export['shipping_country']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[shipping_zone][status]" value="1" <?php if (!empty($orderpro_export['shipping_zone']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_shipping_zone; ?></div>
												<input type="text" name="orderpro_export[shipping_zone][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['shipping_zone']['name']) ? $orderpro_export['shipping_zone']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[shipping_zone][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['shipping_zone']['sort_order']) ? $orderpro_export['shipping_zone']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[shipping_city][status]" value="1" <?php if (!empty($orderpro_export['shipping_city']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_shipping_city; ?></div>
												<input type="text" name="orderpro_export[shipping_city][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['shipping_city']['name']) ? $orderpro_export['shipping_city']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[shipping_city][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['shipping_city']['sort_order']) ? $orderpro_export['shipping_city']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[shipping_address_1][status]" value="1" <?php if (!empty($orderpro_export['shipping_address_1']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_shipping_address_1; ?></div>
												<input type="text" name="orderpro_export[shipping_address_1][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['shipping_address_1']['name']) ? $orderpro_export['shipping_address_1']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[shipping_address_1][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['shipping_address_1']['sort_order']) ? $orderpro_export['shipping_address_1']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[shipping_address_2][status]" value="1" <?php if (!empty($orderpro_export['shipping_address_2']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_shipping_address_2; ?></div>
												<input type="text" name="orderpro_export[shipping_address_2][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['shipping_address_2']['name']) ? $orderpro_export['shipping_address_2']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[shipping_address_2][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['shipping_address_2']['sort_order']) ? $orderpro_export['shipping_address_2']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[shipping_postcode][status]" value="1" <?php if (!empty($orderpro_export['shipping_postcode']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_shipping_postcode; ?></div>
												<input type="text" name="orderpro_export[shipping_postcode][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['shipping_postcode']['name']) ? $orderpro_export['shipping_postcode']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[shipping_postcode][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['shipping_postcode']['sort_order']) ? $orderpro_export['shipping_postcode']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[shipping_method][status]" value="1" <?php if (!empty($orderpro_export['shipping_method']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_shipping_method; ?></div>
												<input type="text" name="orderpro_export[shipping_method][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['shipping_method']['name']) ? $orderpro_export['shipping_method']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[shipping_method][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['shipping_method']['sort_order']) ? $orderpro_export['shipping_method']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[shipping_code][status]" value="1" <?php if (!empty($orderpro_export['shipping_code']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_shipping_code; ?></div>
												<input type="text" name="orderpro_export[shipping_code][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['shipping_code']['name']) ? $orderpro_export['shipping_code']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[shipping_code][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['shipping_code']['sort_order']) ? $orderpro_export['shipping_code']['sort_order'] : ''; ?>" />
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-12"><hr></div>
							<div class="col-md-12 col-sm-12">
								<div class="row">
									<div class="col-md-6 col-xs-12">
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[products][product_id][status]" value="1" <?php if (!empty($orderpro_export['products']['product_id']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_product_id; ?></div>
												<input type="text" name="orderpro_export[products][product_id][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['products']['product_id']['name']) ? $orderpro_export['products']['product_id']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[products][product_id][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['products']['product_id']['sort_order']) ? $orderpro_export['products']['product_id']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[products][name][status]" value="1" <?php if (!empty($orderpro_export['products']['name']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_product_name; ?></div>
												<input type="text" name="orderpro_export[products][name][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['products']['name']['name']) ? $orderpro_export['products']['name']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[products][name][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['products']['name']['sort_order']) ? $orderpro_export['products']['name']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[products][model][status]" value="1" <?php if (!empty($orderpro_export['products']['model']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_product_model; ?></div>
												<input type="text" name="orderpro_export[products][model][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['products']['model']['name']) ? $orderpro_export['products']['model']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[products][model][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['products']['model']['sort_order']) ? $orderpro_export['products']['model']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[products][sku][status]" value="1" <?php if (!empty($orderpro_export['products']['sku']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_product_sku; ?></div>
												<input type="text" name="orderpro_export[products][sku][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['products']['sku']['name']) ? $orderpro_export['products']['sku']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[products][sku][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['products']['sku']['sort_order']) ? $orderpro_export['products']['sku']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[products][ean][status]" value="1" <?php if (!empty($orderpro_export['products']['ean']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_product_ean; ?></div>
												<input type="text" name="orderpro_export[products][ean][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['products']['ean']['name']) ? $orderpro_export['products']['ean']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[products][ean][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['products']['ean']['sort_order']) ? $orderpro_export['products']['ean']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[products][upc][status]" value="1" <?php if (!empty($orderpro_export['products']['upc']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_product_upc; ?></div>
												<input type="text" name="orderpro_export[products][upc][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['products']['upc']['name']) ? $orderpro_export['products']['upc']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[products][upc][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['products']['upc']['sort_order']) ? $orderpro_export['products']['upc']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[products][isbn][status]" value="1" <?php if (!empty($orderpro_export['products']['isbn']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_product_isbn; ?></div>
												<input type="text" name="orderpro_export[products][isbn][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['products']['isbn']['name']) ? $orderpro_export['products']['isbn']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[products][isbn][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['products']['isbn']['sort_order']) ? $orderpro_export['products']['isbn']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[products][mpn][status]" value="1" <?php if (!empty($orderpro_export['products']['mpn']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_product_mpn; ?></div>
												<input type="text" name="orderpro_export[products][mpn][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['products']['mpn']['name']) ? $orderpro_export['products']['mpn']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[products][mpn][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['products']['mpn']['sort_order']) ? $orderpro_export['products']['mpn']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[products][jan][status]" value="1" <?php if (!empty($orderpro_export['products']['jan']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_product_jan; ?></div>
												<input type="text" name="orderpro_export[products][jan][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['products']['jan']['name']) ? $orderpro_export['products']['jan']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[products][jan][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['products']['jan']['sort_order']) ? $orderpro_export['products']['jan']['sort_order'] : ''; ?>" />
											</div>
										</div>
									</div>
									<div class="col-md-6 col-xs-12">
										<div class="form-group">
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[products][location][status]" value="1" <?php if (!empty($orderpro_export['products']['location']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_product_location; ?></div>
												<input type="text" name="orderpro_export[products][location][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['products']['location']['name']) ? $orderpro_export['products']['location']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[products][location][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['products']['location']['sort_order']) ? $orderpro_export['products']['location']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[products][weight][status]" value="1" <?php if (!empty($orderpro_export['products']['weight']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_product_weight; ?></div>
												<input type="text" name="orderpro_export[products][weight][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['products']['weight']['name']) ? $orderpro_export['products']['weight']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[products][weight][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['products']['weight']['sort_order']) ? $orderpro_export['products']['weight']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[products][options][status]" value="1" <?php if (!empty($orderpro_export['products']['options']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_product_options; ?></div>
												<input type="text" name="orderpro_export[products][options][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['products']['options']['name']) ? $orderpro_export['products']['options']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[products][options][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['products']['options']['sort_order']) ? $orderpro_export['products']['options']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[products][quantity][status]" value="1" <?php if (!empty($orderpro_export['products']['quantity']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_product_quantity; ?></div>
												<input type="text" name="orderpro_export[products][quantity][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['products']['quantity']['name']) ? $orderpro_export['products']['quantity']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[products][quantity][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['products']['quantity']['sort_order']) ? $orderpro_export['products']['quantity']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[products][price][status]" value="1" <?php if (!empty($orderpro_export['products']['price']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_product_price; ?></div>
												<input type="text" name="orderpro_export[products][price][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['products']['price']['name']) ? $orderpro_export['products']['price']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[products][price][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['products']['price']['sort_order']) ? $orderpro_export['products']['price']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[products][total][status]" value="1" <?php if (!empty($orderpro_export['products']['total']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_product_total; ?></div>
												<input type="text" name="orderpro_export[products][total][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['products']['total']['name']) ? $orderpro_export['products']['total']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[products][total][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['products']['total']['sort_order']) ? $orderpro_export['products']['total']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[products][tax][status]" value="1" <?php if (!empty($orderpro_export['products']['tax']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_product_tax; ?></div>
												<input type="text" name="orderpro_export[products][tax][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['products']['tax']['name']) ? $orderpro_export['products']['tax']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[products][tax][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['products']['tax']['sort_order']) ? $orderpro_export['products']['tax']['sort_order'] : ''; ?>" />
											</div>
											<div class="input-group">
												<div class="input-group-addon"><input type="checkbox" name="orderpro_export[products][reward][status]" value="1" <?php if (!empty($orderpro_export['products']['reward']['status'])) { ?>checked="checked" <?php } ?>/></div>
												<div class="input-group-addon"><?php echo $entry_export_product_reward; ?></div>
												<input type="text" name="orderpro_export[products][reward][name]" class="form-control has-sort" value="<?php echo !empty($orderpro_export['products']['reward']['name']) ? $orderpro_export['products']['reward']['name'] : ''; ?>" />
												<input type="text" name="orderpro_export[products][reward][sort_order]" class="form-control sort-control" value="<?php echo !empty($orderpro_export['products']['reward']['sort_order']) ? $orderpro_export['products']['reward']['sort_order'] : ''; ?>" />
											</div>
										</div>
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
$('.setting-order .span-popover').popover({
	trigger: "hover",
	placement: "top"
});
//--></script>
</div><?php echo $footer; ?>
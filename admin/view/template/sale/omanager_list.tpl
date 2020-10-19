<?php echo $header; ?><?php echo $column_left; ?>
<!--
@author	Konstantin Kornelyuk
@link https://opencartforum.com/user/28448-brest001/?tab=idm
-->
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
	<div class="row" id="omanager-row">
		<script type="text/javascript" src="view/javascript/jquery/datetimepicker/locale/ru.js"></script>
		<script type="text/javascript" src="view/javascript/omanager/omanager.maskedinput.min.js"></script>
        <script>
            //zadarma ##############################################
            function callRequest(phone) {
                var link = '<?php echo $user_info["call_request_link"]; ?>';
                var n = '?n=';
                var phone = phone.replace(/\D/g, '');
                var CallRequestUrl = link+n+phone;
                $.ajax({
                    url: CallRequestUrl,
                    success: function(){
                        //alert('Load was performed.');
                    }
                });
            }
            //zadarma END ############################################
        </script>
		<link rel="stylesheet" type="text/css" href="view/stylesheet/omanager.css" />
		<!-- for roboto -->
		<?php if ($roboto25x_status) { ?>
			<link rel="stylesheet" type="text/css" href="view/stylesheet/roboto/roboto-forced.min.css" />
		<?php } ?>
		<!-- fmagnific-popup -->
		<script type="text/javascript" src="view/javascript/omanager/jquery.magnific-popup.min.js"></script>
		<link rel="stylesheet" type="text/css" href="view/javascript/omanager/magnific-popup.css" />
		<?php if ($omanager_warning) { ?>
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $omanager_warning; ?>
			  <button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<?php if ($omanager_success) { ?>
			<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $omanager_success; ?>
			  <button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<?php if (!empty($success_history)) { ?>
			<div class="alert-order alert-success"><i class="fa fa-check-circle"></i> <?php echo $success_history; ?>
			  <button type="button" class="close" onclick="$(this).parent().remove();">&times;</button>
			</div>
		<?php } ?>

		<div class="panel panel-default">
		  <!-- TOP panel -->
		  <div class="top-heading">
			<div class="heading-left">
				<span class="top-heading-title"><i class="fa fa-list"></i>&nbsp; <?php echo $text_list; ?></span>
			</div>
			<div class="heading-right">
			  <?php if ($setting_status) { ?>
				  <?php if (count($setting_groups) > 1) { ?>
					<?php if (isset($select_method) && $select_method == 2) { ?>
					<span class="btn-group">
					  <select name="setgid" data-toggle="tooltip" title="<?php echo $heading_setting_group; ?>" data-reload="true">
						<?php foreach ($setting_groups as $setting_group) { ?>
						  <option value="<?php echo $setting_group['id']; ?>" title="<?php echo $setting_group['help']; ?>" <?php echo $setting_group['selected']; ?>><?php echo $setting_group['title']; ?></option>
						<?php } ?>
					  </select>
					</span>
					<?php } else { ?>
					  <?php foreach ($setting_groups as $setting_group) { ?>
						<span class="btn-group">
						  <button type="button" title="<?php echo trim($setting_group['help']); ?>" class="btn btn-sel-group btn-<?php echo $group_btns[$setting_group['id']]['btn_class']; ?>" onclick="$('#setgid').val('<?php echo $setting_group['id']; ?>').trigger('change');"><i class="fa <?php echo $group_btns[$setting_group['id']]['i_class']; ?>"></i>&nbsp;&nbsp;&nbsp;<?php echo $setting_group['title']; ?></button>
						</span>
					  <?php } ?>
					<?php } ?>
				  <?php } ?>
				  <input type="hidden" id="setgid" name="setgid" value="<?php echo $setgid; ?>" data-reload="true" />
				  <?php if ($order_limit_show) { ?>
				  <span class="btn-group">
					<select name="order_limit" data-toggle="tooltip" title="<?php echo $text_order_on_page; ?>" data-reload="<?php echo $filter_reload_order_limit; ?>">
						<?php foreach ($limits as $limit) { ?>
							<option value="<?php echo $limit['value']; ?>" <?php if ($limit['value'] == $order_limit) { ?> selected="selected" <?php } ?>><?php echo $limit['text']; ?></option>
						<?php } ?>
					</select>
				  </span>
				  <?php } ?>

				  <!-- for novaposhta32x -->
				  <?php if ($novaposhta32x_status) { ?>
				  <span class="btn-group">
					<a href="<?php echo $ei_list; ?>" data-toggle="tooltip" title="<?php echo $button_ei_list; ?>" class="btn btn-danger"><i class="fa fa-list-ul"></i></a>
				  </span>
				  <?php } ?>

				  <!-- for OrderPro -->
				  <?php if ($orderpro27_status) { ?>
				  <span class="btn-group">
					<a id="button-merge" onclick="getmerge();" data-toggle="tooltip" title="<?php echo $button_merge_orderpro; ?>" class="btn btn-warning"><i class="fa fa-share-alt-square" aria-hidden="true"></i></a>
				  </span>
				  <?php } ?>

				  <?php if ($change_statuses_btn) { ?>
				  <span class="btn-group">
					<button type="button" id="button-change-statuses" data-toggle="tooltip" title="<?php echo $button_change_statuses; ?>" class="btn btn-warning" disabled="disabled" onclick="$('#change-statuses-block').slideToggle();"><i class="fa fa-tasks"></i></button>
				  </span>
				  <?php } ?>
				  <?php if ($shipping_print_btn) { ?>
				  <span class="btn-group">
					<button type="submit" id="button-shipping" form="form-order" formaction="<?php echo $shipping; ?>" formtarget="_blank" data-toggle="tooltip" title="<?php echo $button_shipping_print; ?>" class="btn btn-info" disabled="disabled"><i class="fa fa-truck"></i></button>
				  </span>
				  <?php } ?>
				  <?php if ($invoice_print_btn) { ?>
				  <span class="btn-group">
					<button type="submit" id="button-invoice" form="form-order" formaction="<?php echo $invoice; ?>" formtarget="_blank" data-toggle="tooltip" title="<?php echo $button_invoice_print; ?>" class="btn btn-info" disabled="disabled"><i class="fa fa-print"></i></button>
				  </span>
				  <?php } ?>
				  <?php if ($add_btn) { ?>
				  <span class="btn-group">
					<a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-info"><i class="fa fa-plus"></i></a>
				  </span>
				  <?php } ?>
				  <?php if ($delete_btn) { ?>
				  <span class="btn-group">
					<button type="button" id="button-delete" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" disabled="disabled"><i class="fa fa-trash-o"></i></button>
				  </span>
				  <?php } ?>
				  <?php if ($settings_btn) { ?>
				  <span class="btn-group">
					<a href="<?php echo $edit_settings; ?>" class="btn btn-default" data-toggle="tooltip"  title="<?php echo $button_settings; ?>"><i class="fa white fa-gear"></i></a>
				  </span>
				  <?php } ?>
				  <?php if ($user_info_btn) { ?>
				  <span class="btn-group">
					<a href="<?php echo $user_edit; ?>" class="btn btn-default" data-toggle="tooltip" title="<?php echo $user_info['user_group'] .': ' . $user_info['firstname'] .' '. $user_info['lastname']; ?>"><i class="fa fa-user"></i></a>
				  </span>
				  <?php } ?>
				  <?php if ($show_list && $toggle_list_btn) { ?>
				  <span class="btn-group">
					<a onclick="$('#omanager-list').slideToggle();" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_toggle_list; ?>"><i class="fa fa-list"></i></a>
				  </span>
				  <?php } ?>
				  <?php if ($show_map && $toggle_map_btn) { ?>
				  <span class="btn-group">
					<a id="toggle-map" class="btn btn-default" data-toggle="tooltip" onclick="$('#omanager-map').slideToggle();" title="<?php echo $button_toggle_map; ?>"><i class="fa fa-globe"></i></a>
				  </span>
				  <?php } ?>

			  <?php } ?>
			</div>
		  </div>

		  <!-- pagination top -->
		  <?php if (isset($settings['pagination_method']) && ($settings['pagination_method'] == 2 || $settings['pagination_method'] == 3)) { ?>
		  <div class="panel-pagination panel-body">
			<div class="col-sm-6 pagination"><?php echo $pagination; ?></div>
			<div class="col-sm-6 text-right pagination-results"><?php echo $pagination_results; ?></div>
		  </div>
		  <?php } ?>

		  <!-- Change statuses -->
		  <?php if ($change_statuses_btn) { ?>
		  <div class="panel-body" id="change-statuses-block" style="display: none;">
			<div class="well">
			  <form class="form-horizontal">
				<div class="form-group">
				  <label class="col-sm-2 control-label" for="select-input-order-status"><?php echo $entry_order_status; ?></label>
				  <div class="col-sm-10">
					<select name="selected_order_status_id" id="select-input-order-status" class="form-control">
					  <option value="*"></option>
					  <?php foreach ($history_statuses as $history_status) { ?>
					  <option value="<?php echo $history_status['order_status_id']; ?>"><?php echo $history_status['name']; ?></option>
					  <?php } ?>
					</select>
				  </div>
				</div>
				<div class="form-group">
				  <label class="col-sm-2 control-label" for="apply-status-templates"><?php echo $entry_apply_status_templates; ?><span data-toggle="tooltip" title="<?php echo $help_apply_status_templates; ?>"></span></label>
				  <div class="col-sm-10" >
					<input type="checkbox" name="apply_status_templates" value="1" id="apply-status-templates" checked />
				  </div>
				</div>
				<div class="form-group">
				  <label class="col-sm-2 control-label" for="select-input-notify"><?php echo $entry_notify; ?></label>
				  <div class="col-sm-10" >
					<input type="checkbox" name="select_notify" value="1" id="select-input-notify" />
				  </div>
				</div>
				<div class="form-group">
				  <label class="col-sm-2 control-label" for="select-input-comment"><?php echo $entry_comment; ?></label>
				  <div class="col-sm-10">
					<textarea name="selected_comment" rows="8" id="select-input-comment" class="form-control"></textarea>
				  </div>
				</div>
				<div class="form-group">
				  <div class="col-sm-12">
					<button type="button" id="apply-change-statuses" class="btn btn-primary" data-loading-text="loading..."><i class="fa fa-tasks"></i>&nbsp;&nbsp;<?php echo $button_apply_change_statuses; ?>&nbsp;<span id="count-selected"></span></button>
				  </div>
				</div>
			  </form>
			</div>
		  </div>
		  <?php } ?>

		  <!-- Filters top -->
		  <?php if (!empty($filters_top)) { ?>
		  <div class="filter-top panel-body">
			<div class="well-filter-top well">
			  <div class="row">
				<?php if ($order_id_filtertop) { ?>
				<div class="col-sm-2">
				  <div class="form-group">
					<label class="control-label" for="input-order-id"><?php echo $entry_order_id; ?></label>
					<input type="text" name="filter_order_id" value="<?php echo $filter_order_id; ?>" data-reload="<?php echo $filter_reload_order_id; ?>" placeholder="<?php echo $entry_order_id; ?>" id="input-order-id" class="form-control" />
				  </div>
				</div>
				<?php } ?>

				<?php if ($store_filtertop) { ?>
				<div class="col-sm-2">
				  <div class="form-group">
					<label class="control-label" for="input-store-id"><?php echo $entry_store; ?></label>
					<select name="filter_store_id" data-reload="<?php echo $filter_reload_store; ?>" id="input-store-id" class="form-control">
					<option value="*"><?php echo $text_all; ?></option>
					<option value="0" <?php if ($filter_store_id == '0') { ?>selected<?php } ?>><?php echo $text_store_default; ?></option>
					<?php foreach ($stores as $store) { ?>
						<option value="<?php echo $store['store_id']; ?>" <?php if ($filter_store_id == $store['store_id']) { ?>selected<?php } ?>><?php echo $store['name']; ?></option>
					<?php } ?>
					</select>
				  </div>
				</div>
				<?php } ?>

				<?php if ($customer_group_filtertop) { ?>
				<div class="col-sm-2">
				  <div class="form-group">
					<label class="control-label"><?php echo $entry_customer_group; ?></label>
					<select name="filter_customer_group" data-reload="<?php echo $filter_reload_customer_group; ?>" class="form-control">
					<option value="*"><?php echo $text_all; ?></option>
					<?php foreach ($customer_groups as $customer_group) { ?>
						<option value="<?php echo $customer_group['id']; ?>" <?php if ($filter_customer_group == $customer_group['id']) { ?>selected<?php } ?>><?php echo $customer_group['text']; ?></option>
					<?php } ?>
					</select>
				  </div>
				</div>
				<?php } ?>

				<?php if ($customer_filtertop) { ?>
				<div class="col-sm-2">
				  <div class="form-group">
					<label class="control-label"><?php echo $entry_customer; ?></label>
					<div <?php if ($filter_clear_buttons_customer) { ?>class="input-group" <?php } ?>>
						<input type="text" name="filter_customer" value="<?php echo $filter_customer; ?>" data-reload="<?php echo $filter_reload_customer; ?>" placeholder="<?php echo $entry_customer; ?>" id="input-customer" class="form-control" />
						<?php if ($filter_clear_buttons_customer) { ?>
						<span class="input-group-btn">
						  <button type="button" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_clear_filter; ?>" onclick="clearFilter('input-customer');"><i class="fa fa-times-circle"></i></button>
						</span>
						<?php } ?>
					</div>
				  </div>
				</div>
				<?php } ?>

				<?php if ($recipient_filtertop) { ?>
				<div class="col-sm-2">
				  <div class="form-group">
					<label class="control-label"><?php echo $entry_recipient; ?></label>
					<div <?php if ($filter_clear_buttons_recipient) { ?>class="input-group" <?php } ?>>
						<input type="text" name="filter_recipient" value="<?php echo $filter_recipient; ?>" data-reload="<?php echo $filter_reload_recipient; ?>" placeholder="<?php echo $entry_recipient; ?>" id="input-recipient" class="form-control" />
					<?php if ($filter_clear_buttons_recipient) { ?>
						<span class="input-group-btn">
						  <button type="button" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_clear_filter; ?>" onclick="clearFilter('input-recipient');"><i class="fa fa-times-circle"></i></button>
						</span>
					<?php } ?>
					</div>
				  </div>
				</div>
				<?php } ?>

				<?php if ($product_filtertop) { ?>
				<div class="col-sm-2">
				  <div class="form-group">
					<label class="control-label"><?php echo $column_product; ?></label>
					<div <?php if ($filter_clear_buttons_product) { ?>class="input-group" <?php } ?>>
						<input type="text" name="filter_product" value="<?php echo $filter_product; ?>" data-reload="<?php echo $filter_reload_product; ?>" placeholder="<?php echo $column_product; ?>" id="input-product" class="form-control" />
					<?php if ($filter_clear_buttons_product) { ?>
						<span class="input-group-btn">
						  <button type="button" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_clear_filter; ?>" onclick="clearFilter('input-product');"><i class="fa fa-times-circle"></i></button>
						</span>
					<?php } ?>
					</div>
				  </div>
				</div>
				<?php } ?>

				<?php if ($status_filtertop) { ?>
				<div class="col-sm-2">
				  <div class="form-group">
					<label class="control-label"><?php echo $entry_order_status; ?></label>
					<select name="filter_order_status" data-reload="<?php echo $filter_reload_status; ?>" class="form-control">
						<option value="*"><?php echo $text_all; ?></option>
						<?php foreach ($order_statuses as $order_status) { ?>
						  <option value="<?php echo $order_status['order_status_id']; ?>" <?php if ($order_status['order_status_id'] == $filter_order_status) { ?>selected <?php } ?>><?php echo $order_status['name']; ?></option>
						<?php } ?>
					</select>
				  </div>
				</div>
				<?php } ?>

				<?php if ($payment_method_filtertop) { ?>
				<div class="col-sm-2">
				  <div class="form-group">
					<label class="control-label"><?php echo $entry_payment_method; ?></label>
					<select name="filter_payment_method" data-reload="<?php echo $filter_reload_payment_method; ?>"class="form-control">
					  <option value="*"><?php echo $text_all; ?></option>
					  <?php foreach ($order_payments as $code => $name) { ?>
					  <option value="<?php echo $code; ?>" <?php if ($code == $filter_payment_method) { ?>selected <?php } ?>><?php echo $name; ?></option>
					  <?php } ?>
					</select>
				  </div>
				</div>
				<?php } ?>

				<?php if ($shipping_method_filtertop) { ?>
				<div class="col-sm-2">
				  <div class="form-group">
					<label class="control-label"><?php echo $entry_shipping_method; ?></label>
					<select name="filter_shipping_method" data-reload="<?php echo $filter_reload_shipping_method; ?>" class="form-control">
					  <option value="*"><?php echo $text_all; ?></option>
					  <?php foreach ($order_shippings as $code => $name) { ?>
					  <option value="<?php echo $code; ?>" <?php if ($code == $filter_shipping_method) { ?>selected <?php } ?>><?php echo $name; ?></option>
					  <?php } ?>
					</select>
				  </div>
				</div>
				<?php } ?>

				<?php if ($date_shipping_filtertop && $scheduler_status) { ?>
				<div class="col-sm-2">
				  <div class="form-group">
					<label class="control-label"><?php echo $column_date_shipping; ?></label>
					<table id="table-date-shipping">
						<tr>
						  <td class="text-left" style="min-width: 232px;">
							<div class="input-group">
							  <input style="width: 50%; border-right: 0;" name="filter_date_shipping_start" id="input-date-shipping-start" value="<?php echo $filter_date_shipping_start; ?>" placeholder="<?php echo $text_date_from; ?>" data-reload="<?php echo $filter_reload_date_shipping; ?>" class="form-control date"/>
							  <input style="width: 50%;" name="filter_date_shipping_end" value="<?php echo $filter_date_shipping_end; ?>" placeholder="<?php echo $text_date_to; ?>" data-reload="<?php echo $filter_reload_date_shipping; ?>" id="input-date-shipping-end" class="form-control date" />
								<?php if ($filter_clear_buttons_date_shipping) { ?>
								  <span class="input-group-btn">
									<button type="button" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_clear_filter; ?>" onclick="clearFilter('input-date-shipping-start'); clearFilter('input-date-shipping-end');"><i class="fa fa-times-circle"></i>
									</button>
								  </span>
								<?php } ?>
							</div>
						  </td>
						</tr>
					</table>
				  </div>
				</div>
				<?php } ?>

				<?php if ($time_shipping_filtertop && $scheduler_status) { ?>
				<div class="col-sm-2">
				  <div class="form-group">
					<label class="control-label"><?php echo $column_time_shipping; ?></label>
					<table id="table-time-shipping">
						<tr>
						  <td class="text-left" style="min-width: 180px;">
							<div class="input-group">
							  <input style="min-width: 60px; width: 50%; border-right: 0;" type="text" name="filter_shipping_time_start" value="<?php echo $filter_shipping_time_start; ?>" placeholder="<?php echo $text_time_from; ?>" data-reload="<?php echo $filter_reload_time_shipping; ?>" id="input-shipping-time-start" class="form-control" />
							  <input style="min-width: 60px; width: 50%;" type="text" name="filter_shipping_time_end" value="<?php echo $filter_shipping_time_end; ?>" placeholder="<?php echo $text_time_to; ?>" data-reload="<?php echo $filter_reload_time_shipping; ?>" id="input-shipping-time-end" class="form-control" />
								<?php if ($filter_clear_buttons_time_shipping) { ?>
								  <span class="input-group-btn">
									<button type="button" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_clear_filter; ?>" onclick="clearFilter('input-shipping-time-start'); clearFilter('input-shipping-time-end');"><i class="fa fa-times-circle"></i></button>
								  </span>
								<?php } ?>
							</div>
						  </td>
						</tr>
					</table>
				  </div>
				</div>
				<?php } ?>

				<?php if ($subtotal_filtertop) { ?>
				<div class="col-sm-2">
				  <div class="form-group">
					<label class="control-label"><?php echo $column_subtotal; ?></label>
					<table id="table-subtotal">
						<tr>
						  <td class="text-left" style="min-width: 180px;">
							<div class="input-group">
							  <input style="min-width: 60px; width: 50%; border-right: 0;" type="text" name="filter_subtotal_start" value="<?php echo $filter_subtotal_start; ?>" placeholder="<?php echo $text_from; ?>" data-reload="<?php echo $filter_reload_subtotal; ?>" id="input-subtotal-start" class="form-control" />
							  <input style="min-width: 60px; width: 50%;" type="text" name="filter_subtotal_end" value="<?php echo $filter_subtotal_end; ?>"  placeholder="<?php echo $text_to; ?>" data-reload="<?php echo $filter_reload_subtotal; ?>" id="input-subtotal-end" class="form-control" />
								<?php if ($filter_clear_buttons_subtotal) { ?>
								  <span class="input-group-btn">
									<button type="button" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_clear_filter; ?>" onclick="clearFilter('input-subtotal-start'); clearFilter('input-subtotal-end');"><i class="fa fa-times-circle"></i></button>
								  </span>
								<?php } ?>
							</div>
						  </td>
						</tr>
					</table>
				  </div>
				</div>
				<?php } ?>

				<?php if ($total_filtertop) { ?>
				<div class="col-sm-2">
				  <div class="form-group">
					<label class="control-label"><?php echo $column_total; ?></label>
					<table id="table-total">
						<tr>
						  <td class="text-left" style="min-width: 180px;">
							<div class="input-group">
							  <input style="min-width: 60px; width: 50%; border-right: 0;" type="text" name="filter_total_start" value="<?php echo $filter_total_start; ?>" placeholder="<?php echo $text_from; ?>" data-reload="<?php echo $filter_reload_total; ?>" id="input-total-start" class="form-control" />
							  <input style="min-width: 60px; width: 50%;" type="text" name="filter_total_end" value="<?php echo $filter_total_end; ?>"  placeholder="<?php echo $text_to; ?>" data-reload="<?php echo $filter_reload_total; ?>" id="input-total-end" class="form-control" />
								<?php if ($filter_clear_buttons_total) { ?>
								  <span class="input-group-btn">
									<button type="button" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_clear_filter; ?>" onclick="clearFilter('input-total-start'); clearFilter('input-total-end');"><i class="fa fa-times-circle"></i></button>
								  </span>
								<?php } ?>
							</div>
						  </td>
						</tr>
					</table>
				  </div>
				</div>
				<?php } ?>

				<?php if ($date_added_filtertop) { ?>
				<div class="col-sm-2">
				  <div class="form-group">
					<label class="control-label"><?php echo $column_date_added; ?></label>
					<div <?php if ($filter_clear_buttons_date_added) { ?>class="input-group"<?php } ?>>
					  <input type="text" style="min-width: 90px;" name="filter_date_added" value="<?php echo $filter_date_added; ?>" placeholder="<?php echo $entry_date_added; ?>" data-reload="<?php echo $filter_reload_date_added; ?>" id="input-date-added" class="form-control date" />
						<?php if ($filter_clear_buttons_date_added) { ?>
						  <span class="input-group-btn">
							<button type="button" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_clear_filter; ?>" onclick="clearFilter('input-date-added');"><i class="fa fa-times-circle"></i></button>
						  </span>
						<?php } ?>
					</div>
				    </div>
				  </div>
				  <?php } ?>

				<?php if ($date_modified_filtertop) { ?>
				<div class="col-sm-2">
				  <div class="form-group">
					<label class="control-label"><?php echo $column_date_modified; ?></label>
					<div <?php if ($filter_clear_buttons_date_modified) { ?>class="input-group"<?php } ?>>
					  <input type="text" style="min-width: 90px;" name="filter_date_modified" value="<?php echo $filter_date_modified; ?>" placeholder="<?php echo $entry_date_modified; ?>" data-reload="<?php echo $filter_reload_date_modified; ?>" id="input-date-modified" class="form-control date" />
						<?php if ($filter_clear_buttons_date_modified) { ?>
						  <span class="input-group-btn">
							<button type="button" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_clear_filter; ?>" onclick="clearFilter('input-date-modified');"><i class="fa fa-times-circle"></i></button>
						  </span>
						<?php } ?>
					</div>
				  </div>
				</div>
				<?php } ?>

				<?php if ($button_clear_all_filtertop) { ?>
				<div class="col-sm-2">
				  <div class="form-group">
					<label class="control-label">&nbsp;</label>
					<button type="button" id="" onclick="dumpFilter(<?php echo $filter_reload_button_clear_all; ?>);" class="btn btn-warning btn-block" data-toggle="tooltip" title="" ><i class="fa fa-times-circle"></i>&nbsp;&nbsp;&nbsp;<?php echo $button_clear_all; ?></button>
				    </div>
				  </div>
				<?php } ?>

				<?php if ($button_apply_filter_filtertop) { ?>
				<div class="col-sm-2">
				  <div class="form-group">
					<label class="control-label">&nbsp;</label>
					<button type="button" id="button-filter" class="btn btn-primary  btn-block" title="" ><i class="fa fa-filter"></i>&nbsp;&nbsp;&nbsp;<?php echo $button_apply_filter; ?></button>
				  </div>
				</div>
				<?php } ?>
			  </div>
			</div>
		  </div>
		  <?php } ?>

		  <!-- Order LIST -->
		  <?php if ($show_list) { ?>
		  <div class="omanager-list panel-body" id="omanager-list">
			<?php if ($setting_status) { ?>
			  <?php if (!empty($settings['columns'])) { ?>
				<form method="post" action="" enctype="multipart/form-data" id="form-order">
				  <div class="table-responsive joystick-table-responsive">
					<table class="table table-bordered table-hover joystick-table" id="table-order-list">
					  <!-- Sort -->
					  <thead>
						<tr class="sorting-row" id="sort-row">
						<?php if ($select_column && $orders) { ?>
						  <td style="<?php echo $settings['column_style']['select']; ?>" class="text-center" data-sort="<?php echo $settings['column_sort']['select']; ?>"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked).trigger('change');" /></td>
						<?php } ?>

						<?php if ($order_id_column) { ?>
						  <td style="<?php echo $settings['column_style']['order_id']; ?>" class="text-right" data-sort="<?php echo $settings['column_sort']['order_id']; ?>">
							<a href="<?php echo $sort_order; ?>" <?php if ($sort == 'o.order_id') { ?> class="<?php echo strtolower($order); ?>"<?php } ?> title="<?php echo $text_sort; ?>"><?php echo $column_order_id; ?></a>
						  </td>
						<?php } ?>

						<?php if ($store_column) { ?>
						  <td style="<?php echo $settings['column_style']['store']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['store']; ?>">
							<a href="<?php echo $sort_store; ?>" <?php if ($sort == 'o.store_id') { ?> class="<?php echo strtolower($order); ?>"<?php } ?> title="<?php echo $text_sort; ?>"><?php echo $column_store; ?></a>
						  </td>
						<?php } ?>

						<?php if ($customer_group_column) { ?>
						  <td style="<?php echo $settings['column_style']['customer_group']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['customer_group']; ?>">
							<a href="<?php echo $sort_customer_group; ?>" <?php if ($sort == 'o.customer_group_id') { ?> class="<?php echo strtolower($order); ?>"<?php } ?> title="<?php echo $text_sort; ?>"><?php echo $column_customer_group; ?></a>
						  </td>
						<?php } ?>

						<?php if ($customer_column) { ?>
							<td style="<?php echo $settings['column_style']['customer']; ?>" data-sort="<?php echo $settings['column_sort']['customer']; ?>">
							  <table style="width: 100%;">
								<tr>
								  <td class="text-left sort-customer-left">
									<a href="<?php echo $sort_customer; ?>" <?php if ($sort == 'customer') { ?> class="<?php echo strtolower($order); ?>"<?php } ?> title="<?php echo $text_sort; ?>"><?php echo $column_customer; ?></a>
								  </td>
								  <td class="text-right sort-customer-right">
								  <?php if ($customer_fields) { ?>
									<a id="toggle-payment_data" class="btn-default toggle-all" title="<?php echo $button_toggle_column; ?>"><i class="fa  fa-sort"></i></a>
								  <?php } ?>
								  </td>
								</tr>
							  </table>
							</td>
						<?php } ?>

						<?php if ($recipient_column) { ?>
							<td style="<?php echo $settings['column_style']['recipient']; ?>" data-sort="<?php echo $settings['column_sort']['recipient']; ?>">
							  <table style="width: 100%;">
								<tr>
								  <td class="text-left sort-customer-left">
									<a href="<?php echo $sort_recipient; ?>" <?php if ($sort == 'recipient') { ?> class="<?php echo strtolower($order); ?>"<?php } ?> title="<?php echo $text_sort; ?>"><?php echo $column_recipient; ?></a>
								  </td>
								  <td class="text-right sort-customer-right">
								  <?php if ($recipient_fields) { ?>
									<a id="toggle-shipping_data" class="btn-default toggle-all" title="<?php echo $button_toggle_column; ?>"><i class="fa  fa-sort"></i></a>
								  <?php } ?>
								  </td>
								</tr>
							  </table>
							</td>
						<?php } ?>

						<?php if ($products_column) { ?>
							<td style="<?php echo $settings['column_style']['products']; ?>" data-sort="<?php echo $settings['column_sort']['products']; ?>">
							  <table style="width: 100%;">
								<tr>
								  <td class="text-left sort-customer-left"><?php echo $column_products; ?></td>
								  <td class="text-right sort-customer-right">
									<a id="toggle-products_data" class="btn-default toggle-all" title="<?php echo $button_toggle_column; ?>"><i class="fa  fa-sort"></i></a>
								  </td>
								</tr>
							  </table>
							</td>
						<?php } ?>

						<?php if ($status_history_column) { ?>
						<td style="<?php echo $settings['column_style']['status_history']; ?>" data-sort="<?php echo $settings['column_sort']['status_history']; ?>">
						  <table style="width: 100%;">
							<tr>
							  <td class="text-left sort-customer-left">
								<a href="<?php echo $sort_status; ?>" <?php if ($sort == 'order_status') { ?> class="<?php echo strtolower($order); ?>"<?php } ?> title="<?php echo $text_sort; ?>"><?php echo $column_status; ?></a>
							  </td>
							  <td class="text-right" style="border-left: 0 !Important;">
								<?php echo $column_history; ?>&nbsp;&nbsp;&nbsp;
								<?php if ($this_history_fields) { ?>
									<a id="toggle-history_data" class="btn-default toggle-all" title="<?php echo $button_toggle_column; ?>"><i class="fa  fa-sort"></i></a>
								<?php } ?>
							  </td>
							</tr>
						  </table>
						</td>
						<?php } ?>

						<?php if ($payment_method_column) { ?>
						  <td style="<?php echo $settings['column_style']['payment_method']; ?>" class="text-right" data-sort="<?php echo $settings['column_sort']['payment_method']; ?>">
							<a href="<?php echo $sort_payment_method; ?>" <?php if ($sort == 'o.payment_method') { ?> class="<?php echo strtolower($order); ?>"<?php } ?> title="<?php echo $text_sort; ?>"><?php echo $column_payment_method; ?></a>
						  </td>
						<?php } ?>

						<?php if ($shipping_method_column) { ?>
						  <td style="<?php echo $settings['column_style']['shipping_method']; ?>" class="text-right" data-sort="<?php echo $settings['column_sort']['shipping_method']; ?>">
							<a href="<?php echo $sort_shipping_method; ?>" <?php if ($sort == 'o.shipping_method') { ?> class="<?php echo strtolower($order); ?>"<?php } ?> title="<?php echo $text_sort; ?>"><?php echo $column_shipping_method; ?></a>
						  </td>
						<?php } ?>

						<?php if ($date_shipping_column && $scheduler_status) { ?>
							<td style="<?php echo $settings['column_style']['date_shipping']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['date_shipping']; ?>">
							  <a href="<?php echo $sort_date_shipping; ?>" <?php if ($sort == 'o.shipping_datetime_start') { ?> class="<?php echo strtolower($order); ?>"<?php } ?> title="<?php echo $text_sort; ?>"><?php echo $column_date_shipping; ?></a>
							</td>
						<?php } ?>

						<?php if ($time_shipping_column && $scheduler_status) { ?>
							<td style="<?php echo $settings['column_style']['time_shipping']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['time_shipping']; ?>"><?php echo $column_time_shipping; ?></td>
						<?php } ?>

						<?php if ($subtotal_column) { ?>
						  <td style="<?php echo $settings['column_style']['subtotal']; ?>" class="text-right" data-sort="<?php echo $settings['column_sort']['subtotal']; ?>">
							<a href="<?php echo $sort_subtotal; ?>" <?php if ($sort == 'subtotal') { ?> class="<?php echo strtolower($order); ?>"<?php } ?> title="<?php echo $text_sort; ?>"><?php echo $column_subtotal; ?></a>
						  </td>
						<?php } ?>

						<?php if ($total_column) { ?>
						  <td style="<?php echo $settings['column_style']['total']; ?>" class="text-right" data-sort="<?php echo $settings['column_sort']['total']; ?>">
							<a href="<?php echo $sort_total; ?>" <?php if ($sort == 'o.total') { ?> class="<?php echo strtolower($order); ?>"<?php } ?> title="<?php echo $text_sort; ?>"><?php echo $column_total; ?></a>
						  </td>
						<?php } ?>

						<?php if ($date_added_column) { ?>
						  <td style="<?php echo $settings['column_style']['date_added']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['date_added']; ?>">
							<a href="<?php echo $sort_date_added; ?>" <?php if ($sort == 'o.date_added') { ?> class="<?php echo strtolower($order); ?>"<?php } ?> title="<?php echo $text_sort; ?>"><?php echo $column_date_added; ?></a>
						  </td>
						<?php } ?>

						<?php if ($date_modified_column) { ?>
						  <td style="<?php echo $settings['column_style']['date_modified']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['date_modified']; ?>">
							<a href="<?php echo $sort_date_modified; ?>" <?php if ($sort == 'o.date_modified') { ?> class="<?php echo strtolower($order); ?>"<?php } ?> title="<?php echo $text_sort; ?>"><?php echo $column_date_modified; ?></a>
						  </td>
						<?php } ?>

						<?php if ($action_column) { ?>
						  <td style="<?php echo $settings['column_style']['action']; ?>" class="text-right" data-sort="<?php echo $settings['column_sort']['action']; ?>"><?php echo $column_action; ?></td>
						<?php } ?>

						</tr>
					  </thead>
					  <tbody>
						<!-- Filters -->
						<?php if (!empty($filters_table)) { ?>
						  <tr class="sorting-row filter" id="filter-row">
							<?php if ($select_column && $orders) { ?>
							  <td style="<?php echo $settings['column_style']['select']; ?>" class="text-center" data-sort="<?php echo $settings['column_sort']['select']; ?>"></td>
							<?php } ?>

							<?php if ($order_id_column) { ?>
							  <td style="<?php echo $settings['column_style']['order_id']; ?>" class="text-right" data-sort="<?php echo $settings['column_sort']['order_id']; ?>">
								<?php if ($order_id_filtertable) { ?>
								  <input type="text" name="filter_order_id" value="<?php echo $filter_order_id; ?>" data-reload="<?php echo $filter_reload_order_id; ?>" id="input-order-id" class="form-control" />
								<?php } ?>
							  </td>
							<?php } ?>

							<?php if ($store_column) { ?>
							  <td style="<?php echo $settings['column_style']['store']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['store']; ?>">
								<?php if ($store_filtertable) { ?>
								  <select name="filter_store_id" data-reload="<?php echo $filter_reload_store; ?>" id="input-store-id" class="form-control">
									<option value="*"><?php echo $text_all; ?></option>
									<option value="0" <?php if ($filter_store_id == '0') { ?>selected<?php } ?>><?php echo $text_store_default; ?></option>
									<?php foreach ($stores as $store) { ?>
										<option value="<?php echo $store['store_id']; ?>" <?php if ($filter_store_id == $store['store_id']) { ?>selected<?php } ?>><?php echo $store['name']; ?></option>
									<?php } ?>
								  </select>
								<?php } ?>
							  </td>
							<?php } ?>

							<?php if ($customer_group_column) { ?>
							  <td style="<?php echo $settings['column_style']['customer_group']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['customer_group']; ?>">
								<?php if ($customer_group_filtertable) { ?>
									<select name="filter_customer_group" data-reload="<?php echo $filter_reload_customer_group; ?>" id="input-customer-group-id" class="form-control">
									<option value="*"><?php echo $text_all; ?></option>
									<?php foreach ($customer_groups as $customer_group) { ?>
										<option value="<?php echo $customer_group['id']; ?>" <?php if ($filter_customer_group == $customer_group['id']) { ?>selected<?php } ?>><?php echo $customer_group['text']; ?></option>
									<?php } ?>
									</select>
								<?php } ?>
							  </td>
							<?php } ?>

							<?php if ($customer_column) { ?>
							  <td style="<?php echo $settings['column_style']['customer']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['customer']; ?>">
								<?php if ($customer_filtertable) { ?>
								  <div <?php if ($filter_clear_buttons_customer) { ?>class="input-group"<?php } ?>>
									<input type="text" name="filter_customer" value="<?php echo $filter_customer; ?>" data-reload="<?php echo $filter_reload_customer; ?>" id="input-customer" class="form-control" />
									  <?php if ($filter_clear_buttons_customer) { ?>
										<span class="input-group-btn">
										  <button type="button" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_clear_filter; ?>" onclick="clearFilter('input-customer');"><i class="fa fa-times-circle"></i></button>
										</span>
									  <?php } ?>
								  </div>
								<?php } ?>
							  </td>
							<?php } ?>

							<?php if ($recipient_column) { ?>
							  <td style="<?php echo $settings['column_style']['recipient']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['recipient']; ?>">
								<?php if ($recipient_filtertable) { ?>
								  <div <?php if ($filter_clear_buttons_recipient) { ?>class="input-group"<?php } ?>>
									<input type="text" name="filter_recipient" value="<?php echo $filter_recipient; ?>" data-reload="<?php echo $filter_reload_recipient; ?>" id="input-recipient" class="form-control" />
									  <?php if ($filter_clear_buttons_recipient) { ?>
										<span class="input-group-btn">
										  <button type="button" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_clear_filter; ?>" onclick="clearFilter('input-recipient');"><i class="fa fa-times-circle"></i></button>
										</span>
									  <?php } ?>
								  </div>
								<?php } ?>
							  </td>
							<?php } ?>

							<?php if ($products_column) { ?>
							  <td style="<?php echo $settings['column_style']['products']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['products']; ?>">
								<?php if ($product_filtertable) { ?>
								  <div <?php if ($filter_clear_buttons_product) { ?>class="input-group"<?php } ?>>
									<input type="text" name="filter_product" value="<?php echo $filter_product; ?>" data-reload="<?php echo $filter_reload_product; ?>" id="input-product" class="form-control" />
									  <?php if ($filter_clear_buttons_product) { ?>
										<span class="input-group-btn">
										  <button type="button" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_clear_filter; ?>" onclick="clearFilter('input-product');"><i class="fa fa-times-circle"></i></button>
										</span>
									  <?php } ?>
								  </div>
								<?php } ?>
							  </td>
							<?php } ?>

							<?php if ($status_history_column) { ?>
							  <td style="<?php echo $settings['column_style']['status_history']; ?>" data-sort="<?php echo $settings['column_sort']['status_history']; ?>">
								<?php if ($status_filtertable) { ?>
								  <select name="filter_order_status" data-reload="<?php echo $filter_reload_status; ?>" id="input-order-status" class="form-control">
									<option value="*"><?php echo $text_all; ?></option>
									<?php foreach ($order_statuses as $order_status) { ?>
									  <option value="<?php echo $order_status['order_status_id']; ?>" <?php if ($order_status['order_status_id'] == $filter_order_status) { ?>selected <?php } ?>><?php echo $order_status['name']; ?></option>
									<?php } ?>
								  </select>
								<?php } ?>
							  </td>
							<?php } ?>

							<?php if ($payment_method_column) { ?>
							  <td style="<?php echo $settings['column_style']['payment_method']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['payment_method']; ?>">
							  <?php if ($payment_method_filtertable) { ?>
								<select name="filter_payment_method" data-reload="<?php echo $filter_reload_payment_method; ?>" id="input-payment-method" class="form-control">
								  <option value="*"><?php echo $text_all; ?></option>
								  <?php foreach ($order_payments as $code => $name) { ?>
								  <option value="<?php echo $code; ?>" <?php if ($code == $filter_payment_method) { ?>selected <?php } ?>><?php echo $name; ?></option>
								  <?php } ?>
								</select>
							  <?php } ?>
							  </td>
							<?php } ?>

							<?php if ($shipping_method_column) { ?>
							  <td style="<?php echo $settings['column_style']['shipping_method']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['shipping_method']; ?>">
							  <?php if ($shipping_method_filtertable) { ?>
								<select name="filter_shipping_method" data-reload="<?php echo $filter_reload_shipping_method; ?>" id="input-shipping-method" class="form-control">
								  <option value="*"><?php echo $text_all; ?></option>
								  <?php foreach ($order_shippings as $code => $name) { ?>
								  <option value="<?php echo $code; ?>" <?php if ($code == $filter_shipping_method) { ?>selected <?php } ?>><?php echo $name; ?></option>
								  <?php } ?>
								</select>
							  <?php } ?>
							  </td>
							<?php } ?>

							<?php if ($date_shipping_column && $scheduler_status) { ?>
							  <td style="<?php echo $settings['column_style']['date_shipping']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['date_shipping']; ?>">
							  <?php if ($date_shipping_filtertable) { ?>
								<div class="input-group">
								  <input style="width: 50%; border-right: 0;" name="filter_date_shipping_start" value="<?php echo $filter_date_shipping_start; ?>" placeholder="<?php echo $text_date_from; ?>" data-reload="<?php echo $filter_reload_date_shipping; ?>" id="input-date-shipping-start" class="form-control date"/>
								  <input style="width: 50%;" name="filter_date_shipping_end" value="<?php echo $filter_date_shipping_end; ?>" placeholder="<?php echo $text_date_to; ?>" data-reload="<?php echo $filter_reload_date_shipping; ?>" id="input-date-shipping-end" class="form-control date" />
									<?php if ($filter_clear_buttons_date_shipping) { ?>
									  <span class="input-group-btn">
										<button type="button" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_clear_filter; ?>" onclick="clearFilter('input-date-shipping-start'); clearFilter('input-date-shipping-end');"><i class="fa fa-times-circle"></i>
										</button>
									  </span>
									<?php } ?>
								</div>
							  <?php } ?>
							  </td>
							<?php } ?>

							<?php if ($time_shipping_column && $scheduler_status) { ?>
							  <td style="<?php echo $settings['column_style']['time_shipping']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['time_shipping']; ?>" >
							  <?php if ($time_shipping_filtertable) { ?>
								<div class="input-group">
								  <input style="min-width: 60px; width: 50%; border-right: 0;" type="text" name="filter_shipping_time_start" value="<?php echo $filter_shipping_time_start; ?>" placeholder="<?php echo $text_time_from; ?>" data-reload="<?php echo $filter_reload_time_shipping; ?>" id="input-shipping-time-start" class="form-control" />
								  <input style="min-width: 60px; width: 50%;" type="text" name="filter_shipping_time_end" value="<?php echo $filter_shipping_time_end; ?>" placeholder="<?php echo $text_time_to; ?>" data-reload="<?php echo $filter_reload_time_shipping; ?>" id="input-shipping-time-end" class="form-control" />
									<?php if ($filter_clear_buttons_time_shipping) { ?>
									  <span class="input-group-btn">
										<button type="button" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_clear_filter; ?>" onclick="clearFilter('input-shipping-time-start'); clearFilter('input-shipping-time-end');"><i class="fa fa-times-circle"></i></button>
									  </span>
									<?php } ?>
								</div>
							  <?php } ?>
							  </td>
							<?php } ?>

							<?php if ($subtotal_column) { ?>
							  <td style="<?php echo $settings['column_style']['subtotal']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['subtotal']; ?>">
							  <?php if ($subtotal_filtertable) { ?>
								<div class="input-group">
								  <input style="min-width: 60px; width: 50%; border-right: 0;" type="text" name="filter_subtotal_start" value="<?php echo $filter_subtotal_start; ?>" placeholder="<?php echo $text_from; ?>" data-reload="<?php echo $filter_reload_subtotal; ?>" id="input-subtotal-start" class="form-control" />
								  <input style="min-width: 60px; width: 50%;" type="text" name="filter_subtotal_end" value="<?php echo $filter_subtotal_end; ?>"  placeholder="<?php echo $text_to; ?>" data-reload="<?php echo $filter_reload_subtotal; ?>" id="input-subtotal-end" class="form-control" />
									<?php if ($filter_clear_buttons_subtotal) { ?>
									  <span class="input-group-btn">
										<button type="button" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_clear_filter; ?>" onclick="clearFilter('input-subtotal-start'); clearFilter('input-subtotal-end');"><i class="fa fa-times-circle"></i></button>
									  </span>
									<?php } ?>
								</div>
							  <?php } ?>
							  </td>
							<?php } ?>

							<?php if ($total_column) { ?>
							  <td style="<?php echo $settings['column_style']['total']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['total']; ?>">
							  <?php if ($total_filtertable) { ?>
								<div class="input-group">
								  <input style="min-width: 60px; width: 50%; border-right: 0;" type="text" name="filter_total_start" value="<?php echo $filter_total_start; ?>" placeholder="<?php echo $text_from; ?>" data-reload="<?php echo $filter_reload_total; ?>" id="input-total-start" class="form-control" />
								  <input style="min-width: 60px; width: 50%;" type="text" name="filter_total_end" value="<?php echo $filter_total_end; ?>"  placeholder="<?php echo $text_to; ?>" data-reload="<?php echo $filter_reload_total; ?>" id="input-total-end" class="form-control" />
									<?php if ($filter_clear_buttons_total) { ?>
									  <span class="input-group-btn">
										<button type="button" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_clear_filter; ?>" onclick="clearFilter('input-total-start'); clearFilter('input-total-end');"><i class="fa fa-times-circle"></i></button>
									  </span>
									<?php } ?>
								</div>
							  <?php } ?>
							  </td>
							<?php } ?>

							<?php if ($date_added_column) { ?>
							  <td style="<?php echo $settings['column_style']['date_added']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['date_added']; ?>">
							  <?php if ($date_added_filtertable) { ?>
								<div <?php if ($filter_clear_buttons_date_added) { ?>class="input-group"<?php } ?>>
								  <input type="text" style="min-width: 90px;" name="filter_date_added" value="<?php echo $filter_date_added; ?>" placeholder="<?php echo $entry_date_added; ?>" data-reload="<?php echo $filter_reload_date_added; ?>" id="input-date-added" class="form-control date" />
									<?php if ($filter_clear_buttons_date_added) { ?>
									  <span class="input-group-btn">
										<button type="button" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_clear_filter; ?>" onclick="clearFilter('input-date-added');"><i class="fa fa-times-circle"></i></button>
									  </span>
									<?php } ?>
								</div>
							  <?php } ?>
							  </td>
							<?php } ?>

							<?php if ($date_modified_column) { ?>
							  <td style="<?php echo $settings['column_style']['date_modified']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['date_modified']; ?>">
							  <?php if ($date_modified_filtertable) { ?>
								<div <?php if ($filter_clear_buttons_date_modified) { ?>class="input-group"<?php } ?>>
								  <input type="text" style="min-width: 90px;" name="filter_date_modified" value="<?php echo $filter_date_modified; ?>" placeholder="<?php echo $entry_date_modified; ?>" data-reload="<?php echo $filter_reload_date_modified; ?>" id="input-date-modified" class="form-control date" />
									<?php if ($filter_clear_buttons_date_modified) { ?>
									  <span class="input-group-btn">
										<button type="button" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_clear_filter; ?>" onclick="clearFilter('input-date-modified');"><i class="fa fa-times-circle"></i></button>
									  </span>
									<?php } ?>
								</div>
							  <?php } ?>
							  </td>
							<?php } ?>

							<?php if ($action_column) { ?>
							  <td style="<?php echo $settings['column_style']['action']; ?>" class="text-right" data-sort="<?php echo $settings['column_sort']['action']; ?>">
							  <?php if ($button_clear_all_filtertable) { ?>
								<button type="button" id="" onclick="dumpFilter(<?php echo $filter_reload_button_clear_all; ?>);" class="btn btn-warning" data-toggle="tooltip" title="<?php echo $button_clear_all; ?>" ><i class="fa fa-times-circle"></i></button>
							  <?php } ?>
							  <?php if ($button_apply_filter_filtertable) { ?>
								<button type="button" id="button-filter" class="btn btn-primary" data-toggle="tooltip" title="<?php echo $button_apply_filter; ?>" ><i class="fa fa-filter"></i></button>
							  <?php } ?>
							  </td>
							<?php } ?>
						  </tr>
						<?php } ?>
						<!-- Orders -->
						<?php if ($orders) { ?>
						<?php foreach ($orders as $order) { ?>
						<tr class="sorting-row order-list" id="order-row<?php echo $order['order_id']; ?>">
							<?php if ($select_column) { ?>
							  <td style="'<?php echo $settings['column_style']['select']; ?>" class="text-center" data-sort="<?php echo $settings['column_sort']['select']; ?>">
								<input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" />
								<input type="hidden" name="shipping_code[]" value="<?php echo $order['shipping_code']; ?>" /></td>
							<?php } ?>

							<?php if ($order_id_column) { ?>
							  <td style="'<?php echo $settings['column_style']['order_id']; ?>" class="text-right" data-sort="<?php echo $settings['column_sort']['order_id']; ?>"><?php echo $order['order_id']; ?></td>
							<?php } ?>

							<?php if ($store_column) { ?>
							  <td style="'<?php echo $settings['column_style']['store']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['store']; ?>">
								<?php if ($order['store_id'] == 0) { echo $text_store_default; } else {
									foreach ($stores as $store) {if ($order['store_id'] == $store['store_id']) echo $store['name']; } } ?>
							  </td>
							<?php } ?>

							<?php if ($customer_group_column) { ?>
							  <td style="'<?php echo $settings['column_style']['customer_group']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['customer_group']; ?>"><?php echo $order['customer_group']; ?></td>
							<?php } ?>

							<?php if ($customer_column) { ?>
							  <td style="'<?php echo $settings['column_style']['customer']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['customer']; ?>">
							  <?php if (!empty($order['order_customer_fields']) || !empty($order['customer_fields_from_template'])) { ?>
								<span style="width: 36px;" type="button" class="btn btn-default btn-trigger" onclick="$('#order_customer_fields_<?php echo $order['order_id']; ?>').slideToggle();" title="<?php echo $text_show_hide_payment_data; ?>"><i class="fa fa-sort"></i></span><span>&nbsp;&nbsp;<?php echo $order['customer']; ?></span>

							  <?php if (!empty($order['order_customer_fields']) && empty($order['customer_fields_from_template'])) { ?>
								<div class="payment_data adding-data" id="order_customer_fields_<?php echo $order['order_id']; ?>" style="<?php echo $customer_fields_hidden; ?>">
								  <table style="margin-top: 7px;">
								  <?php foreach ($order['order_customer_fields'] as $fields) { ?>
									<?php foreach ($fields as $field) { ?>
									  <?php if (!empty($field['val'])) { ?>
									    <?php if (strpos($field['img'], 'phone') !== false) { ?>
										    <tr><td class="adding-field-img"><i class="fa <?php echo $field['img']; ?>" title="<?php if (isset($field['label'])) echo $field['label']; ?>"></i></td><td>
                                                    <a class="call" onclick="callRequest('<?php echo strip_tags($field["val"]); ?>');" data-toggle="tooltip" title="Позвонить клиенту"><?php echo strip_tags($field['val']); ?></a>
                                                </td></tr>
									    <?php }else{ ?>
                                            <tr><td class="adding-field-img"><i class="fa <?php echo $field['img']; ?>" title="<?php if (isset($field['label'])) echo $field['label']; ?>"></i></td><td><?php echo $field['val']; ?></td></tr>
                                        <?php } ?>
                                        
									  <?php } ?>
									<?php } ?>
								  <?php } ?>
								  </table>
								</div>
							  <?php } ?>

							  <?php if (empty($order['order_customer_fields']) && !empty($order['customer_fields_from_template'])) { ?>
								<div class="payment_data" id="order_customer_fields_<?php echo $order['order_id']; ?>" style="<?php echo $customer_fields_hidden; ?>">
									<?php echo $order['customer_fields_from_template']; ?>
								</div>
							  <?php } ?>

							  <?php } else { ?>
								<?php echo $order['customer']; ?>
							  <?php } ?>
							  </td>
							<?php } ?>

							<?php if ($recipient_column) { ?>
							  <td style="'<?php echo $settings['column_style']['recipient']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['recipient']; ?>">
							  <?php if (!empty($order['order_recipient_fields']) || !empty($order['recipient_fields_from_template'])) { ?>
								<span style="width: 36px;" type="button" class="btn btn-default btn-trigger" onclick="$('#order_recipient_fields_<?php echo $order['order_id']; ?>').slideToggle();" title="<?php echo $text_show_hide_shipping_data; ?>"><i class="fa fa-sort" ></i></span><span>&nbsp;&nbsp;<?php echo $order['recipient']; ?></span>

							  <?php if (!empty($order['order_recipient_fields']) && empty($order['recipient_fields_from_template'])) { ?>
								<div class="shipping_data adding-data" id="order_recipient_fields_<?php echo $order['order_id']; ?>" style="<?php echo $recipient_fields_hidden; ?>">
								  <table style="margin-top: 7px;">
								  <?php foreach ($order['order_recipient_fields'] as $fields) { ?>
									<?php foreach ($fields as $field) { ?>
									  <?php if (!empty($field['val'])) { ?>
										<tr><td class="adding-field-img"><i class="fa <?php echo $field['img']; ?>"></i></td><td><?php echo $field['val']; ?></td></tr>
									  <?php } ?>
									<?php } ?>
								  <?php } ?>
								  </table>
								</div>
							  <?php } ?>

							  <?php if (empty($order['order_recipient_fields']) && !empty($order['recipient_fields_from_template'])) { ?>
								<div class="shipping_data" id="order_recipient_fields_<?php echo $order['order_id']; ?>" style="<?php echo $recipient_fields_hidden; ?>">
									<?php echo $order['recipient_fields_from_template']; ?>
								</div>
							  <?php } ?>

							  <?php } else { ?>
								<?php echo $order['recipient']; ?>
							  <?php } ?>
							  </td>
							<?php } ?>

							<?php if ($products_column) { ?>
							  <td style="'<?php echo $settings['column_style']['products']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['products']; ?>">
							  <?php if ($order['quantity'] >= $popup_product_start) { ?>
								<span style="width: 36px;" type="button" class="btn btn-default btn-eye" onclick="popupOrderProducts('<?php echo $order['order_id']; ?>');" title="<?php echo $text_show_popup_products_data; ?>"><i class="fa fa-eye"></i></span><span>&nbsp;&nbsp;<?php echo $text_count_products . $order['quantity']; ?></span>
							  <?php } else { ?>
								<span style="width: 36px;" type="button" class="btn btn-default btn-trigger" onclick="$('#products<?php echo $order['order_id']; ?>').slideToggle();" title="<?php echo $text_show_hide_products_data; ?>"><i class="fa fa-sort"></i></span><span>&nbsp;&nbsp;<?php echo $text_count_products . $order['quantity']; ?></span>
								<div id="products<?php echo $order['order_id']; ?>" class="products_data adding-data" style="<?php echo $product_fields_hidden; ?>">
								  <table class="table-products">
									<?php foreach ($order['products'] as $product) { ?>
									  <tr style="border-bottom: 0">
										<?php if (!empty($product['image'])) { ?>
										  <td class="text-left"><span class="product_image"><?php echo $product['image']; ?></span></td>
										<?php } ?>
										<td class="text-left">
											<ul class="product_fields">
												<li><a href="<?php echo $product['href']; ?>" title="<?php echo $text_edit; ?>"><?php echo $product['name']; ?></a></li>
												<li style="list-style-type: none; padding-left: 0;"><nobr><?php echo $product['price']; ?>&nbsp;<?php echo 'x '.$product['quantity']; ?></nobr></li>
												<?php if (!empty($product['product_fields'])) { ?>
												  <?php foreach ($product['product_fields'] as $fields) { ?>
													<?php foreach ($fields as $field) { ?>
													  <?php if (!empty($field['value'])) { ?>
														<li><?php echo '<b>'.$field['key'].':</b> '.$field['value']; ?></li>
													  <?php } ?>
													<?php } ?>
												  <?php } ?>
												<?php } ?>
											</ul>
										</td>
									  </tr>
									  <tr>
										<td class="text-left" colspan="5">
											<?php if (!empty($product['options'])) { ?>
												<?php foreach ($product['options'] as $option) { ?>
													<div><?php echo '- '.$option['name'].': '.$option['value']; ?></div>
												<?php } ?>
											<?php } ?>
										</td>
									  </tr>
									<?php } ?>
								  </table>
								</div>
							  <?php } ?>
							  </td>
							<?php } ?>

							<?php if ($status_history_column) { ?>
							  <td class="text-left" data-sort="<?php echo $settings['column_sort']['status_history']; ?>" style="<?php echo $settings['column_style']['status_history']; ?> <?php if (!$this_history_fields) { ?>color: <?php echo $order['order_status_text_color_id']; ?>; background-color: <?php echo $order['order_status_back_color_id']; ?>;<?php } ?>">
								  <table class="table-comment-history">
									<tbody>
									  <tr>
										<?php if ($this_history_fields) { ?>
										  <td style="width: 1px;">
											<span style="width: 36px;" type="button" class="btn btn-default" onclick="$('#order_history_fields_<?php echo $order['order_id']; ?>').slideToggle();"><i class="fa fa-sort" title="<?php echo $text_show_hide_history_data; ?>"></i></span>
										  </td>
										  <td class="text-left" >
											<select style="min-width: 120px; color: <?php echo $order['order_status_text_color_id']; ?>; background-color: <?php echo $order['order_status_back_color_id']; ?>;" name="order_status_id<?php echo $order['order_id']; ?>" class="form-control history-changed change-status" data-order-id="<?php echo $order['order_id']; ?>" title="<?php echo $text_change_status; ?>">

											  <?php if ($order['order_status_id'] == '0') { ?>
												<option value="0" selected="selected"><?php echo $text_missing; ?></option>
											  <?php } ?>

											  <?php foreach ($history_statuses as $history_status) { ?>
												<option value="<?php echo $history_status['order_status_id']; ?>" <?php if ($history_status['order_status_id'] == $order['order_status_id']) { ?>selected <?php } ?>><?php echo $history_status['name']; ?></option>
											  <?php } ?>
											</select>
										  </td>
										<?php } else { ?>
										  <td style="vertical-align: middle !Important; width: 100%; height: 36px; padding: 3px;">
											<?php echo $order['order_status']; ?>
											<input type="hidden" id="" name="order_status_id<?php echo $order['order_id']; ?>" value="<?php echo $order['order_status_id']; ?>"/>
										  </td>
										<?php } ?>
										<?php if (!empty($order['comment'])) { ?>
										  <td class="text-right" style="width: 1px;">
										   <div class="tooltips"><span class="btn btn-default" disabled="disabled"><i class="fa fa-user comment-user" ></i></span> <span class="tooltips-span my-custom my-critical"><em><i class="fa fa-user comment-user" ></i>&nbsp;&nbsp;<?php echo $text_order_comment; ?></em><?php echo $order['comment']; ?></span></div>
										  </td>
										<?php } ?>
										<?php if (!empty($order['history'])) { ?>
										  <td class="text-right" style="width: 1px;">
										   <div class="tooltips"><span class="btn btn-default" disabled="disabled"><i class="fa fa-user history-user"></i></span> <span class="tooltips-span my-custom my-help"><em><i class="fa fa-user history-user"></i>&nbsp;&nbsp;<?php echo $text_history_comment; ?></em><?php echo $order['history']; ?></span></div>
										  </td>
										<?php } ?>
										<?php if ($this_history_fields) { ?>
										  <td class="add-notify text-right">
											<label type="button" class="btn btn-info" data-toggle="tooltip" title="<?php echo $entry_notify; ?>"><input type="checkbox" class="history-changed" name="notify<?php echo $order['order_id']; ?>" value="1" <?php if ($notify_checked_history) { ?>checked="checked"<?php } ?> data-order-id="<?php echo $order['order_id']; ?>"/></label>
										  </td>
										  <td class="add-comment">
											<button type="button" class="btn btn-primary button-history" id="button-history<?php echo $order['order_id']; ?>" data-loading-text="..." data-order-id="<?php echo $order['order_id']; ?>" data-store-id="<?php echo $order['store_id']; ?>" disabled="disabled" data-toggle="tooltip" title="<?php echo $text_history_add; ?>"><i class="fa fa-plus"></i></button>
										  </td>
										<?php } ?>
									  </tr>
									</tbody>
								  </table>

								<?php if ($this_history_fields) { ?>
									<div class="history_data adding-data"  id="order_history_fields_<?php echo $order['order_id']; ?>" style="<?php echo $history_fields_hidden; ?>">
									  <table class="table-history-data">
										<tbody>
										<?php if ($invoice_history) { ?>
										  <tr>
											<td><?php echo $text_invoice; ?></td>
											<td id="invoice<?php echo $order['order_id']; ?>" class="text-right"><?php echo $order['invoice_no']; ?></td>
											<td style="width: 1%;" class="text-center"><?php if (!$order['invoice_no']) { ?>
											  <button id="button-invoice<?php echo $order['order_id']; ?>" data-loading-text="..." data-order-id="<?php echo $order['order_id']; ?>" data-toggle="tooltip" title="<?php echo $button_generate; ?>" class="btn btn-success btn-xs create-invoice"><i class="fa fa-cog"></i></button>
											  <?php } else { ?>
											  <button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-times-circle"></i></button>
											  <?php } ?></td>
										  </tr>
										<?php } ?>

										<?php if ($track_no_history) { ?>
										  <tr>
											<td><?php echo $text_track_no; ?></td>
											<td class="text-right"><input type="text" name="order_track_no<?php echo $order['order_id']; ?>" value="<?php echo $order['track_no']; ?>" /></td>
											<td style="width: 1%;" class="text-center">
											  <button id="button-track_no-add<?php echo $order['order_id']; ?>" data-loading-text="..." data-order-id="<?php echo $order['order_id']; ?>" data-toggle="tooltip" title="<?php echo $button_track_no_save; ?>" class="btn btn-success btn-xs button-track_no-add"><i class="fa fa-cog"></i></button>
											</td>
										  </tr>
										<?php } ?>

										<?php if ($reward_history) { ?>
										  <tr>
											<td><?php echo $text_reward; ?></td>
											<td class="text-right"><?php echo $order['reward']; ?></td>
											<td class="text-center"><?php if ($order['customer'] && $order['reward']) { ?>
											  <?php if (!$order['reward_total']) { ?>
											  <button id="button-reward-add<?php echo $order['order_id']; ?>" data-loading-text="..." data-order-id="<?php echo $order['order_id']; ?>" data-toggle="tooltip" title="<?php echo $button_reward_add; ?>" class="btn btn-success btn-xs reward-add"><i class="fa fa-plus-circle"></i></button>
											  <?php } else { ?>
											  <button id="button-reward-remove<?php echo $order['order_id']; ?>" data-loading-text="..." data-order-id="<?php echo $order['order_id']; ?>" data-toggle="tooltip" title="<?php echo $button_reward_remove; ?>" class="btn btn-danger btn-xs reward-remove"><i class="fa fa-minus-circle"></i></button>
											  <?php } ?>
											  <?php } else { ?>
											  <button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-plus-circle"></i></button>
											  <?php } ?></td>
										  </tr>
										<?php } ?>
										<?php if ($affiliate_history) { ?>
										  <tr>
											<td><?php echo $text_affiliate; ?>
											  <?php if ($order['affiliate']) { ?>
											  (<a href="<?php echo $order['affiliate']; ?>"><?php echo $order['affiliate_firstname']; ?> <?php echo $order['affiliate_lastname']; ?></a>)
											  <?php } ?></td>
											<td class="text-right"><?php echo $order['commission']; ?></td>
											<td class="text-center"><?php if ($order['affiliate']) { ?>
											  <?php if (!$order['commission_total']) { ?>
											  <button id="button-commission-add<?php echo $order['order_id']; ?>" data-loading-text="..." data-order-id="<?php echo $order['order_id']; ?>" data-toggle="tooltip" title="<?php echo $button_commission_add; ?>" class="btn btn-success btn-xs commission-add"><i class="fa fa-plus-circle"></i></button>
											  <?php } else { ?>
											  <button id="button-commission-remove<?php echo $order['order_id']; ?>" data-loading-text="..." data-order-id="<?php echo $order['order_id']; ?>" data-toggle="tooltip" title="<?php echo $button_commission_remove; ?>" class="btn btn-danger btn-xs commission-remove"><i class="fa fa-minus-circle"></i></button>
											  <?php } ?>
											  <?php } else { ?>
											  <button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-plus-circle"></i></button>
											  <?php } ?></td>
										  </tr>
										<?php } ?>
										<?php if ($comment_history) { ?>
										  <tr>
											  <td colspan="3">
												<textarea onfocus="$(this).attr('rows', 4);" name="comment<?php echo $order['order_id']; ?>" rows="1" class="form-control history-changed" placeholder="<?php echo $text_your_comment; ?>" data-order-id="<?php echo $order['order_id']; ?>"></textarea>
											  </td>
										  </tr>
										<?php } ?>
										</tbody>
									  </table>
									</div>
								<?php } ?>
							  </td>
							<?php } ?>

							<?php if ($payment_method_column) { ?>
							  <td class="text-right" data-sort="<?php echo $settings['column_sort']['payment_method']; ?>" style="<?php echo $settings['column_style']['payment_method']; ?> color: <?php echo $order['order_payment_text_color_id']; ?>; background-color: <?php echo $order['order_payment_back_color_id']; ?>;"><?php echo $order['payment_method']; ?></td>
							<?php } ?>

							<?php if ($shipping_method_column) { ?>
							  <td class="text-right" data-sort="<?php echo $settings['column_sort']['shipping_method']; ?>" style="<?php echo $settings['column_style']['shipping_method']; ?> color: <?php echo $order['order_shipping_text_color_id']; ?>; background-color: <?php echo $order['order_shipping_back_color_id']; ?>;"><?php echo $order['shipping_method']; ?></td>
							<?php } ?>

							<?php if ($date_shipping_column && $scheduler_status) { ?>
								<?php if ($edit_date_shipping && $order['date_shipping']) { ?>
								  <td style="<?php echo $settings['column_style']['date_shipping']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['date_shipping']; ?>">
									<div class="input-group">
									  <input style="border-right: 0; color: <?php echo $order['days_to_ship_text_color_id']; ?>; background-color: <?php echo $order['days_to_ship_back_color_id']; ?>; border-color: <?php echo $order['days_to_ship_back_color_id']; ?>;" value="<?php echo $order['date_shipping']; ?>" class="input-date-shipping-change form-control date" id="date-shipping-change<?php echo $order['order_id']; ?>" data-order-id="<?php echo $order['order_id']; ?>" />
									  <span class="input-group-btn">
										<button type="button" class="btn btn-primary button-date-shipping-change" disabled="disabled" data-loading-text="..." data-order-id="<?php echo $order['order_id']; ?>" id="button-date-shipping-change<?php echo $order['order_id']; ?>" title="<?php echo $button_save_date; ?>"><i class="fa fa-save"></i>
										</button>
									  </span>
									</div>
								  </td>
								<?php } else { ?>
									<?php if ($order['date_shipping']) { ?>
									 <td class="text-right" data-sort="<?php echo $settings['column_sort']['date_shipping']; ?>" style="<?php echo $settings['column_style']['date_shipping']; ?> color: <?php echo $order['days_to_ship_text_color_id']; ?>; background-color: <?php echo $order['days_to_ship_back_color_id']; ?>;"><?php echo $order['date_shipping']; ?></td>
									<?php } else { ?>
									  <td style="<?php echo $settings['column_style']['date_shipping']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['date_shipping']; ?>"></td>
									<?php } ?>
								<?php } ?>
							<?php } ?>

							<?php if ($time_shipping_column && $scheduler_status) { ?>
								<?php if ($edit_time_shipping && $order['date_shipping']) { ?>
								  <td style="<?php echo $settings['column_style']['time_shipping']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['time_shipping']; ?>">
									<div class="input-group">
									  <input style="min-width: 60px; width: 50%; border-right: 0;" value="<?php echo $order['shipping_time_start']; ?>" class="input-time-shipping-start-change form-control" id="time-shipping-start-change<?php echo $order['order_id']; ?>" data-order-id="<?php echo $order['order_id']; ?>" />
									  <input style="min-width: 60px; width: 50%;" value="<?php echo $order['shipping_time_end']; ?>" class="input-time-shipping-end-change form-control" id="time-shipping-end-change<?php echo $order['order_id']; ?>" data-order-id="<?php echo $order['order_id']; ?>" />
									  <span class="input-group-btn">
										<button type="button" class="btn btn-primary button-time-shipping-change" disabled="disabled" data-loading-text="..." data-order-id="<?php echo $order['order_id']; ?>" id="button-time-shipping-change<?php echo $order['order_id']; ?>" title="<?php echo $button_save_time; ?>"><i class="fa fa-save"></i>
										</button>
									  </span>
									</div>
								  </td>
								<?php } else { ?>
									<?php if ($order['date_shipping']) { ?>
									  <td style="<?php echo $settings['column_style']['time_shipping']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['time_shipping']; ?>"><?php echo $order['shipping_time_start']; ?> - <?php echo $order['shipping_time_end']; ?></td>
									<?php } else { ?>
									  <td style="<?php echo $settings['column_style']['time_shipping']; ?>" class="text-left" data-sort="<?php echo $settings['column_sort']['time_shipping']; ?>"></td>
									<?php } ?>
								<?php } ?>
							<?php } ?>

							<?php if ($subtotal_column) { ?>
							  <td style="<?php echo $settings['column_style']['subtotal']; ?>" class="text-right" data-sort="<?php echo $settings['column_sort']['subtotal']; ?>"><nobr><?php echo $order['subtotal']; ?></nobr></td>
							<?php } ?>

							<?php if ($total_column) { ?>
							  <td style="<?php echo $settings['column_style']['total']; ?>" class="text-right" data-sort="<?php echo $settings['column_sort']['total']; ?>"><nobr><?php echo $order['total']; ?></nobr></td>
							<?php } ?>

							<?php if ($date_added_column) { ?>
							  <td class="text-left" data-sort="<?php echo $settings['column_sort']['date_added']; ?>" <?php if (!empty($settings['filters']) && $date_added_filter) { ?> onclick="insertFilterDateAdded('<?php echo $order['date_added']; ?>');" style="<?php echo $settings['column_style']['date_added']; ?> cursor: help;" title="<?php echo $insert_into_filter; ?>"<?php } ?>><?php echo $order['date_added_format']; ?></td>
							<?php } ?>

							<?php if ($date_modified_column) { ?>
							  <td class="text-left" data-sort="<?php echo $settings['column_sort']['date_modified']; ?>" <?php if (!empty($settings['filters']) && $date_modified_filter) { ?> onclick="insertFilterDateModified('<?php echo $order['date_modified']; ?>');" style="<?php echo $settings['column_style']['date_modified']; ?> cursor: help;" title="<?php echo $insert_into_filter; ?>"<?php } ?>><?php echo $order['date_modified_format']; ?></td>
							<?php } ?>

							<?php if ($action_column) { ?>
							  <td style="<?php echo $settings['column_style']['action']; ?>" class="text-right buttons-action" data-sort="<?php echo $settings['column_sort']['action']; ?>">
								<?php if (isset($settings['filters'])) { ?>
									<?php if ($button_expand_data_filter) { ?>
									<div class="btn-group action-button"><a data-orderid="<?php echo $order['order_id']; ?>" class="btn btn-default toggle-order-data" data-toggle="tooltip" title="<?php echo $button_expand_data; ?>"><i class="fa  fa-sort"></i></a></div>
									<?php } ?>
									<?php if ($button_view_filter) { ?>
									<div class="btn-group action-button"><a href="<?php echo $order['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a></div>
									<?php } ?>

									<?php if ($novaposhta32x_status && $order['shipping_code_1'] == 'novaposhta') { ?>
									  <div class="btn-group action-button"><a href="<?php echo $order['novaposhta_ei']; ?>" data-toggle="tooltip" title="<?php echo ($order['novaposhta_ei_ref']) ? $button_edit_ei : $button_create_ei ?>" class="btn btn-<?php echo ($order['novaposhta_ei_ref']) ? 'primary' : 'danger' ?>"><i class="fa fa-header"></i></a></div>
									<?php } ?>

									<?php if ($button_edit_filter) { ?>
									<div class="btn-group action-button"><a href="<?php echo $order['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></div>
									<?php } ?>
								<?php } ?>

								<?php if ($orderpro27_status) { ?>
									<div class="btn-group action-button"><a href="<?php echo $order['edit_orderpro']; ?>" data-toggle="tooltip" title="<?php echo $button_edit_orderpro; ?>" class="btn btn-success"><i class="fa fa-edit"></i></a></div>
								<?php } ?>
							  </td>
							<?php } ?>

						</tr>
						<?php } ?>
						<?php } else { ?>
						<tr>
						  <td class="text-center" colspan="22"><?php echo $text_no_results; ?></td>
						</tr>
						<?php } ?>
					  </tbody>
					</table>
				  </div>
				</form>
			  <?php } else { ?>
				<div class="col-sm-12 text-center"><?php echo $error_columns; ?></div>
			  <?php } ?>
			<?php } else { ?>
				<div class="col-sm-12 text-center"><?php echo $error_permission_list; ?></div>
			<?php } ?>
		  </div>
			<script type="text/javascript"><!--
				function sortBy(i, ii) {
					if (Number(i[0]) > Number(ii[0])) return 1;
					else if (Number(i[0]) < Number(ii[0])) return -1;
					else return 0;
				}
				function sortElements(sortable) {
					var elements = new Array();
					sortable.each(function(){
						var sort = Number($(this).attr('data-sort'));
						var el = $(this);
						var elem = [sort,el];
						elements.push(elem);
					});
					elements.sort(sortBy);
					return elements;
				}
				$('.sorting-row').each(function(){
					var id = $(this).attr('id');
					var sortable = $('#'+id+' > td');
					var elements = sortElements(sortable);
					var html = new Array();
					for (i in elements) {
						html.push(elements[i][1]);
					}
					$(this).html('');
					$(this).append(html);
				});
				$('.omanager-list').show();
			 //--></script>
		  <?php } ?>

		  <!-- Order MAP -->
		  <?php if ($show_map) { ?>
		  <div class="omanager-map panel-body" id="omanager-map" style="height: <?php echo $settings['height_map']; ?>px;">
			<script src="https://api-maps.yandex.ru/2.1/?<?php echo ($ymap_apikey !=='' ? 'apikey='.$ymap_apikey : ''); ?>&lang=ru_RU" type="text/javascript"></script>
			<div id="orders-map" class="col-sm-12" style="height: <?php echo $settings['height_map']; ?>px;"></div>
		  </div>
		  <?php } ?>

		  <!-- pagination bottom -->
		  <?php if (isset($settings['pagination_method']) && ($settings['pagination_method'] == 1 || $settings['pagination_method'] == 3)) { ?>
		  <div class="panel-pagination panel-body">
			<div class="col-sm-6 pagination"><?php echo $pagination; ?></div>
			<div class="col-sm-6 text-right pagination-results"><?php echo $pagination_results; ?></div>
		  </div>
		  <?php } ?>
		</div>
		<div class="panel-footer"><a href="https://opencartforum.com/user/28448-brest001/?tab=node_downloads_Files" target="_blank"><?php echo $heading_title . ' v.' . $version; ?></a></div>
	</div>
  </div>
</div>

<script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />

<?php if ($show_list) { ?>
<script type="text/javascript">

	$(document).ready(function(){
		var table = $('.joystick-table');
		var resp = table.closest('.joystick-table-responsive');
		var table_width = table.outerWidth();
		var resp_width = resp.outerWidth();

		if (table_width > resp_width) {
			var html = '<div class="joystick"><div class="joystick_left"><i class="fa fa-chevron-left fa-3x"></i></div><div class="joystick_right"><i class="fa fa-chevron-right fa-3x"></i></div></div>';
			resp.prepend(html);
			$('.joystick').hover(
				function () { $(this).animate({'opacity':'0.8'}, 300); },
				function () { $(this).animate({'opacity':'0.3'}, 300); }
			);

			$('.joystick_left, .joystick_right').click(function() {
				var that = $(this);
				var scroll_left = resp.scrollLeft();
				if (that.attr('class') == 'joystick_left') {
					resp.animate({'scrollLeft':(scroll_left - 700)}, 700);
				} else {
					resp.animate({'scrollLeft':(scroll_left + 700)}, 700);
				}
			});
		}
	});

	function popupOrderProducts(order_id) {
		$.magnificPopup.open({
			removalDelay: 300,
			callbacks: {
				beforeOpen: function() {
				   this.st.mainClass = 'my-mfp-zoom-in';
				}
			},
			tLoading: '<?php echo $text_loading; ?>',
			items: {
				src: 'index.php?route=sale/omanager/getOrderProductsData&<?php echo $strtoken; ?>&order_id=' + order_id,
				type: 'ajax'
			}
		});
	}

	$(document).delegate('.change-status', 'change', function() {
		var order_id = $(this).attr('data-order-id');
		var order_status_id = $(this).val();
		$.ajax({
			url: 'index.php?route=sale/omanager/getStatusComment&<?php echo $strtoken; ?>&order_id=' + order_id + '&order_status_id=' + order_status_id,
			dataType: 'json',
			beforeSend: function() {
				$('#order_history_fields_' + order_id).slideDown();
				$('textarea[name=\'comment' + order_id + '\']').val('<?php echo $text_loading; ?>');
			},
			success: function(json) {
				if (json['comment']) {
					$('textarea[name=\'comment' + order_id + '\']').val(json['comment']).focus();
				} else {
					$('textarea[name=\'comment' + order_id + '\']').val('');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
		return false;
	});
</script>

<script type="text/javascript"><!--
	$(document).delegate('.toggle-order-data', 'click', function() {
		var order_id = $(this).attr("data-orderid");
		var btn = $(this);
		btn.removeClass("expanded");

		$('#order-row'+order_id + ' .adding-data').each(function(){
			var el = $(this);
			if (!el.is(':hidden')) {
				btn.addClass("expanded");
			}
		});

		if (btn.hasClass("expanded")) {
			$('#order-row' + order_id + ' .payment_data, #order-row' + order_id + ' .shipping_data, #order-row' + order_id + ' .products_data, #order-row' + order_id + ' .history_data').slideUp();
			btn.removeClass("expanded");
		} else {
			$('#order-row' + order_id + ' .payment_data, #order-row' + order_id + ' .shipping_data, #order-row' + order_id + ' .products_data, #order-row' + order_id + ' .history_data').slideDown();
			btn.addClass("expanded");
		}
	});

	$(document).delegate('.toggle-all', 'click', function() {
		var btn_id = $(this).attr("id");
		var btn = $(this);
		btn.removeClass("expanded");
		values = btn_id.split("-");
		var target = values[1];

		$('.'+target).each(function(){
			var el = $(this);
			if (!el.is(':hidden')) {
				btn.addClass("expanded");
			}
		});

		if (btn.hasClass("expanded")) {
			$('.'+target).slideUp();
			btn.removeClass("expanded");
		} else {
			$('.'+target).slideDown();
			btn.addClass("expanded");
		}
	});

	function insertFilterDateShipping(date) {
		$('input[name=\'filter_date_shipping_start\'], input[name=\'filter_date_shipping_end\']').val(date);
		$('input[name=\'filter_date_shipping_start\']').trigger('change');
	}

	function insertFilterDateAdded(date) {
		$('input[name=\'filter_date_added\']').val(date);
		$('input[name=\'filter_date_added\']').trigger('change');
	}

	function insertFilterDateModified(date) {
		$('input[name=\'filter_date_modified\']').val(date);
		$('input[name=\'filter_date_modified\']').trigger('change');
	}

	$(document).delegate('input[name^=\'selected\']', 'change', function() {
		$('#button-change-statuses, #button-shipping, #button-invoice, #button-delete').prop('disabled', true);
		var selected = $('input[name^=\'selected\']:checked');
		if (selected.length) {
			$('span[id=\'count-selected\']').text('('+selected.length+')');
			$('#apply-change-statuses').prop('disabled', false);
			$('#button-change-statuses, #button-invoice, #button-delete').prop('disabled', false);
		} else {
			$('span[id=\'count-selected\']').text('');
			$('#apply-change-statuses').prop('disabled', true);
		}
		for (i = 0; i < selected.length; i++) {
			if ($(selected[i]).parent().find('input[name^=\'shipping_code\']').val()) {
				$('#button-shipping').prop('disabled', false);
				break;
			}
		}
	});

	$('input[name^=\'selected\']:first').trigger('change');

	$(document).delegate('.history-changed', 'change', function() {
		var order_id = $(this).attr('data-order-id');
		$('#button-history' + order_id).attr('disabled', false);
	});

	$(document).delegate('.input-date-shipping-change', 'change', function() {
		var order_id = $(this).attr('data-order-id');
		$('#button-date-shipping-change' + order_id).attr('disabled', false);
	});

	$(document).delegate('.input-time-shipping-start-change, .input-time-shipping-end-change', 'focus', function() {
		var order_id = $(this).attr('data-order-id');
		$('#button-time-shipping-change' + order_id).attr('disabled', false);
	});

	// IE and Edge fix!
	$('#button-shipping, #button-invoice').on('click', function(e) {
		$('#form-order').attr('action', this.getAttribute('formAction'));
	});

	$('#button-delete').click(function() {
		if (!$(this).hasClass('disabled')) {
			if (confirm("<?php echo $text_delete_confirm; ?>")) {
				url = "<?php echo html_entity_decode($delete, ENT_NOQUOTES, 'UTF-8'); ?>" + filter(true);
				$('#form-order').attr('action', url);
				$('#form-order').attr('target', '_self');
				$('#form-order').submit();
			} else {
				return false;
			}
		}
	});

	function refreshOrderData(order_data, order_id) {
		function sortTdBy(i, ii) {
			if (Number(i[0]) > Number(ii[0])) return 1;
			else if (Number(i[0]) < Number(ii[0])) return -1;
			else return 0;
		}
		function sortTdElements(sortable) {
			var elements = new Array();
			sortable.each(function(){
				var sort = Number($(this).attr('data-sort'));
				var el = $(this);
				var elem = [sort,el];
				elements.push(elem);
			});
			elements.sort(sortTdBy);
			return elements;
		}

		var sortable = order_data.find('> td');
		var elements = sortTdElements(sortable);
		var html = new Array();
		for (i in elements) {
			html.push(elements[i][1]);
		}

		$('#order-row' + order_id).html(html);

		$('.date').datetimepicker({
			pickTime: false,
			format: 'DD.MM.YYYY',
			useCurrent: false,
		});

		$('.time').datetimepicker({
			pickDate: false,
			format: 'HH:mm',
			useCurrent: false,
			minuteStepping: 10
		});

		$("#input-shipping-time-start, #input-shipping-time-end").mask("99:99");

		$('.input-time-shipping-start-change').each(function(){
			var order_id = $(this).attr('data-order-id');
			$('#time-shipping-start-change' + order_id).mask("99:99");
		});

		$('.input-time-shipping-end-change').each(function(){
			var order_id = $(this).attr('data-order-id');
			$('#time-shipping-end-change' + order_id).mask("99:99");
		});

		setTimeout(function() {
			$('.alert-success').hide('slow');
			$('.alert-danger').hide('slow');
		}, 10000);
	}

	// Change DATE shipping
	<?php if ($edit_date_shipping) { ?>
		$(document).delegate('.button-date-shipping-change', 'click', function() {
			var order_id = $(this).attr('data-order-id');
			var date_shipping = $('input[id=\'date-shipping-change' + order_id + '\']').val();
			if (!/^\d\d\.\d\d\.\d{4}$/.test (date_shipping)) {alert('<?php echo $error_date_format; ?>'); return;}

			if (confirm("<?php echo $text_change_date_confirm; ?>" + date_shipping + '?<?php echo $text_change_date_confirm_info; ?>')) {
				$.ajax({
					url: 'index.php?route=sale/omanager/changeDateTimeShipping&<?php echo $strtoken; ?>',
					type: 'post',
					dataType: 'json',
					data: '&order_id=' + order_id + '&date_shipping=' + date_shipping,
					beforeSend: function() {
						$('#button-date-shipping-change' + order_id).button('loading');
					},
					complete: function() {
						$('#button-date-shipping-change' + order_id).button('reset');
					},
					success: function(json) {
						$('.alert, .alert-order').remove();

						if (json['error']) {
							$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
						}

						if (json['success']) {
							$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
							var query = String(document.location).split('?');
							if (query[1]) {
								$.ajax({
									url: 'index.php?'+ query[1],
									type: 'get',
									dataType: 'html',
									success: function( data ) {
										var order_data = $( data ).find('#order-row' + order_id);
										refreshOrderData(order_data, order_id);
									}
								});
							} else { filter(false, true); }
						}
					},
					error: function(xhr, ajaxOptions, thrownError) {
						console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
				return false;
			}
		});
	<?php } ?>

	// Change TIME shipping
	<?php if ($edit_time_shipping) { ?>
		$(document).delegate('.button-time-shipping-change', 'click', function() {
			var order_id = $(this).attr('data-order-id');
			var datetime_start = $('input[id=\'time-shipping-start-change' + order_id + '\']').val();
			var datetime_end = $('input[id=\'time-shipping-end-change' + order_id + '\']').val();
			if (!/^(([0,1][0-9])|(2[0-3])):[0-5][0-9]$/.test (datetime_start) || !/^(([0,1][0-9])|(2[0-3])):[0-5][0-9]$/.test (datetime_end)) {alert('<?php echo $error_time_format; ?>'); return;}

			if (confirm("<?php echo $text_change_time_confirm; ?>" + datetime_start + ' - ' + datetime_end + '?<?php echo $text_change_date_confirm_info; ?>')) {
				$.ajax({
					url: 'index.php?route=sale/omanager/changeDateTimeShipping&<?php echo $strtoken; ?>',
					type: 'post',
					dataType: 'json',
					data: '&order_id=' + order_id + '&datetime_start=' + datetime_start + '&datetime_end=' + datetime_end,
					beforeSend: function() {
						$('#button-time-shipping-change' + order_id).button('loading');
					},
					complete: function() {
						$('#button-time-shipping-change' + order_id).button('reset');
					},
					success: function(json) {
						$('.alert, .alert-order').remove();

						if (json['error']) {
							$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
						}

						if (json['success']) {
							$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
							var query = String(document.location).split('?');
							if (query[1]) {
								$.ajax({
									url: 'index.php?'+ query[1],
									type: 'get',
									dataType: 'html',
									success: function( data ) {
										var order_data = $( data ).find('#order-row' + order_id);
										refreshOrderData(order_data, order_id);
									}
								});
							} else { filter(false, true); }
						}
					},
					error: function(xhr, ajaxOptions, thrownError) {
						console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
				return false;
			}
		});
	<?php } ?>

//--></script>
<?php } ?>

<script type="text/javascript"><!--
// add API
$(document).delegate('#button-ip-add', 'click', function() {
	$.ajax({
		url: 'index.php?route=user/api/addip&<?php echo $strtoken; ?>&api_id=<?php echo $api_id; ?>',
		type: 'post',
		data: 'ip=<?php echo $api_ip; ?>',
		dataType: 'json',
		beforeSend: function() {
			$('#button-ip-add').button('loading');
		},
		complete: function() {
			$('#button-ip-add').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}

			if (json['success']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

var token = '';

// Login to the API
$.ajax({
	url: '<?php echo $catalog; ?>index.php?route=api/login',
	type: 'post',
	dataType: 'json',
	data: 'key=<?php echo $api_key; ?>',
	crossDomain: true,
	success: function(json) {
		if (json['error']) {
			$('.alert').remove();

			if (json['error']['key']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['key'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}

			if (json['error']['ip']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['ip'] + ' <button type="button" id="button-ip-add" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-danger btn-xs pull-right"><i class="fa fa-plus"></i> <?php echo $button_ip_add; ?></button></div>');
			}
		}

		if (json['token']) {
			token = json['token'];
		}
	},
	error: function(xhr, ajaxOptions, thrownError) {
		alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	}
});

<?php if ($change_statuses_btn) { ?>
$(document).delegate('#select-input-order-status', 'change', function() {
	var order_status_id = $(this).val();
	var apply_templates = $('input[name=\'apply_status_templates\']:checked');
	if (apply_templates.length) {
		$.ajax({
			url: 'index.php?route=sale/omanager/getStatusTemplate&<?php echo $strtoken; ?>&order_status_id=' + order_status_id,
			dataType: 'json',
			beforeSend: function() {
				$('textarea[name=\'selected_comment\']').val('<?php echo $text_loading; ?>');
			},
			success: function(json) {
				if (json['template']) {
					$('textarea[name=\'selected_comment\']').val(json['template']);
				} else {
					$('textarea[name=\'selected_comment\']').val('');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
		return false;
	}
});

$('#apply-change-statuses').on('click', function() {
	updateOrderStatus();
});

function updateOrderStatus(){
	var data = {};

	data.order_status_id = $('select[name=\'selected_order_status_id\']').val();
	if (data.order_status_id == '*') return;

	data.notify = $('input[name=\'select_notify\']').prop('checked') ? 1 : 0;
	data.override = 1;
	data.comment = encodeURIComponent($('textarea[name=\'selected_comment\']').val());

	var selected = $('input[name^=\'selected\']:checked');
	data.selected =[];
	selected.each(function(){
		data.selected.push($(this).val());
	});

	$.ajax({
		url: '<?php echo $catalog; ?>index.php?route=api/omanager/change_statuses&token=' + token,
		type: 'post',
		dataType: 'json',
		crossDomain: true,
		data: data,
		beforeSend: function() {
			$('#apply-change-statuses').button('loading');
		},
		complete: function() {
			$('#apply-change-statuses').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
			if (json['success']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				filter(false, true);
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
	return false;
}
<?php } ?>

<?php if ($setting_status && $status_history_column) { ?>
	<?php if ($invoice_history) { ?>
	//	create invoice
	$(document).delegate('.create-invoice', 'click', function() {
		var order_id = $(this).attr('data-order-id');
		$.ajax({
			url: 'index.php?route=sale/order/createinvoiceno&<?php echo $strtoken; ?>&order_id=' + order_id,
			dataType: 'json',
			beforeSend: function() {
				$('#button-invoice' + order_id).button('loading');
			},
			complete: function() {
				$('#button-invoice' + order_id).button('reset');
			},
			success: function(json) {
				$('.alert').remove();

				if (json['error']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}

				if (json['invoice_no']) {
					$('#invoice'+ order_id).html(json['invoice_no']);

					$('#button-invoice' + order_id).replaceWith('<button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-cog"></i></button>');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
		return false;
	});
	<?php } ?>

	// Track number
	<?php if ($track_no_history) { ?>
		$(document).delegate('.button-track_no-add', 'click', function() {
			var order_id = $(this).attr('data-order-id');
			var track_no = $('input[name=\'order_track_no' + order_id + '\']').val();
			if (!track_no) {
				$('input[name=\'order_track_no' + order_id + '\']').attr('placeholder', '<?php echo $error_track_no; ?>').focus();
				return false;
			}
			<?php if ($module_track_no_status) { ?>
				var url = '<?php echo $catalog; ?>index.php?route=api/track_no/save&token=' + token + '&order_id=' + order_id;
			<?php } else { ?>
				var url = 'index.php?route=sale/omanager/saveTrackNo&<?php echo $strtoken; ?>&order_id=' + order_id;
			<?php } ?>
			$.ajax({
				url: url,
				type: 'post',
				dataType: 'json',
				data: 'track_no=' + encodeURIComponent(track_no),
				beforeSend: function() {
					$('.track_no_alert').remove();
					$('#button-track_no-add' + order_id).attr('disabled', 'disabled');
					$('#button-track_no-add' + order_id).button('loading');
				},
				complete: function() {
					$('#button-track_no-add' + order_id).button('reset');
					$('#button-track_no-add' + order_id).attr('disabled', 'disabled');
				},
				success: function(json) {
					$('.alert').remove();
					if (json['error']) {
						$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					}
					if (json['success']) {
						<?php if ($module_track_no_notify) { ?>
							json['success'] += '<?php echo $text_customer_notified; ?>';
						<?php } ?>
						$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					}
				},
			});
			return false;
		});
	<?php } ?>

	<?php if ($reward_history) { ?>
	// reward-add
	$(document).delegate('.reward-add', 'click', function() {
		var order_id = $(this).attr('data-order-id');
		$.ajax({
			url: 'index.php?route=sale/order/addreward&<?php echo $strtoken; ?>&order_id=' + order_id,
			type: 'post',
			dataType: 'json',
			beforeSend: function() {
				$('#button-reward-add' + order_id).button('loading');
			},
			complete: function() {
				$('#button-reward-add' + order_id).button('reset');
			},
			success: function(json) {
				$('.alert').remove();

				if (json['error']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}

				if (json['success']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					$('#button-reward-add' + order_id).replaceWith('<button id="button-reward-remove' + order_id + '" data-loading-text="..." data-order-id="' + order_id + '" data-toggle="tooltip" title="<?php echo $button_reward_remove; ?>" class="btn btn-danger btn-xs reward-remove"><i class="fa fa-minus-circle"></i></button>');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
		return false;
	});

	// reward-remove
	$(document).delegate('.reward-remove', 'click', function() {
		var order_id = $(this).attr('data-order-id');
		$.ajax({
			url: 'index.php?route=sale/order/removereward&<?php echo $strtoken; ?>&order_id=' + order_id,
			type: 'post',
			dataType: 'json',
			beforeSend: function() {
				$('#button-reward-remove' + order_id).button('loading');
			},
			complete: function() {
				$('#button-reward-remove' + order_id).button('reset');
			},
			success: function(json) {
				$('.alert').remove();

				if (json['error']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}

				if (json['success']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					$('#button-reward-remove' + order_id).replaceWith('<button id="button-reward-add' + order_id + '" data-loading-text="..." data-order-id="' + order_id + '" data-toggle="tooltip" title="<?php echo $button_reward_add; ?>" class="btn btn-success btn-xs reward-add"><i class="fa fa-plus-circle"></i></button>');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
		return false;
	});
	<?php } ?>

	<?php if ($affiliate_history) { ?>
	// 	commission-add
	$(document).delegate('.commission-add', 'click', function() {
		var order_id = $(this).attr('data-order-id');
		$.ajax({
			url: 'index.php?route=sale/order/addcommission&<?php echo $strtoken; ?>&order_id=' + order_id,
			type: 'post',
			dataType: 'json',
			beforeSend: function() {
				$('#button-commission-add' + order_id).button('loading');
			},
			complete: function() {
				$('#button-commission-add' + order_id).button('reset');
			},
			success: function(json) {
				$('.alert').remove();

				if (json['error']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}

				if (json['success']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					$('#button-commission-add' + order_id).replaceWith('<button id="button-commission-remove' + order_id + '" data-loading-text="..." data-order-id="' + order_id + '" data-toggle="tooltip" title="<?php echo $button_commission_remove; ?>" class="btn btn-danger btn-xs commission-remove"><i class="fa fa-minus-circle"></i></button>');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
		return false;
	});
	//	commission-remove
	$(document).delegate('.commission-remove', 'click', function() {
		var order_id = $(this).attr('data-order-id');
		$.ajax({
			url: 'index.php?route=sale/order/removecommission&<?php echo $strtoken; ?>&order_id=' + order_id,
			type: 'post',
			dataType: 'json',
			beforeSend: function() {
				$('#button-commission-remove' + order_id).button('loading');
			},
			complete: function() {
				$('#button-commission-remove' + order_id).button('reset');
			},
			success: function(json) {
				$('.alert').remove();

				if (json['error']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}

				if (json['success']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					$('#button-commission-remove' + order_id).replaceWith('<button id="button-commission-add' + order_id + '" data-loading-text="..." data-order-id="' + order_id + '" data-toggle="tooltip" title="<?php echo $button_commission_add; ?>" class="btn btn-success btn-xs commission-add"><i class="fa fa-plus-circle"></i></button>');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
		return false;
	});
	<?php } ?>

	// Add history
	$(document).delegate('.button-history', 'click', function() {
		var store_id = $(this).attr('data-store-id');
		var order_id = $(this).attr('data-order-id');
		var order_status_id = $('select[name=\'order_status_id' + order_id + '\']').val();
		var notify = $('input[name=\'notify' + order_id + '\']').prop('checked') ? 1 : 0;
		var comment = encodeURIComponent($('textarea[name=\'comment' + order_id + '\']').val());

		$.ajax({
			url: '<?php echo $catalog; ?>index.php?route=api/omanager/history&token=' + token + '&store_id=' + store_id + '&order_id=' + order_id,
			type: 'post',
			dataType: 'json',
			data: 'order_status_id=' + order_status_id + '&notify=' + notify + '&override=1' + '&comment=' + comment,
			beforeSend: function() {
				$('#button-history' + order_id).button('loading');
			},
			complete: function() {
				$('#button-history' + order_id).button('reset');
			},
			success: function(json) {
				$('.alert, .alert-order').remove();

				if (json['error']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}

				if (json['success']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					var query = String(document.location).split('?');
					if (query[1]) {
						$.ajax({
							url: 'index.php?'+ query[1],
							type: 'get',
							dataType: 'html',
							success: function( data ) {
								var order_data = $( data ).find('#order-row' + order_id);
								refreshOrderData(order_data, order_id);
							}
						});
					} else { filter(false, true); }
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
		return false;
	});
<?php } ?>
//--></script>

<script type="text/javascript"><!--
// Filter
function clearFilter(id) {
	if ($('#'+id).val() == '') {
		return;
	}
	$('#'+id).val('').trigger('change'); return false;
}

$(function(){
	$("#input-shipping-time-start, #input-shipping-time-end").mask("99:99");

	$('.input-time-shipping-start-change').each(function(){
		var order_id = $(this).attr('data-order-id');
		$('#time-shipping-start-change' + order_id).mask("99:99");
	});

	$('.input-time-shipping-end-change').each(function(){
		var order_id = $(this).attr('data-order-id');
		$('#time-shipping-end-change' + order_id).mask("99:99");
	});
});

function filter(del = false, success = false) {
	if (del == false) {
		url = 'index.php?route=sale/omanager&<?php echo $strtoken; ?>';
	} else {
		url = '';
	}

	if (success == true) {
		url += '&success=true';
	}

	var filter_order_id = $('input[name=\'filter_order_id\']').val();

	if (filter_order_id) {
		url += '&filter_order_id=' + encodeURIComponent(filter_order_id);
	}

	var filter_store_id = $('select[name=\'filter_store_id\']').val();

	if (filter_store_id && filter_store_id != '*') {
		url += '&filter_store_id=' + encodeURIComponent(filter_store_id);
	}

	var filter_product = $('input[name=\'filter_product\']').val();

	if (filter_product) {
		url += '&filter_product=' + encodeURIComponent(filter_product);
	}

	var filter_customer_group = $('select[name=\'filter_customer_group\']').val();

	if (filter_customer_group && filter_customer_group != '*') {
		url += '&filter_customer_group=' + encodeURIComponent(filter_customer_group);
	}

	var filter_customer = $('input[name=\'filter_customer\']').val();

	if (filter_customer) {
		url += '&filter_customer=' + encodeURIComponent(filter_customer);
	}

	var filter_recipient = $('input[name=\'filter_recipient\']').val();

	if (filter_recipient) {
		url += '&filter_recipient=' + encodeURIComponent(filter_recipient);
	}

	var filter_order_status = $('select[name=\'filter_order_status\']').val();

	if (filter_order_status && filter_order_status != '*') {
		url += '&filter_order_status=' + encodeURIComponent(filter_order_status);
	}

	var filter_payment_method = $('select[name=\'filter_payment_method\']').val();

	if (filter_payment_method && filter_payment_method != '*') {
		url += '&filter_payment_method=' + encodeURIComponent(filter_payment_method);
	}

	var filter_shipping_method = $('select[name=\'filter_shipping_method\']').val();

	if (filter_shipping_method && filter_shipping_method != '*') {
		url += '&filter_shipping_method=' + encodeURIComponent(filter_shipping_method);
	}

	var filter_subtotal_start = $('input[name=\'filter_subtotal_start\']').val();

	if (filter_subtotal_start) {
		url += '&filter_subtotal_start=' + encodeURIComponent(filter_subtotal_start);
	}

	var filter_subtotal_end = $('input[name=\'filter_subtotal_end\']').val();

	if (filter_subtotal_end) {
		url += '&filter_subtotal_end=' + encodeURIComponent(filter_subtotal_end);
	}

	var filter_total_start = $('input[name=\'filter_total_start\']').val();

	if (filter_total_start) {
		url += '&filter_total_start=' + encodeURIComponent(filter_total_start);
	}

	var filter_total_end = $('input[name=\'filter_total_end\']').val();

	if (filter_total_end) {
		url += '&filter_total_end=' + encodeURIComponent(filter_total_end);
	}

	var filter_date_shipping_start = $('input[name=\'filter_date_shipping_start\']').val();

	if (filter_date_shipping_start) {
		url += '&filter_date_shipping_start=' + encodeURIComponent(filter_date_shipping_start);
	}

	var filter_date_shipping_end = $('input[name=\'filter_date_shipping_end\']').val();

	if (filter_date_shipping_end) {
		url += '&filter_date_shipping_end=' + encodeURIComponent(filter_date_shipping_end);
	}

	var filter_shipping_time_start = $('input[name=\'filter_shipping_time_start\']').val();

	if (filter_shipping_time_start) {
		url += '&filter_shipping_time_start=' + encodeURIComponent(filter_shipping_time_start);
	}

	var filter_shipping_time_end = $('input[name=\'filter_shipping_time_end\']').val();

	if (filter_shipping_time_end) {
		url += '&filter_shipping_time_end=' + encodeURIComponent(filter_shipping_time_end);
	}

	var filter_date_added = $('input[name=\'filter_date_added\']').val();

	if (filter_date_added) {
		url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
	}

	var filter_date_modified = $('input[name=\'filter_date_modified\']').val();

	if (filter_date_modified) {
		url += '&filter_date_modified=' + encodeURIComponent(filter_date_modified);
	}

	var setgid = $('select[name=\'setgid\']').val();

	if (!setgid) {
		var setgid = $('input[name=\'setgid\']').val();
	}

	if (setgid) {
		url += '&setgid=' + encodeURIComponent(setgid);
	}

	var limit = $('select[name=\'order_limit\']').val();

	if (limit) {
		url += '&limit=' + encodeURIComponent(limit);
	}

	if (del == false) {
		location = url;
	} else {
		return url;
	}
}

function dumpFilter(reload) {
	$('.well-filter-top input[class*=\'form-control\'], .filter input[class*=\'form-control\']').val('');
	$('.well-filter-top select[class=\'form-control\'], .filter select[class=\'form-control\']').val('*');
	if (reload) { filter(); }
}

$('#button-filter').on('click', function() {
	filter();
});

$('select[name=\'setgid\'], input[name=\'setgid\'], select[name=\'order_limit\'], select[name=\'filter_customer_group\'], select[name=\'filter_order_status\'], select[name=\'filter_payment_method\'], select[name=\'filter_shipping_method\'], input[name=\'filter_order_id\'], select[name=\'filter_store_id\'], input[name=\'filter_product\'], input[name=\'filter_customer\'], input[name=\'filter_recipient\'], input[name=\'filter_subtotal_start\'], input[name=\'filter_subtotal_end\'], input[name=\'filter_total_start\'], input[name=\'filter_total_end\'], input[name=\'filter_date_shipping_start\'], input[name=\'filter_date_shipping_end\'], input[name=\'filter_shipping_time_start\'], input[name=\'filter_shipping_time_end\'], input[name=\'filter_date_added\'], input[name=\'filter_date_modified\']').bind('change', function() {
	reload = $(this).attr("data-reload");
	if (reload) { filter(); }
});

$('.date').datetimepicker({
	pickTime: false,
	format: 'DD.MM.YYYY',
	useCurrent: false,
//	locale: 'ru'
});

$('.time').datetimepicker({
	pickDate: false,
	format: 'HH:mm',
	useCurrent: false,
	minuteStepping: 10
});

$('input[name=\'filter_customer\'], input[name=\'filter_recipient\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=customer/customer/autocomplete&<?php echo $strtoken; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['customer_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$(this).val(item['label']);
		$(this).trigger('change');
	}
});

$('input[name=\'filter_product\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&<?php echo $strtoken; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$(this).val(item['label']);
		$(this).trigger('change');
	}
});
//--></script>

<script type="text/javascript"><!--
$(document).ready(function(){
    setTimeout(function() {
        $('#omanager-row .alert-success').hide('slow');
		$('#omanager-row .alert-danger').hide('slow');
    }, 10000);
});
//--></script>

<?php if ($show_map) { ?>
<script type="text/javascript"><!--
// MAP
	var map_orders = '<?php echo $map_orders; ?>';
	var myMap = null;
	var shop_on_map = false;
	ymaps.ready(init);

	<?php if (isset($settings['shop_on_map']) && $settings['shop_on_map']) { ?>
		var shop_on_map = true;
	<?php } ?>

	function init () {
		$('#orders-map').show();
		myMap = new ymaps.Map('orders-map', {
			center: [<?php echo $shop_coords[0]; ?>, <?php echo $shop_coords[1]; ?>],
			zoom: 10,
			controls: ['geolocationControl', 'zoomControl', 'searchControl', 'typeSelector', 'fullscreenControl']
		}, {
			searchControlProvider: 'yandex#search',
			geolocationControlSize: 'small',
			searchControlSize: 'small',
			typeSelectorSize: 'small',
		}),

		myMap.behaviors.disable('scrollZoom');

		if (shop_on_map) {
			shopPlacemark = new ymaps.Placemark([<?php echo $shop_coords[0]; ?>, <?php echo $shop_coords[1]; ?>], {
				balloonContentBody: '<?php echo $shop_ballooncontent; ?>',
				hintContent: '<?php echo $shop_name; ?>'
			}, {
				preset: 'islands#blueShoppingIcon',
				iconColor: 'brown'
			});
			myMap.geoObjects.add(shopPlacemark);
		}

		objectManager = new ymaps.ObjectManager({
			geoObjectOpenBalloonOnClick: false,
			clusterize: true,
			clusterIconLayout: 'default#pieChart',
			gridSize: 64
		});

		myMap.geoObjects.add(objectManager);
		objectManager.add(map_orders);

		function loadBalloonData(objectId) {
			var dataDeferred = ymaps.vow.defer();
			function resolveData() {
				$.ajax({
					url: 'index.php?route=sale/omanager/getMapBalloonData&<?php echo $strtoken; ?>&order_id='+objectId,
					data: 'format=' + encodeURIComponent('<?php echo $map_address_format; ?>'),
					type: "post",
					dataType: "json",
				}).done(function(data) {
					dataDeferred.resolve(data);
				});
			}
			window.setTimeout(resolveData, 100);
			return dataDeferred.promise();
		}

		function hasBalloonData(objectId) {
			return objectManager.objects.getById(objectId).properties.balloonContent;
		}

		objectManager.objects.events.add('click', function(e) {
			var objectId = e.get('objectId');
			if (hasBalloonData(objectId)) {
				objectManager.objects.balloon.open(objectId);
			} else {
				loadBalloonData(objectId).then(function(data) {
					var obj = objectManager.objects.getById(objectId);
					obj.properties.balloonContent = data;
					objectManager.objects.balloon.open(objectId);
				});
			}
		});

		objectManager.clusters.events.add('balloonopen', function(e) {
			var clasterId = e.get('objectId');
			var mcluster = objectManager.clusters.getById(e.get('objectId'));
			var cobjects = mcluster.properties.geoObjects;
			function setwait() {
				objectManager.clusters.state.set('activeObject', cobjects[1]);
				if (objectManager.clusters.balloon.isOpen(clasterId)) {
					setTimeout(function() {
						objectManager.clusters.state.set('activeObject', cobjects[0]);
					}, 100);
				}
			}
			$(cobjects).each(function(key, value) {
				var object_id = value.id;
				if (!value.properties.balloonContent) {
					loadBalloonData(object_id).then(function(data) {
						var cobject = cobjects[key];
						cobject.properties.balloonContent = data;
					});
					if (key == 0) {
						setwait();
					}
				}
			});
		});

		function onObjectEvent (e) {
			var objectId = e.get('objectId');
			if (e.get('type') == 'mouseenter') {
				objectManager.objects.setObjectOptions(objectId, {
					cursor: 'help'
				});
			} else {
				objectManager.objects.setObjectOptions(objectId, {
					preset: 'islands#dotIcon'
				});
			}
		}

		function onClusterEvent (e) {
			var objectId = e.get('objectId');
			if (e.get('type') == 'mouseenter') {
				objectManager.clusters.setClusterOptions(objectId, {
					iconPieChartCoreRadius: 15,
					iconPieChartStrokeStyle: 'silver',
					iconPieChartCoreFillStyle: 'silver',
				});
			} else {
				objectManager.clusters.setClusterOptions(objectId, {
					iconPieChartCoreRadius: 12,
					iconPieChartStrokeStyle: 'white',
					iconPieChartCoreFillStyle: 'white',
				});
			}
		}

		objectManager.objects.events.add(['mouseenter', 'mouseleave'], onObjectEvent);
		objectManager.clusters.events.add(['mouseenter', 'mouseleave'], onClusterEvent);

		if (objectManager.objects.getLength() < 1) {
			myMap.hint.open(myMap.getCenter(), '<div style="color: #fff; font-weight: bold; padding: 10px 10px; border: 1px solid #ddd; border-radius: 3px; background-color: #FF4500;"><?php echo $error_map_empty_order_list; ?></div>', {
				openTimeout: 1500
			});
		}

		if (objectManager.objects.getLength() <= 1 && shop_on_map) {
			myMap.setBounds(myMap.geoObjects.getBounds(), {
				checkZoomRange: true
			});
		} else if (objectManager.objects.getLength() > 1) {
			myMap.setBounds(myMap.geoObjects.getBounds());
		}
		myMap.setZoom(myMap.getZoom() - 1);
	}
//--></script>
<?php } ?>

<?php if ($orderpro27_status) { ?>
<!-- for OrderPro -->
<div id="merge_block"></div>
<style>
#merge_form .alert {text-align:center;font-size:13px;}
</style>
<script type="text/javascript">
$(document).delegate('#old_order', 'change', function() {
	if ($(this).val() == 1) {
		$('#merge_form .old-status').slideDown('slow');
	} else {
		$('#merge_form .old-status').slideUp('slow');
	}
});

function getmerge() {
	$('#merge_modal').remove();
    $.ajax({
        url: 'index.php?route=sale/orderpro/getMerge&<?php echo $strtoken; ?>',
        type: 'post',
        dataType: 'json',
        data: $('#form-order :checked'),
		beforeSend: function() {
			$('.alert').remove();
			$('#button-merge').children('.fa').addClass('fa-cog fa-spin');
		},
        success: function(json) {
			if (json['error']) {
				$('#button-merge').children('.fa').removeClass('fa-cog fa-spin');
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
			if (json['html']) {
				$('#merge_block').html(json['html']);
				setTimeout (function() {
					$('#merge_modal').modal('show');
					$('#button-merge').children('.fa').removeClass('fa-cog fa-spin');
				}, 800);
			}
        },
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
}

function merge_order() {
    $.ajax({
        url: 'index.php?route=sale/orderpro/MergeOrder&<?php echo $strtoken; ?>',
        type: 'post',
        dataType: 'json',
        data: $('#merge_form :input'),
		beforeSend: function() {
			$('#merge_modal .btn-success').remove();
		},
        success: function(json) {
			if (json['error']) {
				$('#merge_form').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' </div>');
			}
			if (json['success']) {
				$('#merge_form').prepend('<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + ' </div>');
			}
        },
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
}
</script>
<!-- // for OrderPro -->
<?php } ?>

<?php if ($novaposhta33x_status) { ?>
<!-- Shipping Data -->
<!-- START Modal assignment CN to order -->
<div class="modal fade" id="assignment-cn-to-order" tabindex="-1" role="dialog" aria-labelledby="assignment-cn-to-order-label">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="assignment-cn-to-order-label"><?php echo $heading_cn; ?></h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<input type="hidden" name="cn_order_id" value="" id="cn_order_id" />
					<input type="hidden" name="cn_shipping_method" value="" id="cn_shipping_method" />
					<label class="col-sm-2 control-label" for="cn_number"><?php echo $entry_cn_number; ?></label>
					<div class="col-sm-10">
						<input type="text" name="cn_number" value="" placeholder="<?php echo $entry_cn_number; ?>" id="cn_number" class="form-control" />
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="assignmentCN();"><i class="fa fa-check"></i></button>
				<button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i></button>
			</div>
		</div>
	</div>
</div>
<!-- END Modal assignment CN to order -->

<script type="text/javascript"><!--

function deleteCN(self, shipping_method) {
	var post_data = 'order_id=' + $(self).parents('tr').find('input[name^="selected"]').val();

	$.ajax( {
		url: 'index.php?route=extension/shipping/' + shipping_method + '/deleteCNFromOrder&<?php echo $strtoken; ?>',
		type: 'POST',
		data: post_data,
		dataType: 'json',
		beforeSend: function () {
			$('body').fadeTo('fast', 0.7).prepend('<div id="ocmax-loader" style="position: fixed; top: 50%;	left: 50%; z-index: 9999;"><i class="fa fa-spinner fa-spin fa-3x fa-fw"></i></div>');
		},
		complete: function () {
			var $alerts = $('.alert-danger, .alert-success');

			if ($alerts.length !== 0) {
				setTimeout(function() { $alerts.fadeOut() }, 5000);
			}

			$('body').fadeTo('fast', 1)
			$('#ocmax-loader').remove();
		},
		success: function(json) {
			if(json['error']) {
				$('.container-fluid:eq(1)').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}

			if (json['success']) {
				$('.container-fluid:eq(1)').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				setTimeout(function() {
						location.reload();
					},
					2000
				);
			}

			$('html, body').animate({ scrollTop: 0 }, 'slow');
		},
		error: function (jqXHR, textStatus, errorThrown) {
			console.log(textStatus);
		}
	} );
}

function assignmentCN(self, shipping_method) {
	if (typeof(self) !== 'undefined') {
		$('#cn_order_id').val($(self).parents('tr').find('input[name^="selected"]').val());
	}

	if (shipping_method) {
		$('#cn_shipping_method').val(shipping_method);
	}

	if ($('#assignment-cn-to-order').is(':hidden')) {
		$('#assignment-cn-to-order').modal('show');
	} else {
		var post_data = 'order_id=' + $('#cn_order_id').val() + '&cn_number=' + $('#cn_number').val();

		$.ajax( {
			url: 'index.php?route=extension/shipping/' + $('#cn_shipping_method').val() + '/addCNToOrder&<?php echo $strtoken; ?>',
			type: 'POST',
			data: post_data,
			dataType: 'json',
			beforeSend: function () {
				$('body').fadeTo('fast', 0.7).prepend('<div id="ocmax-loader" style="position: fixed; top: 50%;	left: 50%; z-index: 9999;"><i class="fa fa-spinner fa-spin fa-3x fa-fw"></i></div>');
			},
			complete: function () {
				var $alerts = $('.alert-danger, .alert-success');

				if ($alerts.length !== 0) {
					setTimeout(function() { $alerts.fadeOut() }, 5000);
				}

				$('body').fadeTo('fast', 1)
				$('#ocmax-loader').remove();
			},
			success: function(json) {
				if(json['error']) {
					$('.container-fluid:eq(1)').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}

				if (json['success']) {
					$('.container-fluid:eq(1)').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					setTimeout(function() {
							location.reload();
						},
						2000
					);
				}

				$('html, body').animate({ scrollTop: 0 }, 'slow');
			},
			error: function (jqXHR, textStatus, errorThrown) {
				console.log(textStatus);
			}
		} );

		$('#assignment-cn-to-order').modal('hide');
	}
}

$(function() {
	var post_data = $('input[name^="selected"]');

	$.ajax( {
		url: 'index.php?route=sale/order/getShippingData&<?php echo $strtoken; ?>',
		type: 'POST',
		data: post_data,
		dataType: 'json',
		success: function(json) {
			if(json['error']) {
				$('.container-fluid:eq(1)').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}

			if (json instanceof Object) {
				if (json['shipping_methods']) {
					var btn_l = '<div class="btn-group" style="margin-left: 2px;"><button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-list-ul"></i> <span class="caret"></span></button><ul class="dropdown-menu dropdown-menu-right">';

					for (var i in json['shipping_methods']) {
						btn_l += '<li class="dropdown-header">' + json['shipping_methods'][i]['heading'] + '</li>';
						btn_l += '<li role="separator" class="divider"></li>';

						if (json['shipping_methods'][i]['cn_list']) {
							btn_l += '<li><a href="' + json['shipping_methods'][i]['cn_list']['href'] + '">' + json['shipping_methods'][i]['cn_list']['text'] + '</a></li>';
						}
					}

					btn_l += '</ul></div> ';

					if ($('select[name=\'order_limit\']').length) {
						$('select[name=\'order_limit\']').parent().after(btn_l);
					} else {
						$('.heading-right').prepend(btn_l);
					}

				}

				for (var i in json['orders']) {
					var
						f = false,
						btn_o = '<div class="btn-group"><button type="button" id="button-cn-' + i + '" class="btn btn-default dropdown-toggle action-button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-file-text-o" aria-hidden="true"></i> <span class="caret"></span></button><ul class="dropdown-menu dropdown-menu-right">';

					btn_o += '<li class="dropdown-header">' + json['heading_cn'] + '</li>';
					btn_o += '<li role="separator" class="divider"></li>';

					for (var ii in json['orders'][i]) {
						btn_o += '<li class="dropdown-header">' + json['shipping_methods'][ii]['heading'] + '</li>';

						if (json['orders'][i][ii]['create']) {
							btn_o += '<li><a href="' + json['orders'][i][ii]['create']['href'] + '">' + json['orders'][i][ii]['create']['text'] + '</a></li>';
						}

						if (json['orders'][i][ii]['edit']) {
							f = true;
							btn_o += '<li><a href="' + json['orders'][i][ii]['edit']['href'] + '">' + json['orders'][i][ii]['edit']['text'] + '</a></li>';
						}

						if (json['orders'][i][ii]['delete']) {
							f = true;
							btn_o += '<li><a style="cursor: pointer;" onclick="deleteCN(this, \'' + ii + '\');">' + json['orders'][i][ii]['delete']['text'] + '</a></li>';
						}

						if (json['orders'][i][ii]['assignment']) {
							btn_o += '<li><a style="cursor: pointer;" onclick="assignmentCN(this, \'' + ii + '\');">' + json['orders'][i][ii]['assignment']['text'] + '</a></li>';
						}

						btn_o += '<li role="separator" class="divider"></li>';
					}

					btn_o += '</ul></div> ';

					$('input[value="' + i + '"]').parents('tr').find('td:last').prepend(btn_o);

					if (f) {
						$('input[value="' + i + '"]').parents('tr').find('[id^="button-cn"]').toggleClass('btn-default btn-info');
					}
				}
			}
		},
		error: function (jqXHR, textStatus, errorThrown) {
			console.log(textStatus);
		}
	} );
} );
//--></script>
<!-- Shipping Data -->
<?php } ?>

<?php echo $footer; ?>
<?php echo $header; ?><?php echo $column_left; ?>
<!--
@author	Konstantin Kornelyuk
@link https://opencartforum.com/user/28448-brest001/?tab=idm
-->
<div id="content">
<script type="text/javascript" src="view/javascript/omanager/jscolor.js"></script>
<link rel="stylesheet" type="text/css" href="view/stylesheet/omanager.css" />
<script type="text/javascript" src="view/javascript/omanager/jquery.magnific-popup.min.js"></script>
<link rel="stylesheet" type="text/css" href="view/javascript/omanager/magnific-popup.css" />
<?php if ($ocversion >= 230) { ?>
<link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
<?php } ?>
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right" id="control-buttons">
		<a onclick="$('#form-quick-editor').attr('action', location + '&apply=true'); $('#form-quick-editor').submit();"  class="btn btn-success" data-toggle="tooltip" data-placement="bottom" title="<?php echo $button_apply; ?>"><i class="fa fa-check"></i></a>
        <button type="submit" form="form-quick-editor" data-toggle="tooltip" data-placement="bottom" title="<?php echo $button_save_exit; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $order_list; ?>" data-toggle="tooltip" data-placement="bottom" title="<?php echo $button_list; ?>" class="btn btn-default"><i class="fa fa-list"></i></a>
		<a href="<?php echo $user_edit; ?>" class="btn btn-default" data-toggle="tooltip" title="<?php echo $user_info['user_group'] .': ' . $user_info['firstname'] .' '. $user_info['lastname']; ?>"><i class="fa fa-user"></i></a>
	  </div>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>

  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
	<?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>

    <div class="panel panel-default alert-helper">
	  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-quick-editor" class="form-horizontal">
      <div class="panel-body">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#tab_setting_groups" data-toggle="tab"><?php echo $text_tab_setting_groups; ?></a></li>
			<li><a href="#tab_edit_setting_groups" data-toggle="tab"><?php echo $text_tab_edit_setting_groups; ?></a></li>
			<li><a href="#tab_edit_colors" data-toggle="tab"><?php echo $text_tab_edit_colors; ?></a></li>
			<li><a href="#tab_comment_status_template" role="tab" data-toggle="tab"><?php echo $text_tab_comment_status_template; ?></a></li>
			<li><a href="#tab_compatibility" data-toggle="tab"><?php echo $text_tab_compatibility; ?></a></li>
			<li><a href="#tab_backup" data-toggle="tab"><?php echo $text_tab_backup; ?></a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="tab_setting_groups">
			  <?php if (!empty($settings['setting_groups'])) { ?>
				<div class="col-sm-12" style="padding-left: 0; padding-right: 0;">
				  <div class="setting-group-name"><i class="fa fa-list-alt"></i>&nbsp;&nbsp;&nbsp;<?php echo $text_setting_groups; ?></div>
				  <ul class="nav nav-tabs" id="setting-groups">
				  <?php foreach ($settings['setting_groups'] as $group) { ?>
					<li><a href="#form-setting-group<?php echo $group['id']; ?>" data-toggle="tab"><?php echo $group['title']; ?></a></li>
				  <?php } ?>
				  </ul>
				</div>
				<div class="col-sm-12" style="padding-right: 0;">
				  <div class="tab-help alert alert-success"><i class="fa fa-info"></i>&nbsp;&nbsp;&nbsp;<?php echo $text_tab_setting_groups_help; ?>
					<button type="button" class="close" data-dismiss="alert">&times;</button>
				  </div>
				  <div class="tab-content">
					<?php foreach ($settings['setting_groups'] as $group) { ?>
					
					  <?php $setgid = $group['id']; ?>
					  
					  <div class="tab-pane" id="form-setting-group<?php echo $setgid; ?>">
						<ul class="nav nav-tabs" role="tablist">
							<li class="active"><a href="#tab_general<?php echo $setgid; ?>" role="tab" data-toggle="tab"><?php echo $text_tab_general; ?></a></li>
							<li><a href="#tab_select_orders<?php echo $setgid; ?>" role="tab" data-toggle="tab"><?php echo $text_tab_select_orders; ?></a></li>
							<li><a href="#tab_elements<?php echo $setgid; ?>" role="tab" data-toggle="tab"><?php echo $text_tab_elements; ?></a></li>
							<li><a href="#tab_adding_data<?php echo $setgid; ?>" role="tab" data-toggle="tab"><?php echo $text_tab_customer_fields; ?></a></li>
						</ul>

						<div class="tab-content">
							<!-- General Settings -->
							<div class="tab-pane active" id="tab_general<?php echo $setgid; ?>">
							  <!-- status -->
							  <div class="form-group">
								<label class="col-sm-2 control-label" for="input-status"><?php echo $text_status; ?></label>
								<div class="col-sm-10">
									<select name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][status]" id="input-status" class="form-control">
										<?php if (isset($settings[$setgid]['status']) && $settings[$setgid]['status']) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
										<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
										<?php } ?>
									</select>
								</div>
							  </div>

							  <!-- list -->
							  <div class="form-group">
								<label class="col-sm-2 control-label"><?php echo $text_list; ?></label>
								<div class="col-sm-10">
								  <input type="checkbox" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][show_list]" value="1" <?php if (isset($settings[$setgid]['show_list']) && $settings[$setgid]['show_list'] == 1) { ?> checked="checked" <?php } ?> />&nbsp;&nbsp;<?php echo $text_show; ?>
								</div>
							  </div>

							  <!-- map -->
							  <div class="form-group">
								<label class="col-sm-2 control-label"><?php echo $text_map; ?></label>
								<div class="col-sm-10">
								  <table class="table-colors">
									<tr>
									  <td>
										<input type="checkbox" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][show_map]" value="1" <?php if (isset($settings[$setgid]['show_map']) && $settings[$setgid]['show_map'] == 1) { ?> checked="checked" <?php } ?> />&nbsp;&nbsp;<?php echo $text_show; ?>
									  </td>
									  <td>
										<input type="text" data-toggle="tooltip" title="<?php echo $entry_height_map; ?>" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][height_map]" value="<?php echo $settings[$setgid]['height_map']; ?>" placeholder="<?php echo $entry_height_map; ?>" class="form-control" />
									  </td>
									  <td data-toggle="tooltip" title="<?php echo $text_shop_on_map_help; ?>">
										<input type="checkbox" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][shop_on_map]" value="1" <?php if (isset($settings[$setgid]['shop_on_map']) && $settings[$setgid]['shop_on_map'] == 1) { ?> checked="checked" <?php } ?> />&nbsp;&nbsp;<?php echo $text_shop_on_map; ?>
									  </td>
									</tr>
								  </table>
								</div>
							  </div>

							  <!-- map shop_name -->
							  <div class="form-group">
								<label class="col-sm-2 control-label" for="input-shop-name"><?php echo $entry_shop_name; ?><span data-toggle="tooltip" title="<?php echo $entry_shop_name_help; ?>"></span></label>
								<div class="col-sm-10">
								  <input type="text" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][shop_name]" value="<?php echo $settings[$setgid]['shop_name']; ?>" placeholder="<?php echo $entry_shop_name; ?>" id="input-shop-name" class="form-control" />
								</div>
							  </div>

							  <!-- map shop_adress -->
							  <div class="form-group">
								<label class="col-sm-2 control-label" for="input-shop-adress"><?php echo $entry_shop_adress; ?><span data-toggle="tooltip" title="<?php echo $entry_shop_adress_help; ?>"></span></label>
								<div class="col-sm-10">
								  <input type="text" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][shop_adress]" value="<?php echo $settings[$setgid]['shop_adress']; ?>" placeholder="<?php echo $entry_shop_adress; ?>" id="input-shop-adress" class="form-control" />
								</div>
							  </div>

							  <!-- map map_address_format -->
							  <div class="form-group">
								<label class="col-sm-2 control-label"><?php echo $entry_map_address_format; ?><span data-toggle="tooltip" title="<?php echo $entry_map_address_format_help; ?>"></span><br/><a class="fields-popup-content" style="font-weight: normal; cursor: pointer;"><?php echo $text_table_fields_codes; ?></a></label>
								<div class="col-sm-10">
								  <input type="text" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][map_address_format]" value="<?php echo $settings[$setgid]['map_address_format']; ?>" class="form-control" />
								</div>
							  </div>

							  <!-- map map_coords_default -->
							  <div class="form-group">
								<label class="col-sm-2 control-label"><?php echo $entry_map_coords_default; ?><span data-toggle="tooltip" title="<?php echo $entry_map_coords_default_help; ?>"></span><br/></label>
								<div class="col-sm-10">
								  <input type="text" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][map_coords_default]" value="<?php echo $settings[$setgid]['map_coords_default']; ?>" class="form-control" />
								</div>
							  </div>

							  <!-- pagination method -->
							  <div class="form-group">
								<label class="col-sm-2 control-label"><?php echo $entry_pagination_method; ?><span data-toggle="tooltip" title="<?php echo $entry_pagination_method_help; ?>"></span></label>
								<div class="col-sm-10">
								  <label class="radio-inline">
									<input type="radio" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][pagination_method]" value="1" <?php if ($settings[$setgid]['pagination_method'] == 1) { ?>checked="checked"<?php } ?> />&nbsp;&nbsp;<?php echo $text_pagination_bottom_only; ?>
								  </label>
								  <label class="radio-inline">
									<input type="radio" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][pagination_method]" value="2" <?php if ($settings[$setgid]['pagination_method'] == 2) { ?> checked="checked" <?php } ?> />&nbsp;&nbsp;<?php echo $text_pagination_top_only; ?>
								  </label>
								  <label class="radio-inline">
									<input type="radio" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][pagination_method]" value="3" <?php if ($settings[$setgid]['pagination_method'] == 3) { ?> checked="checked" <?php } ?> />&nbsp;&nbsp;<?php echo $text_pagination_top_bottom; ?>
								  </label>
								</div>
							  </div>

							  <!-- date_added_format -->
							  <div class="form-group">
								<label class="col-sm-2 control-label" for="input-date-added-format"><?php echo $entry_date_added_format; ?><span data-toggle="tooltip" title="<?php echo $entry_date_format_help; ?>"></span></label>
								<div class="col-sm-10">
								  <input type="text" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][date_added_format]" value="<?php echo $settings[$setgid]['date_added_format']; ?>" placeholder="<?php echo $entry_date_format_placeholder; ?>" id="input-date-added-format" class="form-control" />
								</div>
							  </div>

							  <!-- date_modified_format -->
							  <div class="form-group">
								<label class="col-sm-2 control-label" for="input-date-modified-format"><?php echo $entry_date_modified_format; ?><span data-toggle="tooltip" title="<?php echo $entry_date_format_help; ?>"></span></label>
								<div class="col-sm-10">
								  <input type="text" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][date_modified_format]" value="<?php echo $settings[$setgid]['date_modified_format']; ?>" placeholder="<?php echo $entry_date_format_placeholder; ?>" id="input-date-modified-format" class="form-control" />
								</div>
							  </div>

							  <!-- popup_products -->
							  <div class="form-group">
								<label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_popup_product_start; ?><span data-toggle="tooltip" title="<?php echo $entry_popup_product_start_help; ?>"></span></label>
								<div class="col-sm-10">
								  <input type="text" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][popup_product_start]" value="<?php echo $settings[$setgid]['popup_product_start']; ?>" placeholder="<?php echo $entry_popup_product_start; ?>" id="input-limit" class="form-control" />
								</div>
							  </div>

							  <!-- limit orders -->
							  <div class="form-group">
								<label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?><span data-toggle="tooltip" title="<?php echo $entry_limit_help; ?>"></span></label>
								<div class="col-sm-10">
								  <input type="text" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][order_limit]" value="<?php echo $settings[$setgid]['order_limit']; ?>" placeholder="<?php echo $entry_limit; ?>" id="input-limit" class="form-control" />
								</div>
							  </div>

							  <!-- sort by default -->
							  <div class="form-group">
								<label class="col-sm-2 control-label" for="input-sortdefault"><?php echo $entry_sortdefault; ?><span data-toggle="tooltip" title="<?php echo $entry_sortdefault_help; ?>"></span></label>
								<div class="col-sm-5">
									<select name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][sortdefault]" id="input-sortdefault" class="form-control">
									<?php foreach ($sort_data as $key => $name) { ?>
										<?php if (isset($settings[$setgid]['sortdefault']) && $settings[$setgid]['sortdefault'] == $key) { ?>
											<option value="<?php echo $key; ?>" selected="selected"><?php echo $name; ?></option>
										<?php } else { ?>
											<option value="<?php echo $key; ?>"><?php echo $name; ?></option>
										<?php } ?>
									<?php } ?>
									</select>
								</div>
								<div class="col-sm-5">
									<select name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][orderdefault]" id="input-orderdefault" class="form-control">
									<?php if (isset($settings[$setgid]['orderdefault']) && $settings[$setgid]['orderdefault'] == 'DESC') { ?>
										<option value="ASC"><?php echo $text_sort_asc; ?></option>
										<option value="DESC" selected="selected"><?php echo $text_sort_desc; ?></option>
									<?php } else { ?>
										<option value="ASC" selected="selected"><?php echo $text_sort_asc; ?></option>
										<option value="DESC"><?php echo $text_sort_desc; ?></option>
									<?php } ?>
									</select>
								</div>
							  </div>
							</div>

							<!-- tab_select_orders -->
							<div class="tab-pane" id="tab_select_orders<?php echo $setgid; ?>">
							  <!-- Order statuses -->
							  <div class="form-group">
								<label class="col-sm-2 control-label"><?php echo $entry_order_statuses; ?><span data-toggle="tooltip" title="<?php echo $entry_order_statuses_help; ?>"></span></label>
								<div class="col-sm-10">
								  <div class="well well-sm checkbox-box">
									<div class="checkbox"><a onclick="$(this).parent().parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a></div>
									<?php foreach ($order_statuses as $id => $status) { ?>
										<div class="checkbox">
										  <label><input type="checkbox" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][statuses][<?php echo $id; ?>][order_status_id]" value="<?php echo $status['order_status_id']; ?>" <?php echo $status_checks[$setgid][$id]; ?> />&nbsp;<?php echo $status['name']; ?></label>
										</div>
									<?php } ?>
									<div class="checkbox"><a onclick="$(this).parent().parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a></div>
								  </div>
								</div>
							  </div>

							  <!-- Payment methods -->
							  <div class="form-group">
								<label class="col-sm-2 control-label"><?php echo $entry_order_payments; ?><span data-toggle="tooltip" title="<?php echo $entry_order_payments_help; ?>"></span></label>
								<div class="col-sm-10">
								  <div class="well well-sm checkbox-box">
									<div class="checkbox"><a onclick="$(this).parent().parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a></div>
									<?php foreach ($order_payments as $code => $name) { ?>
										<div class="checkbox">
										  <label class="control-label">
											<input type="checkbox" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][payments][<?php echo $code; ?>][code]" value="<?php echo $code; ?>" <?php echo $payment_checks[$setgid][$code]; ?>/>&nbsp;<?php echo $name; ?>
											<?php if ($code == 'not_defined') { ?>
											  &nbsp;<span data-toggle="tooltip" title="<?php echo $help_not_defined; ?>"></span>
											<?php } ?>
										  </label>
										</div>
									<?php } ?>
									<div class="checkbox"><a onclick="$(this).parent().parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a></div>
								  </div>
								</div>
							  </div>

							  <!-- Shipping methods -->
							  <div class="form-group">
								<label class="col-sm-2 control-label"><?php echo $entry_order_shippings; ?><span data-toggle="tooltip" title="<?php echo $entry_order_shippings_help; ?>"></span></label>
								<div class="col-sm-10">
								  <div class="well well-sm checkbox-box">
									<div class="checkbox"><a onclick="$(this).parent().parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a></div>
									<?php foreach ($order_shippings as $code => $name) { ?>
										<div class="checkbox">
										  <label class="control-label">
											<input type="checkbox" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][shippings][<?php echo $code; ?>][code]" value="<?php echo $code; ?>" <?php echo $shipping_checks[$setgid][$code]; ?> />&nbsp;<?php echo $name; ?>
											<?php if ($code == 'not_defined') { ?>
											  &nbsp;<span data-toggle="tooltip" title="<?php echo $help_not_defined; ?>"></span>
											<?php } ?>
										  </label>
										</div>
									<?php } ?>
									<div class="checkbox"><a onclick="$(this).parent().parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a></div>
								  </div>
								</div>
							  </div>
							</div>

							<!-- tab_elements -->
							<div class="tab-pane" id="tab_elements<?php echo $setgid; ?>">
							  <!-- Buttons -->
							  <div class="form-group">
								<label class="col-sm-2 control-label"><?php echo $entry_buttons; ?><span data-toggle="tooltip" title="<?php echo $entry_buttons_help; ?>"></span></label>
								<div class="col-sm-10">
								  <div class="well well-sm checkbox-box">
									<div class="checkbox"><a onclick="$(this).parent().parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a></div>
									<?php foreach ($buttons as $key => $button) { ?>
										<div class="checkbox">
										  <label><input type="checkbox" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][buttons][]" value="<?php echo $button['key']; ?>" <?php echo $button_checks[$setgid][$key]; ?>/>
											&nbsp;<?php echo $button['name']; ?></label>
										</div>
									<?php } ?>
									<div class="checkbox"><a onclick="$(this).parent().parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a></div>
								  </div>
								</div>
							  </div>

							  <!-- Columns -->
							  <div class="form-group">
								<label class="col-sm-2 control-label"><?php echo $entry_column; ?><span data-toggle="tooltip" title="<?php echo $entry_column_help; ?>"></span></label>
								<div class="col-sm-10">
								  <div class="well well-sm checkbox-box">
									<table class="table-checkbox">
									  <tr>
										<td style="width: 20%;">
											<div class="checkbox"><a onclick="$(this).closest('table').find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).closest('table').find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a></div>
										</td>
										<td><label class="control-label"><?php echo $entry_column_sort; ?><span data-toggle="tooltip" title="<?php echo $entry_column_sort_help; ?>"></span></label></td>
										<td><label class="control-label"><?php echo $entry_column_style; ?><span data-toggle="tooltip" title="<?php echo $entry_column_style_help; ?>"></span></label></td>
										<td style="padding-left: 30px;"><label class="control-label"><?php echo $text_edited_fields; ?><span data-toggle="tooltip" title="<?php echo $text_edited_fields_help; ?>"></span></label></td>
									  </tr>
									<?php foreach ($columns as $column) { ?>
									  <tr>
										<td class="column-name">
										  <label class="control-label">
											<input type="checkbox" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][columns][]" value="<?php echo $column['key']; ?>" <?php echo $column_checks[$setgid][$column['key']]; ?> />
											&nbsp;<?php echo $column['name']; ?>
											<?php if ($column['key'] == 'status_history') { ?>
											  &nbsp;<span data-toggle="tooltip" title="<?php echo $column_status_history_help; ?>"></span>
											<?php } ?>
										  </label>
										</td>
										<td>
											<input type="text" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][column_sort][<?php echo $column['key']; ?>]" value="<?php echo $settings[$setgid]['column_sort'][$column['key']]; ?>" class="form-control" />
										</td>
										<td>
											<input type="text" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][column_style][<?php echo $column['key']; ?>]" value="<?php echo $settings[$setgid]['column_style'][$column['key']]; ?>" class="form-control" />
										</td>
										<td style="padding-left: 30px;">
										  <label class="control-label">
										  <?php if (in_array($column['key'], $edited_fields)) { ?>
											<input type="checkbox" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][edited_fields][<?php echo $column['key']; ?>]" value="1" <?php echo $edited_field_checks[$setgid][$column['key']]; ?> />
										  <?php } else { ?><?php echo $text_dots; ?><?php } ?>
										  </label>
										</td>
									  </tr>
									<?php } ?>
									</table>
									<div class="checkbox"><a onclick="$(this).parent().parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a></div>
								  </div>
								</div>
							  </div>

							  <!-- Filters -->
							  <div class="form-group">
								<label class="col-sm-2 control-label"><?php echo $entry_filters; ?><span data-toggle="tooltip" title="<?php echo $entry_filters_help; ?>"></span></label>
								<div class="col-sm-10">
								  <div class="well well-sm checkbox-box">
									<table class="table-checkbox">
									  <tr>
										<td>
											<div class="checkbox"><a onclick="$(this).closest('table').find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).closest('table').find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a></div>
										</td>
										<td><label class="control-label"><?php echo $text_filter_top; ?><span data-toggle="tooltip" title="<?php echo $text_filter_top_help; ?>"></span></label></td>
										<td><label class="control-label"><?php echo $text_reload_on_filter_change; ?><span data-toggle="tooltip" title="<?php echo $text_reload_on_filter_change_help; ?>"></span></label></td>
										<td><label class="control-label"><?php echo $text_filter_clear_buttons; ?><span data-toggle="tooltip" title="<?php echo $text_filter_clear_buttons_help; ?>"></span></label></td>
									  </tr>
									<?php foreach ($filters as $filter) { ?>
									  <tr>
										<!-- Show filters -->
										<td>
										  <label class="control-label">
											<input type="checkbox" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][filters][]" value="<?php echo $filter['key']; ?>" <?php echo $filtershow_checks[$setgid][$filter['key']]; ?>/>&nbsp;&nbsp;<?php echo $filter['name']; ?>
											<?php echo $filter_helps[$setgid][$filter['key']]; ?>
											<?php echo $filter_action_helps[$setgid][$filter['key']]; ?>
										  </label>
										</td>
										<!-- filters_top -->
										<td>
										  <label class="control-label">
										  <?php if (!in_array($filter['key'], $filter_exclude_top_keys)) { ?>
											<input type="checkbox" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][filters_top][]" value="<?php echo $filter['key']; ?>" <?php echo $filtertop_checks[$setgid][$filter['key']]; ?>/>
											<?php } else { ?><?php echo $text_dots; ?><?php } ?>
										  </label>
										</td>
										<!-- filter_reload -->
										<td>
										  <label class="control-label">
										  <?php if (!in_array($filter['key'], $filter_exclude_reload_keys)) { ?>
											<input type="checkbox" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][filter_reload][<?php echo $filter['key']; ?>]" value="1" <?php echo $filterreload_checks[$setgid][$filter['key']]; ?> />
										  <?php } else { ?><?php echo $text_dots; ?><?php } ?>
										  </label>
										</td>
										<!-- filter_clear_buttons -->
										<td>
										  <label class="control-label">
											<?php if (in_array($filter['key'], $filter_clear_keys)) { ?>
												<input type="checkbox" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][filter_clear_buttons][<?php echo $filter['key']; ?>]" value="1" <?php echo $filterclear_checks[$setgid][$filter['key']]; ?> />
											<?php } else { ?><?php echo $text_dots; ?><?php } ?>
										  </label>
										</td>
									  </tr>
									<?php } ?>
									</table>
									<div class="checkbox"><a onclick="$(this).parent().parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a></div>
								  </div>
								</div>
							  </div>
							</div>

							<!-- tab_adding_data -->
							<div class="tab-pane" id="tab_adding_data<?php echo $setgid; ?>">
								<div id="fields-codes-popup" class="white-popup mfp-hide"><?php echo $all_fields_codes_text; ?></div>

								<div class="tab-pane" id="form-setting-adding-data<?php echo $setgid; ?>">
								  <ul class="nav nav-tabs" role="tablist">
									<li class="active"><a href="#tab_adding_data_customer<?php echo $setgid; ?>" role="tab" data-toggle="tab"><?php echo $entry_customer; ?></a></li>
									<li><a href="#tab_adding_data_recipient<?php echo $setgid; ?>" role="tab" data-toggle="tab"><?php echo $entry_recipient; ?></a></li>
									<li><a href="#tab_adding_data_product<?php echo $setgid; ?>" role="tab" data-toggle="tab"><?php echo $entry_product_fields; ?></a></li>
									<li><a href="#tab_adding_data_history<?php echo $setgid; ?>" role="tab" data-toggle="tab"><?php echo $entry_history_fields; ?></a></li>
								  </ul>

								  <div class="tab-content">
									<!-- Customer fields -->
									<div class="tab-pane active" id="tab_adding_data_customer<?php echo $setgid; ?>">
									  <!-- customer_name_format -->
									  <div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_cusomer_name_format; ?><span data-toggle="tooltip" title="<?php echo $entry_cusomer_name_format_help; ?>"></span><br/><a class="fields-popup-content" style="font-weight: normal; cursor: pointer;"><?php echo $text_table_fields_codes; ?></a>
										</label>
										<div class="col-sm-10">
										  <textarea name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][customer_name_format]" rows="3" class="form-control"><?php echo $settings[$setgid]['customer_name_format']; ?></textarea>
										</div>
									  </div>

									  <div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_customer_fields; ?><span data-toggle="tooltip" title="<?php echo $entry_customer_fields_help; ?>"></span>
										</label>
										<div class="col-sm-10">
										  <div class="well well-sm checkbox-box">
											<div class="checkbox" style="padding: 0; margin-bottom: -7px;">
											  <label>
												<input type="checkbox" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][customer_fields_hidden]" value="H" <?php if (isset($settings[$setgid]['customer_fields_hidden']) && $settings[$setgid]['customer_fields_hidden'] == 'H') { ?> checked="checked"<?php } ?> />
												&nbsp;<b><?php echo $text_adding_fields_hidden; ?></b>
											  </label>
											</div>
										  </div>

										  <div class="well well-sm checkbox-box">
											<div class="checkbox"><a onclick="$(this).parent().parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a></div>
											<?php foreach ($adding_fields as $field) { ?>
												<div class="checkbox">
												  <label>
													<input type="checkbox" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][customer_fields][]" value="<?php echo $field['key']; ?>" <?php echo $customer_field_checks[$setgid][$field['key']]; ?>/>
													&nbsp;<?php echo $field['name']; ?>
												  </label>
												</div>
											<?php } ?>
											<div class="checkbox"><a onclick="$(this).parent().parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a></div>
										  </div>

										  <!-- Customer fields template -->
										  <div class="well well-sm checkbox-box">
											<div class="checkbox" style="padding: 0; margin-bottom: -7px;">
											  <label>
												<input type="checkbox" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][use_customer_fields_template]" value="1" <?php if (isset($settings[$setgid]['use_customer_fields_template']) && $settings[$setgid]['use_customer_fields_template'] == 1) { ?> checked="checked"<?php } ?> />
												&nbsp;<b><?php echo $text_use_fields_template; ?></b>
											  </label><br/>
											</div>
										  </div>
										  <textarea name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][customer_fields_template]" id="customer_fields_template<?php echo $setgid; ?>" rows="6" class="form-control"><?php echo $settings[$setgid]['customer_fields_template']; ?></textarea>
										</div>
									  </div>
									</div>

									<!-- Recipient fields -->
									<div class="tab-pane" id="tab_adding_data_recipient<?php echo $setgid; ?>">
									  <!-- recipient_name_format -->
									  <div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_recipient_name_format; ?><span data-toggle="tooltip" title="<?php echo $entry_recipient_name_format_help; ?>"></span><br/><a class="fields-popup-content" style="font-weight: normal; cursor: pointer;"><?php echo $text_table_fields_codes; ?></a>
										</label>
										<div class="col-sm-10">
										  <textarea name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][recipient_name_format]" rows="3" class="form-control"><?php echo isset($settings[$setgid]['recipient_name_format']) && !empty($settings[$setgid]['recipient_name_format']) ? $settings[$setgid]['recipient_name_format'] : $recipient_name_format_default; ?></textarea>
										</div>
									  </div>

									  <div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_recipient_fields; ?><span data-toggle="tooltip" title="<?php echo $entry_recipient_fields_help; ?>"></span></label>
										<div class="col-sm-10">
										  <div class="well well-sm checkbox-box">
											<div class="checkbox" style="padding: 0; margin-bottom: -7px;">
											  <label>
												<input type="checkbox" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][recipient_fields_hidden]" value="H" <?php if (isset($settings[$setgid]['recipient_fields_hidden']) && $settings[$setgid]['recipient_fields_hidden'] == 'H') { ?> checked="checked"<?php } ?> />
												&nbsp;<b><?php echo $text_adding_fields_hidden; ?></b>
											  </label>
											</div>
										  </div>

										  <div class="well well-sm checkbox-box">
											<div class="checkbox"><a onclick="$(this).parent().parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a></div>
											<?php foreach ($adding_fields as $field) { ?>
												<div class="checkbox">
												  <label>
													<input type="checkbox" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][recipient_fields][]" value="<?php echo $field['key']; ?>" <?php echo $recipient_field_checks[$setgid][$field['key']]; ?>/>
													&nbsp;<?php echo $field['name']; ?>
												  </label>
												</div>
											<?php } ?>
											<div class="checkbox"><a onclick="$(this).parent().parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a></div>
										  </div>

										  <!-- Recipient fields template -->
										  <div class="well well-sm checkbox-box">
											<div class="checkbox" style="padding: 0; margin-bottom: -7px;">
											  <label>
												<input type="checkbox" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][use_recipient_fields_template]" value="1" <?php if (isset($settings[$setgid]['use_recipient_fields_template']) && $settings[$setgid]['use_recipient_fields_template'] == 1) { ?> checked="checked"<?php } ?> />
												&nbsp;<b><?php echo $text_use_fields_template; ?></b>
											  </label><br/>
											</div>
										  </div>
										  <textarea name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][recipient_fields_template]" id="recipient_fields_template<?php echo $setgid; ?>" rows="6" class="form-control"><?php echo $settings[$setgid]['recipient_fields_template']; ?></textarea>
										</div>
									  </div>
									</div>

									  <!-- Product fields -->
									<div class="tab-pane" id="tab_adding_data_product<?php echo $setgid; ?>">
									  <div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_product_fields; ?><span data-toggle="tooltip" title="<?php echo $entry_product_fields_help; ?>"></span></label>
										<div class="col-sm-10">
										  <div class="well well-sm checkbox-box">
											<div class="checkbox" style="padding: 0; margin-bottom: -7px;">
											  <label>
												<input type="checkbox" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][product_fields_hidden]" value="H" <?php if (isset($settings[$setgid]['product_fields_hidden']) && $settings[$setgid]['product_fields_hidden'] == 'H') { ?> checked="checked"<?php } ?> />
												&nbsp;<b><?php echo $text_product_fields_hidden; ?></b>
											  </label>
											</div>
										  </div>
										  <div class="well well-sm checkbox-box">
											<!-- image size -->
											<div class="checkbox" style="margin-bottom: 25px;">
											  <label class="col-sm-2 control-label" style="text-align: left !Important;"><?php echo $entry_image_size; ?><span data-toggle="tooltip" title="<?php echo $entry_image_size_help; ?>"></span></label>
											  <div class="col-sm-10">
												<input type="text" style="max-width: 100px; float: left; margin-right: 3px;" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][image_width]" value="<?php echo $settings[$setgid]['image_width']; ?>" placeholder="<?php echo $placeholder_image_width; ?>" class="form-control" />
												<input type="text" style="max-width: 100px;" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][image_height]" value="<?php echo $settings[$setgid]['image_height']; ?>" placeholder="<?php echo $placeholder_image_height; ?>" class="form-control" />
											  </div>
											</div>
											<div class="checkbox"><a onclick="$(this).parent().parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a></div>
											<?php foreach ($product_fields as $field) { ?>
												<div class="checkbox">
												  <label>
													<input type="checkbox" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][product_fields][]" value="<?php echo $field['key']; ?>" <?php echo $product_field_checks[$setgid][$field['key']]; ?>/>
													&nbsp;<?php echo $field['name']; ?>
												  </label>
												</div>
											<?php } ?>
											<div class="checkbox"><a onclick="$(this).parent().parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a></div>
										  </div>
										</div>
									  </div>
									</div>

									  <!-- History fields -->
									<div class="tab-pane" id="tab_adding_data_history<?php echo $setgid; ?>">
									  <div class="form-group">
										<label class="col-sm-2 control-label"><?php echo $entry_history_fields; ?><span data-toggle="tooltip" title="<?php echo $entry_history_fields_help; ?>"></span></label>
										<div class="col-sm-10">
										  <div class="well well-sm checkbox-box">
											<div class="checkbox" style="padding: 0; margin-bottom: -7px;">
											  <label>
												<input type="checkbox" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][history_fields_hidden]" value="H" <?php if (isset($settings[$setgid]['history_fields_hidden']) && $settings[$setgid]['history_fields_hidden'] == 'H') { ?> checked="checked"<?php } ?> />
												&nbsp;<b><?php echo $text_history_fields_hidden; ?></b>
											  </label>
											</div>
										  </div>

										  <div class="well well-sm checkbox-box">
											<?php foreach ($history_fields as $field) { ?>
												<div class="checkbox">
												  <label>
													<input type="checkbox" name="<?php echo $extention; ?>_settings[<?php echo $setgid; ?>][history_fields][]" value="<?php echo $field['key']; ?>" <?php echo $history_field_checks[$setgid][$field['key']]; ?> />
													&nbsp;<?php echo $field['name']; ?>
												  </label>
												</div>
											<?php } ?>
											<div class="checkbox"><a onclick="$(this).parent().parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a></div>
										  </div>
										</div>
									  </div>
									</div>
								  </div>
								</div>
							</div>
						</div>
					  </div>
					<?php } ?>
				  </div>
				</div>
			  <?php } else { ?>
				<div class="col-sm-12 text-center no-result"><?php echo $text_group_no_results; ?></div>
			  <?php } ?>
			</div>

			<div class="tab-pane" id="tab_edit_setting_groups">
			  <div class="tab-help alert alert-success"><i class="fa fa-info"></i>&nbsp;&nbsp;&nbsp;<?php echo $text_tab_edit_setting_groups_help; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label"><?php echo $entry_setting_group_method; ?><span data-toggle="tooltip" title="<?php echo $entry_setting_group_method_help; ?>"></span></label>
				<div class="col-sm-10">
				  <label class="radio-inline">
					<?php if (isset($settings['select_method'])) { $select_method = $settings['select_method']; } else { $select_method = 1; } ?>
					<input type="radio" name="<?php echo $extention; ?>_settings[select_method]"  value="1" <?php if ($settings['select_method'] == 1) { ?> checked="checked" <?php } ?> />&nbsp;&nbsp;<?php echo $text_group_radio; ?>
				  </label>
				  <label class="radio-inline">
					<input type="radio" name="<?php echo $extention; ?>_settings[select_method]" value="2" <?php if ($settings['select_method'] == 2) { ?> checked="checked" <?php } ?> />&nbsp;&nbsp;<?php echo $text_group_select; ?>
				  </label>
				</div>
			  </div>

			  <?php if (!empty($settings['setting_groups'])) { ?>
				<?php foreach ($settings['setting_groups'] as $group) { ?>
				  <div class="form-group" id="setting-row<?php echo $group['id']; ?>">
					<label class="col-sm-2 control-label"><?php echo $text_title_group; ?><span data-toggle="tooltip" title="<?php echo $text_title_group_help; ?>"></span></label>
					<div class="col-sm-4">
						<input type="text" id="setting_group_id<?php echo $group['id']; ?>" name="<?php echo $extention; ?>_settings[setting_groups][<?php echo $group['id']; ?>][title]" value="<?php echo $group['title']; ?>" placeholder="<?php echo $text_add_title_group; ?>" class="form-control" />
						<input type="hidden" name="<?php echo $extention; ?>_settings[setting_groups][<?php echo $group['id']; ?>][id]" value="<?php echo $group['id']; ?>" />
					</div>
					<label class="col-sm-1 control-label"><?php echo $text_title_tooltip; ?><span data-toggle="tooltip" title="<?php echo $text_add_help_group; ?>"></span></label>
					<div class="col-sm-4">
						<textarea name="<?php echo $extention; ?>_settings[setting_groups][<?php echo $group['id']; ?>][help]"  rows="2" class="form-control"><?php echo isset($group['help']) ? $group['help'] : ''; ?></textarea>
					</div>
					<div class="col-sm-1">
						<a onclick="$('#setting-row<?php echo $group['id']; ?>').remove();"  class="btn btn-danger" data-toggle="tooltip" data-placement="bottom" title="<?php echo $button_remove; ?>"><i class="fa fa-minus"></i></a>
					</div>
				  </div>
				<?php } ?>
			  <?php } else { ?>
				<div class="col-sm-12 text-center no-result" id="no_result"><?php echo $text_no_results; ?></div>
			  <?php } ?>

			  <!-- add setting group-->
			  <div class="form-group" id="form-group-add-setting-group">
				<label class="col-sm-2 control-label"><?php echo $text_add_setting_group; ?></label>
				<div class="col-sm-10" id="add-button">
					<a onclick="addSettingGroup('<?php echo isset($group['id']) ? $group['id'] + 1 : 1; ?>');" class="btn btn-success" data-placement="bottom"><i class="fa fa-plus"></i></a>
				</div>
			  </div>
			</div>

			<div class="tab-pane" id="tab_edit_colors">
			  <div class="tab-help alert alert-success"><i class="fa fa-info"></i>&nbsp;&nbsp;&nbsp;<?php echo $text_tab_edit_colors_help; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			  </div>

			  <!-- color statuses -->
			  <div class="form-group">
				<label class="col-sm-2 control-label"><?php echo $entry_order_statuses; ?><span data-toggle="tooltip" title="<?php echo $entry_order_statuses_color_help; ?>"></span></label>
				<div class="col-sm-10">
				  <div class="well well-sm checkbox-box">
					<table class="table-colors">
					  <thead>
						<tr>
						  <td><?php echo $column_status; ?></td>
						  <td><?php echo $select_text_color; ?></td>
						  <td><?php echo $select_background_color; ?></td>
						</tr>
					  </thead>
					  <tbody>
					  <?php foreach ($order_statuses as $id => $status) { ?>
						<tr>
							<td style="color: <?php echo '#'.$settings['order_statuses'][$id]['text_color_id']; ?>; background-color: <?php echo '#'.$settings['order_statuses'][$id]['back_color_id']; ?>;" class="target-jscolor" id="target-jscolor-<?php echo $extention; ?>_orderstatus<?php echo $id; ?>"><?php echo $status['name']; ?></td>
							<td>
								<input class="form-control text-color jscolor {mode:'HVS',position:'right'}" data-id="<?php echo $extention; ?>_orderstatus<?php echo $id; ?>" name="<?php echo $extention; ?>_settings[order_statuses][<?php echo $id; ?>][text_color_id]" value="<?php echo $settings['order_statuses'][$id]['text_color_id']; ?>" style="background-color: <?php echo '#'.$settings['order_statuses'][$id]['text_color_id']; ?>;" >
							</td>
							<td>
								<input class="form-control background-color jscolor {mode:'HVS',position:'right'}" data-id="<?php echo $extention; ?>_orderstatus<?php echo $id; ?>" name="<?php echo $extention; ?>_settings[order_statuses][<?php echo $id; ?>][back_color_id]" value="<?php echo $settings['order_statuses'][$id]['back_color_id']; ?>" style="background-color: <?php echo '#'.$settings['order_statuses'][$id]['back_color_id']; ?>;">
							</td>
						</tr>
					  <?php } ?>
					  </tbody>
					</table>
				  </div>
				</div>
			  </div>

			  <!-- color payments -->
			  <div class="form-group">
				<label class="col-sm-2 control-label"><?php echo $entry_order_payments; ?><span data-toggle="tooltip" title="<?php echo $entry_order_payments_color_help; ?>"></span></label>
				<div class="col-sm-10">
				  <div class="well well-sm checkbox-box">
					<table class="table-colors">
					  <thead>
						<tr>
						  <td><?php echo $text_payment_method; ?></td>
						  <td><?php echo $select_text_color; ?></td>
						  <td><?php echo $select_background_color; ?></td>
						</tr>
					  </thead>
					  <tbody>
					  <?php foreach ($order_payments as $code => $name) { ?>
						<tr>
							<td style="color: <?php echo '#'.$settings['order_payments'][$code]['text_color_id']; ?>; background-color: <?php echo '#'.$settings['order_payments'][$code]['back_color_id']; ?>;" class="target-jscolor" id="target-jscolor-<?php echo $extention; ?>_orderpayments<?php echo $code; ?>"><?php echo $name; ?></td>
							<td>
								<input class="form-control text-color jscolor {mode:'HVS',position:'right'}" data-id="<?php echo $extention; ?>_orderpayments<?php echo $code; ?>" name="<?php echo $extention; ?>_settings[order_payments][<?php echo $code; ?>][text_color_id]" value="<?php echo $settings['order_payments'][$code]['text_color_id']; ?>" style="background-color: <?php echo '#'.$settings['order_payments'][$code]['text_color_id']; ?>;" >
							</td>
							<td>
								<input class="form-control background-color jscolor {mode:'HVS',position:'right'}" data-id="<?php echo $extention; ?>_orderpayments<?php echo $code; ?>" name="<?php echo $extention; ?>_settings[order_payments][<?php echo $code; ?>][back_color_id]" value="<?php echo $settings['order_payments'][$code]['back_color_id']; ?>" style="background-color: <?php echo '#'.$settings['order_payments'][$code]['back_color_id']; ?>;">
							</td>
						</tr>
					  <?php } ?>
					  </tbody>
					</table>
				  </div>
				</div>
			  </div>

			  <!-- color shippings -->
			  <div class="form-group">
				<label class="col-sm-2 control-label"><?php echo $entry_order_shippings; ?><span data-toggle="tooltip" title="<?php echo $entry_order_shippings_color_help; ?>"></span></label>
				<div class="col-sm-10">
				  <div class="well well-sm checkbox-box">
					<table class="table-colors">
					  <thead>
						<tr>
						  <td><?php echo $text_shipping_method; ?></td>
						  <td><?php echo $select_text_color; ?></td>
						  <td><?php echo $select_background_color; ?></td>
						</tr>
					  </thead>
					  <tbody>
					  <?php foreach ($order_shippings as $code => $name) { ?>
						<tr>
							<td style="color: <?php echo '#'.$settings['order_shippings'][$code]['text_color_id']; ?>; background-color: <?php echo '#'.$settings['order_shippings'][$code]['back_color_id']; ?>;" class="target-jscolor" id="target-jscolor-<?php echo $extention; ?>_ordershippings<?php echo $code; ?>"><?php echo $name; ?></td>
							<td>
								<input class="form-control text-color jscolor {mode:'HVS',position:'right'}" data-id="<?php echo $extention; ?>_ordershippings<?php echo $code; ?>" name="<?php echo $extention; ?>_settings[order_shippings][<?php echo $code; ?>][text_color_id]" value="<?php echo $settings['order_shippings'][$code]['text_color_id']; ?>" style="background-color: <?php echo '#'.$settings['order_shippings'][$code]['text_color_id']; ?>;" >
							</td>
							<td>
								<input class="form-control background-color jscolor {mode:'HVS',position:'right'}" data-id="<?php echo $extention; ?>_ordershippings<?php echo $code; ?>" name="<?php echo $extention; ?>_settings[order_shippings][<?php echo $code; ?>][back_color_id]" value="<?php echo $settings['order_shippings'][$code]['back_color_id']; ?>" style="background-color: <?php echo '#'.$settings['order_shippings'][$code]['back_color_id']; ?>;">
							</td>
						</tr>
					  <?php } ?>
					  </tbody>
					</table>
				  </div>
				</div>
			  </div>

			  <?php if ($scheduler_status) { ?>
			  <!-- color date_shippings -->
			  <div class="form-group">
				<label class="col-sm-2 control-label"><?php echo $entry_order_date_shippings; ?><span data-toggle="tooltip" title="<?php echo $entry_order_date_shippings_help; ?>"></span></label>
				<div class="col-sm-10">
				  <div class="well well-sm checkbox-box">
					<table id="days_to_ship_colors" class="table-colors">
					  <thead>
						<tr>
						  <td><?php echo $column_example_date; ?></td>
						  <td><?php echo $column_days_to_ship; ?></td>
						  <td><?php echo $select_text_color; ?></td>
						  <td><?php echo $select_background_color; ?></td>
						  <td><!--empty--></td>
						</tr>
					  </thead>
					  <tbody>
						<?php $days_id = 0; ?>
						<?php if (isset($settings['days_to_ship']) && !empty($settings['days_to_ship'])) { ?>
						  <?php foreach ($settings['days_to_ship'] as $days_id => $colors) { ?>
							<tr id="days_to_ship_row<?php echo $days_id; ?>">
								<td style="color: <?php echo '#'.$settings['days_to_ship'][$days_id]['text_color_id']; ?>; background-color: <?php echo '#'.$settings['days_to_ship'][$days_id]['back_color_id']; ?>;" class="target-jscolor" id="target-jscolor-<?php echo $extention; ?>_days_to_ship<?php echo $days_id; ?>"><?php echo $settings['days_to_ship_dates'][$days_id]; ?></td>
								<td>
									<input class="form-control" name="<?php echo $extention; ?>_settings[days_to_ship][<?php echo $days_id; ?>][days]" value="<?php echo $colors['days']; ?>">
								</td>
								<td>
									<input class="form-control text-color jscolor {mode:'HVS',position:'right'}" data-id="<?php echo $extention; ?>_days_to_ship<?php echo $days_id; ?>" name="<?php echo $extention; ?>_settings[days_to_ship][<?php echo $days_id; ?>][text_color_id]" value="<?php echo $colors['text_color_id']; ?>" style="background-color: <?php echo '#'.$settings['days_to_ship'][$days_id]['text_color_id']; ?>;" >
								</td>
								<td>
									<input class="form-control background-color jscolor {mode:'HVS',position:'right'}" data-id="<?php echo $extention; ?>_days_to_ship<?php echo $days_id; ?>" name="<?php echo $extention; ?>_settings[days_to_ship][<?php echo $days_id; ?>][back_color_id]" value="<?php echo $colors['back_color_id']; ?>" style="background-color: <?php echo '#'.$settings['days_to_ship'][$days_id]['back_color_id']; ?>;">
								</td>
								<td class="left" colspan="3">
								  <span class="btn-group">
									<a onclick="$('#days_to_ship_row<?php echo $days_id; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus"></i></a>
								  </span>
								</td>
							</tr>
						  <?php } ?>
						  <?php $days_id++; ?>
						<?php } else { ?>
							<tr id="days_no_result"><td class="center" colspan="5"><?php echo $text_no_results; ?></td></tr>
						<?php } ?>
						<tr id="add_days_row">
						  <td><!--empty--></td>
						  <td class="left" colspan="4">
							  <span class="btn-group">
								<a onclick="addDaysRow();" data-toggle="tooltip" title="<?php echo $button_add_row; ?>" class="btn btn-success"><i class="fa fa-plus"></i></a>
							  </span>
						  </td>
						</tr>
					  </tbody>
					</table>

					<script type="text/javascript"><!--
					var days_id = <?php echo $days_id; ?>;
					function addDaysRow() {
						html  = '<tr id="days_to_ship_row' + days_id + '">';
						html += ' <td style="color: #595959; background-color: #FFFFFF;" class="target-jscolor" id="target-jscolor-<?php echo $extention; ?>_days_to_ship' + days_id + '"><?php echo date('d.m.Y'); ?></td>';
						html += ' <td><input class="form-control" name="<?php echo $extention; ?>_settings[days_to_ship][' + days_id + '][days]" value="0" style="background-color: #FFFFFF;" ></td>';
						html += ' <td><input class="form-control text-color jscolor {mode:\'HVS\',position:\'right\'}" data-id="<?php echo $extention; ?>_days_to_ship' + days_id + '" name="<?php echo $extention; ?>_settings[days_to_ship][' + days_id + '][text_color_id]" value="595959" style="color: #FFFFFF; background-color: #595959;" ></td>';
						html += ' <td><input class="form-control background-color jscolor {mode:\'HVS\',position:\'right\'}" data-id="<?php echo $extention; ?>_days_to_ship' + days_id + '" name="<?php echo $extention; ?>_settings[days_to_ship][' + days_id + '][back_color_id]" value="FFFFFF" style="background-color: #FFFFFF;" ></td>';
						html += ' <td class="left" colspan="3"><span class="btn-group"><a onclick="$(\'#days_to_ship_row' + days_id + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus"></i></a></span></td>';
						html += '</tr>';

						var days_no_result = $('#days_no_result').html();
						if (days_no_result !='') {
							$('#days_no_result').remove();
						}

						$('#add_days_row').before(html);
						days_id++;
						$('#form-quick-editor').attr('action', location + '&apply=true'); $('#form-quick-editor').submit();
					}
					//--></script>

				  </div>
				</div>
			  </div>
			  <?php } ?>

			</div>

			<!-- compatibility -->
			<div class="tab-pane" id="tab_compatibility">
			  <div class="tab-help alert alert-success"><i class="fa fa-info"></i>&nbsp;&nbsp;&nbsp;<?php echo $text_tab_compatibility_help; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			  </div>

			<!-- Yandex Map API Key -->
			  <div class="col-sm-12" style="padding-left: 0; padding-right: 0;">
				  <div class="form-group">
					<label class="col-sm-2 control-label"><?php echo $text_ymap_apikey; ?><span data-toggle="tooltip" title="<?php echo $text_ymap_apikey_help; ?>"></span><br/><?php echo $text_get_apikey; ?></label>
					<div class="col-sm-10">
						<input type="text" name="<?php echo $extention; ?>_settings[ymap_apikey]" value="<?php echo $settings['ymap_apikey']; ?>" class="form-control" />
					</div>
				  </div>
			  </div>

			  <!-- Nova Poshta -->
			  <div class="col-sm-12" style="padding-left: 0; padding-right: 0;">
				  <div class="form-group">
					<label class="col-sm-2 control-label"><?php echo $text_novaposhta; ?><span data-toggle="tooltip" title="<?php echo $text_novaposhta_help; ?>"></span></label>
					<div class="col-sm-10">
						<select name="<?php echo $extention; ?>_settings[compatibility_novaposhta]" class="form-control">
							<option value="0" <?php if ($settings['compatibility_novaposhta'] === '0') { ?> selected="selected"<?php } ?>><?php echo $text_not_selected; ?></option>
							<option value="novaposhta32x" <?php if ($settings['compatibility_novaposhta'] == 'novaposhta32x') { ?> selected="selected"<?php } ?>><?php echo $text_novaposhta32x; ?></option>
							<option value="novaposhta33x" <?php if ($settings['compatibility_novaposhta'] == 'novaposhta33x') { ?> selected="selected"<?php } ?>><?php echo $text_novaposhta33x; ?></option>
						</select>
					</div>
				  </div>
			  </div>

			<!-- OrderPro -->
			  <div class="col-sm-12" style="padding-left: 0; padding-right: 0;">
				  <div class="form-group">
					<label class="col-sm-2 control-label" for="input-orderpro"><?php echo $text_orderpro; ?><span data-toggle="tooltip" title="<?php echo $text_orderpro_help; ?>"></span></label>
					<div class="col-sm-10">
						<select name="<?php echo $extention; ?>_settings[compatibility_orderpro]" id="input-orderpro" class="form-control">
							<option value="0" <?php if ($settings['compatibility_orderpro'] === '0') { ?> selected="selected"<?php } ?>><?php echo $text_not_selected; ?></option>
							<option value="orderpro27" <?php if ($settings['compatibility_orderpro'] == 'orderpro27') { ?> selected="selected"<?php } ?>><?php echo $text_orderpro27x; ?></option>
						</select>
					</div>
				  </div>
			  </div>

			<!-- Roboto Ruble -->
			  <div class="col-sm-12" style="padding-left: 0; padding-right: 0;">
				  <div class="form-group">
					<label class="col-sm-2 control-label" for="input-roboto"><?php echo $text_roboto; ?><span data-toggle="tooltip" title="<?php echo $text_roboto_help; ?>"></span></label>
					<div class="col-sm-10">
						<select name="<?php echo $extention; ?>_settings[compatibility_roboto]" id="input-roboto" class="form-control">
							<option value="0" <?php if ($settings['compatibility_roboto'] === '0') { ?> selected="selected"<?php } ?>><?php echo $text_not_selected; ?></option>
							<option value="roboto25x" <?php if ($settings['compatibility_roboto'] == 'roboto25x') { ?> selected="selected"<?php } ?>><?php echo $text_roboto25x; ?></option>
						</select>
					</div>
				  </div>
			  </div>

			</div>

			<!-- comment status templates -->
			<div class="tab-pane" id="tab_comment_status_template">
			  <div class="tab-help alert alert-success"><i class="fa fa-info"></i>&nbsp;&nbsp;&nbsp;<?php echo $text_tab_comment_status_template_help; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			  </div>
				<?php foreach ($order_statuses as $status_id => $status) { ?>
				  <div class="form-group" style="border-bottom: 1px dashed #DDD !Important;">
					<label class="col-sm-2 control-label"><?php echo $status['name']; ?></label>
					<div class="col-sm-10">
					  <table class="table-colors" style="width: 100%;">
						<?php foreach ($languages as $language) { ?>
							<tr><td style="width: 1px;">
							  <?php if ($ocversion >= 220) { ?>
								<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
							  <?php } else { ?>
								<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
							  <?php } ?>
							  </td>
							  <td>
								<textarea name="<?php echo $extention; ?>_settings[comment_templates][<?php echo $status_id; ?>][<?php echo $language['language_id']; ?>]" rows="2" class="form-control"><?php echo $settings['comment_templates'][$status_id][$language['language_id']]; ?></textarea>
							  </td></tr>
						<?php } ?>
					  </table>
					</div>
				  </div>
				<?php } ?>
			</div>

			<div class="tab-pane" id="tab_backup">
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="button-backup"><?php echo $entry_save_to_file; ?></label>
				<div class="col-sm-10">
				  <a class="btn btn-primary" target="_blank" href="<?php echo $backup_link ?>" id="button-backup"><?php echo $button_save ?></a>
				</div>
			  </div>
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="restore"><?php echo $entry_restore_from_file; ?></label>
				<div class="col-sm-10">
				<table class="restore-table">
				  <tr>
					<td>
					  <input class="btn btn-default" type="file" name="import"/>
					  <input name="restore" type="hidden" value="0" id="restore" />
					</td>
					<td>
					  <a class="btn btn-primary button-restore" disabled="disabled"><?php echo $button_restore; ?></a>
					</td>
				  </tr>
				</table>
				</div>
			  </div>
			</div>
		</div>
      </div>
      </form>
	  <div class="panel-footer"><a href="https://opencartforum.com/user/28448-brest001/?tab=node_downloads_Files" target="_blank"><?php echo $heading_title . ' v.' . $version; ?></a></div>
    </div>
  </div>
</div>

<script type="text/javascript"><!--
$('.fields-popup-content').bind('click', function() {
	$.magnificPopup.open({
		removalDelay: 300,
		callbacks: {
			beforeOpen: function() {
			   this.st.mainClass = 'mfp-zoom';
			}
		},
		tLoading: '<?php echo $text_loading; ?>',
		items: {
			src: $('#fields-codes-popup'),
			type: 'inline'
		}
	});
});

<?php if (!empty($settings['setting_groups'])) { ?>
	<?php foreach ($settings['setting_groups'] as $group) { ?>
		$('#customer_fields_template<?php echo $group['id'] ?>').summernote({height: 300});
		$('#recipient_fields_template<?php echo $group['id'] ?>').summernote({height: 300});
	<?php } ?>
<?php } ?>

$('#setting-groups a:first').tab('show');

$('.text-color').bind('change', function() {
	document.getElementById('target-jscolor-'+$(this).attr('data-id')).style.color = '#'+$(this).val();
});
$('.background-color').bind('change', function() {
	document.getElementById('target-jscolor-'+$(this).attr('data-id')).style.backgroundColor = '#'+$(this).val();
});

$('input[name=\'import\']').bind('change', function() {
	var imp = $('input[name=\'import\']').val();
	if (imp) {
		$('.button-restore').attr('disabled', false);
	} else {
		$('.button-restore').attr('disabled', true);
	}
});

$('.button-restore').bind('click', function() {
	var imp = $('input[name=\'import\']').val();
	$('#restore').val(1);
	$('#form-quick-editor').attr('action', location + '&apply=true');
	$('#form-quick-editor').submit();
});

function apply(){
	$(".alert").remove();
	$.post($("#form-quick-editor").attr('action'), $("#form-quick-editor").serialize(), function(html) {
		var $success = $(html).find(".alert-success, .alert-danger");
		if ($success.length > 0) {
			$(".alert-helper").before($success);
		}
	});
}

//--></script>
<script type="text/javascript"><!--
function addSettingGroup(setgid){
	html = '<div class="form-group" id="setting-row' + setgid +'">';
	html += ' <label class="col-sm-2 control-label" for="input-setting-group' + setgid +'"><?php echo $text_title_group; ?> <span data-toggle="tooltip" title="<?php echo $text_title_group_help; ?>"></span></label>';
	html += ' <div class="col-sm-4">';
	html += '  <input type="text" id="setting_group_id' + setgid +'" name="<?php echo $extention; ?>_settings[setting_groups][' + setgid +'][title]" value="" placeholder="<?php echo $text_add_title_group; ?>" id="input-setting-group' + setgid +'" class="form-control" />';
	html += '  <input type="hidden" name="<?php echo $extention; ?>_settings[setting_groups][' + setgid +'][id]" value="' + setgid +'"/>';
	html += ' </div>';
	html += ' <label class="col-sm-1 control-label"><?php echo $text_title_tooltip; ?></label>';
	html += ' <div class="col-sm-4">';
	html += '  <textarea name="<?php echo $extention; ?>_settings[setting_groups][' + setgid +'][help]" rows="2" placeholder="<?php echo $text_add_help_group; ?>" class="form-control" /></textarea>';
	html += ' </div>';
	html += ' <div class="col-sm-1">';
	html += '  <a onclick="$(\'#setting-row' + setgid +'\').remove();"  class="btn btn-danger" data-toggle="tooltip" data-placement="bottom" title="<?php echo $button_remove; ?>"><i class="fa fa-minus"></i></a>';
	html += ' </div>';
	html += '</div>';

	var no_result = $('#no_result').html();
	if (no_result !='') {
		$('#no_result').remove();
	}

	$('#form-group-add-setting-group').before(html);
	setgid++;
	$('#add-button').html('<a onclick="addSettingGroup('+setgid+');" class="btn btn-success" data-toggle="tooltip" data-placement="bottom" title="<?php echo $button_add; ?>"><i class="fa fa-plus"></i></a>');
}
//--></script>

<?php echo $footer; ?>
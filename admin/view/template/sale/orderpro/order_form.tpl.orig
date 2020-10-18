<?php echo $header; ?><?php echo $column_left; ?>
<div id="content" class="orderpro-content">
	<div class="page-header">
		<div class="container-fluid">
		  <div class="pull-right">
			<div class="buttons">
				<?php if ($is_admin) { ?>
				<a href="<?php echo $setting; ?>" data-toggle="tooltip" title="<?php echo $button_setting_tooltip; ?>" class="btn btn-default btn-sm"><span class="hidden-sm hidden-xs"><?php echo $button_setting; ?></span><i class="fa fa-cog hidden-lg hidden-md" aria-hidden="true"></i></a>
				<span class="term-button">|</span>
				<?php if ($order_id) { ?>
					<a onclick="window.open('<?php echo $invoice; ?>&order_id=<?php echo $order_id; ?>');" data-toggle="tooltip" title="<?php echo $button_invoce_tooltip; ?>" class="btn btn-primary btn-sm"><span class="hidden-sm hidden-xs"><?php echo $button_invoce; ?></span><i class="fa fa-print hidden-lg hidden-md" aria-hidden="true"></i></a>
					<a onclick="clone_order();" data-toggle="tooltip" title="<?php echo $button_clone_tooltip; ?>" class="btn btn-primary btn-sm"><span class="hidden-sm hidden-xs"><?php echo $button_clone; ?></span><i class="fa fa-copy hidden-lg hidden-md" aria-hidden="true"></i></a>
					<span class="term-button">|</span>
				<?php } ?>
				<a onclick="apple_order();" data-toggle="tooltip" title="<?php echo $button_apply_tooltip; ?>" class="btn btn-primary btn-sm"><span class="hidden-sm hidden-xs"><?php echo $button_apply; ?></span><i class="fa fa-save hidden-lg hidden-md" aria-hidden="true"></i></a>
				<a onclick="$('#order_form').submit();" data-toggle="tooltip" title="<?php echo $button_save_tooltip; ?>" class="btn btn-success btn-sm"><span class="hidden-sm hidden-xs"><?php echo $button_save; ?></span><i class="fa fa-save hidden-lg hidden-md" aria-hidden="true"></i></a>
				<?php } ?>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel_tooltip; ?>" class="btn btn-danger btn-sm"><span class="hidden-sm hidden-xs"><?php echo $button_cancel; ?></span><i class="fa fa-reply hidden-lg hidden-md" aria-hidden="true"></i></a>
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
	<div class="container-fluid">
    <?php if ($success) { ?>
		<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?><button type="button" class="close" data-dismiss="alert" aria-label="Close">&times;</button></div>
    <?php } ?>
    <?php if ($error_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-check-circle"></i> <?php echo $error_warning; ?><button type="button" class="close" data-dismiss="alert" aria-label="Close">&times;</button></div>
    <?php } ?>
    <?php if ($error_license) { ?>
		<div class="alert alert-danger"><i class="fa fa-check-circle"></i> <?php echo $error_license; ?></div>
    <?php } ?>
    <?php if ($status_del_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-check-circle"></i> <?php echo $error_del_product; ?></div>
    <?php } ?>
    <?php if ($status_off_warning) { ?>
		<div class="alert alert-info"><i class="fa fa-check-circle"></i> <?php echo $error_off_product; ?></div>
    <?php } ?>
    <?php if ($status_vars_warning) { ?>
		<div class="alert alert-warning"><i class="fa fa-check-circle"></i> <?php echo $error_input_vars; ?></div>
    <?php } ?>
	<div class="panel panel-default">
	
	<div class="panel-heading">
		<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $order_number; ?></h3>
	</div>
	
	<div class="panel-body content">
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="order_form" class="order-form-all">
		<ul class="nav nav-tabs">
			<?php if (!$orderpro_notabs_mode) { ?>
				<li class="active"><a href="#tab-order" data-toggle="tab"><?php echo $tab_order; ?></a></li>
				<li><a href="#tab-history" data-toggle="tab"><?php echo $tab_order_history; ?></a></li>
				<li><a href="#tab-total" data-toggle="tab"><?php echo $tab_total; ?></a></li>
			<?php } else { ?>
				<li class="active"><a href="#tab-allorder" data-toggle="tab"><?php echo $tab_order; ?></a></li>
			<?php } ?>
		</ul>
	
		<div class="tab-content">
			<?php if ($orderpro_notabs_mode) { ?>
			<div id="tab-allorder" class="tab-pane active">
			<?php } ?>
			<div id="tab-order"<?php if (!$orderpro_notabs_mode) { ?> class="tab-pane active"<?php } ?>>
				<div class="top-order">
					<div class="row">
						<div class="col-md-3 col-xs-4">
						<?php if ($customer_id) { ?>
							<a class="btn btn-default btn-sm" role="button"><?php echo $text_account_exist; ?></a>
						<?php } else { ?>
							<div class="btn-group btn-group-sm">
								<a id="button-registered" class="btn btn-primary" role="button"><?php echo $button_create_account; ?></a>
								<a tabindex="0" class="btn btn-primary btn-popover" data-placement="right" title="<?php echo $help_registered_head; ?>" data-content="<?php echo $help_registered; ?>" role="button"><i class="fa fa-question-circle fa-lg" aria-hidden="true"></i></a>
							</div>
						<?php } ?>
						</div>
						<div class="col-md-3 col-xs-8 pull-right">
							<div class="input-group input-group-sm">
								<span class="input-group-addon"><span class="dop-title hidden-md"><?php echo $entry_order_status; ?></span><i class="fa fa-check-circle hidden-lg hidden-sm hidden-xs"></i></span>
								<select id="order_status_id" name="order_status_id" class="form-control">
								<?php foreach ($order_statuses as $order_status) { ?>
									<?php if ($order_status['order_status_id'] == $order_status_id) { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
									<?php } ?>
								<?php } ?>
								</select>
								<span class="input-group-addon span-popover" data-placement="left" title="<?php echo $help_order_status_head; ?>" data-content="<?php echo $help_order_status; ?>"><i class="fa fa-question-circle fa-lg fa-danger" aria-hidden="true"></i></span>
							</div>
						</div>
						<div class="col-md-2 col-xs-4">
							<div class="input-group input-group-sm">
								<span class="input-group-addon"><span class="dop-title hidden-md hidden-xs"><?php echo $text_store; ?></span><i class="fa fa-home hidden-lg hidden-sm" aria-hidden="true"></i></span>
								<select name="store_id" class="form-control">
								<option value="0"><?php echo $text_default; ?></option>
								<?php foreach ($stores as $store) { ?>
									<?php if ($store['store_id'] == $store_id) { ?>
									<option value="<?php echo $store['store_id']; ?>" selected="selected"><?php echo $store['name']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $store['store_id']; ?>"><?php echo $store['name']; ?></option>
									<?php } ?>
								<?php } ?>
								</select>
							</div>
						</div>
						<div class="col-md-2 col-xs-4">
							<div class="input-group input-group-sm">
								<span class="input-group-addon"><span class="dop-title hidden-md hidden-xs"><?php echo $text_currency; ?></span><i class="fa fa-usd hidden-lg hidden-sm" aria-hidden="true"></i></span>
								<select name="currency_code" class="form-control">
								<?php foreach ($currencies as $currency) { ?>
									<?php if ($currency_code == $currency['code']) { ?>
									<option value="<?php echo $currency['code']; ?>" selected="selected"><?php echo $currency['title']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></option>
									<?php } ?>
								<?php } ?>
								</select>
							</div>
						</div>
						<div class="col-md-2 col-xs-4">
							<div class="input-group input-group-sm">
								<span class="input-group-addon"><span class="dop-title hidden-md hidden-xs"><?php echo $text_language; ?></span><i class="fa fa-globe hidden-lg hidden-sm" aria-hidden="true"></i></span>
								<select name="language" class="form-control">
								<?php foreach ($languages as $language) { ?>
									<?php if ($admin_language == $language['code']) { ?>
									<option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
									<?php } ?>
								<?php } ?>
								</select>
							</div>
						</div>
					</div>
				</div>
				
				<div class="middle-order">
					<div class="row">
						<div class="col-xs-6">
							<div class="left-order">
								<h4><?php echo $text_customer; ?></h4>
								<div class="row">
									<div class="col-sm-8 col-xs-12">
										<div class="form-group">
											<label><?php echo $entry_customer; ?><span class="help"><?php echo $help_autocomplite; ?></span><?php if ($show_similar && $similar_customer_id) { ?><span class="similar"><a onclick="getsimilar('customer_id');" role="button">(<?php echo $similar_customer_id; ?>)</a><a tabindex="0" class="btn-popover" title="" data-content="<?php echo $help_similar; ?>" role="button"><i class="fa fa-question-circle" aria-hidden="true"></i></a></span><?php } ?></label>
											<input type="text" name="customer" class="form-control" value="<?php echo $customer; ?>" />
											<input type="hidden" name="customer_id" value="<?php echo $customer_id; ?>" />
											<input type="hidden" name="virtual_customer_id" value="<?php echo $virtual_customer_id; ?>" />
											<input type="hidden" name="customer_group_id" value="<?php echo $customer_group_id; ?>" />
											<input type="hidden" name="invoice_no" value="<?php echo $invoice_no; ?>" />
											<input type="hidden" name="date_added" value="<?php echo $date_added; ?>" />
											<input type="hidden" name="ip" value="<?php echo $ip; ?>" />
											<input type="hidden" name="clone" id="clone" value="<?php echo $clone; ?>" />
											<input type="hidden" name="order_id" value="<?php echo $order_id; ?>" />
											<input type="hidden" name="temp_order_id" value="<?php echo $temp_order_id; ?>" />
										</div>
									</div>
         
									<div class="col-sm-4 col-xs-12 call_button_container">
                                            <div class="btn-group btn-group-sm">
                                                <a onclick="callRequest('<?php echo $telephone; ?>');" class="btn btn-success" role="button">Позвонить клиенту </a>
                                                <a onclick="callRequest('<?php echo $telephone; ?>');" tabindex="0" class="btn btn-success" data-placement="right" title="" role="button"><i class="fa fa-phone-square fa-lg" aria-hidden="true"></i></a>
                                            </div>
                                    </div>
                                    
								</div>
								<div class="row">
									<div class="col-sm-7 col-xs-12">
										<div class="form-group">
											<label><?php echo $entry_firstname; ?></label>
											<input type="text" name="firstname" class="form-control" value="<?php echo $firstname; ?>" />
											<?php if ($error_firstname) { ?><div class="text-danger"><?php echo $error_firstname; ?></div><?php } ?>
										</div>
									</div>
									<div class="col-sm-5 col-xs-12">
										<div class="form-group">
											<label><?php echo $entry_lastname; ?><?php if ($show_similar && $similar_lastname) { ?><span class="similar"><a onclick="getsimilar('lastname');" role="button">(<?php echo $similar_lastname; ?>)</a><a tabindex="0" class="btn-popover" title="" data-content="<?php echo $help_similar; ?>" role="button"><i class="fa fa-question-circle" aria-hidden="true"></i></a></span><?php } ?></label>
											<input type="text" name="lastname" class="form-control" value="<?php echo $lastname; ?>" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-4 col-xs-6">
										<div class="form-group">
											<label><?php echo $entry_email; ?><?php if ($show_similar && $similar_email) { ?><span class="similar"><a onclick="getsimilar('email');" role="button">(<?php echo $similar_email; ?>)</a><a tabindex="0" class="btn-popover" title="" data-content="<?php echo $help_similar; ?>" role="button"><i class="fa fa-question-circle" aria-hidden="true"></i></a></span><?php } ?></label>
											<input type="text" name="email" class="form-control" value="<?php echo $email; ?>" />
										</div>
									</div>
         
									<div class="col-md-4 col-xs-6">
										<div class="form-group">
											<label><?php echo $entry_telephone; ?>
											    <a onclick="callRequest('<?php echo $telephone; ?>');" class="call_small_icon_a" role="button"><i class="fa fa-phone-square call_small_icon" aria-hidden="true"></i></a>
                                                <?php if ($show_similar && $similar_telephone) { ?><span class="similar"><a onclick="getsimilar('telephone');" role="button">(<?php echo $similar_telephone; ?>)</a><a tabindex="0" class="btn-popover" title="" data-content="<?php echo $help_similar; ?>" role="button"><i class="fa fa-question-circle" aria-hidden="true"></i></a></span><?php } ?>
                                            </label>
											<input type="text" name="telephone" class="form-control" value="<?php echo $telephone; ?>" />
										</div>
									</div>
         
									<div class="col-md-4 col-xs-6">
										<div class="form-group">
											<label><?php echo $entry_fax; ?><?php if ($show_similar && $similar_fax) { ?><span class="similar"><a onclick="getsimilar('fax');" role="button">(<?php echo $similar_fax; ?>)</a><a tabindex="0" class="btn-popover" title="" data-content="<?php echo $help_similar; ?>" role="button"><i class="fa fa-question-circle" aria-hidden="true"></i></a></span><?php } ?></label>
											<input type="text" name="fax" class="form-control" value="<?php echo $fax; ?>" />
										</div>
									</div>
									
									<div class="col-md-4 col-xs-6 pull-right">
										<div class="form-group">
											<label><?php echo $entry_company; ?><?php if ($show_similar && $similar_company) { ?><span class="similar"><a onclick="getsimilar('company');" role="button">(<?php echo $similar_company; ?>)</a><a tabindex="0" class="btn-popover" title="" data-content="<?php echo $help_similar; ?>" role="button"><i class="fa fa-question-circle" aria-hidden="true"></i></a></span><?php } ?></label>
											<input type="text" name="payment_company" class="form-control" value="<?php echo $payment_company; ?>" />
										</div>
									</div>
									<div class="col-md-8 col-xs-12">
										<div class="form-group">
											<label><?php echo $entry_comment_customer; ?></label>
											<textarea name="comment" class="form-control" style="<?php if ($comment) { ?>border:1px solid #FF7C61;<?php } ?>"><?php echo $comment; ?></textarea>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-6">
							<div class="right-order">
								<h4><?php echo $text_shipping; ?></h4>
								<div class="row">
									<div class="col-sm-8 col-xs-12">
										<div class="form-group">
											<label><?php echo $entry_address; ?></label>
											<select name="shipping_address" class="form-control">
											<option value="0"><?php echo $text_none; ?></option>
											<?php foreach ($addresses as $address) { ?>
												<option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname'] . ' ' . $address['lastname'] . ', ' . $address['zone'] . ', ' . $address['city'] . ', ' . $address['address_1']; ?></option>
											<?php } ?>
											</select>
										</div>
									</div>
									<div class="col-sm-4 col-xs-12"></div>
								</div>
								<div class="row">
									<div class="col-sm-7 col-xs-12">
										<div class="form-group">
											<label><?php echo $entry_firstname; ?></label>
											<input type="text" name="shipping_firstname" class="form-control" value="<?php echo $shipping_firstname; ?>" />
											<?php if ($error_shipping_firstname) { ?><div class="text-danger"><?php echo $error_shipping_firstname; ?></div><?php } ?>
										</div>
									</div>
									<div class="col-sm-5 col-xs-12">
										<div class="form-group">
											<label><?php echo $entry_lastname; ?></label>
											<input type="text" name="shipping_lastname" class="form-control" value="<?php echo $shipping_lastname; ?>" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-5 col-sm-6 col-xs-6">
										<div class="form-group">
											<label><?php echo $entry_country; ?></label>
											<select name="shipping_country_id" class="form-control">
											<option value="0"><?php echo $text_select; ?></option>
											<?php foreach ($countries as $country) { ?>
												<?php if ($country['country_id'] == $shipping_country_id) { ?>
												<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
												<?php } ?>
											<?php } ?>
											</select>
										</div>
									</div>
									<div class="col-md-4 col-sm-6 col-xs-6">
										<div class="form-group">
											<label><?php echo $entry_zone; ?></label>
											<select name="shipping_zone_id" class="form-control"></select>
										</div>
									</div>
									<div class="col-md-3 col-sm-5 col-xs-5 pull-right">
										<div class="form-group">
											<label><?php echo $entry_postcode; ?></label>
											<input type="text" name="shipping_postcode" class="form-control" value="<?php echo $shipping_postcode; ?>" />
										</div>
									</div>
									
									<div class="col-md-5 col-sm-7 col-xs-7">
										<div class="form-group">
											<label><?php echo $entry_city; ?></label>
											<input type="text" name="shipping_city" class="form-control" value="<?php echo $shipping_city; ?>" />
										</div>
									</div>
									<div class="col-md-4 col-sm-7 col-xs-7">
										<div class="form-group">
											<label><?php echo $entry_address_1; ?></label>
											<input type="text" name="shipping_address_1" class="form-control" value="<?php echo $shipping_address_1; ?>" />
										</div>
									</div>
									<div class="col-md-3 col-sm-5 col-xs-5 pull-right">
										<div class="form-group">
											<label><?php echo $entry_address_2; ?></label>
											<input type="text" name="shipping_address_2" class="form-control" value="<?php echo $shipping_address_2; ?>" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="bottom-order">
				<?php if ($custom_fields) { ?>
					<?php require(DIR_TEMPLATE . "sale/orderpro/order_csfield.tpl"); ?>
				<?php } ?>
					<div id="simplefield">
						<div id="simple_custblock"></div>
						<div id="simple_payblock"></div>
						<div id="simple_shipblock"></div>
					</div>
				</div>
			</div>

			<div id="tab-payment" style="display:none;">
				<table class="form order-payment">
					<tbody>
						<tr>
							<td><input type="text" name="payment_firstname" value="<?php echo $payment_firstname; ?>" /></td>
							<td><input type="text" name="payment_lastname" value="<?php echo $payment_lastname; ?>" /></td>
							<td><input type="text" name="payment_address_1" value="<?php echo $payment_address_1; ?>" /></td>
							<td><input type="text" name="payment_address_2" value="<?php echo $payment_address_2; ?>" /></td>
							<td><input type="text" name="payment_city" value="<?php echo $payment_city; ?>" /></td>
							<td><input type="text" name="payment_postcode" value="<?php echo $payment_postcode; ?>" /></td>
							<td><input type="text" name="payment_country_id" value="<?php echo $payment_country_id; ?>" /></td>
							<td><input type="text" name="payment_zone_id" value="<?php echo $payment_zone_id; ?>" /></td>
							<td><input type="text" name="shipping_company" value="<?php echo $shipping_company; ?>" /></td>
						</tr>
					</tbody>
				</table>
			</div>

			<?php if ($orderpro_notabs_mode) { ?>
			<div class="terminator"></div>
			<?php } ?>

			<div id="tab-history"<?php if (!$orderpro_notabs_mode) { ?> class="tab-pane"<?php } ?>>
				<div class="mode-history">
					<div class="row" id="order-history">
						<?php if ($order_id) { ?>
						<div class="col-lg-5 col-md-5 col-sm-12">
							<div class="form-group">
								<label for="horder_status_id"><?php echo $entry_order_status; ?></label>
								<select id="horder_status_id" name="history_order_status_id" class="form-control input-sm">
								<?php foreach ($order_statuses as $order_status) { ?>
									<?php if ($order_status['order_status_id'] == $order_status_id) { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
									<?php } ?>
								<?php } ?>
								</select>
							</div>
							<div class="row checkbox-history">
								<div class="col-xs-6">
									<div class="checkbox">
										<label><input type="checkbox" name="notify" value="1" /><?php echo $entry_notify; ?></label>
									</div>
									<div class="checkbox hide-notify">
										<label class="label-popover" title="" data-content="<?php echo $help_notify_products; ?>"><input type="checkbox" name="notify_products" value="1" /><?php echo $entry_notify_products; ?></label>
									</div>
								</div>
								<div class="col-xs-6">
									<div class="checkbox">
										<label><input type="checkbox" name="notify_admin" value="1" /><?php echo $entry_notify_admin; ?></label>
									</div>
									<div class="checkbox hide-notify-admin">
										<label class="label-popover" data-placement="left" title="" data-content="<?php echo $help_notify_products; ?>"><input type="checkbox" name="notify_admin_products" value="1" /><?php echo $entry_notify_products; ?></label>
									</div>
								</div>
							</div>
							<span class="history-berth"></span>
						</div>
	
						<div class="col-lg-6 col-md-5 col-sm-9">
							<div class="form-group">
								<label><?php echo $entry_comment; ?></label>
								<textarea name="admin_comment" class="form-control" rows="4"></textarea>
							</div>
						</div>
	
						<div class="col-lg-1 col-md-2 col-sm-3 text-center" style="padding-left:0;">
							<a id="button-history" class="btn btn-primary btn-sm" role="button"><?php echo $button_add_history; ?></a>
						</div>
						<?php } else { ?>
						<div class="col-sm-12 text-center" style="padding: 0 0 10px;"><?php echo $text_neworder_history; ?></div>
						<?php } ?>
					</div>
				</div>
				<div id="history"></div>
			</div>
	
			<?php if ($orderpro_notabs_mode) { ?>
			<div class="terminator"></div>
			<?php } ?>
	
			<div id="tab-total"<?php if (!$orderpro_notabs_mode) { ?> class="tab-pane"<?php } ?>>
				<?php 
				$cart_colspan = 11;
				$tline_colspan = 3;
				if ($show_pid) {$hide_pid = '';} else {$hide_pid = ' style="display:none;"';$cart_colspan -= 1;}
				if ($show_image) {$hide_image = '';} else {$hide_image = ' style="display:none;"';$cart_colspan -= 1;}
				if ($show_model) {$hide_model = '';} else {$hide_model = ' style="display:none;"';$cart_colspan -= 1;}
				if ($show_sku) {$hide_sku = '';} else {$hide_sku = ' style="display:none;"';$cart_colspan -= 1;}
				if ($show_upc) {$hide_upc = '';} else {$hide_upc = ' style="display:none;"';$cart_colspan -= 1;}
				if ($show_ean) {$hide_ean = '';} else {$hide_ean = ' style="display:none;"';$cart_colspan -= 1;}
				if ($show_jan) {$hide_jan = '';} else {$hide_jan = ' style="display:none;"';$cart_colspan -= 1;}
				if ($show_isbn) {$hide_isbn = '';} else {$hide_isbn = ' style="display:none;"';$cart_colspan -= 1;}
				if ($show_mpn) {$hide_mpn = '';} else {$hide_mpn = ' style="display:none;"';$cart_colspan -= 1;}
				if ($show_location) {$hide_location = '';} else {$hide_location = ' style="display:none;"';$cart_colspan -= 1;}
				if (($customer_id) && ($reward_status)) {$hide_reward = '';} else {$hide_reward = ' style="display:none;"';}
				if ($show_weight) {$hide_weight = '';} else {$hide_weight = ' style="display:none;"';}
				if ($show_discount) {$hide_discount = '';} else {$hide_discount = ' style="display:none;"';}
				if ($show_realqty) {$hide_realqty = '';} else {$hide_realqty = ' style="display:none;"';$tline_colspan -= 1;}
				if ($show_nowprice) {$hide_nowprice = '';} else {$hide_nowprice = ' style="display:none;"';$tline_colspan -= 1;} ?>
				<table id="product" class="list order-products">
					<thead>
						<tr>
						    <td class="column-pid"<?php echo $hide_pid; ?>><?php echo $column_pid; ?></td>
							<td class="column-image"<?php echo $hide_image; ?>><?php echo $column_image; ?></td>
							<td class="column-product"><?php echo $column_product; ?><span class="help"><?php echo $help_autocomplite; ?></span></td>
							<td class="column-model"<?php echo $hide_model; ?>><?php echo $column_model; ?><span class="help"><?php echo $help_autocomplite; ?></span></td>
							<td class="column-sku"<?php echo $hide_sku; ?>><?php echo $column_sku; ?><span class="help"><?php echo $help_autocomplite; ?></span></td>
							<td class="column-upc"<?php echo $hide_upc; ?>><?php echo $column_upc; ?><span class="help"><?php echo $help_autocomplite; ?></span></td>
							<td class="column-ean"<?php echo $hide_ean; ?>><?php echo $column_ean; ?><span class="help"><?php echo $help_autocomplite; ?></span></td>
							<td class="column-jan"<?php echo $hide_jan; ?>><?php echo $column_jan; ?><span class="help"><?php echo $help_autocomplite; ?></span></td>
							<td class="column-isbn"<?php echo $hide_isbn; ?>><?php echo $column_isbn; ?><span class="help"><?php echo $help_autocomplite; ?></span></td>
							<td class="column-mpn"<?php echo $hide_mpn; ?>><?php echo $column_mpn; ?><span class="help"><?php echo $help_autocomplite; ?></span></td>
							<td class="column-location"<?php echo $hide_location; ?>><?php echo $column_location; ?><span class="help"><?php echo $help_autocomplite; ?></span></td>
							<td class="column-weight"<?php echo $hide_weight; ?>><?php echo $column_weight; ?><span class="help"><?php echo $help_weight; ?></span></td>
							<td class="column-quantity"><?php echo $column_quantity; ?><span class="help"><?php echo $help_qty; ?></span></td>
							<td class="column-realquantity"<?php echo $hide_realqty; ?>><?php echo $column_realquantity; ?><span class="help"><?php echo $help_stock; ?></span></td>
							<td class="column-price"><?php echo $column_price; ?><span class="help"><?php echo $help_price; ?></span><img src="view/image/orderpro/delete16.png" id="empty-prices" data-toggle="tooltip" alt="" title="<?php echo $help_empty_prices; ?>" /></td>
							<td class="column-now_price"<?php echo $hide_nowprice; ?>><?php echo $column_now_price; ?><span class="help"><?php echo $help_now_price; ?></span></td>
							<td class="column-total"><?php echo $column_total; ?></td>
							<td class="column-discount"<?php echo $hide_discount; ?>><?php echo $column_discount; ?><img src="view/image/orderpro/delete16.png" id="empty-discounts" data-toggle="tooltip" alt="" title="<?php echo $help_empty_discounts; ?>" /></td>
							<td class="column-reward"<?php echo $hide_reward; ?>><span class="visible-lg"><?php echo $column_reward; ?></span><span class="hidden-lg"><?php echo $column_reward_short; ?></span></td>
							<td class="column-action"></td>
						</tr>
					</thead>
	
					<?php $product_row = 0; ?>
					<input type="hidden" name="old_products" value="<?php echo $old_products; ?>" />
					<?php foreach ($order_products as $order_product) { ?>
					<tbody id="product-row<?php echo $product_row; ?>">
						<?php if ($order_product['status'] == '0') {$name_class = ' item-off';} elseif ($order_product['status'] == '33') {$name_class = ' item-del';} else {$name_class = '';} ?>
						<tr class="product-line<?php echo $name_class; ?>">
							<td class="center"<?php echo $hide_pid; ?>><input type="text" name="order_product[<?php echo $product_row; ?>][product_id]" value="<?php echo $order_product['product_id']; ?>" class="form-control input-pid" readonly="readonly" /></td>
							<td class="center"<?php echo $hide_image; ?>>
								<div class="product-image" id="image_<?php echo $product_row; ?>">
									<a href="<?php echo $order_product['href']; ?>" target="_blank"><img src="<?php echo $order_product['image']; ?>" alt="<?php echo $order_product['name']; ?>" /></a>
									<?php if ($order_product['popap']) { ?><span id="popap_<?php echo $product_row; ?>" class="product-popap" data-popap="<?php echo $order_product['popap']; ?>"></span><?php } ?>
								</div>
							</td>
							<td class="center">
								<input type="text" name="order_product[<?php echo $product_row; ?>][name]" value="<?php echo $order_product['name']; ?>" class="form-control input-name<?php if($order_product['discount_amount'] > 0) { ?> has-amount<?php } ?>" />
								<input type="hidden" name="order_product[<?php echo $product_row; ?>][order_product_id]" value="<?php echo $order_product['order_product_id']; ?>" />
								<input type="hidden" name="order_product[<?php echo $product_row; ?>][tax]" value="<?php echo $order_product['tax']; ?>" />
								<input type="hidden" name="order_product[<?php echo $product_row; ?>][status]" value="<?php echo $order_product['status']; ?>" />
								<div id="product_options<?php echo $product_row; ?>" class="product_options">
								<?php if ($order_product['option']) { ?>
									<div class="poptions">
									<?php foreach ($order_product['option'] as $option) { ?>
										<?php if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'image') { ?>
										<div class="form-group option">
											<label><?php if ($option['required']) { ?><span class="required">*</span><?php } ?><?php echo $option['name']; ?></label>
											<select name="order_product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" class="form-control">
												<?php if (!$option['required']) { ?><option value=""><?php echo $text_select; ?></option><?php } ?>
												<?php foreach ($option['option_value'] as $option_value) { ?>
													<?php if (isset($order_product['order_option'][$option['product_option_id']][$option_value['product_option_value_id']])) { ?>
														<option value="<?php echo $option_value['product_option_value_id']; ?>" selected="selected"><?php echo $option_value['name']; ?><?php if ($option_value['price']) { ?> (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)<?php } ?></option>
													<?php } else { ?>
														<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?><?php if ($option_value['price']) { ?> (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)<?php } ?></option>
													<?php } ?>
												<?php } ?>
											</select>
											<?php if ($option['alarm']) { ?>
												<span class="text-danger"><?php echo $text_alarm_options; ?></span>
											<?php } ?>
										</div>
										<?php } ?>
										<?php if ($option['type'] == 'checkbox') { ?>
										<div class="form-group">
											<label><?php if ($option['required']) { ?><span class="required">*</span><?php } ?><?php echo $option['name']; ?></label>
											<?php foreach ($option['option_value'] as $option_value) { ?>
											<div class="checkbox">
												<?php if (isset($order_product['order_option'][$option['product_option_id']][$option_value['product_option_value_id']])) { ?>
												<label><input type="checkbox" name="order_product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" checked="checked" /><?php echo $option_value['name']; ?><?php if ($option_value['price']) { ?> (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)<?php } ?></label>
												<?php } else { ?>
												<label><input type="checkbox" name="order_product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" /><?php echo $option_value['name']; ?><?php if ($option_value['price']) { ?> (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)<?php } ?></label>
												<?php } ?>
											</div>
											<?php } ?>
											<?php if ($option['alarm']) { ?>
												<span class="text-danger"><?php echo $text_alarm_options; ?></span>
											<?php } ?>
										</div>
										<?php } ?>
										<?php if ($option['type'] == 'text') { ?>
										<div class="form-group">
											<label><?php if ($option['required']) { ?><span class="required">*</span><?php } ?><?php echo $option['name']; ?></label>
											<input type="text" name="order_product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" class="form-control" value="<?php echo $option['option_value']; ?>" />
											<?php if ($option['alarm']) { ?>
												<span class="text-danger"><?php echo $text_alarm_options; ?></span>
											<?php } ?>
										</div>
										<?php } ?>
										<?php if ($option['type'] == 'textarea') { ?>
										<div class="form-group">
											<label><?php if ($option['required']) { ?><span class="required">*</span><?php } ?><?php echo $option['name']; ?></label>
											<textarea name="order_product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" rows="2" class="form-control"><?php echo $option['option_value']; ?></textarea>
											<?php if ($option['alarm']) { ?>
												<span class="text-danger"><?php echo $text_alarm_options; ?></span>
											<?php } ?>
										</div>
										<?php } ?>
										<?php if ($option['type'] == 'file') { ?>
										<div class="form-group">
											<label><?php if ($option['required']) { ?><span class="required">*</span><?php } ?><?php echo $option['name']; ?></label>
											<div class="btn-group btn-group-sm upfile-block">
												<a id="file-link-<?php echo $option['product_option_id']; ?>-<?php echo $product_row; ?>" class="btn btn-default file-link" data-toggle="tooltip" title="<?php echo $text_download; ?>"<?php if ($option['href']) { ?> href="<?php echo $option['href']; ?>"<?php } ?>><?php echo $option['option_filename']; ?></a>
												<input type="hidden" name="order_product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
												<a id="button-upload-<?php echo $option['product_option_id']; ?>-<?php echo $product_row; ?>" class="btn btn-primary" data-toggle="tooltip" title="<?php echo $text_upload; ?>"><i class="fa fa-upload"></i></a>
											</div>
											<?php if ($option['alarm']) { ?>
												<span class="text-danger"><?php echo $text_alarm_options; ?></span>
											<?php } ?>
										</div>
										<?php } ?>
										<?php if ($option['type'] == 'date') { ?>
										<div class="form-group">
											<label><?php if ($option['required']) { ?><span class="required">*</span><?php } ?><?php echo $option['name']; ?></label>
											<div class="input-group input-group-sm date">
												<input type="text" name="order_product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" class="form-control" value="<?php echo $option['option_value']; ?>" data-date-format="YYYY-MM-DD" />
												<span class="input-group-btn"><a class="btn btn-default" role="button"><i class="fa fa-calendar"></i></a></span>
											</div>
											<?php if ($option['alarm']) { ?>
												<span class="text-danger"><?php echo $text_alarm_options; ?></span>
											<?php } ?>
										</div>
										<?php } ?>
										<?php if ($option['type'] == 'datetime') { ?>
										<div class="form-group">
											<label><?php if ($option['required']) { ?><span class="required">*</span><?php } ?><?php echo $option['name']; ?></label>
											<div class="input-group input-group-sm datetime">
												<input type="text" name="order_product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" class="form-control" value="<?php echo $option['option_value']; ?>" data-date-format="YYYY-MM-DD HH:mm" />
												<span class="input-group-btn"><a class="btn btn-default" role="button"><i class="fa fa-calendar"></i></a></span>
											</div>
											<?php if ($option['alarm']) { ?>
												<span class="text-danger"><?php echo $text_alarm_options; ?></span>
											<?php } ?>
										</div>
										<?php } ?>
										<?php if ($option['type'] == 'time') { ?>
										<div class="form-group">
											<label><?php if ($option['required']) { ?><span class="required">*</span><?php } ?><?php echo $option['name']; ?></label>
											<div class="input-group input-group-sm time">
												<input type="text" name="order_product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" class="form-control" value="<?php echo $option['option_value']; ?>" data-date-format="HH:mm" />
												<span class="input-group-btn"><a class="btn btn-default" role="button"><i class="fa fa-calendar"></i></a></span>
											</div>
											<?php if ($option['alarm']) { ?>
												<span class="text-danger"><?php echo $text_alarm_options; ?></span>
											<?php } ?>
										</div>
										<?php } ?>
									<?php } ?>
									</div>
								<?php } ?>
								<?php if (!empty($order_product['info_option'])) { ?>
									<div class="info-options span-popover<?php if ($order_product['alarm_options']) { ?> alarm<?php } ?>" data-placement="right" data-html="true" title="<?php echo $text_order_options; ?>" data-content="<?php echo $order_product['info_option']; ?>"><i class="fa fa-2x fa-exclamation-circle"></i></div>
								<?php } ?>
								</div>
							</td>
							<td class="center"<?php echo $hide_model; ?>><input type="text" name="order_product[<?php echo $product_row; ?>][model]" value="<?php echo $order_product['model']; ?>" class="form-control input-model" /></td>
							<td class="center"<?php echo $hide_sku; ?>><input type="text" name="order_product[<?php echo $product_row; ?>][sku]" value="<?php echo $order_product['sku']; ?>" class="form-control input-sku" /></td>
							<td class="center"<?php echo $hide_upc; ?>><input type="text" name="order_product[<?php echo $product_row; ?>][upc]" value="<?php echo $order_product['upc']; ?>" class="form-control input-upc" /></td>
							<td class="center"<?php echo $hide_ean; ?>><input type="text" name="order_product[<?php echo $product_row; ?>][ean]" value="<?php echo $order_product['ean']; ?>" class="form-control input-ean" /></td>
							<td class="center"<?php echo $hide_jan; ?>><input type="text" name="order_product[<?php echo $product_row; ?>][jan]" value="<?php echo $order_product['jan']; ?>" class="form-control input-jan" /></td>
							<td class="center"<?php echo $hide_isbn; ?>><input type="text" name="order_product[<?php echo $product_row; ?>][isbn]" value="<?php echo $order_product['isbn']; ?>" class="form-control input-isbn" /></td>
							<td class="center"<?php echo $hide_mpn; ?>><input type="text" name="order_product[<?php echo $product_row; ?>][mpn]" value="<?php echo $order_product['mpn']; ?>" class="form-control input-mpn" /></td>
							<td class="center"<?php echo $hide_location; ?>><input type="text" name="order_product[<?php echo $product_row; ?>][location]" value="<?php echo $order_product['location']; ?>" class="form-control input-location" /></td>
							<td class="right product-weight"<?php echo $hide_weight; ?>><input type="text" name="order_product[<?php echo $product_row; ?>][weight]" value="<?php echo $order_product['weight']; ?>" readonly="readonly" /></td>
							<td class="center product-quantity"><input type="text" name="order_product[<?php echo $product_row; ?>][quantity]" value="<?php echo $order_product['quantity']; ?>" class="form-control" /></td>
							<td class="center"<?php echo $hide_realqty; ?>><span id="realquantity_<?php echo $product_row; ?>"><?php echo $order_product['realquantity']; ?></span></td>
							<td class="right product-price"><div class="input-group input-group-sm">
								<input type="text" name="order_product[<?php echo $product_row; ?>][price]" value="<?php echo $order_product['price']; ?>" class="form-control input-price" />
								<span class="input-group-addon price-empty" data-toggle="tooltip" title="<?php echo $help_empty_price; ?>"></span></div>
							</td>
							<td class="right now_price"<?php echo $hide_nowprice; ?>>
								<span id="now_price_<?php echo $product_row; ?>"><?php echo $order_product['now_price']; ?></span>
								<span id="now_special_<?php echo $product_row; ?>" style="color:red;"><?php echo $order_product['now_special']; ?></span>
								<span id="now_discount_<?php echo $product_row; ?>" style="color:blue;"><?php echo $order_product['now_discount_qty']; ?>/<?php echo $order_product['now_discount']; ?></span>
							</td>
							<td class="right product-total"><input type="text" name="order_product[<?php echo $product_row; ?>][total]" value="<?php echo $order_product['total']; ?>" readonly="readonly" /></td>
							<td class="right product-discount"<?php echo $hide_discount; ?>>
								<div class="input-group input-group-sm">
									<input type="text" name="order_product[<?php echo $product_row; ?>][discount_amount]" value="<?php echo $order_product['discount_amount']; ?>" class="form-control input-amount<?php if($order_product['discount_amount'] > 0) { ?> has-amount<?php } ?>" />
									<select name="order_product[<?php echo $product_row; ?>][discount_type]" class="form-control<?php if($order_product['discount_amount'] > 0) { ?> has-amount<?php } ?>">
										<?php if ($order_product['discount_type'] == 'S') { ?>
											<option value="S" selected="selected">S</option>
											<option value="P">%</option>
										<?php } else { ?>
											<option value="P" selected="selected">%</option>
											<option value="S">S</option>
										<?php } ?>
									</select><span class="input-group-addon amount-empty" data-toggle="tooltip" title="<?php echo $help_empty_discount; ?>"></span>
								</div>
							</td>
							<td class="right product-reward"<?php echo $hide_reward; ?>><input type="text" name="order_product[<?php echo $product_row; ?>][reward]" value="<?php echo $order_product['reward']; ?>" readonly="readonly" /></td>
							<td class="center premove"><a onclick="$('#product-row<?php echo $product_row; ?>').remove();" class="btn btn-danger btn-sm" role="button"><i class="fa fa-minus-circle"></i></a></td>
						</tr>
					</tbody>
					<?php $product_row++; ?>
					<?php } ?>
					<tfoot>
						<tr class="total-line">
							<td class="left cart-colspan" colspan="<?php echo $cart_colspan; ?>"></td>
							<td class="right cart-weight"<?php echo $hide_weight; ?>><input type="text" id="weight_cart" value="<?php echo $weight_cart; ?>" readonly="readonly" /></td>
							<td class="right cart-items"><input type="text" id="items_cart" value="<?php echo $items_cart; ?>" readonly="readonly" /></td>
							<td class="left" colspan="<?php echo $tline_colspan; ?>"></td>
							<td class="right cart-total"><input type="text" id="total_cart" value="<?php echo $total_cart; ?>" readonly="readonly" /></td>
							<td class="right cart-discount"<?php echo $hide_discount; ?>><input type="text" id="discount_cart" value="<?php echo $discount_cart; ?>" readonly="readonly" /></td>
							<td class="right cart-reward"<?php echo $hide_reward; ?>><input type="text" id="reward_cart" value="<?php echo $reward_cart; ?>" readonly="readonly" /></td>
							<td class="center cart-add"><a onclick="addProduct();" class="btn btn-primary btn-sm" role="button"><i class="fa fa-plus-circle"></i></a></td>
						</tr>
					</tfoot>
				</table>
	
				<?php if ($customer_id && $reward_status) { ?>
				<div id="order-reward">
					<div class="reward-blocks">
						<div class="row">
							<div class="col-md-3 col-xs-6">
								<div class="input-group input-group-sm">
									<span class="input-group-addon dop-title"><?php echo $entry_reward_total; ?></span>
									<span class="input-group-addon form-control" id="reward-total"><span class="rtotal"><?php echo $reward_total; ?></span>/<span class="ptotal"><?php echo $reward_possibly; ?></span></span>
								</div>
							</div>
							<div class="col-md-3 col-xs-6">
								<div class="input-group input-group-sm">
									<span class="input-group-addon dop-title"><?php echo $entry_reward_recived; ?></span>
									<span class="input-group-addon form-control" id="reward-recived"><?php echo $reward_recived; ?></span>
									<div class="input-group-btn">
										<a id="reward-remove" class="btn btn-danger" role="button"><i class="fa fa-minus-circle fa-lg"></i></a>
									</div>
									<span class="input-group-addon span-popover" data-placement="left" title="<?php echo $help_reward_removed_head; ?>" data-content="<?php echo $help_reward_removed; ?>"><i class="fa fa-question-circle fa-lg fa-primary" aria-hidden="true"></i></span>
								</div>
							</div>
							<div class="col-md-3 col-xs-6">
								<div class="input-group input-group-sm">
									<span class="input-group-addon dop-title"><?php echo $entry_reward; ?></span>
									<input type="text" name="reward_cart" class="form-control" value="<?php echo $reward_cart; ?>" />
									<div class="input-group-btn">
										<a id="reward-add" class="btn btn-success" role="button"><i class="fa fa-plus-circle fa-lg"></i></a>
									</div>
									<span class="input-group-addon span-popover" data-placement="left" title="<?php echo $help_reward_add_head; ?>" data-content="<?php echo $help_reward_add; ?>"><i class="fa fa-question-circle fa-lg fa-primary" aria-hidden="true"></i></span>
								</div>
							</div>
							<div class="col-md-3 col-xs-6">
								<div class="input-group input-group-sm">
									<span class="input-group-addon dop-title"><?php echo $entry_reward_use; ?></span>
									<input type="text" name="reward_use" class="form-control" value="<?php echo $reward_use; ?>" />
									<span class="input-group-addon" id="rewards-available"><span class="reward-use"></span></span>
									<span class="input-group-addon span-popover" data-placement="left" title="" data-content="<?php echo $help_reward_use; ?>"><i class="fa fa-question-circle fa-lg fa-danger" aria-hidden="true"></i></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<?php } ?>
	
				<?php if ($coupon_status || $voucher_status || ($order_id && ($show_affiliate || $affiliate))) { ?>
				<div id="order-dops">
					<div class="dop-blocks">
						<div class="row">
							<div class="col-md-3 col-xs-6">
							<?php if ($coupon_status) { ?>
								<div class="input-group input-group-sm">
									<span class="input-group-addon dop-title"><?php echo $entry_coupon; ?></span>
									<input type="text" name="coupon_code" class="form-control" placeholder="(autocomplete)" value="<?php echo $coupon_code; ?>" />
									<span class="input-group-addon span-popover" data-placement="left" title="<?php echo $help_coupon_head; ?>" data-content="<?php echo $help_coupon; ?>"><i class="fa fa-question-circle fa-lg fa-primary" aria-hidden="true"></i></span>
									<span class="input-group-addon span-popover" data-placement="left" title="" data-content="<?php echo $help_coupon_use; ?>"><i class="fa fa-question-circle fa-lg fa-danger" aria-hidden="true"></i></span>
								</div>
							<?php } ?>
							</div>
							<div class="col-md-4 col-xs-6">
							<?php if ($voucher_status) { ?>
								<div class="input-group input-group-sm">
									<span class="input-group-addon dop-title"><?php echo $entry_voucher; ?></span>
									<input type="text" name="voucher_code" class="form-control" placeholder="(autocomplete)" value="<?php echo $voucher_code; ?>" />
									<span class="input-group-addon span-popover" data-placement="left" title="<?php echo $help_voucher_head; ?>" data-content="<?php echo $help_voucher; ?>"><i class="fa fa-question-circle fa-lg fa-primary" aria-hidden="true"></i></span>
									<span class="input-group-addon span-popover" data-placement="left" title="" data-content="<?php echo $help_voucher_use; ?>"><i class="fa fa-question-circle fa-lg fa-danger" aria-hidden="true"></i></span>
								</div>
							<?php } ?>
							</div>
							<div class="col-md-5 col-xs-12">
							<?php if ($order_id && ($show_affiliate || $affiliate)) { ?>
								<div class="input-group input-group-sm">
									<span class="input-group-addon dop-title"><?php echo $entry_affiliate; ?></span>
									<input type="text" name="affiliate" class="form-control" placeholder="(autocomplete)" value="<?php echo $affiliate; ?>" />
									<input type="hidden" name="affiliate_id" value="<?php echo $affiliate_id; ?>" />
									<input type="hidden" name="commission" value="<?php echo $commission; ?>" />
									<div class="input-group-btn commission-add"<?php if ($commission_total) { ?> style="display:none;"<?php } ?>>
										<a id="commission_add" title="" class="btn btn-success" role="button"><i class="fa fa-plus-circle fa-lg"></i></a>
									</div>
									<span class="input-group-addon span-popover commission-add" data-placement="left" title="<?php echo $help_commission_add_head; ?>" data-content="<?php echo $help_commission_add; ?>"<?php if ($commission_total) { ?> style="display:none;"<?php } ?>><i class="fa fa-question-circle fa-lg fa-primary" aria-hidden="true"></i></span>
									<div class="input-group-btn commission-remove"<?php if (!$commission_total) { ?> style="display:none;"<?php } ?>>
										<a id="commission_remove" title="" class="btn btn-danger" role="button"><i class="fa fa-minus-circle fa-lg"></i></a>
									</div>
									<span class="input-group-addon span-popover commission-remove" data-placement="left" title="<?php echo $help_commission_add_head; ?>" data-content="<?php echo $help_commission_remove_head; ?>"<?php if (!$commission_total) { ?> style="display:none;"<?php } ?>><i class="fa fa-question-circle fa-lg fa-primary" aria-hidden="true"></i></span>
									<span class="input-group-addon commission-value"><?php echo $commission_order; ?></span>
								</div>
							<?php } ?>
							</div>
						</div>
					</div>
				</div>
				<?php } ?>
	
				<div id="payment_shipping">
					<div class="payship-blocks">
						<div class="row">
							<div class="col-md-5 col-sm-5 col-xs-6">
								<div class="input-group input-group-sm">
									<span class="input-group-addon"><span class="dop-title hidden-xs"><?php echo $entry_payment; ?></span><i class="fa fa-credit-card hidden-lg hidden-md hidden-sm" aria-hidden="true"></i></span>
									<input type="hidden" name="payment_method" value="<?php echo $payment_method; ?>" />
									<input type="hidden" name="payment_code" value="<?php echo $payment_code; ?>" />
									<select name="payments" class="form-control">
									<option value=""><?php echo $text_select; ?></option>
									<?php if ($payment_code) { ?>
										<option value="<?php echo $payment_code; ?>" selected="selected"><?php echo $payment_method; ?></option>
									<?php } ?>
									</select>
								</div>
								<div class="input-group input-group-sm">
									<span class="input-group-addon"><span class="dop-title hidden-xs"><?php echo $entry_now_payment; ?></span><i class="fa fa-credit-card hidden-lg hidden-md hidden-sm" aria-hidden="true"></i></span>
									<span class="input-group-addon form-control" id="now_payment_method"><?php echo $payment_method; ?></span>
								</div>
							</div>
							<div class="col-md-5 col-sm-5 col-xs-6 pull-right">
								<div class="input-group input-group-sm">
									<span class="input-group-addon"><span class="dop-title hidden-xs"><?php echo $entry_shipping; ?></span><i class="fa fa-truck hidden-lg hidden-md hidden-sm"></i></span>
									<input type="hidden" name="shipping_method" value="<?php echo $shipping_method; ?>" />
									<input type="hidden" name="shipping_code" value="<?php echo $shipping_code; ?>" />
									<select name="shippings" class="form-control">
									<option value=""><?php echo $text_select; ?></option>
									<?php if ($shipping_code) { ?>
										<option value="<?php echo $shipping_code; ?>" selected="selected"><?php echo $shipping_method; ?></option>
									<?php } ?>
									</select>
								</div>
								<div class="input-group input-group-sm">
									<span class="input-group-addon"><span class="dop-title hidden-xs"><?php echo $entry_now_shipping; ?></span><i class="fa fa-truck hidden-lg hidden-md hidden-sm"></i></span>
									<span class="input-group-addon form-control" id="now_shipping_method"><?php echo $shipping_method; ?></span>
								</div>
							</div>
							<div class="col-md-2 col-sm-2 col-xs-12 pull-right text-center">
								<div class="btn-group btn-group-sm">
									<a onclick="getMethods();" class="btn btn-primary" role="button"><span class="hidden-sm"><?php echo $button_getmethods; ?></span><i class="fa fa-refresh hidden-lg hidden-md hidden-xs"></i></a>
									<a tabindex="0" class="btn btn-primary btn-popover" data-placement="right" title="<?php echo $help_getmethods_head; ?>" data-content="<?php echo $help_getmethods; ?>" role="button"><i class="fa fa-question-circle fa-lg" aria-hidden="true"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
	
				<div id="total" class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<td class="text-center total-title"><?php echo $column_desc; ?></td>
								<td class="text-center total-value"><?php echo $column_cost; ?></td>
								<td class="text-center total-text"><?php echo $column_total; ?></td>
								<td class="text-center total-nocalc">
									<span class="hidden-sm hidden-xs" style="margin-right:3px;"><?php echo $column_nocalc; ?></span>
									<a tabindex="0" class="btn btn-primary btn-xs btn-popover" data-placement="left" title="<?php echo $help_nocalc_head; ?>" data-content="<?php echo $help_nocalc; ?>" role="button"><i class="fa fa-question-circle" aria-hidden="true"></i></a>
								</td>
								<td class="text-center total-sort"><?php echo $column_sort; ?></td>
								<td class="total-delete"></td>
							</tr>
						</thead>
						<tbody>
						<?php $total_row = 0; ?>
						<?php foreach ($order_totals as $order_total) { ?>
							<tr id="total-row<?php echo $total_row; ?>">
								<td>
									<input type="hidden" name="order_total[<?php echo $total_row; ?>][order_total_id]" value="<?php echo $order_total['order_total_id']; ?>" />
									<input type="hidden" name="order_total[<?php echo $total_row; ?>][code]" value="<?php echo $order_total['code']; ?>" />
									<input type="text" name="order_total[<?php echo $total_row; ?>][title]" class="form-control input-total-title" value="<?php echo $order_total['title']; ?>" />
								</td>
								<td class="text-right">
									<input type="hidden" name="order_total[<?php echo $total_row; ?>][text]" value="<?php echo $order_total['text']; ?>" />
									<?php if (($order_total['code'] == 'sub_total') || ($order_total['code'] == 'total')) { ?>
										<input type="hidden" name="order_total[<?php echo $total_row; ?>][value]" value="<?php echo $order_total['value']; ?>" />
									<?php } else { ?>
										<input type="text" name="order_total[<?php echo $total_row; ?>][value]" class="form-control input-total-value" value="<?php echo $order_total['value']; ?>" />
									<?php } ?>
								</td>
								<td class="text-right order-total-value"><?php echo $order_total['text']; ?></td>
								<td class="text-center">
									<?php if ($order_total['code'] == 'shipping') { ?>
										<input class="no_calc" type="checkbox" name="<?php echo $order_total['code']; ?>" value="0" checked="checked" />
									<?php } elseif ((strpos($order_total['code'], 'correct,') !== false) || ($order_total['code'] == 'discount')) { ?>
										<input class="no_calc" type="checkbox" name="<?php echo $order_total['code']; ?>" value="0" disabled="disabled" />
									<?php } else { ?>
										<input class="no_calc" type="checkbox" name="<?php echo $order_total['code']; ?>" value="0" />
									<?php } ?>
								</td>
								<td class="text-center">
									<?php if ((strpos($order_total['code'], 'correct,') !== false) || ($order_total['code'] == 'discount')) { ?>
										<input type="text" name="order_total[<?php echo $total_row; ?>][sort_order]" class="form-control input-total-sort" value="<?php echo $order_total['sort_order']; ?>" readonly="readonly" />
									<?php } else { ?>
										<input type="text" name="order_total[<?php echo $total_row; ?>][sort_order]" class="form-control input-total-sort" value="<?php echo $order_total['sort_order']; ?>" />
									<?php } ?>
								</td>
								<td class="text-right">
									<a onclick="$('#total-row<?php echo $total_row; ?>').remove();" class="btn btn-danger btn-sm" role="button"><?php echo $button_remove; ?></a>
								</td>
							</tr>
						<?php $total_row++; ?>
						<?php } ?>
						</tbody>
						<?php if ($is_admin) { ?>
						<tfoot>
							<tr><td class="left message" colspan="6"></td></tr>
							<tr class="actions-buttons">
								<td></td>
								<td class="text-right" colspan="2">
									<div class="btn-group btn-group-sm">
										<a onclick="addCorrect();" class="btn btn-primary" role="button"><?php echo $button_correct; ?></a>
										<a tabindex="0" class="btn btn-primary btn-popover" data-placement="left" title="<?php echo $help_correct_head; ?>" data-content="<?php echo $help_correct; ?>" role="button"><i class="fa fa-question-circle" aria-hidden="true"></i></a>
									</div>
								</td>
								<td class="text-right" colspan="2">
									<div class="btn-group btn-group-sm">
										<a onclick="addDiscount();" class="btn btn-primary" role="button"><?php echo $button_discount; ?></a>
										<a tabindex="0" class="btn btn-primary btn-popover" data-placement="left" title="<?php echo $help_discount_head; ?>" data-content="<?php echo $help_discount; ?>" role="button"><i class="fa fa-question-circle" aria-hidden="true"></i></a>
									</div>
								</td>
								<td class="text-right">
									<div class="btn-group btn-group-sm">
									<?php if (!$status_del_warning) { ?>
										<a id="recalc-button" onclick="recalculate();" class="btn btn-success" role="button"><?php echo $button_recalculate; ?></a>
										<a tabindex="0" class="btn btn-success btn-popover" data-placement="left" title="<?php echo $help_recalculate_head; ?>" data-content="<?php echo $help_recalculate; ?>" role="button"><i class="fa fa-question-circle" aria-hidden="true"></i></a>
									<?php } else { ?>
										<a id="recalc-button" class="btn btn-default" role="button"><?php echo $button_recalculate; ?></a>
										<a tabindex="0" class="btn btn-danger btn-popover" data-placement="left" title="<?php echo $help_recalculate_head; ?>" data-content="<?php echo $help_recalculate_bad; ?>" role="button"><i class="fa fa-question-circle" aria-hidden="true"></i></a>
									<?php } ?>
									</div>
								</td>
							</tr>
						</tfoot>
						<?php } ?>
					</table>
				</div>
				<?php if ($is_admin) { ?>
				<div class="bottom-buttons">
					<div class="pull-left version"><a href="https://opencart-group.ru/orderpro_v2" target="_blank"><?php echo $orderpro_version; ?></a></div>
					<div class="pull-right buttons">
						<a href="<?php echo $setting; ?>" data-toggle="tooltip" title="<?php echo $button_setting_tooltip; ?>" class="btn btn-default btn-sm"><i class="fa fa-cog" aria-hidden="true"></i></a>
						<span class="term-button">|</span>
						<?php if ($order_id) { ?>
							<a onclick="window.open('<?php echo $invoice; ?>&order_id=<?php echo $order_id; ?>');" data-toggle="tooltip" title="<?php echo $button_invoce_tooltip; ?>" class="btn btn-primary btn-sm"><i class="fa fa-print" aria-hidden="true"></i></a>
							<a onclick="clone_order();" data-toggle="tooltip" title="<?php echo $button_clone_tooltip; ?>" class="btn btn-primary btn-sm"><i class="fa fa-copy" aria-hidden="true"></i></a>
							<span class="term-button">|</span>
						<?php } ?>
						<a onclick="apple_order();" data-toggle="tooltip" title="<?php echo $button_apply_tooltip; ?>" class="btn btn-primary btn-sm"><i class="fa fa-save" aria-hidden="true"></i></a>
						<a onclick="$('#order_form').submit();" data-toggle="tooltip" title="<?php echo $button_save_tooltip; ?>" class="btn btn-success btn-sm"><i class="fa fa-save" aria-hidden="true"></i></a>
						<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel_tooltip; ?>" class="btn btn-danger btn-sm"><i class="fa fa-reply" aria-hidden="true"></i></a>
					</div>
				</div>
				<?php } ?>
			</div>
	
			<?php if ($orderpro_notabs_mode) { ?>
			</div>
			<?php } ?>
	
		</div>
		<span class="end-form"></span>
		</form>
	</div>
	
	</div>
	</div>
<?php if ($show_model || $show_sku || $show_upc || $show_ean || $show_jan || $show_isbn || $show_mpn || $show_location || $show_image) { ?>
<style>@media (max-width:1199px) {td.column-product{width:400px;min-width:150px;}}</style>
<?php } ?>
<div id="similar_block"></div>
<div id="shoverlay"><img src="view/image/orderpro/load-line.gif" alt="" /></div>
<script type="text/javascript"><!--
if ($('#product .info-options.alarm').length > 0) {
	$('#content.orderpro-content > .container-fluid').prepend('<div class="alert alert-warning"><i class="fa fa-check-circle"></i> <?php echo $error_order_options; ?></div>');
}
$('#product .info-options.alarm').each(function(index, element) {
	$(element).parent().find('.poptions').addClass('alarm');
});
$('#product').on('click', '.product-popap', function() {
	var imgsrc = $(this).attr('data-popap');
	$.colorbox({
		maxWidth: "85%",
		maxHeight: "85%",
		href: imgsrc
	});
});
$('input[name=\'firstname\']').blur(function() {
	var firstname = $('input[name=\'firstname\']').val();
	var shipping_firstname = $('input[name=\'shipping_firstname\']').val();
	$('input[name=\'payment_firstname\']').val(firstname);
	if ((shipping_firstname.length < 1) || (shipping_firstname == '<?php echo $text_noname; ?>')) {
	   $('input[name=\'shipping_firstname\']').val(firstname);
	}
});
$('input[name=\'lastname\']').blur(function() {
	var lastname = $('input[name=\'lastname\']').val();
	var shipping_lastname = $('input[name=\'shipping_lastname\']').val();
	$('input[name=\'payment_lastname\']').val(lastname);
	if (shipping_lastname.length < 1) {
	   $('input[name=\'shipping_lastname\']').val(lastname);
	}
});
$('input[name=\'payment_company\']').blur(function() {
	var payment_company = $('input[name=\'payment_company\']').val();
	$('input[name=\'shipping_company\']').val(payment_company);
});
$('input[name=\'shipping_address_1\']').blur(function() {
	var shipping_address_1 = $('input[name=\'shipping_address_1\']').val();
	$('input[name=\'payment_address_1\']').val(shipping_address_1);
});
$('input[name=\'shipping_address_2\']').blur(function() {
	var shipping_address_2 = $('input[name=\'shipping_address_2\']').val();
	$('input[name=\'payment_address_2\']').val(shipping_address_2);
});
$('input[name=\'shipping_city\']').blur(function() {
	var shipping_city = $('input[name=\'shipping_city\']').val();
	$('input[name=\'payment_city\']').val(shipping_city);
});
$('input[name=\'shipping_postcode\']').blur(function() {
	var shipping_postcode = $('input[name=\'shipping_postcode\']').val();
	$('input[name=\'payment_postcode\']').val(shipping_postcode);
});

$('#button-registered').on('click', function() {
	$.ajax({
		url: 'index.php?route=sale/orderpro/createCustomer&token=<?php echo $token; ?>',
		type: 'post',
		data: $('#tab-payment :input, #tab-order :input'),
		dataType: 'json',
		beforeSend: function() {
			$('#notifications').empty();
		},
		success: function(json) {
			if (json['error_warning']) {
				var html = '';
				$.each(json['error_warning'], function(key, item) {
					html += '<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + item + '<button type="button" class="close" data-dismiss="alert" aria-label="Close">&times;</button></div>';
				});
				$('#notifications').append(html);
			}
			if (json['success']) {
				$('#notifications').append('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert" aria-label="Close">&times;</button></div>');
				setTimeout (function() {$('#notifications .alert-success').fadeOut('slow', function() {$(this).remove();});}, 3000);
				$('#button-registered').removeClass('btn-primary').addClass('btn-default').removeAttr('id');
				$('input[name=\'customer_id\']').val(json['customer_id']);
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

var shipping_zone_id = '<?php echo $shipping_zone_id; ?>';

$('select[name=\'shipping_zone_id\']').on('change', function() {
	$('input[name=\'payment_zone_id\']').val(this.value);
});

$('select[name=\'shipping_country_id\']').on('change', function() {
	$('input[name=\'payment_country_id\']').val(this.value);
	if (this.value) {
		$.ajax({
			url: 'index.php?route=sale/orderpro/country&token=<?php echo $token; ?>&country_id=' + this.value,
			dataType: 'json',
			beforeSend: function() {
				$('select[name=\'shipping_country_id\']').css('opacity', '0.5');
			},
			complete: function() {
				$('select[name=\'shipping_country_id\']').css('opacity', '1');
			},
			success: function(json) {
				if (json['postcode_required'] == '1') {}
				
				html = '<option value="0"><?php echo $text_select; ?></option>';
				
				if (json != '' && json['zone'] != '') {
					for (i = 0; i < json['zone'].length; i++) {
						html += '<option value="' + json['zone'][i]['zone_id'] + '"';
						
						if (json['zone'][i]['zone_id'] == shipping_zone_id) {
							html += ' selected="selected"';
						}
		
						html += '>' + json['zone'][i]['name'] + '</option>';
					}
				} else {
					html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
				}
				
				$('select[name=\'shipping_zone_id\']').html(html);
				$('select[name=\'shipping_zone_id\']').trigger('change');
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	} else {
		html = '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
	
		$('select[name=\'shipping_zone_id\']').html(html);
		$('select[name=\'shipping_zone_id\']').trigger('change');
	}
});

$('select[name=\'shipping_country_id\']').trigger('change');

$('select[name=\'shipping_address\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=sale/orderpro/customerAddress&token=<?php echo $token; ?>&address_id=' + this.value,
		dataType: 'json',
		success: function(json) {
			if (json != '') {
				$('input[name=\'shipping_firstname\']').val(json['firstname']);
				$('input[name=\'shipping_lastname\']').val(json['lastname']);
				$('input[name=\'shipping_company\']').val(json['company']);
				$('input[name=\'shipping_address_1\']').val(json['address_1']);
				$('input[name=\'shipping_address_2\']').val(json['address_2']);
				$('input[name=\'shipping_city\']').val(json['city']);
				$('input[name=\'shipping_postcode\']').val(json['postcode']);
				$('select[name=\'shipping_country_id\']').val(json['country_id']);
				
				shipping_zone_id = json['zone_id'];
				
				$('select[name=\'shipping_country_id\']').trigger('change');

				$('input[name=\'payment_firstname\']').val(json['firstname']);
				$('input[name=\'payment_lastname\']').val(json['lastname']);
				$('input[name=\'payment_company\']').val(json['company']);
				$('input[name=\'payment_address_1\']').val(json['address_1']);
				$('input[name=\'payment_address_2\']').val(json['address_2']);
				$('input[name=\'payment_city\']').val(json['city']);
				$('input[name=\'payment_postcode\']').val(json['postcode']);
				$('input[name=\'payment_country_id\']').val(json['country_id']);
				$('input[name=\'payment_zone_id\']').val(json['zone_id']);
				
				for (i in json['custom_field']) {
					$('#csfield-shipping select[name=\'shipping_custom_field[' + i + ']\']').val(json['custom_field'][i]);
					$('#csfield-shipping textarea[name=\'shipping_custom_field[' + i + ']\']').val(json['custom_field'][i]);
					$('#csfield-shipping input[name^=\'shipping_custom_field[' + i + ']\'][type=\'text\']').val(json['custom_field'][i]);
					if (json['custom_field'][i] != '') {
						$('#csfield-shipping a#file-link-' + i).empty().attr('href', 'index.php?route=sale/orderpro/download&token=<?php echo $token; ?>&code=' + json['custom_field'][i]).append('Скачать файл').show('fast');
					}
					$('#csfield-shipping input[name^=\'shipping_custom_field[' + i + ']\'][type=\'hidden\']').val(json['custom_field'][i]);
					$('#csfield-shipping input[name^=\'shipping_custom_field[' + i + ']\'][type=\'radio\'][value=\'' + json['custom_field'][i] + '\']').prop('checked', true);
					$('#csfield-shipping input[name^=\'shipping_custom_field[' + i + ']\'][type=\'checkbox\'][value=\'' + json['custom_field'][i] + '\']').prop('checked', true);

					if (json['custom_field'][i] instanceof Array) {
						for (j = 0; j < json['custom_field'][i].length; j++) {
							$('#csfield-shipping input[name^=\'shipping_custom_field[' + i + ']\'][type=\'checkbox\'][value=\'' + json['custom_field'][i][j] + '\']').prop('checked', true);
						}
					}
				}
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});
//--></script>
<script type="text/javascript"><!--
$('input[name=\'coupon_code\']').autocomplete({
	delay: 500,
	'source': function(request, response) {
		if(request.length >= 1) {
		$.ajax({
			url: 'index.php?route=sale/orderpro/couponAutocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['code']
					}
				}));
			}
		});
		}
	},
	'select': function(item) {
		$(this).val(item['value']);
	}
});

$('input[name=\'voucher_code\']').autocomplete({
	delay: 500,
	'source': function(request, response) {
		if(request.length >= 1) {
		$.ajax({
			url: 'index.php?route=sale/orderpro/voucherAutocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['code']
					}
				}));
			}
		});
		}
	},
	'select': function(item) {
		$(this).val(item['value']);
	}
});

$('input[name=\'customer\']').autocomplete({
	delay: 500,
	'source': function(request, response) {
		if(request.length >= 1) {
			$.ajax({
				url: 'index.php?route=sale/orderpro/customerAutocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
					return {
						category: item['customer_group'],
						label: item['name'],
						value: item['customer_id'],
						customer_group_id: item['customer_group_id'],
						firstname: item['firstname'],
						lastname: item['lastname'],
						email: item['email'],
						telephone: item['telephone'],
						fax: item['fax'],
						virtual_customer_id: item['virtual_customer_id'],
						custom_field: item['custom_field'],
						address: item['address']
						}
					}));
				}
			});
		}
	},
	'select': function(item) {
		$('input[name=\'customer\']').val(item['label']);
		$('input[name=\'customer_id\']').val(item['value']);
		$('input[name=\'firstname\']').val(item['firstname']);
		$('input[name=\'lastname\']').val(item['lastname']);
		$('input[name=\'email\']').val(item['email']);
		$('input[name=\'telephone\']').val(item['telephone']);
		$('input[name=\'fax\']').val(item['fax']);
		$('input[name=\'virtual_customer_id\']').val(item['virtual_customer_id']);
	
		for (i in item.custom_field) {
			$('#csfield-account select[name=\'custom_field[' + i + ']\']').val(item.custom_field[i]);
			$('#csfield-account textarea[name=\'custom_field[' + i + ']\']').val(item.custom_field[i]);
			$('#csfield-account input[name^=\'custom_field[' + i + ']\'][type=\'text\']').val(item.custom_field[i]);
			if (item.custom_field[i] != '') {
				$('#csfield-account a#file-link-' + i).empty().attr('href', 'index.php?route=sale/orderpro/download&token=<?php echo $token; ?>&code=' + item.custom_field[i]).append('Скачать файл').show('fast');
			}
			$('#csfield-account input[name^=\'custom_field[' + i + ']\'][type=\'hidden\']').val(item.custom_field[i]);
			$('#csfield-account input[name^=\'custom_field[' + i + ']\'][type=\'radio\'][value=\'' + item.custom_field[i] + '\']').prop('checked', true);
	
			if (item.custom_field[i] instanceof Array) {
				for (j = 0; j < item.custom_field[i].length; j++) {
					$('#csfield-account input[name^=\'custom_field[' + i + ']\'][type=\'checkbox\'][value=\'' + item.custom_field[i][j] + '\']').prop('checked', true);
				}
			}
		}
	
		html = '<option value="0"><?php echo $text_none; ?></option>'; 
	
		for (i in  item['address']) {
			html += '<option value="' + item['address'][i]['address_id'] + '">' + item['address'][i]['firstname'] + ' ' + item['address'][i]['lastname'] + ', ' + item['address'][i]['address_1'] + ', ' + item['address'][i]['city'] + ', ' + item['address'][i]['zone'] + '</option>';
		}
	
		$('select[name=\'shipping_address\']').html(html);
	
		$('input[name=\'customer_group_id\']').val(item['customer_group_id']);
		controlReward();
	}
});

$('input[name=\'affiliate\']').autocomplete({
	delay: 500,
	'source': function(request, response) {
		if(request.length >= 1) {
		$.ajax({
			url: 'index.php?route=marketing/affiliate/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['affiliate_id']
					}
				}));
			}
		});
		}
	},
	'select': function(item) {
		$('input[name=\'affiliate\']').val(item['label']);
		$('input[name=\'affiliate_id\']').val(item['value']);
	}
});
//--></script>
<script type="text/javascript"><!--
var product_row = <?php echo $product_row; ?>;

function addProduct(){
	html='<tbody id="product-row'+product_row+'">';
	html+=' <tr class="product-line">';
	html+='  <td class="center"<?php echo $hide_pid; ?>><input type="text" name="order_product['+product_row+'][product_id]" class="form-control input-pid-'+product_row+'" value="" /></td>';
	html+='  <td class="center"<?php echo $hide_image; ?>><div class="product-image" id="image_'+product_row+'"></div></td>';
	html+='  <td class="center"><input type="text" name="order_product['+product_row+'][name]" value="" class="form-control input-name" /><input type="hidden" name="order_product['+product_row+'][order_product_id]" value="" /><input type="hidden" name="order_product['+product_row+'][tax]" value="" /><input type="hidden" name="order_product['+product_row+'][status]" value="" /><div id="product_options'+product_row+'"></div></td>';
	html+='  <td class="center"<?php echo $hide_model; ?>><input type="text" name="order_product['+product_row+'][model]" value="" class="form-control input-model" /></td>';
	html+='  <td class="center"<?php echo $hide_sku; ?>><input type="text" name="order_product['+product_row+'][sku]" value="" class="form-control input-sku" /></td>';
	html+='  <td class="center"<?php echo $hide_upc; ?>><input type="text" name="order_product['+product_row+'][upc]" value="" class="form-control input-upc" /></td>';
	html+='  <td class="center"<?php echo $hide_ean; ?>><input type="text" name="order_product['+product_row+'][ean]" value="" class="form-control input-ean" /></td>';
	html+='  <td class="center"<?php echo $hide_jan; ?>><input type="text" name="order_product['+product_row+'][jan]" value="" class="form-control input-jan" /></td>';
	html+='  <td class="center"<?php echo $hide_isbn; ?>><input type="text" name="order_product['+product_row+'][isbn]" value="" class="form-control input-isbn" /></td>';
	html+='  <td class="center"<?php echo $hide_mpn; ?>><input type="text" name="order_product['+product_row+'][mpn]" value="" class="form-control input-mpn" /></td>';
	html+='  <td class="center"<?php echo $hide_location; ?>><input type="text" name="order_product['+product_row+'][location]" value="" class="form-control input-location" /></td>';
	html+='  <td class="right product-weight"<?php echo $hide_weight; ?>><input type="text" name="order_product['+product_row+'][weight]" value="" readonly="readonly" /></td>';
	html+='  <td class="center product-quantity"><input type="text" name="order_product['+product_row+'][quantity]" class="form-control" value="1" /></td>';
	html+='  <td class="center"<?php echo $hide_realqty; ?>><span id="realquantity_'+product_row+'"></span></td>';
	html+='  <td class="right product-price"><div class="input-group input-group-sm"><input type="text" name="order_product['+product_row+'][price]" value="" class="form-control input-price" /><span class="input-group-addon price-empty"></span></div></td>';
	html+='  <td class="right now_price"<?php echo $hide_nowprice; ?>><span id="now_price_'+product_row+'"></span><span id="now_special_'+product_row+'" style="color:red;"></span><span id="now_discount_'+product_row+'" style="color:blue;"></span></td>';
	html+='  <td class="right product-total"><input type="text" name="order_product['+product_row+'][total]" value="" readonly="readonly" /></td>';
	html+='  <td class="right product-discount"<?php echo $hide_discount; ?>><div class="input-group input-group-sm"><input type="text" name="order_product['+product_row+'][discount_amount]" value="" class="form-control input-amount" /> ';
	html+='   <select name="order_product['+product_row+'][discount_type]" class="form-control">';
	html+='    <option value="P" selected="selected">%</option>';
	html+='    <option value="S">S</option>';
	html+='   </select><span class="input-group-addon amount-empty"></span></div></td>';
	html+='  <td class="right product-reward"<?php echo $hide_reward; ?>><input type="text" id="reward_'+product_row+'" name="order_product['+product_row+'][reward]" value="" readonly="readonly" /></td>';
	html+='  <td class="center premove"><a onclick="$(\'#product-row'+product_row+'\').remove();" class="btn btn-danger btn-sm" role="button"><i class="fa fa-minus-circle"></i></a></td>';
	html+=' </tr>';
	html+='</tbody>';
	
	$("#product tfoot").before(html);
	
	product_autocomplete(product_row);
	product_row++;
}

function product_autocomplete(product_row) {
	var reqname = '<?php echo $orderpro_autocomplete_type; ?>';
	var cr_group_id = $('input[name=\'customer_group_id\']').val();
	$('#product input.input-pid-' + product_row + ', input[name=\'order_product[' + product_row + '][name]\'], input[name=\'order_product[' + product_row + '][model]\'], input[name=\'order_product[' + product_row + '][sku]\'], input[name=\'order_product[' + product_row + '][upc]\'], input[name=\'order_product[' + 
	product_row + '][ean]\'], input[name=\'order_product[' + product_row + '][jan]\'], input[name=\'order_product[' + product_row + '][isbn]\'], input[name=\'order_product[' + product_row + '][mpn]\'], input[name=\'order_product[' + product_row + '][location]\']').autocomplete({
		delay: 500,
		'source': function(request, response) {
			var requested = $(this).attr('class');
			$.ajax({
				url: 'index.php?route=sale/orderpro/productAutocomplete&token=<?php echo $token; ?>',
				dataType: 'json',
                data: {
					filter_pid: $('input[name=\'order_product[' + product_row + '][product_id]\']').val(),
                    filter_name: $('input[name=\'order_product[' + product_row + '][name]\']').val(),
                    filter_model: $('input[name=\'order_product[' + product_row + '][model]\']').val(),
					filter_sku: $('input[name=\'order_product[' + product_row + '][sku]\']').val(),
					filter_upc: $('input[name=\'order_product[' + product_row + '][upc]\']').val(),
					filter_ean: $('input[name=\'order_product[' + product_row + '][ean]\']').val(),
					filter_jan: $('input[name=\'order_product[' + product_row + '][jan]\']').val(),
					filter_isbn: $('input[name=\'order_product[' + product_row + '][isbn]\']').val(),
					filter_mpn: $('input[name=\'order_product[' + product_row + '][mpn]\']').val(),
					filter_location: $('input[name=\'order_product[' + product_row + '][location]\']').val()
                },
				success: function(data) {
					response($.map(data, function(item) {
						if(reqname){
							var requested_label = item['name'];
						} else {
							if(requested.indexOf('input-model') != -1){
								var requested_label = item['model'];
							} else if(requested.indexOf('input-sku') != -1){
								var requested_label = item['sku'];
							} else if(requested.indexOf('input-upc') != -1){
								var requested_label = item['upc'];
							} else if(requested.indexOf('input-ean') != -1){
								var requested_label = item['ean'];
							} else if(requested.indexOf('input-jan') != -1){
								var requested_label = item['jan'];
							} else if(requested.indexOf('input-isbn') != -1){
								var requested_label = item['isbn'];
							} else if(requested.indexOf('input-mpn') != -1){
								var requested_label = item['mpn'];
							} else if(requested.indexOf('input-location') != -1){
								var requested_label = item['location'];
							} else {
								var requested_label = item['name'];
							}
						}
						return {
							label: requested_label,
                            name: item['name'],
							value: item['product_id'],
							model: item['model'],
							sku: item['sku'],
							upc: item['upc'],
							ean: item['ean'],
							jan: item['jan'],
							isbn: item['isbn'],
							mpn: item['mpn'],
							location: item['location']
						}
					}));
				}
			});
		},
		'complete': function() {},
		'select': function(item) {
			$.ajax({
				url: 'index.php?route=sale/orderpro/getToProduct&product_id=' + item['value'] + '&customer_group_id=' + cr_group_id + '&token=<?php echo $token; ?>',
				dataType: 'json',
				success: function(json) {
				if (json != '') {
					$('input[name=\'order_product[' + product_row + '][product_id]\']').val(json.product_id).attr('readonly', 'readonly').removeClass('input-pid-' + product_row).addClass('input-pid');
					$('input[name=\'order_product[' + product_row + '][name]\']').val(json.name);
					$('input[name=\'order_product[' + product_row + '][model]\']').val(json.model);
					$('input[name=\'order_product[' + product_row + '][sku]\']').val(json.sku);
					$('input[name=\'order_product[' + product_row + '][upc]\']').val(json.upc);
					$('input[name=\'order_product[' + product_row + '][ean]\']').val(json.ean);
					$('input[name=\'order_product[' + product_row + '][jan]\']').val(json.jan);
					$('input[name=\'order_product[' + product_row + '][isbn]\']').val(json.isbn);
					$('input[name=\'order_product[' + product_row + '][mpn]\']').val(json.mpn);
					$('input[name=\'order_product[' + product_row + '][location]\']').val(json.location);
					$('input[name=\'order_product[' + product_row + '][weight]\']').val(json.weight);
					$('#now_price_' + product_row).html(json.price);
					$('#now_special_' + product_row).html(json.special);
					$('#now_discount_' + product_row).html(json.discount_qty + '/' + json.discount);
					$('#realquantity_' + product_row).html(json.quantity);
					$('#image_' + product_row).html('<a href="'+ json.href +'" target="_blank"><img src="'+ json.image +'" alt="'+ json.name +'"></a>');
					if (json.popap) {
						$('#image_' + product_row).append('<span id="popap_'+ product_row +'"></span>');
						$('#popap_' + product_row).addClass('product-popap').attr('data-popap', json.popap);
					}
					$('input[name=\'order_product[' + product_row + '][reward]\']').val(json.reward);
					$('input[name=\'order_product[' + product_row + '][status]\']').val(json.status);
	
					if (json.option != '') {
						html = '<div class="poptions">';
			
						for (i = 0; i < json.option.length; i++) {
							option = json.option[i];
	
							if (option['type'] == 'select' || option['type'] == 'radio' || option['type'] == 'image') {
								html += '<div class="form-group option"><label>';
	
								if (option['required'] == '1') {
									html += '<span class="required">*</span>';
								}
	
								html += option['name'] + '</label>';
								html += '<select name="order_product[' + product_row + '][option][' + option['product_option_id'] + ']" class="form-control">';
	
								if (option['required'] == '0') {
									html += '<option value=""><?php echo $text_select; ?></option>';
								}
	
								for (j = 0; j < option['product_option_value'].length; j++) {
									option_value = option['product_option_value'][j];
	
									html += '<option value="' + option_value['product_option_value_id'] + '">' + option_value['name'];
	
									if (option_value['price']) {
										html += ' (' + option_value['price_prefix'] + option_value['price'] + ')';
									}
	
									html += '</option>';
								}
	
								html += '</select>';
								html += '</div>';
							}
	
							if (option['type'] == 'checkbox') {
								html += '<div class="form-group"><label>';
	
								if (option['required'] == '1') {
									html += '<span class="required">*</span>';
								}
	
								html += option['name'] + '</label>';
	
								for (j = 0; j < option['product_option_value'].length; j++) {
									option_value = option['product_option_value'][j];
	
									html += '<div class="checkbox"><label>';
									html += '<input type="checkbox" name="order_product[' + product_row + '][option][' + option['product_option_id'] + '][]" value="' + option_value['product_option_value_id'] + '" />';
									html += option_value['name'];
	
									if (option_value['price']) {
										html += ' (' + option_value['price_prefix'] + option_value['price'] + ')';
									}
	
									html += '</label>';
									html += '</div>';
								}
	
								html += '</div>';
							}
	
							if (option['type'] == 'text') {
								html += '<div class="form-group"><label>';
	
								if (option['required'] == '1') {
									html += '<span class="required">*</span>';
								}
	
								html += option['name'] + '</label>';
								html += '<input type="text" name="order_product[' + product_row + '][option][' + option['product_option_id'] + ']" class="form-control" value="' + option['value'] + '" />';
								html += '</div>';
							}
	
							if (option['type'] == 'textarea') {
								html += '<div class="form-group"><label>';
	
								if (option['required'] == '1') {
									html += '<span class="required">*</span>';
								}
	
								html += option['name'] + '</label>';
								html += '<textarea name="order_product[' + product_row + '][option][' + option['product_option_id'] + ']" class="form-control" rows="2">' + option['value'] + '</textarea>';
								html += '</div>';
							}
	
							if (option['type'] == 'file') {
								html += '<div class="form-group"><label>';
	
								if (option['required'] == '1') {
									html += '<span class="required">*</span>';
								}
	
								html += option['name'] + '</label>';
								html += '<div class="btn-group btn-group-sm upfile-block">';
								html += '<a id="file-link-' + option['product_option_id'] + '-' + product_row + '" class="btn btn-default file-link" title="<?php echo $text_download; ?>"></a>';
								html += '<input type="hidden" name="order_product[' + product_row + '][option][' + option['product_option_id'] + ']" value="' + option['value'] + '" />';
								html += '<a id="button-upload-' + option['product_option_id'] + '-' + product_row + '" class="btn btn-primary" title="<?php echo $text_upload; ?>"><i class="fa fa-upload"></i></a>';
								html += '</div></div>';
							}
	
							if (option['type'] == 'date') {
								html += '<div class="form-group"><label>';
	
								if (option['required'] == '1') {
									html += '<span class="required">*</span>';
								}
	
								html += option['name'] + '</label>';
								html += '<div class="input-group input-group-sm date">';
								html += '<input type="text" name="order_product[' + product_row + '][option][' + option['product_option_id'] + ']" class="form-control" value="' + option['value'] + '" data-date-format="YYYY-MM-DD" />';
								html += '<span class="input-group-btn"><a class="btn btn-default" role="button"><i class="fa fa-calendar"></i></a></span>';
								html += '</div></div>';
							}
	
							if (option['type'] == 'datetime') {
								html += '<div class="form-group"><label>';
	
								if (option['required'] == '1') {
									html += '<span class="required">*</span>';
								}
	
								html += option['name'] + '</label>';
								html += '<div class="input-group input-group-sm datetime">';
								html += '<input type="text" name="order_product[' + product_row + '][option][' + option['product_option_id'] + ']" class="form-control" value="' + option['value'] + '" data-date-format="YYYY-MM-DD HH:mm" />';
								html += '<span class="input-group-btn"><a class="btn btn-default" role="button"><i class="fa fa-calendar"></i></a></span>';
								html += '</div></div>';
							}
	
							if (option['type'] == 'time') {
								html += '<div class="form-group"><label>';
								
								if (option['required'] == '1') {
									html += '<span class="required">*</span>';
								}
	
								html += option['name'] + '</label>';
								html += '<div class="input-group input-group-sm time">';
								html += '<input type="text" name="order_product[' + product_row + '][option][' + option['product_option_id'] + ']" class="form-control" value="' + option['value'] + '" data-date-format="HH:mm" />';
								html += '<span class="input-group-btn"><a class="btn btn-default" role="button"><i class="fa fa-calendar"></i></a></span>';
								html += '</div></div>';
							}
						}
	
						html += '</div>';
	
						$('#product_options' + product_row).empty().append(html);
	
						$('.date').datetimepicker({
							pickTime: false
						});
	
						$('.datetime').datetimepicker({
							pickDate: true,
							pickTime: true
						});
	
						$('.time').datetimepicker({
							pickDate: false
						});
	
					} else {
						$('#product_options' + product_row).empty();
					}
					controlReward();
				}
				}
			});
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
}

$('#product tbody').each(function(index, element) {
	product_autocomplete(index);
});
//--></script>
<script type="text/javascript"><!--
var old_order_status_id = '<?php echo $order_status_id; ?>';
var order_id = '<?php echo $order_id; ?>';

<?php if ($order_id) { ?>
$('select[id=\'order_status_id\']').on('change', function() {
	var new_order_status_id = this.value;
	
	if (old_order_status_id != new_order_status_id) {
		$.ajax({
			url: 'index.php?route=sale/orderpro/history&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
			type: 'post',
			dataType: 'html',
			data: 'order_status_id=' + new_order_status_id + '&notify=0&comment=',
			beforeSend: function() {
				$('#notifications').empty();
			},
			success: function(html) {
				$('#history').html(html);
				$('textarea[name=\'admin_comment\']').val('');
				$('select[id=\'horder_status_id\']').val(new_order_status_id);
	
				$('#notifications').append('<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success_order_history; ?><button type="button" class="close" data-dismiss="alert" aria-label="Close">&times;</button></div>');
				setTimeout(function() {$('#notifications .alert-success').fadeOut('slow', function() {$(this).remove();});}, 3000);
	
				old_order_status_id = new_order_status_id;
				controlReward();
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
});
<?php } ?>

function escapeHTML(str) {
    return String(str).replace(/&(?!\w+;)/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
}

var norecalc = ['shipping'];

$(document).delegate('#total .no_calc', 'click', function() {
	var ttype = $(this).attr('name');
	
	if ($(this).prop('checked')) {
		$("#total input[name=" + ttype +"]").prop('checked', true);
	
		if ($.inArray(ttype, norecalc) == -1) {
			norecalc.push(ttype);
		}
	} else {
		$("#total input[name=" + ttype +"]").prop('checked', false);
		norecalc.splice($.inArray(ttype, norecalc), 1);
	}
});

var total_row = '<?php echo $total_row; ?>';

function recalculate() {
	$('#total .no_calc').each(function () {
		if (this.checked) {$(this).val('1');}
	});
	$("#shoverlay").show();
	$.ajax({
		url: '<?php echo $store_url; ?>index.php?route=checkout/recalculate&token=<?php echo $token; ?>&order_id=<?php echo (!empty($order_id)) ? $order_id : $temp_order_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $('#tab-order :input, #tab-payment :input, #product :checked, #product input:hidden, #product input:text, #product .option :input, #product .product-discount :input, #order-reward :input, #order-dops :input, #payment_shipping :input, #total :input'),
		beforeSend: function() {
			$('#content .alert-success').remove();
			$('#total td.message').empty();
		},
		complete: function() {
			$('#shoverlay').hide();
		},
		success: function(json) {
			$('.autocomplete div').remove();
	
			if (!json['error']) {
				var total_row = 0;
				var button_remove = '<?php echo $button_remove; ?>';
				var html = '';
	
				$.each(json['order_total'], function(key, value) {
					html += ' <tr id="total-row' + total_row + '">';
					html += '  <td>';
					html += '    <input type="hidden" name="order_total[' + total_row + '][order_total_id]" value="0" />';
					html += '    <input type="hidden" name="order_total[' + total_row + '][code]" value="' + value.code + '" />';
					html += '    <input type="text" name="order_total[' + total_row + '][title]" class="form-control input-total-title" value="' + escapeHTML(value.title) + '" />';
					html += '  </td>';
					html += '  <td class="text-right">';
					html += '    <input type="hidden" name="order_total[' + total_row + '][text]" value="' + escapeHTML(value.text) + '" />';
					if (value.correct) { value.code = 'correct'; }
					if (value.discount) { value.code = 'discount'; }
					if ((value.code == 'sub_total') || (value.code == 'total')) {
						html += '   <input type="hidden" name="order_total[' + total_row + '][value]" value="' + value.value + '" />';
					} else {
						html += '   <input type="text" name="order_total[' + total_row + '][value]" class="form-control input-total-value" value="' + value.value + '" />';
					}
					html += '  </td>';
					html += '  <td class="text-right order-total-value">' + escapeHTML(value.text) + '</td>';
					html += '  <td class="text-center">';
					if ((value.code == 'discount') || (value.code == 'correct')) {
						html += '   <input class="no_calc" type="checkbox" name="' + value.code + '" value="0" disabled="disabled" />';
					} else {
						html += '   <input class="no_calc" type="checkbox" name="' + value.code + '" value="0" />';
					}
					html += '  </td>';
					html += '  <td class="text-center">';
					if ((value.code == 'discount') || (value.code == 'correct')) {
						html += '   <input type="text" name="order_total[' + total_row + '][sort_order]" class="form-control input-total-sort" value="' + value.sort_order + '" readonly="readonly" />';
					} else {
						html += '   <input type="text" name="order_total[' + total_row + '][sort_order]" class="form-control input-total-sort" value="' + value.sort_order + '" />';
					}
					html += '  </td>';
					html += '  <td class="text-right">';
					html += '    <a class="btn btn-danger btn-sm" onclick="$(\'#total-row' + total_row + '\').remove();" role="button">' + button_remove + '</a>';
					html += '  </td>';
					html += ' </tr>';
	
					total_row++;
				});
	
				$('#total').unbind();
				$('#total tbody').html(html);
	
				$('#total .no_calc').each(function () {
					if ($.inArray($(this).attr('name'), norecalc) != -1) {
						$(this).prop('checked', true);
					}
				});
	
				if (json['commission'] != '') {
					$('input[name=\'commission\']').val(json['commission'].value);
					$('#order-dops .commission-value').html(json['commission'].text);
				}
	
				$.each(json['del_product_rows'], function(key, prod_row) {
					$('#product-row' + prod_row).remove();
				});
	
				$.each(json['order_product'], function(prod_row, value) {
					if (value.dtext) {
						var name_value = $('input[name=\'order_product[' + prod_row + '][name]\']');
						var name_explode = $(name_value).val().split(' |');
						$(name_value).val(name_explode[0] + '<?php echo $text_discount; ?> ' + value.dtext).addClass('has-amount');
						$('#product-row' + prod_row + ' .product-discount .form-control').addClass('has-amount');
					} else {
						$('input[name=\'order_product[' + prod_row + '][name]\']').val(value.name).removeClass('has-amount');
						$('#product-row' + prod_row + ' .product-discount .form-control').removeClass('has-amount');
					}
	
					$('input[name=\'order_product[' + prod_row + '][quantity]\']').val(value.quantity);
					$('input[name=\'order_product[' + prod_row + '][tax]\']').val(value.tax);
					$('input[name=\'order_product[' + prod_row + '][total]\']').val(value.total);
					$('input[name=\'order_product[' + prod_row + '][price]\']').val(value.price);
					$('input[name=\'order_product[' + prod_row + '][reward]\']').val(value.reward);
					$('input[name=\'order_product[' + prod_row + '][weight]\']').val(value.weight);
					$('input[name=\'order_product[' + prod_row + '][discount_amount]\']').val(value.damount);
				});
	
				$('#weight_cart').val(json['weight_cart']);
				$('#items_cart').val(json['items_cart']);
				$('#total_cart').val(json['total_cart']);
				$('#discount_cart').val(json['discount_cart']);
				$('#reward_cart').val(json['reward_cart']);
				$('input[name=\'reward_cart\']').val(json['reward_cart']);
	
				if (json['warning_reward']) {
					$('#rewards-available').addClass('danger');
					$('#rewards-available .reward-use').html('Max: '+ json['warning_reward']);
				}
	
				if (json['warning']) {
					var html = '';
					$.each(json['warning'], function(key, value) {
						html += '<div class="alert alert-warning"><i class="fa fa-check-circle"></i> ' + value + '</div>';
					});
	
					$('#total td.message').append(html);
				}
	
				$('#total .btn-popover').popover({
					trigger: "hover"
				});
	
				if ($('input[name=\'customer_id\']').val() != ''){
					controlReward();
				}
	
			} else {
				var html = '';
				$.each(json['error'], function(key, value) {
					html += '<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + value + '</div>';
				});
	
				$('#total td.message').append(html);
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			alert('Recalculate Error!');
		}
	});
}

function controlReward() {
	var customer_id = $('input[name=\'customer_id\']').val();
	var customer_group_id = $('input[name=\'customer_group_id\']').val();
	$.ajax({
		url: '<?php echo $store_url; ?>index.php?route=checkout/recalculate/controlReward&token=<?php echo $token; ?>&order_id=<?php echo (!empty($order_id)) ? $order_id : $temp_order_id; ?>&customer_id=' + encodeURIComponent(customer_id) + '&customer_group_id=' + encodeURIComponent(customer_group_id),
		type: 'post',
		dataType: 'json',
		data: $('#product :checked, #product input:hidden, #product input:text, #product .option :input'),
		success: function(json) {
			var reward_use = Number($('input[name=\'reward_use\']').val());
	
			if (reward_use <= json.reward_possibly) {
				$('#rewards-available').removeClass('danger');
				$('#rewards-available .reward-use').html('Max: '+ json.reward_possibly);
			} else {
				$('#rewards-available').addClass('danger');
				$('#rewards-available .reward-use').html('Max: '+ json.reward_possibly);
				$('input[name=\'reward_use\']').val(json.reward_possibly);
			}
	
			$('#reward-total span.rtotal').html(json.reward_total);
			$('#reward-total span.ptotal').html(json.reward_possibly);
			$('#reward-recived').html(json.reward_recived);
			$('input[name=\'reward_cart\']').val(json.reward_cart);
		}
	});
}

$('input[name=\'reward_use\']').blur(function () {
    controlReward();
});

function getMethods() {
	$.ajax({
		url: '<?php echo $store_url; ?>index.php?route=checkout/recalculate/getMethods&token=<?php echo $token; ?>',
		type: 'post',
		data: $('#tab-order :input, #tab-payment :input, #product :checked, #product input:hidden, #product input:text, #product .option :input, #product .product-discount :input, #order-reward :input, #order-dops :input, #payment_shipping :input, #total :input'),
		dataType: 'json',	
		beforeSend: function() {
			$('#payment_shipping select[name=\'shippings\'], #payment_shipping select[name=\'payments\']').css('opacity', '0.4');
			$('#total td.message').empty();
		},
		complete: function() {
			$('#payment_shipping select[name=\'shippings\'], #payment_shipping select[name=\'payments\']').css('opacity', '1');
		},
		success: function(json) {
			if (json['error']) {
				var html = '';
				$.each(json['error'], function(key, value) {
					html += '<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + value + '</div>';
				});
	
				$('#total td.message').append(html);
			}
	
			if (json['warning']) {
				var html = '';
				$.each(json['warning'], function(key, value) {
					html += '<div class="alert alert-warning"><i class="fa fa-check-circle"></i> ' + value + '</div>';
				});
	
				$('#total td.message').append(html);
			}
	
			if (json['shipping_method']) {
				html = '<option value=""><?php echo $text_select; ?></option>';
	
				for (i in json['shipping_method']) {
					html += '<optgroup label="' + json['shipping_method'][i]['title'] + '">';
	
					for (j in json['shipping_method'][i]['quote']) {
						if (json['shipping_method'][i]['quote'][j]['code'] == $('#payment_shipping input[name=\'shipping_code\']').val()) {
							if (!json['shipping_method'][i]['error']) {
								html += '<option value="' + json['shipping_method'][i]['quote'][j]['code'] + '" selected="selected">' + json['shipping_method'][i]['quote'][j]['title'] + '</option>';
							} else {
								html += '<option style="color:#676;" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" selected="selected">' + json['shipping_method'][i]['quote'][j]['title'] + ' ' + json['shipping_method'][i]['error'] + '</option>';
							}
						} else {
							if (!json['shipping_method'][i]['error']) {
								html += '<option value="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['title'] + '</option>';
							} else {
								html += '<option style="color:#676;" value="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['title'] + ' ' + json['shipping_method'][i]['error'] + '</option>';
							}
						}
					}
	
					html += '</optgroup>';
				}
	
				$('#payment_shipping select[name=\'shippings\']').html(html);
			}
	
			if (json['payment_method']) {
				html = '<option value=""><?php echo $text_select; ?></option>';
	
				for (i in json['payment_method']) {
					if (json['payment_method'][i]['code'] == $('#payment_shipping input[name=\'payment_code\']').val()) {
						if (!json['payment_method'][i]['error']) {
							html += '<option value="' + json['payment_method'][i]['code'] + '" selected="selected">' + json['payment_method'][i]['title'] + '</option>';
						} else {
							html += '<option style="color:#676;" value="' + json['payment_method'][i]['code'] + '" selected="selected">' + json['payment_method'][i]['title'] + ' ' + json['payment_method'][i]['error'] + '</option>';
						}
					} else {
						if (!json['payment_method'][i]['error']) {
							html += '<option value="' + json['payment_method'][i]['code'] + '">' + json['payment_method'][i]['title'] + '</option>';
						} else {
							html += '<option style="color:#676;" value="' + json['payment_method'][i]['code'] + '">' + json['payment_method'][i]['title'] + ' ' + json['payment_method'][i]['error'] + '</option>';
						}
					}
				}
	
				$('#payment_shipping select[name=\'payments\']').html(html);
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
}

var regex2 = '<?php echo $error_method_available; ?>';

$('select[name=\'payments\']').on('change', function() {
	if (this.value) {
		$('input[name=\'payment_method\']').val($('select[name=\'payments\'] option:selected').text().replace(regex2, ''));
		$('#now_payment_method').empty().append($('select[name=\'payments\'] option:selected').text().replace(regex2, ''));
	} else {
		$('input[name=\'payment_method\']').val('');
		$('#now_payment_method').empty();
	}
	
	$('input[name=\'payment_code\']').val(this.value);
});

$('select[name=\'shippings\']').on('change', function() {
	if (this.value) {
		$('input[name=\'shipping_method\']').val($('select[name=\'shippings\'] option:selected').text().replace(regex2, ''));
		$('#now_shipping_method').empty().append($('select[name=\'shippings\'] option:selected').text().replace(regex2, ''));
	} else {
		$('input[name=\'shipping_method\']').val('');
		$('#now_shipping_method').empty();
	}
	
	$('input[name=\'shipping_code\']').val(this.value);
});

$(document).ready(function() {
	setTimeout (function() {controlReward();}, 500);
	setTimeout (function() {getMethods();}, 1000);
});

function addTotal(type, title) {
	html = '';
	html += ' <tr id="total-row' + total_row + '">';
	html += '  <td>';
	html += '   <input type="hidden" name="order_total[' + total_row + '][code]" value="' + type + '" />';
	html += '   <input type="text" name="order_total[' + total_row + '][title]" class="form-control input-total-title" value="' + title + '" />';
	html += '  </td>';
	html += '  <td class="text-right">';
	html += '   <input type="text" name="order_total[' + total_row + '][value]" class="form-control input-total-value" value="" />';
	html += '  </td>';
	html += '  <td>';
	html += '   <input type="hidden" name="order_total[' + total_row + '][text]" value="" />';
	html += '  </td>';
	if (type == 'correct') {
		html += '  <td class="text-center" colspan="2">';
		html += '   <div class="form-group correct-tax"><label><?php echo $entry_tax; ?></label>';
		html += '   <select name="order_total[' + total_row + '][tax_class_id]" class="form-control">';
		html += '    <option value="0"><?php echo $text_none; ?></option>';
		<?php foreach ($tax_classes as $tax_class) { ?>
		html += '    <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>';
		<?php } ?>
		html += '   </select><input type="hidden" name="order_total[' + total_row + '][sort_order]" value="" /></div>';
		html += '  </td>';						
	} else {
		html += '  <td></td>';
		html += '  <td>';
		html += '   <input type="hidden" name="order_total[' + total_row + '][sort_order]" value="2" />';
		html += '  </td>';
	}
	html += '  <td class="text-right">';
	html += '   <a class="btn btn-danger btn-sm" onclick="$(\'#total-row' + total_row + '\').remove();" role="button"><?php echo $button_remove; ?></a>';
	html += '  </td>';
	html += ' </tr>';
	
	total_row++;
	$('#total tbody').append(html);
}

function addDiscount() {
    addTotal('discount', '<?php echo $entry_discount; ?>');
}

function addCorrect() {
    addTotal('correct', '<?php echo $entry_correct; ?>');
}

function clone_order() {
    $('#clone').val('1');
	$('#order_form').submit();
}

function apple_order() {
	$('#order_form').attr('action', $('#order_form').attr('action') + '&reopen=1');
	$('#order_form').submit();
}

<?php if ($customer_id && $reward_status) { ?>
$('#reward-add').on('click', function() {
	$('#notifications').empty();
	$("#shoverlay").show();
	$.ajax({
		url: 'index.php?route=sale/orderpro/addOrderReward&token=<?php echo $token; ?>&order_id=<?php echo (!empty($order_id)) ? $order_id : $temp_order_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $('#tab-order :input, #order-reward :input'),
		success: function(json) {
			$("#shoverlay").hide();
			if (json.error) {
				$('#notifications').append('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json.error + '</div>');
				setTimeout (function() {$('#notifications .alert-danger').fadeOut('slow', function() {$(this).remove();});}, 4000);
			}
			if (json.success) {
				$('#reward-recived').html(json.reward_total);
				$('#notifications').append('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json.success + '</div>');
				setTimeout (function() {$('#notifications .alert-success').fadeOut('slow', function() {$(this).remove();});}, 3000);
				controlReward();
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#reward-remove').on('click', function() {
	$('#notifications').empty();
	$("#shoverlay").show();
	$.ajax({
		url: 'index.php?route=sale/orderpro/removeOrderReward&token=<?php echo $token; ?>&order_id=<?php echo (!empty($order_id)) ? $order_id : $temp_order_id; ?>',
		dataType: 'json',
		success: function(json) {
			$("#shoverlay").hide();
			if (json.error) {
				$('#notifications').append('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json.error + '</div>');
				setTimeout (function() {$('#notifications .alert-danger').fadeOut('slow', function() {$(this).remove();});}, 4000);
			}
			if (json.success) {
                $('#reward-recived').html('0');
				$('#notifications').append('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json.success + '</div>');
				setTimeout (function() {$('#notifications .alert-success').fadeOut('slow', function() {$(this).remove();});}, 3000);
                controlReward();
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
<?php } ?>
<?php if ($order_id) { ?>
$('#commission_add').on('click', function() {
	$('#notifications').empty();
	$("#shoverlay").show();
	$.ajax({
		url: 'index.php?route=sale/orderpro/addCommission&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		dataType: 'json',
		success: function(json) {
			$("#shoverlay").hide();
			if (json.error) {
				$('#notifications').append('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json.error + '</div>');
				setTimeout (function() {$('#notifications .alert-danger').fadeOut('slow', function() {$(this).remove();});}, 4000);
			}
			if (json.success) {
				$('#notifications').append('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json.success + '</div>');
				setTimeout (function() {$('#notifications .alert-success').fadeOut('slow', function() {$(this).remove();});}, 3000);
				$('#order-dops .commission-add').fadeOut();
				$('#order-dops .commission-remove').fadeIn();
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#commission_remove').on('click', function() {
	$('#notifications').empty();
	$("#shoverlay").show();
	$.ajax({
		url: 'index.php?route=sale/orderpro/removeCommission&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		dataType: 'json',
		success: function(json) {
			$("#shoverlay").hide();
			if (json.error) {
				$('#notifications').append('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json.error + '</div>');
				setTimeout (function() {$('#notifications .alert-danger').fadeOut('slow', function() {$(this).remove();});}, 4000);
			}
			if (json.success) {
				$('#notifications').append('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json.success + '</div>');
				setTimeout (function() {$('#notifications .alert-success').fadeOut('slow', function() {$(this).remove();});}, 3000);
				$('#order-dops .commission-remove').fadeOut();
				$('#order-dops .commission-add').fadeIn();
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#history').load('index.php?route=sale/orderpro/history&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>');

$('#history').on('click', '.pagination a', function(e) {
	e.preventDefault();
	$('#history').load(this.href);
});

$('#button-history').on('click', function() {
	var new_hstatus_order_id = $('select[id=\'horder_status_id\']').val();
	var hdata = $('#order-history :input').serialize();
	$.ajax({
		url: 'index.php?route=sale/orderpro/history&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'html',
		data: hdata,
		beforeSend: function() {
			$('#button-history').hide();
			$('#button-history').after('<div class="attention"><img src="view/image/orderpro/loading.gif" alt="" /></div>');
		},
		complete: function() {
			$('#order-history .attention').remove();
			$('#button-history').show();
			$('#order-history :input').prop('checked', false);
		},
		success: function(html) {
			$('#history').html(html);
			$('textarea[name=\'admin_comment\']').val('');
			$('select[id=\'order_status_id\']').val(new_hstatus_order_id);
			old_order_status_id = new_hstatus_order_id;
			controlReward();
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
<?php } ?>
//--></script>
<script type="text/javascript"><!--
function decodeEntities(input) {
  var y = document.createElement('textarea');
  y.innerHTML = input;
  return y.value;
}
	
$('#content').delegate('a[id^=\'button-upload\'], a[id^=\'button-custom-field\'], a[id^=\'button-payment-custom-field\'], a[id^=\'button-shipping-custom-field\']', 'click', function() {
	var node = this;
	$('#form-upload').remove();
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
	$('#form-upload input[name=\'file\']').trigger('click');
	
	if (typeof(timer) != 'undefined') {
    	clearInterval(timer);
	}
	
	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);
			$.ajax({
				url: 'index.php?route=sale/orderpro/upload&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$('#notifications').empty();
					$(node).children('.fa').addClass('fa-cog fa-spin');
				},
				complete: function() {
					$(node).children('.fa').removeClass('fa-cog fa-spin');
				},
				success: function(json) {
					$(node).parent().parent().find('.text-danger').remove();
	
					if (json['error']) {
						$(node).parent().after('<div class="text-danger">' + json['error'] + '</div>');
						$('#notifications').append('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert" aria-label="Close">&times;</button></div>');
						setTimeout (function() {$('#notifications .alert-danger').fadeOut('slow', function() {$(this).remove();});}, 4000);
					}
	
					if (json['success']) {
						$('#notifications').append('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert" aria-label="Close">&times;</button></div>');
						setTimeout (function() {$('#notifications .alert-success').fadeOut('slow', function() {$(this).remove();});}, 3000);
	
						if (json['filename'] && json['href']) {
							$(node).parent().find('a[id^=\'file-link\']').empty().attr('href', decodeEntities(json['href'])).append(json['filename']).show('fast');
						}
						if (json['code']) {
							$(node).parent().find('input[type=\'hidden\']').val(json['code']);
						}
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});

//zadarma ##############################################
function callRequest(phone) {
    var link = '<?php echo $call_request_link; ?>';
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

function getsimilar(pole) {
        $('#similar_modal').remove();
        $('#similar_block').load('index.php?route=sale/orderpro/getsimilar&order_id=<?php echo $order_id; ?>&pole='+ pole +'&token=<?php echo $token; ?>', function() {
            $('#similar_modal').modal('show');
        });
    }

$('#empty-prices').on('click', function() {
    $('#product .product-price input').val('');
});

$('#product').on('click', '.price-empty', function() {
    $(this).parent().find('.input-price').val('');
});

$('#empty-discounts').on('click', function() {
    $('#product .product-discount input').val('').removeClass('has-amount');
	$('#product .product-discount select').val('P').removeClass('has-amount');
});

$('#product').on('click', '.amount-empty', function() {
    $(this).parent().find('input.input-amount').val('').removeClass('has-amount');
	$(this).parent().find('select.form-control').val('P').removeClass('has-amount');
});

$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('.btn-popover').popover({
	trigger: "hover"
});
$('.label-popover').popover({
	trigger: "hover"
});
$('.span-popover').popover({
	trigger: "hover"
});

$('#order-history input[name=\'notify\']').on('click', function() {
	if ($(this).prop('checked')) {
		$('.checkbox-history .hide-notify').fadeIn('slow');
	} else {
		$('#order-history input[name=\'notify_products\']').prop('checked', false);
		$('.checkbox-history .hide-notify').fadeOut('slow');
	}
});
$('#order-history input[name=\'notify_admin\']').on('click', function() {
	if ($(this).prop('checked')) {
		$('.checkbox-history .hide-notify-admin').fadeIn('slow');
	} else {
		$('#order-history input[name=\'notify_admin_products\']').prop('checked', false);
		$('.checkbox-history .hide-notify-admin').fadeOut('slow');
	}
});
<?php if ($error_license) { ?>
$('#content.orderpro-content a.btn').each(function(index, element) {
	$(element).removeAttr('onclick').off('click').removeClass('btn-primary').removeClass('btn-success').removeClass('btn-danger').addClass('btn-default');
});
<?php } ?>
//--></script>
</div><?php echo $footer; ?>
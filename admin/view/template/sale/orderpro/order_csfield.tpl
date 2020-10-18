<div id="csfield">
<?php if ($account_custom_fields) { ?>
	<div class="row">
		<div class="col-xs-12">
			<div id="csfield-account">
				<h4><?php echo $text_account_custom_field; ?></h4>
				<div class="row">
				<?php foreach ($custom_fields as $custom_field) { ?>
				<?php if ($custom_field['location'] == 'account') { ?>
					<?php if ($custom_field['type'] == 'select') { ?>
					<div class="col-sm-3 col-xs-4">
						<div class="form-group">
							<label><?php echo $custom_field['name']; ?></label>
							<select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" class="form-control">
							<option value=""><?php echo $text_select; ?></option>
							<?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
								<?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && ($custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']])) { ?>
								<option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
								<?php } ?>
							<?php } ?>
							</select>
						</div>
					</div>
					<?php } ?>
					<?php if ($custom_field['type'] == 'radio') { ?>
					<div class="col-sm-3 col-xs-4">
						<div class="form-group">
							<label><?php echo $custom_field['name']; ?></label>
							<?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
							<div class="radio">
								<?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && ($custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']])) { ?>
								<label><input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" /><?php echo $custom_field_value['name']; ?></label>
								<?php } else { ?>
								<label><input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" /><?php echo $custom_field_value['name']; ?></label>
								<?php } ?>
							</div>
							<?php } ?>
						</div>
					</div>
					<?php } ?>
					<?php if ($custom_field['type'] == 'checkbox') { ?>
					<div class="col-sm-3 col-xs-4">
						<div class="form-group">
							<label><?php echo $custom_field['name']; ?></label>
							<?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
							<div class="checkbox">
								<?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $account_custom_field[$custom_field['custom_field_id']])) { ?>
								<label><input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" /><?php echo $custom_field_value['name']; ?></label>
								<?php } else { ?>
								<label><input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" /><?php echo $custom_field_value['name']; ?></label>
								<?php } ?>
							</div>
							<?php } ?>
						</div>
					</div>
					<?php } ?>
					<?php if ($custom_field['type'] == 'text') { ?>
					<div class="col-sm-3 col-xs-4">
						<div class="form-group">
							<label><?php echo $custom_field['name']; ?></label>
							<input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" class="form-control" />
						</div>
					</div>
					<?php } ?>
					<?php if ($custom_field['type'] == 'textarea') { ?>
					<div class="col-sm-3 col-xs-4">
						<div class="form-group">
							<label><?php echo $custom_field['name']; ?></label>
							<textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="2" class="form-control"><?php echo $custom_field['value']; ?></textarea>
						</div>
					</div>
					<?php } ?>
					<?php if ($custom_field['type'] == 'file') { ?>
					<div class="col-sm-3 col-xs-4">
						<div class="form-group">
							<label><?php echo $custom_field['name']; ?></label>
							<div class="btn-group btn-group-sm upfile-block">
								<a id="file-link-<?php echo $custom_field['custom_field_id']; ?>" class="btn btn-default file-link" title="<?php echo $text_download; ?>"<?php if ($custom_field['custom_field_href']) { ?> href="<?php echo $custom_field['custom_field_href']; ?>"<?php } ?>><?php echo $custom_field['custom_field_filename']; ?></a>
								<input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : ''); ?>" />
								<a id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="btn btn-primary" title="<?php echo $text_upload; ?>"><i class="fa fa-upload"></i></a>
							</div>
						</div>
					</div>
					<?php } ?>
					<?php if ($custom_field['type'] == 'date') { ?>
					<div class="col-sm-3 col-xs-4">
						<div class="form-group">
							<label><?php echo $custom_field['name']; ?></label>
							<div class="input-group input-group-sm date">
								<input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" data-date-format="YYYY-MM-DD" class="form-control" />
								<span class="input-group-btn"><a class="btn btn-default" role="button"><i class="fa fa-calendar"></i></a></span>
							</div>
						</div>
					</div>
					<?php } ?>
					<?php if ($custom_field['type'] == 'time') { ?>
					<div class="col-sm-3 col-xs-4">
						<div class="form-group">
							<label><?php echo $custom_field['name']; ?></label>
							<div class="input-group input-group-sm time">
								<input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" data-date-format="HH:mm" class="form-control" />
								<span class="input-group-btn"><a class="btn btn-default" role="button"><i class="fa fa-calendar"></i></a></span>
							</div>
						</div>
					</div>
					<?php } ?>
					<?php if ($custom_field['type'] == 'datetime') { ?>
					<div class="col-sm-3 col-xs-4">
						<div class="form-group">
							<label><?php echo $custom_field['name']; ?></label>
							<div class="input-group input-group-sm datetime">
								<input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" data-date-format="YYYY-MM-DD HH:mm" class="form-control" />
								<span class="input-group-btn"><a class="btn btn-default" role="button"><i class="fa fa-calendar"></i></a></span>
							</div>
						</div>
					</div>
					<?php } ?>
				<?php } ?>
				<?php } ?>
				</div>
			</div>
		</div>
	</div>
<?php } ?>
<?php if ($address_custom_fields) { ?>
	<div class="row">
		<div class="col-xs-12">
			<div id="csfield-shipping">
				<h4><?php echo $text_shipping_custom_field; ?></h4>
				<div class="row">
				<?php foreach ($custom_fields as $custom_field) { ?>
				<?php if ($custom_field['location'] == 'address') { ?>
					<?php if ($custom_field['type'] == 'select') { ?>
					<div class="col-sm-3 col-xs-4">
						<div class="form-group">
							<label><?php echo $custom_field['name']; ?></label>
							<select name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" class="form-control">
							<option value=""><?php echo $text_select; ?></option>
							<?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
								<?php if (isset($shipping_custom_field[$custom_field['custom_field_id']]) && ($custom_field_value['custom_field_value_id'] == $shipping_custom_field[$custom_field['custom_field_id']])) { ?>
								<option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
								<?php } ?>
							<?php } ?>
							</select>
						</div>
					</div>
					<?php } ?>
					<?php if ($custom_field['type'] == 'radio') { ?>
					<div class="col-sm-3 col-xs-4">
						<div class="form-group">
							<label><?php echo $custom_field['name']; ?></label>
							<?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
							<div class="radio">
								<?php if (isset($shipping_custom_field[$custom_field['custom_field_id']]) && ($custom_field_value['custom_field_value_id'] == $shipping_custom_field[$custom_field['custom_field_id']])) { ?>
								<label><input type="radio" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" /><?php echo $custom_field_value['name']; ?></label>
								<?php } else { ?>
								<label><input type="radio" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" /><?php echo $custom_field_value['name']; ?></label>
								<?php } ?>
							</div>
							<?php } ?>
						</div>
					</div>
					<?php } ?>
					<?php if ($custom_field['type'] == 'checkbox') { ?>
					<div class="col-sm-3 col-xs-4">
						<div class="form-group">
							<label><?php echo $custom_field['name']; ?></label>
							<?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
							<div class="checkbox">
								<?php if (isset($shipping_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $shipping_custom_field[$custom_field['custom_field_id']])) { ?>
								<label><input type="checkbox" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" /><?php echo $custom_field_value['name']; ?></label>
								<?php } else { ?>
								<label><input type="checkbox" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" /><?php echo $custom_field_value['name']; ?></label>
								<?php } ?>
							</div>
							<?php } ?>
						</div>
					</div>
					<?php } ?>
					<?php if ($custom_field['type'] == 'text') { ?>
					<div class="col-sm-3 col-xs-4">
						<div class="form-group">
							<label><?php echo $custom_field['name']; ?></label>
							<input type="text" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($shipping_custom_field[$custom_field['custom_field_id']]) ? $shipping_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" class="form-control" />
						</div>
					</div>
					<?php } ?>
					<?php if ($custom_field['type'] == 'textarea') { ?>
					<div class="col-sm-3 col-xs-4">
						<div class="form-group">
							<label><?php echo $custom_field['name']; ?></label>
							<textarea name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="2" class="form-control"><?php echo $custom_field['value']; ?></textarea>
						</div>
					</div>
					<?php } ?>
					<?php if ($custom_field['type'] == 'file') { ?>
					<div class="col-sm-3 col-xs-4">
						<div class="form-group">
							<label><?php echo $custom_field['name']; ?></label>
							<div class="btn-group btn-group-sm upfile-block">
								<a id="file-link-<?php echo $custom_field['custom_field_id']; ?>" class="btn btn-default file-link" title="<?php echo $text_download; ?>"<?php if ($custom_field['custom_field_href']) { ?> href="<?php echo $custom_field['custom_field_href']; ?>"<?php } ?>><?php echo $custom_field['custom_field_filename']; ?></a>
								<input type="hidden" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($shipping_custom_field[$custom_field['custom_field_id']]) ? $shipping_custom_field[$custom_field['custom_field_id']] : ''); ?>" />
								<a id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="btn btn-primary" title="<?php echo $text_upload; ?>"><i class="fa fa-upload"></i></a>
							</div>
						</div>
					</div>
					<?php } ?>
					<?php if ($custom_field['type'] == 'date') { ?>
					<div class="col-sm-3 col-xs-4">
						<div class="form-group">
							<label><?php echo $custom_field['name']; ?></label>
							<div class="input-group input-group-sm date">
								<input type="text" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($shipping_custom_field[$custom_field['custom_field_id']]) ? $shipping_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" data-date-format="YYYY-MM-DD" class="form-control" />
								<span class="input-group-btn"><a class="btn btn-default" role="button"><i class="fa fa-calendar"></i></a></span>
							</div>
						</div>
					</div>
					<?php } ?>
					<?php if ($custom_field['type'] == 'time') { ?>
					<div class="col-sm-3 col-xs-4">
						<div class="form-group">
							<label><?php echo $custom_field['name']; ?></label>
							<div class="input-group input-group-sm time">
								<input type="text" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($shipping_custom_field[$custom_field['custom_field_id']]) ? $shipping_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" data-date-format="HH:mm" class="form-control" />
								<span class="input-group-btn"><a class="btn btn-default" role="button"><i class="fa fa-calendar"></i></a></span>
							</div>
						</div>
					</div>
					<?php } ?>
					<?php if ($custom_field['type'] == 'datetime') { ?>
					<div class="col-sm-3 col-xs-4">
						<div class="form-group">
							<label><?php echo $custom_field['name']; ?></label>
							<div class="input-group input-group-sm datetime">
								<input type="text" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($shipping_custom_field[$custom_field['custom_field_id']]) ? $shipping_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" data-date-format="YYYY-MM-DD HH:mm" class="form-control" />
								<span class="input-group-btn"><a class="btn btn-default" role="button"><i class="fa fa-calendar"></i></a></span>
							</div>
						</div>
					</div>
					<?php } ?>
				<?php } ?>
				<?php } ?>
				</div>
			</div>
		</div>
	</div>
<?php } ?>
</div>
<div class="popup_order_products">
  <table class="table-products">
  <?php if (!empty($order_products)) { ?>
	<tr class="order">
		<td class="text-left middle" colspan="7"><?php echo $text_order_no . $order_id; ?></td>
	</tr>
	<tr class="title">
		<td class="text-center middle">#</td>
		<?php if (!empty($order_products[0]['image'])) { ?>
		  <td class="text-left"><?php echo $text_image; ?></td>
		<?php } ?>
		<td class="text-left"><?php echo $column_product; ?></td>
		<td class="text-left"><?php echo $text_option; ?></td>
		<td class="text-left"><?php echo $column_price; ?></td>
		<td class="text-center"><?php echo $column_quantity; ?></td>
		<td class="text-right"><?php echo $column_total; ?></td>
	  </tr>
	<?php $i=1; ?>
	<?php foreach ($order_products as $product) { ?>
	  <tr style="border-bottom: 0">
		<td class="text-center middle"><?php echo $i; ?></td>
		<?php if (!empty($product['image'])) { ?>
		  <td class="text-left"><span class="product_image"><?php echo $product['image']; ?></span></td>
		<?php } ?>
		<td class="text-left">
			<ul class="product_fields">
				<li><a href="<?php echo $product['href']; ?>" title="<?php echo $text_edit; ?>"><?php echo $product['name']; ?></a></li>
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
		<td class="text-left">
			<?php if (!empty($product['options'])) { ?>
				<?php foreach ($product['options'] as $option) { ?>
				<div><?php echo '- '.$option['name'].': '.$option['value']; ?></div>
				<?php } ?>
			<?php } ?>
		</td>
		<td class="text-left"><nobr><?php echo $product['price']; ?></nobr></td>
		<td class="text-center">&nbsp;<?php echo 'x '.$product['quantity']; ?></td>
		<td class="text-right"><?php echo $product['total_format']; ?></td>
	  </tr>
	  <?php $i++; ?>
	<?php } ?>
  <?php } ?>
  </table>
</div>
<?php if ($error) { ?>
<div class="alert alert-danger"><i class="fa fa-check-circle"></i> <?php echo $error; ?><button type="button" class="close" data-dismiss="alert" aria-label="Close">&times;</button></div>
<?php } ?>
<?php if ($success) { ?>
<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?><button type="button" class="close" data-dismiss="alert" aria-label="Close">&times;</button></div>
<?php } ?>
<table class="table table-history">
	<thead>
		<tr>
			<td class="history-date"><?php echo $column_date; ?></td>
			<td class="history-status"><?php echo $column_status; ?></td>
			<td class="history-comment"><?php echo $column_comment; ?></td>
			<td class="history-notify"><span class="hidden-xs"><?php echo $column_notify; ?></span><i class="fa fa-envelope visible-xs" aria-hidden="true"></i></td>
		</tr>
	</thead>
	<tbody>
	<?php if ($histories) { ?>
		<?php foreach ($histories as $history) { ?>
		<tr>
			<td class="text-center" nowrap><?php echo $history['date_added']; ?></td>
			<td class="text-left"><?php echo $history['status']; ?></td>
			<td class="text-left"><?php echo $history['comment']; ?></td>
			<td class="text-center"><?php echo $history['notify']; ?></td>
		</tr>
		<?php } ?>
	<?php } else { ?>
		<tr>
			<td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
		</tr>
	<?php } ?>
	</tbody>
</table>
<div class="pagination-block">
	<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
	<div class="col-sm-6 text-right pagination-results"><?php if($pagination) { ?><?php echo $results; ?><?php } ?></div>
</div>
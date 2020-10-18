<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-measoftshipping" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-measoftshipping" class="form-horizontal">
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-login"><?php echo $entry_login; ?></label>
            <div class="col-sm-10">
              <input type="text" name="measoftshipping_login" value="<?php echo $measoftshipping_login; ?>" placeholder="<?php echo $entry_login; ?>" id="input-login" class="form-control" />
              <?php if ($error_login) { ?>
              <div class="text-danger"><?php echo $error_login; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
            <div class="col-sm-10">
              <input type="password" name="measoftshipping_password" value="<?php echo $measoftshipping_password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
              <?php if ($error_password) { ?>
              <div class="text-danger"><?php echo $error_password; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-client_id"><?php echo $entry_client_id; ?></label>
            <div class="col-sm-10">
              <input type="text" name="measoftshipping_client_id" value="<?php echo $measoftshipping_client_id; ?>" placeholder="<?php echo $entry_client_id; ?>" id="input-client_id" class="form-control" />
              <?php if ($error_client_id) { ?>
              <div class="text-danger"><?php echo $error_client_id; ?></div>
              <?php } ?>
            </div>
          </div>

          <!-- req -->
         
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-rate"><?php echo $entry_rate; ?></label>
            <div class="col-sm-10">
              <input type="text" name="measoftshipping_rate" value="<?php echo $measoftshipping_rate; ?>"  id="input-rate" class="form-control" />
              <?php if ($error_rate) { ?>
              <div class="text-danger"><?php echo $error_rate; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-add_sum"><?php echo $entry_add_sum; ?></label>
            <div class="col-sm-10">
              <input type="text" name="measoftshipping_add_sum" value="<?php echo $measoftshipping_add_sum; ?>"  id="input-add_sum" class="form-control" />
              <!-- <?php if ($error_add_sum) { ?>
              <div class="text-danger"><?php echo $error_add_sum; ?></div>
              <?php } ?> -->
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-city"><?php echo $entry_city; ?></label>
            <div class="col-sm-10">
              <input type="text" name="measoftshipping_city" value="<?php echo $measoftshipping_city; ?>"  id="input-city" class="form-control" />
              <?php if ($error_city) { ?>
              <div class="text-danger"><?php echo $error_city; ?></div>
              <?php } ?>
            </div>
          </div>

          <!-- not req -->

          <!-- пвз -->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pvz-title"><?php echo $entry_pvz_title; ?></label>
            <div class="col-sm-10">
              <input type="text" name="measoftshipping_pvz_title" value="<?php echo $measoftshipping_pvz_title; ?>"  id="input-weight" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pvz-description"><?php echo $entry_pvz_description; ?></label>
            <div class="col-sm-10">
              <input type="text" name="measoftshipping_pvz_description" value="<?php echo $measoftshipping_pvz_description; ?>"  id="input-weight" class="form-control" />
            </div>
          </div>


          <!-- курьер -->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-courier-title"><?php echo $entry_courier_title; ?></label>
            <div class="col-sm-10">
              <input type="text" name="measoftshipping_courier_title" value="<?php echo $measoftshipping_courier_title; ?>"  id="input-weight" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-pvz-description"><?php echo $entry_courier_description; ?></label>
            <div class="col-sm-10">
              <input type="text" name="measoftshipping_courier_description" value="<?php echo $measoftshipping_courier_description; ?>"  id="input-weight" class="form-control" />
            </div>
          </div>



          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-weight"><?php echo $entry_weight; ?></label>
            <div class="col-sm-10">
              <input type="text" name="measoftshipping_weight" value="<?php echo $measoftshipping_weight; ?>"  id="input-weight" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-map_width"><?php echo $entry_map_width; ?></label>
            <div class="col-sm-10">
              <input type="text" name="measoftshipping_map_width" value="<?php echo $measoftshipping_map_width; ?>"  id="input-map_width" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-map_height"><?php echo $entry_map_height; ?></label>
            <div class="col-sm-10">
              <input type="text" name="measoftshipping_map_height" value="<?php echo $measoftshipping_map_height; ?>"  id="input-map_height" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-prefix"><?php echo $entry_prefix; ?></label>
            <div class="col-sm-10">
              <input type="text" name="measoftshipping_prefix" value="<?php echo $measoftshipping_prefix; ?>"  id="input-prefix" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-length"><span data-toggle="tooltip" title="<?php echo $help_fixed_length; ?>"><?php echo $entry_length; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="measoftshipping_length" value="<?php echo $measoftshipping_length; ?>"  id="input-length" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-com_status"><?php echo $entry_com_status; ?></label>
            <div class="col-sm-10">
              <input type="text" name="measoftshipping_com_status" value="<?php echo $measoftshipping_com_status; ?>"  id="input-com_status" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-articles"><?php echo $entry_articles; ?></label>
            <div class="col-sm-10">
              <input type="checkbox" name="measoftshipping_articles[]" value="1" <?php if($measoftshipping_articles[0]==1) echo 'checked'; ?> id="input-articles" class="form-control" />
            </div>
          </div>
          
          <hr>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-total"><span data-toggle="tooltip" title="<?php echo $help_total; ?>"><?php echo $entry_total; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="measoftshipping_total" value="<?php echo $measoftshipping_total; ?>" placeholder="<?php echo $entry_total; ?>" id="input-total" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-tax-class"><?php echo $entry_tax_class; ?></label>
            <div class="col-sm-10">
              <select name="measoftshipping_tax_class_id" id="input-tax-class" class="form-control">
                <option value="0"><?php echo $text_none; ?></option>
                <?php foreach ($tax_classes as $tax_class) { ?>
                <?php if ($tax_class['tax_class_id'] == $measoftshipping_tax_class_id) { ?>
                <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-geo-zone"><?php echo $entry_geo_zone; ?></label>
            <div class="col-sm-10">
              <select name="measoftshipping_geo_zone_id" id="input-geo-zone" class="form-control">
                <option value="0"><?php echo $text_all_zones; ?></option>
                <?php foreach ($geo_zones as $geo_zone) { ?>
                <?php if ($geo_zone['geo_zone_id'] == $measoftshipping_geo_zone_id) { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="measoftshipping_status" id="input-status" class="form-control">
                <?php if ($measoftshipping_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-10">
              <input type="text" name="measoftshipping_sort_order" value="<?php echo $measoftshipping_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?> 
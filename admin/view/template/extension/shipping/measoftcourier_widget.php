<?php //include '../config.php'
if ($mass) {
    echo "<script>
    var ksProductWeight = {'weight':".$mass."};
    </script>";
}
?>

<div class="measoft-wrapper panel">
    <div class="measoft-title">
        <img class="measoft-logo" src="/admin/view/image/measoftcourier/logo.png">
        Курьерская служба
    </div>
    <div class="measoft-content">
        <form id="measoft-form-status" class="measoft-form-status" action="/admin/index.php?route=extension/module/measoftcourier/ajax&action=status" method="get">
            <input type="hidden" name="token" value="">
            <input type="hidden" name="order_id" value="">
            <div class="loading">Получение статуса заказа</div>
            <div class="loaded"><strong>Статус:</strong> <span class="status"></span></div>
        </form>
        <form id="measoft-form-send" class="measoft-form-send" action="/admin/index.php?route=extension/module/measoftcourier/ajax&action=send" method="get">
            <input type="hidden" name="token" value="" />
            <input type="hidden" name="order_id" value="" />
            <div class="form-group">
                <label>Дата доставки <span>(в формате "YYYY-MM-DD")</span></label>
                <input class="datetimepicker-date form-control" type="text" name="date" value="<?php echo date('Y-m-d', time() + 3600 * 24); ?>" required="required" />
            </div>
            <!--<div class="form-group">
                <label><span>Сумма наложенного платежа:</span></label>
                <input class="form-control" type="text" name="price" value="<?php echo $price; ?>" required="required" />
            </div>-->

            <div class="form-group meamap_admin">
                <label><span>Выбор ПВЗ:</span></label>
                <div class="measoftWrapper">
                    <div id="measoftmapblock"></div>
                    <input type="hidden" name="pvz_id" class="pvzcode" value="<?php echo $orderdata['pvz_id']; ?>">
                    <input type="text" readonly name="pvz_name" id="pvzname" placeholder='Нажмите кнопку справа для выбора ПВЗ' value="<?php echo $orderdata['pvz_name']; ?>">
                    <button type="button" id='ks2008_clean_pvz' class="btn btn-default btn-xs" title="Очистить ПВЗ"><img src='/admin/view/image/measoftcourier/cross.png'></button>
                </div>
            </div>
            <div class="form-group">
                <label>Время доставки <span>(в формате "HH:MM")</span></label>
                <table style="width:100%;">
                    <tr>
                        <td class="from">с&nbsp;&nbsp;</td>
                        <td>
                            <input class="datetimepicker-time form-control" type="text" name="time_min" value="10:00" required="required" />
                        </td>
                        <td class="to">до&nbsp;&nbsp;</td>
                        <td>
                            <input class="datetimepicker-time form-control" type="text" name="time_max" value="18:00" required="required" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="form-group">
                <input class="btn btn-default" type="submit" value="Отправить заказ" />
            </div>
        </form>
    </div>
</div>

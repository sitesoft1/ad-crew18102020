/*
 * @copyright Copyright &copy; Компания MEAsoft, 2014
 */

$(function(){
    new measoftPlugin();
});

function measoftPlugin()
{
    var route = getURLVar('route');

    if (route != 'sale/order/edit' && route != 'sale/order/info' && route != 'sale/order/update') {
        return;
    }

    var wrapper, formStatus, formSend;
    var container = $('.panel-body');
    if (container.length == 0) {
        container = $('.box .content');
    } else if (container.length > 1) {
        container = $(container[0]);
    }

    var urlBase = location.origin + location.pathname.replace('admin/index.php', '');
    var urlPlugin = urlBase + 'admin/view/stylesheet/measoftcourier/';

    // отображение контейнера Measoft на странице
    $.ajax({
        type: 'get',
        url: '/admin/index.php?route=extension/module/measoftcourier/ajax&action=courierTemplate&token=' + getURLVar('token') + '&order_id=' + getURLVar('order_id'),
        dataType: 'html',
        success: function(result, textStatus, jqXHR) {
            $('<link/>', {
                rel: 'stylesheet',
                type: 'text/css',
                href: urlPlugin + 'style.css'
            }).appendTo('head');
            container.prepend(result);
            wrapper = $('.measoft-wrapper');
            formStatus = $('.measoft-form-status');
            formSend = $('.measoft-form-send');
            wrapper.find('input[name=token]').attr('value', getURLVar('token'));
            wrapper.find('input[name=order_id]').attr('value', getURLVar('order_id'));
            checkStatus();
        }
    });

    // проверка статуса
    function checkStatus() {
        $.ajax({
            url: formStatus.attr('action'),
            type: formStatus.attr('methom'),
            data: formStatus.serialize(),
            dataType: 'json',
            beforeSend: function(jqXHR, settings) {
                wrapper.addClass('process');
            },
            success: function(result, textStatus, jqXHR) {
                wrapper.removeClass('process');
                formStatus.find('.status').html(result.data.message);

                if (result.data.action == 'show_form_send') {
                    formSend.show();
                } else {
                    formSend.hide();
                }

            }
        });
    }

    // отправка заказа
    $(container).on('submit', '.measoft-form-send', function() {
        if (!confirm('Отправить заказ?')) {
            return false;
        }
        $.ajax({
            url: formSend.attr('action'),
            type: formSend.attr('method'),
            data: formSend.serialize(),
            dataType: 'json',
            beforeSend: function(jqXHR, settings) {
                wrapper.addClass('process');
            },
            success: function(result, textStatus, jqXHR) {
                wrapper.removeClass('process');
                if (result.data.message) {
                    alert(result.data.message);
                }
                if (result.data.action == 'reload_status') {
                    checkStatus();
                }
            }
        });
        return false;
    });

    function pvzMap(){
            if (!ks2008client.id) {
                alert("Индентификационный номер клиента не заполнен в настройках.");
                return;
            }
            var weight = 0.1;
            if (ksProductWeight.weight) {
                weight = ksProductWeight.weight;
            } else if (!ks2008client.default_weight) {
                alert("Поле \"вес\" не заполнено в настройках.");
                return;
            } else {
                weight = ks2008client.default_weight;
            }

            var width = 600;
            var height = 400;

            if (ks2008client.width && ks2008client.height) {
                width = ks2008client.width;
                height = ks2008client.height;
            }

            var measoftObject = measoftMap.config({
                'pvzCodeSelector': '.pvzcode',
                'mapSearchZoom': 10,
                'pvzNameSelector': '#pvzname',
                'mapBlock': 'measoftmapblock',
                'client_id': ks2008client.id,		// Сюда нужно указать код extra курьерской службы
                'mapSize': {						// Размер карты
                    'width': width,
                    'height': height
                },
                'centerCoords': ['55.755814', '37.617635'],
                'showMapButton': '1',
                'showMapButtonCaption': 'Выбор на карте',
                'filter': {
                    'acceptcard': 'YES',    // Можно добавлять acceptcash (принимают наличные), acceptcard (Принимают карты), acceptfitting (Есть примерка), acceptindividuals (Если вы-физ. лицо)
                    'maxweight': weight
                },
                'allowedFilterParams': ['acceptcash', 'acceptcard', 'acceptfitting'],
            }).init();
        }

    if ($('#measoftMapBlock').length > 0) {
        pvzMap();
    } else {
        setTimeout(function(){
            pvzMap();
        },2000);
    }
}

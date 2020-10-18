$(document).ready(function() {

    var flagInterval = true;

    function mapint() {

            if ($('input[value="measoftshipping.measoftshipping"]').length > 0) {
                var style = '';
                if (!$('input[value="measoftshipping.measoftshipping"]').is(':checked')) {
                    style = "style='display:none;'";
                }

                var html = "<div class='form-group meamap' "+style+"><div class='measoftWrapper'><div id='measoftmapblock'></div><input type='hidden' name='pvz_id' class='pvzcode'><input type='text' readonly name='pvz_name' id='pvzname' placeholder='Нажмите кнопку справа для выбора ПВЗ'><br><input type='hidden' readonly name='pvz_city' id='pvz_city'><button type=\"button\" id='ks2008_clean_pvz' class=\"btn btn-default btn-xs\" title=\"Очистить ПВЗ\"><img src='/admin/view/image/measoftcourier/cross.png'></button></div></div>";

                $('#measoftshipping\\.measoftshipping').parent().parent().after(html);

                var weight = 0.1;

                if (jQuery(document).find('#ksProductWeight')) {
                    weight = jQuery(document).find('#ksProductWeight').val();
                }

                var width = 600;
                var height = 400;

                if (ks2008client.width && ks2008client.height) {
                    width = ks2008client.width;
                    height = ks2008client.height;
                }
                if (!ks2008client.id) {
                    alert("Индентификационный номер клиента не заполнен в настройках.");
                    return;
                }

                // town filter
                var shipping_city_value = '';

                if (document.querySelector('.hidden_city_info')) {
                    shipping_city_value = document.querySelector('.hidden_city_info').innerHTML;
                    if (document.querySelector('#pvz_city')) {
                        document.querySelector('#pvz_city').value = shipping_city_value;
                    }
                }
                // town filter


                if (shipping_city_value != '') {
                    var measoftObject = measoftMap.config({
                        'pvzCodeSelector': '.pvzcode',
                        'mapSearchZoom': 10,
                        'pvzNameSelector': '#pvzname',
                        'mapBlock': 'measoftmapblock',
                        'townBlock': 'pvz_city',
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
                    });

                } else {
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
                    });
                }

                measoftObject.init();

                flagInterval = false;

            }
    }

 if (document.querySelector('#accordion') || document.querySelector('#simplecheckout_shipping')) {
    setInterval(function(){
        var accordion = document.querySelector('#accordion');
        if (accordion !== null) {
            var shippingMethodWrapper = accordion.querySelectorAll('.panel');
        } else {
            var shippingMethodWrapper = null;
        }


        if (document.querySelector('.measoftWrapper')) {
            var measoftWrapper = document.querySelector('.measoftWrapper');
            if (document.querySelector('#accordion')) {
                measoftWrapper.style.width = (accordion.offsetWidth - 35) + 'px';
            } else if(document.querySelector('#measoft-form-send')) {
                measoftWrapper.style.width = (document.querySelector('#measoft-form-send').offsetWidth) + 'px';
            }
        }

        if (document.querySelector('.meamap')) {
            if (document.querySelector('#pvz_map_container').offsetHeight > 100) {
                document.querySelector('.meamap').parentNode.parentNode.parentNode.style.overflow = 'scroll';
            } else {
                document.querySelector('.meamap').parentNode.parentNode.parentNode.style.overflow = 'hidden';
            }
        }

        if (shippingMethodWrapper !== null) {
            if (shippingMethodWrapper.offsetHeight < 100) {
                flagInterval = true;
            }
        }

        if (flagInterval && shippingMethodWrapper !== null && shippingMethodWrapper.offsetHeight > 100) {
            if (document.querySelector('.meamap')) {
                let meamapToDelete = document.querySelector('.meamap');
                meamapToDelete.parentNode.removeChild(meamapToDelete);
            }

            mapint();
            flagInterval = false;
        } else if ($('#simplecheckout_shipping').length > 0 && !$('.meamap').length) {
            mapint();
            flagInterval = false;
        }

        if (document.querySelector('#open_map_button')) {
            document.querySelector('#open_map_button').setAttribute('title', 'Открыть карту');
        }

        if (document.querySelector('#pvzname') != 'undefined' && document.querySelector('#pvzname') != null) {
            if (document.querySelector('#pvzname').value == '' && !document.querySelector('#simplecheckout_shipping')) {
                document.querySelector('#button-shipping-method').disabled = true;
            }
        }
        if (document.querySelector('#button-shipping-method') && document.querySelector('#pvzname') && !document.querySelector('#simplecheckout_shipping')) {
            if (document.querySelector('#button-shipping-method').disabled) {
                document.querySelector('#pvzname').style.cssText = 'border: 1px solid #ff4a4a';
            } else {
                document.querySelector('#pvzname').style.cssText = 'border: 1px solid #666';
            }
        }
    },1000);
 }

    jQuery('body').on('change', 'input[name="shipping_method"]', function(){
        if (jQuery(this).val() == 'measoftshipping.measoftshipping') {
            jQuery('.meamap').css('display','block');
        } else {
            jQuery('.meamap').css('display','none');
        }
        if (jQuery(this).val() == 'measoftshipping.measoftshipping' && !jQuery('.pvzcode').val()) {
            jQuery("#button-shipping-method").attr('disabled',true);
        } else {
            jQuery("#button-shipping-method").removeAttr('disabled');
        }

    });

    jQuery('body').on('change', '.pvzcode', function(){
        if (jQuery(this).val()) {
            jQuery("#button-shipping-method").removeAttr('disabled');
        } else {
            jQuery("#button-shipping-method").attr('disabled',true);
        }
    });
    jQuery("#button-shipping-method").on('click', function(){
        if (jQuery(this).attr('disabled')) {
            alert('Выберите ПВЗ.');
        }
    });

    jQuery('body').on('click', '#ks2008_clean_pvz', function(){
        jQuery('#pvzname').val('');
        jQuery('.pvzcode').val('');
        jQuery("#button-shipping-method").attr('disabled',true);
    });

});

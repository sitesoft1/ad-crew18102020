;

function dadataCheckoutCheckout() {
    UserDadata({
        type: 'fio',
        delay: 777,
        queue: [{
            awaiting: "#tab-order [name='firstname']", prefetch: function (target) {
                return {query: '', parts: ['NAME', 'PATRONYMIC']}
            }, callback: function (suggest, helper, element) {
                return helper('name patronymic', suggest);
            }
        }]
    });
    UserDadata({
        type: 'fio',
        delay: 777,
        queue: [{
            awaiting: "#tab-order [name='shipping_firstname']", prefetch: function (target) {
                return {query: '', parts: ['NAME', 'PATRONYMIC']}
            }, callback: function (suggest, helper, element) {
                return helper('name patronymic', suggest);
            }
        }]
    });
    UserDadata({
        type: 'fio',
        delay: 777,
        queue: [{
            awaiting: "#tab-order [name='lastname']", prefetch: function (target) {
                return {query: '', parts: ['SURNAME']}
            }, callback: function (suggest, helper, element) {
                return helper('surname', suggest);
            }
        }]
    });
    UserDadata({
        type: 'fio',
        delay: 777,
        queue: [{
            awaiting: "#tab-order [name='shipping_lastname']", prefetch: function (target) {
                return {query: '', parts: ['SURNAME']}
            }, callback: function (suggest, helper, element) {
                return helper('surname', suggest);
            }
        }]
    });
    UserDadata({
        type: 'email',
        delay: 777,
        queue: [{
            awaiting: "#tab-order [name='email']", callback: function (suggest, helper, element) {
                return helper('value', suggest);
            }
        }]
    });
    UserDadata({
        type: 'address',
        delay: 777,
        queue: [{
            awaiting: "#tab-order [name='shipping_zone_id']", callback: function (suggest, helper, element) {
                return helper('region', suggest);
            }
        }, {
            awaiting: "#tab-order [name='shipping_city']", clear: true, prefetch: function (target) {
                return {
                    locations: [JSON.parse(target.getAttribute('data-dadata'))],
                    from_bound: {'value': 'city'},
                    to_bound: {'value': 'city'},
                    restrict_value: true,
                    query: ''
                }
            }, callback: function (suggest, helper, element) {
                let res = (helper('city_fias_id', suggest, true) || helper('area_fias_id', suggest, true) || helper('region_fias_id', suggest, true));
                element.setAttribute('data-dadata', res);
                return helper('city_with_type', suggest);
            }
        }, {
            awaiting: "#tab-order [name='shipping_address_1']", clear: true, prefetch: function (target) {
                return {
                    'locations': [JSON.parse(target.getAttribute('data-dadata'))],
                    'from_bound': {'value': 'street',},
                    'to_bound': {'value': 'flat',},
                    'restrict_value': true,
                    'query': ''
                }
            }, callback: function (suggest, helper, element) {
                let res = (helper('settlement_fias_id', suggest, true) || helper('city_fias_id', suggest, true));
                element.setAttribute('data-dadata', res);
                return helper('street_with_type, house_type.house, block_type-block, flat_type.flat', suggest);
            }
        }, {
            awaiting: "#tab-order [name='address_2']", clear: true, prefetch: function (target) {
                return {
                    'locations': [JSON.parse(target.getAttribute('data-dadata'))],
                    'from_bound': {'value': 'street',},
                    'to_bound': {'value': 'flat',},
                    'restrict_value': true,
                    'query': ''
                }
            }, callback: function (suggest, helper, element) {
                let res = (helper('settlement_fias_id', suggest, true) || helper('city_fias_id', suggest, true));
                element.setAttribute('data-dadata', res);
                return helper('street_with_type, house_type.house, block_type-block, flat_type.flat', suggest);
            }
        }, {
            awaiting: "#tab-order [name='shipping_postcode']", callback: function (suggest, helper, element) {
                return helper('postal_code', suggest);
            }
        }]
    });
    UserDadata({
        type: 'fio',
        delay: 777,
        queue: [{
            awaiting: "#tab-order [name='firstname']", prefetch: function (target) {
                return {query: '', parts: ['NAME', 'PATRONYMIC']}
            }, callback: function (suggest, helper, element) {
                return helper('name patronymic', suggest);
            }
        }]
    });
    UserDadata({
        type: 'fio',
        delay: 777,
        queue: [{
            awaiting: "#tab-order [name='lastname']", prefetch: function (target) {
                return {query: '', parts: ['SURNAME']}
            }, callback: function (suggest, helper, element) {
                return helper('surname', suggest);
            }
        }]
    });
    UserDadata({
        type: 'address',
        delay: 777,
        queue: [{
            awaiting: "#tab-order [name='shipping_zone_id']",
            callback: function (suggest, helper, element) {
                return helper('region', suggest);
            }
        }, {
            awaiting: "#tab-order [name='shipping_city']", clear: true, prefetch: function (target) {
                return {
                    locations: [JSON.parse(target.getAttribute('data-dadata'))],
                    from_bound: {'value': 'city'},
                    to_bound: {'value': 'city'},
                    restrict_value: true,
                    query: ''
                }
            }, callback: function (suggest, helper, element) {
                let res = (helper('city_fias_id', suggest, true) || helper('area_fias_id', suggest, true) || helper('region_fias_id', suggest, true));
                element.setAttribute('data-dadata', res);
                return helper('city_with_type', suggest);
            }
        }, {
            awaiting: "#tab-order [name='shipping_address_1']", clear: true, prefetch: function (target) {
                return {
                    'locations': [JSON.parse(target.getAttribute('data-dadata'))],
                    'from_bound': {'value': 'street',},
                    'to_bound': {'value': 'flat',},
                    'restrict_value': true,
                    'query': ''
                }
            }, callback: function (suggest, helper, element) {
                let res = (helper('settlement_fias_id', suggest, true) || helper('city_fias_id', suggest, true));
                element.setAttribute('data-dadata', res);
                return helper('street_with_type, house_type.house, block_type-block, flat_type.flat', suggest);
            }
        }, {
            awaiting: "#tab-order [name='address_2']", clear: true, prefetch: function (target) {
                return {
                    'locations': [JSON.parse(target.getAttribute('data-dadata'))],
                    'from_bound': {'value': 'street',},
                    'to_bound': {'value': 'flat',},
                    'restrict_value': true,
                    'query': ''
                }
            }, callback: function (suggest, helper, element) {
                let res = (helper('settlement_fias_id', suggest, true) || helper('city_fias_id', suggest, true));
                element.setAttribute('data-dadata', res);
                return helper('street_with_type, house_type.house, block_type-block, flat_type.flat', suggest);
            }
        }, {
            awaiting: "#tab-order [name='shipping_postcode']", callback: function (suggest, helper, element) {
                return helper('postal_code', suggest);
            }
        }]
    });
};$(document).on('ajaxSuccess', function (event, jqxhr, settings) {
    if (true) {
        dadataCheckoutCheckout();
    }
});
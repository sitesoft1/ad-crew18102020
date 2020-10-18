<?php
/**
 * @copyright Copyright &copy; Компания MEAsoft, 2014
 */
defined('_MEASOFT_LOGO_') || define('_MEASOFT_LOGO_', '/admin/view/image/measoftcourier/logo.png');
defined('_MEASOFT_ORDER_STATUS_FREE_SHIPPING_') || define('_MEASOFT_ORDER_STATUS_FREE_SHIPPING_', 0);
defined('_MEASOFT_ORDER_NEW_STATUS_') || define('_MEASOFT_ORDER_NEW_STATUS_', 0);
defined('_MEASOFT_MODULE_VERSION_') || define('_MEASOFT_MODULE_VERSION_', '3.2.3');
require_once(DIR_SYSTEM.'library/measoft/measoftcourier.class.php');

/**
 * ControllerModuleMeasoftcourier содержит экшны для работы с модулем measoftcourier.
 */
class ControllerExtensionModuleMeasoftcourier extends Controller
{
    /**
     * Метод отвечает за страницу настроек модуля в панели администратора.
     */
    public function index()
    {
        // не даем менять настройки модуля
        $url = $this
            ->url
            ->link('extension/extension', 'token=' . $this
            ->session
            ->data['token'], true);
        version_compare(VERSION, '2.0.0.0') < 0 ? $this->redirect($url) : $this
            ->response
            ->redirect($url);

        $this
            ->load
            ->language('extension/module/measoftcourier');
        $this
            ->load
            ->model('extension/extension');

        // gether page text params
        $data['header'] = $this
            ->load
            ->controller('common/header');
        $data['column_left'] = $this
            ->load
            ->controller('common/column_left');
        $data['footer'] = $this
            ->load
            ->controller('common/footer');
        $data['entry_status'] = $this
            ->language
            ->get('entry_status');
        $data['button_save'] = $this
            ->language
            ->get('button_save');
        $data['button_cancel'] = $this
            ->language
            ->get('button_cancel');
        $data['text_edit'] = $this
            ->language
            ->get('text_edit');
        $data['text_enabled'] = $this
            ->language
            ->get('text_enabled');
        $data['text_disabled'] = $this
            ->language
            ->get('text_disabled');
        $data['text_title'] = $this
            ->language
            ->get('text_title');
        $data['text_login'] = $this
            ->language
            ->get('text_login');
        $data['text_password'] = $this
            ->language
            ->get('text_password');
        $data['text_client_id'] = $this
            ->language
            ->get('text_client_id');
        $data['text_logo'] = $this
            ->language
            ->get('text_logo');

        // gether breadcrumbs
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' => $this
                ->language
                ->get('text_home') ,
            'href' => $this
                ->url
                ->link('common/dashboard', 'token=' . $this
                ->session
                ->data['token'], true)
        );
        $data['breadcrumbs'][] = array(
            'text' => $this
                ->language
                ->get('text_module') ,
            'href' => $this
                ->url
                ->link('extension/extension', 'token=' . $this
                ->session
                ->data['token'], true)
        );
        $data['breadcrumbs'][] = array(
            'text' => $this
                ->language
                ->get('heading_title') ,
            'href' => $this
                ->url
                ->link('module/measoft', 'token=' . $this
                ->session
                ->data['token'], true)
        );

        if (isset($this->error['warning']))
        {
            $data['error_warning'] = $this->error['warning'];
        }
        else
        {
            $data['error_warning'] = '';
        }

        if (isset($this
            ->request
            ->post['information_status']))
        {
            $data['information_status'] = $this
                ->request
                ->post['information_status'];
        }
        else
        {
            $data['information_status'] = $this
                ->config
                ->get('information_status');
        }

        $data['cancel'] = $this
            ->url
            ->link('extension/extension', 'token=' . $this
            ->session
            ->data['token'], true);

        if (!isset($this
            ->request
            ->get['module_id']))
        {
            $data['action'] = $this
                ->url
                ->link('extension/module/measoft', 'token=' . $this
                ->session
                ->data['token'], true);
        }
        else
        {
            $data['action'] = $this
                ->url
                ->link('extension/module/measoft', 'token=' . $this
                ->session
                ->data['token'] . '&module_id=' . $this
                ->request
                ->get['module_id'], true);
        }

        $module_info = array();
        if (isset($this
            ->request
            ->get['module_id']) && ($this
            ->request
            ->server['REQUEST_METHOD'] != 'POST'))
        {
            $module_info = $this
                ->model_extension_module
                ->getModule($this
                ->request
                ->get['module_id']);
        }

        // авторизационные данные для Measoft API.
        if (isset($this
            ->request
            ->post['client_id']))
        {
            $data['client_id'] = $this
                ->request
                ->post['client_id'];
        }
        elseif (isset($module_info['client_id']))
        {
            $data['client_id'] = $module_info['client_id'];
        }
        else
        {
            $data['client_id'] = '';
        }
        if (isset($this
            ->request
            ->post['login']))
        {
            $data['login'] = $this
                ->request
                ->post['login'];
        }
        elseif (isset($module_info['login']))
        {
            $data['login'] = $module_info['login'];
        }
        else
        {
            $data['login'] = '';
        }
        if (isset($this
            ->request
            ->post['password']))
        {
            $data['password'] = $this
                ->request
                ->post['password'];
        }
        elseif (isset($module_info['password']))
        {
            $data['password'] = $module_info['password'];
        }
        else
        {
            $data['password'] = '';
        }

        $this
            ->response
            ->setOutput($this
            ->load
            ->view('extension/module/measoftcourier.tpl', $data));
    }

    /**
     * Метод для Ajax запросов.
     */
    public function ajax()
    {
        $action = $this
            ->request
            ->get['action'];
        $action = 'action' . ucfirst($action);

        $this->$action();
    }

    /**
     * Вывод формы для тправки заказа.
     */
    public function actionCourierTemplate()
    {
        $order_id = isset($_REQUEST['order_id']) ? intval($_REQUEST['order_id']) : 0;

        $courier_order = $this->getOrder($order_id, $this
            ->config
            ->get('measoftshipping_prefix'));
        $price = number_format($courier_order['info']['price'], 2, '.', '');

        $this
            ->load
            ->model('sale/order');
        $this
            ->load
            ->model('catalog/product');

        $orderdata = $this
            ->model_sale_order
            ->getOrder($order_id);

        $products = $this
            ->model_sale_order
            ->getOrderProducts($order_id);

        $mass = 0;
        if (is_array($products))
        {
            foreach ($products as $p)
            {
                $product = $this
                    ->model_catalog_product
                    ->getProduct($p['product_id']);

                if (isset($product['weight']) && $product['weight'] && isset($product['weight_class_id'])) {
                    $this->load->model('localisation/weight_class');

            		$weight_classes = $this->model_localisation_weight_class->getWeightClasses();

                    foreach ($weight_classes as $weight_class) {

                        if ($weight_class['weight_class_id'] == $product['weight_class_id']) {
                            if (
                                $weight_class['unit'] == 'g' || 
                                $weight_class['title'] == 'Gram' || 
                                $weight_class['unit'] == 'г' || 
                                $weight_class['title'] == 'Граммы' || 
                                $weight_class['title'] == 'граммы' || 
                                $weight_class['title'] == 'Грамм' || 
                                $weight_class['title'] == 'грамм'
                            ) {
                                $product['weight'] = $product['weight'] / 1000;
                            }
                        }
                    }

                }
                $mass += isset($product['weight']) && $product['weight'] ? floatval($product['weight']) * floatval($p['quantity']) : 0.1;
            }
        }
        if (!$mass)
        {
            $mass = $this
                ->config
                ->get('measoftshipping_weight');
        }

        if (!isset($orderdata['pvz_id']))
        {
            $orderdata['pvz_id'] = '';
        }
        if (!isset($orderdata['pvz_name']))
        {
            $orderdata['pvz_name'] = '';
        }

        include $_SERVER['DOCUMENT_ROOT'] . '/admin/view/template/extension/shipping/measoftcourier_widget.php';
    }

    /**
     * Получение статуса о заказе.
     */
    private function actionStatus()
    {
        $this
            ->load
            ->language('extension/module/measoftcourier');

        $order_id = isset($_REQUEST['order_id']) ? intval($_REQUEST['order_id']) : 0;

        // получаем объект для запросов
        $courier_object = $this->getCourierObject();

        // получаем статус
        if ($status = $courier_object->statusRequest(Measoft::orderNoTransform($order_id, $this
            ->config
            ->get('measoftshipping_prefix') , $this
            ->config
            ->get('measoftshipping_length'))))
        {

            self::sendRespond($status);
        }
        else
        {
            self::sendRespond(print_r($courier_object->errors, true) , 'show_form_send');
        }

        return;
    }

    /**
     * Отправка заказа в API.
     */
    private function actionSend()
    {
        $order_id = isset($_REQUEST['order_id']) ? intval($_REQUEST['order_id']) : 0;
        $shipping = isset($_REQUEST['shipping']) ? floatval($_REQUEST['shipping']) : 0;
        $date = isset($_REQUEST['date']) ? (string)$_REQUEST['date'] : '';
        $time_min = isset($_REQUEST['time_min']) ? (string)$_REQUEST['time_min'] : '';
        $time_max = isset($_REQUEST['time_max']) ? (string)$_REQUEST['time_max'] : '';
        $price = isset($_REQUEST['price']) ? (float)$_REQUEST['price'] : null;
        $pvz_id = isset($_REQUEST['pvz_id']) ? (float)$_REQUEST['pvz_id'] : null;
        $pvz_name = isset($_REQUEST['pvz_name']) ? intval($_REQUEST['pvz_name']) : null;

        // получаем дату доставки
        if (!$date || !$time_min || !$time_max)
        {
            self::sendRespond('Укажите дату и время доставки');
        }

        $courier_order = $this->getOrder($order_id, $this
            ->config
            ->get('measoftshipping_prefix') , $shipping, $date, $time_min, $time_max);

        if ($pvz_name) {
            $courier_order['info']['address'] = $pvz_name;
        }
        if ($price)
        {
            $courier_order['info']['price'] = $price;
        }
        if ($pvz_id)
        {
            $courier_order['info']['pvz'] = $pvz_id;
        }

        // получаем объект для запросов и проверяем данные заказа на валидность
        $courier_object = $this->getCourierObject();
        $courier_object->orderValidate($courier_order['info'], $courier_order['items']);

        // отправляем заказ
        if ($courier_object->errors || !$courier_object->orderRequest($courier_order['info'], $courier_order['items']))
        {
            self::sendRespond('При отправке заказа произошли ошибки: ' . print_r($courier_object->errors, true));
        }
        else
        {
            self::sendRespond('Заказ №' . $order_id . ' успешно отправлен.', 'reload_status');
        }

        return;
    }

    /**
     *
     */
    private function actionShipping()
    {
        $order_id = isset($_REQUEST['order_id']) ? intval($_REQUEST['order_id']) : 0;
        echo $this->getOrderShipping($order_id);
        exit();
    }

    /**
     *
     */
    private function actionDump()
    {
        $order_id = isset($_REQUEST['order_id']) ? intval($_REQUEST['order_id']) : 0;
        $this
            ->load
            ->model('sale/order');

        ob_start();

        print_r($this->getOrder($order_id, $this
            ->config
            ->get('measoftshipping_prefix') , $this->getOrderShipping($order_id)));
        print_r($this
            ->model_sale_order
            ->getOrder($order_id));
        print_r($this
            ->model_sale_order
            ->getOrderProducts($order_id));

        $result = ob_get_clean();
        echo $result;
    }

    /**
     * Получение данных о заказе для отсылки через объект Measoft.
     */
    private function getOrder($order_id, $prefix = '', $shipping = 0, $date = null, $time_min = null, $time_max = null)
    {
        $this
            ->load
            ->model('sale/order');
        $order = $this
            ->model_sale_order
            ->getOrder($order_id);
        $products = $this
            ->model_sale_order
            ->getOrderProducts($order_id);

        $company = null;
        if ($order['shipping_company'])
        {
            $company = $order['shipping_company'];
        }
        else if ($order['payment_company'])
        {
            $company = $order['payment_company'];
        }

        $name = null;
        if ($order['shipping_firstname'])
        {
            $name = self::implode(' ', $order['shipping_firstname'], $order['shipping_lastname']);
        }
        else if ($order['payment_firstname'])
        {
            $name = self::implode(' ', $order['payment_firstname'], $order['payment_lastname']);
        }

        $city = null;
        if ($order['shipping_city'])
        {
            $city = trim(str_replace('г.', '', $order['shipping_city']));
        }
        else if ($order['payment_city'])
        {
            $city = trim(str_replace('г.', '', $order['payment_city']));
        }

        $addr = null;
        if ($order['shipping_address_1'])
        {
            $addr = self::implode(', ', $order['shipping_postcode'], $order['shipping_address_1'], $order['shipping_address_2']);
        }
        else if ($order['payment_address_1'])
        {
            $addr = self::implode(', ', $order['payment_postcode'], $order['payment_address_1'], $order['payment_address_2']);
        }

        $zipcode = '';
        if ($order['shipping_postcode'])
        {
            $zipcode = $order['shipping_postcode'];
        }
        else if ($order['payment_postcode'])
        {
            $zipcode = $order['payment_postcode'];
        }

        // модуль отправитель заказа
        $order_info['sender'] = self::getSender();
        // номер заказа
        $order_info['orderno'] = Measoft::orderNoTransform($order_id, $prefix, $this
            ->config
            ->get('measoftshipping_length'));

        if ($company)
        {
            // компания-получатель. Должно быть заполнено company ИЛИ person
            $order_info['company'] = $company;
        }
        // контактное лицо, должно быть заполнено company ИЛИ person
        if ($name)
        {
            $order_info['person'] = $name;
        }
        // телефон, можно указывать несколько телефонов
        $order_info['phone'] = $order['telephone'];
        $order_info['town'] = $city;
        $order_info['zipcode'] = $zipcode;
        $order_info['address'] = $addr;
        // сумма заказа
        $order_info['price'] = number_format($order['total'], 2, '.', '');
        // объявленная стоимость
        $order_info['inshprice'] = number_format($order['total'], 2, '.', '');
        // поручение
        $order_info['instruction'] = $order['comment'];
        // дата доставки в формате "YYYY-MM-DD"
        $order_info['date'] = $date;
        // желаемое время доставки в формате "HH:MM"
        $order_info['time_min'] = $time_min;
        // желаемое время доставки в формате "HH:MM"
        $order_info['time_max'] = $time_max;
        $order_info['barcode'] = null;
        $order_info['quantity'] = null;
        $order_info['weight'] = null;

        $order_info['deliveryprice'] = number_format($this->getOrderShipping($order_id) , 2, '.', '');

        $order_items = array();
        $enclosure = '';
        $mass = 0;

        $this
            ->load
            ->model('catalog/product');
        if (is_array($products))
        {
            foreach ($products as $p)
            {
                $product_for_weight = $this
                    ->model_catalog_product
                    ->getProduct($p['product_id']);
                $after_name = '';
                $options = $this
                    ->model_sale_order
                    ->getOrderOptions($order_id, $p['order_product_id']);

                if ($options)
                {
                    foreach ($options as $option) $after_name .= ' ' . $option['value'];
                }

                $retprice = $p['price'] + $p['tax'];

                $order_items[] = array(
                    'name' => self::implode(' ', $p['name'], $after_name) ,
                    'article' => $this
                        ->config
                        ->get('measoftshipping_articles') && isset($p['article']) ? $p['article'] : '',
                    'barcode' => isset($p['barcode']) ? $p['barcode'] : '',
                    'quantity' => $p['quantity'],
                    'retprice' => number_format($retprice, 2, '.', '') ,
                    'mass' => isset($product_for_weight['weight']) ? $product_for_weight['weight'] : 0.1,
                );

                $enclosure .= $p['name'] . ', кол-во: ' . $p['quantity'] . '.';
                $mass += isset($product_for_weight['weight']) && $product_for_weight['weight'] ? floatval($product_for_weight['weight']) * floatval($p['quantity']) : 0.1;
            }

            if ($mass < $this
                ->config
                ->get('measoftshipping_weight'))
            {
                $mass = $this
                    ->config
                    ->get('measoftshipping_weight');
            }

            if ($shipping = $this->getOrderShipping($order_id))
            {
                $order_items[] = array(
                    'name' => 'Доставка',
                    'article' => '',
                    'barcode' => '',
                    'quantity' => 1,
                    'retprice' => number_format($shipping, 2, '.', '') ,
                    'mass' => $mass,
                );
            }
        }

        // наименование
        $order_info['enclosure'] = $enclosure;

        // масса посылки
        $order_info['weight'] = $mass;

        return array(
            'info' => $order_info,
            'items' => $order_items,
        );
    }

    /**
     * Извлекает стоимость доставки.
     */
    private function getOrderShipping($order_id)
    {
        // free shipping
        if (_MEASOFT_ORDER_STATUS_FREE_SHIPPING_)
        {
            $history = $this
                ->db
                ->query("SELECT oh.order_status_id FROM " . DB_PREFIX . "order_history oh WHERE oh.order_id = " . (int)$order_id)->rows;
            foreach ($history as $key => $value)
            {
                if ($value['order_status_id'] == _MEASOFT_ORDER_STATUS_FREE_SHIPPING_)
                {
                    return 0;
                }
            }
        }

        $this
            ->load
            ->model('sale/order');
        $totals = $this
            ->model_sale_order
            ->getOrderTotals($order_id);

        if ($totals)
        {
            foreach ($totals as $total)
            {
                if ($total['code'] == 'shipping')
                {
                    return $total['value'];
                }
            }
        }
    }

    private function setNewOrderStatus($order_id, $new_status_id, $comment = null)
    {
        if ($new_status_id)
        {
            $this
                ->load
                ->model('sale/order');

            $this
                ->model_sale_order
                ->addOrderHistory($order_id, array(
                'order_status_id' => $new_status_id,
                'comment' => $comment,
                'notify' => null,
            ));
        }
    }

    private static function implode()
    {
        $args = func_get_args();
        $glue = '';
        $pieces = array();

        foreach ($args as $i => $value)
        {
            if ($i == 0)
            {
                $glue = $value;
            }
            else if ($value)
            {
                $pieces[] = $value;
            }
        }

        if ($pieces)
        {
            return implode($glue, $pieces);
        }

        return '';
    }

    public function getCourierObject()
    {
        $login = $this
            ->config
            ->get('measoftshipping_login');
        $pass = $this
            ->config
            ->get('measoftshipping_password');
        $client_id = $this
            ->config
            ->get('measoftshipping_client_id');

        if (!$login || !$pass || !$client_id)
        {
            self::sendRespond('Проверьте аутентификационные данные');
        }

        return new Measoft($login, $pass, $client_id);
    }

    private static function sendRespond($message, $action = null)
    {
        echo json_encode(array(
            'data' => array(
                'message' => $message,
                'action' => $action,
            ) ,
        ));
        exit();
    }

    /**
     * Возвращает название CMS и Opencart версию.
     */
    public static function getSender()
    {
        return array(
            'module' => Measoft::OPENCART,
            'cms_version' => VERSION,
            'module_version' => _MEASOFT_MODULE_VERSION_,
        );
    }
}

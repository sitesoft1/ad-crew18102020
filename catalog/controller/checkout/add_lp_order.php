<?php
class ControllerCheckoutAddLpOrder extends Controller {
	public function index() {
	    
	    $product_id = $this->request->post['product_id'];
	    $name = trim($this->request->post['name']);
	    if(strpos($name,' ')){
            $name_arr = explode(' ', $name);
            $lastname = $name_arr[1];
        }else{
            $lastname = '';
        }
	    $telephone = $this->request->post['telephone'];
	    
	    $email = $this->request->post['telephone'];
        $email = preg_replace("/[^0-9]/", '', $email);
        $email = $email . '@mail.ru';

        $price = $this->request->post['price'];
        $site = $this->request->post['site'];
        $product = $this->request->post['product'];
        $message = $this->request->post['message'];
        
        $utm_source = $this->request->post['utm_source'];
        $utm_medium = $this->request->post['utm_medium'];
        $utm_content = $this->request->post['utm_content'];
        $utm_campaign = $this->request->post['utm_campaign'];
        $utm_term = $this->request->post['utm_term'];
        
	    $comment = 'Заказ с лендинга '.$site;
	    if(!empty($message)){ $comment .= ' '.PHP_EOL.$message.' '.PHP_EOL; }
	    if(!empty($utm_source)){ $comment .= ' utm_source='.$utm_source.PHP_EOL; }
	    if(!empty($utm_medium)){ $comment .= ' utm_medium='.$utm_medium.PHP_EOL; }
	    if(!empty($utm_content)){ $comment .= ' utm_content='.$utm_content.PHP_EOL; }
	    if(!empty($utm_campaign)){ $comment .= ' utm_campaign='.$utm_campaign.PHP_EOL; }
	    if(!empty($utm_term)){ $comment .= ' utm_term='.$utm_term; }
        $comment ='';
            
            
            
            //$this->wcLog('lp_order_post_log', $this->request->post, false);
        
        $this->load->model('checkout/order');
	    
        $product = $this->model_checkout_order->getLpProductData($product_id);
        //if(!empty($product)){ $product['name'] = $product; }
        
        $order_data['products'][] = array(
            'product_id' => $product_id,
            'name' => $product['name'],
            'model' => $product['model'],
            'quantity' => 1,
            'price' => $price,
            'total' => $price,
            'tax' => '',
            'reward' => '0',
            'option' => array()
        );
        
        
        $order_data['invoice_prefix'] = 'INV-'.date('Y-m-d-H');
        $order_data['firstname'] = $name;
        $order_data['lastname'] = $lastname;
        $order_data['email'] = $email;
        $order_data['telephone'] = $telephone;
        $order_data['payment_firstname'] = $name;
        $order_data['shipping_firstname'] = $name;
        $order_data['comment'] = $comment;
        $order_data['total'] = $price;
        $order_data['order_status_id'] = 1;
        $order_data['totals'] = array();
        $order_data['totals'][] = array(
            'code' => 'sub_total',
            'title' => 'Предварительная стоимость',
            'value' => $price,
            'sort_order' => '1',
        );
        $order_data['totals'][] = array(
            'code' => 'total',
            'title' => 'Итого',
            'value' => $price,
            'sort_order' => '20',
        );
        
        
        $order_data['invoice_prefix'] = 'INV-'.date('Y-m-d-H');
        $order_data['store_id'] = 0;
        $order_data['store_name'] = $site;
        $order_data['store_url'] = $site;
        $order_data['customer_id'] = '';
        $order_data['customer_group_id'] = 1;
        $order_data['firstname'] = $name;
        $order_data['lastname'] = $lastname;
        $order_data['email'] = $email;
        $order_data['telephone'] = $telephone;
        $order_data['fax'] = '';
        $order_data['custom_field'] = '';
        $order_data['payment_firstname'] = $name;
        $order_data['payment_lastname'] = $lastname;
        $order_data['payment_company'] = '';
        $order_data['payment_address_1'] = '';
        $order_data['payment_address_2'] = '';
        $order_data['payment_city'] = '';
        $order_data['payment_country'] = 'Российская Федерация';
        $order_data['payment_country_id'] = '176';
        $order_data['payment_zone'] = '';
        $order_data['payment_zone_id'] = '';
        $order_data['payment_address_format'] = '';
        $order_data['payment_custom_field'] = '';
        $order_data['payment_method'] = '';
        $order_data['payment_code'] = 'cod';
        $order_data['shipping_firstname'] = $name;
        $order_data['shipping_lastname'] = $lastname;
        $order_data['shipping_company'] = '';
        $order_data['shipping_address_1'] = '';
        $order_data['shipping_address_2'] = '';
        $order_data['shipping_city'] = '';
        $order_data['shipping_postcode'] = '';
        $order_data['shipping_country'] = 'Российская Федерация';
        $order_data['shipping_country_id'] = '176';
        $order_data['shipping_zone'] = '';
        $order_data['shipping_zone_id'] = '';
        $order_data['shipping_address_format'] = '';
        $order_data['shipping_custom_field'] = '';
        $order_data['shipping_method'] = 'Бесплатная доставка';
        $order_data['shipping_code'] = 'free.free';
        $order_data['payment_postcode'] = '';
        $order_data['comment'] = $comment;
        $order_data['total'] = $price;
        $order_data['totals'][] = array(
            'code' => 'sub_total',
            'title' => 'Предварительная стоимость',
            'value' => $price,
            'sort_order' => '1',
        );
        $order_data['totals'][] = array(
            'code' => 'total',
            'title' => 'Итого',
            'value' => $price,
            'sort_order' => '20',
        );
        $order_data['affiliate_id'] = '0';
        $order_data['commission'] = '0.0000';
        $order_data['marketing_id'] = '0';
        $order_data['tracking'] = '';
        $order_data['language_id'] = '1';
        $order_data['currency_id'] = '1';
        $order_data['currency_code'] = 'RUB';
        $order_data['currency_value'] = '1.00000000';
        $order_data['ip'] = '';
        $order_data['forwarded_ip'] = '';
        $order_data['user_agent'] = '';
        $order_data['accept_language'] = 'ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7';
        
        $this->session->data['order_id'] = $this->model_checkout_order->addLpOrder($order_data);
	}
    
    public function wcLog($filename, $data, $append=false)
    {
        if(!$append){
            file_put_contents(DIR_LOGS . '/'. $filename . '.txt', var_export($data,true));
        }else{
            file_put_contents(DIR_LOGS . '/'. $filename . '.txt', var_export($data,true).PHP_EOL, FILE_APPEND);
        }
        
    }
}

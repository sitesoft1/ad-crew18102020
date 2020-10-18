<?php
class ModelExtensionShippingMeasoftcouriershipping extends Model
{
    public function getQuote($address)
    {
        $method_data = array();

        $this->load->language('extension/shipping/measoftcouriershipping');

        if (!isset($address['zone_id'])) {
            $address['zone_id'] = '';
        }
        if (!isset($address['country_id'])) {
            $address['country_id'] = '';
        }

        require_once(DIR_SYSTEM.'library/measoft/measoftcourier.class.php');

        $measoft = new Measoft(
            $this->config->get('measoftshipping_login'),
            $this->config->get('measoftshipping_password'),
            $this->config->get('measoftshipping_client_id')
        );

        $town = '';
        if (isset($address['city']) && $address['city']) {
            $town = $address['city'];
        } else {
            return $method_data;
        }

        $cart_products = $this->cart->getProducts();
        $weight = 0;
        foreach ($cart_products as $cart_product) {
            if ($cart_product['weight_class_id'] == '2') {
				$weight += $cart_product['weight'] / 1000;
			} else {
				$weight += $cart_product['weight'];
			}
        }
        $weight = round($weight, 2);

        $result = $measoft->calculatorRequest([
            'townto' => $town,
            'townfrom' => $this->config->get('measoftshipping_city'),
            'mass' => $weight < $this->config->get('measoftshipping_weight') ? $this->config->get('measoftshipping_weight') : $weight,
            'zipcode' => isset($address['postcode']) ? $address['postcode'] : '',
        ], $this->config->get('measoftcouriershipping_services_delivery'));


        if ($result) {
            $cost = (double)$result->price
                * $this->config->get('measoftshipping_rate')
                + $this->config->get('measoftshipping_add_sum');
            $interval = '';
            if ($result->mindeliverydays || $result->maxdeliverydays) {
                $days = array();
                if ($result->mindeliverydays) {
                    $days[] = (int)$result->mindeliverydays;
                }
                if ($result->maxdeliverydays && (int)$result->maxdeliverydays != (int)$result->mindeliverydays) {
                    $days[] = (int)$result->maxdeliverydays;
                }

                $days_list = explode('|', $this->language->get('text_shipping_days'));

                $max_days = $days[count($days)-1];
                $interval = '';
                if ($max_days > 4) {
                    $days_text = $days_list[2];
                    $interval = ' ('.implode('-', $days).' '.$days_text.')';
                } elseif ($max_days > 1) {
                    $days_text = $days_list[1];
                    $interval = ' ('.implode('-', $days).' '.$days_text.')';
                } else {
                    $days_text = $days_list[0];
                }
            }

            if ($weight) {
                $ksProductWeight = $weight;
            } elseif ($this->config->get('measoftshipping_weight')) {
                $ksProductWeight = $this->config->get('measoftshipping_weight');
            } else {
                $ksProductWeight = 0.1;
            }

            $quote_data = array();

            $quote_data['measoftcouriershipping'] = array(
                'code'         => 'measoftcouriershipping.measoftcouriershipping',
                'title'        => $this->config->get('measoftshipping_courier_description'),
                'cost'         => $cost,
                'tax_class_id' => $this->config->get('measoftcouriershipping_tax_class_id'),
                'sort_order'   => $this->config->get('measoftshipping_sort_order'),
                'text'         => $this->currency->format($this->tax->calculate($cost, $this->config->get('measoftcouriershipping_tax_class_id'), $this->config->get('config_tax')), $this->session->data['currency'])
            );

            $method_data = array(
                'code'       => 'measoftcouriershipping',
                'title'      => $this->config->get('measoftshipping_courier_title') .$interval,
                'quote'      => $quote_data,
                'sort_order' => $this->config->get('measoftshipping_sort_order'),
                'error'      => false
            );
        }

        return $method_data;
    }
}

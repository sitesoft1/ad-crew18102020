<?php 
class ModelCheckoutRecalculate extends Model {
	public function getDopShipping($methods = array(), $address) {
		if (is_file(DIR_SYSTEM . 'library/simple/filterit.php')) {
			if (!$this->filterit && (method_exists($this->load, 'library') || get_class($this->load) == 'agooLoader')) {
				$this->load->library('simple/filterit');
			}
			if (!$this->filterit) {
				$this->filterit = new Simple\Filterit($this->registry);
			}
			$methods = $this->filterit->filterShipping($methods, $address);
		}
	
		return $methods;
	}
	
	public function getDopPayment($methods = array(), $address) {
		if (is_file(DIR_SYSTEM . 'library/simple/filterit.php')) {
			if (!$this->filterit && (method_exists($this->load, 'library') || get_class($this->load) == 'agooLoader')) {
				$this->load->library('simple/filterit');
			}
			if (!$this->filterit) {
				$this->filterit = new Simple\Filterit($this->registry);
			}
			$methods = $this->filterit->filterPayment($methods, $address);
		}
	
		return $methods;
	}
	
	public function getDopTotals($order_totals = array()) {
		return $order_totals;
	}
	
	public function getReward($data) {
		$result = array();
	
		$result['reward_total'] = '0';
		$result['reward_possibly'] = '0';
		$result['reward_recived'] = '0';
		$result['reward_cart'] = '0';
		$result['points'] = '0';
	
		if ($data['order_product']) {
			foreach ($data['order_product'] as $product_key => $order_product) {
				$product_query = $this->db->query("SELECT points FROM `" . DB_PREFIX . "product` WHERE `product_id` = '" . (int)$order_product['product_id'] . "'");
	
				if (isset($product_query->row['points']) && ($product_query->row['points'] > 0)) {
					$points = $product_query->row['points'];
				} else {
					$points = 0;
				}
	
				$query_reward = $this->db->query("SELECT points FROM `" . DB_PREFIX . "product_reward` WHERE `product_id` = '" . (int)$order_product['product_id'] . "' AND `customer_group_id` = '" . (int)$data['customer_group_id'] . "'");
	
				if (($query_reward->num_rows) && ($query_reward->row['points'] > 0)) {
					$result['reward_cart'] += $query_reward->row['points'] * (float)$order_product['quantity'];
				}
	
				if (isset($order_product['option'])) {
					foreach ($order_product['option'] as $product_option_id => $product_option_value_id) {
						$option_query = $this->db->query("SELECT points, points_prefix FROM `" . DB_PREFIX . "product_option_value` WHERE `product_option_value_id` = '" . (int)$product_option_value_id . "' AND `product_option_id` = '" . (int)$product_option_id . "' AND `product_id` = '" . (int)$order_product['product_id'] . "'");
	
						if ($option_query->num_rows) {
							if ($option_query->row['points_prefix'] == '+') {
								$points += $option_query->row['points'];
							} elseif ($option_query->row['points_prefix'] == '-') {
								$points -= $option_query->row['points'];
							}
						}
					}
				}
				$result['points'] += $points * (float)$order_product['quantity'];
			}
		}
	
		$query = $this->db->query("SELECT SUM(points) AS total FROM `" . DB_PREFIX . "customer_reward` WHERE `customer_id` = '" . (int)$data['customer_id'] . "'");
	
		if ($query->num_rows && ($query->row['total'] > 0)) {
			$result['reward_total'] = $query->row['total'];
		}
	
		if ($data['order_id']) {
			$order_use_reward = $this->db->query("SELECT SUM(points) AS total FROM `" . DB_PREFIX . "customer_reward` WHERE `order_id` = '" . (int)$data['order_id'] . "' AND `points` < '0'");
	
			if ($order_use_reward->num_rows) {
				$result['reward_total'] += abs($order_use_reward->row['total']);
			}
	
			$order_recived_reward = $this->db->query("SELECT SUM(points) AS total FROM `" . DB_PREFIX . "customer_reward` WHERE `order_id` = '" . (int)$data['order_id'] . "' AND `points` > '0'");
	
			if ($order_recived_reward->num_rows) {
				$result['reward_possibly'] = $result['reward_total'] - abs($order_recived_reward->row['total']);
				$result['reward_recived'] = abs($order_recived_reward->row['total']);
			} else {
				$result['reward_possibly'] = $result['reward_total'];
			}
	
			if ($result['reward_possibly'] < 0) {
				$result['reward_possibly'] = '0';
			}
		}
		
		return $result;
	}
	
	
	
	
	
	
}
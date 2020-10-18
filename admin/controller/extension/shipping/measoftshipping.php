<?php
class ControllerExtensionShippingMeasoftshipping extends Controller
{
    private $error = array();

    public function index()
    {
        $this->load->language('extension/shipping/measoftshipping');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate())
        {
            $this->model_setting_setting->editSetting('measoftshipping', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $data['heading_title'] = $this->language
            ->get('heading_title');

        $data['text_edit'] = $this->language
            ->get('text_edit');
        $data['text_enabled'] = $this->language
            ->get('text_enabled');
        $data['text_disabled'] = $this->language
            ->get('text_disabled');
        $data['text_all_zones'] = $this->language
            ->get('text_all_zones');
        $data['text_none'] = $this->language
            ->get('text_none');

        $data['entry_pvz_title'] = $this->language
            ->get('entry_pvz_title');
        $data['entry_pvz_description'] = $this->language
            ->get('entry_pvz_description');
        $data['entry_courier_title'] = $this->language
            ->get('entry_courier_title');
        $data['entry_courier_description'] = $this->language
            ->get('entry_courier_description');

        $data['entry_total'] = $this->language
            ->get('entry_total');
        $data['entry_geo_zone'] = $this->language
            ->get('entry_geo_zone');
        $data['entry_status'] = $this->language
            ->get('entry_status');
        $data['entry_sort_order'] = $this->language
            ->get('entry_sort_order');
        $data['entry_login'] = $this->language
            ->get('entry_login');
        $data['entry_password'] = $this->language
            ->get('entry_password');
        $data['entry_client_id'] = $this->language
            ->get('entry_client_id');
        $data['entry_articles'] = $this->language
            ->get('entry_articles');
        $data['help_fixed_length'] = $this->language
            ->get('help_fixed_length');

        $data['entry_weight'] = $this->language
            ->get('entry_weight');
        $data['entry_map_width'] = $this->language
            ->get('entry_map_width');
        $data['entry_map_height'] = $this->language
            ->get('entry_map_height');
        $data['entry_prefix'] = $this->language
            ->get('entry_prefix');
        $data['entry_length'] = $this->language
            ->get('entry_length');
        $data['entry_com_status'] = $this->language
            ->get('entry_com_status');

        $data['entry_tax_class'] = $this->language
            ->get('entry_tax_class');

        $data['entry_title'] = $this->language
            ->get('entry_title');
        $data['entry_rate'] = $this->language
            ->get('entry_rate');
        $data['entry_add_sum'] = $this->language
            ->get('entry_add_sum');
        $data['entry_city'] = $this->language
            ->get('entry_city');

        $data['help_total'] = $this->language
            ->get('help_total');

        $data['button_save'] = $this->language
            ->get('button_save');
        $data['button_cancel'] = $this->language
            ->get('button_cancel');

        if (isset($this->error['warning']))
        {
            $data['error_warning'] = $this->error['warning'];
        }
        else
        {
            $data['error_warning'] = '';
        }
        if (isset($this->error['login']))
        {
            $data['error_login'] = $this->error['login'];
        }
        else
        {
            $data['error_login'] = '';
        }
        if (isset($this->error['password']))
        {
            $data['error_password'] = $this->error['password'];
        }
        else
        {
            $data['error_password'] = '';
        }
        if (isset($this->error['client_id']))
        {
            $data['error_client_id'] = $this->error['client_id'];
        }
        else
        {
            $data['error_client_id'] = '';
        }

        if (isset($this->error['title']))
        {
            $data['error_title'] = $this->error['title'];
        }
        else
        {
            $data['error_title'] = '';
        }
        if (isset($this->error['rate']))
        {
            $data['error_rate'] = $this->error['rate'];
        }
        else
        {
            $data['error_rate'] = '';
        }
        if (isset($this->error['add_sum']))
        {
            $data['error_add_sum'] = $this->error['add_sum'];
        }
        else
        {
            $data['error_add_sum'] = '';
        }
        if (isset($this->error['city']))
        {
            $data['error_city'] = $this->error['city'];
        }
        else
        {
            $data['error_city'] = '';
        }

        if (isset($this->error['weight']))
        {
            $data['error_weight'] = $this->error['weight'];
        }
        else
        {
            $data['error_weight'] = '';
        }
        if (isset($this->error['map_width']))
        {
            $data['error_map_width'] = $this->error['map_width'];
        }
        else
        {
            $data['error_map_width'] = '';
        }
        if (isset($this->error['map_height']))
        {
            $data['error_map_height'] = $this->error['map_height'];
        }
        else
        {
            $data['error_map_height'] = '';
        }
        if (isset($this->error['prefix']))
        {
            $data['error_prefix'] = $this->error['prefix'];
        }
        else
        {
            $data['error_prefix'] = '';
        }
        if (isset($this->error['length']))
        {
            $data['error_length'] = $this->error['length'];
        }
        else
        {
            $data['error_length'] = '';
        }
        if (isset($this->error['com_status']))
        {
            $data['error_com_status'] = $this->error['com_status'];
        }
        else
        {
            $data['error_com_status'] = '';
        }
        if (isset($this->error['articles']))
        {
            $data['error_articles'] = $this->error['articles'];
        }
        else
        {
            $data['error_articles'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this
    ->language
                ->get('text_home') ,
            'href' => $this
                ->url
                ->link('common/dashboard', 'token=' . $this
                ->session
                ->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language
                ->get('text_shipping') ,
            'href' => $this
                ->url
                ->link('extension/shipping/measoftshipping', 'token=' . $this
                ->session
                ->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language
                ->get('heading_title') ,
            'href' => $this
                ->url
                ->link('extension/shipping/measoftshipping', 'token=' . $this
                ->session
                ->data['token'], 'SSL')
        );

        $data['action'] = $this
            ->url
            ->link('extension/shipping/measoftshipping', 'token=' . $this
            ->session
            ->data['token'], 'SSL');

        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL');

        if (isset($this
            ->request
            ->post['measoftshipping_login']))
        {
            $data['measoftshipping_login'] = $this
                ->request
                ->post['measoftshipping_login'];
        }
        else
        {
            $data['measoftshipping_login'] = $this
                ->config
                ->get('measoftshipping_login');
        }

        if (isset($this
            ->request
            ->post['measoftshipping_password']))
        {
            $data['measoftshipping_password'] = $this
                ->request
                ->post['measoftshipping_password'];
        }
        else
        {
            $data['measoftshipping_password'] = $this
                ->config
                ->get('measoftshipping_password');
        }

        if (isset($this
            ->request
            ->post['measoftshipping_client_id']))
        {
            $data['measoftshipping_client_id'] = $this
                ->request
                ->post['measoftshipping_client_id'];
        }
        else
        {
            $data['measoftshipping_client_id'] = $this
                ->config
                ->get('measoftshipping_client_id');
        }

        if (isset($this
            ->request
            ->post['measoftshipping_pvz_title']))
        {
            $data['measoftshipping_pvz_title'] = $this
                ->request
                ->post['measoftshipping_pvz_title'];
        }
        else
        {
            $data['measoftshipping_pvz_title'] = $this
                ->config
                ->get('measoftshipping_pvz_title');
        }
        if (isset($this
            ->request
            ->post['measoftshipping_pvz_description']))
        {
            $data['measoftshipping_pvz_description'] = $this
                ->request
                ->post['measoftshipping_pvz_description'];
        }
        else
        {
            $data['measoftshipping_pvz_description'] = $this
                ->config
                ->get('measoftshipping_pvz_description');
        }
        if (isset($this
            ->request
            ->post['measoftshipping_courier_title']))
        {
            $data['measoftshipping_courier_title'] = $this
                ->request
                ->post['measoftshipping_courier_title'];
        }
        else
        {
            $data['measoftshipping_courier_title'] = $this
                ->config
                ->get('measoftshipping_courier_title');
        }
        if (isset($this
            ->request
            ->post['measoftshipping_courier_description']))
        {
            $data['measoftshipping_courier_description'] = $this
                ->request
                ->post['measoftshipping_courier_description'];
        }
        else
        {
            $data['measoftshipping_courier_description'] = $this
                ->config
                ->get('measoftshipping_courier_description');
        }

        if (isset($this
            ->request
            ->post['measoftshipping_rate']))
        {
            $data['measoftshipping_rate'] = $this
                ->request
                ->post['measoftshipping_rate'];
        }
        else
        {
            $data['measoftshipping_rate'] = $this
                ->config
                ->get('measoftshipping_rate');
        }
        if (isset($this
            ->request
            ->post['measoftshipping_add_sum']))
        {
            $data['measoftshipping_add_sum'] = $this
                ->request
                ->post['measoftshipping_add_sum'];
        }
        else
        {
            $data['measoftshipping_add_sum'] = $this
                ->config
                ->get('measoftshipping_add_sum');
        }
        if (isset($this
            ->request
            ->post['measoftshipping_city']))
        {
            $data['measoftshipping_city'] = $this
                ->request
                ->post['measoftshipping_city'];
        }
        else
        {
            $data['measoftshipping_city'] = $this
                ->config
                ->get('measoftshipping_city');
        }

        if (isset($this
            ->request
            ->post['measoftshipping_weight']))
        {
            $data['measoftshipping_weight'] = $this
                ->request
                ->post['measoftshipping_weight'];
        }
        else
        {
            $data['measoftshipping_weight'] = $this
                ->config
                ->get('measoftshipping_weight');
        }
        if (isset($this
            ->request
            ->post['measoftshipping_map_width']))
        {
            $data['measoftshipping_map_width'] = $this
                ->request
                ->post['measoftshipping_map_width'];
        }
        else
        {
            $data['measoftshipping_map_width'] = $this
                ->config
                ->get('measoftshipping_map_width');
        }
        if (isset($this
            ->request
            ->post['measoftshipping_map_height']))
        {
            $data['measoftshipping_map_height'] = $this
                ->request
                ->post['measoftshipping_map_height'];
        }
        else
        {
            $data['measoftshipping_map_height'] = $this
                ->config
                ->get('measoftshipping_map_height');
        }
        if (isset($this
            ->request
            ->post['measoftshipping_prefix']))
        {
            $data['measoftshipping_prefix'] = $this
                ->request
                ->post['measoftshipping_prefix'];
        }
        else
        {
            $data['measoftshipping_prefix'] = $this
                ->config
                ->get('measoftshipping_prefix');
        }
        if (isset($this
            ->request
            ->post['measoftshipping_length']))
        {
            $data['measoftshipping_length'] = $this
                ->request
                ->post['measoftshipping_length'];
        }
        else
        {
            $data['measoftshipping_length'] = $this
                ->config
                ->get('measoftshipping_length');
        }
        if (isset($this
            ->request
            ->post['measoftshipping_com_status']))
        {
            $data['measoftshipping_com_status'] = $this
                ->request
                ->post['measoftshipping_com_status'];
        }
        else
        {
            $data['measoftshipping_com_status'] = $this
                ->config
                ->get('measoftshipping_com_status');
        }
        if (isset($this
            ->request
            ->post['measoftshipping_articles']))
        {
            $data['measoftshipping_articles'] = $this
                ->request
                ->post['measoftshipping_articles'];
        }
        else
        {
            $data['measoftshipping_articles'] = $this
                ->config
                ->get('measoftshipping_articles');
        }

        if (isset($this
            ->request
            ->post['measoftshipping_tax_class_id']))
        {
            $data['measoftshipping_tax_class_id'] = $this
                ->request
                ->post['measoftshipping_tax_class_id'];
        }
        else
        {
            $data['measoftshipping_tax_class_id'] = $this
                ->config
                ->get('measoftshipping_tax_class_id');
        }

        $this
            ->load
            ->model('localisation/tax_class');

        $data['tax_classes'] = $this
            ->model_localisation_tax_class
            ->getTaxClasses();

        if (isset($this
            ->request
            ->post['measoftshipping_total']))
        {
            $data['measoftshipping_total'] = $this
                ->request
                ->post['measoftshipping_total'];
        }
        else
        {
            $data['measoftshipping_total'] = $this
                ->config
                ->get('measoftshipping_total');
        }

        if (isset($this
            ->request
            ->post['measoftshipping_geo_zone_id']))
        {
            $data['measoftshipping_geo_zone_id'] = $this
                ->request
                ->post['measoftshipping_geo_zone_id'];
        }
        else
        {
            $data['measoftshipping_geo_zone_id'] = $this
                ->config
                ->get('measoftshipping_geo_zone_id');
        }

        $this
            ->load
            ->model('localisation/geo_zone');

        $data['geo_zones'] = $this
            ->model_localisation_geo_zone
            ->getGeoZones();

        if (isset($this
            ->request
            ->post['measoftshipping_status']))
        {
            $data['measoftshipping_status'] = $this
                ->request
                ->post['measoftshipping_status'];
        }
        else
        {
            $data['measoftshipping_status'] = $this
                ->config
                ->get('measoftshipping_status');
        }

        if (isset($this
            ->request
            ->post['measoftshipping_sort_order']))
        {
            $data['measoftshipping_sort_order'] = $this
                ->request
                ->post['measoftshipping_sort_order'];
        }
        else
        {
            $data['measoftshipping_sort_order'] = $this
                ->config
                ->get('measoftshipping_sort_order');
        }

        $data['header'] = $this
            ->load
            ->controller('common/header');
        $data['column_left'] = $this
            ->load
            ->controller('common/column_left');
        $data['footer'] = $this
            ->load
            ->controller('common/footer');

        $this
            ->response
            ->setOutput($this
            ->load
            ->view('extension/shipping/measoftshipping.tpl', $data));
    }

    protected function validate()
    {
        if (!$this
            ->user
            ->hasPermission('modify', 'extension/shipping/measoftshipping'))
        {
            $this->error['warning'] = $this
    ->language
                ->get('error_permission');
        }

        if (!$this
            ->request
            ->post['measoftshipping_login'])
        {
            $this->error['login'] = $this
    ->language
                ->get('error_login');
        }

        if (!$this
            ->request
            ->post['measoftshipping_password'])
        {
            $this->error['password'] = $this
    ->language
                ->get('error_password');
        }

        if (!$this
            ->request
            ->post['measoftshipping_client_id'])
        {
            $this->error['client_id'] = $this
    ->language
                ->get('error_client_id');
        }
        if (!$this
            ->request
            ->post['measoftshipping_rate'])
        {
            $this->error['rate'] = $this
    ->language
                ->get('error_rate');
        }

        if (!$this
            ->request
            ->post['measoftshipping_city'])
        {
            $this->error['city'] = $this
    ->language
                ->get('error_city');
        }

        return !$this->error;
    }
}

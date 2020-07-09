<?php

class AdminNrtTestimonialController extends ModuleAdminController
{
    public $name;
	public $options;
	
    public function __construct()
    {		
        $this->bootstrap = true;
        $this->className = 'NrtTestimonial';
        $this->table = 'nrt_testimonial';

        $this->addRowAction('edit');
        $this->addRowAction('delete');
        parent::__construct();

		$this->_defaultOrderBy = 'position';
		$this->position_identifier = 'id_nrt_testimonial';

        $this->fields_list = array(
            'id_nrt_testimonial' => array('title' => $this->l('ID'), 'align' => 'center', 'class' => 'fixed-width-xs'),
            'name' => array('title' => $this->l('Name'), 'width' => 'auto'),
			'position' => array(
				'title' => $this->l('Position'),
				'width' => '70',
				'lang' => false,
				'filter_key' => 'a!position',
				'position' => 'position',
				'orderby' => FALSE
			)
        );
		
        $this->bulk_actions = array(
            'delete' => array(
                'text' => $this->l('Delete selected'),
                'icon' => 'icon-trash',
                'confirm' => $this->l('Delete selected items?'),
            ),
        );

		$this->options = array('name_post', 'email', 'company', 'address', 'src', 'text');
		
        if (!$this->module->active) {
            Tools::redirectAdmin($this->context->link->getAdminLink('AdminDashboard'));
        }
        $this->name = 'NrtTestimonial';
    }
	
    public function initToolBarTitle()
    {
        $this->toolbar_title[] = $this->l('Axon - Manage Testimonial');
    }
	
    public function setMedia($isNewTheme = false)
    {
        parent::setMedia($isNewTheme);
        $this->addJS(__PS_BASE_URI__.'modules/'.$this->module->name.'/js/admin/back_testimonials.js');
    }

    public function postProcess()
    {
        if (Tools::isSubmit('submit' . $this->className)) {
            $returnObject = $this->_processSave();
            if (!$returnObject) {
                return false;
            }
			Tools::redirectAdmin($this->context->link->getAdminLink('Admin'.$this->name));
        }
        
        return parent::postProcess();
    }

    public function renderForm()
    {		
        $obj = new NrtTestimonial((int) Tools::getValue('id_nrt_testimonial'));
		
        $this->fields_form[0]['form'] = array(
            'legend' => array(
                'title' => isset($obj->id) ? $this->l('Edit layout.') : $this->l('New layout'),
                'icon' => isset($obj->id) ? 'icon-edit' : 'icon-plus-square',
            ),
            'input' => array(
                array(
                    'type' => 'hidden',
                    'name' => 'id_nrt_testimonial',
                ),
                array(
                    'type' => 'text',
                    'label' => $this->l('Title'),
                    'name' => 'name'
                ),
                array(
                    'type' => 'text',
                    'label' => $this->l('Name'),
					'lang' => true,
                    'name' => 'name_post'
                ),
                array(
                    'type' => 'text',
                    'label' => $this->l('Email'),
					'lang' => true,
                    'name' => 'email'
                ),
                array(
                    'type' => 'text',
                    'label' => $this->l('Company'),
					'lang' => true,
                    'name' => 'company'
                ),
                array(
                    'type' => 'text',
                    'label' => $this->l('Address'),
					'lang' => true,
                    'name' => 'address'
                ),
                array(
                    'type' => 'src_img_banner',
                    'label' => $this->l('Image'),
                    'name' => 'src'
                ),
                array(
                    'type' => 'textarea',
                    'label' => $this->l('Text'),
                    'lang' => true,
                    'name' => 'text',
                    'cols' => 40,
                    'rows' => 10,
                    'class' => 'rte',
                    'autoload_rte' => true
                )
            ),
            'buttons' => array(
                'cancelBlock' => array(
                    'title' => $this->l('Cancel'),
                    'href' => (Tools::safeOutput(Tools::getValue('back', false)))
                        ?: $this->context->link->getAdminLink('Admin' . $this->name),
                    'icon' => 'process-icon-cancel',
                ),
            ),
            'submit' => array(
                'name' => 'submit' . $this->className,
                'title' => $this->l('Save'),
            ),
        );


        if (Tools::getValue('name')) {
            $obj->title = Tools::getValue('name');
        }
		
		$obj = (array) $obj;

        $helper = $this->buildHelper();
        $helper->fields_value = $obj;
		
		
		foreach ($this->_languages as $lang) {			
			foreach ($this->options as $option) {
				if(isset($obj['content'][$lang['id_lang']][$option])){
					$helper->fields_value[$option][$lang['id_lang']] = $obj['content'][$lang['id_lang']][$option];
				}else{
					$helper->fields_value[$option][$lang['id_lang']] = '';
				}
			}	
		}	

        return $helper->generateForm($this->fields_form);
    }

    protected function buildHelper()
    {
        $helper = new HelperForm();

        $helper->module = $this->module;
        $helper->identifier = $this->className;
        $helper->token = Tools::getAdminTokenLite('Admin' . $this->name);
        $helper->languages = $this->_languages;
        $helper->currentIndex = $this->context->link->getAdminLink('Admin' . $this->name);
        $helper->default_form_language = $this->default_form_language;
        $helper->allow_employee_form_lang = $this->allow_employee_form_lang;
        $helper->toolbar_scroll = true;
        $helper->toolbar_btn = $this->initToolbar();

        return $helper;
    }
	
	public function _processSave()
	{ 
		$response = true;
		
		$content = array();
		
        $name = Tools::getValue('name');

		$id_obj = (int)Tools::getValue('id_nrt_testimonial');
		
		if($id_obj){
			$obj = new NrtTestimonial($id_obj);
		}else{
			$obj = new NrtTestimonial();
		}
		
		$obj->name = $name;
		
		foreach ($this->_languages as $lang) {	
			$content[$lang['id_lang']] = urldecode(Tools::getValue('content-'.$lang['id_lang']));
		}
		
		$obj->content = $content;

		if($id_obj){
			$response &= $obj->update();
		}else{
			$response &= $obj->add();
		}
		
		return $response;
	}	

    public function ajaxProcessUpdatePositions()
    {
        $way = (int)(Tools::getValue('way'));
        $id = (int)(Tools::getValue('id'));
        $positions = Tools::getValue($this->table);

        foreach ($positions as $position => $value){
            $pos = explode('_', $value);

            if (isset($pos[2]) && (int)$pos[2] === $id){
                if ($obj = new NrtTestimonial((int)$pos[2])){
                    if (isset($position) && $obj->updatePosition($way, $position)){
                        echo 'ok position '.(int)$position.' for carousel '.(int)$pos[1];
                    } else {
                        echo '{"hasError" : true, "errors" : "Can not update carousel '.(int)$id.' to position '.(int)$position.' "}';
                    }
                } else {
                    echo '{"hasError" : true, "errors" : "This carousel ('.(int)$id.') can t be loaded"}';
                }

                break;
            }
        }
    } 
	
}

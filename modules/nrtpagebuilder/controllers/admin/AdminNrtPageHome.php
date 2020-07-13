<?php

class AdminNrtPageHomeController extends ModuleAdminController
{
    public $name;

    public function __construct()
    {
        $this->bootstrap = true;
        $this->className = 'NrtPageHome';
        $this->table = 'nrt_page_home';

        $this->addRowAction('edit');
        $this->addRowAction('delete');
        parent::__construct();

        $this->_orderBy = 'id_nrt_page_home';
        $this->identifier = 'id_nrt_page_home';
		
		$list_pages = NrtPageHome::getPageHomes();
		if(!count($list_pages)){
			$list_pages[0] = array(
				'id' => 0,
				'name' => $this->l('No results were found for your search.')
			);
		}
        $this->fields_options = array(
            'general' => array(
                'title' =>    $this->l('Settings'),
                'fields' =>    array(
                    'active_homepage_layout' => array(
                        'title' => $this->l('Homepage layout'),
                        'desc' => $this->l('Choose your homepage layout. You can create multiple layouts in list above. So you can change them fast when needed.'),
                        'cast' => 'intval',
                        'type' => 'select',
                        'list' => $list_pages,
                        'identifier' => 'id'
                    ),
                ),
                'submit' => array('title' => $this->l('Save'))
            )
        );

        $this->fields_list = array(
            'id_nrt_page_home' => array('title' => $this->l('ID'), 'align' => 'center', 'class' => 'fixed-width-xs'),
            'name' => array('title' => $this->l('Name'), 'width' => 'auto'),
        );
		
        $this->bulk_actions = array(
            'delete' => array(
                'text' => $this->l('Delete selected'),
                'icon' => 'icon-trash',
                'confirm' => $this->l('Delete selected items?'),
            ),
        );

        if (!$this->module->active) {
            Tools::redirectAdmin($this->context->link->getAdminLink('AdminDashboard'));
        }
        $this->name = 'NrtPageHome';
    }
	
    public function initToolBarTitle()
    {
        $this->toolbar_title[] = $this->l('Axon - Home Page');
    }

    public function postProcess()
    {
        if (Tools::isSubmit('submit' . $this->className)) {
            $returnObject = $this->processSave();
            if (!$returnObject) {
                return false;
            }
			Tools::redirectAdmin($this->context->link->getAdminLink('Admin'.$this->name) . '&id_nrt_page_home='.$returnObject->id .'&updatenrt_page_home');
        }

        if (Tools::isSubmit('submitOptions' . $this->table)) {
            $this->module->clearHomeCache();
        }
		
		if(Tools::getIsset('deletenrt_page_home') && (int)Tools::getValue('id_nrt_page_home')){
			$this->module->deleteCss((int)Tools::getValue('id_nrt_page_home'), 'home');
		}
        
        return parent::postProcess();
    }

    public function renderForm()
    {
        $obj = new NrtPageHome((int) Tools::getValue('id_nrt_page_home'));
		
        if ($obj->id){
            $url = $this->context->link->getAdminLink('AdminNrtPageBuilder').'&pageType=home&pageId=' . $obj->id;
        }
        else{
            $url = false;
        }

        $this->fields_form[0]['form'] = array(
            'legend' => array(
                'title' => isset($obj->id) ? $this->l('Edit layout.') : $this->l('New layout'),
                'icon' => isset($obj->id) ? 'icon-edit' : 'icon-plus-square',
            ),
            'input' => array(
                array(
                    'type' => 'hidden',
                    'name' => 'id_nrt_page_home',
                ),
                array(
                    'type' => 'text',
                    'label' => $this->l('Name'),
                    'name' => 'name',
                    'required' => true,
                ),
                array(
                    'type' => 'page_trigger',
                    'label' => '',
                    'url'  => $url,
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

        $helper = $this->buildHelper();
        $helper->fields_value = (array) $obj;
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
			
}

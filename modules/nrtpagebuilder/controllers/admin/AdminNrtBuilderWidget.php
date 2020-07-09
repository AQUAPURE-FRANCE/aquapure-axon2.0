<?php

class AdminNrtBuilderWidgetController extends ModuleAdminController
{
    public $name;

    public function __construct()
    {		
        $this->bootstrap = true;
        $this->className = 'NrtPageHook';
        $this->table = 'nrt_page_hook';

		Shop::addTableAssociation('nrt_page_hook', array('type' => 'shop'));
		
        $this->addRowAction('edit');
        $this->addRowAction('delete');
        parent::__construct();

        $this->_orderBy = 'id_nrt_page_hook';
        $this->identifier = 'id_nrt_page_hook';

        $this->fields_list = array(
            'id_nrt_page_hook' => array('title' => $this->l('ID'), 'align' => 'center', 'class' => 'fixed-width-xs'),
            'hook_name' => array('title' => $this->l('Hook Name'), 'width' => 'auto'),
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
        $this->name = 'NrtBuilderWidget';
    }
	
	public function initContent()
    {
		if (Shop::getContext() != Shop::CONTEXT_GROUP && Shop::getContext() != Shop::CONTEXT_ALL) {
			parent::initContent();

		}else{
			$this->context->smarty->assign(array(
				'content' => '<p class="alert alert-warning">'.$this->l('You cannot manage the widget from a "All Shops" or a "Group Shop" context, select directly the shop you want to edit').'</p>'
			));		
		}		
	}
	
    public function initToolBarTitle()
    {
        $this->toolbar_title[] = $this->l('Axon - Builder Widget');
    }

    public function postProcess()
    {
        if (Tools::isSubmit('submit' . $this->className)) {
			$hook_name = Tools::getValue('hook_name');
			$layoutId = NrtPageHook::getIdByHookName($hook_name);
            if (!Hook::isModuleRegisteredOnHook($this->module, $hook_name, $this->context->shop->id)) {
                Hook::registerHook($this->module, $hook_name);
            }
			if($layoutId){
				return;
			}
			
			if((int)Tools::getValue('id_nrt_page_hook')){
				$obj = new NrtPageHook((int)Tools::getValue('id_nrt_page_hook'));
			}else{
				$obj = new NrtPageHook();
			}
			
			$obj->hook_name = Tools::getValue('hook_name');
			
            $returnObject = $obj->save();
			
            if (!$returnObject) {
                return false;
            }
			
			Tools::redirectAdmin($this->context->link->getAdminLink('Admin'.$this->name) . '&id_nrt_page_hook='.$obj->id .'&updatenrt_page_hook');
        }
		
		if(Tools::getIsset('deletenrt_page_hook') && (int)Tools::getValue('id_nrt_page_hook')){
			$this->module->deleteCss((int)Tools::getValue('id_nrt_page_hook'), 'hook');
		}
		
        return parent::postProcess();
    }

    public function renderForm()
    {		
        $obj = new NrtPageHook((int) Tools::getValue('id_nrt_page_hook'));
		
        if ($obj->id){
            $url = $this->context->link->getAdminLink('AdminNrtPageBuilder').'&pageType=hook&pageId=' . $obj->id;
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
                    'name' => 'id_nrt_page_hook',
                ),
                array(
                    'type' => 'select',
                    'label' => $this->l('Hook'),
                    'name' => 'hook_name',
                    'class' => 'fixed-width-xxl',
                    'options' => array(
                        'query' => $this->getDisplayHooksForHelper(),
                        'id' => 'name',
                        'name' => 'name'
                    )
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
		$helper->table = $this->table;
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
	
	/*------------------get Front Hook----------------------------*/

    public function getDisplayHooksForHelper()
    {
        $sql = "SELECT h.name as name
                FROM "._DB_PREFIX_."hook h
                WHERE (lower(h.`name`) LIKE 'display%')
                ORDER BY h.name ASC
            ";
        $hooks = Db::getInstance()->executeS($sql);

        foreach ($hooks as $key => $hook) {
            if (preg_match('/admin/i', $hook['name'])
                || preg_match('/backoffice/i', $hook['name'])) {
                unset($hooks[$key]);
            }
        }
        return $hooks;
    }

			
}

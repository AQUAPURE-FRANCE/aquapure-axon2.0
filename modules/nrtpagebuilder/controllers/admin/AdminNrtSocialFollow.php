<?php

class AdminNrtSocialFollowController extends ModuleAdminController
{
    public $name;
	
    public function __construct()
    {		
        $this->bootstrap = true;
        $this->className = 'NrtSocialFollow';
        $this->table = 'nrt_social_follow';

        $this->addRowAction('edit');
        $this->addRowAction('delete');
        parent::__construct();

		$this->_defaultOrderBy = 'position';
		$this->position_identifier = 'id_nrt_social_follow';

        $this->fields_list = array(
            'id_nrt_social_follow' => array('title' => $this->l('ID'), 'align' => 'center', 'class' => 'fixed-width-xs'),
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
		
        if (!$this->module->active) {
            Tools::redirectAdmin($this->context->link->getAdminLink('AdminDashboard'));
        }
        $this->name = 'NrtSocialFollow';
    }
	
    public function initToolBarTitle()
    {
        $this->toolbar_title[] = $this->l('Axon - Manage SocialFollow');
    }
	
    public function setMedia($isNewTheme = false)
    {
        parent::setMedia($isNewTheme);
		$this->addJqueryUI('ui.sortable');
		$this->addJqueryUI('ui.draggable');
        $this->addJS(__PS_BASE_URI__.'modules/'.$this->module->name.'/js/admin/back_socials.js');
		$this->addCSS(__PS_BASE_URI__.'modules/'.$this->module->name.'/css/admin/back_socials.css');
        $this->addJS(__PS_BASE_URI__.'modules/'.$this->module->name.'/js/admin/spectrum.js');
		$this->addCSS(__PS_BASE_URI__.'modules/'.$this->module->name.'/css/admin/spectrum.css');
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
        $obj = new NrtSocialFollow((int) Tools::getValue('id_nrt_social_follow'));
		
        $this->fields_form[0]['form'] = array(
            'legend' => array(
                'title' => isset($obj->id) ? $this->l('Edit layout.') : $this->l('New layout'),
                'icon' => isset($obj->id) ? 'icon-edit' : 'icon-plus-square',
            ),
            'input' => array(
                array(
                    'type' => 'hidden',
                    'name' => 'id_nrt_social_follow',
                ),
                array(
                    'type' => 'text',
                    'label' => $this->l('Title'),
                    'name' => 'name'
                ),
                array(
                    'type' => 'selected_social',
                    'label' => $this->l('Social Follows'),
                    'name' => 'selected_social',
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
		
        if (!count($obj['content'])) {
            $obj['content'] = $this->getListSocial();
        }
		
        $helper->fields_value = $obj;

        return $helper->generateForm($this->fields_form);
    }

    protected function buildHelper()
    {
        $helper = new HelperForm();

        $helper->module = $this->module;
		$helper->override_folder = 'socialfollow/';
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
	
    public function getListSocial()
    {
        $list = array();
		
        $staticSocials = array(
            array('title' => 'Facebook', 'url' => '#', 'bg' => '#435f9f', 'icon' => 'fa fa-facebook'),
			array('title' => 'Twitter', 'url' => '#', 'bg' => '#2ba4d9', 'icon' => 'fa fa-twitter'),
			array('title' => 'Rss', 'url' => '#', 'bg' => '#f26522', 'icon' => 'fa fa-rss'),
			array('title' => 'YouTube', 'url' => '#', 'bg' => '#cd201f', 'icon' => 'fa fa-youtube'),
			array('title' => 'Google +', 'url' => '#', 'bg' => '#e04b34', 'icon' => 'fa fa-google-plus'),
			array('title' => 'Pinterest', 'url' => '#', 'bg' => '#ce1f21', 'icon' => 'fa fa-pinterest'),
			array('title' => 'Vimeo', 'url' => '#', 'bg' => '#00adef', 'icon' => 'fa fa-vimeo'),
			array('title' => 'Instagram', 'url' => '#', 'bg' => '#e4405f', 'icon' => 'fa fa-instagram')
        );
		
		$languages = Language::getLanguages(true, Context::getContext()->shop->id);

		if (!empty($languages)) {
			foreach ($staticSocials as $key => $staticSocial) {
				foreach ($languages as $lang) {
					$list[$key]['title'][(int)$lang['id_lang']] = $staticSocial['title'];
					$list[$key]['url'][(int)$lang['id_lang']] = $staticSocial['url'];				
				}
				$list[$key]['bg'] = $staticSocial['bg'];	
				$list[$key]['icon'] = $staticSocial['icon'];	
			}
		}
		
        return $list;
    }	
	
	public function _processSave()
	{ 
		$response = true;
		
		$content = array();
		
        $name = Tools::getValue('name');

		$id_obj = (int)Tools::getValue('id_nrt_social_follow');
		
		if($id_obj){
			$obj = new NrtSocialFollow($id_obj);
		}else{
			$obj = new NrtSocialFollow();
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
                if ($obj = new NrtSocialFollow((int)$pos[2])){
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

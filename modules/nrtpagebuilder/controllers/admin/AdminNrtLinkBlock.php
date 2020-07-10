<?php

class AdminNrtLinkBlockController extends ModuleAdminController
{
    public $name;
	
    public function __construct()
    {		
        $this->bootstrap = true;
        $this->className = 'NrtLinkBlock';
        $this->table = 'nrt_link_block';

        $this->addRowAction('edit');
        $this->addRowAction('delete');
        parent::__construct();

		$this->_defaultOrderBy = 'position';
		$this->position_identifier = 'id_nrt_link_block';

        $this->fields_list = array(
            'id_nrt_link_block' => array('title' => $this->l('ID'), 'align' => 'center', 'class' => 'fixed-width-xs'),
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
        $this->name = 'NrtLinkBlock';
    }
	
    public function initToolBarTitle()
    {
        $this->toolbar_title[] = $this->l('Axon - Manage LinkBlock');
    }
	
    public function setMedia($isNewTheme = false)
    {
        parent::setMedia($isNewTheme);
		$this->addJqueryUI('ui.sortable');
		$this->addJqueryUI('ui.draggable');
        $this->addJS(__PS_BASE_URI__.'modules/'.$this->module->name.'/js/admin/back_links.js');
		$this->addCSS(__PS_BASE_URI__.'modules/'.$this->module->name.'/css/admin/back_links.css');
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
        $obj = new NrtLinkBlock((int) Tools::getValue('id_nrt_link_block'));
		
        $this->fields_form[0]['form'] = array(
            'legend' => array(
                'title' => isset($obj->id) ? $this->l('Edit layout.') : $this->l('New layout'),
                'icon' => isset($obj->id) ? 'icon-edit' : 'icon-plus-square',
            ),
            'input' => array(
                array(
                    'type' => 'hidden',
                    'name' => 'id_nrt_link_block',
                ),
                array(
                    'type' => 'text',
                    'label' => $this->l('Title'),
                    'name' => 'name'
                ),
                array(
                    'type' => 'repository_links',
                    'label' => $this->l('Links repository'),
                    'name' => 'repository_links',
                ),
                array(
                    'type' => 'selected_links',
                    'label' => $this->l('Selected links'),
                    'name' => 'selected_links[]',
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
        $helper->tpl_vars = array(
            'cms_pages' => $this->getCmsPages(),
            'product_pages' => $this->getProductPages(),
            'static_pages' => $this->getStaticPages(),
            'selected_links' => NrtLinkBlock::makeLinks($obj["content"])
        );

        return $helper->generateForm($this->fields_form);
    }

    protected function buildHelper()
    {
        $helper = new HelperForm();

        $helper->module = $this->module;
		$helper->override_folder = 'linkblock/';
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
	
    public function getCmsPages()
    {
        $id_lang = (int) Context::getContext()->language->id;
        $id_shop = (int) Context::getContext()->shop->id;

        $categories = 'SELECT  cc.`id_cms_category`,
                        ccl.`name`,
                        ccl.`description`,
                        ccl.`link_rewrite`,
                        cc.`id_parent`,
                        cc.`level_depth`,
                        NULL as pages
            FROM '._DB_PREFIX_.'cms_category cc
            INNER JOIN '._DB_PREFIX_.'cms_category_lang ccl
                ON (cc.`id_cms_category` = ccl.`id_cms_category`)
            INNER JOIN '._DB_PREFIX_.'cms_category_shop ccs
                ON (cc.`id_cms_category` = ccs.`id_cms_category`)
            WHERE `active` = 1
                AND ccl.`id_lang`= '.$id_lang.'
                AND ccs.`id_shop`= '.$id_shop.'
			GROUP BY cc.`id_cms_category`	
        ';

        $pages = Db::getInstance()->executeS($categories);
					
        foreach ($pages as &$category) {
            $category['pages'] =
                Db::getInstance()->executeS('SELECT c.`id_cms`,
                        c.`position`,
                        cl.`meta_title` as title,
                        cl.`meta_description` as description,
                        cl.`link_rewrite`
                    FROM '._DB_PREFIX_.'cms c
                    INNER JOIN '._DB_PREFIX_.'cms_lang cl
                        ON (c.`id_cms` = cl.`id_cms`)
                    INNER JOIN '._DB_PREFIX_.'cms_shop cs
                        ON (c.`id_cms` = cs.`id_cms`)
                    WHERE c.`active` = 1
                        AND c.`id_cms_category` = '.$category['id_cms_category'].'
                        AND cl.`id_lang` = '.$id_lang.'
                        AND cs.`id_shop` = '.$id_shop.'
					GROUP BY c.`id_cms`		
                ');
        }

        return $pages;
    }

    public function getProductPages()
    {
		$id_lang = (int) Context::getContext()->language->id;
		
        $products = array();
        $productPages = array(
            'prices-drop',
            'new-products',
            'best-sales',
        );

        foreach ($productPages as $productPage) {
            $meta = Meta::getMetaByPage($productPage, $id_lang);
            $products[] = array(
                'id_cms' => $productPage,
                'title' => $meta['title'],
            );
        }

        $pages[]['pages'] = $products;

        return $pages;
    }

    public function getStaticPages($id_lang = null)
    {	
		$id_lang = (int) Context::getContext()->language->id;
		
        $statics = array();
        $staticPages = array(
			'order',
			'cart',
            'manufacturer',
            'supplier',
            'contact',
            'sitemap',
            'stores',
            'authentication',
            'my-account',
            'identity',
            'history',
            'addresses',
            'guest-tracking'
        );

        foreach ($staticPages as $staticPage) {
            $meta = Meta::getMetaByPage($staticPage, $id_lang);
            $statics[] = [
                'id_cms' => $staticPage,
                'title' => $meta['title'],
            ];
        }

        $pages[]['pages'] = $statics;

        return $pages;
    }
	
	public function _processSave()
	{ 
		$response = true;
		
		$content = array();
		
        $name = Tools::getValue('name');

		$id_obj = (int)Tools::getValue('id_nrt_link_block');
		
		if($id_obj){
			$obj = new NrtLinkBlock($id_obj);
		}else{
			$obj = new NrtLinkBlock();
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
                if ($obj = new NrtLinkBlock((int)$pos[2])){
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

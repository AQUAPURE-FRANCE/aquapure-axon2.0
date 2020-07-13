<?php
/*
* 2017 AxonVIP
*
* NOTICE OF LICENSE
*
*  @author AxonVIP <axonvip@gmail.com>
*  @copyright  2017 axonvip.com
*   
*/

if (!defined('_PS_VERSION_')) {
    exit;
}

class NrtPageBuilderAjaxModuleFrontController extends ModuleFrontController
{
    public function init()
    {
        parent::init();
    }

    public function postProcess()
    {
		parent::initContent();
        if (Tools::getValue('process') == 'products') {
            $this->getProducts();
        } elseif (Tools::getValue('process') == 'productsSelected') {
            $this->getProductsSelected();
        } elseif (Tools::getValue('process') == 'infiniteProducts') {
            $this->getLoadProducts();
        } elseif (Tools::getValue('process') == 'blogs') {
            $this->getBlogs();
        } elseif (Tools::getValue('process') == 'categories') {
            $this->getCategories();
        } elseif (Tools::getValue('process') == 'brands') {
            $this->getBrands();
        } elseif (Tools::getValue('process') == 'module') {
            $this->getModules();
        }
    }
	
    public function getBrands()
    {
		header('Content-Type: application/json');
		$config = Tools::getValue('config');

		$elementWidget['content'] = $this->module->_prepBrands($config);
				
		$this->context->smarty->assign(array(
			'elementWidget' => $elementWidget
		));
			
		$template = _PS_MODULE_DIR_ . $this->module->name.'/views/templates/hook/brands/brands.tpl';
			
		if (!Tools::file_exists_cache($template)){
			$template = $this->module->l('No template found', 'ajax');
		}

        $this->ajaxDie(json_encode(array(
            'html' => $this->context->smarty->fetch($template)
        )));	
	}
	
    public function getCategories()
    {
		header('Content-Type: application/json');
		$config = Tools::getValue('config');

		$elementWidget['content'] = $this->module->_prepCategories($config);
				
		$this->context->smarty->assign(array(
			'elementWidget' => $elementWidget
		));
			
		$template = _PS_MODULE_DIR_ . $this->module->name.'/views/templates/hook/categories/categories.tpl';
			
		if (!Tools::file_exists_cache($template)){
			$template = $this->module->l('No template found', 'ajax');
		}

        $this->ajaxDie(json_encode(array(
            'html' => $this->context->smarty->fetch($template)
        )));		
	}
	
    public function getModules()
    {
		header('Content-Type: application/json');
		$config = Tools::getValue('config');
		
		$elementWidget['content'] = $this->module->execModuleHook($config);
        $this->ajaxDie(json_encode(array(
            'html' => $elementWidget['content']['module']
        )));	
	}
	
    public function getBlogs()
    {
		header('Content-Type: application/json');
		$config = Tools::getValue('config');

		$elementWidget['content'] = $this->module->_prepBlogs($config);
				
		$this->context->smarty->assign(array(
			'elementWidget' => $elementWidget
		));
			
		$template = _PS_MODULE_DIR_ . $this->module->name.'/views/templates/hook/blogs/blogs.tpl';
			
		if (!Tools::file_exists_cache($template)){
			$template = $this->module->l('No template found', 'ajax');
		}

        $this->ajaxDie(json_encode(array(
            'html' => $this->context->smarty->fetch($template)
        )));	
		
	}
	
    public function getProducts()
    {
		header('Content-Type: application/json');
		$config = Tools::getValue('config');
		
		$elementWidget['content'] = $this->module->_prepProducts($config);
				
		$this->context->smarty->assign(array(
			'elementWidget' => $elementWidget
		));
			
		$template = _PS_MODULE_DIR_ . $this->module->name.'/views/templates/hook/products/products.tpl';
			
		if (!Tools::file_exists_cache($template)){
			$template = $this->module->l('No template found', 'ajax');
		}

        $this->ajaxDie(json_encode(array(
            'html' => $this->context->smarty->fetch($template)
        )));	
		
	}
	
    public function getProductsSelected()
    {
		header('Content-Type: application/json');
		$config = Tools::getValue('config');
		
		$elementWidget['content'] = $this->module->_prepProductsSelected($config);
				
		$this->context->smarty->assign(array(
			'elementWidget' => $elementWidget
		));
			
		$template = _PS_MODULE_DIR_ . $this->module->name.'/views/templates/hook/products/products.tpl';
			
		if (!Tools::file_exists_cache($template)){
			$template = $this->module->l('No template found', 'ajax');
		}

        $this->ajaxDie(json_encode(array(
            'html' => $this->context->smarty->fetch($template)
        )));	
		
	}
	
    public function getLoadProducts()
    {
		header('Content-Type: application/json');
		$config = Tools::getValue('config');
		
		$elementWidget['content'] = $this->module->_prepLoadProducts($config);

		$this->context->smarty->assign(array(
			'elementWidget' => $elementWidget
		));
			
		$template = _PS_MODULE_DIR_ . $this->module->name.'/views/templates/hook/products/infinite-products.tpl';
			
		if (!Tools::file_exists_cache($template)){
			$template = $this->module->l('No template found', 'ajax');
		}

        $this->ajaxDie(json_encode(array(
			'lastPage' => $elementWidget['content']['lastPage'],
            'html' => $this->context->smarty->fetch($template)
        )));	
		
	}
	
}

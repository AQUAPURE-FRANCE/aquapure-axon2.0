<?php

class AdminNrtPageBuilderController extends ModuleAdminController {
	
	private $name = 'NrtPageBuilder';
	private $blogStatus = true;
	private $categoriesType = array();
	private $productsType = array();
	private $blogsType = array();
	private $brandsType = array();
	private $slidersType = array();
	private $testimonialsType = array();
	private $linksType = array();
	private $socialsType = array();
	private $modulesHooks = array();
	private $productImages = array();
	private $blogImages = array();
	
    public function __construct()
    {
        $this->display = 'view';
        $this->bootstrap = true;
		parent::__construct();
		
        if (!$this->module->active) {
            Tools::redirectAdmin($this->context->link->getAdminLink('AdminDashboard'));
        }
		
	    if(!Module::isInstalled('smartblog') || !Module::isEnabled('smartblog'))
		{
            $this->blogStatus = false;
		}
		
		$this->productsType[] = array('id' => 'n', 'name' => $this->l('New products'));
		$this->productsType[] = array('id' => 's', 'name' => $this->l('Price drops'));
		$this->productsType[] = array('id' => 'b', 'name' => $this->l('Best sellers'));
		$this->productsType[] = array('id' => 'p_s', 'name' => $this->l('Products Same Category( Only visible in the product details page )'));
		$this->productsType[] = array('id' => 'p_a', 'name' => $this->l('Related products( Only visible in the product details page )'));
		
		$this->getCategories();
		
		$this->productsType = array_merge($this->productsType, $this->categoriesType);
		
		$this->blogsType = $this->getBlogCategories();
		
		$this->brandsType = $this->getBrands();
		
		$this->slidersType = NrtSlider::getAll();
		$this->testimonialsType = NrtTestimonial::getAll();
		$this->linksType = NrtLinkBlock::getAll();
		$this->socialsType = NrtSocialFollow::getAll();
		
        if($this->blogStatus)
		{
			$blog_images = BlogImageType::GetImageAllType('post');
			foreach ($blog_images as $key => $blog_image) {
				$this->blogImages[$key]['id'] = $blog_image['type_name'];
				$this->blogImages[$key]['name'] = $blog_image['type_name'];
			}
        }
		
		$product_images = ImageType::getImagesTypes('products');	
		foreach($product_images as $key => $product_image) {
           $this->productImages[$key]['id'] = $product_image['name'];
		   $this->productImages[$key]['name'] = $product_image['name'];
		}
		
		$this->modulesHooks = $this->getAvailableModules();
		
        $this->context = Context::getContext();

    }
	
    public function postProcess()
    {
        if (Tools::isSubmit('submit' . $this->name)) {
			$content = urldecode(Tools::getValue('submenu-elements'));
			$this->_processSave($content);
        } 
		
        if (Tools::isSubmit('submitUploadData')) {
			
			if(isset($_FILES['fileUploadData']) && $_FILES['fileUploadData']['tmp_name'])
			{	
				$file = $_FILES['fileUploadData']['tmp_name'];
				$content = file_get_contents($file, true);
				$this->_processSave($content);
			}
        } 
		
        return parent::postProcess();
    }
	
    public function setMedia($isNewTheme = false)
    {
        parent::setMedia($isNewTheme);
		
		$this->addJS(__PS_BASE_URI__.'modules/'.$this->module->name.'/js/admin/magnific-popup/magnific-popup.min.js');
		$this->addCSS(__PS_BASE_URI__.'modules/'.$this->module->name.'/js/admin/magnific-popup/magnific-popup.css');
		
		$this->addJS(__PS_BASE_URI__.'modules/'.$this->module->name.'/js/admin/filesaver.min.js');
		$this->addJS(__PS_BASE_URI__.'modules/'.$this->module->name.'/js/admin/back.js');
		$this->addCSS(__PS_BASE_URI__.'modules/'.$this->module->name.'/css/admin/back.css');

		$this->addJS(__PS_BASE_URI__.'modules/'.$this->module->name.'/js/admin/spectrum.js');
		$this->addCSS(__PS_BASE_URI__.'modules/'.$this->module->name.'/css/admin/spectrum.css');
		
		$this->addJS(__PS_BASE_URI__.'modules/'.$this->module->name.'/js/admin/tinymce.inc.js');
		$this->addJS(__PS_BASE_URI__.'modules/'.$this->module->name.'/js/admin/tiny_mce.js');

		$this->addJqueryUI('ui.sortable');
		$this->addJqueryPlugin(array('autocomplete', 'tablefilter'));
		
		$iso = $this->context->language->iso_code;
		$ajaxUrl = $this->context->link->getAdminLink('Admin'.$this->name);
		$ajaxProductsListUrl = $this->context->link->getAdminLink('Admin'.$this->name).'&ajax=1&action=productsList';
		$ajaxModalContentsUrl = $this->context->link->getAdminLink('Admin'.$this->name).'&ajax=1&action=modalContents';
		
		Media::addJsDef(array('ajaxUrl' => $ajaxUrl));
		Media::addJsDef(array('ajaxProductsListUrl' => $ajaxProductsListUrl));
		Media::addJsDef(array('ajaxModalContentsUrl' => $ajaxModalContentsUrl));
		Media::addJsDef(array('text_empty' => $this->l('(Empty)'))); 
		Media::addJsDef(array('text_content' => $this->l('Content'))); 
    }
	
    public function renderView()
    {
        $pageId = (int) Tools::getValue('pageId');
        $pageType = Tools::getValue('pageType');
        $idLang = (int) Tools::getValue('idLang');

        if (!$idLang){
            $idLang = (int) $this->context->language->id;
        }
		
        $values = $this->getValues();

        $this->fields_form[]['form'] = array(
            'input' => array(
                array(
					'type' => 'grids_builder',
					'label' => '',
					'col' => 12,
					'preffix_wrapper' => 'grid-submenu',
					'name' => 'grids_builder',
                )
            ),
            'buttons' => array(
                'cancelBlock' => array(
                    'title' => $this->l('Cancel'),
                    'href' => (Tools::safeOutput(Tools::getValue('back', false)))
                        ?: $values['edit'],
                    'icon' => 'process-icon-cancel',
                ),
            ),
			'submit' => array(
				'title' => $this->l('Save'),
			)
        );
		
        $helper = $this->buildHelper();
		
        $helper->fields_value = $this->fields_value;
		
		$output = $this->context->smarty->fetch(_PS_MODULE_DIR_.'/'.$this->module->name.'/views/templates/admin/configure.tpl');
		
		$import_export = '<div class="panel clearfix">
						<form class="pull-left col-xs-4" id="importForm" method="post" enctype="multipart/form-data" action="'.$this->context->link->getAdminLink('AdminNrtPageBuilder').'&pageType='.$pageType.'&pageId='.$pageId.'&idLang='.$idLang.'">
							<div style="display:inline-block;">
								<input id="fileUploadData" type="file" name="fileUploadData" />
							</div>
							<button type="submit" name="submitUploadData" class="btn btn-default btn-lg">
								<i class="icon icon-upload"></i>
								'.$this->l('Import').'
							</button>
						</form>
						<a class="col-xs-6" id="exportData" href="javascript:void(0)">
							<button class="btn btn-default btn-lg">
								<i class="icon icon-share"></i>
								'.$this->l('Export').'
							</button>
						</a>
					 </div>';
		
		$tab = '<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active">
						<a href="#homepagebuilder" role="tab" data-toggle="tab">
							'.$this->l('Page Builder').'
						</a>
					</li>
					<li role="presentation">
						<a href="#imexport" role="tab" data-toggle="tab">
							'.$this->l('Import / Export').'
						</a>
					</li>
				</ul>';
		
		$tabcontent = '<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="homepagebuilder">
								'.$helper->generateForm($this->fields_form).'
							</div>
							<div role="tabpanel" class="tab-pane" id="imexport">
								'.$import_export.'
							</div>
						</div>';
		
		return '<h2> Edit: '.$values['title'].'</h2><br/>'.$output.$tab.$tabcontent;
    }
	
    public function getValues()
    {
		$title = $this->l('Page Builder');
		
        $pageId = (int) Tools::getValue('pageId');
        $pageType = Tools::getValue('pageType');
        $idLang = (int) Tools::getValue('idLang');

        if (!$idLang){
            $idLang = (int) $this->context->language->id;
        }

		$editedPageLinkAdmin = $this->context->link->getAdminLink('AdminNrtPageHome');
		
		$content = '';
		
        switch ($pageType) {
            case 'home':
                $editedPage = new NrtPageHome($pageId, $idLang);
				$title = $editedPage->name;
                $editedPageLinkAdmin = $this->context->link->getAdminLink('AdminNrtPageHome') . '&id_nrt_page_home='. $pageId .'&updatenrt_page_home';
                $content  = $editedPage->content;
                break;
            case 'footer':
                $editedPage = new NrtPageFooter($pageId, $idLang);
				$title = $editedPage->name;
                $editedPageLinkAdmin = $this->context->link->getAdminLink('AdminNrtPageFooter') . '&id_nrt_page_footer='. $pageId .'&updatenrt_page_footer';
                $content  = $editedPage->content;
                break;
            case 'hook':
                $editedPage = new NrtPageHook($pageId, $idLang);
				$title = $editedPage->hook_name;
                $editedPageLinkAdmin = $this->context->link->getAdminLink('AdminNrtBuilderWidget') . '&id_nrt_page_hook='. $pageId .'&updatenrt_page_hook';
                $content  = $editedPage->content;
                break;
            case 'category':
				$title = 'Category';
                $id = NrtPageCategory::getIdByCategory($pageId);
                if ($id){
                    $editedPage = new NrtPageCategory($id, $idLang);
                } else {
                    $editedPage = new NrtPageCategory();
                }
				$editedPageLinkAdmin = $this->context->link->getAdminLink('AdminCategories');
				$content  = $editedPage->content;
                break;
            case 'product':
				$title = 'Product';
                $id = NrtPageProduct::getIdByProduct($pageId);
                if ($id){
                    $editedPage = new NrtPageProduct($id, $idLang);
                } else {
                    $editedPage = new NrtPageProduct();
                }
				$editedPageLinkAdmin = $this->context->link->getAdminLink('AdminProducts');
				$content  = $editedPage->content;
                break;
            case 'cms':
				$title = 'Cms';
                $id = NrtPageCms::getIdByCms($pageId);
                if ($id){
                    $editedPage = new NrtPageCms($id, $idLang);
                } else {
                    $editedPage = new NrtPageCms();
                }
				$editedPageLinkAdmin = $this->context->link->getAdminLink('AdminCmsContent');
				$content  = $editedPage->content;
                break;
            case 'blog':
				$title = 'Blog';
                $id = NrtPageBlog::getIdByBlog($pageId);
                if ($id){
                    $editedPage = new NrtPageBlog($id, $idLang);
                } else {
                    $editedPage = new NrtPageBlog();
                }
				$editedPageLinkAdmin = $this->context->link->getAdminLink('AdminBlogPost');
				$content  = $editedPage->content;
                break;
            default:
				Tools::redirectAdmin($editedPageLinkAdmin);
                break;
        }
		
		$this->getValuesForm();
	
        $this->context->smarty->assign(
            array(
				'pageType' => $pageType,
				'pageId' => $pageId,
				'idLang' => $idLang,
				'pageBuilderLink' => $this->context->link->getAdminLink('AdminNrtPageBuilder').'&pageType='.$pageType.'&pageId='.$pageId.'&idLang=',
				'submenu_content' => $content,
				'submenu_content_format' => $this->module->convertContent(json_decode($content, true), false)
            )
        );
		
		return array('title' => $title, 'edit' => $editedPageLinkAdmin);
    }
	
    public function getValuesForm()
    {
        $this->context->smarty->assign(
            array(
				'blogStatus' => $this->blogStatus,
				'productsType' => $this->productsType,
				'categoriesType' => $this->categoriesType,
				'blogsType' => $this->blogsType,
				'brandsType' => $this->brandsType,
				'slidersType' => $this->slidersType,
				'testimonialsType' => $this->testimonialsType,
				'linksType' => $this->linksType,
				'socialsType' => $this->socialsType,
				'modulesHooks' => $this->modulesHooks,
				'productImages' => $this->productImages,
				'blogImages' => $this->blogImages,
            )
        );
	}

    public function buildHelper()
    {
        $helper = new HelperForm();
		
		$helper->show_toolbar = false;
		$helper->table = $this->table;
        $helper->module = $this->module;
		$helper->override_folder = 'pagebuilder/';
        $helper->identifier = $this->name;
        $helper->token = Tools::getAdminTokenLite('Admin'.$this->name);
        $helper->languages = $this->_languages;
        $helper->currentIndex = $this->context->link->getAdminLink('Admin'.$this->name);
        $helper->default_form_language = $this->default_form_language;
        $helper->allow_employee_form_lang = $this->allow_employee_form_lang;
        $helper->toolbar_scroll = true;
        $helper->toolbar_btn = $this->initToolbar();
		$helper->submit_action = 'submit'.$this->name;

        return $helper;
    }
	
	/*------------------get Product Categories----------------------------*/
	
	public function getBrands()
	{
		$manufacturers = Manufacturer::getManufacturers(false, $this->context->language->id, true, false, false, false, true);
		
		foreach ($manufacturers as $key => $manufacturer)
		{
			$this->brandsType[$key]['id'] =  $manufacturer['id_manufacturer'];
			$this->brandsType[$key]['name'] = $manufacturer['name'];
		}
		return $this->brandsType;
	}
	
	/*------------------get Product Categories----------------------------*/
	
	public function getCategories()
    {
		
		$category = new Category((int)Configuration::get('PS_HOME_CATEGORY'), $this->context->language->id);
		
		$this->context = Context::getContext();		
        $range = '';
        $maxdepth = 0;
        if (Validate::isLoadedObject($category)) {
            if ($maxdepth > 0) {
                $maxdepth += $category->level_depth;
            }
            $range = 'AND nleft >= '.(int)$category->nleft.' AND nright <= '.(int)$category->nright;
        }

        $resultIds = array();
        $resultParents = array();
        $result = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS('
			SELECT c.id_parent, c.id_category, cl.name, cl.description, cl.link_rewrite
			FROM `'._DB_PREFIX_.'category` c
			INNER JOIN `'._DB_PREFIX_.'category_lang` cl ON (c.`id_category` = cl.`id_category` AND cl.`id_lang` = '.(int)$this->context->language->id.Shop::addSqlRestrictionOnLang('cl').')
			INNER JOIN `'._DB_PREFIX_.'category_shop` cs ON (cs.`id_category` = c.`id_category` AND cs.`id_shop` = '.(int)$this->context->shop->id.')
			WHERE (c.`active` = 1 OR c.`id_category` = '.(int)Configuration::get('PS_HOME_CATEGORY').')
			AND c.`id_category` != '.(int)Configuration::get('PS_ROOT_CATEGORY').'
			'.((int)$maxdepth != 0 ? ' AND `level_depth` <= '.(int)$maxdepth : '').'
			'.$range.'
			ORDER BY `level_depth` ASC, cs.`position` ASC');
        foreach ($result as &$row) {
            $resultParents[$row['id_parent']][] = &$row;
            $resultIds[$row['id_category']] = &$row;
        }

        return $this->getTree($resultParents, $resultIds, $maxdepth, ($category ? $category->id : null));
    }

    public function getTree($resultParents, $resultIds, $maxDepth, $id_category = null, $currentDepth = 0)
    {
        if (is_null($id_category)) {
            $id_category = $this->context->shop->getCategory();
        }

        if (isset($resultIds[$id_category])) {
            $link = $this->context->link->getCategoryLink($id_category, $resultIds[$id_category]['link_rewrite']);
            $name = str_repeat('&nbsp;&nbsp;', 1 * $currentDepth).$resultIds[$id_category]['name'];
            $desc = $resultIds[$id_category]['description'];
        } else {
            $link = $name = $desc = '';
        }
		
		$this->categoriesType[] = array('id' => (int) $id_category, 'name' => $name);
		
        if (isset($resultParents[$id_category]) && count($resultParents[$id_category]) && ($maxDepth == 0 || $currentDepth < $maxDepth)) {
            foreach ($resultParents[$id_category] as $subcat) {
                $this->getTree($resultParents, $resultIds, $maxDepth, $subcat['id_category'], $currentDepth + 1);
            }
        }
		
    }
	
	/*------------------get Blog Categories----------------------------*/
	
    public function getBlogCategories()
    {
        if($this->blogStatus)
		{
			$categories = BlogCategory::getCategories($this->context->language->id, true, false);
			$this->blogsType[] = array('id' => 'n', 'name' => $this->module->l('Latest New'));
			foreach($categories as $category)
			{
				$spacer = str_repeat('&nbsp;', 2 * (int)$category['level_depth']);
				$name = $category['name'].$this->module->l(' (Category)');				
				$this->blogsType[] = array('id' => (int)$category['id_smart_blog_category'], 'name' => (isset($spacer) ? $spacer : '').$name);		
			}
        }
		return $this->blogsType;
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
		$usableHooks = array();
        foreach ($hooks as $key => $hook) {
            if (!preg_match('/admin/i', $hook['name'])
                && !preg_match('/backoffice/i', $hook['name'])) {
                $usableHooks[] = $hook['name'];
            }
        }
        return $usableHooks;
    }

	public function getAvailableModules()
    {	
    	$usableHooks = $this->getDisplayHooksForHelper();
		
        $excludeModules = array('nrtcompare', 'nrtcookielaw', 'nrtcountdown', 'nrtcustomtab', 'nrtpagebuilder', 'nrtpopupnewsletter', 'nrtproductslinknav', 'nrtsearchbar', 'nrtsizechart', 'nrtthemecustomizer', 'nrtvariant', 'nrtwishlist', 'nrtzoom', 'nrtproducttags', 'productcomments', 'ps_facetedsearch', 'ps_shoppingcart', 'ps_sharebuttons');
		
  		$modules = Db::getInstance()->executeS('
		SELECT m.id_module, m.name
		FROM `'._DB_PREFIX_.'module` m 
	    WHERE m.`name` NOT IN (\'' . implode("','", $excludeModules) . '\') ');

		 foreach ($modules as $key => $module)
		 {
		 	 $moduleInstance = Module::getInstanceByName($module['name']);
		 	 if(Validate::isLoadedObject($moduleInstance))
		 	  {
					$flag = false;
					$modules[$key]['hooks'] = '';
					$hook_module_name = Db::getInstance()->executeS('SELECT m.name
										FROM `'._DB_PREFIX_.'hook` m 
										LEFT JOIN `'._DB_PREFIX_.'hook_module` n 
										ON m.`id_hook` = n.`id_hook` WHERE n.`id_module`= '.$module['id_module'].' GROUP BY m.`id_hook`');
					foreach($hook_module_name as $hook_name){
						if($moduleInstance->isHookableOn($hook_name['name']) && in_array($hook_name['name'], $usableHooks))
						{											
							if($flag){
								$modules[$key]['hooks'] .= ',';	
							}
							$modules[$key]['hooks'] .= $hook_name['name'];
							$flag = true;
						}
					}
					if($flag){
						unset($modules[$key]['id_module']);
						$modulesHooks[$module['name']] =  $modules[$key];
					}
			  }
		 }

        return $modulesHooks;
    }
	
    public function ajaxProcessExportData()
    {
		$content = urldecode(Tools::getValue('submenu-elements'));
        $pageId = (int)Tools::getValue('pageId');
        $pageType = Tools::getValue('pageType');		
				
        header('Content-disposition: attachment; filename=export_'.$pageType.'_'.$pageId.'.json');
        header('Content-type: application/json');
        print_r(json_encode($content));
        die;
    }
	
	public function _processSave($content)
	{ 
        $pageId = (int)Tools::getValue('pageId');
        $pageType = Tools::getValue('pageType');
        $idLang = (int)Tools::getValue('idLang');
		
        if (!$idLang){
            $idLang = (int)$this->context->language->id;
        }
		
		$response = true;
		
        switch ($pageType) {
            case 'home':
                $pageHome = new NrtPageHome($pageId);
				$pageHome->content[$idLang] = str_replace(array("\r\n", "\n", "\r"), '', $content);
                $response &= $pageHome->update();
				$this->module->clearHomeCache();
                break;
            case 'footer':
                $pageFooter = new NrtPageFooter($pageId);
				$pageFooter->content[$idLang] = str_replace(array("\r\n", "\n", "\r"), '', $content);
                $response &= $pageFooter->update();
				$this->module->clearFooterCache();
                break;
            case 'hook':
                $pageHook = new NrtPageHook($pageId);
				$pageHook->content[$idLang] = str_replace(array("\r\n", "\n", "\r"), '', $content);
                $response &= $pageHook->update();
				$this->module->clearHookCache($pageHook->hook_name);
                break;
            case 'category':
                $id = NrtPageCategory::getIdByCategory($pageId);
                if ($id){
                    $pageCategory = new NrtPageCategory($id);
                    $pageCategory->content[$idLang] = str_replace(array("\r\n", "\n", "\r"), '', $content);
                    $pageCategory->update();
                } else {
                    $pageCategory = new NrtPageCategory();
                    $pageCategory->content[$idLang] = str_replace(array("\r\n", "\n", "\r"), '', $content);
                    $pageCategory->id_category = (int) $pageId;
                    $pageCategory->add();
                }
				$this->module->clearCategoryCache($pageId);
                break;
            case 'product':
                $id = NrtPageProduct::getIdByProduct($pageId);
                if ($id){
                    $pageProduct = new NrtPageProduct($id);
                    $pageProduct->content[$idLang] = str_replace(array("\r\n", "\n", "\r"), '', $content);
                    $pageProduct->update();
                } else {
                    $pageProduct = new NrtPageProduct();
                    $pageProduct->content[$idLang] = str_replace(array("\r\n", "\n", "\r"), '', $content);
                    $pageProduct->id_product = (int) $pageId;
                    $pageProduct->add();
                }
				$this->module->clearProductCache($pageId);
                break;
            case 'cms':
                $id = NrtPageCms::getIdByCms($pageId);
                if ($id){
                    $pageCms = new NrtPageCms($id);
                    $pageCms->content[$idLang] = str_replace(array("\r\n", "\n", "\r"), '', $content);
                    $pageCms->update();
                } else {
                    $pageCms = new NrtPageCms();
                    $pageCms->content[$idLang] = str_replace(array("\r\n", "\n", "\r"), '', $content);
                    $pageCms->id_cms = (int) $pageId;
                    $pageCms->add();
                }
				$this->module->clearCmsCache($pageId);
                break;
            case 'blog':
                $id = NrtPageBlog::getIdByBlog($pageId);
                if ($id){
                    $pageBlog = new NrtPageBlog($id);
                    $pageBlog->content[$idLang] = str_replace(array("\r\n", "\n", "\r"), '', $content);
                    $pageBlog->update();
                } else {
                    $pageBlog = new NrtPageBlog();
                    $pageBlog->content[$idLang] = str_replace(array("\r\n", "\n", "\r"), '', $content);
                    $pageBlog->id_blog = (int) $pageId;
                    $pageBlog->add();
                }
				$this->module->clearBlogCache($pageId);
                break;
        }
		
		$this->module->generateCss($content, $pageId, $pageType, $idLang);
		
		Tools::redirectAdmin($this->context->link->getAdminLink('Admin'.$this->name) . '&pageType='.$pageType.'&pageId='.$pageId.($idLang?'&idLang='.$idLang:''));
		
		return $response;
	}	
	
    public function ajaxProcessModalContents()
    {
		$id_lang = (int)Context::getContext()->language->id;
		$id_shop = (int)Context::getContext()->shop->id;
        $elementId = Tools::getValue('elementId', false);
		$content = Tools::getValue('submenu_content', false);
		
        if (empty($elementId) || empty($content)) {
			if(ob_get_contents()){
				ob_end_clean();
			}
			header('Content-Type: application/json');
			die(Tools::jsonEncode(array('html' => $this->module->l('Load fail'))));
        }

		$node = json_decode(urldecode($content), true);
		
		if(isset($node['contentType']) && $node['contentType'] == 3 ){
			if(isset($node['content']['ids']) && !empty($node['content']['ids'])){
				$products = array();
				$product_ids = $node['content']['ids'];
				foreach($product_ids as $key => $product_id){
					$id_product = (int)$product_id;
					$product =  new Product($id_product, true, $id_lang, $id_shop, $this->context);
					if (Validate::isLoadedObject($product)) {
						$products[$key]['id'] = (int)$id_product;
						$products[$key]['name'] = '(ID: '.(int)$id_product.') '.$product->name.' (ref: '.$product->reference.')';
					}
				}	
				$node['content']['ids'] = $products;	
			}	
		}
		
		$this->getValuesForm();
		
        $this->context->smarty->assign(
            array(
				'node' => $node,
            )
        );
		
		if($node['type'] == 1){
        	$tpl = $this->context->smarty->fetch(_PS_MODULE_DIR_.$this->module->name.'/views/templates/admin/pagebuilder/helpers/form/row_modal_body.tpl');
		}else{
        	$tpl = $this->context->smarty->fetch(_PS_MODULE_DIR_.$this->module->name.'/views/templates/admin/pagebuilder/helpers/form/column_modal_body.tpl');
		}

		if(ob_get_contents()){
			ob_end_clean();
		}
		header('Content-Type: application/json');
		die(Tools::jsonEncode(array('html' => $tpl)));
	}
	
    public function ajaxProcessProductsList()
    {
        $query = Tools::getValue('q', false);
        if (empty($query)) {
            return;
        }

        /*
         * In the SQL request the "q" param is used entirely to match result in database.
         * In this way if string:"(ref : #ref_pattern#)" is displayed on the return list,
         * they are no return values just because string:"(ref : #ref_pattern#)"
         * is not write in the name field of the product.
         * So the ref pattern will be cut for the search request.
         */
        if ($pos = strpos($query, ' (ref:')) {
            $query = substr($query, 0, $pos);
        }

        $excludeIds = Tools::getValue('excludeIds', false);
        if ($excludeIds && $excludeIds != 'NaN') {
            $excludeIds = implode(',', array_map('intval', explode(',', $excludeIds)));
        } else {
            $excludeIds = '';
        }

        // Excluding downloadable products from packs because download from pack is not supported
        $forceJson = Tools::getValue('forceJson', false);
        $disableCombination = Tools::getValue('disableCombination', false);
        $excludeVirtuals = (bool) Tools::getValue('excludeVirtuals', true);
        $exclude_packs = (bool) Tools::getValue('exclude_packs', true);

        $context = Context::getContext();

        $sql = 'SELECT p.`id_product`, pl.`link_rewrite`, p.`reference`, pl.`name`, image_shop.`id_image` id_image, il.`legend`, p.`cache_default_attribute`
                FROM `' . _DB_PREFIX_ . 'product` p
                ' . Shop::addSqlAssociation('product', 'p') . '
                LEFT JOIN `' . _DB_PREFIX_ . 'product_lang` pl ON (pl.id_product = p.id_product AND pl.id_lang = ' . (int) $context->language->id . Shop::addSqlRestrictionOnLang('pl') . ')
                LEFT JOIN `' . _DB_PREFIX_ . 'image_shop` image_shop
                    ON (image_shop.`id_product` = p.`id_product` AND image_shop.cover=1 AND image_shop.id_shop=' . (int) $context->shop->id . ')
                LEFT JOIN `' . _DB_PREFIX_ . 'image_lang` il ON (image_shop.`id_image` = il.`id_image` AND il.`id_lang` = ' . (int) $context->language->id . ')
                WHERE (pl.name LIKE \'%' . pSQL($query) . '%\' OR p.reference LIKE \'%' . pSQL($query) . '%\')' .
                (!empty($excludeIds) ? ' AND p.id_product NOT IN (' . $excludeIds . ') ' : ' ') .
                ($excludeVirtuals ? 'AND NOT EXISTS (SELECT 1 FROM `' . _DB_PREFIX_ . 'product_download` pd WHERE (pd.id_product = p.id_product))' : '') .
                ($exclude_packs ? 'AND (p.cache_is_pack IS NULL OR p.cache_is_pack = 0)' : '') .
                ' GROUP BY p.id_product';

        $items = Db::getInstance()->executeS($sql);

        if ($items && ($disableCombination || $excludeIds)) {
            $results = [];
            foreach ($items as $item) {
                if (!$forceJson) {
                    $item['name'] = str_replace('|', '&#124;', $item['name']);
                    $results[] = trim($item['name']) . (!empty($item['reference']) ? ' (ref: ' . $item['reference'] . ')' : '') . '|' . (int) ($item['id_product']);
                } else {
                    $results[] = array(
                        'id' => $item['id_product'],
                        'name' => $item['name'] . (!empty($item['reference']) ? ' (ref: ' . $item['reference'] . ')' : ''),
                        'ref' => (!empty($item['reference']) ? $item['reference'] : ''),
                        'image' => str_replace('http://', Tools::getShopProtocol(), $context->link->getImageLink($item['link_rewrite'], $item['id_image'], 'home_default')),
                    );
                }
            }

            if (!$forceJson) {
                return $this->ajaxRender(implode(PHP_EOL, $results));
            }

            return $this->ajaxRender(json_encode($results));
        }
        if ($items) {
            // packs
            $results = array();
            foreach ($items as $item) {
                // check if product have combination
                if (Combination::isFeatureActive() && $item['cache_default_attribute']) {
                    $sql = 'SELECT pa.`id_product_attribute`, pa.`reference`, ag.`id_attribute_group`, pai.`id_image`, agl.`name` AS group_name, al.`name` AS attribute_name,
                                a.`id_attribute`
                            FROM `' . _DB_PREFIX_ . 'product_attribute` pa
                            ' . Shop::addSqlAssociation('product_attribute', 'pa') . '
                            LEFT JOIN `' . _DB_PREFIX_ . 'product_attribute_combination` pac ON pac.`id_product_attribute` = pa.`id_product_attribute`
                            LEFT JOIN `' . _DB_PREFIX_ . 'attribute` a ON a.`id_attribute` = pac.`id_attribute`
                            LEFT JOIN `' . _DB_PREFIX_ . 'attribute_group` ag ON ag.`id_attribute_group` = a.`id_attribute_group`
                            LEFT JOIN `' . _DB_PREFIX_ . 'attribute_lang` al ON (a.`id_attribute` = al.`id_attribute` AND al.`id_lang` = ' . (int) $context->language->id . ')
                            LEFT JOIN `' . _DB_PREFIX_ . 'attribute_group_lang` agl ON (ag.`id_attribute_group` = agl.`id_attribute_group` AND agl.`id_lang` = ' . (int) $context->language->id . ')
                            LEFT JOIN `' . _DB_PREFIX_ . 'product_attribute_image` pai ON pai.`id_product_attribute` = pa.`id_product_attribute`
                            WHERE pa.`id_product` = ' . (int) $item['id_product'] . '
                            GROUP BY pa.`id_product_attribute`, ag.`id_attribute_group`
                            ORDER BY pa.`id_product_attribute`';

                    $combinations = Db::getInstance()->executeS($sql);
                    if (!empty($combinations)) {
                        foreach ($combinations as $k => $combination) {
                            $results[$combination['id_product_attribute']]['id'] = $item['id_product'];
                            $results[$combination['id_product_attribute']]['id_product_attribute'] = $combination['id_product_attribute'];
                            !empty($results[$combination['id_product_attribute']]['name']) ? $results[$combination['id_product_attribute']]['name'] .= ' ' . $combination['group_name'] . '-' . $combination['attribute_name']
                            : $results[$combination['id_product_attribute']]['name'] = $item['name'] . ' ' . $combination['group_name'] . '-' . $combination['attribute_name'];
                            if (!empty($combination['reference'])) {
                                $results[$combination['id_product_attribute']]['ref'] = $combination['reference'];
                            } else {
                                $results[$combination['id_product_attribute']]['ref'] = !empty($item['reference']) ? $item['reference'] : '';
                            }
                            if (empty($results[$combination['id_product_attribute']]['image'])) {
                                $results[$combination['id_product_attribute']]['image'] = str_replace('http://', Tools::getShopProtocol(), $context->link->getImageLink($item['link_rewrite'], $combination['id_image'], 'home_default'));
                            }
                        }
                    } else {
                        $results[] = array(
                            'id' => $item['id_product'],
                            'name' => $item['name'],
                            'ref' => (!empty($item['reference']) ? $item['reference'] : ''),
                            'image' => str_replace('http://', Tools::getShopProtocol(), $context->link->getImageLink($item['link_rewrite'], $item['id_image'], 'home_default')),
                        );
                    }
                } else {
                    $results[] = array(
                        'id' => $item['id_product'],
                        'name' => $item['name'],
                        'ref' => (!empty($item['reference']) ? $item['reference'] : ''),
                        'image' => str_replace('http://', Tools::getShopProtocol(), $context->link->getImageLink($item['link_rewrite'], $item['id_image'], 'home_default')),
                    );
                }
            }

            return $this->ajaxRender(json_encode(array_values($results)));
        }

        return $this->ajaxRender(json_encode([]));
    }
	
    protected function ajaxRender($value = null, $controller = null, $method = null)
    {
        if ($controller === null) {
            $controller = get_class($this);
        }

        if ($method === null) {
            $bt = debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS);
            $method = $bt[1]['function'];
        }

        /* @deprecated deprecated since 1.6.1.1 */
        Hook::exec('actionAjaxDieBefore', array('controller' => $controller, 'method' => $method, 'value' => $value));

        /*
         * @deprecated deprecated since 1.6.1.1
         * use 'actionAjaxDie'.$controller.$method.'Before' instead
         */
        Hook::exec('actionBeforeAjaxDie' . $controller . $method, array('value' => $value));
        Hook::exec('actionAjaxDie' . $controller . $method . 'Before', array('value' => $value));
        header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');

        echo $value;
        exit;
    }

}

<?php
/*
 * 2007-2016 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License (AFL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/afl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 *  @author PrestaShop SA <contact@prestashop.com>
 *  @copyright  2007-2016 PrestaShop SA
 *  @version  Release: $Revision: 7060 $
 *  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 *  International Registered Trademark & Property of PrestaShop SA
 */

if (!defined('_PS_VERSION_')) {
	exit;
}

use PrestaShop\PrestaShop\Core\Module\WidgetInterface;

use PrestaShop\PrestaShop\Adapter\NewProducts\NewProductsProductSearchProvider;
use PrestaShop\PrestaShop\Adapter\PricesDrop\PricesDropProductSearchProvider;
use PrestaShop\PrestaShop\Adapter\BestSales\BestSalesProductSearchProvider;
use PrestaShop\PrestaShop\Adapter\Category\CategoryProductSearchProvider;

use PrestaShop\PrestaShop\Adapter\Image\ImageRetriever;
use PrestaShop\PrestaShop\Adapter\Product\PriceFormatter;
use PrestaShop\PrestaShop\Core\Product\ProductListingPresenter;
use PrestaShop\PrestaShop\Adapter\Product\ProductColorsRetriever;
use PrestaShop\PrestaShop\Core\Product\Search\ProductSearchContext;
use PrestaShop\PrestaShop\Core\Product\Search\ProductSearchQuery;
use PrestaShop\PrestaShop\Core\Product\Search\SortOrder;

include_once(__DIR__ . '/src/NrtPageHome.php');
include_once(__DIR__ . '/src/NrtPageFooter.php');
include_once(__DIR__ . '/src/NrtPageHook.php');
include_once(__DIR__ . '/src/NrtPageCategory.php');
include_once(__DIR__ . '/src/NrtPageProduct.php');
include_once(__DIR__ . '/src/NrtPageCms.php');
include_once(__DIR__ . '/src/NrtPageBlog.php');
include_once(__DIR__ . '/src/NrtSlider.php');
include_once(__DIR__ . '/src/NrtTestimonial.php');
include_once(__DIR__ . '/src/NrtLinkBlock.php');
include_once(__DIR__ . '/src/NrtSocialFollow.php');

class NrtPageBuilder extends Module implements WidgetInterface
{	
	public $current_link = '/ps_1765/axon/';
	
    public function __construct()
    {
        $this->name = 'nrtpagebuilder';
		$this->version = '2.0.0';
		$this->tab = 'front_office_features';
        $this->author = 'AxonVip';
		$this->bootstrap = true;
		$this->need_instance = 0;

        parent::__construct();

        $this->displayName = $this->l('Axon - Page Builder');
        $this->description = $this->l('Flexible page builder by AxonVip.com');
        $this->secure_key = Tools::encrypt($this->name);

        $this->ps_versions_compliancy = array('min' => '1.7.1.0', 'max' => _PS_VERSION_);
        $this->templateFile = 'module:' . $this->name . '/views/templates/hook/page-content.tpl';
		
		//$this->registerHook('displayHeader8Banner');
		//$this->registerHook('displayHeader8Top');
		
    }

    public function install()
    {
        return parent::install()
            && $this->installTab()
			&& $this->createTables()
			&& $this->creatDemoData()
            && $this->registerHook('displayBackOfficeHeader')
			
            && $this->registerHook('actionObjectCategoryDeleteAfter')
			&& $this->registerHook('actionObjectProductDeleteAfter')
			&& $this->registerHook('actionObjectCmsDeleteAfter')
			&& $this->registerHook('actionObjectBlogDeleteAfter')
			
            && $this->registerHook('displayHome')
			&& $this->registerHook('displayFooter')
			&& $this->registerHook('displayFooterBefore')
			&& $this->registerHook('displayFooterAfter')
			&& $this->registerHook('displayFooterProduct')
			&& $this->registerHook('displayRightColumnProduct')
			&& $this->registerHook('displayLeftColumnProduct')	
			&& $this->registerHook('displayIncludePageBuilder')
			&& $this->registerHook('displayOrderConfirmation2')
			&& $this->registerHook('displayCrossSellingShoppingCart')
			
			&& $this->registerHook('displayCategoryPageBuilder')
            && $this->registerHook('displayProductPageBuilder')
			&& $this->registerHook('displayCmsPageBuilder')
			&& $this->registerHook('displayBlogPageBuilder')
			
            && $this->registerHook('header')
			&& Configuration::updateValue('active_homepage_layout', 1)
			&& Configuration::updateValue('active_footer_layout', 1);
    }

    public function uninstall()
    {
        return parent::uninstall()
            && $this->uninstallTab()
			&& $this->dropTables()
			&& Configuration::deleteByName('active_homepage_layout')
			&& Configuration::deleteByName('active_footer_layout');
    }

    public function installTab()
    {
        $response = true;

        // First check for parent tab
        $parentTabID = Tab::getIdFromClassName('AdminMenuFirst');

        if ($parentTabID) {
            $parentTab = new Tab($parentTabID);
        }
        else {
            $parentTab = new Tab();
            $parentTab->active = 1;
            $parentTab->name = array();
            $parentTab->class_name = "AdminMenuFirst";
            foreach (Language::getLanguages() as $lang) {
                $parentTab->name[$lang['id_lang']] = "FRAMEWORK";
            }
            $parentTab->id_parent = 0;
            $parentTab->module ='';
            $response &= $parentTab->add();
        }

		// Check for parent tab2
		$parentTab_2ID = Tab::getIdFromClassName('AdminMenuSecond');
		if ($parentTab_2ID) {
			$parentTab_2 = new Tab($parentTab_2ID);
		}
		else {
			$parentTab_2 = new Tab();
			$parentTab_2->active = 1;
			$parentTab_2->name = array();
			$parentTab_2->class_name = "AdminMenuSecond";
			foreach (Language::getLanguages() as $lang) {
				$parentTab_2->name[$lang['id_lang']] = "Module Configure";
			}
			$parentTab_2->id_parent = $parentTab->id;
			$parentTab_2->module = '';
			$response &= $parentTab_2->add();
		}
		// Created tab
        $tab = new Tab();
        $tab->active = 1;
        $tab->class_name = "AdminNrtPageBuilder";
        $tab->name = array();
        foreach (Language::getLanguages(true) as $lang) {
            $tab->name[$lang['id_lang']] = "Page Builder";
        }
        $tab->id_parent = -1;
        $tab->module = $this->name;
        $response &= $tab->add();
		
		// Created tab
        $tab_3 = new Tab();
        $tab_3->active = 1;
        $tab_3->class_name = "AdminNrtPageBuilderParent";
        $tab_3->name = array();
        foreach (Language::getLanguages(true) as $lang) {
            $tab_3->name[$lang['id_lang']] = "- Page Builder";
        }
        $tab_3->id_parent = $parentTab_2->id;
        $tab_3->module = '';
        $response &= $tab_3->add();
			
		// Created tab
        $tab = new Tab();
        $tab->active = 1;
        $tab->class_name = "AdminNrtPageHome";
        $tab->name = array();
        foreach (Language::getLanguages() as $lang) {
            $tab->name[$lang['id_lang']] = "Home Builder";
        }
        $tab->id_parent = $tab_3->id;
        $tab->module = $this->name;
        $response &= $tab->add();
		
		// Created tab
        $tab = new Tab();
        $tab->active = 1;
        $tab->class_name = "AdminNrtPageFooter";
        $tab->name = array();
        foreach (Language::getLanguages() as $lang) {
            $tab->name[$lang['id_lang']] = "Footer Builder";
        }
        $tab->id_parent = $tab_3->id;
        $tab->module = $this->name;
        $response &= $tab->add();
		
		// Created tab
        $tab = new Tab();
        $tab->active = 1;
        $tab->class_name = "AdminNrtBuilderWidget";
        $tab->name = array();
        foreach (Language::getLanguages() as $lang) {
            $tab->name[$lang['id_lang']] = "Widget Buider";
        }
        $tab->id_parent = $tab_3->id;
        $tab->module = $this->name;
        $response &= $tab->add();
		
		// Created tab
        $tab = new Tab();
        $tab->active = 1;
        $tab->class_name = "AdminNrtSlider";
        $tab->name = array();
        foreach (Language::getLanguages() as $lang) {
            $tab->name[$lang['id_lang']] = "Slider";
        }
        $tab->id_parent = $tab_3->id;
        $tab->module = $this->name;
        $response &= $tab->add();
		
		// Created tab
        $tab = new Tab();
        $tab->active = 1;
        $tab->class_name = "AdminNrtTestimonial";
        $tab->name = array();
        foreach (Language::getLanguages() as $lang) {
            $tab->name[$lang['id_lang']] = "Testimonial";
        }
        $tab->id_parent = $tab_3->id;
        $tab->module = $this->name;
        $response &= $tab->add();
		
		// Created tab
        $tab = new Tab();
        $tab->active = 1;
        $tab->class_name = "AdminNrtLinkBlock";
        $tab->name = array();
        foreach (Language::getLanguages() as $lang) {
            $tab->name[$lang['id_lang']] = "LinkBlock";
        }
        $tab->id_parent = $tab_3->id;
        $tab->module = $this->name;
        $response &= $tab->add();
		
		// Created tab
        $tab = new Tab();
        $tab->active = 1;
        $tab->class_name = "AdminNrtSocialFollow";
        $tab->name = array();
        foreach (Language::getLanguages() as $lang) {
            $tab->name[$lang['id_lang']] = "SocialFollow";
        }
        $tab->id_parent = $tab_3->id;
        $tab->module = $this->name;
        $response &= $tab->add();

        return $response;
    }

    public function uninstallTab()
    {	
        $id_tab = (int)Tab::getIdFromClassName('AdminNrtSocialFollow');
        $tab = new Tab($id_tab);
        $tab->delete();
		
        $id_tab = (int)Tab::getIdFromClassName('AdminNrtLinkBlock');
        $tab = new Tab($id_tab);
        $tab->delete();
		
        $id_tab = (int)Tab::getIdFromClassName('AdminNrtTestimonial');
        $tab = new Tab($id_tab);
        $tab->delete();
		
        $id_tab = (int)Tab::getIdFromClassName('AdminNrtSlider');
        $tab = new Tab($id_tab);
        $tab->delete();
		
        $id_tab = (int)Tab::getIdFromClassName('AdminNrtBuilderWidget');
        $tab = new Tab($id_tab);
        $tab->delete();
		
        $id_tab = (int)Tab::getIdFromClassName('AdminNrtPageFooter');
        $tab = new Tab($id_tab);
        $tab->delete();
	
        $id_tab = (int)Tab::getIdFromClassName('AdminNrtPageHome');
        $tab = new Tab($id_tab);
        $tab->delete();
		
        $id_tab = (int)Tab::getIdFromClassName('AdminNrtPageBuilderParent');
        $tab = new Tab($id_tab);
        $tab->delete();
		
        $id_tab = (int)Tab::getIdFromClassName('AdminNrtPageBuilder');
        $tab = new Tab($id_tab);
        $tab->delete();

		// Get the number of tabs inside our parent tab
        // If there is no tabs, remove the parent
		$parentTab_2ID = Tab::getIdFromClassName('AdminMenuSecond');
		$tabCount_2 = Tab::getNbTabs($parentTab_2ID);
        if ($tabCount_2 == 0) {
            $parentTab_2 = new Tab($parentTab_2ID);
            $parentTab_2->delete();
        }
        // Get the number of tabs inside our parent tab
        // If there is no tabs, remove the parent
		$parentTabID = Tab::getIdFromClassName('AdminMenuFirst');
        $tabCount = Tab::getNbTabs($parentTabID);
        if ($tabCount == 0) {
            $parentTab = new Tab($parentTabID);
            $parentTab->delete();
        }

        return true;
    }
	
    public function createTables()
    {
        $return = true;
        $this->dropTables();
		
		///////////////////////////////////////////////////////////////////////////////////////////Page hOme////////////////////
        $return &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'nrt_page_home` (
                `id_nrt_page_home` int(10) NOT NULL auto_increment,
                `name` varchar(40) NOT NULL default "",
                PRIMARY KEY (`id_nrt_page_home`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;');

        $return &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'nrt_page_home_lang` (
                `id_nrt_page_home` int(10) NOT NULL,
                `id_lang` int(10) NOT NULL ,
                `content` longtext default NULL,
                PRIMARY KEY (`id_nrt_page_home`, `id_lang`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;');
		///////////////////////////////////////////////////////////////////////////////////////////Page Footer////////////////////
        $return &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'nrt_page_footer` (
                `id_nrt_page_footer` int(10) NOT NULL auto_increment,
                `name` varchar(40) NOT NULL default "",
                PRIMARY KEY (`id_nrt_page_footer`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;');

        $return &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'nrt_page_footer_lang` (
                `id_nrt_page_footer` int(10) NOT NULL,
                `id_lang` int(10) NOT NULL ,
                `content` longtext default NULL,
                PRIMARY KEY (`id_nrt_page_footer`, `id_lang`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;');
		///////////////////////////////////////////////////////////////////////////////////////////Page Category////////////////////				
        $return &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'nrt_page_category` (
                `id_nrt_page_category` int(10) NOT NULL auto_increment,
                `id_category` int(10) NOT NULL,
                PRIMARY KEY (`id_nrt_page_category`, `id_category`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;');

        $return &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'nrt_page_category_lang` (
                `id_nrt_page_category` int(10) NOT NULL,
                `id_lang` int(10) NOT NULL ,
                `content` longtext default NULL,
                PRIMARY KEY (`id_nrt_page_category`, `id_lang`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;');
		///////////////////////////////////////////////////////////////////////////////////////////Page Product////////////////////				
        $return &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'nrt_page_product` (
                `id_nrt_page_product` int(10) NOT NULL auto_increment,
                `id_product` int(10) NOT NULL,
                PRIMARY KEY (`id_nrt_page_product`, `id_product`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;');

        $return &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'nrt_page_product_lang` (
                `id_nrt_page_product` int(10) NOT NULL,
                `id_lang` int(10) NOT NULL ,
                `content` longtext default NULL,
                PRIMARY KEY (`id_nrt_page_product`, `id_lang`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;');
		///////////////////////////////////////////////////////////////////////////////////////////Page Cms////////////////////				
        $return &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'nrt_page_cms` (
                `id_nrt_page_cms` int(10) NOT NULL auto_increment,
                `id_cms` int(10) NOT NULL,
                PRIMARY KEY (`id_nrt_page_cms`, `id_cms`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;');

        $return &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'nrt_page_cms_lang` (
                `id_nrt_page_cms` int(10) NOT NULL,
                `id_lang` int(10) NOT NULL ,
                `content` longtext default NULL,
                PRIMARY KEY (`id_nrt_page_cms`, `id_lang`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;');
		///////////////////////////////////////////////////////////////////////////////////////////Page Blog////////////////////				
        $return &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'nrt_page_blog` (
                `id_nrt_page_blog` int(10) NOT NULL auto_increment,
                `id_blog` int(10) NOT NULL,
                PRIMARY KEY (`id_nrt_page_blog`, `id_blog`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;');

        $return &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'nrt_page_blog_lang` (
                `id_nrt_page_blog` int(10) NOT NULL,
                `id_lang` int(10) NOT NULL ,
                `content` longtext default NULL,
                PRIMARY KEY (`id_nrt_page_blog`, `id_lang`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;');
		///////////////////////////////////////////////////////////////////////////////////////////Page Hook////////////////////
        $return &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'nrt_page_hook` (
                `id_nrt_page_hook` int(10) NOT NULL auto_increment,
                `hook_name` varchar(255) NOT NULL default "",
                PRIMARY KEY (`id_nrt_page_hook`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;');

        $return &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'nrt_page_hook_lang` (
                `id_nrt_page_hook` int(10) NOT NULL,
                `id_lang` int(10) NOT NULL ,
                `content` longtext default NULL,
                PRIMARY KEY (`id_nrt_page_hook`, `id_lang`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;');
		
        $return &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'nrt_page_hook_shop` (
                `id_nrt_page_hook` int(10) NOT NULL,
                `id_shop` int(10) NOT NULL ,
                PRIMARY KEY (`id_nrt_page_hook`, `id_shop`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;');
		
		///////////////////////////////////////////////////////////////////////////////////////////Slider////////////////////
        $return &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'nrt_slider` (
                `id_nrt_slider` int(10) NOT NULL auto_increment,
                `name` varchar(40) NOT NULL default "",
				`position` int(10) NOT NULL default "0",
                PRIMARY KEY (`id_nrt_slider`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;');

        $return &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'nrt_slider_lang` (
                `id_nrt_slider` int(10) NOT NULL,
                `id_lang` int(10) NOT NULL ,
                `content` longtext default NULL,
                PRIMARY KEY (`id_nrt_slider`, `id_lang`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;');
				
		///////////////////////////////////////////////////////////////////////////////////////////Testimonial////////////////////
        $return &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'nrt_testimonial` (
                `id_nrt_testimonial` int(10) NOT NULL auto_increment,
                `name` varchar(40) NOT NULL default "",
				`position` int(10) NOT NULL default "0",
                PRIMARY KEY (`id_nrt_testimonial`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;');

        $return &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'nrt_testimonial_lang` (
                `id_nrt_testimonial` int(10) NOT NULL,
                `id_lang` int(10) NOT NULL ,
                `content` longtext default NULL,
                PRIMARY KEY (`id_nrt_testimonial`, `id_lang`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;');
		
		///////////////////////////////////////////////////////////////////////////////////////////Link////////////////////
        $return &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'nrt_link_block` (
                `id_nrt_link_block` int(10) NOT NULL auto_increment,
                `name` varchar(40) NOT NULL default "",
				`position` int(10) NOT NULL default "0",
                PRIMARY KEY (`id_nrt_link_block`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;');

        $return &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'nrt_link_block_lang` (
                `id_nrt_link_block` int(10) NOT NULL,
                `id_lang` int(10) NOT NULL ,
                `content` longtext default NULL,
                PRIMARY KEY (`id_nrt_link_block`, `id_lang`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;');
		
		///////////////////////////////////////////////////////////////////////////////////////////Social////////////////////
        $return &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'nrt_social_follow` (
                `id_nrt_social_follow` int(10) NOT NULL auto_increment,
                `name` varchar(40) NOT NULL default "",
				`position` int(10) NOT NULL default "0",
                PRIMARY KEY (`id_nrt_social_follow`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;');

        $return &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'nrt_social_follow_lang` (
                `id_nrt_social_follow` int(10) NOT NULL,
                `id_lang` int(10) NOT NULL ,
                `content` longtext default NULL,
                PRIMARY KEY (`id_nrt_social_follow`, `id_lang`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8 ;');
				
        return $return;
    }

    public function dropTables()
    {
		return Db::getInstance()->execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'nrt_page_home`') && 
			   Db::getInstance()->execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'nrt_page_home_lang`') && 
				   
			   Db::getInstance()->execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'nrt_page_footer`') && 
			   Db::getInstance()->execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'nrt_page_footer_lang`') &&   
				   
			   Db::getInstance()->execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'nrt_page_category`') && 
			   Db::getInstance()->execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'nrt_page_category_lang`')&&
				   
			   Db::getInstance()->execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'nrt_page_product`') && 
			   Db::getInstance()->execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'nrt_page_product_lang`')&&
				   
			   Db::getInstance()->execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'nrt_page_cms`') && 
			   Db::getInstance()->execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'nrt_page_cms_lang`')&&
				   
			   Db::getInstance()->execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'nrt_page_blog`') && 
			   Db::getInstance()->execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'nrt_page_blog_lang`')&&
				   
			   Db::getInstance()->execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'nrt_page_hook`') && 
			   Db::getInstance()->execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'nrt_page_hook_lang`') && 
			   Db::getInstance()->execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'nrt_page_hook_shop`') && 
				   
			   Db::getInstance()->execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'nrt_slider`') && 
			   Db::getInstance()->execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'nrt_slider_lang`') && 
				   
			   Db::getInstance()->execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'nrt_testimonial`') && 
			   Db::getInstance()->execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'nrt_testimonial_lang`')&& 
				   
			   Db::getInstance()->execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'nrt_link_block`') && 
			   Db::getInstance()->execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'nrt_link_block_lang`')&& 
				   
			   Db::getInstance()->execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'nrt_social_follow`') && 
			   Db::getInstance()->execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'nrt_social_follow_lang`');
    }
	
    public function creatDemoData()
    {
		$response = true;
		
		$languages = Language::getLanguages(false);
				
		$path = $this->getLocalPath().'install/';
		
		///Slider
		for ($x = 1; $x <= 12; $x++) {
			if(file_exists($path.'slider/slider_'.$x.'.json')){
				$file = $path.'slider/slider_'.$x.'.json';

				$obj = new NrtSlider();
				$name = 'Slider '.$x;
				
				switch($x) {
					case 1:
						$name = 'Axon | Default - Slider 1';
						break;
					case 2:
						$name = 'Axon | Default - Slider 2';
						break;
					case 3:
						$name = 'Axon | Default - Slider 3';
						break;
					case 4:
						$name = 'Axon | Bikini - Slider 1';
						break;	
					case 5:
						$name = 'Axon | Bikini - Slider 2';
						break;
					case 6:
						$name = 'Axon | Bikini - Slider 3';
						break;
					case 7:
						$name = 'Axon | Supper Market - Slider 1';
						break;
					case 8:
						$name = 'Axon | Supper Market - Slider 2';
						break;
					case 9:
						$name = 'Axon | Supper Market - Slider 3';
						break;
					case 10:
						$name = 'Axon | Travel - Slider 1';
						break;	
					case 11:
						$name = 'Axon | Travel - Slider 2';
						break;
					case 12:
						$name = 'Axon | Travel - Slider 3';
						break;
				}
				
				$content = file_get_contents($file, true);
				$content = str_replace($this->current_link, __PS_BASE_URI__, $content);
				
				$obj->name = $name;
				foreach ($languages as $lang) {
					$obj->content[$lang['id_lang']] = $content;
				}
				
				$response &= $obj->add();
			}
		} 
		
		///Testimonial
		for ($x = 1; $x <= 9; $x++) {
			if(file_exists($path.'testimonial/testimonial_'.$x.'.json')){
				$file = $path.'testimonial/testimonial_'.$x.'.json';

				$obj = new NrtTestimonial();
				$name = 'Testimonial '.$x;
				
				switch($x) {
					case 1:
						$name = 'Axon | Default  - Testimonial 1';
						break;
					case 2:
						$name = 'Axon | Default  - Testimonial 2';
						break;
					case 3:
						$name = 'Axon | Default  - Testimonial 3';
						break;
					case 4:
						$name = 'Axon | Bikini - Testimonial 1';
						break;
					case 5:
						$name = 'Axon | Bikini - Testimonial 2';
						break;
					case 6:
						$name = 'Axon | Bikini - Testimonial 3';
						break;
					case 7:
						$name = 'Axon | Travel - Testimonial 1';
						break;
					case 8:
						$name = 'Axon | Travel - Testimonial 2';
						break;
					case 9:
						$name = 'Axon | Travel - Testimonial 3';
						break;	
				}
				
				$content = file_get_contents($file, true);
				$content = str_replace($this->current_link, __PS_BASE_URI__, $content);
				
				$obj->name = $name;
				foreach ($languages as $lang) {
					$obj->content[$lang['id_lang']] = $content;
				}
				
				$response &= $obj->add();
			}
		} 
		
		///Link
		for ($x = 1; $x <= 2; $x++) {
			if(file_exists($path.'link/link_'.$x.'.json')){
				$file = $path.'link/link_'.$x.'.json';

				$obj = new NrtLinkBlock();
				$name = 'Link '.$x;
				
				switch($x) {
					case 1:
						$name = 'Footer - Information';
						break;
					case 2:
						$name = 'Footer - Quick Links';
						break;
				}
				
				$content = file_get_contents($file, true);
				$content = str_replace($this->current_link, __PS_BASE_URI__, $content);
				
				$obj->name = $name;
				foreach ($languages as $lang) {
					$obj->content[$lang['id_lang']] = $content;
				}
				
				$response &= $obj->add();
			}
		} 
		
		///Social
		for ($x = 1; $x <= 1; $x++) {
			if(file_exists($path.'social/social_'.$x.'.json')){
				$file = $path.'social/social_'.$x.'.json';

				$obj = new NrtSocialFollow();
				$name = 'Social '.$x;
				
				switch($x) {
					case 1:
						$name = 'Footer - Social';
						break;
				}
				
				$content = file_get_contents($file, true);
				$content = str_replace($this->current_link, __PS_BASE_URI__, $content);
				
				$obj->name = $name;
				foreach ($languages as $lang) {
					$obj->content[$lang['id_lang']] = $content;
				}
				
				$response &= $obj->add();
			}
		}
		
		///Home
		for ($x = 1; $x <= 4; $x++) {
			if(file_exists($path.'home/home_'.$x.'.json')){
				$file = $path.'home/home_'.$x.'.json';

				$obj = new NrtPageHome();
				$name = 'Home '.$x;
				
				switch($x) {
					case 1:
						$name = 'Axon | Default';
						break;
					case 2:
						$name = 'Axon | Bikini';
						break;
					case 3:
						$name = 'Axon | Supper Market';
						break;
					case 4:
						$name = 'Axon | Travel';
						break;
				}
				
				$content = file_get_contents($file, true);
				$content = str_replace($this->current_link, __PS_BASE_URI__, $content);
				
				$obj->name = $name;
				foreach ($languages as $lang) {
					$obj->content[$lang['id_lang']] = $content;
					$this->generateCss($content, $x, 'home', $lang['id_lang']);
				}
				
				$response &= $obj->add();
			}
		}
		
		///Footer
		for ($x = 1; $x <= 1; $x++) {
			if(file_exists($path.'footer/footer_'.$x.'.json')){
				$file = $path.'footer/footer_'.$x.'.json';

				$obj = new NrtPageFooter();
				$name = 'Footer '.$x;
				
				switch($x) {
					case 1:
						$name = 'Footer';
						break;	
				}
				
				$content = file_get_contents($file, true);
				$content = str_replace($this->current_link, __PS_BASE_URI__, $content);
				
				$obj->name = $name;
				foreach ($languages as $lang) {
					$obj->content[$lang['id_lang']] = $content;
					$this->generateCss($content, $x, 'footer', $lang['id_lang']);
				}
				
				$response &= $obj->add();
			}
		}
		
		///Widget
		for ($x = 1; $x <= 8; $x++) {
			if(file_exists($path.'widget/widget_'.$x.'.json')){
				$file = $path.'widget/widget_'.$x.'.json';

				$obj = new NrtPageHook();
								
				switch($x) {
					case 1:
						$hook_name = 'displayHeader1Nav';
						break;
					case 2:
						$hook_name = 'displayHeader3Nav';
						break;
					case 3:
						$hook_name = 'displayHeader4Banner';
						break;
					case 4:
						$hook_name = 'displayFooterProduct';
						break;
					case 5:
						$hook_name = 'displayRightColumnProduct';
						break;
					case 6:
						$hook_name = 'displayLeftColumnProduct';
						break;
					case 7:
						$hook_name = 'displayLeftColumn';
						break;
					case 8:
						$hook_name = 'displayRightColumn';
						break;
				} 	
				
				$content = file_get_contents($file, true);
				$content = str_replace($this->current_link, __PS_BASE_URI__, $content);
				
				$obj->hook_name = $hook_name;
				foreach ($languages as $lang) {
					$obj->content[$lang['id_lang']] = $content;
					$this->generateCss($content, $x, 'hook', $lang['id_lang']);
				}
				
				$response &= $obj->add();
			}
		}
		
		return $response;
    }
	
    public function hookDisplayBackOfficeHeader($params)
    {
		$onlyPageBuilder = 0;
		$idLang = (int) $this->context->language->id;
		
        if (
			$this->context->controller->controller_name == 'AdminCategories' ||
            $this->context->controller->controller_name == 'AdminProducts' ||
            $this->context->controller->controller_name == 'AdminCmsContent' ||
            $this->context->controller->controller_name == 'AdminBlogPost'
            ) {
				$this->context->controller->addJquery();
				
				if($this->context->controller->controller_name == 'AdminCategories'){
					
					$idPage = (int) Tools::getValue('id_category');
					
					if(!$idPage){
						global $kernel;

						$request = $kernel->getContainer()->get('request_stack')->getCurrentRequest();

						if (!isset($request->attributes)) {
							return;
						}

						$idPage = (int) $request->attributes->get('categoryId');
					}

					$pageType = 'category';
					
				} elseif($this->context->controller->controller_name == 'AdminProducts'){
					
					global $kernel;
	
					$request = $kernel->getContainer()->get('request_stack')->getCurrentRequest();
	
					if (!isset($request->attributes)) {
						return;
					}
	
					$idPage = (int) $request->attributes->get('id');
					
					$pageType = 'product';
					
				} elseif($this->context->controller->controller_name == 'AdminCmsContent'){
					
					$idPage = (int) Tools::getValue('id_cms');
					
					if(!$idPage){
						global $kernel;

						$request = $kernel->getContainer()->get('request_stack')->getCurrentRequest();

						if (!isset($request->attributes)) {
							return;
						}

						$idPage = (int) $request->attributes->get('cmsPageId');
					}
					
					$pageType = 'cms';
		
				} elseif($this->context->controller->controller_name == 'AdminBlogPost'){
					
					$idPage = (int) Tools::getValue('id_smart_blog_post');
					
					$pageType = 'blog';	
					
				}
	
				if (!$idPage) {
					$this->context->smarty->assign(array(
						'urlPageBuilder' => ''
					));
				}
				else{
					$url = $this->context->link->getAdminLink('AdminNrtPageBuilder').'&pageType='.$pageType.'&pageId=' . $idPage . '&idLang='. (int) $this->context->language->id;
	
					$this->context->smarty->assign(array(
						'urlPageBuilder' => $url
					));
				}
								
				return $this->fetch(_PS_MODULE_DIR_ .'/'. $this->name . '/views/templates/hook/backoffice-header.tpl');
			}
		
		
	}

    public function getContent()
    {
        Tools::redirectAdmin(
            $this->context->link->getAdminLink('AdminNrtPageHome')
        );
    }
	
    public function hookHeader($params)
    {
		global $smarty;
		$idLang = (int)$this->context->language->id;

        Media::addJsDef(array(
			'opPbder' => array('ajax' => $this->context->link->getModuleLink('nrtpagebuilder', 'ajax', 
																					array(), null, null, null, true))
        ));
				
		$this->context->controller->registerJavascript('p-load-widget', 
													   'modules/'.$this->name.'/js/front/load-widget.js', ['position' => 'bottom', 'priority' => 150]);
		
		$this->context->controller->registerJavascript('p-load-infinite', 
													   'modules/'.$this->name.'/js/front/load-infinite.js', ['position' => 'bottom', 'priority' => 150]);
		
		$this->context->controller->registerJavascript('p-carousel', 
													   'modules/'.$this->name.'/js/front/front.js', ['position' => 'bottom', 'priority' => 150]);
		
		$this->context->controller->registerJavascript('p-slider', 
													   'modules/'.$this->name.'/js/front/slider.js', ['position' => 'bottom', 'priority' => 150]);
								
		////////Home
		if(Dispatcher::getInstance()->getController() == 'index'){
			$pageId = (int) Configuration::get('active_homepage_layout');
			$this->context->controller->registerStylesheet('page_home_'.$pageId.'_'.$idLang, 'modules/'.$this->name.'/css/front/page_home_'.$pageId.'_'.$idLang.'.css', ['media' => 'all', 'priority' => 150]);
		}
		////////Footer
		$pageId = (int) Configuration::get('active_footer_layout');
		$this->context->controller->registerStylesheet('page_footer_'.$pageId.'_'.$idLang, 'modules/'.$this->name.'/css/front/page_footer_'.$pageId.'_'.$idLang.'.css', ['media' => 'all', 'priority' => 150]);
		////////Hook
		$layoutIds = NrtPageHook::getAll();
		foreach ($layoutIds as $layoutId) {
			$pageId = (int) $layoutId['id_nrt_page_hook'];
			$this->context->controller->registerStylesheet('page_hook_'.$pageId.'_'.$idLang, 'modules/'.$this->name.'/css/front/page_hook_'.$pageId.'_'.$idLang.'.css', ['media' => 'all', 'priority' => 150]);
        }
		////////Category
		if(Dispatcher::getInstance()->getController() == 'category' && isset($smarty->tpl_vars['category']->value['id'])){
			$pageId = $smarty->tpl_vars['category']->value['id'];
			$this->context->controller->registerStylesheet('page_category_'.$pageId.'_'.$idLang, 'modules/'.$this->name.'/css/front/page_category_'.$pageId.'_'.$idLang.'.css', ['media' => 'all', 'priority' => 150]);
		}
		////////Product
		if(isset($smarty->tpl_vars['product']->value['id'])){
			$pageId = $smarty->tpl_vars['product']->value['id'];
			$this->context->controller->registerStylesheet('page_product_'.$pageId.'_'.$idLang, 'modules/'.$this->name.'/css/front/page_product_'.$pageId.'_'.$idLang.'.css', ['media' => 'all', 'priority' => 150]);
		}
		////////Cms
		if(isset($smarty->tpl_vars['cms']->value['id'])){
			$pageId = $smarty->tpl_vars['cms']->value['id'];
			$this->context->controller->registerStylesheet('page_cms_'.$pageId.'_'.$idLang, 'modules/'.$this->name.'/css/front/page_cms_'.$pageId.'_'.$idLang.'.css', ['media' => 'all', 'priority' => 150]);
		}
		////////Blog
		if(isset($smarty->tpl_vars['post']->value['id_post'])){
			$pageId = $smarty->tpl_vars['post']->value['id_post'];
			$this->context->controller->registerStylesheet('page_blog_'.$pageId.'_'.$idLang, 'modules/'.$this->name.'/css/front/page_blog_'.$pageId.'_'.$idLang.'.css', ['media' => 'all', 'priority' => 150]);
		}
			
    }

    public function renderWidget($hookName = null, array $configuration = [])
    {
		
        if ($hookName == null && isset($configuration['hook'])) {
            $hookName = $configuration['hook'];
        }

        $cacheId = $hookName;

        if (preg_match('/^displayHome\d*$/', $hookName)) {
            $cacheId = 'pageBuilder|'.$hookName;
        } elseif (preg_match('/^displayFooter\d*$/', $hookName)) {
            $cacheId = 'pageBuilder|'.$hookName;
        } elseif (preg_match('/^displayCategoryPageBuilder\d*$/', $hookName)){
			$cacheId = 'pageBuilder|displayCategoryPageBuilder|'.(int) $configuration['smarty']->tpl_vars['category']->value['id'];
        } elseif (preg_match('/^displayProductPageBuilder\d*$/', $hookName)){
			$cacheId = 'pageBuilder|displayProductPageBuilder|'.(int) $configuration['smarty']->tpl_vars['product']->value['id'];
        } elseif (preg_match('/^displayCmsPageBuilder\d*$/', $hookName)){
			$cacheId = 'pageBuilder|displayCmsPageBuilder|'.(int) $configuration['smarty']->tpl_vars['cms']->value['id'];
        } elseif (preg_match('/^displayBlogPageBuilder\d*$/', $hookName)){
			$cacheId = 'pageBuilder|displayBlogPageBuilder|'.(int) $configuration['smarty']->tpl_vars['post']->value['id_post'];
        } elseif (preg_match('/^displayFooterProduct\d*$/', $hookName)){
			if (!empty($configuration['product'])) {
				$product = $configuration['product'];

				if ($product instanceof Product) {
					$product = (array) $product;
					$product['id_product'] = $product['id'];
				}

				$id_product = $product['id_product'];
				$id_category = (isset($configuration['category']->id) ? (int) $configuration['category']->id : (int) $product['id_category_default']);

				if (!empty($id_product) && !empty($id_category)) {
					$cacheId = 'pageBuilder|'.$hookName.'|'.$id_product.'|'.$id_category;
				}
			}else{

				$cacheId = 'pageBuilder|'.$hookName;
			}
        } else {
            $cacheId = 'pageBuilder|'.$hookName;
        }
		
        if (!$this->isCached($this->templateFile, $this->getCacheId($cacheId))){
            $this->smarty->assign($this->getWidgetVariables($hookName, $configuration));
        }

        return $this->fetch($this->templateFile, $this->getCacheId($cacheId));
    }

    public function getWidgetVariables($hookName = null, array $configuration = [])
    {
        if ($hookName == null && isset($configuration['hook'])) {
            $hookName = $configuration['hook'];
        }
		
        $content = [];
        $options = [];

        if (preg_match('/^displayHome\d*$/', $hookName)) {
            $layoutId = (int) Configuration::get('active_homepage_layout');
            $layout =  new NrtPageHome($layoutId, $this->context->language->id);

            if (Validate::isLoadedObject($layout)) {
				$data = json_decode($layout->content, true);
				$content = $this->convertContent($data, true);
            }
			$options['class'] = 'home';
        } elseif (preg_match('/^displayFooter\d*$/', $hookName)) {
            $layoutId = (int) Configuration::get('active_footer_layout');
            $layout =  new NrtPageFooter($layoutId, $this->context->language->id);

            if (Validate::isLoadedObject($layout)) {
				$data = json_decode($layout->content, true);
				$content = $this->convertContent($data, true);
            }
			$options['class'] = 'footer';
        } elseif (preg_match('/^displayCategoryPageBuilder\d*$/', $hookName)){
            $categoryId = (int) $configuration['smarty']->tpl_vars['category']->value['id'];
            $id = NrtPageCategory::getIdByCategory($categoryId);

            if ($id){
                $layout =  new NrtPageCategory($id, $this->context->language->id);

                if (Validate::isLoadedObject($layout)) {
					$data = json_decode($layout->content, true);
					$content = $this->convertContent($data, true);
                }
            }
			$options['class'] = 'category';
        } elseif (preg_match('/^displayProductPageBuilder\d*$/', $hookName)){
            $productId = (int) $configuration['smarty']->tpl_vars['product']->value['id'];
            $id = NrtPageProduct::getIdByProduct($productId);

            if ($id){
                $layout =  new NrtPageProduct($id, $this->context->language->id);

                if (Validate::isLoadedObject($layout)) {
					$data = json_decode($layout->content, true);
					$content = $this->convertContent($data, true);
                }
            }
			$options['class'] = 'product';
        } elseif (preg_match('/^displayCmsPageBuilder\d*$/', $hookName)){
            $cmsId = (int) $configuration['smarty']->tpl_vars['cms']->value['id'];
            $id = NrtPageCms::getIdByCms($cmsId);

            if ($id){
                $layout =  new NrtPageCms($id, $this->context->language->id);

                if (Validate::isLoadedObject($layout)) {
					$data = json_decode($layout->content, true);
					$content = $this->convertContent($data, true);
                }
            }
			$options['class'] = 'cms';
        } elseif (preg_match('/^displayBlogPageBuilder\d*$/', $hookName)){
            $blogId = (int)  $configuration['smarty']->tpl_vars['post']->value['id_post'];
            $id = NrtPageBlog::getIdByBlog($blogId);

            if ($id){
                $layout =  new NrtPageBlog($id, $this->context->language->id);

                if (Validate::isLoadedObject($layout)) {
					$data = json_decode($layout->content, true);
					$content = $this->convertContent($data, true);
                }
            }
			$options['class'] = 'blog';
        } else{

			$hookId = NrtPageHook::getIdByHookName($hookName);
			
            $layout =  new NrtPageHook($hookId, (int)$this->context->language->id);

            if (Validate::isLoadedObject($layout)) {
				$data = json_decode($layout->content, true);
				$content = $this->convertContent($data, true);
            }
			$options['class'] = 'hook-'.$hookId;
        }

        return array(
            'content' => $content,
            'options' => $options,
        );
    }
		
    public function clearHomeCache() 
	{
        $cacheId = 'pageBuilder|displayHome';
        $this->_clearCache($this->templateFile, $cacheId);
    }
	
    public function clearFooterCache() 
	{
        $cacheId = 'pageBuilder|displayFooter';
        $this->_clearCache($this->templateFile, $cacheId);
    }
	
    public function clearHookCache($hook_name) 
	{
        $cacheId = 'pageBuilder|'.$hook_name;
        $this->_clearCache($this->templateFile, $cacheId);
    }

    public function clearCategoryCache($id) 
	{
        $cacheId = 'pageBuilder|displayProductPagebuilder|'.(int)$id;
        $this->_clearCache($this->templateFile, $cacheId);
    }
	
    public function clearProductCache($id) 
	{
        $cacheId = 'pageBuilder|displayProductPagebuilder|'.(int)$id;
        $this->_clearCache($this->templateFile, $cacheId);
    }
	
    public function clearCmsCache($id) 
	{
        $cacheId = 'pageBuilder|displayCmsPagebuilder|'.(int)$id;
        $this->_clearCache($this->templateFile, $cacheId);
    }
	
    public function clearBlogCache($id) 
	{
        $cacheId = 'pageBuilder|displayBlogPagebuilder|'.(int)$id;
        $this->_clearCache($this->templateFile, $cacheId);
    }
	
    public function hookActionObjectCategoryDeleteAfter($params)
    {
        if (!isset($params['object']->id)) {
            return;
        }
		$id = (int)$params['object']->id;
        $this->clearCategoryCache($id);
		$this->deleteCss($id, 'category');
		NrtPageCategory::deleteElement($id);
    }
	
    public function hookActionObjectProductDeleteAfter($params)
    {
        if (!isset($params['object']->id)) {
            return;
        }
		$id = (int)$params['object']->id;
        $this->clearProductCache($id);
		$this->deleteCss($id, 'product');
		NrtPageProduct::deleteElement($id);
    }
	
    public function hookActionObjectCmsDeleteAfter($params) 
	{
		
        if (!isset($params['object']->id)) {
            return;
        }
		$id = (int)$params['object']->id;
        $this->clearCmsCache($id);
		$this->deleteCss($id, 'cms');
		NrtPageCms::deleteElement($id);
    }
	
    public function hookActionObjectBlogDeleteAfter($params) 
	{
		
        if (!isset($params['object']->id)) {
            return;
        }
		$id = (int)$params['object']->id;
        $this->clearBlogCache($id);
		$this->deleteCss($id, 'blog');
		NrtPageBlog::deleteElement($id);
    }
		
	public function convertContent($dataset, $frontend = false) 
	{
		$id_lang = (int)Context::getContext()->language->id;
		$id_shop = (int)Context::getContext()->shop->id;

		if(!is_array($dataset)){
			$dataset = array();
		}
		
		$tree = array();
		foreach ($dataset as $id => &$node) {
			if($frontend)
			{

				if(!isset($node['content_s']['title']) || $node['content_s']['title'] == ''){
					unset($node['content_s']['title']);
				}
				
				if(!isset($node['content_s']['href']) || $node['content_s']['href'] == ''){
					unset($node['content_s']['href']);
				}
				
				if(!isset($node['content_s']['title_c']) || $node['content_s']['title_c'] == ''){
					unset($node['content_s']['title_c']);
				}
				
				if(!isset($node['content_s']['class']) || $node['content_s']['class'] == ''){
					unset($node['content_s']['class']);
				}
				
				if(!isset($node['tabtitle']) || $node['tabtitle'] == ''){
					unset($node['tabtitle']);
				}
				
				//set variouse links
				if(isset($node['contentType'])){
					switch($node['contentType']) {
						case 1:
							if(!$node['content']['ajax']){	
								$node['content'] = $this->_prepProducts($node['content']);
							}elseif($node['content']['ajax']){
								$config = array('process' => 'products', 'config' => $node['content']);
								$node['content']['config'] = json_encode($config);
								$node['content']['ajax'] = 1;	
							}
							break;
						case 2:
							if(!$node['content']['ajax']){	
								$node['content'] = $this->_prepLoadProducts($node['content']);	
							}elseif($node['content']['ajax']){
								$config = array('process' => 'infiniteProducts', 'config' => $node['content']);
								$node['content']['config'] = json_encode($config);
								$node['content']['ajax'] = 1;	
							}
							break;
						case 3:
							if(!$node['content']['ajax']){	
								$node['content'] = $this->_prepProductsSelected($node['content']);
							}elseif($node['content']['ajax']){
								$config = array('process' => 'productsSelected', 'config' => $node['content']);
								$node['content']['config'] = json_encode($config);
								$node['content']['ajax'] = 1;	
							}
							break;
						case 4:
							if(!$node['content']['ajax']){
								$node['content'] = $this->_prepCategories($node['content']);
							}elseif($node['content']['ajax']){
								$config = array('process' => 'categories', 'config' => $node['content']);
								$node['content']['config'] = json_encode($config);
								$node['content']['ajax'] = 1;	
							}
							break;
						case 5:
							if(!$node['content']['ajax']){	
								$node['content'] = $this->_prepBrands($node['content']);
							}elseif($node['content']['ajax']){
								$config = array('process' => 'brands', 'config' => $node['content']);
								$node['content']['config'] = json_encode($config);
								$node['content']['ajax'] = 1;	
							}
							break;
						case 6:
							if(!$node['content']['ajax']){	
								$node['content'] = $this->_prepBlogs($node['content']);
							}elseif($node['content']['ajax']){
								$config = array('process' => 'blogs', 'config' => $node['content']);
								$node['content']['config'] = json_encode($config);
								$node['content']['ajax'] = 1;	
							}
							break;
						case 7:
							$node['content'] = $this->_prepSliders($node['content']);
							break;
						case 8:
							$node['content'] = $this->_prepTestimonials($node['content']);
							break;
						case 9:
							$node['content'] = $this->_prepInstagrams($node['content']);	
							break;	
						case 17:
							$node['content'] = $this->_prepOwlCustom($node['content']);
							break;
						case 18:
							$node['content'] = $this->_prepLinks($node['content']);
							break;
						case 19:
							$node['content'] = $this->_prepSocials($node['content']);	
							break;	
						case 20:
							if(!$node['content']['ajax']){	
								$node['content'] = $this->execModuleHook($node['content']);
							}elseif($node['content']['ajax']){
								$config = array('process' => 'module', 'config' => $node['content']);
								$node['content']['config'] = json_encode($config);
								$node['content']['ajax'] = 1;	
							}	
							break;
						case 21:
							if(!isset($node['content']['banner']['src']) || $node['content']['banner']['src'] == ''){
								unset($node['content']['banner']);
							}
							break;
						case 22:
							if(!isset($node['content']['custom_html']) || $node['content']['custom_html'] == ''){
								unset($node['content']['custom_html']);
							}	
							break;
					}
				}
			}
			
			if(!$frontend){
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
			}
			
			if ($node['parentId'] === 0) {
				$tree[$id] = &$node;
			} else {
				if (!isset($dataset[$node['parentId']]['children'])){ 
					$dataset[$node['parentId']]['children'] = array();
				}
				$dataset[$node['parentId']]['children'][$id] = &$node;
			}
			
		}

		$tree = $this->sortArrayTree($tree);
		
		return $tree;
	}
	
	public function sortArrayTree($passedTree)
	{
		usort($passedTree, array($this, 'sortByPosition'));
		foreach ($passedTree as $key => $subtree) {
			if(!empty($subtree['children']))
			{	
				$passedTree[$key]['children'] = $this->sortArrayTree($subtree['children']);
			}
		}	
		return $passedTree;
	}

	public function sortByPosition($a, $b) 
	{
		return $a['position'] - $b['position'];
	}
	
    public function execModuleHook($config, $hook_args = array())
	{		
		
		$name_module = $config['module']['name'];
		$hook_name = $config['module']['hook'];
				
		$id_shop = (int)Context::getContext()->shop->id;
		
		$id_module = Module::getModuleIdByName($name_module);
		// Check arguments validity
		if (($id_module && !is_numeric($id_module)) || !Validate::isHookName($hook_name)){
			return false;
		}
		
		// Check if hook exists
		if (!$id_hook = Hook::getIdByName($hook_name)){
			return false;
		}

		// Store list of executed hooks on this page
		Hook::$executed_hooks[$id_hook] = $hook_name;

		$live_edit = false;
		$context = Context::getContext();
		if (!isset($hook_args['cookie']) || !$hook_args['cookie']){
			$hook_args['cookie'] = $context->cookie;
		}
		if (!isset($hook_args['cart']) || !$hook_args['cart']){
			$hook_args['cart'] = $context->cart;
		}

		$retro_hook_name = Hook::getRetroHookName($hook_name);

		// Look on modules list
		$altern = 0;
		$output = '';

		$different_shop = false;
		
		if ($id_shop !== null && Validate::isUnsignedId($id_shop) && $id_shop != $context->shop->getContextShopID())
		{
			$old_context_shop_id = $context->shop->getContextShopID();
			$old_context = $context->shop->getContext();
			$old_shop = clone $context->shop;
			$shop = new Shop((int)$id_shop);
			if (Validate::isLoadedObject($shop))
			{
				$context->shop = $shop;
				$context->shop->setContext(Shop::CONTEXT_SHOP, $shop->id);
				$different_shop = true;
			}
		}
		
		if (!($moduleInstance = Module::getInstanceById($id_module))){
			return false;
		}

		// Check which / if method is callable
		$hook_callable = is_callable(array($moduleInstance, 'hook'.$hook_name));
		$hook_retro_callable = is_callable(array($moduleInstance, 'hook'.$retro_hook_name));
		$renderWidget_callable = is_callable(array($moduleInstance, 'renderWidget'));
		$check = true;
		$exceptions = Module::getExceptionsStatic($id_module,Hook::getIdByName($hook_name));
		$controller = Dispatcher::getInstance()->getController();
		$controller_obj = Context::getContext()->controller;
		$modules_shop_active = Db::getInstance()->executeS('
															SELECT *
															FROM `'._DB_PREFIX_.'module_shop` m
															WHERE m.`id_module` ='.$id_module);
		//check if current controller is a module controller
		if (isset($controller_obj->module) && Validate::isLoadedObject($controller_obj->module)) {
			$controller = 'module-'.$controller_obj->module->name.'-'.$controller;
		}
		if (in_array($controller, $exceptions)) {
			$check = false;
		}
		if (($hook_callable || $hook_retro_callable) && $check && $modules_shop_active)
		{
			$hook_args['altern'] = ++$altern;
			// Call hook method
			if ($hook_callable){
				$display = $moduleInstance->{'hook'.$hook_name}($hook_args);
			}
			elseif ($hook_retro_callable){
				$display = $moduleInstance->{'hook'.$retro_hook_name}($hook_args);
			}
			$output .= $display;
		}
		else if($renderWidget_callable && $check && $modules_shop_active){
			$output = $moduleInstance->renderWidget($hook_name, $hook_args);
		}

		if ($different_shop)
		{
			$context->shop = $old_shop;
			$context->shop->setContext($old_context, $shop->id);
		}
		
		$elementWidget = array();
		$elementWidget['module'] = $output;

		return $elementWidget;
	}
	
    public function _prepCategories($config)
	{
		$elementWidget = array();
		$id_lang = (int)Context::getContext()->language->id;
		$id_shop = (int)Context::getContext()->shop->id;
		$id_categories = $config['ids'];
		if(!$id_categories){
			$id_categories = array();
		}
		$categories = array();
		foreach($id_categories as $id_category) {
			$obj = new Category((int) $id_category, $id_lang, $id_shop);
			if(($obj->id_category)){
				$image = array();
				
				for ($i = 0; $i < 3; ++$i) {
					if (file_exists(_PS_CAT_IMG_DIR_ . (int) $obj->id_category . '-' . $i . '_thumb.jpg')) {
						$image['url'] = $this->context->link->getMediaLink(_THEME_CAT_DIR_.(int)$obj->id_category.'-'.$i.'_thumb.jpg');
						break;
					}
				}
				
				if(isset($image['url']) && $image['url']){
					list($img_width, $img_height) = getimagesize($image['url']);
					$image['width'] = $img_width;
					$image['height'] = $img_height;
				}
				
				$url = $this->context->link->getCategoryLink($obj->id_category, $obj->link_rewrite);

				$qtt_products = $obj->getProducts($id_lang, 1, 999999999);

				$sub_categories = $obj->getSubCategories($id_lang);

				$childrens = array();

				foreach($sub_categories as $key => $sub_category) {
					$sub_obj = new Category((int) $sub_category['id_category'], $id_lang, $id_shop);

					$childrens[$key]["qtt_products"] = $sub_obj->getProducts($id_lang, 1, 999999999);
					$childrens[$key]["name"] = $sub_obj->name;
					$childrens[$key]["url"]= $this->context->link->getCategoryLink($sub_obj->id_category, $sub_obj->link_rewrite);;	
					$sub_image = array();
					for ($i = 0; $i < 3; ++$i) {
						if (file_exists(_PS_CAT_IMG_DIR_ . (int) $sub_obj->id . '-' . $i . '_thumb.jpg')) {
							$sub_image['url'] = $this->context->link->getMediaLink(_THEME_CAT_DIR_.(int)$sub_obj->id.'-'.$i.'_thumb.jpg');
							break;
						}
					}
					if(isset($sub_image['url']) && $sub_image['url']){
						list($img_width, $img_height) = getimagesize($sub_image['url']);
						$sub_image['width'] = $img_width;
						$sub_image['height'] = $img_height;
					}
					$childrens[$key]["image"]= $sub_image;	
					$childrens[$key]["description"] = $sub_obj->description;		
				}
				$categories[] = array(
					'qtt_products'=> count($qtt_products),
					'name' => $obj->name,
					'url' => $url, 	
					'image' => $image,
					'description' => $obj->description,
					'childrens' => $childrens
				);
			}
		}	
		
		$elementWidget['categories'] = $categories;
		
		$elementWidget['view_type'] = (int)$config['view_type'];
		$elementWidget['itemsOwl']['xs'] = $config['optionsOwl']['xs']['line'];
		$elementWidget['itemsOwl']['sm'] = $config['optionsOwl']['sm']['line'];
		$elementWidget['itemsOwl']['md'] = $config['optionsOwl']['md']['line'];
		$elementWidget['itemsOwl']['lg'] = $config['optionsOwl']['lg']['line'];
		$elementWidget['itemsOwl']['xl'] = $config['optionsOwl']['xl']['line'];
		$elementWidget['optionsOwl'] = json_encode($config['optionsOwl']);	
		return $elementWidget;
	}
	
    public function _prepBrands($config)
	{
		$elementWidget = array();
		$id_lang = (int)Context::getContext()->language->id;
		$brands = array();
		if (isset($config['ids'][0]) && ($config['ids'][0] == 0)){
			$id_brands = Manufacturer::getManufacturers(false, $id_lang, true, false, false, false);
		}else{	
			$id_brands = array();
			if($config['ids']){
				foreach($config['ids'] as $id_brand){
					$id_brands[]['id_manufacturer'] = $id_brand;		
				}	
			}
		}	

		foreach($id_brands as $key => $id_brand){
			$brand = new Manufacturer((int)$id_brand['id_manufacturer'], $id_lang);
			$brands[$key]['name'] = $brand->name;
			$brands[$key]['image']['url'] = $this->context->link->getManufacturerImageLink($brand->id);
			list($img_width, $img_height) = getimagesize($brands[$key]['image']['url']);
			$brands[$key]['image']['width'] = $img_width;
			$brands[$key]['image']['height'] = $img_height;
			$brands[$key]['url'] = $this->context->link->getManufacturerLink($brand->id);
		}
		
		$elementWidget['brands'] = $brands;
		
		$elementWidget['view_type'] = (int)$config['view_type'];
		$elementWidget['itemsOwl']['xs'] = $config['optionsOwl']['xs']['line'];
		$elementWidget['itemsOwl']['sm'] = $config['optionsOwl']['sm']['line'];
		$elementWidget['itemsOwl']['md'] = $config['optionsOwl']['md']['line'];
		$elementWidget['itemsOwl']['lg'] = $config['optionsOwl']['lg']['line'];
		$elementWidget['itemsOwl']['xl'] = $config['optionsOwl']['xl']['line'];
		$elementWidget['optionsOwl'] = json_encode($config['optionsOwl']);	

		return $elementWidget;
	}
	
    public function _prepBlogs($config)
	{
		$elementWidget = array();		
		
		$blog_type = $config['ids'];
		$blog_limit = (int)$config['limit'];
		$view_type = (int)$config['view_type'];
		$image_type = $config['image_type'];
		$per_column = (int)$config['per_column'];	

		$elementWidget['blogs'] = $this->execBlogs($blog_type, $blog_limit, $image_type);
		
		$elementWidget['view_type'] = $view_type;
		$elementWidget['per_column'] = $per_column;
		$elementWidget['itemsOwl']['xs'] = $config['optionsOwl']['xs']['line'];
		$elementWidget['itemsOwl']['sm'] = $config['optionsOwl']['sm']['line'];
		$elementWidget['itemsOwl']['md'] = $config['optionsOwl']['md']['line'];
		$elementWidget['itemsOwl']['lg'] = $config['optionsOwl']['lg']['line'];
		$elementWidget['itemsOwl']['xl'] = $config['optionsOwl']['xl']['line'];
		$elementWidget['optionsOwl'] = json_encode($config['optionsOwl']);	
				
		return $elementWidget;
	}
	
    public function execBlogs($blog_type, $limit, $img_blog_type)
	{	
		$blogs = array();
		
		if(Module::isInstalled('smartblog') && Module::isEnabled('smartblog')){
			if($blog_type == 'n'){
				$blogs = SmartBlogPost::GetPostLatestHome($limit, $img_blog_type);
			}else{
				$blogs = SmartBlogPost::GetPostByCategory($blog_type, $limit, $img_blog_type);
			}
		}
		
		return $blogs;	
	}
	
    public function _prepProducts($config)
	{			
		$elementWidget = array();		

		$product_type = $config['ids'];
		
		$limit = (int)$config['limit'];
		$order_by = $config['order_by'];
		$order_way = $config['order_way'];

		$view_type = (int)$config['view_type'];
		$image_type = $config['image_type'];
		
		$per_column = (int)$config['per_column'];	

		$elementWidget['products'] = $this->execProducts($product_type, array(), $limit, $order_by, $order_way, 1);
		
		if(($product_type == 'p_s' || $product_type == 'p_a') && !count($elementWidget['products'])){
			$elementWidget['hidden_title'] = true;
		}

		$elementWidget['view_type'] = $view_type;
		$elementWidget['img_type'] = $image_type;
		$elementWidget['per_column'] = $per_column;
		$elementWidget['itemsOwl']['xs'] = $config['optionsOwl']['xs']['line'];
		$elementWidget['itemsOwl']['sm'] = $config['optionsOwl']['sm']['line'];
		$elementWidget['itemsOwl']['md'] = $config['optionsOwl']['md']['line'];
		$elementWidget['itemsOwl']['lg'] = $config['optionsOwl']['lg']['line'];
		$elementWidget['itemsOwl']['xl'] = $config['optionsOwl']['xl']['line'];
		$elementWidget['optionsOwl'] = json_encode($config['optionsOwl']);		
		return $elementWidget;
	}
	
    public function _prepProductsSelected($config)
	{			
		$elementWidget = array();		
		$product_ids = $config['ids'];
		if(!$product_ids){
			$product_ids = array();
		}	
		$view_type = (int)$config['view_type'];
		$image_type = $config['image_type'];
		
		$per_column = (int)$config['per_column'];	

		$elementWidget['products'] = $this->execProducts('c', $product_ids, 0, null, null, 1);

		$elementWidget['view_type'] = $view_type;
		$elementWidget['img_type'] = $image_type;
		$elementWidget['per_column'] = $per_column;
		$elementWidget['itemsOwl']['xs'] = $config['optionsOwl']['xs']['line'];
		$elementWidget['itemsOwl']['sm'] = $config['optionsOwl']['sm']['line'];
		$elementWidget['itemsOwl']['md'] = $config['optionsOwl']['md']['line'];
		$elementWidget['itemsOwl']['lg'] = $config['optionsOwl']['lg']['line'];
		$elementWidget['itemsOwl']['xl'] = $config['optionsOwl']['xl']['line'];
		$elementWidget['optionsOwl'] = json_encode($config['optionsOwl']);		
		return $elementWidget;
	}
	
    public function _prepLoadProducts($config)
	{	
		$elementWidget = array();		
		
		$product_type = $config['ids'];

		$limit = (int)$config['limit'];
		$order_by = $config['order_by'];
		$order_way = $config['order_way'];
		
		$view_type = (int)$config['view_type'];
		$image_type = $config['image_type'];
		
		$sort_order = (int)$config['sort_order'];
		
		if(isset($config['page'])){		
			$page = $config['page'];
		}else{
			$page = 1;
		}
		
		if(isset($config['page']) || isset($config['ajax_sort_order'])){	
			$elementWidget['infinite'] = true;	
		}
		
		$elementWidget['products'] = $this->execProducts($product_type,  array(), $limit, $order_by, $order_way, $page);
		
		$elementWidget['lastPage'] = !(bool)$this->execProducts($product_type,  array(), $limit, $order_by, $order_way, $page + 1);
		
		$elementWidget['view_type'] = $view_type;
		$elementWidget['img_type'] = $image_type;
		$elementWidget['sort_order'] = $sort_order;
		
		$options = array();
		$options['process'] = 'infiniteProducts';
		$options['optionsOwl'] = $config['optionsOwl'];
		$options['config'] = $config;
		
		$elementWidget['order_by'] = $config['order_by'];
		$elementWidget['order_way'] = $config['order_way'];
		$elementWidget['options'] = json_encode($options);
		$elementWidget['optionsOwl'] = $config['optionsOwl'];
		return $elementWidget;
	}
	
    public function execProducts($product_type, $product_ids, $limit, $order_by, $order_way, $page = 1)
	{		
		
		$id_lang = (int)$this->context->language->id;
		$id_shop = (int)$this->context->shop->id;
		
		$products = [];
				
        switch ($product_type) {
            case 'n':
				$searchProvider = new NewProductsProductSearchProvider($this->context->getTranslator());
				
				$context = new ProductSearchContext($this->context);
				$query = new ProductSearchQuery();
				$query->setResultsPerPage($limit)->setPage($page);
				$query->setSortOrder(new SortOrder('product', $order_by, $order_way));
				$result = $searchProvider->runQuery($context, $query);
				$products = $result->getProducts();		
                break;
            case 's':
				$searchProvider = new PricesDropProductSearchProvider($this->context->getTranslator());
				
				$context = new ProductSearchContext($this->context);
				$query = new ProductSearchQuery();
				$query->setResultsPerPage($limit)->setPage($page);
				$query->setSortOrder(new SortOrder('product', $order_by, $order_way));
				$result = $searchProvider->runQuery($context, $query);
				$products = $result->getProducts();		
                break;
            case 'b':
				if($order_by == 'position'){
					$order_by = 'sales';
				}	
									
				$searchProvider = new BestSalesProductSearchProvider($this->context->getTranslator());
				
				$context = new ProductSearchContext($this->context);
				$query = new ProductSearchQuery();
				$query->setResultsPerPage($limit)->setPage($page);
				$query->setSortOrder(new SortOrder('product', $order_by, $order_way));
				$result = $searchProvider->runQuery($context, $query);
				$products = $result->getProducts();		
                break;
            case 'c':
				if(isset($product_ids) && !empty($product_ids)){
					foreach($product_ids as $product_id){
						$id_product = (int)$product_id;
						$product =  new Product($id_product, true, $id_lang, $id_shop, $this->context);
						if (Validate::isLoadedObject($product)) {
							$product->id_product = (int)$id_product;
							$products[]= (array)$product;
						}
					}	
				}
                break;
            case 'p_s':
				global $smarty;
				if(isset($smarty->tpl_vars['product']->value)){
					$product = $smarty->tpl_vars['product']->value;
					if ($product instanceof Product) {
						$product = (array) $product;
						$product['id_product'] = $product['id'];
					}
					
					$id_product = $product['id_product'];
					$id_category = (isset($smarty->tpl_vars['category']->value->id) ? (int) $smarty->tpl_vars['category']->value->id : (int) $product['id_category_default']);
				
					if (!empty($id_product) && !empty($id_category)) {
						$category = new Category($id_category);
						
						$searchProvider = new CategoryProductSearchProvider($this->context->getTranslator(), $category);
						
						$context = new ProductSearchContext($this->context);
						$query = new ProductSearchQuery();
						$query->setResultsPerPage((int)$limit + 1)->setPage($page);
						$query->setSortOrder(new SortOrder('product', $order_by, $order_way));
						$result = $searchProvider->runQuery($context, $query);
						$products = $result->getProducts();
						$products = $this->convertProductsSame($products, $id_product, $limit);
					}

				}
				
                break;
            case 'p_a':
				global $smarty;
				if(isset($smarty->tpl_vars['accessories']->value)){
					$products = $smarty->tpl_vars['accessories']->value;
				}
                break;
            default:
				$category = new Category((int)$product_type);
		
				$searchProvider = new CategoryProductSearchProvider($this->context->getTranslator(), $category);
				
				$context = new ProductSearchContext($this->context);
				$query = new ProductSearchQuery();
				$query->setResultsPerPage($limit)->setPage($page);
				$query->setSortOrder(new SortOrder('product', $order_by, $order_way));
				$result = $searchProvider->runQuery($context, $query);
				$products = $result->getProducts();		
                break;
        }
		
		if($product_type != 'p_s' && $product_type != 'p_a'){
			$products = $this->convertProducts($products);
		}
			
		return $products;
		
	}

	public function convertProductsSame($products, $id_product, $limit)	
	{		
		$assembler = new ProductAssembler($this->context);
		$presenterFactory = new ProductPresenterFactory($this->context);
		$presentationSettings = $presenterFactory->getPresentationSettings();
		$presenter = new ProductListingPresenter(
			new ImageRetriever(
				$this->context->link
			),
			$this->context->link,
			new PriceFormatter(),
			new ProductColorsRetriever(),
			$this->context->getTranslator()
		);
		$products_for_template = [];
		if(is_array($products)){
			foreach ($products as $rawProduct) {
				if ($rawProduct['id_product'] !== $id_product && count($products_for_template) < (int) $limit) {
					$product = $presenter->present(
						$presentationSettings,
						$assembler->assembleProduct($rawProduct),
						$this->context->language
					);
					$products_for_template[] = $product;
				}
			}
		}
		
		return 	$products_for_template;
	}
	
	public function convertProducts($products)	
	{		
		$assembler = new ProductAssembler($this->context);
		$presenterFactory = new ProductPresenterFactory($this->context);
		$presentationSettings = $presenterFactory->getPresentationSettings();
		$presenter = new ProductListingPresenter(
			new ImageRetriever(
				$this->context->link
			),
			$this->context->link,
			new PriceFormatter(),
			new ProductColorsRetriever(),
			$this->context->getTranslator()
		);
		$products_for_template = [];
		if(is_array($products)){
			foreach ($products as $rawProduct) {
				$product = $presenter->present(
					$presentationSettings,
					$assembler->assembleProduct($rawProduct),
					$this->context->language
				);
				$products_for_template[] = $product;				
			}
		}
		return 	$products_for_template;
	}
	
	public function generateCss($content, $pageId, $pageType, $idLang)
	{ 	
		
		$css = '' . PHP_EOL;
				
		$cssFile = _PS_MODULE_DIR_.$this->name.'/css/front/page_'.$pageType.'_'.$pageId.'_'.$idLang.'.css';
		
		$contents = json_decode($content, true);
		
		if($pageType == 'hook'){
			$prefix_ = '#content-'.$pageType.'-'.$pageId.'-';
		}else{
			$prefix_ = '#content-'.$pageType.'-';
		}
		
		if(!is_array($contents)){
			$contents = array();
		}
		
		foreach ($contents as $content) {
			$el = array();
			$owl = array();
			if(isset($content['row_s']))
			{
				$el = $content['row_s']['style'];
			}
			if(isset($content['content_s']))
			{
				$el = $content['content_s']['style'];
			}
			
			if(isset($content['content']['optionsOwl']))
			{
				$owl = $content['content']['optionsOwl'];
			}

			$css .= $prefix_.$content['elementId'].'{
				'.(isset($el['bgc']) && $el['bgc'] != ''?'background-color: '.$el['bgc'].';' : '').'
				'.(isset($el['bgi']) && $el['bgi'] != ''?$this->convertBgType($el['bgr']).';': '').'
			}';
			
			$css .= ' @media (max-width: 575px) {'. 
				$prefix_.$content['elementId'].'{
					'.(isset($el['xs']['padding']['top']) ? 'padding-top: '.$el['xs']['padding']['top'].'px;' : '').'
					'.(isset($el['xs']['padding']['right']) ? 'padding-right: '.$el['xs']['padding']['right'].'px;' : '').'
					'.(isset($el['xs']['padding']['bottom']) ? 'padding-bottom: '.$el['xs']['padding']['bottom'].'px;' : '').'
					'.(isset($el['xs']['padding']['left']) ? 'padding-left: '.$el['xs']['padding']['left'].'px;' : '').'
					'.(isset($el['xs']['margin']['top']) ? 'margin-top: '.$el['xs']['margin']['top'].'px;' : '').'
					'.(isset($el['xs']['margin']['right']) ? 'margin-right: '.$el['xs']['margin']['right'].'px;' : '').'
					'.(isset($el['xs']['margin']['bottom']) ? 'margin-bottom: '.$el['xs']['margin']['bottom'].'px;' : '').'
					'.(isset($el['xs']['margin']['left']) ? 'margin-left: '.$el['xs']['margin']['left'].'px;' : '').'
				}
			}';
			
			if(isset($owl['xs']['margin'])){
				if(!$owl['xs']['margin']){
					$owl['xs']['margin'] = 0;
				}
				$css .= ' @media (max-width: 575px) {'. 
					$prefix_.$content['elementId'].' .row-item {'.
						'margin-left: -'.($owl['xs']['margin']/2).'px;'.
						'margin-right: -'.($owl['xs']['margin']/2).'px;'.
					'}'.
					$prefix_.$content['elementId'].' .item {'.
						'padding-left: '.($owl['xs']['margin']/2).'px;'.
						'padding-right: '.($owl['xs']['margin']/2).'px;'.
					'}'.
					$prefix_.$content['elementId'].'.border-wrapper .wrapper-owl {'.
						'padding: '.($owl['xs']['margin']).'px;'.
					'}
				}';
			}
			
			$css .= ' @media (min-width: 576px) and (max-width: 767px) {'. 
				$prefix_.$content['elementId'].'{
					'.(isset($el['sm']['padding']['top']) ? 'padding-top: '.$el['sm']['padding']['top'].'px;' : '').'
					'.(isset($el['sm']['padding']['right']) ? 'padding-right: '.$el['sm']['padding']['right'].'px;' : '').'
					'.(isset($el['sm']['padding']['bottom']) ? 'padding-bottom: '.$el['sm']['padding']['bottom'].'px;' : '').'
					'.(isset($el['sm']['padding']['left']) ? 'padding-left: '.$el['sm']['padding']['left'].'px;' : '').'
					'.(isset($el['sm']['margin']['top']) ? 'margin-top: '.$el['sm']['margin']['top'].'px;' : '').'
					'.(isset($el['sm']['margin']['right']) ? 'margin-right: '.$el['sm']['margin']['right'].'px;' : '').'
					'.(isset($el['sm']['margin']['bottom']) ? 'margin-bottom: '.$el['sm']['margin']['bottom'].'px;' : '').'
					'.(isset($el['sm']['margin']['left']) ? 'margin-left: '.$el['sm']['margin']['left'].'px;' : '').'
				}
			}';
			
			if(isset($owl['sm']['margin'])){
				if(!$owl['sm']['margin']){
					$owl['sm']['margin'] = 0;
				}
				$css .= ' @media (min-width: 576px) and (max-width: 767px) {'. 
					$prefix_.$content['elementId'].' .row-item {'.
						'margin-left: -'.($owl['sm']['margin']/2).'px;'.
						'margin-right: -'.($owl['sm']['margin']/2).'px;'.
					'}'.
					$prefix_.$content['elementId'].' .item {'.
						'padding-left: '.($owl['sm']['margin']/2).'px;'.
						'padding-right: '.($owl['sm']['margin']/2).'px;'.
					'}'.
					$prefix_.$content['elementId'].'.border-wrapper .wrapper-owl {'.
						'padding: '.($owl['sm']['margin']).'px;'.
					'}
				}';
			}
			
			$css .= ' @media (min-width: 768px) and (max-width: 991px) {'. 
				$prefix_.$content['elementId'].'{
					'.(isset($el['md']['padding']['top']) ? 'padding-top: '.$el['md']['padding']['top'].'px;' : '').'
					'.(isset($el['md']['padding']['right']) ? 'padding-right: '.$el['md']['padding']['right'].'px;' : '').'
					'.(isset($el['md']['padding']['bottom']) ? 'padding-bottom: '.$el['md']['padding']['bottom'].'px;' : '').'
					'.(isset($el['md']['padding']['left']) ? 'padding-left: '.$el['md']['padding']['left'].'px;' : '').'
					'.(isset($el['md']['margin']['top']) ? 'margin-top: '.$el['md']['margin']['top'].'px;' : '').'
					'.(isset($el['md']['margin']['right']) ? 'margin-right: '.$el['md']['margin']['right'].'px;' : '').'
					'.(isset($el['md']['margin']['bottom']) ? 'margin-bottom: '.$el['md']['margin']['bottom'].'px;' : '').'
					'.(isset($el['md']['margin']['left']) ? 'margin-left: '.$el['md']['margin']['left'].'px;' : '').'
				}
			}';
			
			if(isset($owl['md']['margin'])){
				if(!$owl['md']['margin']){
					$owl['md']['margin'] = 0;
				}
				$css .= ' @media (min-width: 768px) and (max-width: 991px) {'. 
					$prefix_.$content['elementId'].' .row-item {'.
						'margin-left: -'.($owl['md']['margin']/2).'px;'.
						'margin-right: -'.($owl['md']['margin']/2).'px;'.
					'}'.
					$prefix_.$content['elementId'].' .item {'.
						'padding-left: '.($owl['md']['margin']/2).'px;'.
						'padding-right: '.($owl['md']['margin']/2).'px;'.
					'}'.
					$prefix_.$content['elementId'].'.border-wrapper .wrapper-owl {'.
						'padding: '.($owl['md']['margin']).'px;'.
					'}
				}';
			}
			
			$css .= ' @media (min-width: 992px) and (max-width: 1199px) {'. 
				$prefix_.$content['elementId'].'{
					'.(isset($el['lg']['padding']['top']) ? 'padding-top: '.$el['lg']['padding']['top'].'px;' : '').'
					'.(isset($el['lg']['padding']['right']) ? 'padding-right: '.$el['lg']['padding']['right'].'px;' : '').'
					'.(isset($el['lg']['padding']['bottom']) ? 'padding-bottom: '.$el['lg']['padding']['bottom'].'px;' : '').'
					'.(isset($el['lg']['padding']['left']) ? 'padding-left: '.$el['lg']['padding']['left'].'px;' : '').'
					'.(isset($el['lg']['margin']['top']) ? 'margin-top: '.$el['lg']['margin']['top'].'px;' : '').'
					'.(isset($el['lg']['margin']['right']) ? 'margin-right: '.$el['lg']['margin']['right'].'px;' : '').'
					'.(isset($el['lg']['margin']['bottom']) ? 'margin-bottom: '.$el['lg']['margin']['bottom'].'px;' : '').'
					'.(isset($el['lg']['margin']['left']) ? 'margin-left: '.$el['lg']['margin']['left'].'px;' : '').'
				}
			}';
			
			if(isset($owl['lg']['margin'])){
				if(!$owl['lg']['margin']){
					$owl['lg']['margin'] = 0;
				}
				$css .= ' @media (min-width: 992px) and (max-width: 1199px) {'. 
					$prefix_.$content['elementId'].' .row-item {'.
						'margin-left: -'.($owl['lg']['margin']/2).'px;'.
						'margin-right: -'.($owl['lg']['margin']/2).'px;'.
					'}'.
					$prefix_.$content['elementId'].' .item {'.
						'padding-left: '.($owl['lg']['margin']/2).'px;'.
						'padding-right: '.($owl['lg']['margin']/2).'px;'.
					'}'.
					$prefix_.$content['elementId'].'.border-wrapper .wrapper-owl {'.
						'padding: '.($owl['lg']['margin']).'px;'.
					'}
				}';
			}
			
			$css .= ' @media (min-width: 1200px) {'. 
				$prefix_.$content['elementId'].'{
					'.(isset($el['xl']['padding']['top']) ? 'padding-top: '.$el['xl']['padding']['top'].'px;' : '').'
					'.(isset($el['xl']['padding']['right']) ? 'padding-right: '.$el['xl']['padding']['right'].'px;' : '').'
					'.(isset($el['xl']['padding']['bottom']) ? 'padding-bottom: '.$el['xl']['padding']['bottom'].'px;' : '').'
					'.(isset($el['xl']['padding']['left']) ? 'padding-left: '.$el['xl']['padding']['left'].'px;' : '').'
					'.(isset($el['xl']['margin']['top']) ? 'margin-top: '.$el['xl']['margin']['top'].'px;' : '').'
					'.(isset($el['xl']['margin']['right']) ? 'margin-right: '.$el['xl']['margin']['right'].'px;' : '').'
					'.(isset($el['xl']['margin']['bottom']) ? 'margin-bottom: '.$el['xl']['margin']['bottom'].'px;' : '').'
					'.(isset($el['xl']['margin']['left']) ? 'margin-left: '.$el['xl']['margin']['left'].'px;' : '').'
				}}';
			
			if(isset($owl['xl']['margin'])){
				if(!$owl['xl']['margin']){
					$owl['xl']['margin'] = 0;
				}
				$css .= ' @media (min-width: 1200px) {'. 
					$prefix_.$content['elementId'].' .row-item {'.
						'margin-left: -'.($owl['xl']['margin']/2).'px;'.
						'margin-right: -'.($owl['xl']['margin']/2).'px;'.
					'}'.
					$prefix_.$content['elementId'].' .item {'.
						'padding-left: '.($owl['xl']['margin']/2).'px;'.
						'padding-right: '.($owl['xl']['margin']/2).'px;'.
					'}'.
					$prefix_.$content['elementId'].'.border-wrapper .wrapper-owl {'.
						'padding: '.($owl['xl']['margin']).'px;'.
					'}
				}';
			}
						
		}
		
		$css  = trim(preg_replace('/\s+/', ' ', $css));
		
		if($css){
			file_put_contents($cssFile, $css);
		}else{
			if(file_exists($cssFile)){
				unlink($cssFile);
			}
		} 
				
	}
	
	public function deleteCss($pageId, $pageType)
	{ 	
		$languages = Language::getLanguages(false);
		foreach ($languages as $lang) {
			$cssFile = _PS_MODULE_DIR_.$this->name.'/css/front/page_'.$pageType.'_'.$pageId.'_'.$lang['id_lang'].'.css';
			if(file_exists($cssFile)){
				unlink($cssFile);
			}
		}		
	}
	
	public function convertBgType($value) 
	{
		switch($value) {
			case 4 :
				$repeat_option = 'background-attachment: fixed; background-position: center; background-repeat: no-repeat; background-size: cover';
				break;
			case 3 :
				$repeat_option = 'background-repeat: repeat';
				break;
			case 2 :
				$repeat_option = 'background-repeat: repeat-x';
				break;
			case 1 :
				$repeat_option = 'background-repeat: repeat-y';
				break;
			default :
				$repeat_option = 'background-repeat: no-repeat';
		}
		return  $repeat_option;
	}
	
	public function _prepLinks($config)
	{
		$id_lang = (int)Context::getContext()->language->id;
		
		$elementWidget = array();	
		$id_link = $config['ids'];
				
		$view_type = (int)$config['view_type'];
		
		$link = new NrtLinkBlock((int)$id_link, $id_lang);
		
		$elementWidget['view_type'] = $view_type;
		$elementWidget['links'] = NrtLinkBlock::makeLinks($link->content);

		return $elementWidget;
	}
	
	public function _prepSocials($config)
	{
		$id_lang = (int)Context::getContext()->language->id;
		
		$elementWidget = array();	
		$id_social = $config['ids'];
				
		$view_type = (int)$config['view_type'];
		
		$social = new NrtSocialFollow((int)$id_social, $id_lang);
		
		$elementWidget['view_type'] = $view_type;
		$elementWidget['socials'] = NrtSocialFollow::makeLinks($social->content);

		return $elementWidget;
	}
		
    public function _prepOwlCustom($config)
	{
		$id_lang = (int)Context::getContext()->language->id;
		
		$elementWidget = array();	
		
		$elementWidget['custom_owl'] = $config['custom_owl'];
		$elementWidget['itemsOwl']['xs'] = $config['optionsOwl']['xs']['line'];
		$elementWidget['itemsOwl']['sm'] = $config['optionsOwl']['sm']['line'];
		$elementWidget['itemsOwl']['md'] = $config['optionsOwl']['md']['line'];
		$elementWidget['itemsOwl']['lg'] = $config['optionsOwl']['lg']['line'];
		$elementWidget['itemsOwl']['xl'] = $config['optionsOwl']['xl']['line'];
		$elementWidget['optionsOwl'] = json_encode($config['optionsOwl']);			
		
		return $elementWidget;
	}
	
    public function _prepSliders($config)
	{
		$id_lang = (int)Context::getContext()->language->id;
		
		$elementWidget = array();	
		$id_sliders = $config['ids'];
		
		if(!$id_sliders){
			$id_sliders = array();
		}	
		
		$view_type = (int)$config['view_type'];
		
		$sliders = array();
		
		foreach($id_sliders as $key => $id_slider) {
			$slider = new NrtSlider((int)$id_slider, $id_lang);
			$sliders[$key]['src'] = $slider->content['src'];
			$sliders[$key]['link'] = $slider->content['link'];
			$sliders[$key]['text'] = $slider->content['text'];
			$sliders[$key]['width'] = $slider->content['width'];
			$sliders[$key]['height'] = $slider->content['height'];
		}

		$elementWidget['view_type'] = $view_type;
		$elementWidget['sliders'] = $sliders;
		$elementWidget['itemsOwl']['xs'] = $config['optionsOwl']['xs']['line'];
		$elementWidget['itemsOwl']['sm'] = $config['optionsOwl']['sm']['line'];
		$elementWidget['itemsOwl']['md'] = $config['optionsOwl']['md']['line'];
		$elementWidget['itemsOwl']['lg'] = $config['optionsOwl']['lg']['line'];
		$elementWidget['itemsOwl']['xl'] = $config['optionsOwl']['xl']['line'];
		$elementWidget['optionsOwl'] = json_encode($config['optionsOwl']);			
		
		return $elementWidget;
	}
	
    public function _prepTestimonials($config)
	{
		$id_lang = (int)Context::getContext()->language->id;
		
		$elementWidget = array();	
		$id_testimonials = $config['ids'];
		
		if(!$id_testimonials){
			$id_testimonials = array();
		}	
		
		$view_type = (int)$config['view_type'];
		$per_column = (int)$config['per_column'];	
		
		$testimonials = array();
		
		foreach($id_testimonials as $key => $id_testimonial) {
			$testimonial = new NrtTestimonial((int)$id_testimonial, $id_lang);
			$testimonials[$key]['name_post'] = $testimonial->content['name_post'];
			$testimonials[$key]['email'] = $testimonial->content['email'];
			$testimonials[$key]['company'] = $testimonial->content['company'];
			$testimonials[$key]['address'] = $testimonial->content['address'];
			$testimonials[$key]['src'] = $testimonial->content['src'];
			$testimonials[$key]['text'] = $testimonial->content['text'];
		}
		
		$elementWidget['per_column'] = $per_column;
		$elementWidget['view_type'] = $view_type;
		$elementWidget['testimonials'] = $testimonials;
		$elementWidget['itemsOwl']['xs'] = $config['optionsOwl']['xs']['line'];
		$elementWidget['itemsOwl']['sm'] = $config['optionsOwl']['sm']['line'];
		$elementWidget['itemsOwl']['md'] = $config['optionsOwl']['md']['line'];
		$elementWidget['itemsOwl']['lg'] = $config['optionsOwl']['lg']['line'];
		$elementWidget['itemsOwl']['xl'] = $config['optionsOwl']['xl']['line'];
		$elementWidget['optionsOwl'] = json_encode($config['optionsOwl']);			
		
		return $elementWidget;
	}
	
    public function _prepInstagrams($config)
	{			
		$elementWidget = array();	
		
		$ins_user_id = $config['ins_user_id'];
		$ins_access_token = $config['ins_access_token'];
		
		$view_type = (int)$config['view_type'];
		$image_type = $config['image_type'];
		$limit = (int)$config['limit'];
		
		$per_column = (int)$config['per_column'];	

		$elementWidget['view_type'] = $view_type;
		$elementWidget['img_type'] = $image_type;
		$elementWidget['per_column'] = $per_column;
		$elementWidget['itemsOwl']['xs'] = $config['optionsOwl']['xs']['line'];
		$elementWidget['itemsOwl']['sm'] = $config['optionsOwl']['sm']['line'];
		$elementWidget['itemsOwl']['md'] = $config['optionsOwl']['md']['line'];
		$elementWidget['itemsOwl']['lg'] = $config['optionsOwl']['lg']['line'];
		$elementWidget['itemsOwl']['xl'] = $config['optionsOwl']['xl']['line'];
		$elementWidget['optionsOwl'] = json_encode($config['optionsOwl']);	
		
		$result = $this->fetchData($ins_user_id, $ins_access_token);		
			
		$elementWidget['instagrams'] = $this->getPics($result, $image_type, $limit);		
		
		return $elementWidget;
	}
	   
	# Gets Pics
    public function getPics($result, $image_type, $limit) {
		
		if(!$result || isset($result->meta->error_type) || !isset($result->data)){
			return array();
		}

        $conf = Configuration::getMultiple(array('NRT_INSTAGRAM_NBR_IMAGE','NRT_INSTAGRAM_IMAGE_FORMAT'));

        $instagram_pics = array();
		
		$items = array_slice($result->data, 0, $limit);
		
        foreach ($items as $item) {
			$image = array();
            $image_format = $image_type ? $image_type : 'standard_resolution';
            $image['url'] = $item->images->{$image_format}->url;
			$image['width'] = $item->images->{$image_format}->width;
			$image['height'] = $item->images->{$image_format}->height;
            $instagram_pics[] = array(
                'image' => $image,
                'original_image' => $item->images->standard_resolution->url,
                'caption' => isset($item->caption->text) ? $item->caption->text : '',
                'link' => $item->link,
                'likes' => $item->likes->count,
                'comments' => $item->comments->count,
                'date' => date($this->context->language->date_format_full, $item->created_time)
            );
        }
        return $instagram_pics;

    }
	# Gets our data
	public function fetchData($userid , $accessToken){
		$url = "https://api.instagram.com/v1/users/" .$userid. "/media/recent?access_token=" . $accessToken;
		$ch = curl_init($url); 
		curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 20); 
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); 
		$json = curl_exec($ch); 
		curl_close($ch);
		$result = json_decode($json);
		
		return $result;
	}

		/**
     * Get all available attribute groups.
     *
     * @param int $id_lang Language id
     *
     * @return array Attribute groups
     */
    public static function getAttributesGroups($id_lang, $id_product)
    {
        if (!Combination::isFeatureActive()) {
            return array();
        }
        $sql = 'SELECT ag.`id_attribute_group`, ag.`is_color_group`, agl.`name` AS group_name, agl.`public_name` AS public_group_name,
                    a.`id_attribute`, al.`name` AS attribute_name, a.`color` AS attribute_color, product_attribute_shop.`id_product_attribute`,
                    IFNULL(stock.quantity, 0) as quantity, product_attribute_shop.`price`, product_attribute_shop.`ecotax`, product_attribute_shop.`weight`,
                    product_attribute_shop.`default_on`, pa.`reference`, product_attribute_shop.`unit_price_impact`,
                    product_attribute_shop.`minimal_quantity`, product_attribute_shop.`available_date`, ag.`group_type`
                FROM `' . _DB_PREFIX_ . 'product_attribute` pa
                ' . Shop::addSqlAssociation('product_attribute', 'pa') . '
                ' . Product::sqlStock('pa', 'pa') . '
                LEFT JOIN `' . _DB_PREFIX_ . 'product_attribute_combination` pac ON (pac.`id_product_attribute` = pa.`id_product_attribute`)
                LEFT JOIN `' . _DB_PREFIX_ . 'attribute` a ON (a.`id_attribute` = pac.`id_attribute`)
                LEFT JOIN `' . _DB_PREFIX_ . 'attribute_group` ag ON (ag.`id_attribute_group` = a.`id_attribute_group`)
                LEFT JOIN `' . _DB_PREFIX_ . 'attribute_lang` al ON (a.`id_attribute` = al.`id_attribute`)
                LEFT JOIN `' . _DB_PREFIX_ . 'attribute_group_lang` agl ON (ag.`id_attribute_group` = agl.`id_attribute_group`)
                ' . Shop::addSqlAssociation('attribute', 'a') . '
                WHERE pa.`id_product` = ' . (int) $id_product. '
                    AND al.`id_lang` = ' . (int) $id_lang . '
                    AND agl.`id_lang` = ' . (int) $id_lang . '
                GROUP BY id_attribute_group, id_product_attribute
				ORDER BY ag.`position` ASC, a.`position` ASC, agl.`name` ASC';
		
		$data = Db::getInstance()->executeS($sql);
		$attributes = [];

		foreach ($data as $key => $attribute) {
			// Common attributes features
			$attributes[$attribute['id_attribute_group']]['group_name'] = $attribute['group_name'];
			$attributes[$attribute['id_attribute_group']]['name'] = $attribute['public_group_name'];
			$attributes[$attribute['id_attribute_group']]['group_type'] = $attribute['group_type'];	

			// Particular attributes features
			$attributes[$attribute['id_attribute_group']]['attributes'][$attribute['id_attribute']]['name'] = $attribute['attribute_name'];
			$attributes[$attribute['id_attribute_group']]['attributes'][$attribute['id_attribute']]['html_color_code'] = $attribute['attribute_color'];
			$attributes[$attribute['id_attribute_group']]['attributes'][$attribute['id_attribute']]['texture'] = (@filemtime(_PS_COL_IMG_DIR_ . $attributes['id_attribute'] . '.jpg')) ? _THEME_COL_DIR_ . $attributes['id_attribute'] . '.jpg' : '';

			if ($attribute['default_on']) {
				$attributes[$attribute['id_attribute_group']]['default'] = (int) $attribute['id_attribute'];
				$attributes[$attribute['id_attribute_group']]['attributes'][$attribute['id_attribute']]['selected'] = 1;
			} else {
				$attributes[$attribute['id_attribute_group']]['attributes'][$attribute['id_attribute']]['selected'] = '';
			}

			$attributes[$attribute['id_attribute_group']]['attributes'][$attribute['id_attribute']]['reference'] = $attribute['reference'];
			$attributes[$attribute['id_attribute_group']]['attributes'][$attribute['id_attribute']]['price'] = round($attribute['price'], 2);
			$attributes[$attribute['id_attribute_group']]['attributes'][$attribute['id_attribute']]['id_product_attribute'] = $attribute['id_product_attribute'];

			$attributes[$attribute['id_attribute_group']]['attributes_quantity'][$attribute['id_attribute']] = $attribute['quantity'];

			// if (!in_array($attribute['id_product_image'], $attributes[$attribute['id_attribute_group']]['attributes'][$attribute['id_attribute']]['images'])) {
			// 	// Create indexation from number of existing images in array
			// 	$i = count($attributes[$attribute['id_attribute_group']]['attributes'][$attribute['id_attribute']]['images']);
			// 	$attributes[$attribute['id_attribute_group']]['attributes'][$attribute['id_attribute']]['images'][$i++] = $attribute['id_product_image'];
			// }
		}

		return $attributes;
	}
	
}

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
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/

class NrtPageHook extends ObjectModel
{
    public $id_nrt_page_hook;
    public $hook_name;
	// Lang fields
    public $content;

    /**
     * @see ObjectModel::$definition
     */
    public static $definition = array(
        'table' => 'nrt_page_hook',
        'primary' => 'id_nrt_page_hook',
        'multilang' => true,
        'fields' => array(
            'hook_name' =>    array('type' => self::TYPE_STRING, 'required' => true),
            'content' =>    array('type' => self::TYPE_HTML,  'lang' => true, 'validate' => 'isJson'),
        ),
    );
	
    public function __construct($id = null, $id_lang = null, $id_shop = null)
    {		
        parent::__construct($id, $id_lang, $id_shop);

        Shop::addTableAssociation('nrt_page_hook', array('type' => 'shop'));
    }	
		
    public static function getIdByHookName($hookName)
    {		
        $sql = 'SELECT bc.`id_nrt_page_hook`
		        FROM `'._DB_PREFIX_.'nrt_page_hook` bc
				LEFT JOIN `'._DB_PREFIX_.'nrt_page_hook_shop` bcs
					ON (bc.`id_nrt_page_hook` = bcs.`id_nrt_page_hook`)
				WHERE bcs.`id_shop` = '.(int)Context::getContext()->shop->id.'
		        AND bc.`hook_name` = \''.$hookName.'\'';
		$return = Db::getInstance()->getValue($sql);
		
        return $return;
    }
	
    public static function getAll()
    {		
        $sql = 'SELECT bc.`id_nrt_page_hook`
		        FROM `'._DB_PREFIX_.'nrt_page_hook` bc
				LEFT JOIN `'._DB_PREFIX_.'nrt_page_hook_shop` bcs
					ON (bc.`id_nrt_page_hook` = bcs.`id_nrt_page_hook`)
				WHERE bcs.`id_shop` = '.(int)Context::getContext()->shop->id;
		$return = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql);

        return $return;
    }
	
}

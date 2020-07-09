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

class NrtPageProduct extends ObjectModel
{
    public $id_nrt_page_product;
    public $id_product;
	// Lang fields
    public $content;

    /**
     * @see ObjectModel::$definition
     */
    public static $definition = array(
        'table' => 'nrt_page_product',
        'primary' => 'id_nrt_page_product',
        'multilang' => true,
        'fields' => array(
            'id_product' =>	   array('type' => self::TYPE_INT, 'validate' => 'isUnsignedInt', 'required' => true),
            'content' =>    array('type' => self::TYPE_HTML,  'lang' => true, 'validate' => 'isJson'),
        ),
    );
	
    public static function getIdByProduct($idProduct)
    {
        if (!Validate::isUnsignedInt($idProduct)) {
            return;
        }

        $sql = 'SELECT id_nrt_page_product FROM ' . _DB_PREFIX_ . 'nrt_page_product WHERE id_product = ' . (int) $idProduct;
        $return = Db::getInstance()->getValue($sql);

        return $return;

    }
	
    public static function deleteElement($idProduct){
        if (!Validate::isUnsignedInt($idProduct)) {
            return;
        }
        $id = self::getIdByProduct($idProduct);

        if ($id) {
            Db::getInstance()->delete('nrt_page_product', 'id_nrt_page_product = '.(int)$id);
            Db::getInstance()->delete('nrt_page_product_lang', 'id_nrt_page_product = '.(int)$id);
        }
    }
	
}

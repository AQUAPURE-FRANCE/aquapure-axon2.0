<?php
/**
 * Multi Accessories Pro
 *
 * @author    PrestaMonster
 * @copyright PrestaMonster
 * @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 */

use PrestaShopBundle\Controller\Admin\ProductController;

if (!defined('_PS_VERSION_')) {
    exit;
}

require_once dirname(__FILE__) . '/abstract/hsmultiaccessoriesabstract.php';
require_once dirname(__FILE__) . '/classes/HsAccessoriesGroupProduct.php';
require_once dirname(__FILE__) . '/classes/HsMaProductSetting.php';

class HsMultiAccessoriesPro extends HsMultiAccessoriesAbstract
{

    /**
     * construct method.
     */
    public function __construct()
    {
        $this->name = 'hsmultiaccessoriespro';
        $this->version = '4.2.0';
        $this->tab = 'front_office_features';
        $this->displayName = $this->l('Multi Accessories Pro');
        $this->class_controller_admin_group = 'AdminHsMultiAccessoriesGroupPro';
        $this->class_controller_admin_welcome_page = 'AdminHsMultiAccessoriesWelcomePagePro';
        $this->class_controller_accessory_search = 'AdminHsMultiAccessoriesSearchPro';
        $this->class_controller_admin_product_setting = 'AdminHsMultiAccessoriesProductSetting';
        $this->module_key = '32491cc370c598602cd7d07bdf4bdf14';
        $this->author_address = '0x741A23f5969c86d9118808f1eAC29D40B37562F1';
        $this->author = 'PrestaMonster';
        parent::__construct();
        $this->description = $this->l('Manage accessories of a product in groups and offer ability to check out the main product and its accessories in 1 click.');
        $this->confirmUninstall = sprintf($this->l('Do you want to uninstall %s?'), $this->displayName);
        $this->tab_admin_welcome_page = array('AdminHsMultiAccessoriesWelcomePagePro' => $this->l('Welcome page'));
        $this->tabs27 = array(
            array($this->class_controller_accessory_search => $this->l('Accessory search')),
            array($this->class_controller_admin_product_setting => $this->l('Product Setting')),
        );
    }

    /**
     * Install module.
     *
     * @return bool
     */
    public function install()
    {
        require_once dirname(__FILE__) . '/classes/HsMultiAccessoriesInstaller.php';
        $this->installer = new HsMultiAccessoriesInstaller($this->name, $this->class_controller_admin_group, $this->l('Multi Accessories'));

        return parent::install();
    }

    /**
     * Uninstall module.
     *
     * @return bool
     */
    public function uninstall()
    {
        require_once dirname(__FILE__) . '/classes/HsMultiAccessoriesInstaller.php';
        $this->uninstaller = new HsMultiAccessoriesInstaller($this->name, $this->class_controller_admin_group, $this->displayName);

        return parent::uninstall();
    }

    /**
     * Dedicated callback to upgrading process.
     *
     * @param type $version
     *
     * @return bool
     */
    public function upgrade($version)
    {
        require_once dirname(__FILE__) . '/classes/HsMultiAccessoriesInstaller.php';
        $this->installer = new HsMultiAccessoriesInstaller($this->name, $this->class_controller_admin_product_setting, $this->class_controller_admin_group, $this->displayName);

        return parent::upgrade($version);
    }

    public function hookActionAdminControllerSetMedia()
    {
        if (!($this->context->controller instanceof AdminProductsController) && !($this->context->controller instanceof AdminHsMultiAccessoriesWelcomePageProController) && !($this->context->controller instanceof AdminHsMultiAccessoriesGroupProController)) {
            return;
        }
        return parent::hookActionAdminControllerSetMedia();
    }

    public static function renderAccessoriesBlock($id_products, $is_product_page = true)
    {
        //return dump((new HsMultiAccessoriesPro())->renderBlockAccessories($id_products, $is_product_page));
    }

    /**
     * Register neccessary hooks.
     *
     * @return bool
     */
    protected function registerHooks()
    {
        $success = array();
        // display at Back office
        $success[] = $this->registerHook('displayAdminListBefore');
        $success[] = $this->registerHook('displayAdminProductsExtra');

        // action at Back office
        if ($this->isPrestashop15()) {
            $success[] = $this->registerHook('actionAdminControllerSetMedia'); // Most likely for loading static files
        } else {
            $success[] = $this->registerHook('actionAdminProductsFormModifier'); // Most likely for loading static files
        }
        $success[] = $this->registerHook('actionProductDelete');
        $success[] = $this->registerHook('actionProductAdd');
        $success[] = $this->registerHook('actionProductUpdate');

        // display at Front office
        $success[] = $this->registerHook('displayHeader');
        $success[] = $this->registerHook('displayFooter');

        if ($this->isPrestashop17()) {
            $success[] = $this->registerHook('displayReassurance');
            $success[] = $this->registerHook('displayNavFullWidth');
            if ($this->isPrestashop1711()) {
                $success[] = $this->registerHook('actionObjectProductInCartDeleteAfter');
            } else {
                $success[] = $this->registerHook('actionDeleteProductInCartAfter');
            }
        } else {
            $success[] = $this->registerHook('displayRightColumnProduct');
            $success[] = $this->registerHook('actionAfterDeleteProductInCart');
            $success[] = $this->registerHook('displayTop');
        }
        $success[] = $this->registerHook('displayMultiAccessoriesProduct');
        $success[] = $this->registerHook('displayMultiAccessoriesProductHome');
        $success[] = $this->registerHook('displayShoppingCartFooter'); // this is unstable yet
        // action at Front office
        $success[] = $this->registerHook('actionCartSave');
        $success[] = $this->registerHook('actionObjectCartAddAfter');
        $success[] = $this->registerHook('actionObjectHsAccessoriesGroupAbstractDeleteAfter');
        $success[] = $this->registerHook('deleteProductAttribute');

        return array_sum($success) >= count($success);
    }

    /**
     * Check if Multi Accessories block is available in current page.
     *
     * @return bool
     */
    protected function isHookedInCurrentPage()
    {
        $id_groups = HsAccessoriesGroupAbstract::getIdGroups($this->context->language->id, true);

        if ($this->context->controller instanceof IndexControllerCore) {
            $id_product = $this->context->cookie->__get('id_product');

            if (empty($id_groups) || empty($id_product) || !HsAccessoriesGroupAbstract::haveAccessories(array($id_product), (int) $this->context->language->id)) {
                return false;
            }
            return true;
        }

        if ($this->context->controller instanceof ProductController) {
            $id_product = Tools::getValue('id_product');
            if (empty($id_groups) || empty($id_product) || !HsAccessoriesGroupAbstract::haveAccessories(array($id_product), (int) $this->context->language->id)) {
                return false;
            }
            return true;
        }

        if ($this->context->controller instanceof OrderController || $this->context->controller instanceof OrderOpcController) {
            if ($this->isRegisteredInHook('displayShoppingCart') || $this->isRegisteredInHook('displayShoppingCartFooter')) {
                return true;
            }
        }
        return empty($id_groups) ? false : (bool) Configuration::get('HSMA_BUY_ACCESSORY_MAIN_TOGETHER');
    }

    protected function assignSmartyVariables()
    {
        if ($this->context->controller instanceof IndexControllerCore) {
            $id_product = $this->context->cookie->__get('id_product') ?? 0;
        } else {
            $id_product = $this->isProductPage() ? $this->context->controller->getProduct()->id : 0;
        }

        $link = new Link();
        $setting_buy_together = HsMaProductSetting::getBuyTogetherCurrentValue($id_product);

        $this->context->smarty->assign(array(
            'accessory_alert_message' => Configuration::get('HSMA_ALERT_MESSAGE', $this->context->language->id),
            'msg_accessory_is_out_of_stock' => $this->i18n['accessory_is_out_of_stock'],
            'msg_out_of_stock' => $this->i18n['out_of_stock'],
            'msg_available_later' => $this->i18n['out_of_stock_but_backordering_is_allowed'],
            'msg_empty_form' => $this->i18n['cannot_submit_a_empty_form'],
            'utilize_block_cart_ajax' => (int) $this->isEnableBlockCartAjax(),
            'order_url' => Configuration::get('PS_ORDER_PROCESS_TYPE') == 1 ? $link->getPageLink('order-opc') : $link->getPageLink('order'),
            'buy_main_accessory_together' => Tools::jsonEncode($setting_buy_together[$id_product]),
            'display_style' => Configuration::get('HSMA_DISPLAY_STYLE'),
            'is_show_icon_out_of_stock' => (int) Configuration::get('HSMA_SHOW_ICON_OUT_OF_STOCK'),
            'is_enabling_option_buy_to_gether' => (bool) Configuration::get('HSMA_BUY_ACCESSORY_MAIN_TOGETHER'),
            'ajaxRenderAccessories' => $link->getModuleLink($this->name, 'Accessories'),
            'hsma_format_currency' => $this->getFormatCurrency(),
            'hsma_price_display_precision' => $this->getDecimals(),
            'path_theme' => $this->isPrestashop17() ? '17/' : '',
        ));
    }

    public static function renderBuyTogether($id_product)
    {
        $setting_buy_together = HsMaProductSetting::getBuyTogetherCurrentValue($id_product);
        return json_encode($setting_buy_together[$id_product]);
    }
    /**
     * Render the main block of accessories based on id_products.
     *
     * @param array $id_products
     * @param boolean $is_product_page
     * @return string
     */
    protected function renderBlockAccessories($id_products, $is_product_page = true)
    {
        $id_groups = HsAccessoriesGroupAbstract::getIdGroups($this->context->language->id, true);
        $include_out_of_stock = Configuration::get('HSMA_SHOW_ACCESSORIES_OFS');
        $accessories_groups = HsAccessoriesGroupAbstract::getAccessoriesByGroups($id_groups, $id_products, true, $this->context->language->id, $include_out_of_stock, $is_product_page);
        $accessories_table_price = array();
        $currency_decimals = $this->getDecimals();
        $use_tax = $this->isUsetax();
        $random_main_product_id = $this->getRandomId();

        if ($this->context->controller instanceof IndexControllerCore) {
            $product = new Product($id_products[0], true, $this->context->language->id);
            $accessories_table_price[$random_main_product_id] = $this->formatProduct($product);
        } else {
            if ($is_product_page) {
                $product = $this->context->controller->getProduct();
                $accessories_table_price[$random_main_product_id] = $this->formatProduct($product);
            }
        }

        $id_products_buy_together = array();

        foreach ($accessories_groups as &$accessories_group) {
            foreach ($accessories_group as &$accessory) {
                $product = new Product((int) $accessory['id_accessory'], false, (int) $this->context->language->id);
                $random_product_accessories_id = $this->getRandomId();
                if (!Validate::isLoadedObject($product)) {
                    unset($accessory);
                    continue;
                }
                /* customization*/
                $accessory['customization'] = $product->customizable ? $product->getCustomizationFields($this->context->language->id) : false;
                $accessory['customizable'] = $product->customizable;
                $accessory = $this->getCustomizationData($accessory);
                /*End of customization*/
                if ($accessory['is_available_buy_together']) {
                    $id_products_buy_together[$accessory['id_accessory_group']] = $accessory['id_accessory'];
                }
                if ($is_product_page) {
                    $accessories_table_price[$random_product_accessories_id] = $this->formatAccessory($accessory);
                }
                //@todo: Fix the price different with group customer
                $default_id_product_attribute = (int) $accessory['id_product_attribute'];
                $price = HsMaProduct::getPriceStatic($accessory['id_accessory'], $use_tax, $default_id_product_attribute, $currency_decimals);
                $accessory['price'] = $price;
                $accessory['random_product_accessories_id'] = $random_product_accessories_id;
                $accessory['default_id_product_attribute'] = $default_id_product_attribute;
                if ($this->isPrestashop17()) {
                    $accessory['link'] = $this->context->link->getProductLink($product, $product->link_rewrite, $product->category, $product->ean13, (int) $this->context->language->id, (int) $this->context->shop->id, $product->cache_default_attribute);
                } else {
                    $accessory['link'] = $this->context->link->getProductLink($product);
                }
                $accessories_table_price[$random_product_accessories_id]['link'] = $accessory['link'];
                if (!empty($accessory['customization'])) {
                    $accessories_table_price[$random_product_accessories_id]['customizations'] = $accessory['customizations'];
                    $accessories_table_price[$random_product_accessories_id]['id_customization'] = $accessory['id_customization'];
                    $accessories_table_price[$random_product_accessories_id]['is_customizable'] = $accessory['is_customizable'];
                    $accessories_table_price[$random_product_accessories_id]['is_enough_customization'] = $accessory['is_enough_customization'];
                }
                $accessory['available_later'] = $this->getMessageAvailableLater($accessory['available_later']);
            }
        }

        $setting_buy_together = HsMaProductSetting::getBuyTogetherCurrentValue($id_products[0]);

        $this->context->smarty->assign(array(
            'accessory_configuration_keys' => Configuration::getMultiple(array_keys($this->configuration_keys)),
            'accessory_block_title' => Configuration::get('HSMA_TITLE', $this->context->language->id),
            'accessory_image_type' => Configuration::get('HSMA_IMAGE_TYPE'),
            'change_main_price' => Configuration::get('HSMA_CHANGE_MAIN_PRICE'),
            'image_size_fancybox' => Configuration::get('HSMA_IMAGE_SIZE_IN_FANCYBOX'),
            'show_table_price' => Configuration::get('HSMA_SHOW_PRICE_TABLE'),
            'show_combination' => Configuration::get('HSMA_SHOW_COMBINATION'),
            'sync_accessory_quantity' => (int) $this->getOptionAcessoryQuantitySetting(),
            'accessory_groups' => HsAccessoriesGroupAbstract::getGroups($this->context->language->id, true),
            'accessories_table_price' => Tools::jsonEncode($accessories_table_price),
            'js_translate_text' => Tools::jsonEncode($this->getJsTranslateText()),
            'random_main_product_id' => $random_main_product_id,
            'sub_total' => $this->i18n['sub_total'],
            'accessories_groups' => $accessories_groups,
            'static_token' => Tools::getToken(false),
            'is_enabling_cart_ajax' => (int) $this->isEnableBlockCartAjax(),
            'main_product_minimal_quantity' => $is_product_page ? $product->minimal_quantity : 1,
            'buy_main_accessory_together_group' => $setting_buy_together[$id_products[0]],
            'is_product_page' => $is_product_page,
            'isPrestashop17' => $this->isPrestashop17(),
            'id_products_buy_together' => $id_products_buy_together,
            'path_theme' => $this->isPrestashop17() ? '17/' : '',
        ));

        return $this->display($this->name . '.php', 'multi_accessories.tpl');
    }

    /**
     * Display accessories in groups within product page.
     *
     * @param null $params
     * @return string
     */
    public function hookDisplayRightColumnProduct($params = null)
    {
        if (!is_null($params)) {
            $id_product = $params['product']['id_product'];
        } else {
            $id_product = Tools::getValue('id_product', false);
        }

        if (!empty($id_product)) {
            if (HsAccessoriesGroupAbstract::haveAccessories(array($id_product), (int) $this->context->language->id)) {
                return $this->renderBlockAccessories(array($id_product), true);
            }
        }
    }

    /**
     * A custom hook so that we can place the Multi Accessories block anywhere on homepage's template <br/>
     * For example:<br/>
     * {hook h="displayMultiAccessoriesProductHome"}.
     *
     * @param $params
     * @return string
     * @throws Exception
     */
    public function hookDisplayMultiAccessoriesProductHome($params)
    {
        $this->context->cookie->__set('id_product', (int) $params['product']['id_product']);
        return $this->hookDisplayRightColumnProduct($params);
    }
}

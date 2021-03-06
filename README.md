# CUSTOM HSMULTI - IMPLEMENTATION
This module will allow you to extend hsmulti to Homepage

### Module hsmultiaccessoriespro
1. Place `hsmultiaccessoriespro` module into `project_root_dir/modules/`
2. Install it from `Modules|Module Catalog` in Prestashop backoffice

### Module nrtpagebuilder
1. Add following php scritp to `/modules/nrtpagebuilder/nrtpagebuilder.php`
```
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
```

### CUSTOM.JS
1. [Add script of custom.js](https://github.com/AQUAPURE-FRANCE/aquapure-axon2.0/blob/master/themes/dekora/assets/js/custom.js) to `/themes/dekora/assets/js/custom.js`
2. Eventually clean cache of browser

### THEMES
1. Choose a customizable product layout in `/themes/dekora/templates/catalog/_partials/miniatures/_partials/_product/` and add script of one of the default product layouts in `/themes/dekora/templates/catalog/_product`
2. Insert hook call ` {hook h='displayMultiAccessoriesProductHome' mod='hsmultiaccessoriespro' product=$product quickview=false}` where you want in choosen customizable product layout
3. Comment following scripts if in customizable product layout:
	* `{hook h='displayProductsLinkNav' product=$product category=$category}`
	* `<input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">`
	* `{block name='product_pack'}...{/block}`
	* `{hook h='displayProductAdditionalInfo' product=$product}`
	* `{hook h="displayRightColumnProduct"}`
	* `{block name='product_footer_container'}...{/block}`	
4. Update `{include file='catalog/_partials/product-variants.tpl'}` with `{include file='catalog/_partials/product-variants.tpl' groups=NrtPageBuilder::getAttributesGroups($language.id, $product.id_product)}`
5. Add `<input type="hidden" id="render-buy-together" value="{HsMultiAccessoriesPro::renderBuyTogether($product.id)}">` as a first child of `<form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh"></form>` 
6. Replace `/themes/dekora/templates/catalog/_partials/product-prices.tpl` with [custom product-prices.tpl](/themes/dekora/templates/catalog/_partials/product-prices.tpl)
7. Replace `/themes/dekora/templates/catalog/_partials/product-add-to-cart.tpl`with [custom product-add-to-cart.tpl](/themes/dekora/templates/catalog/_partials/product-add-to-cart.tpl)
8. Replace `/themes/dekora/templates/catalog/_partials/quickview.tpl` with [custom quickview.tpl](https://github.com/AQUAPURE-FRANCE/aquapure-axon2.0/blob/master/themes/dekora/templates/catalog/_partials/quickview.tpl)

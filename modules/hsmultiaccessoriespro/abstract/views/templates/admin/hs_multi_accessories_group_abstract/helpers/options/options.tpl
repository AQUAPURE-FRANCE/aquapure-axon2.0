{**
* Multi Accessories for PrestaShop.
*
* @author    PrestaMonster
* @copyright PrestaMonster
* @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*}

{extends file="helpers/options/options.tpl"}

{block name="field"}
    {if $field['type'] == 'hsma_copy_accessories'}
        {if $groups}
            <script type="text/javascript">
                var productSettingBuyTogetherRequired = parseInt({HsMaProductSettingAbstract::BUY_TOGETHER_REQUIRED|escape:'htmlall':'UTF-8'});
                var stHsMultiAccessories ={$st_hsmultiaccessories|escape:'quotes':'UTF-8'};
                var productBuyToGether = parseInt({$buy_together_default|escape:'htmlall':'UTF-8'});
                isPrestashop17 = parseInt({$is_ps17|intval});
                var isProductPage = parseInt({$is_product_page|intval});
                $(document).ready(function () {
                    $("#expand-all-is_category_filter_accessory").trigger("click");
                    $("#expand-all-is_category_filter_product").trigger("click");
                    new HsmaFilterByCategory({
                        ajaxUrls: stHsMultiAccessories.url,
                        lang: stHsMultiAccessories.lang
                    }).init();
                    new AdminSettingMultiAccessories({
                        ajaxUrls: stHsMultiAccessories.url,
                        lang: stHsMultiAccessories.lang
                    }).init();

                    window.adminMultiAccessories = new AdminMultiAccessories(
                            {
                                completeSearch: '.hsma_accessory_group .autocomplete_group',
                                name: '.name',
                                editName: '.edit_name',
                                saveName: '.save_name',
                                blockEditName: '.edit_name, .save_name',
                                combinations: '.accessory_group_product .dropdown_combination',
                                defaultQuantity: 'input[name="default_quantity"]',
                                iconChangeDefaultQuantity: '.default_quantity a',
                                minimumQuantity: '.hsma_accessory_group input[name="minimum_quantity"]',
                                iconChangeMinimumQuantity: '.minimum_quantity a',
                                buyToGetherRequired: '.hsma_accessory_group .buy_together_required',
                                delete: '.accessory_group_product .delete',
                                iconShowBlockGroup: '#hsma-accessories h4',
                                columnRequiredBuyTogether: '.table .buy_together_required',
                                hide: 'hide',
                                show: 'show',
                                accessoryName: 'name',
                                iconExpand: 'icon-expand-alt',
                                iconCollapse: 'icon-collapse-alt',
                                contentGroup: 'content_group',
                                expand: 'expand',
                                hasAccessory: '.has_accessory',
                                accessoryGroup: '.group',
                                idAccessories: 'id_accessories_',
                                idOfBlockAccessories: 'div_accessories_',
                                tableRows: '.table tbody',
                                image: '.image',
                                xxItemsInside: '.xx-items-inside'
                            },
                            {
                                ajaxUrls: stHsMultiAccessories.url,
                                messageError: stHsMultiAccessories.lang.error,
                                msgOutOfStock: stHsMultiAccessories.lang.accessory_is_out_of_stock,
                                msgAvailableQuantity: stHsMultiAccessories.lang.min_quantity_must_be_less_than_available_quantity,
                                msgDefaultQuantity: stHsMultiAccessories.lang.default_quantity_should_be_greater_than_or_equal_to_minimum_quantity,
                                productSettingBuyTogetherRequired: productSettingBuyTogetherRequired,
                                confirmTitle: stHsMultiAccessories.lang.copy_accessories,
                                confirmMessage: stHsMultiAccessories.lang.you_are_about_to_copy_accessories_from_another_product_to_this_product,
                                confirmTitleAddDiscount: stHsMultiAccessories.lang.add_a_discount,
                                confirmMessageAddDiscount: stHsMultiAccessories.lang.you_are_about_to_add_a_discount_for_the_product_and_accessory,
                                yes: stHsMultiAccessories.lang.yes,
                                no: stHsMultiAccessories.lang.no,
                                cancel: stHsMultiAccessories.lang.cancel,
                                msgNoInternet: stHsMultiAccessories.lang.there_was_a_connecting_problem,
                                msgPageNotFound: stHsMultiAccessories.lang.requested_page_not_found,
                                msgInternalServerError: stHsMultiAccessories.lang.internal_server_error,
                                msgRequestTimeOut: stHsMultiAccessories.lang.request_time_out,
                                msgAjaxRequestIsAborted: stHsMultiAccessories.lang.ajax_request_is_aborted,
                            });
                    adminMultiAccessories.init();
                });
            </script>
            <div class="form-group">
                <div class="form-group">
                    <div class="col-lg-3"><span class="pull-right"></span></div>
                    <label class="control-label col-lg-2">
                        {$hs_i18n.select_an_accessory_group|escape:'htmlall':'UTF-8'}
                    </label>
                    <div class="col-lg-3">
                        <select name="hsma_copy_id_group" id="hsma_copy_id_group">
                            {foreach from=$groups item=group}
                                <option value="{$group.id_accessory_group|intval}">{$group.name|escape:'htmlall':'UTF-8'}</option>
                            {/foreach}
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-3"><span class="pull-right"></span></div>
                    <label class="control-label col-lg-2"></label>
                    <div class="col-lg-6">
                        <button type="button" class="btn btn-default copy_default_accessories">
                            {$hs_i18n.copy_default_accessories|escape:'htmlall':'UTF-8'}
                        </button>
                        <button type="button" class="btn btn-default delete_old_accessories">
                            {$hs_i18n.delete_old_accessories|escape:'htmlall':'UTF-8'}
                        </button>
                    </div>
                </div>
            </div>
            <div class="alert alert-info">
                <span>{$hs_i18n.copy_related_products_or_accessories_of_PS_15_16_to_this_module|escape:'htmlall':'UTF-8'}</span><br>
                <span>{$hs_i18n.delete_all_the_added_accessories_of_module|escape:'htmlall':'UTF-8'}</span>
            </div>
        {else}
            <div class="form-group">
                <div class="col-lg-12">
                    {$hs_i18n.there_is_not_any_accessory_group}
                </div>
            </div>
        {/if}
    {/if}
    {if $field['type'] == 'hsma_add_accessores'}
        {if $groups}
            <div class="form-group">
                <div class="alert_warning_hsma alert alert-warning hide"></div>
                <div class="col-xs-6 hsma_block_list">
                    <h4>{$hs_i18n.product_categories|escape:'htmlall':'UTF-8'}</h4>
                    <div id="container_category_tree_products">
                        {if $is_prestashop16}
                            {$category_tree_product}{* HTML *}
                        {else}
                            <div class="tree-panel-label-title">
                                <input type="checkbox"  name="filter-by-category-product" id="filter-by-category-product">
                                {$hs_i18n.filter_by_category|escape:'htmlall':'UTF-8'}
                            </div>
                            <div id="block_category_tree_product" style="display:none">
                                {$category_tree_product}{* HTML *}
                            </div>
                        {/if}
                    </div>
                </div>
                <div class="col-xs-6 hsma_block_list">
                    <h4>{$hs_i18n.accessory_categories|escape:'htmlall':'UTF-8'}</h4>
                    <div id="container_category_tree_accessories">
                        {if $is_prestashop16}
                            {$category_tree_accessory}{* HTML *}
                        {else}
                            <div class="tree-panel-label-title">
                                <input type="checkbox"  name="filter-by-category_accessory" id="filter-by-category-accessory">
                                {$hs_i18n.filter_by_category|escape:'htmlall':'UTF-8'}
                            </div>
                            <div id="block_category_tree-accessory" style="display:none">
                                {$category_tree_accessory}{* HTML *}
                            </div>
                        {/if}
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-3"><span class="pull-right"></span></div>
                <label class="control-label col-lg-2">
                    {$hs_i18n.select_an_accessory_group|escape:'htmlall':'UTF-8'}
                </label>
                <div class="col-lg-3">
                    <select name="hsma_id_group" id="hsma_id_group">
                        {foreach from=$groups item=group}
                            <option value="{$group.id_accessory_group|intval}">{$group.name|escape:'htmlall':'UTF-8'}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-3"><span class="pull-right"></span></div>
                <label class="control-label col-lg-2"></label>
                <div class="col-lg-3">
                    <button type="button" class="btn btn-default get_products_accessories">
                        {$hs_i18n.get_products_accessories|escape:'htmlall':'UTF-8'}
                    </button>
                </div>
            </div>
            <div class="form-group display_products_accessories"></div>
        {else}
            <div class="form-group">
                <div class="col-lg-12">
                    {$hs_i18n.there_is_not_any_accessory_group}
                </div>
            </div>
        {/if}
        <hr>
        <div class="col-lg-12">
            <div id="hs_module_admin_footer" class="text-center text-muted mt-3">
                <ol>
                    <li>
                        {$hs_i18n['created_by']|escape:'htmlall':'UTF-8'} <strong>{$field['module_author']|escape:'htmlall':'UTF-8'}</strong>
                    </li>
                    <li>
                        © {$field['module_year']|escape:'htmlall':'UTF-8'}
                    </li>
                    <li>
                        {$hs_i18n['current_version']|escape:'htmlall':'UTF-8'} <strong>{$field['module_version']|escape:'htmlall':'UTF-8'}</strong>
                    </li>
                    <li>
                        <a href="{$field['document_url']|escape:'htmlall':'UTF-8'}" target="_blank">
                            <i class="icon-book"></i> {$hs_i18n['documentation']|escape:'htmlall':'UTF-8'}
                        </a>
                    </li>
                    <li>
                        <a href="https://addons.prestashop.com/en/ratings.php" target="_blank" class="hs-rate-module">
                            <i class="icon-star"></i> {$hs_i18n['rate_us']|escape:'htmlall':'UTF-8'}
                        </a>
                    </li>
                    <li>
                        <a href="https://addons.prestashop.com/en/contact-us?id_product=23426" target="_blank">
                            <i class="icon-question-circle"></i> {$hs_i18n['need_help']|escape:'htmlall':'UTF-8'}
                        </a>
                    </li>
                    <li>
                        <a href="https://addons.prestashop.com/en/2_community-developer?contributor=613198" target="_blank">
                            <i class="icon-puzzle-piece"></i>{$hs_i18n['all_modules']|escape:'htmlall':'UTF-8'} {$field['module_author']|escape:'htmlall':'UTF-8'}
                        </a>
                    </li>
                </ol>
            </div>
        </div>
    {else}    
        {$smarty.block.parent}
    {/if}
{/block}
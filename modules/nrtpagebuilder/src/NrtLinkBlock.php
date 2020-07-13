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

class NrtLinkBlock extends ObjectModel
{
    public $id_nrt_link_block;
    public $name;
	public $position;
	// Lang fields
    public $content;

    /**
     * @see ObjectModel::$definition
     */
    public static $definition = array(
        'table' => 'nrt_link_block',
        'primary' => 'id_nrt_link_block',
        'multilang' => true,
        'fields' => array(
            'name' =>    array('type' => self::TYPE_STRING),
            'content' =>    array('type' => self::TYPE_HTML,  'lang' => true, 'validate' => 'isJson'),
			'position' =>   array('type' => self::TYPE_INT, 'validate' => 'isUnsignedInt', 'required' => true),
        ),
    );
	
    public function __construct($id = null, $id_lang = null)
    {		
        parent::__construct($id, $id_lang);

        if ($this->id) {
			if(is_array($this->content)){
				$arrays = array();
				foreach ($this->content as $key_lang => $langs) {
					$pages = json_decode($langs, true);
					if(!$pages){
						$pages = array();
					}
					foreach ($pages as $key => $page) {
						if ($page['type'] == 'custom') {
							$arrays[$key]['type'] = $page['type'];
							$arrays[$key]['title'][$key_lang] = $page['title'];
							$arrays[$key]['url'][$key_lang] = $page['url'];
						}else{
							$arrays[$key] = $page;	
						}
					}
				}
				$this->content = $arrays;
			}else{
				$this->content = json_decode($this->content, true);
				if(!$this->content){
					$this->content = array();
				}
			}
        }
		
		if (is_null($this->content)) {
            $this->content = array();
        }	
    }
	
    public function delete()
    {
        $response = parent::delete();
		
        $this->reorderStatic();

        return $response;
    }
	
    public function add($auto_date = true, $null_values = false)
    {	
		$this->position = (int) $this->getMaxPosition() + 1;

        $return = parent::add($auto_date, $null_values);
		
        return $return;
    }

    public function update($auto_date = true, $null_values = false)
    {
        $return = parent::update($auto_date, $null_values);
		
		$this->reorderStatic();
				
        return $return;
    }
	
	/*-------------------------------------------------------------*/
    /*  GET MAX POSITION
    /*-------------------------------------------------------------*/
    public function getMaxPosition()
    {
        $response = Db::getInstance()->getRow('
            SELECT MAX(position)
			FROM `'._DB_PREFIX_.'nrt_link_block`'
        );

        if ($response['MAX(position)'] == null){
            return -1;
        }
		
        return $response['MAX(position)'];

    }
    /*-------------------------------------------------------------*/
    /*  UPDATE POSITION
    /*-------------------------------------------------------------*/
    public function updatePosition($way, $position)
    {
        if (!$values = Db::getInstance()->executeS('
			SELECT bc.`id_nrt_link_block`, bc.`position`
			FROM `'._DB_PREFIX_.'nrt_link_block` bc
			ORDER BY bc.`position` ASC'
        ))
            return false;

        foreach ($values as $value){
            if ((int)$value['id_nrt_link_block'] == (int)$this->id){
                $moved_menu = $value;
			}
		}

        if (!isset($moved_menu) || !isset($position))
            return false;

        return (Db::getInstance()->execute('
					UPDATE `'._DB_PREFIX_.'nrt_link_block` bc
					SET bc.`position`= `position` '.($way ? '- 1' : '+ 1').'
					WHERE bc.`position`
					'.($way
							   ? '> '.(int)$moved_menu['position'].' AND bc.`position` <= '.(int)$position
							   : '< '.(int)$moved_menu['position'].' AND bc.`position` >= '.(int)$position
					)					  
				)
            	&& Db::getInstance()->execute('
					UPDATE `'._DB_PREFIX_.'nrt_link_block` bc
					SET bc.`position` = '.(int)$position.'
					WHERE bc.`id_nrt_link_block` = '.(int)$moved_menu['id_nrt_link_block']
				)
			);
    }
	
    /*-------------------------------------------------------------*/
    /*  REORDER AFTER DELETION
    /*-------------------------------------------------------------*/
    public static function reorderStatic()
    {
        $return = true;
		
        $sql = 'SELECT bc.`id_nrt_link_block`
		        FROM `'._DB_PREFIX_.'nrt_link_block` bc
		        ORDER BY `position` ASC';

        $result = Db::getInstance()->executeS($sql);

		$i = 0;
		foreach ($result as $value) {
			$return = Db::getInstance()->execute('
			UPDATE `'._DB_PREFIX_.'nrt_link_block`
			SET `position` = '.(int)$i++.'
			WHERE `id_nrt_link_block` = '.(int)$value['id_nrt_link_block']);
		}

        return $return;
    }
	
    public static function getAll()
    {
        $sql = 'SELECT * FROM ' . _DB_PREFIX_ . 'nrt_link_block ORDER BY `position` ASC';
		$return = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql);
		
		$arrays = array();
        foreach ($return as $p) {
            $arrays[] = array(
                'id' => $p['id_nrt_link_block'],
                'name' => $p['name']
            );
        }
        return $arrays;
    }
	
	/*-------------------------------------------------------------*/
	
    public static function makeLinks($content)
    {
        foreach ($content as $key => $page) {
			if ($page['type'] == 'cms_category') {
                $content[$key]['data'] = NrtLinkBlock::makeCmsCategoryLink($page['id']);
            }
			if ($page['type'] == 'cms') {
                $content[$key]['data'] = NrtLinkBlock::makeCmsPageLink($page['id']);
            }
            if ($page['type'] == 'product') {
                $content[$key]['data'] = NrtLinkBlock::makeProductLink($page['id']);
            }
            if ($page['type'] == 'static') {
                $content[$key]['data'] = NrtLinkBlock::makeStaticLink($page['id']);
            }
            if ($page['type'] == 'custom') {
                $content[$key]['data'] = NrtLinkBlock::makeCustomLink($page);
            }
        }
        return $content;
    }
	
    public static function makeCmsCategoryLink($cmsId)
    {
		$id_lang = (int) Context::getContext()->language->id;
		
        $cmsLink = array();
        $cms = new CMSCategory((int)$cmsId);
        if (null !== $cms->id) {
            $cmsLink = array(
                'title' => $cms->name[$id_lang],
                'description' => $cms->meta_description[$id_lang],
                'url' => Context::getContext()->link->getCMSCategoryLink($cms),
                );
        }
        return $cmsLink;
    }
	
    public static function makeCmsPageLink($cmsId)
    {
		$id_lang = (int) Context::getContext()->language->id;
		
        $cmsLink = array();
        $cms = new CMS((int)$cmsId);
        if (null !== $cms->id) {
            $cmsLink = array(
                'title' => $cms->meta_title[$id_lang],
                'description' => $cms->meta_description[$id_lang],
                'url' => Context::getContext()->link->getCMSLink($cms),
                );
        }
        return $cmsLink;
    }
	
    public static function makeProductLink($staticId)
    {
		$id_lang = (int) Context::getContext()->language->id;
		
        $staticLink = array();

        $meta = Meta::getMetaByPage($staticId, $id_lang);
        $staticLink = array(
            'title' => $meta['title'],
            'description' => $meta['description'],
            'url' => Context::getContext()->link->getPageLink($staticId, true),
            );

        return $staticLink;
    }
	
    public static function makeStaticLink($staticId)
    {
		$id_lang = (int) Context::getContext()->language->id;
		
        $staticLink = array();
		if($staticId == 'cart'){
		
			$meta = Meta::getMetaByPage($staticId, $id_lang);
			$staticLink = array(
				'id' => $staticId,
				'title' => $meta['title'],
				'description' => $meta['description'],
				'url' => Context::getContext()->link->getPageLink(
						'cart',
						null,
						$id_lang,
						array(
							'action' => 'show'
						),
						false,
						null,
						true
					)
				);			
			
		}else{
			
			$meta = Meta::getMetaByPage($staticId, $id_lang);
			$staticLink = array(
				'id' => $staticId,
				'title' => $meta['title'],
				'description' => $meta['description'],
				'url' => Context::getContext()->link->getPageLink($staticId, true),
				);
			
		}

        return $staticLink;
    }

    public static function makeCustomLink($page)
    {
        $cmsLink = array(
                'title' => isset($page['title'])?$page['title']:'',
				'description' => '',
                'url' => isset($page['url'])?$page['url']:'',
        );
        
        return $cmsLink;
    }
	
}

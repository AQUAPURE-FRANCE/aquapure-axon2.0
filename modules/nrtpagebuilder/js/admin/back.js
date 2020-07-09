
$(document).ready(function(){
			
	$(document).on('click','.action_click',function(e) {
		$(".content_click").hide();
		$(this).siblings('.content_click').toggle();
		e.stopPropagation();
	});

	$(document).on('click','body',function(e) {
		 $(".content_click").hide();
	});

	$(document).on('click','.content_click select', function(e){
		e.stopPropagation();
	});	
	
	//fix for tinymce source code edit
	$(document).on('focusin', function(e) {
		if ($(e.target).closest(".mce-window").length) {
			e.stopImmediatePropagation();
		}
	});

	/**
	* Grid editors
	* type = 1 = row
	* type = 2 = column
	* type = 3 = tab
	* type = 4 = tabs
	*/

	//first rows sortable init
	$( '.first-rows-wrapper' ).sortable({
		items: ".first_rows",
		placeholder: "row-placeholder",
		handle: ".dragger-handle",
		start: function(e, ui){
			ui.placeholder.height(ui.item.outerHeight());
		}
	});

	//menu row sortable init
	$( '.menu_row' ).sortable({
		items: ".menu_column",
		handle: ".dragger-handle",
		forcePlaceholderSize: true,
		placeholder: "col-placeholder",
		start: function(e, ui){
			ui.placeholder.height(ui.item.outerHeight());
			ui.placeholder.addClass('editors-col-xs-' + ui.item.data('width-xs'));
			ui.placeholder.addClass('editors-col-sm-' + ui.item.data('width-sm'));
			ui.placeholder.addClass('editors-col-md-' + ui.item.data('width-md'));
			ui.placeholder.addClass('editors-col-lg-' + ui.item.data('width-lg'));
			ui.placeholder.addClass('editors-col-xl-' + ui.item.data('width-xl'));
		},
		connectWith: ".menu_row"
	});

	//menu column sortable init
	$( '.menu_column' ).sortable({
		items: ".menu_row",
		handle: ".dragger-handle",
		placeholder: "row-placeholder",
		connectWith: ".menu_column",
		start: function(e, ui){
			ui.placeholder.height(ui.item.outerHeight());
		}
	});

	//menu column sortable init
	$( '.nav-tabs-sortable' ).sortable({
		items: ".content-tab-li",
		handle: ".dragger-handle-tab"
	});

	//bind sort update
	$('.first-rows-wrapper').on('sortupdate', function( event, ui ) {

		tmpelementId1 = ui.item.data('elementId');
		tmpparentId = ui.item.parents('.menu-element').first().data('elementId');

		if (ui.item.data('element-type') == 3)
		{
			ui.item.parents('.nav-tabs-sortable').find('.content-tab-li').each(function( index) {
				submenu_content[$(this).data('elementId')].position = index;
			});
		}
		else{

			if(typeof tmpparentId === 'undefined'){
				tmpparentId = 0;
			};
			if (submenu_content.hasOwnProperty(tmpelementId1)) {
				submenu_content[tmpelementId1].parentId = tmpparentId;
			}
			updateElementsPositions();
		}	
		
	});

	//set column width xs
	$( '.grid_editors' ).on( 'change', '[name=column_width_xs]', function(){
		
		$element = $(this).parents('.menu_column').first();
		tmpelementId = $element.data('elementId');

		$element.removeClass('editors-col-xs-' + $element.data('width-xs'));
		$element.addClass('editors-col-xs-' + this.value);
		$element.data('width-xs', this.value);

		if(this.value == 13){
			$element.addClass('xs-hidden');
		}
		else{
			$element.removeClass('xs-hidden');
		}

		if (submenu_content.hasOwnProperty(tmpelementId)) {
			submenu_content[tmpelementId].width_xs = parseInt(this.value);
		}
		
	});
	
	//set column width sm
	$( '.grid_editors' ).on( 'change', '[name=column_width_sm]', function(){
		
		$element = $(this).parents('.menu_column').first();
		tmpelementId = $element.data('elementId');

		$element.removeClass('editors-col-sm-' + $element.data('width-sm'));
		$element.addClass('editors-col-sm-' + this.value);
		$element.data('width-sm', this.value);

		if(this.value == 13){
			$element.addClass('sm-hidden');
		}
		else{
			$element.removeClass('sm-hidden');
		}

		if (submenu_content.hasOwnProperty(tmpelementId)) {
			submenu_content[tmpelementId].width_sm = parseInt(this.value);
		}
		
	});
	
	//set column width md
	$( '.grid_editors' ).on( 'change', '[name=column_width_md]', function(){
		
		$element = $(this).parents('.menu_column').first();
		tmpelementId = $element.data('elementId');

		$element.removeClass('editors-col-md-' + $element.data('width-md'));
		$element.addClass('editors-col-md-' + this.value);
		$element.data('width-md', this.value);

		if(this.value == 13){
			$element.addClass('md-hidden');
		}
		else{
			$element.removeClass('md-hidden');
		}

		if (submenu_content.hasOwnProperty(tmpelementId)) {
			submenu_content[tmpelementId].width_md = parseInt(this.value);
		}
		
	});
	
	//set column width lg
	$( '.grid_editors' ).on( 'change', '[name=column_width_lg]', function(){
		
		$element = $(this).parents('.menu_column').first();
		tmpelementId = $element.data('elementId');

		$element.removeClass('editors-col-lg-' + $element.data('width-lg'));
		$element.addClass('editors-col-lg-' + this.value);
		$element.data('width-lg', this.value);

		if(this.value == 13){
			$element.addClass('lg-hidden');
		}
		else{
			$element.removeClass('lg-hidden');
		}

		if (submenu_content.hasOwnProperty(tmpelementId)) {
			submenu_content[tmpelementId].width_lg = parseInt(this.value);
		}
		
	});
	
	//set column width xl
	$( '.grid_editors' ).on( 'change', '[name=column_width_xl]', function(){
		
		$element = $(this).parents('.menu_column').first();
		tmpelementId = $element.data('elementId');

		$element.removeClass('editors-col-xl-' + $element.data('width-xl'));
		$element.addClass('editors-col-xl-' + this.value);
		$element.data('width-xl', this.value);

		if(this.value == 13){
			$element.addClass('xl-hidden');
		}
		else{
			$element.removeClass('xl-hidden');
		}

		if (submenu_content.hasOwnProperty(tmpelementId)) {
			submenu_content[tmpelementId].width_xl = parseInt(this.value);
		}
		
	});
	
	//open content modal
	$( '.grid_editors' ).on( 'click', '.column-content-edit', function(){	
		$($(this).closest('.menu_column').find('.column-content-modal').first()).modal({
			keyboard: false
		});
	});

	//open edit row modal
	$( '.grid_editors' ).on( 'click', '.edit-row-action', function(){
		$($(this).closest('.menu_row').find('.row-settings-modal').first()).modal({
			keyboard: false
		});
	});

	//colum type
	$( '.grid_editors' ).on( 'change', '[name=content_type]', function(){
		$element = $(this).parents('.menu_column').first();
		elmid = $element.data('elementId');
		if (submenu_content.hasOwnProperty(elmid)) {
			submenu_content[elmid].contentType = parseInt(this.value);
		}
		setContentForm($element, this.value);
	});

	$( '.grid_editors' ).on( 'change', '[name=module]', function(){
		$element = $(this).closest('.module-wrapper').find('[name=module_hook]');
		$element.empty();
		if($(this).find(":selected").val() != '' )
		{
			hooks = $(this).find(":selected").data("hooks").split(',');

			var i;
			for (i = 0; i < hooks.length; ++i)
			{
				$element.append('<option value="' + hooks[i] + '">' + hooks[i] + '</option>');
			}
		}
	});
	
	//set content options
	
	$( '.grid_editors' ).on( 'shown.bs.modal', '.column-content-modal', function(e) {
		if($(this).find('.column_content').length != 0){
			return;
		}
		var $this = $(this);
		var elementId = $(this).parents('.menu_column').first().data('element-id');		
		$.ajax({
			type: 'POST',
			cache: false,
			url: ajaxModalContentsUrl,
			dataType: 'json',
			data: {elementId:elementId, submenu_content:encodeURIComponent(JSON.stringify(submenu_content[elementId]))},
			success: function(result){
				$this.find('.modal-body').html(result.html);
				setContentForm($this.parents('.menu_column').first(), parseInt($this.find('[name=content_type]').first().val()));
				loadTinyMceHtmlCustom(elementId);
				loadProductAutocomplete(elementId);
				loadSpectrum(elementId);
				loadMagnificPopup(elementId);
			}
		});
	});
	
	$( '.grid_editors' ).on( 'hidden.bs.modal', '.column-content-modal', function(e) {
		
		if($(this).find('.column_content').length == 0){
			return;
		}
		
		setContentForm($(this).parents('.menu_column').first(), parseInt($(this).find('[name=content_type]').first().val()));

		modid = $(this).parents('.menu_column').first().data('elementId');

		if (submenu_content.hasOwnProperty(modid)) {
			delete submenu_content[modid].content;
		}
		
		switch(parseInt($(this).find('[name=content_type]').first().val())) {
			case 1:
				setProductsSlider($(this).find('.products-slider-wrapper').first(), modid);
				break;
			case 2:
				setProductsLoad($(this).find('.products-load-wrapper').first(), modid);
				break;
			case 3:
				setProductsSelected($(this).find('.products-selected-wrapper').first(), modid);
				break;
			case 4:
				setCategoriesSelected($(this).find('.categories-selected-wrapper').first(), modid);
				break;
			case 5:
				setBrandsSelected($(this).find('.brands-selected-wrapper').first(), modid);
				break;
			case 6:
				setBlogsSlider($(this).find('.blogs-slider-wrapper').first(), modid);
				break;
			case 7:
				setSlidersSelected($(this).find('.sliders-wrapper').first(), modid);
				break;
			case 8:
				setTestimonialsSlider($(this).find('.testimonials-wrapper').first(), modid);
				break;
			case 9:
				setInstagramsSlider($(this).find('.instagrams-wrapper').first(), modid);
				break;
			case 17:
				setCustomOwl($(this).find('.owl-custom-wrapper').first(), modid);
				break;
			case 18:
				setLinks($(this).find('.links-wrapper').first(), modid);
				break;
			case 19:
				setSocials($(this).find('.socials-wrapper').first(), modid);
				break;
			case 20:
				setModuleInclude($(this).find('.module-wrapper').first(), modid);
				break;
			case 21:
				setBanner($(this).find('.banner-wrapper').first(), modid);
				break;
			case 22:
				setCustomHtml($(this).find('.html-wrapper').first(), modid);
				break;
			case 23:
				setCustomHook($(this).find('.hook-wrapper').first(), modid);
				break;
		}	

		setColumn(this, modid);

	});
	
	//colum type
	$( '.grid_editors' ).on( 'change', '.products-slider-wrapper [name=product_type]', function(){
		$el = $(this).closest('.products-slider-wrapper');
		switch(this.value) {
			case 'p_a':
				$el.find('[name="limit"]').first().closest('.form-group').hide();
				$el.find('[name="order_by"]').first().closest('.form-group').hide();
				$el.find('[name="order_way"]').first().closest('.form-group').hide();
				break;
			default:
				$el.find('.form-group').show();
				break;
		}
	});

	//set row options
	
	$( '.grid_editors' ).on( 'shown.bs.modal', '.row-settings-modal', function(e) {
		if($(this).find('.row_content').length != 0){
			return;
		}
		var $this = $(this);
		var elementId = $(this).parents('.menu_row').first().data('element-id');		
		$.ajax({
			type: 'POST',
			cache: false,
			url: ajaxModalContentsUrl,
			dataType: 'json',
			data: {elementId:elementId, submenu_content:encodeURIComponent(JSON.stringify(submenu_content[elementId]))},
			success: function(result){
				$this.find('.modal-body').html(result.html);
				loadSpectrum(elementId);
				loadMagnificPopup(elementId);
			}
		});
	});
	
	$( '.grid_editors' ).on( 'hidden.bs.modal', '.row-settings-modal', function(e) {
		
		if($(this).find('.row_content').length == 0){
			return;
		}

		modid = $(this).parents('.menu_row').first().data('elementId');

		row_s = {};

		row_s.row_type = parseInt($(this).find('[name=row_type]').first().val());
		
		row_s.class = $(this).find('[name=row_class]').first().val();
		
		row_s.style = setStyle(this);

		if (submenu_content.hasOwnProperty(modid)) {
			submenu_content[modid].row_s = row_s;
		}
		
	});
	
	function setStyle(modal)
	{
		style = {};

		if(bgc = $(modal).find('[name=el_bgc]').first().val()){
			style.bgc = bgc;
		}
		
		var id_el = $(modal).parents('[data-element-id]').first().data('element-id');

		if(bgi = $(modal).find('[name=el_bgi]').first().val()){
			style.bgi = bgi;
			style.bgr = parseInt($(modal).find('[name=el-bgr]').first().val());
		}
		
		style.xl = {};
		style.lg = {};
		style.md = {};
		style.sm = {};
		style.xs = {};
		
		style.xl.margin = {};
		style.lg.margin = {};
		style.md.margin = {};
		style.sm.margin = {};
		style.xs.margin = {};
		
		style.xl.padding = {};
		style.lg.padding = {};
		style.md.padding = {};
		style.sm.padding = {};
		style.xs.padding = {};
		
		if(margin_xl_top = parseInt($(modal).find('[name=margin_xl_top]').first().val())){
			style.xl.margin.top = margin_xl_top;	
		}
		if(margin_xl_right = parseInt($(modal).find('[name=margin_xl_right]').first().val())){
			style.xl.margin.right = margin_xl_right;	
		}
		if(margin_xl_bottom = parseInt($(modal).find('[name=margin_xl_bottom]').first().val())){
			style.xl.margin.bottom = margin_xl_bottom;	
		}
		if(margin_xl_left = parseInt($(modal).find('[name=margin_xl_left]').first().val())){
			style.xl.margin.left = margin_xl_left;	
		}
		if(padding_xl_top = parseInt($(modal).find('[name=padding_xl_top]').first().val())){
			style.xl.padding.top = padding_xl_top;	
		}
		if(padding_xl_right = parseInt($(modal).find('[name=padding_xl_right]').first().val())){
			style.xl.padding.right = padding_xl_right;	
		}
		if(padding_xl_bottom = parseInt($(modal).find('[name=padding_xl_bottom]').first().val())){
			style.xl.padding.bottom = padding_xl_bottom;	
		}
		if(padding_xl_left = parseInt($(modal).find('[name=padding_xl_left]').first().val())){
			style.xl.padding.left = padding_xl_left;	
		}
		
		///////////////////////////////////////////////////////////////////////////////////////////
		
		if(margin_lg_top = parseInt($(modal).find('[name=margin_lg_top]').first().val())){
			style.lg.margin.top = margin_lg_top;	
		}
		if(margin_lg_right = parseInt($(modal).find('[name=margin_lg_right]').first().val())){
			style.lg.margin.right = margin_lg_right;	
		}
		if(margin_lg_bottom = parseInt($(modal).find('[name=margin_lg_bottom]').first().val())){
			style.lg.margin.bottom = margin_lg_bottom;	
		}
		if(margin_lg_left = parseInt($(modal).find('[name=margin_lg_left]').first().val())){
			style.lg.margin.left = margin_lg_left;	
		}
		if(padding_lg_top = parseInt($(modal).find('[name=padding_lg_top]').first().val())){
			style.lg.padding.top = padding_lg_top;	
		}
		if(padding_lg_right = parseInt($(modal).find('[name=padding_lg_right]').first().val())){
			style.lg.padding.right = padding_lg_right;	
		}
		if(padding_lg_bottom = parseInt($(modal).find('[name=padding_lg_bottom]').first().val())){
			style.lg.padding.bottom = padding_lg_bottom;	
		}
		if(padding_lg_left = parseInt($(modal).find('[name=padding_lg_left]').first().val())){
			style.lg.padding.left = padding_lg_left;	
		}
		
		///////////////////////////////////////////////////////////////////////////////////////////
		
		if(margin_md_top = parseInt($(modal).find('[name=margin_md_top]').first().val())){
			style.md.margin.top = margin_md_top;	
		}
		if(margin_md_right = parseInt($(modal).find('[name=margin_md_right]').first().val())){
			style.md.margin.right = margin_md_right;	
		}
		if(margin_md_bottom = parseInt($(modal).find('[name=margin_md_bottom]').first().val())){
			style.md.margin.bottom = margin_md_bottom;	
		}
		if(margin_md_left = parseInt($(modal).find('[name=margin_md_left]').first().val())){
			style.md.margin.left = margin_md_left;	
		}
		if(padding_md_top = parseInt($(modal).find('[name=padding_md_top]').first().val())){
			style.md.padding.top = padding_md_top;	
		}
		if(padding_md_right = parseInt($(modal).find('[name=padding_md_right]').first().val())){
			style.md.padding.right = padding_md_right;	
		}
		if(padding_md_bottom = parseInt($(modal).find('[name=padding_md_bottom]').first().val())){
			style.md.padding.bottom = padding_md_bottom;	
		}
		if(padding_md_left = parseInt($(modal).find('[name=padding_md_left]').first().val())){
			style.md.padding.left = padding_md_left;	
		}
		
		///////////////////////////////////////////////////////////////////////////////////////////
		
		if(margin_sm_top = parseInt($(modal).find('[name=margin_sm_top]').first().val())){
			style.sm.margin.top = margin_sm_top;	
		}
		if(margin_sm_right = parseInt($(modal).find('[name=margin_sm_right]').first().val())){
			style.sm.margin.right = margin_sm_right;	
		}
		if(margin_sm_bottom = parseInt($(modal).find('[name=margin_sm_bottom]').first().val())){
			style.sm.margin.bottom = margin_sm_bottom;	
		}
		if(margin_sm_left = parseInt($(modal).find('[name=margin_sm_left]').first().val())){
			style.sm.margin.left = margin_sm_left;	
		}
		if(padding_sm_top = parseInt($(modal).find('[name=padding_sm_top]').first().val())){
			style.sm.padding.top = padding_sm_top;	
		}
		if(padding_sm_right = parseInt($(modal).find('[name=padding_sm_right]').first().val())){
			style.sm.padding.right = padding_sm_right;	
		}
		if(padding_sm_bottom = parseInt($(modal).find('[name=padding_sm_bottom]').first().val())){
			style.sm.padding.bottom = padding_sm_bottom;	
		}
		if(padding_sm_left = parseInt($(modal).find('[name=padding_sm_left]').first().val())){
			style.sm.padding.left = padding_sm_left;	
		}
		
		///////////////////////////////////////////////////////////////////////////////////////////
		
		if(margin_xs_top = parseInt($(modal).find('[name=margin_xs_top]').first().val())){
			style.xs.margin.top = margin_xs_top;	
		}
		if(margin_xs_right = parseInt($(modal).find('[name=margin_xs_right]').first().val())){
			style.xs.margin.right = margin_xs_right;	
		}
		if(margin_xs_bottom = parseInt($(modal).find('[name=margin_xs_bottom]').first().val())){
			style.xs.margin.bottom = margin_xs_bottom;	
		}
		if(margin_xs_left = parseInt($(modal).find('[name=margin_xs_left]').first().val())){
			style.xs.margin.left = margin_xs_left;	
		}
		if(padding_xs_top = parseInt($(modal).find('[name=padding_xs_top]').first().val())){
			style.xs.padding.top = padding_xs_top;	
		}
		if(padding_xs_right = parseInt($(modal).find('[name=padding_xs_right]').first().val())){
			style.xs.padding.right = padding_xs_right;	
		}
		if(padding_xs_bottom = parseInt($(modal).find('[name=padding_xs_bottom]').first().val())){
			style.xs.padding.bottom = padding_xs_bottom;	
		}
		if(padding_xs_left = parseInt($(modal).find('[name=padding_xs_left]').first().val())){
			style.xs.padding.left = padding_xs_left;	
		}

		return style;
	}
	
	function setLinks(modal, elmid)
	{
		column_content = {};

		column_content.ids = $(modal).find('[name=link_type]').first().val();
		column_content.view_type = parseInt($(modal).find('[name=view_type]').first().val());
		
		if (submenu_content.hasOwnProperty(elmid)) {
			submenu_content[elmid].content = column_content;
		}
	}
	
	function setSocials(modal, elmid)
	{
		column_content = {};

		column_content.ids = $(modal).find('[name=social_type]').first().val();
		column_content.view_type = parseInt($(modal).find('[name=view_type]').first().val());
		
		if (submenu_content.hasOwnProperty(elmid)) {
			submenu_content[elmid].content = column_content;
		}
	}

	function setCategoriesSelected(modal, elmid)
	{
		column_content = {};

		column_content.ajax = parseInt($(modal).find('[name=ajax]').first().val());
		column_content.ids = $(modal).find('[name=categories_selected]').first().val();
		column_content.view_type = parseInt($(modal).find('[name=view_type]').first().val());
		column_content.optionsOwl = setOptionsOwl(modal);

		if (submenu_content.hasOwnProperty(elmid)) {
			submenu_content[elmid].content = column_content;
		}
	}
	
	function setSlidersSelected(modal, elmid)
	{
		column_content = {};

		column_content.ids = $(modal).find('[name=sliders_selected]').first().val();
		column_content.view_type = parseInt($(modal).find('[name=view_type]').first().val());
		column_content.optionsOwl = setOptionsOwl(modal);

		if (submenu_content.hasOwnProperty(elmid)) {
			submenu_content[elmid].content = column_content;
		}
	}
	
	function setTestimonialsSlider(modal, elmid)
	{
		column_content = {};

		column_content.ids = $(modal).find('[name=testimonials_selected]').first().val();
		column_content.view_type = parseInt($(modal).find('[name=view_type]').first().val());
		column_content.per_column = parseInt($(modal).find('[name=per_column]').first().val());
		column_content.optionsOwl = setOptionsOwl(modal);

		if (submenu_content.hasOwnProperty(elmid)) {
			submenu_content[elmid].content = column_content;
		}
	}
	
	function setInstagramsSlider(modal, elmid)
	{
		column_content = {};

		column_content.ins_user_id = $(modal).find('[name=ins_user_id]').first().val();
		column_content.ins_access_token = $(modal).find('[name=ins_access_token]').first().val();
		column_content.view_type = parseInt($(modal).find('[name=view_type]').first().val());
		column_content.image_type = $(modal).find('[name=image_type]').first().val();
		column_content.limit = parseInt($(modal).find('[name=limit]').first().val());	
		column_content.per_column = parseInt($(modal).find('[name=per_column]').first().val());
		column_content.optionsOwl = setOptionsOwl(modal);

		if (submenu_content.hasOwnProperty(elmid)) {
			submenu_content[elmid].content = column_content;
		}
	}

	function setProductsLoad(modal, elmid)
	{
		column_content = {};

		column_content.ajax = parseInt($(modal).find('[name=ajax]').first().val());
		column_content.ids = $(modal).find('[name=product_type]').first().val();
		column_content.view_type = parseInt($(modal).find('[name=view_type]').first().val());
		column_content.image_type = $(modal).find('[name=image_type]').first().val();
		column_content.limit = parseInt($(modal).find('[name=limit]').first().val());	
		column_content.order_by = $(modal).find('[name=order_by]').first().val();
		column_content.order_way = $(modal).find('[name=order_way]').first().val();
		column_content.sort_order = parseInt($(modal).find('[name=sort_order]').first().val());

		optionsOwl = {};

		optionsOwl.xl = {};
		optionsOwl.lg = {};
		optionsOwl.md = {};
		optionsOwl.sm = {};
		optionsOwl.xs = {};

		optionsOwl.xl.line = parseInt($(modal).find('[name=line_xl]').first().val());
		optionsOwl.xl.margin = parseInt($(modal).find('[name=margin_xl]').first().val());	

		optionsOwl.lg.line = parseInt($(modal).find('[name=line_lg]').first().val());
		optionsOwl.lg.margin = parseInt($(modal).find('[name=margin_lg]').first().val());	

		optionsOwl.md.line = parseInt($(modal).find('[name=line_md]').first().val());			
		optionsOwl.md.margin = parseInt($(modal).find('[name=margin_md]').first().val());	

		optionsOwl.sm.line = parseInt($(modal).find('[name=line_sm]').first().val());
		optionsOwl.sm.margin = parseInt($(modal).find('[name=margin_sm]').first().val());	

		optionsOwl.xs.line = parseInt($(modal).find('[name=line_xs]').first().val());
		optionsOwl.xs.margin = parseInt($(modal).find('[name=margin_xs]').first().val());	

		column_content.optionsOwl = optionsOwl;
			
		if (submenu_content.hasOwnProperty(elmid)) {
			submenu_content[elmid].content = column_content;
		}
	}
	
	function setProductsSelected(modal, elmid)
	{
		column_content = {};
		
		column_content.ajax = parseInt($(modal).find('[name=ajax]').first().val());
		column_content.ids = serialize_products_selected($(modal).find('[name=products_selected]').first().find('option'));
		column_content.view_type = parseInt($(modal).find('[name=view_type]').first().val());
		column_content.image_type = $(modal).find('[name=image_type]').first().val();
		column_content.per_column = parseInt($(modal).find('[name=per_column]').first().val());
		column_content.optionsOwl = setOptionsOwl(modal);

		if (submenu_content.hasOwnProperty(elmid)) {
			submenu_content[elmid].content = column_content;
		}

	}
	
	function setBlogsSlider(modal, elmid)
	{
		column_content = {};

		column_content.ajax = parseInt($(modal).find('[name=ajax]').first().val());
		column_content.ids = $(modal).find('[name=blog_type]').first().val();
		column_content.view_type = parseInt($(modal).find('[name=view_type]').first().val());
		column_content.image_type = $(modal).find('[name=image_type]').first().val();
		column_content.limit = parseInt($(modal).find('[name=limit]').first().val());	
		column_content.per_column = parseInt($(modal).find('[name=per_column]').first().val());
		column_content.optionsOwl = setOptionsOwl(modal);

		if (submenu_content.hasOwnProperty(elmid)) {
			submenu_content[elmid].content = column_content;
		}

	}
	
	function setProductsSlider(modal, elmid)
	{
		column_content = {};

		column_content.ajax = parseInt($(modal).find('[name=ajax]').first().val());
		column_content.ids = $(modal).find('[name=product_type]').first().val();
		column_content.view_type = parseInt($(modal).find('[name=view_type]').first().val());
		column_content.image_type = $(modal).find('[name=image_type]').first().val();
		column_content.limit = parseInt($(modal).find('[name=limit]').first().val());	
		column_content.order_by = $(modal).find('[name=order_by]').first().val();
		column_content.order_way = $(modal).find('[name=order_way]').first().val();
		column_content.per_column = parseInt($(modal).find('[name=per_column]').first().val());
		column_content.optionsOwl = setOptionsOwl(modal);

		if (submenu_content.hasOwnProperty(elmid)) {
			submenu_content[elmid].content = column_content;
		}
	}
	
	function setOptionsOwl(modal)
	{
		optionsOwl = {};

		optionsOwl.xl = {};
		optionsOwl.lg = {};
		optionsOwl.md = {};
		optionsOwl.sm = {};
		optionsOwl.xs = {};
		
		optionsOwl.xl.line = parseInt($(modal).find('[name=line_xl]').first().val());
		optionsOwl.xl.margin = parseInt($(modal).find('[name=margin_xl]').first().val());	
		optionsOwl.xl.rewind = parseInt($(modal).find('[name=rewind_xl]').first().val());
		optionsOwl.xl.nav_type = $(modal).find('[name=nav_xl]').first().val();
		optionsOwl.xl.nav_margin = {};
		optionsOwl.xl.nav_margin.top = parseInt($(modal).find('[name=nav_margin_xl_top]').first().val());	
		optionsOwl.xl.nav_margin.right = parseInt($(modal).find('[name=nav_margin_xl_right]').first().val());	
		optionsOwl.xl.nav_margin.bottom = parseInt($(modal).find('[name=nav_margin_xl_bottom]').first().val());	
		optionsOwl.xl.nav_margin.left = parseInt($(modal).find('[name=nav_margin_xl_left]').first().val());	
		optionsOwl.xl.nav_position = $(modal).find('[name=nav_position_xl]').first().val();
		
		optionsOwl.xl.dots_type = $(modal).find('[name=dots_xl]').first().val();
		optionsOwl.xl.dots_margin = {};	
		optionsOwl.xl.dots_margin.top = parseInt($(modal).find('[name=dots_margin_xl_top]').first().val());	
		optionsOwl.xl.dots_margin.right = parseInt($(modal).find('[name=dots_margin_xl_right]').first().val());	
		optionsOwl.xl.dots_margin.bottom = parseInt($(modal).find('[name=dots_margin_xl_bottom]').first().val());	
		optionsOwl.xl.dots_margin.left = parseInt($(modal).find('[name=dots_margin_xl_left]').first().val());	
		optionsOwl.xl.dots_position = $(modal).find('[name=dots_position_xl]').first().val();
		optionsOwl.xl.autoplay = parseInt($(modal).find('[name=autoplay_xl]').first().val());
		optionsOwl.xl.autoplay_timeout = parseInt($(modal).find('[name=autoplay_timeout_xl]').first().val());
		optionsOwl.xl.autoplay_speed = parseInt($(modal).find('[name=autoplay_speed_xl]').first().val());
		optionsOwl.xl.autoplay_pause = parseInt($(modal).find('[name=autoplay_pause_xl]').first().val());
		
		////////////////////////////////////////////////////////////////////////////

		optionsOwl.lg.line = parseInt($(modal).find('[name=line_lg]').first().val());
		optionsOwl.lg.margin = parseInt($(modal).find('[name=margin_lg]').first().val());	
		optionsOwl.lg.rewind = parseInt($(modal).find('[name=rewind_lg]').first().val());
		optionsOwl.lg.nav_type = $(modal).find('[name=nav_lg]').first().val();
		optionsOwl.lg.nav_margin = {};
		optionsOwl.lg.nav_margin.top = parseInt($(modal).find('[name=nav_margin_lg_top]').first().val());	
		optionsOwl.lg.nav_margin.right = parseInt($(modal).find('[name=nav_margin_lg_right]').first().val());	
		optionsOwl.lg.nav_margin.bottom = parseInt($(modal).find('[name=nav_margin_lg_bottom]').first().val());	
		optionsOwl.lg.nav_margin.left = parseInt($(modal).find('[name=nav_margin_lg_left]').first().val());	
		optionsOwl.lg.nav_position = $(modal).find('[name=nav_position_lg]').first().val();
		
		optionsOwl.lg.dots_type = $(modal).find('[name=dots_lg]').first().val();
		optionsOwl.lg.dots_margin = {};	
		optionsOwl.lg.dots_margin.top = parseInt($(modal).find('[name=dots_margin_lg_top]').first().val());	
		optionsOwl.lg.dots_margin.right = parseInt($(modal).find('[name=dots_margin_lg_right]').first().val());	
		optionsOwl.lg.dots_margin.bottom = parseInt($(modal).find('[name=dots_margin_lg_bottom]').first().val());	
		optionsOwl.lg.dots_margin.left = parseInt($(modal).find('[name=dots_margin_lg_left]').first().val());	
		optionsOwl.lg.dots_position = $(modal).find('[name=dots_position_lg]').first().val();
		optionsOwl.lg.autoplay = parseInt($(modal).find('[name=autoplay_lg]').first().val());
		optionsOwl.lg.autoplay_timeout = parseInt($(modal).find('[name=autoplay_timeout_lg]').first().val());
		optionsOwl.lg.autoplay_speed = parseInt($(modal).find('[name=autoplay_speed_lg]').first().val());
		optionsOwl.lg.autoplay_pause = parseInt($(modal).find('[name=autoplay_pause_lg]').first().val());

		////////////////////////////////////////////////////////////////////////////

		optionsOwl.md.line = parseInt($(modal).find('[name=line_md]').first().val());
		optionsOwl.md.margin = parseInt($(modal).find('[name=margin_md]').first().val());	
		optionsOwl.md.rewind = parseInt($(modal).find('[name=rewind_md]').first().val());
		optionsOwl.md.nav_type = $(modal).find('[name=nav_md]').first().val();
		optionsOwl.md.nav_margin = {};
		optionsOwl.md.nav_margin.top = parseInt($(modal).find('[name=nav_margin_md_top]').first().val());	
		optionsOwl.md.nav_margin.right = parseInt($(modal).find('[name=nav_margin_md_right]').first().val());	
		optionsOwl.md.nav_margin.bottom = parseInt($(modal).find('[name=nav_margin_md_bottom]').first().val());	
		optionsOwl.md.nav_margin.left = parseInt($(modal).find('[name=nav_margin_md_left]').first().val());	
		optionsOwl.md.nav_position = $(modal).find('[name=nav_position_md]').first().val();
		
		optionsOwl.md.dots_type = $(modal).find('[name=dots_md]').first().val();
		optionsOwl.md.dots_margin = {};	
		optionsOwl.md.dots_margin.top = parseInt($(modal).find('[name=dots_margin_md_top]').first().val());	
		optionsOwl.md.dots_margin.right = parseInt($(modal).find('[name=dots_margin_md_right]').first().val());	
		optionsOwl.md.dots_margin.bottom = parseInt($(modal).find('[name=dots_margin_md_bottom]').first().val());	
		optionsOwl.md.dots_margin.left = parseInt($(modal).find('[name=dots_margin_md_left]').first().val());	
		optionsOwl.md.dots_position = $(modal).find('[name=dots_position_md]').first().val();
		optionsOwl.md.autoplay = parseInt($(modal).find('[name=autoplay_md]').first().val());
		optionsOwl.md.autoplay_timeout = parseInt($(modal).find('[name=autoplay_timeout_md]').first().val());
		optionsOwl.md.autoplay_speed = parseInt($(modal).find('[name=autoplay_speed_md]').first().val());
		optionsOwl.md.autoplay_pause = parseInt($(modal).find('[name=autoplay_pause_md]').first().val());
		
		////////////////////////////////////////////////////////////////////////////
		
		optionsOwl.sm.line = parseInt($(modal).find('[name=line_sm]').first().val());
		optionsOwl.sm.margin = parseInt($(modal).find('[name=margin_sm]').first().val());	
		optionsOwl.sm.rewind = parseInt($(modal).find('[name=rewind_sm]').first().val());
		optionsOwl.sm.nav_type = $(modal).find('[name=nav_sm]').first().val();
		optionsOwl.sm.nav_margin = {};
		optionsOwl.sm.nav_margin.top = parseInt($(modal).find('[name=nav_margin_sm_top]').first().val());	
		optionsOwl.sm.nav_margin.right = parseInt($(modal).find('[name=nav_margin_sm_right]').first().val());	
		optionsOwl.sm.nav_margin.bottom = parseInt($(modal).find('[name=nav_margin_sm_bottom]').first().val());	
		optionsOwl.sm.nav_margin.left = parseInt($(modal).find('[name=nav_margin_sm_left]').first().val());	
		optionsOwl.sm.nav_position = $(modal).find('[name=nav_position_sm]').first().val();
		
		optionsOwl.sm.dots_type = $(modal).find('[name=dots_sm]').first().val();
		optionsOwl.sm.dots_margin = {};	
		optionsOwl.sm.dots_margin.top = parseInt($(modal).find('[name=dots_margin_sm_top]').first().val());	
		optionsOwl.sm.dots_margin.right = parseInt($(modal).find('[name=dots_margin_sm_right]').first().val());	
		optionsOwl.sm.dots_margin.bottom = parseInt($(modal).find('[name=dots_margin_sm_bottom]').first().val());	
		optionsOwl.sm.dots_margin.left = parseInt($(modal).find('[name=dots_margin_sm_left]').first().val());	
		optionsOwl.sm.dots_position = $(modal).find('[name=dots_position_sm]').first().val();
		optionsOwl.sm.autoplay = parseInt($(modal).find('[name=autoplay_sm]').first().val());
		optionsOwl.sm.autoplay_timeout = parseInt($(modal).find('[name=autoplay_timeout_sm]').first().val());
		optionsOwl.sm.autoplay_speed = parseInt($(modal).find('[name=autoplay_speed_sm]').first().val());
		optionsOwl.sm.autoplay_pause = parseInt($(modal).find('[name=autoplay_pause_sm]').first().val());
		
		////////////////////////////////////////////////////////////////////////////
		
		optionsOwl.xs.line = parseInt($(modal).find('[name=line_xs]').first().val());
		optionsOwl.xs.margin = parseInt($(modal).find('[name=margin_xs]').first().val());	
		optionsOwl.xs.rewind = parseInt($(modal).find('[name=rewind_xs]').first().val());
		optionsOwl.xs.nav_type = $(modal).find('[name=nav_xs]').first().val();
		optionsOwl.xs.nav_margin = {};
		optionsOwl.xs.nav_margin.top = parseInt($(modal).find('[name=nav_margin_xs_top]').first().val());	
		optionsOwl.xs.nav_margin.right = parseInt($(modal).find('[name=nav_margin_xs_right]').first().val());	
		optionsOwl.xs.nav_margin.bottom = parseInt($(modal).find('[name=nav_margin_xs_bottom]').first().val());	
		optionsOwl.xs.nav_margin.left = parseInt($(modal).find('[name=nav_margin_xs_left]').first().val());	
		optionsOwl.xs.nav_position = $(modal).find('[name=nav_position_xs]').first().val();
		
		optionsOwl.xs.dots_type = $(modal).find('[name=dots_xs]').first().val();
		optionsOwl.xs.dots_margin = {};	
		optionsOwl.xs.dots_margin.top = parseInt($(modal).find('[name=dots_margin_xs_top]').first().val());	
		optionsOwl.xs.dots_margin.right = parseInt($(modal).find('[name=dots_margin_xs_right]').first().val());	
		optionsOwl.xs.dots_margin.bottom = parseInt($(modal).find('[name=dots_margin_xs_bottom]').first().val());	
		optionsOwl.xs.dots_margin.left = parseInt($(modal).find('[name=dots_margin_xs_left]').first().val());	
		optionsOwl.xs.dots_position = $(modal).find('[name=dots_position_xs]').first().val();
		optionsOwl.xs.autoplay = parseInt($(modal).find('[name=autoplay_xs]').first().val());
		optionsOwl.xs.autoplay_timeout = parseInt($(modal).find('[name=autoplay_timeout_xs]').first().val());
		optionsOwl.xs.autoplay_speed = parseInt($(modal).find('[name=autoplay_speed_xs]').first().val());
		optionsOwl.xs.autoplay_pause = parseInt($(modal).find('[name=autoplay_pause_xs]').first().val());
				
		return optionsOwl;

	}

	function setBanner(modal, elmid)
	{
		column_content = {};
		
		var id_el = $(modal).parents('[data-element-id]').first().data('element-id');
		
		source = $(modal).find('[name=banner_src]').first().val()
		column_content.banner = {};
		column_content.banner.src = source;
		column_content.banner.href = $(modal).find('[name=banner_href]').first().val();
		column_content.banner.window = parseInt($(modal).find('[name=banner_window]').first().val());

		var img = new Image();
		img.onload = function() {
			column_content.banner.width = this.width;
			column_content.banner.height = this.height;
		}

		img.src = source;			

		if (submenu_content.hasOwnProperty(elmid)) {
			submenu_content[elmid].content = column_content;
		}		
	}

	function setCustomHook(modal, elmid)
	{
		column_content = {};

		column_content.hook = $(modal).find('[name=custom_hook]').first().val();

		if (submenu_content.hasOwnProperty(elmid)) {
			submenu_content[elmid].content = column_content;
		}
	}

	function setModuleInclude(modal, elmid)
	{
		column_content = {};

		column_content.ajax = parseInt($(modal).find('[name=ajax]').first().val());
		column_content.module = {};
		column_content.module.name = $(modal).find('[name=module]').first().val();
		column_content.module.hook = $(modal).find('[name=module_hook]').first().val();

		if (submenu_content.hasOwnProperty(elmid)) {
			submenu_content[elmid].content = column_content;
		}
	}

	function setBrandsSelected(modal, elmid)
	{
		column_content = {};

		column_content.ajax = parseInt($(modal).find('[name=ajax]').first().val());
		column_content.ids = $(modal).find('[name=brands_selected]').first().val();
		column_content.view_type = parseInt($(modal).find('[name=view_type]').first().val());
		column_content.optionsOwl = setOptionsOwl(modal);

		if (submenu_content.hasOwnProperty(elmid)) {
			submenu_content[elmid].content = column_content;
		}

	}

	function setCustomHtml(modal, elmid)
	{	
		column_content = {};

		tinyMCE.triggerSave();
		
		column_content.custom_html = $(modal).find('[name=custom_html]').first().html();

		if (submenu_content.hasOwnProperty(elmid)) {
			submenu_content[elmid].content = column_content;
		}
	}
	
	function setCustomOwl(modal, elmid)
	{	
		column_content = {};

		tinyMCE.triggerSave();
		
		column_content.custom_owl = $(modal).find('[name=custom_owl]').first().html();
		column_content.optionsOwl = setOptionsOwl(modal);

		if (submenu_content.hasOwnProperty(elmid)) {
			submenu_content[elmid].content = column_content;
		}
	}

	function setColumn(modal, elmid)
	{	
		content_s = {};

		content_s.title = $(modal).find('[name=column_title]').first().val();
		content_s.href = $(modal).find('[name=column_href]').first().val();
		content_s.title_c = $(modal).find('[name=column_title_c]').first().val();
		content_s.title_align = $(modal).find('[name=column_title_align]').first().val();
		content_s.class = $(modal).find('[name=col_class]').first().val();
		content_s.tabs_type = $(modal).find('[name=tabs_type]').first().val();
		content_s.style = setStyle(modal);
		if (submenu_content.hasOwnProperty(elmid)) {
			submenu_content[elmid].content_s = content_s;
		}

	}

	function serialize_products_selected(element)
	{	
		options = [];
		element.each(function(i){
			options[i] =  parseInt($(this).val());
		});

		return unnrtProducts(options);

	}

	function unnrtProducts(a) {
		var prims = {"boolean":{}, "number":{}, "string":{}}, objs = [];

		return a.filter(function(item) {
			var type = typeof item;
			if(type in prims)
				return prims[type].hasOwnProperty(item) ? false : (prims[type][item] = true);
			else
				return objs.indexOf(item) >= 0 ? false : objs.push(item);
		});
	}

	function setContentForm($element, val)
	{

		tinyMCE.triggerSave();
		
		var title = $element.find('[name=column_title]').val();
		var title_content = $element.find('[name=content_type]').find('option:selected').html();
		var content = '';
		
		if(title == ''){
			title = text_empty;
		}
		
		switch(parseInt(val)) {
			case 0:
				$element.find('.content-options-wrapper').hide();
				//////////////////////////////////////////////////////////////////////////////
				title_content = text_content;
				content = text_empty;
				break;
			case 1:
				$element.find('.content-options-wrapper').not('.products-slider-wrapper').hide();
				$element.find('.products-slider-wrapper').show();
				//////////////////////////////////////////////////////////////////////////////
				content = $element.find('[name=product_type]').find('option:selected').html();
				break;
			case 2:
				$element.find('.content-options-wrapper').not('.products-load-wrapper').hide();
				$element.find('.products-load-wrapper').show();
				//////////////////////////////////////////////////////////////////////////////
				content = $element.find('[name=product_type]').find('option:selected').html();
			break;
			case 3:
				$element.find('.content-options-wrapper').not('.products-selected-wrapper').hide();
				$element.find('.products-selected-wrapper').show();
				/////////////////////////////////////////////////////////////////////////////
				$($element.find('[name=products_selected]').find('option')).each(function(index, element) {
					content += $(this).html()+'<span class="phay_">, </span>';
				});
				break;
			case 4:
				$element.find('.content-options-wrapper').not('.categories-selected-wrapper').hide();
				$element.find('.categories-selected-wrapper').show();
				/////////////////////////////////////////////////////////////////////////////
				$($element.find('[name=categories_selected]').find('option:selected')).each(function(index, element) {
					content += $(this).html()+'<span class="phay_">, </span>';
				});
				break;
			case 5:
				$element.find('.content-options-wrapper').not('.brands-selected-wrapper').hide();
				$element.find('.brands-selected-wrapper').show();
				/////////////////////////////////////////////////////////////////////////////
				$($element.find('[name=brands_selected]').find('option:selected')).each(function(index, element) {
					content += $(this).html()+'<span class="phay_">, </span>';
				});
				break;
			case 6:
				$element.find('.content-options-wrapper').not('.blogs-slider-wrapper').hide();
				$element.find('.blogs-slider-wrapper').show();
				/////////////////////////////////////////////////////////////////////////////
				content = $element.find('[name=blog_type]').find('option:selected').html();
				break;
			case 7:
				$element.find('.content-options-wrapper').not('.sliders-wrapper').hide();
				$element.find('.sliders-wrapper').show();
				/////////////////////////////////////////////////////////////////////////////
				$($element.find('[name=sliders_selected]').find('option:selected')).each(function(index, element) {
					content += $(this).html()+'<span class="phay_">, </span>';
				});
				break;
			case 8:
				$element.find('.content-options-wrapper').not('.testimonials-wrapper').hide();
				$element.find('.testimonials-wrapper').show();
				/////////////////////////////////////////////////////////////////////////////
				$($element.find('[name=testimonials_selected]').find('option:selected')).each(function(index, element) {
					content += $(this).html()+'<span class="phay_">, </span>';
				});
				break;
			case 9:
				$element.find('.content-options-wrapper').not('.instagrams-wrapper').hide();
				$element.find('.instagrams-wrapper').show();
				/////////////////////////////////////////////////////////////////////////////
				content = title_content;
				break;
			case 17:
				$element.find('.content-options-wrapper').not('.owl-custom-wrapper').hide();
				$element.find('.owl-custom-wrapper').show();
				//////////////////////////////////////////////////////////////////////////////
				content = $element.find('[name=custom_owl]').html();
				break;
			case 18:
				$element.find('.content-options-wrapper').not('.links-wrapper').hide();
				$element.find('.links-wrapper').show();
				/////////////////////////////////////////////////////////////////////////////
				content = $element.find('[name=link_type]').find('option:selected').html();
				break;
			case 19:
				$element.find('.content-options-wrapper').not('.socials-wrapper').hide();
				$element.find('.socials-wrapper').show();
				/////////////////////////////////////////////////////////////////////////////
				content = $element.find('[name=social_type]').find('option:selected').html();
				break;
			case 20:
				$element.find('.content-options-wrapper').not('.module-wrapper').hide();
				$element.find('.module-wrapper').show();
				//////////////////////////////////////////////////////////////////////////////
				content = $element.find('[name=module]').find('option:selected').html();
				content += '('+$element.find('[name=module_hook]').find('option:selected').html()+')';
				break;
			case 21:
				$element.find('.content-options-wrapper').not('.banner-wrapper').hide();
				$element.find('.banner-wrapper').show();
				//////////////////////////////////////////////////////////////////////////////
				content = '<img src="'+$element.find('[name=banner_src]').val()+'" style="max-width:100px;height:auto;"/>';
				break;
			case 22:
				$element.find('.content-options-wrapper').not('.html-wrapper').hide();
				$element.find('.html-wrapper').show();
				//////////////////////////////////////////////////////////////////////////////
				content = $element.find('[name=custom_html]').html();
				break;
			case 23:
				$element.find('.content-options-wrapper').not('.hook-wrapper').hide();
				$element.find('.hook-wrapper').show();
				//////////////////////////////////////////////////////////////////////////////
				content = $element.find('[name=custom_hook]').val();
				break;
		}	
		
		$element.find('.column-content-info').first().find('.title-info').find('.text').html(title);

		$element.find('.column-content-info').first().find('.content-info').find('.title').html(title_content+': ');
		
		$element.find('.column-content-info').first().find('.content-info').find('.text').html(content);
	
	}

	//init submenu elements

	var submenu_content = {};
	var elementId = 0;

	if ($('#submenu-elements').length) {
		var prev_submenu_val = $('#submenu-elements').val();
		if (prev_submenu_val.length !== 0) {
			var old_submenu_content = JSON.parse(prev_submenu_val);
			$.extend(submenu_content, old_submenu_content);

			var ids = $("#grid-editors-wrapper .menu-element").map(function() {
				return parseInt($(this).data('element-id'), 10);
			}).get();

			elementId = Math.max.apply(Math, ids);

		}
	}

	//set preview typ
	$( '.preview-buttons' ).on( 'click', '.switch-view-btn', function() {

		$('#grid-editors-wrapper').removeAttr('class');	
		$('#grid-editors-wrapper').addClass($(this).data("preview-type"));

		$('.preview-buttons .switch-view-btn').removeClass('active-preview');
		$(this).addClass('active-preview');

	});

	//add first row button
	$( '#buttons-sample' ).on( 'click', '.add-row-action', function() {

		$parentElement = $( this ).parent().parent().parent().find('.first-rows-wrapper'); 

		$parentElement.append( '<div data-element-type="1" data-depth="0" data-element-id="' + (++elementId) + '" class="menu_row menu_row_element first_rows menu-element menu-element-id-' + (elementId) + '">' + $( '#buttons-sample' ).html() + $( '#row-content-sample' ).html() + '</div>' );

		$( '.menu-element-id-' + elementId).sortable({
			items: ".menu_column",
			handle: ".dragger-handle",
			connectWith: ".menu_row",
			placeholder: "col-placeholder",
			start: function(e, ui){
				ui.placeholder.height(ui.item.outerHeight());
				ui.placeholder.addClass('editors-col-xs-' + ui.item.data('width-xs'));
				ui.placeholder.addClass('editors-col-sm-' + ui.item.data('width-sm'));
				ui.placeholder.addClass('editors-col-md-' + ui.item.data('width-md'));
				ui.placeholder.addClass('editors-col-lg-' + ui.item.data('width-lg'));
				ui.placeholder.addClass('editors-col-xl-' + ui.item.data('width-xl'));
			}
		});

		position = $parentElement.children().length;

		var newElement = {
			'elementId': elementId,
			'type': 1,
			'depth': 0,
			'position':  position,
			'parentId': 0
		};

		submenu_content[elementId] = newElement;
		
	});

	//add row button
	$( '.grid_editors' ).on( 'click', '.menu-element .add-row-action', function() {

		parentId = 	$( this ).parent().parent().data("element-id");
		depth = 	$( this ).parent().parent().data("depth")+1;

		$parentElement = $( this ).parent().parent();

		$parentElement.append( '<div data-element-type="1" data-depth="' + depth + '" data-element-id="' + (++elementId) + '" class="menu_row menu_row_element menu-element menu-element-id-' + (elementId) + '">' + $( '#buttons-sample' ).html() + $( '#row-content-sample' ).html() + ' </div>' );

		$( '.menu-element-id-' + elementId).sortable({
			items: ".menu_column",
			handle: ".dragger-handle",
			placeholder: "col-placeholder",
			connectWith: ".menu_row",
			start: function(e, ui){
				ui.placeholder.height(ui.item.outerHeight());
				ui.placeholder.addClass('editors-col-xs-' + ui.item.data('width-xs'));
				ui.placeholder.addClass('editors-col-sm-' + ui.item.data('width-sm'));
				ui.placeholder.addClass('editors-col-md-' + ui.item.data('width-md'));
				ui.placeholder.addClass('editors-col-lg-' + ui.item.data('width-lg'));
				ui.placeholder.addClass('editors-col-xl-' + ui.item.data('width-xl'));
			}
		});

		position = $parentElement.children().length;

		var newElement = {
			'elementId': elementId,
			'type': 1,
			'depth': depth,
			'position':  position,
			'parentId': parentId
		};

		submenu_content[elementId] = newElement;

	});

	//add tab button
	$( '.grid_editors' ).on( 'click', '.menu-element .add-tab-action', function() {

		parentId = 	$( this ).parent().parent().data("element-id");
		depth = 	$( this ).parent().parent().data("depth")+1;

		++elementId;

		$parentElement = $( this ).parent().parent();
		$parentElement.find('.nav-tabs li').removeClass('active');
		$parentElement.find('.tab-content .tab-pane').removeClass('active');
		$parentElement.find('.nav-tabs').first().append( '<li data-element-id="' + (elementId) + '" data-element-type="3" class="content-tab-li content-tab-li-id-' + (elementId) + ' active"><a href="#content-tab-id-' + (elementId) + '" data-toggle="tab">Tab ' + (elementId) + '<span class="dragger-handle-tab"><i class="icon-arrows "></i></span></a></li>' );
		$parentElement.find('.tab-content').first().append( '<div id="content-tab-id-' + (elementId) + '" class="tab-pane   active content-element-id-' + (elementId) + '"><div data-element-type="3" data-depth="' + depth + '" data-element-id="' + (elementId) + '" class="menu_row menu_tabe menu_row_element menu-element menu-element-id-' + (elementId) + '">' + $( '#buttons-sample' ).html() + $( '#tab-content-sample' ).html() + ' </div></div>' );

		$( '.menu-element-id-' + elementId).sortable({
			items: ".menu_column",
			handle: ".dragger-handle",
			placeholder: "col-placeholder",
			connectWith: ".menu_tabs",
			start: function(e, ui){
				ui.placeholder.height(ui.item.outerHeight());
				ui.placeholder.addClass('editors-col-xs-' + ui.item.data('width-xs'));
				ui.placeholder.addClass('editors-col-sm-' + ui.item.data('width-sm'));
				ui.placeholder.addClass('editors-col-md-' + ui.item.data('width-md'));
				ui.placeholder.addClass('editors-col-lg-' + ui.item.data('width-lg'));
				ui.placeholder.addClass('editors-col-xl-' + ui.item.data('width-xl'));
			}
		});

		position = $parentElement.children().length;

		var newElement = {
			'elementId': elementId,
			'type': 3,
			'depth': depth,
			'position':  position,
			'parentId': parentId
		};
		submenu_content[elementId] = newElement;
	});

	function setTabtitle()
	{	
		tinyMCE.triggerSave();
		$('[name=tabtitle]').each(function() {
			
			$element = $(this).parents('.menu_tabe').first();
			
			tmpelementId = $element.data('elementId');

			tabtitle = '';

			tabtitle = $element.find('[name=tabtitle]').first().val()

			if (submenu_content.hasOwnProperty(tmpelementId)) {
				submenu_content[tmpelementId].tabtitle = tabtitle;
			}
			
		});
	}
	
	function clone(src) {
		function mixin(dest, source, copyFunc) {
			var name, s, i, empty = {};
			for(name in source){
				// the (!(name in empty) || empty[name] !== s) condition avoids copying properties in "source"
				// inherited from Object.prototype.	 For example, if dest has a custom toString() method,
				// don't overwrite it with the toString() method that source inherited from Object.prototype
				s = source[name];
				if(!(name in dest) || (dest[name] !== s && (!(name in empty) || empty[name] !== s))){
					dest[name] = copyFunc ? copyFunc(s) : s;
				}
			}
			return dest;
		}

		if(!src || typeof src != "object" || Object.prototype.toString.call(src) === "[object Function]"){
			// null, undefined, any non-object, or function
			return src;	// anything
		}
		if(src.nodeType && "cloneNode" in src){
			// DOM Node
			return src.cloneNode(true); // Node
		}
		if(src instanceof Date){
			// Date
			return new Date(src.getTime());	// Date
		}
		if(src instanceof RegExp){
			// RegExp
			return new RegExp(src);   // RegExp
		}
		var r, i, l;
		if(src instanceof Array){
			// array
			r = [];
			for(i = 0, l = src.length; i < l; ++i){
				if(i in src){
					r.push(clone(src[i]));
				}
			}
			// we don't clone functions for performance reasons
			//		}else if(d.isFunction(src)){
			//			// function
			//			r = function(){ return src.apply(this, arguments); };
		}else{
			// generic objects
			r = src.constructor ? new src.constructor() : {};
		}
		return mixin(r, src, clone);
	}

	//clone column
	$( '.grid_editors' ).on( 'click', ' .duplicate-element-action', function() 
	{	
		$brotherElement = $(this).parents('.menu-element').first();
		brotherId = $brotherElement.data('element-id');

		if (submenu_content.hasOwnProperty(brotherId)) {

				clonedElement = clone(submenu_content[brotherId]);
				clonedElement.elementId = ++elementId;

				$cloneElement = $brotherElement.clone(true);
				$cloneElement.attr('data-element-id', elementId);
				$cloneElement.data('element-id', elementId);
				$cloneElement.removeClass('menu-element-id-' + brotherId);
				$cloneElement.addClass('menu-element-id-' + elementId).appendTo($brotherElement.parent());
				submenu_content[elementId] = clonedElement;
				$cloneElement.find('.content_click').attr('style','');
				$cloneElement.html($( '#buttons-sample' ).html() + $( '#column-content-sample' ).html());
				$cloneElement.find('.column-content-info').html($brotherElement.find('.column-content-info').html());
		}
	});


	//add column button
	$( '.grid_editors' ).on( 'click', '.menu-element .add-column-action', function(){
		
		parentId = 	$( this ).parents('.menu_row').first().data('element-id');
		depth = 	$( this ).parents('.menu_row').first().data("depth")+1;

		$parentElement = $( this ).parents('.menu_row_element').first();

		if (!$parentElement.length ) {
			$parentElement = $( this ).parents('.menu_row').find('.menu_row_element').first();
		}

		$parentElement.append( '<div data-element-type="2" data-depth="' + depth + '"  data-width-xs="12" data-width-sm="12" data-width-md="12" data-width-lg="12" data-width-xl="12" data-element-id="' + (++elementId) + '" class="editors-col-xs-12 editors-col-sm-12 editors-col-md-12 editors-col-lg-12 editors-col-xl-12 menu_column menu-element menu-element-id-' + (elementId) + '">' + $( '#buttons-sample' ).html() + $( '#column-content-sample' ).html() + '</div>' );

		$( '.menu-element-id-' + elementId).sortable({
			items: ".menu_row",
			handle: ".dragger-handle",
			placeholder: "row-placeholder",
			connectWith: ".menu_column",
			start: function(e, ui){
				ui.placeholder.height(ui.item.outerHeight());
			}
		});

		position = $parentElement.children().length;

		var newElement = {
			'elementId': elementId,
			'type': 2,
			'depth': depth,
			'width_xs': 12,
			'width_sm': 12,
			'width_md': 12,
			'width_lg': 12,
			'width_xl': 12,
			'contentType': 0,
			'position':  position,
			'parentId': parentId
		};
		
		submenu_content[elementId] = newElement;

	});

	//add column button
	$( '.grid_editors' ).on( 'click', '.menu-element .add-tabs-action', function() 
	{
		parentId = 	$( this ).parents('.menu_row').first().data('element-id');
		depth = 	$( this ).parents('.menu_row').first().data("depth")+1;

		$parentElement = $( this ).parents('.menu_row_element').first();

		if (!$parentElement.length ) {
			$parentElement = $( this ).parents('.menu_row').find('.menu_row_element').first();
		}

		$parentElement.append( '<div data-element-type="4" data-depth="' + depth + '"  data-width-xs="12" data-width-sm="12" data-width-md="12" data-width-lg="12" data-width-xl="12" data-element-id="' + (++elementId) + '" class="editors-col-xs-12 editors-col-sm-12 editors-col-md-12 editors-col-lg-12 editors-col-xl-12 menu_column menu_tabs menu-element menu-element-id-' + (elementId) + '">' + $( '#buttons-sample' ).html() + $( '#column-content-sample' ).html() + ' <ul class="nav nav-tabs nav-tabs-sortable"></ul><div class="tab-content"></div></div>' );

		$( '.menu-element-id-' + elementId).sortable({
			items: ".menu_row",
			handle: ".dragger-handle",
			placeholder: "row-placeholder",
			connectWith: ".menu_column",
			start: function(e, ui){
				ui.placeholder.height(ui.item.outerHeight());
			}
		});

		$( '.menu-element-id-' + elementId).find('.nav-tabs-sortable').sortable({
		items: ".content-tab-li",
		handle: ".dragger-handle-tab"
		});

		position = $parentElement.children().length;

		var newElement = {
			'elementId': elementId,
			'type': 4,
			'depth': depth,
			'width_xs': 12,
			'width_sm': 12,
			'width_md': 12,
			'width_lg': 12,
			'width_xl': 12,
			'contentType': 0,
			'position':  position,
			'parentId': parentId
		};

		submenu_content[elementId] = newElement;

	});

	//remove element button
	$( '.grid_editors' ).on( 'click', '.remove-element-action', function() {
		deleteId = 	$( this ).parent().parent().data('element-id');
		$parent_element = $( this ).parent().parent();

		if($parent_element.data('element-type') == 3){
			$('.content-tab-li-id-' + $parent_element.data('element-id')).remove();
		}

		$parent_element.remove();

		delete submenu_content[deleteId];
		deleteMenuElelement(deleteId)
	});
	
	$('#homepagebuilder > form').on('keypress',function(e) {
		if(e.which == 13) {
			e.preventDefault();
		}
	});

	//pass submenu to input field
	$('button[name="submitNrtPageBuilder"]').on("click",function() {
		setTabtitle();
		
		if(idLang = $(this).data('language')){
			$('#grid-submenu').find('[name=idLang]').first().val(idLang);
		}

		if($.isEmptyObject(submenu_content)){
			$('#submenu-elements').val('');
		}
		else{
			$('#submenu-elements').val(encodeURIComponent(JSON.stringify(submenu_content)));
		}
	});
	
	//pass export to input field
	$('#exportData').on("click",function() {
		setTabtitle();

		if($.isEmptyObject(submenu_content)){
			var dataExport = '';
		}
		else{
			var dataExport = JSON.stringify(submenu_content);
		}
		
		var pageType = $('#grid-submenu').find('[name=pageType]').first().val();
		var pageId = $('#grid-submenu').find('[name=pageId]').first().val();
		
		if(pageType == 'hook'){
		   pageType = 'widget';
		}
		
		var blob = new Blob([dataExport], { type: "text/json;charset=utf-8" });
		saveAs(blob, 'template_' + pageType + '_' + pageId + '_' + Date.now() + '.json', true);
		
	});
	
	//remove product fromc olumn
	$( '.grid_editors' ).on( 'click', '.remove-products-selected', function() {

		$(this).parent().find('[name=products_selected] option:selected').each(function(i){
			$(this).remove();
		});

	});

	//delete menu elements recursivly
	function deleteMenuElelement(id) {	
		for (var key in submenu_content) {
			if (submenu_content.hasOwnProperty(key)) {
				if(submenu_content[key].parentId == id)
				{	
					tmpelid = submenu_content[key].elementId;
					delete submenu_content[key];
					deleteMenuElelement(tmpelid);
				}
			}
		}
	}

	window.getSubmenuContentWindow = function() {
	   return getSubmenuContent();
	}

	function getSubmenuContent()
	{
		if($.isEmptyObject(submenu_content)){
			var submenu_elements = '';
		}
		else{
			var submenu_elements = submenu_content;
		}

		return submenu_elements;
	}

	//update all  menu positions after drag and drop
	function updateElementsPositions(){
		for (var key in submenu_content) {
			if (submenu_content.hasOwnProperty(key)) {
				submenu_content[key].position =  $('.menu-element-id-' + submenu_content[key].elementId).index();
			}
		}
	}
	
	function loadTinyMceHtmlCustom(elementId){	
		$('.menu-element-id-' + elementId + ' [name=custom_html]').addClass('autoload_rte_html');
		$('.menu-element-id-' + elementId + ' [name=custom_owl]').addClass('autoload_rte_html');
		tinySetup({editor_selector:'autoload_rte_html'});
	}
	
	function loadProductAutocomplete(elementId){

		$('.menu-element-id-' + elementId + ' .product-autocomplete').autocomplete(ajaxProductsListUrl, {
			minChars: 1,
			autoFill: true,
			max:20,
			matchContains: true,
			mustMatch:true,
			scroll:false,
			cacheLength:0,
			formatItem: function(item) {
				return item[1]+' - '+item[0];
			}
		}).result(function(event, data, formatted){
			if (data == null){
				return false;
			}
			var productId = data[1];
			var productName = data[0];

			$(this).parent().parent().parent().find('[name=products_selected]').first().append('<option value="' + productId + '">' + '(ID: ' + productId + ') ' + productName + '</option>');
			$(this).val('');
		});
		
		$('.menu-element-id-' + elementId + ' .product-autocomplete').setOptions({
			extraParams: {
				excludeIds : -1
			}
		});

	};
	
	function loadSpectrum(elementId){
		$('.menu-element-id-' + elementId + ' .spectrumcolor').spectrum({
			showInput: true,
			clickoutFiresChange: true,
			preferredFormat: "rgb",
			allowEmpty: true,
			showAlpha: true,
			showInitial: true,
			appendTo: $('.menu-element-id-' + elementId ).find('.modal-body').first()
		});
	};
	
	function loadMagnificPopup(elementId){
		$('.menu-element-id-' + elementId + ' .iframe-upload').magnificPopup({
			type: 'iframe',
			preloader: false,
			callbacks: {
				open: function() {
					var data_input_name = $(this._lastFocusedEl).data('input-name');
					$('.mfp-iframe').on('load', function() {
						$('.mfp-iframe').contents().find('a.link').attr('data-field_id', data_input_name);
						$('.mfp-iframe').contents().find('a.link').data('field_id', data_input_name);
					});
				}
			}
		});
	};
	
    $('body').on('click', '.tab-c', (function(e) {
        e.preventDefault();
		var $tabs = $(this).closest('.tabs-c');
		var tab_pane = $(this).data('tab-c');
		
		$tabs.find('.tab-c').removeClass('active');
		$(this).addClass('active');
		
		$tabs.find('.tab-pane-c').removeClass('active');
		$tabs.find('[tab-pane-c='+tab_pane+']').addClass('active');
		
    }));
	
});

function closePopup(){
	$('.mfp-container').click();
};
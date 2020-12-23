/*
 * Custom code goes here.
 * A template should always ship with an empty custom.js
 */

/*********************************************************************************
 * 			MODIFY ID, NAME & VALUE ATTRIBUTES ON TECHNOLOGIES SECTION
 *********************************************************************************/

(function () {
	'use strict';

	const NrtMainProductsHome = {
		DOM: {
			commonGrandParentSelector: '',
			activeTabId: '',
			dataToggleAttr: '[data-toggle="tab"]', 																		// For tabs
			sliderItems: '.owl-item', 																					// For slider items
			hsmaScriptDisplayHeaderId: 'hsma-display-header',
			quickviewBuyTogetherId: 'render-buy-together-quickview',
			selectors: {
				currentProductScriptId: '#current-script',
				productSlider: '#product',
				totalPrice: '.current-price',
				formRenderByTogetherId: '#render-buy-together',
				formProductPageProductId: '#product_page_product_id',
				formTokenName: 'form input[name="token"]',
				formAddToCartOrRefreshId: '#add-to-cart-or-refresh',
				formProductCustomizationId: '#product_customization_id',
				formProductVariantsClass: 'form .product-variants',
				formProductVariantsOptions: 'form select[data-product-attribute]',
				formQuantityWantedId: '#quantity_wanted',
				formChangeQuantity: '#add-to-cart-or-refresh .bootstrap-touchspin-up',
				formAddToCartButton: '#add-to-cart-or-refresh [data-button-action="add-to-cart"]',
				formBtnTouchSpinBtn: '.input-group-btn-vertical button',
				hsmaGroupAccessoriesId: '#group_accessories',
				hsmaAccesoryItemClass: '.accessory_item',
				hsmaAccessoriesCustomQuantityClass: '.custom_quantity',
				hsmaProductCombinationClass: '#group_accessories .product-combination',
				hsmaOptionRowClass: '.option-row',
				hsmaMultiAccessoriesTabId: '#multiAccessoriesTab',
				hsmaAccessoriesTablePriceContent: '.accessories_table_price_content',
				hsmaContentGroup: '.content_group',
				hsmaAccessoryGroupyTableClass: '.accessorygroup.clear',
				hsmaRenderInputClass: '.hsma_render_input',
			},
			_selectors: ['div[_id]', 'div[_class]', 'input[_id]', 'input[_class]', 'input[_name]', 'button[_id]',
				'button[_class]', 'form[_action]', 'form[_id]', 'select[_id]', 'select[_name]', 'section[_id]',
				'section[_class]', 'a[_href]', 'table[_id]', 'table[_class]', 'tr[_class]', 'td[_class]', 'script[_id]']
		},

		removeAttribute: (element, attr) => element.removeAttribute(attr),

		// Add underscore
		addUnderscore(element, attr) {
			if (!this.hasUnderscore(attr)) {
				let attrValue = element.getAttribute(attr);
				this.removeAttribute(element, attr);
				element.setAttribute('_' + attr, attrValue);

			}
		},

		// Remove underscore
		removeUnderscore(element) {
			let attributes = (Object.values(element.attributes)).filter(
				attr => attr.name !== 'type' || attr.name !== 'style' || attr.name !== 'width' || attr.name !== 'height');
			attributes.forEach(_attr => {
				if (element.hasAttribute(_attr.name)) {
					element.setAttribute(_attr.name.replace(/_/, ''), element.getAttribute(_attr.name));
					this.removeAttribute(element, _attr.name);
				}
			});
		},

		hasUnderscore: (attr) => attr.match(/^_[a-z]+/) !== null,

		// Set all element's attributes
		setAttributes(element) {
			let attributes = Object.values(element.attributes);
			attributes.forEach(attr => {
				// Exclude these attributes
				if (attr.name !== 'type' || attr.name !== 'style' || attr.name !== 'width' || attr.name !== 'height') {
					this.addUnderscore(element, attr.name);
				}
			});
		},

		isSlider() {
			return this.DOM.commonGrandParentSelector.match(new RegExp("owl")) !== null;
		},

		// Get all inactive tabs
		getItems() {
			// Develop strategy if li does not exist
			let items = [];
			if (this.isSlider()) {
				items = this.getSlides();
			} else {
				items = this.getTabs();
			}
			return items;
		},

		getTabs() {
			const nodeList = document.querySelectorAll(`.hsmulti-products ${this.DOM.commonGrandParentSelector} ${this.DOM.dataToggleAttr}`);
			let tabs = [];
			nodeList.forEach(element => {
				let tab;
				if (!this.isActive(element) && element.hasAttribute('aria-controls')) {
					tab = document.getElementById(element.getAttribute('aria-controls'));
					tabs.push(tab);
				} else {
					tab = document.getElementById(element.getAttribute('aria-controls'));
					this.processActiveTab(tab);
				}
			});
			return tabs;
		},

		getSlides() {
			const nodeList = document.querySelectorAll(`${this.DOM.commonGrandParentSelector + " " + this.DOM.sliderItems}`);
			let slides = [];
			nodeList.forEach(slide => {
				if (!slide.classList.contains("active")) {
					slides.push(slide);
				} else {
					this.processActiveSlide(slide);
				}
			});

			return slides;
		},

		// Get active element
		isActive(element) {
			let status = false;
			Array.from(element.attributes).forEach(attr => {
				if (attr.value.match(new RegExp(/(active|0|true)/))) {
					status = true;
				}
			});
			return status;
		},

		getElements() {
			let elements = this.getItems();
			let selectors = Object.values(this.DOM.selectors);

			for (let i = 0; i < elements.length; i++) {
				for (let j = 0; j < selectors.length; j++) {
					if (elements[i].querySelectorAll(selectors[j]).length > 0) {
						let children = elements[i].querySelectorAll(selectors[j]);
						children.forEach(child => {
							if (child.nodeName === 'SCRIPT') {
								this.setAttributes(child);
							} else {
								setTimeout(() => this.setAttributes(child), 700);
							}
						})
					}
				}
			}
		},

		// Process active tab
		processActiveTab(element) {
			this.DOM.activeTabId = element.id;
			let _selectors = this.DOM._selectors;
			for (let j = 0; j < _selectors.length; j++) {
				if (element.querySelectorAll(_selectors[j]).length > 0) {
					let children = element.querySelectorAll(_selectors[j]);
					children.forEach(child => this.removeUnderscore(child));
				}
			}
		},

		// Process active tab
		processActiveSlide(element) {
			let _selectors = this.DOM._selectors;
			for (let j = 0; j < _selectors.length; j++) {
				if (element.querySelectorAll(_selectors[j]).length > 0) {
					let children = element.querySelectorAll(_selectors[j]);
					children.forEach(child => this.removeUnderscore(child));
				}
			}
		},

		// Find common parent for products sections
		searchCommonGrandParentClass() {
			const children = document.querySelectorAll(this.DOM.selectors.formAddToCartOrRefreshId);
			const hasChildren = children.length > 1;
			let parent = hasChildren ? children[0].parentElement : null;
			let parentFound = false;

			if (hasChildren) {
				while (parentFound === false) {
					if (parent.querySelectorAll(this.DOM.selectors.formAddToCartOrRefreshId).length === children.length) {
						parentFound = true;
						// Get grand parent if common parent is found
						const grandParentId = parent.parentElement.hasAttribute("id") ? parent.parentElement.id : null;
						const grandParentClass = parent.parentElement.className;
						const partialSelector = `#${parent.parentElement.closest('[id*="content-home-"]').id}`;

						this.DOM.commonGrandParentSelector = grandParentId !== null
							? `${partialSelector} #${grandParentId}`
							: `${partialSelector} .${grandParentClass.replace(new RegExp(/\\s+/, 'g'), '.')}`;
						break;
					} else {
						parent = parent.parentElement;
					}
				}
			}
		},

		isChoseItemButton(element) {
			if ((element.attributes
				&& element.hasAttribute('href')
				&& element.href.match(/#content-/)) ||
				(element.parentElement.nodeName === "BUTTON" &&
					element.parentElement.classList.contains("active"))
			) {
				this.clientTrigger();
				NrtMainProductsHome.updateAccessories();
			} else {
				return false;
			}
		},

		// Update script hsma display header
		updateScriptDisplayHeader(buyTogetherOption = '') {
			let scriptDisplayHeader = document.getElementById(this.DOM.hsmaScriptDisplayHeaderId); // script element
			let textCurrentScript = scriptDisplayHeader.textContent; // text
			let displayBuyTogether;

			if (buyTogetherOption !== '') {
				displayBuyTogether = buyTogetherOption;
			} else {
				displayBuyTogether = document.querySelector(this.DOM.selectors.formRenderByTogetherId).value; // value
			}
			scriptDisplayHeader.textContent = textCurrentScript.replace(new RegExp(/{(.*)}/), displayBuyTogether);
		},

		// Return whether page has 'add-to-cart-or-refresh' ids conflict, that is, there are more than one
		pageHasConflict() { return document.querySelectorAll(this.DOM.selectors.formAddToCartOrRefreshId).length > 1 },

		trigger() {
			this.searchCommonGrandParentClass();
			this.getElements();
			this.updateScriptDisplayHeader();
		},

		updateAccessories() {
			let priceTable = new PriceTable(getCurrentProductOnHomepage());
			priceTable.onLoad();
		},

		clientTrigger() { this.trigger(); },

		init() {
			if (this.pageHasConflict()) {
				document.addEventListener('DOMContentLoaded', () => {
					this.trigger();
					document.addEventListener('click', Event => {
						let element = Event.target;
						this.isChoseItemButton(element);
					}, false);
				});
			} else {
				console.log('No id conflicts in this page!');
				return false;
			}
		},
	};
	NrtMainProductsHome.init();

	// Add underscore to product of active tab if click in quickview
	document.querySelectorAll('.button-action.quick-view').forEach(qv => {
		let selectors;

		qv.addEventListener('click', Event => {
			selectors = Object.values(NrtMainProductsHome.DOM.selectors);
			let activeTab = document.getElementById(NrtMainProductsHome.DOM.activeTabId);
			for (let s = 0; s < selectors.length; s++) {
				if (activeTab.querySelectorAll(selectors[s]) !== null) {
					let elements = activeTab.querySelectorAll(selectors[s]);
					elements.forEach(el => {
						Array.from(el.attributes).map(attr => {
							NrtMainProductsHome.addUnderscore(el, attr.name);
						});
					});
				}
			}

			$('body').on('show.bs.modal','.quickview',(function() {
				if (document.querySelector(NrtMainProductsHome.DOM.selectors.hsmaMultiAccessoriesTabId) !== null) {
					let buyTogether = document.querySelector('#' + NrtMainProductsHome.DOM.quickviewBuyTogetherId);
					NrtMainProductsHome.updateScriptDisplayHeader(buyTogether.value);
					let priceTable = new PriceTable(getCurrentProductOnHomepage('product'));
					priceTable.onLoad();
				}
			}));
			return false;
		});
	});

	// Remove underscore from product of active tab if close quickview
	document.addEventListener('click', Event => {
		const element = Event.target;
		if (element.classList.contains('quickview') && element.hasAttribute('role') ||
			element.parentElement.classList.contains('close') && element.getAttribute('aria-hidden') === 'true'
		) {
			let activeTab = document.getElementById(NrtMainProductsHome.DOM.activeTabId);
			let _selectors = Object.values(NrtMainProductsHome.DOM._selectors);
			for (let s = 0; s < _selectors.length; s++) {
				if (activeTab.querySelectorAll(_selectors[s]) !== null) {
					let elements = activeTab.querySelectorAll(_selectors[s]);
					elements.forEach(el => {
						if (el !== null) {
							NrtMainProductsHome.removeUnderscore(el);
						}
					});
				}
			}
		}
	});
}());

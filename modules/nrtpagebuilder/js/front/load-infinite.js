(function($) {
    $.fn.InfiniteAp = function(dataWidget) {
        var defaultConf = {
            trigger: '.widget-ajax-trigger',
            ajaxLoader: '.ajax-loader',
			sortOrder: '[data-sort-order]',
			sortLoaderIcon: '.sort-loader-icon',
            itemsWrap: '.wrapper-infinite',
			items: '.item',
            ajaxUrl: opPbder.ajax,
            data: dataWidget
        }
        return this.each(function() {
            var config = $.extend({}, defaultConf, dataWidget);
            var $this = $(this);
            var curPage = 1;
            var $trigger = $this.find(config.trigger).first();
            var $ajaxLoader = $this.find(config.ajaxLoader).first();
			var $sortOrder = $this.find(config.sortOrder);
			var $sortLoaderIcon = $this.find(config.sortLoaderIcon).first();
			var $itemsWrap = $this.find(config.itemsWrap).first();
            var hasLastPage = false;
            var dataWidget = config.data;
			
            $trigger.on('click', ajaxLoadProducts);
			$sortOrder.on('click', ajaxSortProducts);
			
            function ajaxLoadProducts() {
                $trigger.hide();
                $ajaxLoader.show();
                curPage++;
                dataWidget.config.page = curPage;
                $.ajax({
                    url: opPbder.ajax,
                    type: "POST",
                    data: dataWidget,
                    success: function(res) {
                        $itemsWrap.append(res.html);
                        if (res.lastPage) {
                            hasLastPage = true;
                        }
						prestashop.emit('updatedProductAjax', null);
                    },
					error: function (xhr, ajaxOptions, thrownError) {
						console.error(thrownError);
					}
                }).always(function() {
                    $ajaxLoader.hide();
                    if (!hasLastPage) {
                        $trigger.show();
                    } else {
                        $trigger.hide();
                    }
                });
            }
			
            function ajaxSortProducts() {	
				$sortLoaderIcon.show();
				var ajax_sort_order = $(this).data('sort-order');
				$this.find('.dropdown-infinite').first().html($(this).html());
				dataWidget.config.ajax_sort_order = true;
				dataWidget.config.order_by = ajax_sort_order.order_by;
				dataWidget.config.order_way = ajax_sort_order.order_way;
				curPage = 1;
				dataWidget.config.page = curPage;
				hasLastPage = false;
				$.ajax({
                    url: opPbder.ajax,
                    type: "POST",
                    data: dataWidget,
                    success: function(res) {
                        $itemsWrap.html(res.html);
						prestashop.emit('updatedProductAjax', null);
                    },
					error: function (xhr, ajaxOptions, thrownError) {
						console.error(thrownError);
					}
                }).always(function() {
					$sortLoaderIcon.hide();
                    $ajaxLoader.hide();
                    if (!hasLastPage) {
                        $trigger.show();
                    } else {
                        $trigger.hide();
                    }
                });
				
            }
        })
    }

    function infinitesProducts() {
        $('[data-infinite]').each(function() {
            var $this = $(this);
            var dataWidget = $this.data('infinite');			  
            $this.InfiniteAp(dataWidget);
            $this.removeAttr('data-infinite');
        })
    }
	
    $(document).ready(infinitesProducts);

    prestashop.on('mustUpdateInfinite', function (e) {
        infinitesProducts();
    });
	
})(jQuery);
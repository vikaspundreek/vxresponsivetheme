ACC.product = {

	bindAll: function() {
		ACC.product.bindToAddToCartForm();
		
		$('#carousel_modal').jcarousel({
			// Configuration goes here
			vertical: true,
			itemFallbackDimension: 512
		});
		
		$(".noaction").click(function(e) {
			e.preventDefault(); // preventing the screen from jumping since the hrefs are #
		});
		
		
	},

	bindToAddToCartForm: function() {
		var addToCartForm = $('.add_to_cart_form');
		addToCartForm.ajaxForm({success: ACC.product.displayAddToCartPopup});
	},

	displayAddToCartPopup: function(cartResult, statusText, xhr, formElement) {
		var productCode = $('[name=productCodePost]', formElement).val();
		var quantityField = $('[name=qty]', formElement).val();

		var quantity = 1;
		if (quantityField != undefined) {
			quantity = quantityField;
		}

		ACC.product.trackAddToCart(productCode, quantity, cartResult.cartData);

		$('#cart_popup').hide();
		$('#cart_popup').html(cartResult.cartPopupHtml);

		$('#add_to_cart_close').click(function(e) {
			e.preventDefault();
			$('#cart_popup').hide();
		});

		if(typeof refreshMiniCart == 'function') {
			refreshMiniCart();
		}

		$('#cart_popup').fadeIn();
		if (typeof timeoutId != 'undefined') {
			clearTimeout(timeoutId);
		}
		timeoutId = setTimeout(function() {$('#cart_popup').fadeOut();}, 5000);
		$.colorbox.close();
	},

	trackAddToCart: function(productCode, quantity, cartData) {
		window.mediator.publish('trackAddToCart',{
			productCode: productCode,
			quantity: quantity,
			cartData: cartData
		});
	},
	
	zoomImage: function() 
	{
		// jcarousel().jcarouse() is a workaround for a jcarousel bug.
		$('#carousel_modal').jcarousel({vertical: true}).jcarousel({
			vertical: true,
			itemFallbackDimension: 512
		});
		
		$(".noaction").click(function(e) {
			e.preventDefault(); // preventing the screen from jumping since the hrefs are #
		});
		
	}
	
	

};

$(document).ready(function() {
	ACC.product.bindAll();
});


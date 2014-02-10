ACC.address = {

	bindAll: function ()
	{
		$('div.checkout_summary_flow_c .change_address_button').on("click", this.handleChangeAddressButtonClick);

		this.bindCreateUpdateAddressForm();


		$.extend({
			postJSON: function (url, data, callback)
			{
				return jQuery.post(url, data, callback, "json");
			}
		});


	},

	handleChangeAddressButtonClick: function ()
	{

		$.getJSON(getDeliveryAddressesUrl, ACC.address.handleAddressDataLoad);

	},

	handleAddressDataLoad: function (data)
	{
		ACC.address.setupDeliveryAddressPopupForm(data);

		// Show the delivery address popup
		$.colorbox({
			inline: true,
			href: "#popup_checkout_delivery_address",
			overlayClose: false,
			onOpen: function() {
				// empty address form fields
				ACC.address.emptyAddressForm();
				$(document).on('change', '#saveAddress', function() {
					var saveAddressChecked = $(this).prop('checked');
					$('#defaultAddress').prop('disabled', !saveAddressChecked);
					if (!saveAddressChecked) {
						$('#defaultAddress').prop('checked', false);
					}
				});
			},
			onComplete: function() {
				ACC.common.refreshScreenReaderBuffer();
				$.colorbox.resize();
			},
			onClosed: function() {
				ACC.common.refreshScreenReaderBuffer();
			}
		});
	},

	setupDeliveryAddressPopupForm: function(data)
	{
		// Fill the available delivery addresses
		$('.delivery_addresses_list').html($('#deliveryAddressesTemplate').tmpl({addresses: data}));

		// Handle selection of address
		$('.delivery_addresses_list button.use_address').on("click", ACC.address.handleSelectExistingAddressClick);
		// Handle edit address
		$('.delivery_addresses_list button.edit').on("click", ACC.address.handleEditAddressClick);
		// Handle default address
		$('.delivery_addresses_list button.default').on("click", ACC.address.handleDefaultAddressClick);
	},

	emptyAddressForm: function ()
	{
		var addressId = $('.change_address_button').attr('data-address-id');
		var options = {
			url: getDeliveryAddressFormUrl,
			data: {addressId: '', createUpdateStatus: ''},
			type: 'GET',
			success: function (data)
			{
				$('#create_update_address_form_container_div').html(data);
				ACC.address.bindCreateUpdateAddressForm();
			}
		};

		$.ajax(options);
	},

	handleSelectExistingAddressClick: function ()
	{
		$.colorbox.toggleLoadingOverlay();
		var addressId = $(this).attr('data-address-id');
		$.postJSON(setDeliveryAddressUrl, {addressId: addressId}, ACC.address.handleSelectExitingAddressSuccess);
		return false;
	},

	handleEditAddressClick: function ()
	{
		var addressId = $(this).attr('data-address-id');
		var options = {
			url: getDeliveryAddressFormUrl,
			data: {addressId: addressId, createUpdateStatus: ''},
			target: '#create_update_address_form_container_div',
			type: 'GET',
			success: function (data)
			{
				ACC.address.bindCreateUpdateAddressForm();
				$.colorbox.resize();
			},
			error: function (xht, textStatus, ex)
			{
				alert("Failed to update cart. Error details [" + xht + ", " + textStatus + ", " + ex + "]");
			}
		};

		$(this).ajaxSubmit(options);
		return false;
	},

	handleDefaultAddressClick: function() {
		var addressId = $(this).attr('data-address');
		var options = {
			url: setDefaultAddressUrl,
			data: {addressId: addressId},
			type: 'GET',
			success: function(data) {
				ACC.address.setupDeliveryAddressPopupForm(data);
			},
			error: function(xht, textStatus, ex) {
				alert("Failed to update address book. Error details [" + xht + ", " + textStatus + ", " + ex + "]");
			}
		};

		$(this).ajaxSubmit(options);
		return false;
	},

	handleSelectExitingAddressSuccess: function (data)
	{
		if (data != null)
		{
			ACC.refresh.refreshPage(data);
			parent.$.colorbox.close();
		}
		else
		{
			alert("Failed to set delivery address");
		}
	},

	bindCreateUpdateAddressForm: function ()
	{
		$('.create_update_address_form').each(function ()
		{
			var options = {
				type: 'POST',
				beforeSubmit: function ()
				{
					$('#checkout_delivery_address').block({ message: "<img src='" + spinnerUrl + "' />" });
					$.colorbox.toggleLoadingOverlay();
				},
				success: function (data)
				{
					//alert(data);
					$('#create_update_address_form_container_div').html(data);
					var status = $('.create_update_address_id').attr('status');
					if (status != null && "success" == status.toLowerCase())
					{
						ACC.refresh.getCheckoutCartDataAndRefreshPage();
						parent.$.colorbox.close();
					}
					else
					{
						ACC.address.bindCreateUpdateAddressForm();
						$.colorbox.resize();
					}
				},
				error: function (xht, textStatus, ex)
				{
					alert("Failed to update cart. Error details [" + xht + ", " + textStatus + ", " + ex + "]");
				},
				complete: function ()
				{
					$('#checkout_delivery_address').unblock();
					$.colorbox.toggleLoadingOverlay();
				}
			};

			$(this).ajaxForm(options);
		});
	},

	refreshDeliveryAddressSection: function (data)
	{
		$('#checkout_summary_deliveryaddress_div').replaceWith($('#deliveryAddressSummaryTemplate').tmpl(data));

		//bind change address button
		$('div.checkout_summary_flow_c .change_address_button').click(this.handleChangeAddressButtonClick);
	}

};

$(document).ready(function ()
{
	// For IE browser to disable caching for ajax calls
	if ($.browser.msie)
	{
		$.ajaxSetup({ cache: false });
	}

	ACC.address.bindAll();
});











<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="formUtil" tagdir="/WEB-INF/tags/desktop/form" %>

<spring:url value="/checkout/single/summary/createUpdateDeliveryAddress.json" var="createUpdateDeliveryAddressUrl"/>
<c:choose>
	<c:when test="${showAddressForm}">
		<div class="span-10">
			<div class="item_container_holder" id="create_update_address_form_container_div">
				<div class="title_holder">
					<div class="title">
						<div class="title-top">
							<span></span>
						</div>
					</div>
					<h2><spring:theme code="checkout.summary.deliveryAddress"/></h2>
				</div>
				<div class="item_container">
					<p><spring:theme code="checkout.summary.deliveryAddress.useForNewAddress"/></p>

					<p><spring:theme code="address.required"/></p>
					<form:form method="post" commandName="addressForm" action="${createUpdateDeliveryAddressUrl}"
							   class="create_update_address_form">
	
							<form:hidden path="addressId" class="create_update_address_id"
										 status="${not empty createUpdateStatus ? createUpdateStatus : ''}"/>
							<formUtil:formSelectBox idKey="address.title" labelKey="address.title" path="titleCode"
													mandatory="true" skipBlank="false"
													skipBlankMessageKey="address.title.pleaseSelect"
													items="${titles}"/>
							<formUtil:formInputBox idKey="address.firstName" labelKey="address.firstName"
												   path="firstName"
												   inputCSS="text" mandatory="true"/>
							<formUtil:formInputBox idKey="address.surname" labelKey="address.surname" path="lastName"
												   inputCSS="text" mandatory="true"/>
							<formUtil:formInputBox idKey="address.line1" labelKey="address.line1" path="line1"
												   inputCSS="text" mandatory="true"/>
							<formUtil:formInputBox idKey="address.line2" labelKey="address.line2" path="line2"
												   inputCSS="text" mandatory="false"/>
							<formUtil:formInputBox idKey="address.townCity" labelKey="address.townCity"
												   path="townCity"
												   inputCSS="text" mandatory="true"/>
							<formUtil:formInputBox idKey="address.postcode" labelKey="address.postcode"
												   path="postcode"
												   inputCSS="text" mandatory="true"/>
							<formUtil:formSelectBox idKey="address.country" labelKey="address.country"
													path="countryIso"
													mandatory="true" skipBlank="false"
													skipBlankMessageKey="address.selectCountry" items="${countries}"
													itemValue="isocode"/>

							<form:hidden path="shippingAddress"/>
							<form:hidden path="billingAddress"/>
							<c:if test="${!edit}">
								<div class="left">
									<form:checkbox id="saveAddress" path="saveInAddressBook"/>
									<label for="saveAddress"><spring:theme code="checkout.summary.deliveryAddress.saveAddressInMyAddressBook"/></label>
								</div>
								<c:if test="${!noAddresses}">
									<div class="left">
										<form:checkbox id="defaultAddress" path="defaultAddress" disabled="true"/>
										<label for="defaultAddress"><spring:theme code="address.default"/></label>
									</div>
								</c:if>
							</c:if>

					<span style="display: block; clear: both;">
						<button type="submit" class="positive"><spring:theme
							code="${edit ? 'checkout.summary.deliveryAddress.saveAndUseThisAddress' :
							'checkout.summary.deliveryAddress.useThisAddress'}"/></button>
					</span>
					</form:form>
				</div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="span-10">
			<div id="create_update_address_form_container_div">
			</div>
		</div>
	</c:otherwise>
</c:choose>

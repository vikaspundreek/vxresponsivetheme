<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/desktop/template" %>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/desktop/cart" %>
<%@ taglib prefix="user" tagdir="/WEB-INF/tags/desktop/user" %>
<%@ taglib prefix="formUtil" tagdir="/WEB-INF/tags/desktop/form" %>
<%@ taglib prefix="checkout" tagdir="/WEB-INF/tags/desktop/checkout" %>
<%@ taglib prefix="single-checkout" tagdir="/WEB-INF/tags/desktop/checkout/single" %>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/desktop/common" %>
<%@ taglib prefix="breadcrumb" tagdir="/WEB-INF/tags/desktop/nav/breadcrumb" %>

<spring:url value="/checkout/single/placeOrder" var="placeOrderUrl" />
<spring:url value="/checkout/single/termsAndConditions" var="getTermsAndConditionsUrl" />

<template:page pageTitle="${pageTitle}">
	
	<script type="text/javascript">
		var getTermsAndConditionsUrl = "${getTermsAndConditionsUrl}";
	</script>

	<div id="breadcrumb" class="breadcrumb"></div>

	<div id="globalMessages">
		<common:globalMessages/>
	</div>

	<div class="span-4 side-content-slot cms_disp-img_slot">

	</div>

	<div class="span-24 last">

		<div class="span-24 last">
			<single-checkout:summaryFlow />
		</div>

		<div class="span-24 last place-order-top">
		
		<cms:pageSlot position="SideContent" var="feature" element="div" class="span-4 disp-img_left">
			<cms:component component="${feature}"/>
		</cms:pageSlot>
				
			<div class="span-20 last placeorder_right">
				<form:form action="${placeOrderUrl}" id="placeOrderForm1" commandName="placeOrderForm">
					<form:input type="hidden" id="securityCode1" class="securityCodeClass" path="securityCode"/>
					<button type="submit" class="positive right pad_right place-order show_processing_message" onclick="ACC.placeorder.placeOrderWithSecurityCode(1);return false;">
						<spring:theme code="checkout.summary.placeOrder"/>
					</button>
					<button type="button" class="positive right pad_right request-quote" id="requestQuoteButton">
						<spring:theme code="checkout.summary.negotiateQuote"/>
					</button>
					<button type="button" class="positive right pad_right schedule-replenishment" id="scheduleReplenishmentButton">
						<spring:theme code="checkout.summary.scheduleReplenishment"/>
					</button>
					<div class="terms left">
							<formUtil:formCheckbox idKey="Terms1" labelKey="checkout.summary.placeOrder.readTermsAndConditions"
								inputCSS="checkbox-input" labelCSS="checkbox-label" path="termsCheck" mandatory="true" />
					</div>
					 <cart:negotiateQuote/>
					 <cart:replenishmentScheduleForm/> 
				</form:form>
			
	
			<div class="span-20 last">
				<checkout:summaryCartItems cartData="${cartData}"/>
			</div>
	
			<div class="span-12">
				<cart:cartPromotions cartData="${cartData}"/>
			</div>
	
			<div class="span-8 right last place-order-cart-total">
				<cart:ajaxCartTotals/>
			</div>
	
			<div class="span-20 place-order-bottom">
				<form:form action="${placeOrderUrl}" id="placeOrderForm2" commandName="placeOrderForm">
					<form:input type="hidden" id="securityCode2" class="securityCodeClass" path="securityCode"/>
					<button type="submit" class="positive right pad_right place-order show_processing_message"  onclick="ACC.placeorder.placeOrderWithSecurityCode(2);return false;">
						<spring:theme code="checkout.summary.placeOrder"/>
					</button>
					<div class="terms right">
						<formUtil:formCheckbox idKey="Terms2" labelKey="checkout.summary.placeOrder.readTermsAndConditions"
								inputCSS="checkbox-input" labelCSS="checkbox-label" path="termsCheck" mandatory="true" />
					</div>
				</form:form>
			</div>
		</div>
	</div>
	
	
	
	</div>
</template:page>

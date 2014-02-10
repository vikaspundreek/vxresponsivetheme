<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/desktop/template" %>
<%@ taglib prefix="user" tagdir="/WEB-INF/tags/desktop/user" %>
<%@ taglib prefix="checkout" tagdir="/WEB-INF/tags/desktop/checkout" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="order" tagdir="/WEB-INF/tags/desktop/order" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/desktop/product" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/desktop/common" %>
<%@ taglib prefix="breadcrumb" tagdir="/WEB-INF/tags/desktop/nav/breadcrumb" %>

<template:page pageTitle="${pageTitle}">
	<div id="breadcrumb" class="breadcrumb">
		<breadcrumb:breadcrumb breadcrumbs="${breadcrumbs}"/>
	</div>

	<div id="globalMessages">
		<common:globalMessages/>
	</div>

	<cms:pageSlot position="SideContent" var="feature" element="div" class="span-4 side-content-slot cms_disp-img_slot">
		<cms:component component="${feature}"/>
	</cms:pageSlot>

	<div class="span-20 right last">
		<div class="span-20 your_order">
			<h1>
				<spring:theme code="checkout.orderConfirmation.thankYou" arguments="${orderData.code}"/>
			</h1>

			<p>
				<spring:theme code="checkout.orderConfirmation.copySentTo" arguments="${email}"/>
			</p>
		</div>

		<div class="span-20 last">
			<cms:pageSlot position="TopContent" var="feature" element="div" class="span-10 top-content-slot cms_disp-img_slot">
				<cms:component component="${feature}"/>
			</cms:pageSlot>
		</div>

		<div class="span-20 last delivery_stages">
			<div class="span-10">
				<order:paymentMethodItem order="${orderData}"/>
			</div>

			<div class="span-5">
				<order:deliveryAddressItem order="${orderData}"/>
			</div>

			<div class="span-5 last">
				<order:deliveryMethodItem order="${orderData}"/>
			</div>
		</div>

		<div class="span-20 last">
			<order:orderDetailsItem order="${orderData}"/>
			<div class="span-12">
				<order:receivedPromotions order="${orderData}"/>
			</div>
			<div class="span-8 right last">
				<order:orderTotalsItem order="${orderData}" containerCSS="positive"/>
			</div>
		</div>
	</div>
</template:page>

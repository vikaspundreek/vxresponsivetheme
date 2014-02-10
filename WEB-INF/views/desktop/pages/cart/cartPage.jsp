<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/desktop/template" %>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/desktop/cart" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/desktop/common" %>
<%@ taglib prefix="breadcrumb" tagdir="/WEB-INF/tags/desktop/nav/breadcrumb" %>

<spring:theme text="Your Shopping Cart" var="title" code="cart.page.title"/>
<c:url value="/cart/checkout" var="checkoutUrl"/>
<template:page pageTitle="${pageTitle}">
	<spring:theme code="basket.add.to.cart" var="basketAddToCart"/>
	<spring:theme code="cart.page.checkout" var="checkoutText"/>

	<div id="breadcrumb" class="breadcrumb">
		<breadcrumb:breadcrumb breadcrumbs="${breadcrumbs}"/>
	</div>
	<div id="globalMessages">
		<common:globalMessages/>
		<cart:cartRestoration/>
		<cart:cartValidation/>
	</div>
	<div class="span-24">
		<div class="span-20">
			<cms:pageSlot position="TopContent" var="feature" element="div" class="span-20 wide-content-slot cms_disp-img_slot">
				<cms:component component="${feature}"/>
			</cms:pageSlot>
			
			<c:if test="${not empty cartData.entries}">
				<c:url value="${continueUrl}" var="continueShoppingUrl"/>
				<div class="span-20">
					<div class="span-20">
					
						<form action="#" method="get" class="left">
							<button type="submit" class="form" onclick="window.location = '${continueShoppingUrl}'; return false">
								<spring:theme text="Continue Shopping" code="cart.page.continue"/>
							</button>
						</form>
						<a href="${checkoutUrl}" class="positive right">
							<theme:image code="img.addToCartIcon" alt="${basketAddToCart}" title="${basketAddToCart}"/>
							<spring:theme code="checkout.checkout" />
						</a>

						<span class="cart_total">
							<span><spring:theme text="Total:" code="basket.page.total" /></span> 
							<span><format:price priceData="${cartData.totalPrice}" /></span>
						</span>
					
					</div>
					<div class="span-20">

						<c:if test="${not empty message}">
							<br />
							<span class="errors">
								<spring:theme code="${message}"/>
							</span>
						</c:if>
					
						<div class="span-20">
							<cart:cartItems cartData="${cartData}"/>
						</div>
						<div class="span-12">
							<cart:cartPromotions cartData="${cartData}"/>
						</div>
						<div class="span-8 last right">
							<cart:cartTotals cartData="${cartData}"/>
						</div>
					</div>
					<div class="span-20 last">

						<form action="#" method="get">
							<button type="submit" class="form left" onclick="window.location = '${continueShoppingUrl}'; return false">
								<spring:theme text="Continue Shopping" code="cart.page.continue"/>
							</button>
						</form>
							
						<a href="${checkoutUrl}" class="positive right">
							<theme:image code="img.addToCartIcon" alt="${basketAddToCart}" title="${basketAddToCart}"/>
							<spring:theme code="checkout.checkout" />
						</a>
					</div>
				</div>
			</c:if>
			<c:if test="${empty cartData.entries}">
				<div class="span-20">
					<div class="span-20 wide-content-slot cms_disp-img_slot">
						<cms:pageSlot position="MiddleContent" var="feature" element="div">
							<cms:component component="${feature}"/>
						</cms:pageSlot>
						<cms:pageSlot position="BottomContent" var="feature" element="div">
							<cms:component component="${feature}"/>
						</cms:pageSlot>
					</div>
				</div>
			</c:if>
		</div>
		<div class="span-4 last">
			<c:if test="${not empty cartData.entries}">
				<div class="span-4">
					<cart:cartPotentialPromotions cartData="${cartData}"/>
				</div>
			</c:if>
			<cms:pageSlot position="SideContent" var="feature" element="div" class="span-4 narrow-content-slot cms_disp-img_slot">
				<cms:component component="${feature}"/>
			</cms:pageSlot>			
		</div>
	</div>
</template:page>

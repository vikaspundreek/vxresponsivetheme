<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="product" required="true" type="de.hybris.platform.commercefacades.product.data.ProductData" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/desktop/product" %>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/desktop/cart" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>

<spring:theme code="text.addToCart" var="addToCartText"/>
<c:url value="${product.url}" var="productUrl"/>

<div class="prod_list">
	<ycommerce:testId code="test_searchPage_wholeProduct">
	<a href="${productUrl}" title="${product.name}" class="productMainLink">
		<div class="thumb">
			<c:if test="${not empty product.averageRating}">
				<span class="stars large" style="display: inherit;">
					<span style="width: <fmt:formatNumber maxFractionDigits="0" value="${product.averageRating * 24}" />px;"></span>
				</span>
			</c:if>

				<product:productPrimaryImage product="${product}" format="thumbnail"/>
			<c:if test="${not empty product.potentialPromotions and not empty product.potentialPromotions[0].productBanner}">
				<img class="promo" src="${product.potentialPromotions[0].productBanner.url}" alt="${product.potentialPromotions[0].description}" title="${product.potentialPromotions[0].description}"/>
			</c:if>
		</div>

		<div class="details">
			<ycommerce:testId code="searchPage_productName_link_${product.code}">
					<h2>${product.name}</h2>
			</ycommerce:testId>
	
			<c:if test="${not empty product.summary}">
				<p>${product.summary}</p>
			</c:if>			
			
			<product:productListerClassifications product="${product}"/>

		</div>
		</a>
		<div class="cart">
			<ycommerce:testId code="searchPage_price_label_${product.code}">
				<p class="price">
					<format:price priceData="${product.price}"/>
				</p>
			</ycommerce:testId>
			<c:if test="${product.volumePricesFlag}">
				<span class="volumePricesFlag">
					<spring:theme code="text.volumePrices" var="volumePricesText"/>
					<theme:image code="img.volumePrices" alt="${volumePricesText}" title="${volumePricesText}" />
				</span>
			</c:if>
			<ycommerce:testId code="searchPage_addToCart_button_${product.code}">
			<c:set var="buttonType">submit</c:set>
			<c:if test="${product.stock.stockLevelStatus.code eq 'outOfStock' or empty product.price}">
				<c:set var="buttonType">button</c:set>
				<spring:theme code="text.addToCart.outOfStock" var="addToCartText"/>
			</c:if>
			<form id="addToCartForm${product.code}" action="<c:url value="/cart/add"/>" method="post" class="add_to_cart_form">
				<input type="hidden" name="productCodePost" value="${product.code}"/>
				<button type="${buttonType}" class="positive large <c:if test="${fn:contains(buttonType, 'button')}">out-of-stock</c:if>" <c:if test="${fn:contains(buttonType, 'button')}">disabled="true" aria-disabled="true"</c:if>>
					<theme:image code="img.addToCartIcon" alt="${addToCartText}" title="${addToCartText}"/>
					${addToCartText}
				</button>
			</form>
			</ycommerce:testId>
		</div>
	</ycommerce:testId>
</div>

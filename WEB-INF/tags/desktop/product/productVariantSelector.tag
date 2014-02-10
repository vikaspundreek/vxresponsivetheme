<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>

<%@ attribute name="product" required="true" type="de.hybris.platform.commercefacades.product.data.ProductData" %>
<%@ variable name-given="showAddToCart" variable-class="java.lang.Boolean" scope="AT_END" %>

<%-- Determine if product is one of apparel style or size variant --%>
		<c:if test="${product.variantType eq 'ApparelStyleVariantProduct'}">
			<c:set var="variantStyles" value="${product.variantOptions}" />
		</c:if>
		<c:if test="${(not empty product.baseOptions[0].options) and (product.baseOptions[0].variantType eq 'ApparelStyleVariantProduct')}">
			<c:set var="variantStyles" value="${product.baseOptions[0].options}" />
			<c:set var="variantSizes" value="${product.variantOptions}" />
			<c:set var="currentStyleUrl" value="${product.url}" />
		</c:if>
		<c:if test="${(not empty product.baseOptions[1].options) and (product.baseOptions[0].variantType eq 'ApparelSizeVariantProduct')}">
			<c:set var="variantStyles" value="${product.baseOptions[1].options}" />
			<c:set var="variantSizes" value="${product.baseOptions[0].options}" />
			<c:set var="currentStyleUrl" value="${product.baseOptions[1].selected.url}" />
		</c:if>
		
		<%-- Determine if product is other variant --%>
		<c:if test="${empty variantStyles}">
			<c:if test="${not empty product.variantOptions}">
				<c:set var="variantOptions" value="${product.variantOptions}" />
			</c:if>
			<c:if test="${not empty product.baseOptions[0].options}">
				<c:set  var="variantOptions" value="${product.baseOptions[0].options}" />
			</c:if>
		</c:if>

		<c:if test="${not empty variantStyles}">
			<c:set var="showAddToCart" value="${false}" />
			<div class="variant_options">
				<div class="colour">
					<p><spring:theme code="product.variants.colour"/></p>
					<ul>
						<c:forEach items="${variantStyles}" var="variantStyle">
							<c:forEach items="${variantStyle.variantOptionQualifiers}" var="variantOptionQualifier">
								<c:if test="${variantOptionQualifier.qualifier eq 'style'}">
									<c:set var="styleValue" value="${variantOptionQualifier.value}" />
									<c:set var="imageData" value="${variantOptionQualifier.image}" />
								</c:if>
							</c:forEach>
							<li <c:if test="${variantStyle.url eq currentStyleUrl}">class="selected"</c:if>>
								<c:url value="${variantStyle.url}" var="productStyleUrl"/>
								<a href="${productStyleUrl}" class="colorVariant" name="${variantStyle.url}">
									<c:if test="${not empty imageData}">
										<img src="${imageData.url}" title="${styleValue}" alt="${styleValue}"/>
									</c:if>
									<c:if test="${empty imageData}">
										<span class="swatch_colour_a" title="${styleValue}"></span>
									</c:if>
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="size">
					<form>
						<dl>
							<dt class="left"><label for="Size"><spring:theme code="product.variants.size"/></label></dt>
							<dd class="left">
								<select id="Size">
									<c:if test="${empty variantSizes}">
										<option selected="selected"><spring:theme code="product.variants.select.style"/></option>
									</c:if>
									<c:if test="${not empty variantSizes}">
										<option <c:if test="${empty variantParams['size']}">selected="selected"</c:if>><spring:theme code="product.variants.select.size"/></option>
										<c:forEach items="${variantSizes}" var="variantSize">

											<c:set var="optionsString" value="" />
											<c:forEach items="${variantSize.variantOptionQualifiers}" var="variantOptionQualifier">
												<c:if test="${variantOptionQualifier.qualifier eq 'size'}">
													<c:set var="optionsString">${optionsString} ${variantOptionQualifier.name} ${variantOptionQualifier.value}, </c:set>
												</c:if>
											</c:forEach>

											<c:if test="${(variantSize.stock.stockLevel gt 0) and (variantSize.stock.stockLevelStatus ne 'outOfStock')}">
												<c:set var="stockLevel">${variantSize.stock.stockLevel} <spring:theme code="product.variants.in.stock"/></c:set>
											</c:if>
											<c:if test="${(variantSize.stock.stockLevel le 0) and (variantSize.stock.stockLevelStatus eq 'inStock')}">
												<c:set var="stockLevel"><spring:theme code="product.variants.available"/></c:set>
											</c:if>
											<c:if test="${(variantSize.stock.stockLevel le 0) and (variantSize.stock.stockLevelStatus ne 'inStock')}">
												<c:set var="stockLevel"><spring:theme code="product.variants.out.of.stock"/></c:set>
											</c:if>

											<c:if test="${(variantSize.url eq product.url)}">
												<c:set var="showAddToCart" value="${true}" />
											</c:if>

											<option value="${variantSize.url}" ${(variantSize.url eq product.url) ? 'selected="selected"' : ''}>
												${optionsString} <format:price priceData="${variantSize.priceData}"/>&nbsp;&nbsp;${variantSize.stock.stockLevel}
											</option>
										</c:forEach>
									</c:if>
								</select>
							</dd>
						</dl>
					</form>
					<a href="#"><spring:theme code="product.variants.size.guide"/></a>
				</div>
			</div>
		</c:if>
		<c:if test="${not empty variantOptions}">
			<div class="variant_options">
				<div class="size">
					<select id="variant">
						<option selected="selected" disabled="disabled"><spring:theme code="product.variants.select.variant"/></option>
						<c:forEach items="${variantOptions}" var="variantOption">
							<c:set var="optionsString" value="" />
							<c:forEach items="${variantOption.variantOptionQualifiers}" var="variantOptionQualifier">
								<c:set var="optionsString">${optionsString}&nbsp;${variantOptionQualifier.name}&nbsp;${variantOptionQualifier.value}, </c:set>
							</c:forEach>

							<c:if test="${(variantOption.stock.stockLevel gt 0) and (variantSize.stock.stockLevelStatus ne 'outOfStock')}">
								<c:set var="stockLevel">${variantOption.stock.stockLevel} <spring:theme code="product.variants.in.stock"/></c:set>
							</c:if>
							<c:if test="${(variantOption.stock.stockLevel le 0) and (variantSize.stock.stockLevelStatus eq 'inStock')}">
								<c:set var="stockLevel"><spring:theme code="product.variants.available"/></c:set>
							</c:if>
							<c:if test="${(variantOption.stock.stockLevel le 0) and (variantSize.stock.stockLevelStatus ne 'inStock')}">
								<c:set var="stockLevel"><spring:theme code="product.variants.out.of.stock"/></c:set>
							</c:if>

							<c:choose>
								<c:when test="${product.purchasable and product.stock.stockLevelStatus.code ne 'outOfStock' }">
									<c:set var="showAddToCart"  value="${true}" />
								</c:when>
								<c:otherwise>
									<c:set var="showAddToCart" value="${false}" />
								</c:otherwise>
							</c:choose>

							<c:url value="${variantOption.url}" var="variantOptionUrl"/>
							<option value="${variantOptionUrl}" ${(variantOption.url eq product.url) ? 'selected="selected"' : ''}>
								${optionsString}&nbsp;<format:price priceData="${variantOption.priceData}"/>&nbsp;&nbsp;${variantOption.stock.stockLevel}
							</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</c:if>
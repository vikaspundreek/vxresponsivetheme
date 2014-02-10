<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/desktop/template" %>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/desktop/nav" %>
<%@ taglib prefix="formUtil" tagdir="/WEB-INF/tags/desktop/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/desktop/common" %>
<%@ taglib prefix="breadcrumb" tagdir="/WEB-INF/tags/desktop/nav/breadcrumb" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>

<spring:url value="/my-company/organization-management/manage-units/details/"
			var="cancelUrl">
	<spring:param name="unit" value="${uid}"/>
</spring:url>
<c:choose>
	<c:when test="${not empty addressData.id}">
		<spring:url value="/my-company/organization-management/manage-units/edit-address/"
					var="actionUrl">
			<spring:param name="unit" value="${uid}"/>
			<spring:param name="addressId" value="${addressData.id}"/>
		</spring:url>
	</c:when>
	<c:otherwise>
		<spring:url value="/my-company/organization-management/manage-units/add-address/"
					var="actionUrl">
			<spring:param name="unit" value="${uid}"/>
		</spring:url>
	</c:otherwise>
</c:choose>

<template:page pageTitle="${pageTitle}">
	<div id="breadcrumb" class="breadcrumb">
		<breadcrumb:breadcrumb breadcrumbs="${breadcrumbs}"/>
		<common:back cancelUrl="${cancelUrl}"/>
	</div>
	<div id="globalMessages">
		<common:globalMessages/>
	</div>
	<nav:myCompanyNav selected="units"/>
	<div class="span-20 last">
		<div class="item_container_holder">
			<div class="title_holder">
				<div class="title">
					<div class="title-top">
						<span></span>
					</div>
				</div>
				<h2>
					<spring:theme code="text.company.manage.units.addressForm.${empty addressData.id?'create':'edit'}.header" arguments="${unitName}"/>
				</h2>
			</div>
			<div class="item_container">
				<p>
					<spring:theme code="text.account.addressBook.addEditform"
								  text="Please use this form to add/edit an address."/>
				</p>
				<p class="required">
					<spring:theme code="form.required" text="Fields marked * are required"/>
				</p>
				<form:form action="${actionUrl}" method="post" commandName="addressForm">
				
						<formUtil:formSelectBox idKey="address.title" labelKey="address.title" path="titleCode"
												mandatory="true" skipBlank="false"
												skipBlankMessageKey="address.title.pleaseSelect" items="${titleData}"
												selectedValue="${addressForm.titleCode}"/>
						<formUtil:formInputBox idKey="address.firstName" labelKey="address.firstName" path="firstName"
											   inputCSS="text" mandatory="true"/>
						<formUtil:formInputBox idKey="address.surname" labelKey="address.surname" path="lastName"
											   inputCSS="text" mandatory="true"/>
						<formUtil:formInputBox idKey="address.line1" labelKey="address.line1" path="line1"
											   inputCSS="text" mandatory="true"/>
						<formUtil:formInputBox idKey="address.line2" labelKey="address.line2" path="line2"
											   inputCSS="text" mandatory="false"/>
						<formUtil:formInputBox idKey="address.townCity" labelKey="address.townCity" path="townCity"
											   inputCSS="text" mandatory="true"/>
						<formUtil:formInputBox idKey="address.postcode" labelKey="address.postcode" path="postcode"
											   inputCSS="text" mandatory="true"/>
						<formUtil:formSelectBox idKey="address.country" labelKey="address.country" path="countryIso"
												mandatory="true" skipBlank="false"
												skipBlankMessageKey="address.selectCountry" items="${countryData}"
												itemValue="isocode" selectedValue="${addressForm.countryIso}"/>
				

					<ycommerce:testId code="UnitAddress_Cancel_button">
						<a href="${cancelUrl}" class="mycompany form cancel"><spring:theme code="text.company.manage.unit.address.cancelButton" text="Cancel"/></a>
					</ycommerce:testId>
					<ycommerce:testId code="UnitAddress_SaveAddress_button">
						<button type="submit" class="mycompany form save"><spring:theme code="text.company.manage.unit.saveAddress" text="Save"/></button>
					</ycommerce:testId>

				</form:form>
			</div>
		</div>
	</div>
</template:page>

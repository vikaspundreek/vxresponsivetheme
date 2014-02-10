<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/desktop/template" %>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/desktop/nav" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/desktop/common" %>
<%@ taglib prefix="breadcrumb" tagdir="/WEB-INF/tags/desktop/nav/breadcrumb" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="formUtil" tagdir="/WEB-INF/tags/desktop/form"%>

<spring:url
	value="/my-company/organization-management/manage-costcenters/disable"
	var="confirmDisableUrl" >
	<spring:param name="costCenterCode" value="${costCenterCode}"/>
</spring:url>
<spring:url
	value="/my-company/organization-management/manage-costcenters/view"
	var="cancelDisableUrl" >
	<spring:param name="costCenterCode" value="${costCenterCode}"/>
</spring:url>

<template:page pageTitle="${pageTitle}">

<div id="breadcrumb" class="breadcrumb">
		<breadcrumb:breadcrumb breadcrumbs="${breadcrumbs}"/>
	</div>
	<nav:myCompanyNav selected="costCenters"/>
	<div class="span-20 last">
		<div class="item_container_holder">
			<div class="title_holder">
				<div class="title">
					<div class="title-top">
						<span></span>
					</div>
				</div>
				<h2><spring:theme code="text.company.costCenter.disable.confirm" text="Confirm Disable"/></h2>
			</div>
			<div class="item_container">
				<p><spring:theme code="text.company.costCenter.disable.confirm.message"/></p>
				<div style="display: block; clear: both;">
					
						<ycommerce:testId code="cancelCCdisable">
						<a href="${cancelDisableUrl}" class="mycompany left no-confirm"><spring:theme code="text.company.costCenter.disable.confirm.no" /></a>
						</ycommerce:testId>
					
					<form:form action="${confirmDisableUrl}">
						<ycommerce:testId code="confirmCCdisable">
							<button type="submit" class="mycompany confirm"><spring:theme code="text.company.costCenter.disable.confirm.yes" /></button> 
						</ycommerce:testId>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</template:page>

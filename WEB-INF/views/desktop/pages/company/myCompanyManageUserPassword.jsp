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

<spring:url
	value="/my-company/organization-management/manage-users/resetpassword"
	var="resetpasswordUrl">
	<spring:param name="user" value="${customerResetPasswordForm.uid}"/>
</spring:url>

<template:page pageTitle="${pageTitle}">
	<div id="breadcrumb" class="breadcrumb">
		<breadcrumb:breadcrumb breadcrumbs="${breadcrumbs}"/>
	</div>
	<div id="globalMessages">
		<common:globalMessages/>
	</div>
	<nav:myCompanyNav selected="users" />
	<div class="span-20 last">
		<div class="item_container_holder">
			<div class="title_holder">
				<div class="title">
					<div class="title-top">
						<span></span>
					</div>
				</div>
				<h2><spring:theme code="text.manageuser.restpasswordform" text="Reset Password"/></h2>
			</div>
			<div class="item_container">
				<p><spring:theme code="text.manageuser.password" text="Please enter and confirm new password" arguments="${customerResetPasswordForm.uid}"/></p>
				<p class="required"><spring:theme code="form.required" text="Fields marked * are required"/></p>
				<form:form action="${resetpasswordUrl}" method="post"
							commandName="customerResetPasswordForm" autocomplete="off">
				
						<form:input type="hidden" name="uid" path="uid" id="uid" />
						<formUtil:formPasswordBox idKey="profile-newPassword" labelKey="profile.newPassword" path="newPassword" inputCSS="text password strength" mandatory="true"/>
						<formUtil:formPasswordBox idKey="profile.checkNewPassword" labelKey="profile.checkNewPassword" path="checkNewPassword" inputCSS="text password" mandatory="true"/>
					
					
						<button class="mycompany form confirm"><spring:theme code="text.account.profile.updatePasswordForm" text="Update Password"/></button>

				</form:form>
			</div>
		</div>
	</div>
</template:page>

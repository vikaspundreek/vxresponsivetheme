<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%@ attribute name="b2BUnitForm" required="true"
			  type="de.hybris.platform.yb2bacceleratorstorefront.forms.B2BUnitForm" %>
<%@ attribute name="formUrl" required="true"
			  type="java.lang.String" %>
<%@ attribute name="cancelUrl" required="true"
			  type="java.lang.String" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>

<p>
	<spring:theme code="text.company.manage.units.editForm"
				  text="Please use this form to update bussiness unit details"/>
</p>

<p class="required">
	<spring:theme code="form.required" text="Fields marked * are required"/>
</p>
<form:form action="${formUrl}" method="post" commandName="b2BUnitForm">
		<form:input type="hidden" name="originalUid" path="originalUid" id="originalUid"/>
		<formUtil:formInputBox idKey="b2bunit.id" labelKey="b2bunit.id"
							   path="uid" inputCSS="text" mandatory="true"/>
		<formUtil:formInputBox idKey="b2bunit.name" labelKey="b2bunit.name"
							   path="name" inputCSS="text" mandatory="true"/>
		<formUtil:formSelectBox idKey="b2bunit.parent" labelKey="b2bunit.parent"
								path="parentUnit"
								mandatory="false" skipBlank="false"
								skipBlankMessageKey="form.select.empty"
								items="${branchSelectOptions}"/>
		<formUtil:formSelectBox idKey="b2bunit.approvalProcess" labelKey="b2bunit.approvalProcess"
								path="approvalProcessCode"
								mandatory="false" skipBlank="false"
								skipBlankMessageKey="form.select.empty"
								items="${businessProcesses}"/>
							
		<ycommerce:testId code="Unit_Cancel_button">
			<a href="${cancelUrl}" class="mycompany form no-confirm"><spring:theme code="b2bunit.cancel" text="Cancel"/></a>
		</ycommerce:testId>

		<ycommerce:testId code="Unit_SaveChange_button">
			<button type="submit" class="mycompany form confirm"><spring:theme code="b2bunit.save" text="Save Updates"/></button>
		</ycommerce:testId>
							
</form:form>

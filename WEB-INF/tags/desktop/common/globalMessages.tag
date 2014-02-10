<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring"  uri="http://www.springframework.org/tags"%>

<%-- Information (confirmation) messages --%>
<c:if test="${not empty accConfMsgs}">
	<div class="span-24">
		<c:forEach items="${accConfMsgs}" var="msg">
			<div class="information_message positive">
				<span class="single"></span>
				<p><spring:theme code="${msg.code}" arguments="${msg.attributes}"/></p>
			</div>
		</c:forEach>
	</div>
</c:if>

<%-- Warning messages --%>
<c:if test="${not empty accInfoMsgs}">
	<div class="span-24">
		<c:forEach items="${accInfoMsgs}" var="msg">
			<div class="information_message neutral">
				<span class="single"></span>
				<p><spring:theme code="${msg.code}" arguments="${msg.attributes}"/></p>
			</div>
		</c:forEach>
	</div>
</c:if>

<%-- Error messages (includes spring validation messages)--%>
<c:if test="${not empty accErrorMsgs}">
	<div class="span-24">
		<c:forEach items="${accErrorMsgs}" var="msg">
			<div class="information_message negative">
				<span class="single"></span>
				<p><spring:theme code="${msg.code}" arguments="${msg.attributes}"/></p>
			</div>
		</c:forEach>
	</div>
</c:if>
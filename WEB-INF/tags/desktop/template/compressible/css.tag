<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>

<%-- colorbox CSS --%>
<link rel="stylesheet" type="text/css" media="screen" href="${commonResourcePath}/css/jquery.colorbox-1.3.16.css"/>

<%-- BeautyTips CSS --%>
<link rel="stylesheet" type="text/css" media="screen" href="${commonResourcePath}/css/jquery.bt-0.9.5.css" />

<%-- blueprintcss --%>
<link rel="stylesheet" type="text/css" media="screen" href="${commonResourcePath}/blueprint/screen.css" />

<%-- jQuery UI CSS --%>
<link rel="stylesheet" type="text/css" media="screen" href="${commonResourcePath}/css/jquery.ui.stars-3.0.1.custom.css" />
<link rel="stylesheet" type="text/css" media="screen" href="${commonResourcePath}/css/jquery.ui.autocomplete-1.8.18.css" />

<%-- treeview CSS --%>
<link rel="stylesheet" type="text/css" media="screen" href="${commonResourcePath}/css/jquery.treeview.css"/>

<%-- scrollplus CSS --%>
<link rel="stylesheet" type="text/css" media="screen" href="${commonResourcePath}/css/jquery.scrollplus.css"/>

<%--  AddOn Common CSS files --%>
<c:forEach items="${addOnCommonCssPaths}" var="addOnCommonCss">
	   <link rel="stylesheet" type="text/css" media="all" href="${addOnCommonCss}" />
</c:forEach>

<%-- theme specific css --%>
<link rel="stylesheet" type="text/css" media="screen" href="${themeResourcePath}/css/theme-green.css" />

<%-- B2B css --%>
<link rel="stylesheet" type="text/css" media="screen" href="${themeResourcePath}/css/theme-green-b2b.css" />

<%-- Responsive Theme --%> 

<link rel="stylesheet" type="text/css"  media="screen" href="${themeResourcePath}/css/responsivegrid.css" />


<link rel="stylesheet" type="text/css"  media="screen" href="${themeResourcePath}/css/responsiveslides.css" />

<%--  AddOn Theme CSS files --%>
<c:forEach items="${addOnThemeCssPaths}" var="addOnThemeCss">
	   <link rel="stylesheet" type="text/css" media="all" href="${addOnThemeCss}" />
</c:forEach>

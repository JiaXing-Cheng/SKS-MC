<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<%@ include file="/plf/common/pub_meta.jsp" %>
	    <title><dict:lang value="公用页面" /></title>
		<jsp:include page="/plf/common/pub_head.jsp" />
	</head>
	<frameset rows="*" cols="270,*" border="4" bordercolor="#D2E0F2" framespacing="2">
	    <frame src="${path}plf/page/bussmodel/usercustom/commPageTree.jsp?<s:property value="@com.more.fw.core.common.method.Constants@FUNC_CODE"/>=F34" name="leftFrame" id="leftFrame"  scrolling="auto" style="border-right: 1px solid #99BBE8;" />
	    <frame src="${path}sys/UserCustomAction_listCommPage.ms?<s:property value="@com.more.fw.core.common.method.Constants@FUNC_CODE"/>=F30&shMap.UP_ID=<s:property value="@com.more.fw.core.common.method.Constants@COMM_PAGE_ROOT_ID"/>" name="mainFrame" id="mainFrame"  scrolling="auto" style="border-right: 1px solid #99BBE8;" />
	</frameset>
	<noframes>
		<body><dict:lang value="无法显示 frameset" />
		</body>
	</noframes>
<%@ include file="/plf/common/pub_end.jsp" %>
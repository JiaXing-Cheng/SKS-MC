<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@ include file="/plf/common/pub_tag.jsp" %>
	<head>
		<title><dict:lang value="公用类列表" /></title>
		<%@ include file="/plf/common/pub_meta.jsp" %>
		<jsp:include page="/plf/common/pub_head.jsp">
			<jsp:param name="popDivWin" value="1" />
			<jsp:param name="layui" value="1" />
			<jsp:param name="pageWidth" value="1" />
		</jsp:include>
	</head>
<body>

<div class="">	
	<div>
	<form id="searchForm" name="searchForm" action="${path}sys/MClzMgrAction_listCommClass.ms" method="post">
			<s:hidden name="%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}" />
			<s:hidden name="paraMap.MID" />
			<input type="hidden" id="page_currentPage" name="page.currentPage" value="<c:out value='${page.currentPage}' />"  />
			<input type="hidden" id="page_pageRecord" name="page.pageRecord" value="<c:out value='${page.pageRecord}' />"  />
		
				<table class="search_table">
					<tr>
						<td>
							<div class="search_table_wrap">
								<span><dict:lang value="编号" /></span>
				  				<s:textfield id="paraMap_ID" name="paraMap.ID" cssClass="input_sh" maxlength="300" />
							</div>
							<div class="search_table_wrap">
								<span><dict:lang value="类名称" /></span>
				  				<s:textfield id="paraMap_CLASS_NAME" name="paraMap.CLASS_NAME" cssClass="input_sh" maxlength="300" />
							</div>
							<div class="search_table_wrap">
								<span><dict:lang value="类说明" /></span>
				  				<s:textfield id="paraMap_CLASS_DESC" name="paraMap.CLASS_DESC" cssClass="input_sh" maxlength="300" />
							</div>
							<div class="search_table_wrap">
								<input type="button" value="<dict:lang value="查询" />" onclick="query(this)"  class="layui-btn" />
								<input type="button" value="<dict:lang value="新增" />" onclick="add(this)"  class="layui-btn" />
							</div>
						</td>
						<%-- 
						<td width="100%">
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="编号" /></div>
								<div class ="search_value">
								<s:textfield id="paraMap_ID" name="paraMap.ID" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="类名称" /></div>
								<div class ="search_value">
								<s:textfield id="paraMap_CLASS_NAME" name="paraMap.CLASS_NAME" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<div class="search_div">
								<div  style="width: 94px;white-space: nowrap;overflow:hidden;text-overflow: ellipsis;" class="search_text" ><dict:lang value="类说明" /></div>
								<div class ="search_value">
								<s:textfield id="paraMap_CLASS_DESC" name="paraMap.CLASS_DESC" cssClass="input_sh" maxlength="300" cssStyle="width:132px;" />
								</div>
							</div>
							<input type="button" value="<dict:lang value="查询" />" onclick="query(this)"  class="botton_img_add" />
						</td>
						--%>
					</tr>
				</table>
	</form>
	<div class="table_div">
    <table id="listTable" class="table_list table-left" >
		<thead>
		<tr class="tdcolor">
			<th width="40px;"><dict:lang value="序号" /></th>
			<%-- <th width="5%"><dict:lang value="编号" /></th> --%>
			<th><dict:lang value="类名称" /></th>
			<th width="150px;"><dict:lang value="类说明" /></th>
			<th width="100px;"><dict:lang value="类编号" /></th>
			<!-- 
			<th><dict:lang value="上级类" /></th>
			<th><dict:lang value="类型" /></th>
			 -->
			<th width="130px;"><dict:lang value="操作" />
			   <%--  <bu:funOper funcNo="F143" type="a" href="add('@{funcUrl}','%{id}');" ><img src="${IMG_PATH}/button_add.gif?_mc_res_version=<%=PlfStaticRes.BUTTON_ADD_GIF %>" /></bu:funOper>
			   --%>
			</th>
		</tr>
		</thead>
		<tbody>
	<s:iterator value="page.dataList" status="index">
		<tr>
			<td><s:property value="#index.count"/></td>
			<%-- <td><div style="width:80px;" class="nowrap_ellipsis" ><s:property value="ID"/></div></td> --%>
			<td title="<s:property value="CLASS_NAME"/>"><s:property value="CLASS_NAME"/></td>
			<td title="<s:property value="CLASS_DESC"/>"><s:property value="CLASS_DESC"/></td>
			<td title="<s:property value="MS_CLASS_CODE_ID"/>"><s:property value="MS_CLASS_CODE_ID"/></td>
			<!-- 
			<td><div style="width:80px;" class="nowrap_ellipsis" ><s:property value="UP_DESC"/></div></td>
			<td><div style="width:50px;" class="nowrap_ellipsis" ><s:property value="MS_CLASS_TYPE_NAME"/></div></td>
			 -->
			 <td>
			 	<a href="javascript:view('<s:property value="MS_CLASS_CODE_ID"/>')" class="layui-btn layui-btn-normal layui-btn-xs"><dict:lang value="查看" /></a>
				<a href="javascript:update('<s:property value="ID"/>')" class="layui-btn  layui-btn-xs"><dict:lang value="修改" /></a>
				<a href="javascript:void(0);" onclick="del('<s:property value="ID"/>');" class="layui-btn layui-btn-danger layui-btn-xs"><dict:lang value="删除" /></a>
			</td>
			<%--
			<td>
				<a href="javascript:view('<s:property value="MS_CLASS_CODE_ID"/>')" title="<dict:lang value="查看" />"><img src="${IMG_PATH}/m_view.gif?_mc_res_version=<%=PlfStaticRes.M_VIEW_GIF %>" /></a>||
				<a href="javascript:update('<s:property value="ID"/>')" title="<dict:lang value="修改" />" ><img src="${IMG_PATH}/ContImg08.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG08_GIF %>" /></a>
				||<a href="javascript:void(0);" onclick="del('<s:property value="ID"/>');" title="<dict:lang value="删除" />" ><img src="${IMG_PATH}/ContImg10.gif?_mc_res_version=<%=PlfStaticRes.CONTIMG10_GIF %>" /></a>
			</td>
			--%>
		</tr>
	</s:iterator>
	</tbody>
	</table>
	</div>
	</div>
	<%-- <div class="center">
		<s:include value="/plf/common/pagination.jsp?formId=searchForm" />
	</div> --%>
	<div id="currentPageDiv" class="table_div"></div>
	<s:include value="/plf/common/layui_pagination.jsp" />

</div>

	<form id="submitForm" name="submitForm" action="" target="submitFrame" method="post">
		<input type="hidden" id="del_id" name="paraMap.ID" />
	</form>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0" ></iframe>
	</div>

<script type="text/javascript">
	
	function query(thisObj){
		//_pageCurrentPageObj.value="1";
		document.forms.searchForm.submit();
		thisObj.onclick = function(){util.alert(util.submit_default_info);}
		util.showTopLoading();
	}
	
	$(function(){
		$("#listTable").removeAttr("style");
	});
	
	function alertInfo(msg){
		util.alert(msg);
	}
	
	function reloadPg(msg){
		if(null !=msg){
			util.alert(msg,reloadPgExe);
		}
	}
	
	function reloadPgExe(){
		document.forms.searchForm.submit();
		util.showTopLoading();
	}
	
	function getUpId(){
		return $("#funcDtoSh_upId").val();
	}
	
	function add(url){
		url = "${path}sys/MClzMgrAction_showAddCommClass.ms?paraMap.MID=<s:property value='paraMap.MID' />"+"&mcIframeName="+window.parent.name;
		showPopWin(url, 400, 250,null,"<dict:lang value="类管理" /> <dict:lang value="新增" />");
	}
	var isModify=false;
	function closePopCbFun(){
		if(isModify){
			reloadPg();
		}
		return true;
	}
	
	function update(id){
		var url = "${path}sys/MClzMgrAction_showEditCommClass.ms?paraMap.ID="+id+"&mcIframeName="+window.parent.name;
		//window.top.showPopWin(url, "95%", "100%",closePopCbFun,"<dict:lang value="自定义类" /> <dict:lang value="修改" />");
		showPopWin(url, 400, 300,closePopCbFun,"<dict:lang value="类管理" /> <dict:lang value="修改" />");
	}
	
	var delId = "";
	function del(id){
		util.confirm(delConfirm);
		delId = id;
	}
	
	function delConfirm(){
    document.forms.submitForm.action="${path}sys/MClzMgrAction_delCommClass.ms";
		$("#del_id").val(delId);
		document.forms.submitForm.submit();
	}
	
	function init(){
		var tableTrJs = $("#listTable tbody tr");
		_toClickColor(tableTrJs);
		_tongLineColor(tableTrJs);
	}

	function view(id){
		if(null==id||""==id){
			util.alert("类编号为空不能查看！");
			return;
		}
		var url = "${path}sys/MClzMgrAction_showView.ms?paraMap.CODE_ID="+id;
		showPopWin(url, '99%', '99%',closePopCbFun,"<dict:lang value="类管理" /> <dict:lang value="查看" />");
	}
</script>

<jsp:include page="/plf/common/pub_dom.jsp">
	<jsp:param name="popConfirm" value="1" />
</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp" %>
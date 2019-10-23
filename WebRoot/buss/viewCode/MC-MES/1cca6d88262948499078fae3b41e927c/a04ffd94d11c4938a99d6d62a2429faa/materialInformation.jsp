<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
    <title>
        <dict:lang value="异步-物料信息" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
    <bu:header formId ="013c4606017841b6b4e7f01e2a32d0a6"/>

</head>

<body  scroll="auto" style="overflow: auto;">
<div class="content-in">
    <div class="dlist">
        <div class="hd">
            <bu:func viewId="15e211df6f9d435088ad89c31837ef5f" />
        </div>
        <div class="bd">
            <div class="search-box">
                <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                    <input type="hidden" name="exeid" value="${exeid}" />
                    <input type="hidden" name="searchParaShowState" id="searchParaShowState" value="${paraMap.searchParaShowState}" />
                    <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
                    <bu:search viewId="15e211df6f9d435088ad89c31837ef5f" />
                    <!--      <table class="search_table">
      <tbody><tr><td><div class="group"><div class="name" title="模糊">物料号</div><div class="dec"><input type="text" class="input" id="CI_ITEM_CODE" name="searchParaList[1]._PAGE_SEARCH_VALUE" value onkeypress="_checkEnterSeach(event);" save_mark="0"><script>    $(function()
       {
         var obj = document.getElementById("CI_ITEM_CODE");
         var json = {"UI_RULE":"unlimited","UI_RULE_TIP":"","SAVE_MARK":""};
         obj.validateJson = json;
         addLoadEvent(function ()
         {
         initValidate(obj);
         });
       });</script></div><input type="hidden" name="searchParaList[1].ID" value="85555b234b4d488181396ced5b5d0cee"></div></td><td><div class="group"><div class="name" title="模糊">物料描述</div><div class="dec"><input type="text" class="input" id="CI_ITEM_NAME" name="searchParaList[2]._PAGE_SEARCH_VALUE" value onkeypress="_checkEnterSeach(event);" save_mark="0"><script>    $(function()
       {
         var obj = document.getElementById("CI_ITEM_NAME");
         var json = '';
         obj.validateJson = json;
         addLoadEvent(function ()
         {
         initValidate(obj);
         });
       });</script></div><input type="hidden" name="searchParaList[2].ID" value="7ee5ef9546274e5bb3c51ef8c562e62c"></div></td><td><div class="group"><div class="name" title="模糊">存货代码</div><div class="dec"><input type="text" class="input" id="STOCK_CODE" name="searchParaList[3]._PAGE_SEARCH_VALUE" value onkeypress="_checkEnterSeach(event);" save_mark="0"><script>    $(function()
       {
         var obj = document.getElementById("STOCK_CODE");
         var json = '';
         obj.validateJson = json;
         addLoadEvent(function ()
         {
         initValidate(obj);
         });
       });</script></div><input type="hidden" name="searchParaList[3].ID" value="fca26a7d6bb34b6788500920d7b9790f"></div></td></tr></tbody></table>-->


                </form>
                <a href="javascript:void(0);" class="more"></a>
            </div>
            <form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
                <input type="hidden" name="exeid" value="${exeid}" />
                <s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
                <input type="hidden" name="formPage013c4606017841b6b4e7f01e2a32d0a6" id="formPage013c4606017841b6b4e7f01e2a32d0a6" value="${formPage013c4606017841b6b4e7f01e2a32d0a6}"/>
                <input type="hidden" name="formId" id="formId1" value='013c4606017841b6b4e7f01e2a32d0a6'/>
                <input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
                <input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
                <input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
                <div class="panel-ajax datagrid datagrid-div1"  id="013c4606017841b6b4e7f01e2a32d0a6">
                    <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajax013c4606017841b6b4e7f01e2a32d0a6" style="">
                        <div class="datagrid-header">
                            <div class="datagrid-header-inner" id="datagrid-header-inner013c4606017841b6b4e7f01e2a32d0a6">
                                <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable013c4606017841b6b4e7f01e2a32d0a6" style="min-width:1260px">
                                    <s:set name="_$type" value="'view'" />
                                    <tbody class="isParentsTitle">
                                    <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
                                        <td class="datagrid-cell" style="width:30px; text-align:center;" ><bu:thSeq  formId="013c4606017841b6b4e7f01e2a32d0a6" i18n="1"/></td>
                                        <td class="datagrid-cell" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_013c4606017841b6b4e7f01e2a32d0a6" onclick="_selectAjaxTableAllData(this,'013c4606017841b6b4e7f01e2a32d0a6')" style="cursor: pointer;"title="全选"/></span></td>
                                        <td class="datagrid-cell" style="width:200px;display:none;"><bu:uitn colNo="DATA_AUTH" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
                                        <!--	<td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CI_ITEM_CODE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
                                        <td class="datagrid-cell" style="width:230px;"><bu:uitn colNo="CI_ITEM_NAME" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
                                        <td class="datagrid-cell" style="width:150px;"><bu:uitn colNo="CI_ITEM_SPEC" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
                                        <td class="datagrid-cell" style="width:70px"><bu:uitn colNo="CI_ITEM_TYPE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
                                        <td class="datagrid-cell" style="width:70px"><bu:uitn colNo="CI_ITEM_GENRE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
                                        <td class="datagrid-cell" style="width:90px"><bu:uitn colNo="CI_MIN_PACK" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
                                        <td class="datagrid-cell" style="width:80px; text-align:center;"><bu:uitn colNo="CREATE_USER" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
                                        <td class="datagrid-cell" style="width:140px"><bu:uitn colNo="CREATE_TIME" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
                                        <td class="datagrid-cell"  style="width:140px"><bu:uitn colNo="EDIT_TIME" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td> -->
                                        <td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CI_ITEM_CODE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
                                        <td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="CI_ITEM_NAME" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
                                        <td class="datagrid-cell" style="width:90px; text-align:center;"><bu:uitn colNo="CI_ITEM_SPEC" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
                                        <td class="datagrid-cell" style="width:100px; text-align:center;"><bu:uitn colNo="STOCK_CODE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
                                        <td class="datagrid-cell" style="width:100px; text-align:center;"><bu:uitn colNo="SAP_COLOR_CODE" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
                                        <td class="datagrid-cell" style="width:100px; text-align:center;"><bu:uitn colNo="SAP_LEVEL_GROUP" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
                                        <td class="datagrid-cell" style="width:90px; text-align:center;"><bu:uitn colNo="SAP_GROSS_WEIGHT" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
                                        <td class="datagrid-cell" style="width:90px; text-align:center;"><bu:uitn colNo="SAP_NET_WEIGHT" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
                                        <td class="datagrid-cell" style="width:90px; text-align:center;"><bu:uitn colNo="SAP_WEIGHT_UNIT" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
                                        <td class="datagrid-cell" style="width:90px; text-align:center;"><bu:uitn colNo="SAP_BASE_UNIT" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
                                        <td class="datagrid-cell" style="width:90px; text-align:center;"><bu:uitn colNo="SAP_IS_DEL" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
                                        <td class="datagrid-cell" style="width:150px; text-align:center;"><bu:uitn colNo="SAP_IS_CONFIG" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
                                        <td class="datagrid-cell" style="width:200px; text-align:center;"><bu:uitn colNo="CI_MEMO" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
                                        <td class="datagrid-cell" style="width:90px; text-align:center;; text-align:center;"><bu:uitn colNo="CREATE_USER" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
                                        <td class="datagrid-cell" style="width:140px"><bu:uitn colNo="CREATE_TIME" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td>
                                        <td class="datagrid-cell"  style="width:140px"><bu:uitn colNo="EDIT_TIME" formId="013c4606017841b6b4e7f01e2a32d0a6" /></td
                                    </bu:tr>
                                    </tbody>
                                </bu:table>
                            </div>
                        </div>
                        <div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv013c4606017841b6b4e7f01e2a32d0a6" onscroll="ajaxTableScroll(this,'013c4606017841b6b4e7f01e2a32d0a6')">
                            <table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax013c4606017841b6b4e7f01e2a32d0a6" style="min-width:1260px">
                                <tbody id="tbody_013c4606017841b6b4e7f01e2a32d0a6" class="isParents">
                                </tbody>
                            </table>		</div>
                    </div>
                </div>
                <c:if test="${formPage013c4606017841b6b4e7f01e2a32d0a6==1}">			<div class="center">
                <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=013c4606017841b6b4e7f01e2a32d0a6&showLoading=0" />
            </div>
                </c:if>
        </div>

        <input type="hidden" name="tableCount" id="tableCount" value='1' />

        </form>
    </div>
</div>
</div>
<bu:submit viewId="15e211df6f9d435088ad89c31837ef5f" />
<bu:script viewId="15e211df6f9d435088ad89c31837ef5f" />
<script type="text/javascript">

    // 主列表
    function listAjaxTable(formId){
        var currentPage="";
        var pageRecord="";
        var isFirstLoad;
        var url = "${path}buss/bussModel_listMsData.ms";
        var searchParams = $("#searchForm").serialize()+"&"+$("#searchFormTop").serialize();
        if(isPage(formId)){
            var isFirstLoad = firstLoadThisPage(formId);
            var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[formId].currentPage;
            var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[formId].pageRecord;
        }
        //util.showLoading("处理中...");
        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data:searchParams +"&page.currentPage="+currentPage+"&page.pageRecord=" + pageRecord,
            success: function(data){
                if(data.RES){
                    var ms = new MSdata(data);
                    var page = ms.page(formId);
                    createTableModel(ms,formId);
                    if(isPage(formId)){
                        initPage(page,formId);
                    }
                    clearChildTable();
                }else{
                    utilsFp.confirmIcon(3,"","","", data.RES_MSG,"","260","145");
                }
            },
            error: function(msg){
                utilsFp.confirmIcon(3,"","","", msg,"","260","145");
            }
        });
    }

    // 判断是否分页
    function isPage(formId){
        var isPageVal =  $("#formPage"+formId).val();
        if(isPageVal =="1"){
            return true;
        }
        return false;
    }

    // 查询
    function query(thisObj){
        var formId = $("#formId1").val();
        listAjaxTable(formId);
    }

    // 清空表格
    function clearChildTable(){
        $(".isChilds").empty();
        getFormIdInitChildPage();
    }

    // 当出现滚动条时动态设置表格宽度
    function setTableWidth(formId){
        /**
         *var scrollHeight = $("#tableDiv"+formId)[0].scrollHeight;
         var height = $("#tableDiv"+formId).height();
         var datagridHeaderWidth = $("#datagrid-view-ajax"+formId+" .datagrid-header").width();
         if(scrollHeight-height>0){
          $("#datagrid-htable"+formId).css("width",datagridHeaderWidth-20+'px');
          $("#datagrid-btable-ajax"+formId).css("width",datagridHeaderWidth-20+'px');
        }else{
          $("#datagrid-htable"+formId).css("width",datagridHeaderWidth+'px');
          $("#datagrid-btable-ajax"+formId).css("width",datagridHeaderWidth+'px');
        }
         *
         */
    }


    function alertInfo(msg){
        utilsFp.alert(msg);
    }

    // 清空全选
    function clearAllSelect(){
        $(".left-datagrid-title-ajax,.datagrid-title-ajax").find("input[type='checkbox']").prop("checked",false);
    }

    function reloadPg(msg,title,width,height,time){
        msgPop(msg,"",title,width,height,time);
    }

    // 子列表
    function listChildAjaxTable(formId,paramList){
        var data = {
            "paraMap.formidFirstId":_GLO_FORM_PAGE_MAP[formId].formidFirstId,
            "paraMap.subFormId":_GLO_FORM_PAGE_MAP[formId].subFormId,
            "paraMap.subRelColId":_GLO_FORM_PAGE_MAP[formId].subRelColId,
            "paraMap.relColVal":_GLO_FORM_PAGE_MAP[formId].relColVal,
            "paraMap.subSortCol":_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColStr,
            "paraMap.subSortColOrder":_GLO_FORM_PAGE_MAP[_GLO_subFormId]._subSortColOrderStr
        };
        if(isPage(formId)){
            data["page.currentPage"] = _GLO_FORM_PAGE_MAP[formId].currentPage;
            data["page.pageRecord"] = _GLO_FORM_PAGE_MAP[formId].pageRecord;
        }
        if(paramList != null && paramList != ""){
            data["paramList"] = paramList;
        }
        var url = "${path}buss/bussModel_listMsCasData.ms?exeid=${exeid}";
        $.ajax({
            type: "POST",
            dataType: "json",
            url: url,
            data:data,
            success: function(data){
                if(data.RES){
                    var ms = new MSdata(data);
                    var page = ms.page(formId);
                    createTableModel(ms,formId);
                    if(isPage(formId)){
                        initPage(page,formId);
                    }
                }else{
                    utilsFp.confirmIcon(3,"","","", data.RES_MSG,"","260","145");
                }
            },
            error: function(msg){
                utilsFp.confirmIcon(3,"","","", msg,"","260","145");
            }
        });
    }
    // 数据为空时设置横向滚动条
    function setCrossWiseScroll(formId,arrHtml){
        if(arrHtml.length==0){
            var tableWidth = $("#datagrid-btable-ajax"+formId).width();
            var tableHeight =
                arrHtml.push("<tr  style='width: ");
            arrHtml.push(tableWidth+"px");
            arrHtml.push(";");
            arrHtml.push("height:1000px;'");
            $("#tableDiv"+formId).css({"overflow-y":"hidden","overflow-x":"auto"});
        }else{
            $("#tableDiv"+formId).css({"overflow-y":"auto","overflow-x":"auto"});
        }
    }


    // 初始化子分页
    function initChildPage(formId){
        var ajaxPage = new Object();
        ajaxPage.currentPage = 1;
        ajaxPage.pageRecord = 20;
        ajaxPage.totalRecord = 0;
        ajaxPage.totalPage = 1;
        ajaxPage.first = true;
        ajaxPage.last = true;
        pageFun(ajaxPage,formId);
    }


    // 初始化分页插件
    function initPage(page,formId){
        var ajaxPage = new Object();
        ajaxPage.currentPage = parseInt(page.currentPage);
        ajaxPage.pageRecord = parseInt(page.pageRecord);
        ajaxPage.totalPage = parseInt(page.totalPage);
        ajaxPage.totalRecord = parseInt(page.totalRecord);
        ajaxPage.first = page.first;
        ajaxPage.last = page.last;
        pageFun(ajaxPage,formId);
    };

    // 判断是否首次异步访问
    function firstLoadThisPage(formId){
        if(typeof(_GLO_FORM_PAGE_MAP[formId].currentPage) =="undefined"){
            return true;
        }
        return false;
    }

    // 初始化子表单
    function getFormIdInitChildPage(){
        var tableCount = $("#tableCount").val();
        for ( var i = 2; i <= tableCount; i++) {
            var formId = $("#formId"+i).val();
            if(isPage(formId)){
                initChildPage(formId);
            }
        }
    }

    function init(){

        if($(".leftTable-ajax").length>0){
            $(".leftTable-ajax").show();
        };
        getFormIdInitChildPage();
        var jumpId = $("#jumpId").val();
        if(jumpId!=""){
            $("#CI_ITEM_CODE").val(jumpId);

        }

        listAjaxTable($("#formId1").val());
        <s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
    }

    $(function(){
        var colNo = $("#relColVals").val();
        var subRelColIds = $("#subRelColIds").val();
        var subFormIds = $("#subFormIds").val();
        if(subRelColIds!="null"){
            var formId1 = $("#formId1").val();
            $(".isParents tr").live("click",function(){
                var _this = $(this);
                var relColVals = "";
                var abbr = _this.attr("abbr");
                var arrColNo = colNo.split(",");
                $(arrColNo).each(function(i,v){
                    var childVal = $("tr[abbr='"+abbr+"']").find("input[type='hidden']").val();
                    relColVals += childVal+",";
                });
                setSubData(formId1,subFormIds,subRelColIds,relColVals,"","",true);
            });
        };
    });
</script>
<script>
    var isFirstSetScroll=0;
    //生成异步表格
    function createTableModel(ms,formId){
        var arrHtml = [];
        var arrLeftHtml = [];
        var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
        var trClass = ms.trClass(formId);
        var trStyle = ms.trStyle(formId);
        var trEvent = ms.trEvent(formId);
        if(formId=='013c4606017841b6b4e7f01e2a32d0a6'){<%--物料信息--%>
            $.each(uiTxt,function(i,v){
                var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
                arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
                if($("#"+formId).find(".left-datagrid-title-ajax").length>0){
                    arrLeftHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
                    arrLeftHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
                    arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
                    arrLeftHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
                    arrLeftHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                    arrLeftHtml.push("</td>");
                }else{
                    arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
                    arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
                    arrHtml.push("<td class='datagrid-cell' style='width:30px;text-align:center;' ><span class='_noedit'>");
                    arrHtml.push("<input type='checkbox' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                    arrHtml.push("</td>");
                }
                arrHtml.push("<td colno='DATA_AUTH' class='datagrid-cell TD_DATA_AUTH"+ms.tdClass(formId, 'DATA_AUTH')+"' style='width:200px;text-align:center;display:none;"+ms.tdStyle(formId, 'DATA_AUTH')+"' "+ms.tdEvent(formId, 'DATA_AUTH')+">")
                arrHtml.push("<span colno='DATA_AUTH' class='"+ms.uiClass(formId, 'DATA_AUTH')+"' style='"+ms.uiStyle(formId, 'DATA_AUTH')+"' "+ms.uiEvent(formId, 'DATA_AUTH')+" title='"+v.CI_ITEM_CODE+"'>"+v['DATA_AUTH']+"</span><input type='hidden' id='DATA_AUTH_ID_"+v['ID']+"' value='"+v['DATA_AUTH_ID']+"' />  ")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CI_ITEM_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CI_ITEM_CODE')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'CI_ITEM_CODE')+"' "+ms.tdEvent(formId, 'CI_ITEM_CODE')+">")
                arrHtml.push("<span colno='CI_ITEM_CODE' class='"+ms.uiClass(formId, 'CI_ITEM_CODE')+"' style='"+ms.uiStyle(formId, 'CI_ITEM_CODE')+"' "+ms.uiEvent(formId, 'CI_ITEM_CODE')+" title='"+v.CI_ITEM_CODE+"'>"+v['CI_ITEM_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CI_ITEM_NAME' class='datagrid-cell "+ms.tdClass(formId, 'CI_ITEM_NAME')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'CI_ITEM_NAME')+"' "+ms.tdEvent(formId, 'CI_ITEM_NAME')+">")
                arrHtml.push("<span colno='CI_ITEM_NAME' class='"+ms.uiClass(formId, 'CI_ITEM_NAME')+"' style='"+ms.uiStyle(formId, 'CI_ITEM_NAME')+"' "+ms.uiEvent(formId, 'CI_ITEM_NAME')+" title='"+v.CI_ITEM_NAME+"'>"+v['CI_ITEM_NAME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CI_ITEM_SPEC' class='datagrid-cell "+ms.tdClass(formId, 'CI_ITEM_SPEC')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'CI_ITEM_SPEC')+"' "+ms.tdEvent(formId, 'CI_ITEM_SPEC')+">")
                arrHtml.push("<span colno='CI_ITEM_SPEC' class='"+ms.uiClass(formId, 'CI_ITEM_SPEC')+"' style='"+ms.uiStyle(formId, 'CI_ITEM_SPEC')+"' "+ms.uiEvent(formId, 'CI_ITEM_SPEC')+" title='"+v.CI_ITEM_SPEC+"'>"+v['CI_ITEM_SPEC']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='STOCK_CODE' class='datagrid-cell "+ms.tdClass(formId, 'STOCK_CODE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'STOCK_CODE')+"' "+ms.tdEvent(formId, 'STOCK_CODE')+">")
                arrHtml.push("<span colno='STOCK_CODE' class='"+ms.uiClass(formId, 'STOCK_CODE')+"' style='"+ms.uiStyle(formId, 'STOCK_CODE')+"' "+ms.uiEvent(formId, 'STOCK_CODE')+" title='"+v.STOCK_CODE+"'>"+v['STOCK_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='SAP_COLOR_CODE' class='datagrid-cell "+ms.tdClass(formId, 'SAP_COLOR_CODE')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'SAP_COLOR_CODE')+"' "+ms.tdEvent(formId, 'SAP_COLOR_CODE')+">")
                arrHtml.push("<span colno='SAP_COLOR_CODE' class='"+ms.uiClass(formId, 'SAP_COLOR_CODE')+"' style='"+ms.uiStyle(formId, 'SAP_COLOR_CODE')+"' "+ms.uiEvent(formId, 'SAP_COLOR_CODE')+" title='"+v.SAP_COLOR_CODE+"'>"+v['SAP_COLOR_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='SAP_LEVEL_GROUP' class='datagrid-cell "+ms.tdClass(formId, 'SAP_LEVEL_GROUP')+"' style='width:100px;text-align:center;"+ms.tdStyle(formId, 'SAP_LEVEL_GROUP')+"' "+ms.tdEvent(formId, 'SAP_LEVEL_GROUP')+">")
                arrHtml.push("<span colno='SAP_LEVEL_GROUP' class='"+ms.uiClass(formId, 'SAP_LEVEL_GROUP')+"' style='"+ms.uiStyle(formId, 'SAP_LEVEL_GROUP')+"' "+ms.uiEvent(formId, 'SAP_LEVEL_GROUP')+" title='"+v.SAP_LEVEL_GROUP+"'>"+v['SAP_LEVEL_GROUP']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='SAP_GROSS_WEIGHT' class='datagrid-cell "+ms.tdClass(formId, 'SAP_GROSS_WEIGHT')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'SAP_GROSS_WEIGHT')+"' "+ms.tdEvent(formId, 'SAP_GROSS_WEIGHT')+">")
                arrHtml.push("<span colno='SAP_GROSS_WEIGHT' class='"+ms.uiClass(formId, 'SAP_GROSS_WEIGHT')+"' style='"+ms.uiStyle(formId, 'SAP_GROSS_WEIGHT')+"' "+ms.uiEvent(formId, 'SAP_GROSS_WEIGHT')+" title='"+v.SAP_GROSS_WEIGHT+"'>"+v['SAP_GROSS_WEIGHT']+"</span>")
                arrHtml.push("</td>");

                arrHtml.push("<td colno='SAP_NET_WEIGHT' class='datagrid-cell "+ms.tdClass(formId, 'SAP_NET_WEIGHT')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'SAP_NET_WEIGHT')+"' "+ms.tdEvent(formId, 'SAP_NET_WEIGHT')+">")
                arrHtml.push("<span colno='SAP_NET_WEIGHT' class='"+ms.uiClass(formId, 'SAP_NET_WEIGHT')+"' style='"+ms.uiStyle(formId, 'SAP_NET_WEIGHT')+"' "+ms.uiEvent(formId, 'SAP_NET_WEIGHT')+" title='"+v.SAP_NET_WEIGHT+"'>"+v['SAP_NET_WEIGHT']+"</span>")
                arrHtml.push("</td>");

                arrHtml.push("<td colno='SAP_WEIGHT_UNIT' class='datagrid-cell "+ms.tdClass(formId, 'SAP_WEIGHT_UNIT')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'SAP_WEIGHT_UNIT')+"' "+ms.tdEvent(formId, 'SAP_WEIGHT_UNIT')+">")
                arrHtml.push("<span colno='SAP_WEIGHT_UNIT' class='"+ms.uiClass(formId, 'SAP_WEIGHT_UNIT')+"' style='"+ms.uiStyle(formId, 'SAP_WEIGHT_UNIT')+"' "+ms.uiEvent(formId, 'SAP_WEIGHT_UNIT')+" title='"+v.SAP_WEIGHT_UNIT+"'>"+v['SAP_WEIGHT_UNIT']+"</span>")
                arrHtml.push("</td>");

                arrHtml.push("<td colno='SAP_BASE_UNIT' class='datagrid-cell "+ms.tdClass(formId, 'SAP_BASE_UNIT')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'SAP_BASE_UNIT')+"' "+ms.tdEvent(formId, 'SAP_BASE_UNIT')+">")
                arrHtml.push("<span colno='SAP_BASE_UNIT' class='"+ms.uiClass(formId, 'SAP_BASE_UNIT')+"' style='"+ms.uiStyle(formId, 'SAP_BASE_UNIT')+"' "+ms.uiEvent(formId, 'SAP_BASE_UNIT')+" title='"+v.SAP_BASE_UNIT+"'>"+v['SAP_BASE_UNIT']+"</span>")
                arrHtml.push("</td>");

                arrHtml.push("<td colno='SAP_IS_DEL' class='datagrid-cell "+ms.tdClass(formId, 'SAP_IS_DEL')+"' style='width:90px;text-align:center;"+ms.tdStyle(formId, 'SAP_IS_DEL')+"' "+ms.tdEvent(formId, 'SAP_IS_DEL')+">")
                arrHtml.push("<span colno='SAP_IS_DEL' class='"+ms.uiClass(formId, 'SAP_IS_DEL')+"' style='"+ms.uiStyle(formId, 'SAP_IS_DEL')+"' "+ms.uiEvent(formId, 'SAP_IS_DEL')+" title='"+v.SAP_IS_DEL+"'>"+v['SAP_IS_DEL']+"</span>")
                arrHtml.push("</td>");

                arrHtml.push("<td colno='SAP_IS_CONFIG' class='datagrid-cell "+ms.tdClass(formId, 'SAP_IS_CONFIG')+"' style='width:150px;text-align:center;"+ms.tdStyle(formId, 'SAP_IS_CONFIG')+"' "+ms.tdEvent(formId, 'SAP_IS_CONFIG')+">")
                arrHtml.push("<span colno='SAP_IS_CONFIG' class='"+ms.uiClass(formId, 'SAP_IS_CONFIG')+"' style='"+ms.uiStyle(formId, 'SAP_IS_CONFIG')+"' "+ms.uiEvent(formId, 'SAP_IS_CONFIG')+" title='"+v.SAP_IS_CONFIG+"'>"+v['SAP_IS_CONFIG']+"</span>")
                arrHtml.push("</td>");

                arrHtml.push("<td colno='CI_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'CI_MEMO')+"' style='width:200px;text-align:center;"+ms.tdStyle(formId, 'CI_MEMO')+"' "+ms.tdEvent(formId, 'CI_MEMO')+">")
                arrHtml.push("<span colno='CI_MEMO' class='"+ms.uiClass(formId, 'CI_MEMO')+"' style='"+ms.uiStyle(formId, 'CI_MEMO')+"' "+ms.uiEvent(formId, 'CI_MEMO')+" title='"+v.CI_MEMO+"'>"+v['CI_MEMO']+"</span>")
                arrHtml.push("</td>");

                arrHtml.push("<td colno='CREATE_USER' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_USER')+"' style='width:90px;text-align:center;;"+ms.tdStyle(formId, 'CREATE_USER')+"' "+ms.tdEvent(formId, 'CREATE_USER')+">")
                arrHtml.push("<span colno='CREATE_USER' class='"+ms.uiClass(formId, 'CREATE_USER')+"' style='"+ms.uiStyle(formId, 'CREATE_USER')+"' "+ms.uiEvent(formId, 'CREATE_USER')+" title='"+v.CREATE_USER+"'>"+v['CREATE_USER']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_TIME' class='datagrid-cell "+ms.tdClass(formId, 'CREATE_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'CREATE_TIME')+"' "+ms.tdEvent(formId, 'CREATE_TIME')+">")
                arrHtml.push("<span colno='CREATE_TIME' class='"+ms.uiClass(formId, 'CREATE_TIME')+"' style='"+ms.uiStyle(formId, 'CREATE_TIME')+"' "+ms.uiEvent(formId, 'CREATE_TIME')+" title='"+v.CREATE_TIME+"'>"+v['CREATE_TIME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='EDIT_TIME' class='datagrid-cell "+ms.tdClass(formId, 'EDIT_TIME')+"' style='width:140px;text-align:center;"+ms.tdStyle(formId, 'EDIT_TIME')+"' "+ms.tdEvent(formId, 'EDIT_TIME')+">")
                arrHtml.push("<span colno='EDIT_TIME' class='"+ms.uiClass(formId, 'EDIT_TIME')+"' style='"+ms.uiStyle(formId, 'EDIT_TIME')+"' "+ms.uiEvent(formId, 'EDIT_TIME')+" title='"+v.EDIT_TIME+"'>"+v['EDIT_TIME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
            });
            if($("#leftTableDiv"+formId).length>0){
                $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
            }
            setCrossWiseScroll(formId,arrHtml);
            $("#tbody_"+formId).html(arrHtml.join(""));
        }
        setNumColWidth(formId);
        clearAllSelect();
        //setTableWidth(formId);
        if(isFirstSetScroll == 0){
            isFirstSetScroll =1;
            setScroll();
        }
    }
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17" />
    <jsp:param name="location" value="pageOver" />
</jsp:include>

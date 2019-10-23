<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17" />
    <jsp:param name="location" value="beforePageLoad" />
</jsp:include>
<head>
    <title>
        <dict:lang value="LEO-工单节点查询" />
    </title>
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1" />
        <jsp:param name="datePicker" value="1" />
        <jsp:param name="chosen" value="1" />
        <jsp:param name="msData" value="1" />
        <jsp:param name="scroll" value="1" />
        <jsp:param name="jqueryprint" value="1" />

    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp"%>
    <bu:header formId ="b827b6c4fede48ee8a411a4866072eae"/>


    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="inHead" />
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->


    <object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
        <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
    </object>

</head>

<body>
<div class="content-in">
    <div class="dlist">
        <div class="hd">
            <bu:func viewId="bb1278d984614648b32c75f0914bc916" />
        </div>
        <div class="bd">
            <div class="search-box">
                <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                        <jsp:param name="modelName" value="VIEW_TYPE_17" />
                        <jsp:param name="location" value="searchForm" />
                    </jsp:include>


                    <table class="search_table">
                        <bu:search deal_mark="1" viewId="bb1278d984614648b32c75f0914bc916" />

                    </table>

                </form>
                <a href="javascript:void(0);" class="more"></a>
            </div>
            <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                    <jsp:param name="modelName" value="VIEW_TYPE_17" />
                    <jsp:param name="location" value="listForm" />
                </jsp:include>
                <input type="hidden" name="formPageb827b6c4fede48ee8a411a4866072eae" id="formPageb827b6c4fede48ee8a411a4866072eae" value="${formPageb827b6c4fede48ee8a411a4866072eae}"/>

                <input type="hidden" name="formId" id="formId1" value='b827b6c4fede48ee8a411a4866072eae'/>
                <!--
                <input type="hidden" name="formId" id="formId2" value='2f1adeb396c4403b8fea545ec6311111'/>
                <input type="hidden" name="formId" id="formId3" value='2f1adeb396c4403b8fea545ec6312222'/>
                <input type="hidden" name="formId" id="formId4" value='2f1adeb396c4403b8fea545ec6313333'/>
                <input type="hidden" name="formId" id="formId5" value='2f1adeb396c4403b8fea545ec6314444'/>
                <input type="hidden" name="formId" id="formId6" value='2f1adeb396c4403b8fea545ec6315555'/>
                <input type="hidden" name="formId" id="formId7" value='2f1adeb396c4403b8fea545ec6316666'/>-->
                <input type="hidden" name="jumpId" id="jumpId" value='${param.jumpId}'/>
                <input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
                <input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
                <div class="panel-ajax datagrid datagrid-div1"  id="b827b6c4fede48ee8a411a4866072eae">
                    <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxb827b6c4fede48ee8a411a4866072eae" style="">
                        <div class="datagrid-header">
                            <div class="datagrid-header-inner" id="datagrid-header-innerb827b6c4fede48ee8a411a4866072eae">
                                <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htableb827b6c4fede48ee8a411a4866072eae">
                                    <s:set name="_$type" value="'view'" />
                                    <tbody class="isParentsTitle">
                                    <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
                                        <td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;" ><bu:thSeq  formId="b827b6c4fede48ee8a411a4866072eae" i18n="1"/></td>
                                        <td class="datagrid-cell no-print" style="width:30px; text-align:center"><span><input type="checkbox" id="selectAll_b827b6c4fede48ee8a411a4866072eae" onclick="_selectAjaxTableAllData(this,'b827b6c4fede48ee8a411a4866072eae')" style="cursor: pointer;"title="全选"/></span></td>
                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
                                            <bu:uitn colNo="PROJECT_ID" formId="b827b6c4fede48ee8a411a4866072eae"/></td>
                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
                                            <bu:uitn colNo="PROJECT_STATUS" formId="b827b6c4fede48ee8a411a4866072eae"/></td>

                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
                                            <bu:uitn colNo="LOT_NUMBER" formId="b827b6c4fede48ee8a411a4866072eae"/></td>

                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
                                            <bu:uitn colNo="PRODUCT_MATERIAL" formId="b827b6c4fede48ee8a411a4866072eae"/></td>

                                        <td class="datagrid-cell" style="text-align:center;width:150px;">
                                            <bu:uitn colNo="PRODUCT_NAME" formId="b827b6c4fede48ee8a411a4866072eae"/></td>


                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
                                            <bu:uitn colNo="PRODUCT_COUNT" formId="b827b6c4fede48ee8a411a4866072eae"/></td>

                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
                                            <bu:uitn colNo="PROJECT_SORT" formId="b827b6c4fede48ee8a411a4866072eae"/></td>

                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
                                            <bu:uitn colNo="REL_NUM" formId="b827b6c4fede48ee8a411a4866072eae"/></td>

                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
                                            <bu:uitn colNo="CREATE_USER" formId="b827b6c4fede48ee8a411a4866072eae"/></td>
                                        <td class="datagrid-cell" style="text-align:center;width:100px;">
                                            <bu:uitn colNo="CREATE_TIME" formId="b827b6c4fede48ee8a411a4866072eae"/></td>
                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
                                            <bu:uitn colNo="EDIT_USER" formId="b827b6c4fede48ee8a411a4866072eae"/></td>
                                        <td class="datagrid-cell" style="text-align:center;width:130px;">
                                            <bu:uitn colNo="EDIT_TIME" formId="b827b6c4fede48ee8a411a4866072eae"/></td>
                                    </bu:tr>
                                    </tbody>
                                </bu:table>
                            </div>
                        </div>
                        <div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivb827b6c4fede48ee8a411a4866072eae" onscroll="ajaxTableScroll(this,'b827b6c4fede48ee8a411a4866072eae')">
                            <table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxb827b6c4fede48ee8a411a4866072eae">
                                <tbody id="tbody_b827b6c4fede48ee8a411a4866072eae" class="isParents">
                                </tbody>
                            </table>		</div>
                    </div>
                </div>
                <c:if test="${formPageb827b6c4fede48ee8a411a4866072eae==1}">			<div class="center">
                    <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=b827b6c4fede48ee8a411a4866072eae&showLoading=0" />
                </div>
                </c:if>

                <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
                    <div class="hd" style="background-color: #f6f5f7;height: 35px;">
                        <div class="optn" style="top:45px;right:30px;">
                            <button type="button" onclick="printset_17('b827b6c4fede48ee8a411a4866072eae','1');">打印</button>
                        </div>
                    </div>
                    <div style="height: 390px;overflow:auto;border-top: 1px solid #eaeaea;">
                        <table id="printset_tab" class="basic-table" style="text-align: center;margin-top:10px;">
                            <tr>
                                <td style="width: 100px;text-align: right;">列字段</td>
                                <td style="padding-left: 5px;">是否打印</td>
                                <td style="padding-left: 5px;">打印列宽</td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>序号</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="SEQ" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="SEQ" value="30" title_name="序号" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>SAP工单</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PROJECT_ID" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PROJECT_ID" value="" title_name="SAP工单" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>工单状态</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PROJECT_STATUS" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PROJECT_STATUS" value="" title_name="工单状态" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>生产批号</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="LOT_NUMBER" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="LOT_NUMBER" value="" title_name="生产批号" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>产品编码</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PRODUCT_MATERIAL" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PRODUCT_MATERIAL" value="" title_name="产品编码" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>产品名称</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PRODUCT_NAME" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PRODUCT_NAME" value="" title_name="产品名称" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>计划数量</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PRODUCT_COUNT" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PRODUCT_COUNT" value="" title_name="计划数量" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>收货数量</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="FINISH_COUNT" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="FINISH_COUNT" value="" title_name="收货数量" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>工单类型</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PROJECT_SORT" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PROJECT_SORT" value="" title_name="工单类型" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>?是否关联</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="IS_REL" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="IS_REL" value="" title_name="?是否关联" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>?自动下达制令单</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PROJECT_OFONESELF" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PROJECT_OFONESELF" value="" title_name="?自动下达制令单" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>号段管控</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PROJECT_FLAG" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PROJECT_FLAG" value="" title_name="号段管控" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>机种版本号</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PRODUCT_MATERIAL_VER" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PRODUCT_MATERIAL_VER" value="" title_name="机种版本号" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>?ERP工单单别</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PROJECT_ERPTYPE" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PROJECT_ERPTYPE" value="" title_name="?ERP工单单别" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>?号段条码规则</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PRODUCT_CONFIGURE" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PRODUCT_CONFIGURE" value="" title_name="?号段条码规则" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>?计划变动次数</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PM_CHANGE_TIMES" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PM_CHANGE_TIMES" value="" title_name="?计划变动次数" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>号段起始</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PRODUCT_SN_START" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PRODUCT_SN_START" value="" title_name="号段起始" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>?包装顺序管控YN</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PRODUCT_PACK_SEQ" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PRODUCT_PACK_SEQ" value="" title_name="?包装顺序管控YN" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>号段前缀</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PRODUCT_SN_PREFIX" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PRODUCT_SN_PREFIX" value="" title_name="号段前缀" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>号段终止</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PRODUCT_SN_END" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PRODUCT_SN_END" value="" title_name="号段终止" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>首件检测数量</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="FAI_NUM" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="FAI_NUM" value="" title_name="首件检测数量" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>生产阶别</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PROJECT_STEP" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PROJECT_STEP" value="" title_name="生产阶别" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>规格</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PRODUCT_STANDARD" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PRODUCT_STANDARD" value="" title_name="规格" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>报废数量</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="SCRAPPED_QTY" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="SCRAPPED_QTY" value="" title_name="报废数量" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>?销 售单号</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="DESTROY_NO" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="DESTROY_NO" value="" title_name="?销 售单号" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>客户代码</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="CUST_CODE" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="CUST_CODE" value="" title_name="客户代码" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>投入量</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="FQC_COUNT" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="FQC_COUNT" value="" title_name="投入量" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>?加工面数(1—单面 2—双面3-阴阳面)</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="WORKING_SC" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="WORKING_SC" value="" title_name="?加工面数(1—单面 2—双面3-阴阳面)" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>?工单类型(0:正常、1:样品、2:RMA、3:其他)</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PROJECT_TYPE" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PROJECT_TYPE" value="" title_name="?工单类型(0:正常、1:样品、2:RMA、3:其他)" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>预计开工日期</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PROLEPSIS_START_DATE" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PROLEPSIS_START_DATE" value="" title_name="预计开工日期" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>预计完工日期</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PROLEPSIS_END_DATE" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PROLEPSIS_END_DATE" value="" title_name="预计完工日期" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>计划交货日期</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="TPPB_PLAN_DELIVERY_DATE" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="TPPB_PLAN_DELIVERY_DATE" value="" title_name="计划交货日期" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>备注</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PM_MEMO" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PM_MEMO" value="" title_name="备注" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>线别</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PRODUCT_LINE" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PRODUCT_LINE" value="" title_name="线别" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>实际开工日期</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="ACTUAL_START_DATE" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="ACTUAL_START_DATE" value="" title_name="实际开工日期" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>实际完工日期</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="ACTUAL_END_DATE" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="ACTUAL_END_DATE" value="" title_name="实际完工日期" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>关结原因</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PM_CLOSE_REASON" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PM_CLOSE_REASON" value="" title_name="关结原因" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>?自动下达制令单</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PM_OFONESELF" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PM_OFONESELF" value="" title_name="?自动下达制令单" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>检测结果</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PM_CHECK_STUST" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PM_CHECK_STUST" value="" title_name="检测结果" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>关联数量</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="REL_NUM" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="REL_NUM" value="" title_name="关联数量" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>质检内容</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="CHECK_MON" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="CHECK_MON" value="" title_name="质检内容" />px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;"><span>质检员</span></td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="CHECK_USER" value="1" checked="checked" />
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="CHECK_USER" value="" title_name="质检员" />px
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div  class="mod-bd" style="border-color:#eaeaea;background:#ffffff;" >
                    <div style="width: 100%;height:98%;">
                        <DIV id="container" style="margin-bottom:5px;">
                            <DIV>
                                <UL class="tab-list tab ui-tabs ui-corner-all ui-widget ui-widget-content">
                                    <LI id="tag1" class="current"><A class=""
                                                                     onclick="switchTag('tag1','content1','');this.blur();"
                                                                     href="javascript:void(0);"> <SPAN class="selectspan1"><dict:lang value="工单开立"/></SPAN>
                                    </A>
                                    </LI>
                                    <LI id="tag2" ><A class=""
                                                      onclick="switchTag('tag2','content2','');this.blur();"
                                                      href="javascript:void(0);"> <SPAN><dict:lang value="备料"/></SPAN> </A>
                                    </LI>
                                    <LI id="tag3"><A class=""
                                                     onclick="switchTag('tag3','content3','');this.blur();"
                                                     href="javascript:void(0);"> <SPAN><dict:lang value="投料"/></SPAN> </A>
                                    </LI>
                                    <LI id="tag5"><A class=""
                                                     onclick="switchTag('tag5','content5','');this.blur();"
                                                     href="javascript:void(0);"> <SPAN><dict:lang value="质检"/></SPAN> </A>
                                    </LI>
                                    <LI id="tag4"><A class=""
                                                     onclick="switchTag('tag4','content4','');this.blur();"
                                                     href="javascript:void(0);"> <SPAN><dict:lang value="包装"/></SPAN> </A>
                                    </LI>
                                    <LI id="tag6"><A class=""
                                                     onclick="switchTag('tag6','content6','');this.blur();"
                                                     href="javascript:void(0);"> <SPAN><dict:lang value="关结"/></SPAN> </A>
                                    </LI>

                                </UL>
                            </DIV>

                        </DIV>
                        <div class="panel-ajax datagrid datagrid-div1" style="height:100%"  id="b827b6c4fede48ee8a411a4866072eae">
                            <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxb827b6c4fede48ee8a411a4866072eae" style="height:90%">

                                <div class="datagrid-header dd01" >
                                    <div class="datagrid-header-inner scroll001" id="datagrid-header-inner2f1adeb396c4403b8fea545ec6311111">
                                        <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable2f1adeb396c4403b8fea545ec6311111" style="">
                                            <s:set name="_$type" value="'view'" />
                                            <tbody class="isParentsTitle">
                                            <bu:tr cssClass="datagrid-header-row" id="datagrid-title-ajax">
                                                <td class="datagrid-cell" style="width:29.6px; text-align:center;" ><bu:thSeq  formId="7be0e5e80b8f4977ba730bfdc6e382ae" i18n="1"/></td>
                                                <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="SAP工单"/></td>
                                                <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="工单类型"/></td>
                                                <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="修改人"/></td>
                                                <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="修改时间"/></td>
                                            </bu:tr>
                                            </tbody>
                                        </bu:table>
                                    </div>
                                </div>
                                <div class="datagrid-body datagrid-div3 datagrid-body-ajax dd01 scroll001 " id="tableDivb827b6c4fede48ee8a411a4866072eae" onscroll="ajaxTableScroll(this,'b827b6c4fede48ee8a411a4866072eae')">
                                    <table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax2f1adeb396c4403b8fea545ec6311111" style="">
                                        <tbody id="tbody_tab1">
                                        </tbody>
                                    </table>
                                </div>

                                <div class="datagrid-header dd02">
                                    <div class="datagrid-header-inner scroll002" id="datagrid-header-inner2f1adeb396c4403b8fea545ec6312222">
                                        <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable2f1adeb396c4403b8fea545ec6312222">
                                            <s:set name="_$type" value="'view'" />
                                            <tbody class="isParentsTitle" id="totalTitle">
                                            <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
                                                <td class="datagrid-cell" style="width:29.6px; text-align:center;" ><bu:thSeq  formId="26281e487960487ca8848b3bd3718288" i18n="1"/></td>
                                                <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="SAP工单"/></td>
                                                <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="生产批次"/></td>
                                                <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="作业员"/></td>
                                                <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="修改时间"/></td>
                                            </bu:tr>
                                            </tbody>
                                        </bu:table>
                                    </div>
                                </div>
                                <div class="datagrid-body datagrid-div3 datagrid-body-ajax dd02  scroll2" id="tableDivb827b6c4fede48ee8a411a4866072eae" onscroll="ajaxTableScroll(this,'b827b6c4fede48ee8a411a4866072eae')">
                                    <table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax2f1adeb396c4403b8fea545ec6312222">
                                        <tbody id="tbody_tab2">
                                        </tbody>
                                    </table>
                                </div>

                                <div class="datagrid-header dd03">
                                    <div class="datagrid-header-inner scroll002" id="datagrid-header-inner2f1adeb396c4403b8fea545ec6313333">
                                        <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable2f1adeb396c4403b8fea545ec6313333">
                                            <s:set name="_$type" value="'view'" />
                                            <tbody class="isParentsTitle" id="totalTitle">
                                            <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
                                                <td class="datagrid-cell" style="width:29.6px; text-align:center;" ><bu:thSeq  formId="b36254ac37e74240b1528d44627b6a84" i18n="1"/></td>
                                                <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="SAP工单"/></td>
                                                <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="物料编码"/></td>
                                                <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="实投重量"/></td>
                                                <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="作业员"/></td>
                                                <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="修改时间"/></td>
                                            </bu:tr>
                                            </tbody>
                                        </bu:table>
                                    </div>
                                </div>
                                <div class="datagrid-body datagrid-div3 datagrid-body-ajax dd03  scroll3" id="tableDivb827b6c4fede48ee8a411a4866072eae" onscroll="ajaxTableScroll(this,'b827b6c4fede48ee8a411a4866072eae')">
                                    <table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax2f1adeb396c4403b8fea545ec6312222">
                                        <tbody id="tbody_tab3">
                                        </tbody>
                                    </table>
                                </div>

                                <div class="dd004" style="height:100%;width:100%;position: relative;"><!--style="height:100%;width:100%;position: relative;"-->
                                    <div class="dd0041" style="height:48%;width:100%;position: absolute;top:0;"><!-- style="height:48%;width:100%;position: absolute;top:0;"-->

                                        <div class="datagrid-header dd04">
                                            <div class="datagrid-header-inner scroll004" id="datagrid-header-inner2f1adeb396c4403b8fea545ec6314444">
                                                <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable2f1adeb396c4403b8fea545ec6314444" >
                                                    <s:set name="_$type" value="'view'" />
                                                    <tbody class="isParentsTitle" id="totalTitle">
                                                    <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
                                                        <td class="datagrid-cell" style="width:29.6px; text-align:center;" ><bu:thSeq  formId="ca01f1e21e824c8b94fc899f340bee0e" i18n="1"/></td>
                                                        <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="SAP工单"/></td>
                                                        <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="实际包装量"/></td>
                                                        <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="操作员"/></td>
                                                        <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="修改时间"/></td>
                                                    </bu:tr>
                                                    </tbody>
                                                </bu:table>
                                            </div>
                                        </div>
                                        <div class="datagrid-body datagrid-div3 datagrid-body-ajax dd04  scroll4" id="tableDivb827b6c4fede48ee8a411a4866072eae" onscroll="ajaxTableScroll(this,'b827b6c4fede48ee8a411a4866072eae')">
                                            <table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax2f1adeb396c4403b8fea545ec6314444" >
                                                <tbody id="tbody_tab4">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>



                                    <div class="dd0061" style="height:48%;width:100%;position: absolute;bottom:0;"><!--style="height:48%;width:100%;position: absolute;bottom:0;"-->

                                        <div class="datagrid-header dd06">
                                            <div class="datagrid-header-inner scroll006" id="datagrid-header-inner2f1adeb396c4403b8fea545ec6316666">
                                                <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable2f1adeb396c4403b8fea545ec6316666" >
                                                    <s:set name="_$type" value="'view'" />
                                                    <tbody class="isParentsTitle" id="totalTitle">
                                                    <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
                                                        <td class="datagrid-cell" style="width:29.6px; text-align:center;" ><bu:thSeq  formId="92c585de53ff4e9f879b4e4bc0c16e8f" i18n="1"/></td>
                                                        <td class="datagrid-cell" style="width:120px; text-align:center;" ><dict:lang value="物料编码"/></td>
                                                        <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="存货代码"/></td>
                                                        <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="投入数量"/></td>
                                                        <!-- <td class="datagrid-cell" style="width:160px; text-align:center;" ><dict:lang value="物料阈值"/></td> -->
                                                        <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="原材批次"/></td>
                                                        <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="物料名称"/></td>
                                                    </bu:tr>
                                                    </tbody>
                                                </bu:table>
                                            </div>
                                        </div>
                                        <div class="datagrid-body datagrid-div3 datagrid-body-ajax dd06  scroll6" id="tableDivb827b6c4fede48ee8a411a4866072eae" onscroll="ajaxTableScroll(this,'b827b6c4fede48ee8a411a4866072eae')">
                                            <table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajax2f1adeb396c4403b8fea545ec6316666" >
                                                <tbody id="tbody_tab6">
                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                </div>

                                <div class="datagrid-header dd05">
                                    <div class="datagrid-header-inner scroll005" id="datagrid-header-inner2f1adeb396c4403b8fea545ec6315555">

                                        <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable2f1adeb396c4403b8fea545ec6315555">
                                            <s:set name="_$type" value="'view'" />
                                            <tbody class="isParentsTitle" ><!--id="totalTitle"-->
                                            <bu:tr cssClass="datagrid-header-row" id="datagrid-title-ajax"><!--datagrid-title-ajax-->
                                            <td class="datagrid-cell" style="width:29.6px; text-align:center;" ><bu:thSeq  formId="14dc9c8db0594d89a9a59a3055136619" i18n="1"/></td>
                                            <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="SAP工单"/></td>
                                            <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="质检结果"/></td>
                                            <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="质检内容"/></td>
                                            <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="质检员"/></td>
                                            <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="质检时间"/></td>
                                            </bu:tr>
                                            </tbody>
                                        </bu:table>

                                    </div>
                                </div>

                                <div class="datagrid-body datagrid-div3 datagrid-body-ajax dd05  scroll5" id="tableDivb827b6c4fede48ee8a411a4866072eae" onscroll="ajaxTableScroll(this,'b827b6c4fede48ee8a411a4866072eae')">
                                    <table class=" datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax2f1adeb396c4403b8fea545ec6315555" style="">
                                        <tbody id="tbody_tab5">
                                        </tbody>
                                    </table>

                                </div>



                                <div class="datagrid-header dd07" >
                                    <div class="datagrid-header-inner scroll007" id="datagrid-header-inner2f1adeb396c4403b8fea545ec6317777">
                                        <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htable2f1adeb396c4403b8fea545ec6317777">
                                            <s:set name="_$type" value="'view'" />
                                            <tbody class="isParentsTitle">
                                            <bu:tr cssClass="datagrid-header-row" id="datagrid-title-ajax">
                                                <td class="datagrid-cell" style="width:29.6px; text-align:center;" ><bu:thSeq  formId="7be0e5e80b8f4977ba730bfdc6e382ae" i18n="1"/></td>
                                                <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="SAP工单"/></td>
                                                <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="工单类型"/></td>
                                                <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="修改人"/></td>
                                                <td class="datagrid-cell" style="width:200px; text-align:center;" ><dict:lang value="修改时间"/></td>
                                            </bu:tr>
                                            </tbody>
                                        </bu:table>
                                    </div>
                                </div>

                                <div class="datagrid-body datagrid-div3 datagrid-body-ajax dd01 scroll7 " id="tableDivb827b6c4fede48ee8a411a4866072eae" onscroll="ajaxTableScroll(this,'b827b6c4fede48ee8a411a4866072eae')">
                                    <table class="datagrid-btable fixedTable dblClick "  id="datagrid-btable-ajax2f1adeb396c4403b8fea545ec6317777" style="">
                                        <tbody id="tbody_tab7">
                                        </tbody>
                                    </table>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>

                <input type="hidden" name="tableCount" id="tableCount" value='2' />

            </form>
        </div>
    </div>

</div>

</div>
<bu:submit viewId="bb1278d984614648b32c75f0914bc916" />
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17" />
    <jsp:param name="location" value="beforeJsLoad" />
</jsp:include>
<bu:script viewId="bb1278d984614648b32c75f0914bc916" />

<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17" />
    <jsp:param name="location" value="jsLoading" />
</jsp:include>

<script>
    $(function(){

        resetTab();
        editDadtAuthStyle();
    })

    function editDadtAuthStyle(){
        $("#DATA_AUTH").width("150px");
    }

    function resetTab(){
        $("#tag1").addClass("current");
        $("#tag2").removeClass("current");
        $("#tag3").removeClass("current");
        $("#tag4").removeClass("current");
        $("#tag5").removeClass("current");
        $("#tag6").removeClass("current");
        $('.dd01').css('display','block');
        $('.dd02').css('display','none');
        $('.dd03').css('display','none');
        $('.dd004').css('display','none');
        $('.dd05').css('display','none');
        //$('.dd006').css('display','none');
        $('.dd07').css('display','none');

        $("#tbody_tab2").empty();
        $("#tbody_tab3").empty();
        $("#tbody_tab4").empty();
        $("#tbody_tab5").empty();
        $("#tbody_tab6").empty();
        $("#tbody_tab7").empty();
    }
    function switchTag(tag, content, url){
        if(tag=="tag1"){
            $("#tag1").addClass("current");
            $("#tag2").removeClass("current");
            $("#tag3").removeClass("current");
            $("#tag4").removeClass("current");
            $("#tag5").removeClass("current");
            $("#tag6").removeClass("current");
            $('.dd01').css('display','block');
            $('.dd02').css('display','none');
            $('.dd03').css('display','none');
            $('.dd004').css('display','none');
            $('.dd05').css('display','none');
            //$('.dd006').css('display','none');
            $('.dd07').css('display','none');
            $('#page1').css('display','block');
            $('#page2').css('display','none');
            $('#page3').css('display','none');
            $('#page4').css('display','none');
            $('#page5').css('display','none');
            $('#page6').css('display','none');
            $('#page7').css('display','none');
        }else if(tag=="tag2"){
            $("#tag2").addClass("current");
            $("#tag1").removeClass("current");
            $("#tag3").removeClass("current");
            $("#tag4").removeClass("current");
            $("#tag5").removeClass("current");
            $("#tag6").removeClass("current");
            $('.dd01').css('display','none');
            $('.dd03').css('display','none');
            $('.dd02').css('display','block');
            $('.dd004').css('display','none');
            $('.dd05').css('display','none');
            // $('.dd006').css('display','none');
            $('.dd07').css('display','none');
            $('#page1').css('display','none');
            $('#page3').css('display','none');
            $('#page2').css('display','block');
            $('#page4').css('display','none');
            $('#page5').css('display','none');
            $('#page6').css('display','none');
            $('#page7').css('display','none');
            // empTab();
        }else if(tag=="tag3"){
            $("#tag3").addClass("current");
            $("#tag1").removeClass("current");
            $("#tag2").removeClass("current");
            $("#tag4").removeClass("current");
            $("#tag5").removeClass("current");
            $("#tag6").removeClass("current");
            $('.dd01').css('display','none');
            $('.dd03').css('display','block');
            $('.dd02').css('display','none');
            $('.dd004').css('display','none');
            $('.dd05').css('display','none');
            //  $('.dd006').css('display','none');
            $('.dd07').css('display','none');
            $('#page1').css('display','none');
            $('#page3').css('display','block');
            $('#page2').css('display','none');
            $('#page4').css('display','none');
            $('#page5').css('display','none');
            $('#page6').css('display','none');
            $('#page7').css('display','none');
        }else if(tag=="tag4"){
            $("#tag3").removeClass("current");
            $("#tag1").removeClass("current");
            $("#tag2").removeClass("current");
            $("#tag4").addClass("current");
            $("#tag5").removeClass("current");
            $("#tag6").removeClass("current");
            $('.dd01').css('display','none');
            $('.dd03').css('display','none');
            $('.dd02').css('display','none');
            $('.dd004').css('display','block');
            $('.dd05').css('display','none');
            $('.dd06').css('display','block');
            $('.dd07').css('display','none');
            $('#page1').css('display','none');
            $('#page3').css('display','none');
            $('#page2').css('display','none');
            $('#page4').css('display','block');
            $('#page5').css('display','none');
            $('#page6').css('display','block');
            $('#page7').css('display','none');
        }else if(tag=="tag5"){

            $("#tag3").removeClass("current");
            $("#tag1").removeClass("current");
            $("#tag2").removeClass("current");
            $("#tag4").removeClass("current");
            $("#tag5").addClass("current");
            $("#tag6").removeClass("current");
            $('.dd01').css('display','none');
            $('.dd03').css('display','none');
            $('.dd02').css('display','none');
            $('.dd004').css('display','none');
            $('.dd05').css('display','block');
            // $('.dd006').css('display','none');
            $('.dd07').css('display','none');
            $('#page1').css('display','none');
            $('#page3').css('display','none');
            $('#page2').css('display','none');
            $('#page4').css('display','none');
            $('#page5').css('display','block');
            $('#page6').css('display','none');
            $('#page7').css('display','none');

            //envinfo0();
        }else if(tag=="tag6"){
            $("#tag3").removeClass("current");
            $("#tag1").removeClass("current");
            $("#tag2").removeClass("current");
            $("#tag4").removeClass("current");
            $("#tag5").removeClass("current");
            $("#tag6").addClass("current");
            $('.dd01').css('display','none');
            $('.dd03').css('display','none');
            $('.dd02').css('display','none');
            $('.dd004').css('display','none');
            $('.dd05').css('display','none');
            //$('.dd006').css('display','none');
            $('.dd07').css('display','block');
            $('#page1').css('display','none');
            $('#page3').css('display','none');
            $('#page2').css('display','none');
            $('#page4').css('display','none');
            $('#page5').css('display','none');
            $('#page6').css('display','none');
            $('#page7').css('display','block');
        }
    }
    function showprectitem(e){
        var tid = $(e).attr("id");
        //$("id^='check_'").attr("checked", true);
        if ($("#check_" + tid).attr('checked')) {
            $("#check_" + tid).attr("checked", false);
        } else {
            $("#check_" + tid).attr("checked", true);
        }

        var type = $("#PROJECT_STATUS" + tid)[0].innerHTML;
        if(type.indexOf("开立") > -1){
            $("#tag1").css("display","block");
            $("#tag2").css("display","none");
            $("#tag3").css("display","none");
            $("#tag4").css("display","none");
            $("#tag5").css("display","none");
            $("#tag6").css("display","none");

            $('.dd01').css('display','block');
            $('.dd02').css('display','none');
            $('.dd03').css('display','none');
            $('.dd004').css('display','none');
            $('.dd05').css('display','none');
            $('.dd07').css('display','none');
            $('#page1').css('display','block');
            $('#page2').css('display','none');
            $('#page3').css('display','none');
            $('#page4').css('display','none');
            $('#page5').css('display','none');
            $('#page7').css('display','none');
            $("#tbody_tab2").empty();
            $("#tbody_tab3").empty();
            $("#tbody_tab4").empty();
            $("#tbody_tab5").empty();
            $("#tbody_tab6").empty();
            $("#tbody_tab7").empty();
            projectrel(tid);
        }else if(type.indexOf("备料") > -1){
            $("#tag1").css("display","block");
            $("#tag2").css("display","block");
            $("#tag3").css("display","none");
            $("#tag4").css("display","none");
            $("#tag5").css("display","none");
            $("#tag6").css("display","none");

            $('.dd01').css('display','block');
            $('.dd03').css('display','none');
            $('.dd02').css('display','block');
            $('.dd004').css('display','none');
            $('.dd05').css('display','none');
            $('.dd07').css('display','none');
            $('#page1').css('display','block');
            $('#page3').css('display','none');
            $('#page2').css('display','block');
            $('#page4').css('display','none');
            $('#page5').css('display','none');
            $('#page7').css('display','none');

            $("#tbody_tab3").empty();
            $("#tbody_tab4").empty();
            $("#tbody_tab5").empty();
            $("#tbody_tab6").empty();
            $("#tbody_tab7").empty();
            readyproject(tid);
        }else if(type.indexOf("投料") > -1){
            $("#tag1").css("display","block");
            $("#tag2").css("display","block");
            $("#tag3").css("display","block");
            $("#tag4").css("display","none");
            $("#tag5").css("display","none");
            $("#tag6").css("display","none");

            $('.dd01').css('display','block');
            $('.dd03').css('display','block');
            $('.dd02').css('display','block');
            $('.dd004').css('display','none');
            $('.dd05').css('display','none');
            $('#page1').css('display','block');
            $('#page3').css('display','block');
            $('#page2').css('display','block');
            $('#page4').css('display','none');
            $('#page5').css('display','none');
            $('#page7').css('display','none');

            $("#tbody_tab4").empty();
            $("#tbody_tab5").empty();
            $("#tbody_tab6").empty();
            $("#tbody_tab7").empty();
            feedproject(tid);
        }else if(type.indexOf("包装") > -1){
            $("#tag1").css("display","block");
            $("#tag2").css("display","block");
            $("#tag3").css("display","block");
            $("#tag4").css("display","block");
            $("#tag5").css("display","block");
            $("#tag7").css("display","none");
            $('.dd01').css('display','block');
            $('.dd03').css('display','block');
            $('.dd02').css('display','block');
            $('.dd004').css('display','block');
            $('.dd05').css('display','block');
            $('.dd06').css('display','none');
            $('#page1').css('display','block');
            $('#page3').css('display','block');
            $('#page2').css('display','block');
            $('#page4').css('display','block');
            $('#page5').css('display','block');
            $('#page7').css('display','none');
            $("#tbody_tab7").empty();
            packproject(tid);
        }else if(type.indexOf("关结") > -1){
            $("#tag1").css("display","block");
            $("#tag2").css("display","block");
            $("#tag3").css("display","block");
            $("#tag4").css("display","block");
            $("#tag5").css("display","block");
            $("#tag6").css("display","block");
            $('.dd01').css('display','block');
            $('.dd03').css('display','block');
            $('.dd02').css('display','block');
            $('.dd004').css('display','block');
            $('.dd05').css('display','block');
            $('.dd07').css('display','block');
            $('#page1').css('display','block');
            $('#page3').css('display','block');
            $('#page2').css('display','block');
            $('#page4').css('display','block');
            $('#page5').css('display','block');
            $('#page7').css('display','block');
            closeproject(tid);
        }else {

        }
    }

    function projectrel(id){
        var tag = "1";
        $.ajax({
            type:"post",
            dataType:"json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=ffc2c6409cb847028700635f92634962",
            data:"&id="+id+"&tag="+tag,
            success: function(data){
                console.log("Data>>" + data.ajaxMap.relList.PROJECT_ID)
                var reslist = data.ajaxMap.relList;
                $("#tbody_tab1").empty();
                var types=""
                if(null != reslist){
                    for(var i=0;i<reslist.length;i++){
                        if(reslist[i].PROJECT_SORT == null){
                            types="";
                        }else if(reslist[i].PROJECT_SORT=='0'){
                            types="未分类";
                        }else if(reslist[i].PROJECT_SORT=='2'){
                            types="包装单";
                        }else if(reslist[i].PROJECT_SORT=='1'){
                            types="制造单";
                        }
                        $("#tbody_tab1").append("<tr class='datagrid-row' style='cursor: pointer;' ondblclick='detailcon(this.id)' id='' >");
                        $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:29.6px;text-align: center;'>"+(i+1)+"</td>");
                        $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(reslist[i].PROJECT_ID==null?"":reslist[i].PROJECT_ID)+"</td>");
                        $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+types+"</td>");
                        $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(reslist[i].CREATE_USER==null?"":reslist[i].CREATE_USER)+"</td>");
                        $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(reslist[i].CREATE_TIME==null?"":reslist[i].CREATE_TIME).replace("T"," ")+"</td></tr>");

                    }
                }

            },
            error: function(msg){
                util.closeLoading();
                utilsFp.confirmIcon(3,"","","", "error:"+"开立信息错误",0,"300","");
            }

        });
    }

    function closeproject(id){
        var tag = "5";
        $.ajax({
            type:"post",
            dataType:"json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=ffc2c6409cb847028700635f92634962",
            data:"&id="+id+"&tag="+tag,
            success: function(data){
                console.log("Data>>" + data.ajaxMap.relList.PROJECT_ID)
                var reslist = data.ajaxMap.relList;
                $("#tbody_tab1").empty();
                var types=""
                if(null != reslist){
                    for(var i=0;i<reslist.length;i++){
                        if(reslist[i].PROJECT_SORT == null){
                            types="";
                        }else if(reslist[i].PROJECT_SORT=='0'){
                            types="未分类";
                        }else if(reslist[i].PROJECT_SORT=='2'){
                            types="包装单";
                        }else if(reslist[i].PROJECT_SORT=='1'){
                            types="制造单";
                        }
                        $("#tbody_tab1").append("<tr class='datagrid-row' style='cursor: pointer;' ondblclick='detailcon(this.id)' id='' >");
                        $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:29.6px;text-align: center;'>"+(i+1)+"</td>");
                        $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(reslist[i].PROJECT_ID==null?"":reslist[i].PROJECT_ID)+"</td>");
                        $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+types+"</td>");
                        $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(reslist[i].EDIT_USER==null?"":reslist[i].CREATE_USER)+"</td>");
                        $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(reslist[i].EDIT_TIME==null?"":reslist[i].CREATE_TIME).replace("T"," ")+"</td></tr>");

                    }
                }

            },
            error: function(msg){
                util.closeLoading();
                utilsFp.confirmIcon(3,"","","", "error:"+"关结信息错误",0,"300","");
            }

        });
    }

    function readyproject(id){
        var tag = "2";
        $.ajax({
            type:"post",
            dataType:"json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=ffc2c6409cb847028700635f92634962",
            data:"&id="+id+"&tag="+tag,
            success: function(data){
                console.log("Data>>" + data.ajaxMap.relList.PROJECT_ID)
                var reslist = data.ajaxMap.relList;
                $("#tbody_tab1").empty();
                var types=""
                if(null != reslist){
                    for(var i=0;i<reslist.length;i++){
                        if(reslist[i].PROJECT_SORT == null){
                            types="";
                        }else if(reslist[i].PROJECT_SORT=='0'){
                            types="未分类";
                        }else if(reslist[i].PROJECT_SORT=='2'){
                            types="包装单";
                        }else if(reslist[i].PROJECT_SORT=='1'){
                            types="制造单";
                        }
                        $("#tbody_tab1").append("<tr class='datagrid-row' style='cursor: pointer;' ondblclick='detailcon(this.id)' id='' >");
                        $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:29.6px;text-align: center;'>"+(i+1)+"</td>");
                        $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(reslist[i].PROJECT_ID==null?"":reslist[i].PROJECT_ID)+"</td>");
                        $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+types+"</td>");
                        $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(reslist[i].CREATE_USER==null?"":reslist[i].CREATE_USER)+"</td>");
                        $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(reslist[i].CREATE_TIME==null?"":reslist[i].CREATE_TIME).replace("T"," ")+"</td></tr>");

                    }
                }
                var readyList = data.ajaxMap.readyList;
                $("#tbody_tab2").empty();
                if(null != readyList){
                    for(var i=0;i<readyList.length;i++){
                        $("#tbody_tab2").append("<tr class='datagrid-row' style='cursor: pointer;' ondblclick='detailcon(this.id)' id='' >");
                        $("#tbody_tab2 tr:last").append("<td class='datagrid-cell' style='width:29.6px;text-align: center;'>"+(i+1)+"</td>");
                        $("#tbody_tab2 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(readyList[i].REL_PROJECT_ID==null?"":readyList[i].REL_PROJECT_ID)+"</td>");
                        $("#tbody_tab2 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(readyList[i].LOT_NUMBER==null?"":readyList[i].LOT_NUMBER)+"</td>");
                        $("#tbody_tab2 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(readyList[i].EDIT_USER==null?"":readyList[i].EDIT_USER)+"</td>");
                        $("#tbody_tab2 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(readyList[i].EDIT_TIME==null?"":readyList[i].EDIT_TIME).replace("T"," ")+"</td></tr>");

                    }
                }

            },
            error: function(e){
                util.closeLoading();
                utilsFp.confirmIcon(3,"","","", "error:"+"备料信息错误",0,"300","");
            }

        });
    }

    function feedproject(id){
        var tag = "3";
        $.ajax({
            type:"post",
            dataType:"json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=ffc2c6409cb847028700635f92634962",
            data:"&id="+id+"&tag="+tag,
            success: function(data){
                console.log("Data>>" + data.ajaxMap.relList.PROJECT_ID)
                var reslist = data.ajaxMap.relList;
                $("#tbody_tab1").empty();
                var types=""
                if(null != reslist){
                    for(var i=0;i<reslist.length;i++){
                        if(reslist[i].PROJECT_SORT == null){
                            types="";
                        }else if(reslist[i].PROJECT_SORT=='0'){
                            types="未分类";
                        }else if(reslist[i].PROJECT_SORT=='2'){
                            types="包装单";
                        }else if(reslist[i].PROJECT_SORT=='1'){
                            types="制造单";
                        }
                        $("#tbody_tab1").append("<tr class='datagrid-row' style='cursor: pointer;' ondblclick='detailcon(this.id)' id='' >");
                        $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:29.6px;text-align: center;'>"+(i+1)+"</td>");
                        $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(reslist[i].PROJECT_ID==null?"":reslist[i].PROJECT_ID)+"</td>");
                        $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+types+"</td>");
                        $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(reslist[i].CREATE_USER==null?"":reslist[i].CREATE_USER)+"</td>");
                        $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(reslist[i].CREATE_TIME==null?"":reslist[i].CREATE_TIME).replace("T"," ")+"</td></tr>");

                    }
                }
                var readyList = data.ajaxMap.readyList;
                $("#tbody_tab2").empty();
                if(null != readyList){
                    for(var i=0;i<readyList.length;i++){
                        $("#tbody_tab2").append("<tr class='datagrid-row' style='cursor: pointer;' ondblclick='detailcon(this.id)' id='' >");
                        $("#tbody_tab2 tr:last").append("<td class='datagrid-cell' style='width:29.6px;text-align: center;'>"+(i+1)+"</td>");
                        $("#tbody_tab2 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(readyList[i].REL_PROJECT_ID==null?"":readyList[i].REL_PROJECT_ID)+"</td>");
                        $("#tbody_tab2 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(readyList[i].LOT_NUMBER==null?"":readyList[i].LOT_NUMBER)+"</td>");
                        $("#tbody_tab2 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(readyList[i].EDIT_USER==null?"":readyList[i].EDIT_USER)+"</td>");
                        $("#tbody_tab2 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(readyList[i].EDIT_TIME==null?"":readyList[i].EDIT_TIME).replace("T"," ")+"</td></tr>");

                    }
                }
                var feedList = data.ajaxMap.feedList;
                $("#tbody_tab3").empty();
                if(null != feedList){
                    for(var i=0;i<feedList.length;i++){
                        $("#tbody_tab3").append("<tr class='datagrid-row' style='cursor: pointer;' ondblclick='detailcon(this.id)' id='' >");
                        $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:29.6px;text-align: center;'>"+(i+1)+"</td>");
                        $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(feedList[i].PROJECT_ID==null?"":feedList[i].PROJECT_ID)+"</td>");
                        $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(feedList[i].ITEM_CODE==null?"":feedList[i].ITEM_CODE)+"</td>");
                        $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(feedList[i].FEED_NUM==null?"":feedList[i].FEED_NUM)+"</td>");
                        $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(feedList[i].EDIT_USER==null?"":feedList[i].EDIT_USER)+"</td>");
                        $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(feedList[i].CREATE_TIME==null?"":feedList[i].CREATE_TIME).replace("T"," ")+"</td></tr>");

                    }
                }

            },
            error: function(msg){
                util.closeLoading();
                utilsFp.confirmIcon(3,"","","", "error:"+"投料信息错误",0,"300","");
            }

        });
    }


    function  packproject(id){
        var tag = "4";
        $.ajax({
            type:"post",
            dataType:"json",
            url: "${path}buss/bussModel_exeFunc.ms?funcMId=ffc2c6409cb847028700635f92634962",
            data:"&id="+id+"&tag="+tag,
            success: function(data){
                console.log("Data>>" + data.ajaxMap.relList.PROJECT_ID)
                var reslist = data.ajaxMap.relList;
                $("#tbody_tab1").empty();
                var types=""
                if(null != reslist){
                    for(var i=0;i<reslist.length;i++){
                        if(reslist[i].PROJECT_SORT == null){
                            types="";
                        }else if(reslist[i].PROJECT_SORT=='0'){
                            types="未分类";
                        }else if(reslist[i].PROJECT_SORT=='2'){
                            types="包装单";
                        }else if(reslist[i].PROJECT_SORT=='1'){
                            types="制造单";
                        }
                        $("#tbody_tab1").append("<tr class='datagrid-row' style='cursor: pointer;' ondblclick='detailcon(this.id)' id='' >");
                        $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:29.6px;text-align: center;'>"+(i+1)+"</td>");
                        $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(reslist[i].PROJECT_ID==null?"":reslist[i].PROJECT_ID)+"</td>");
                        $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+types+"</td>");
                        $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(reslist[i].CREATE_USER==null?"":reslist[i].CREATE_USER)+"</td>");
                        $("#tbody_tab1 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(reslist[i].CREATE_TIME==null?"":reslist[i].CREATE_TIME).replace("T"," ")+"</td></tr>");

                    }
                }
                var readyList = data.ajaxMap.readyList;
                $("#tbody_tab2").empty();
                if(null != readyList){
                    for(var i=0;i<readyList.length;i++){
                        $("#tbody_tab2").append("<tr class='datagrid-row' style='cursor: pointer;' ondblclick='detailcon(this.id)' id='' >");
                        $("#tbody_tab2 tr:last").append("<td class='datagrid-cell' style='width:29.6px;text-align: center;'>"+(i+1)+"</td>");
                        $("#tbody_tab2 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(readyList[i].REL_PROJECT_ID==null?"":readyList[i].REL_PROJECT_ID)+"</td>");
                        $("#tbody_tab2 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(readyList[i].LOT_NUMBER==null?"":readyList[i].LOT_NUMBER)+"</td>");
                        $("#tbody_tab2 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(readyList[i].EDIT_USER==null?"":readyList[i].EDIT_USER)+"</td>");
                        $("#tbody_tab2 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(readyList[i].EDIT_TIME==null?"":readyList[i].EDIT_TIME).replace("T"," ")+"</td></tr>");

                    }
                }
                var feedList = data.ajaxMap.feedList;
                $("#tbody_tab3").empty();
                if(null != feedList){
                    for(var i=0;i<feedList.length;i++){
                        $("#tbody_tab3").append("<tr class='datagrid-row' style='cursor: pointer;' ondblclick='detailcon(this.id)' id='' >");
                        $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:29.6px;text-align: center;'>"+(i+1)+"</td>");
                        $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(feedList[i].PROJECT_ID==null?"":feedList[i].PROJECT_ID)+"</td>");
                        $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(feedList[i].ITEM_CODE==null?"":feedList[i].ITEM_CODE)+"</td>");
                        $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(feedList[i].FEED_NUM==null?"":feedList[i].FEED_NUM)+"</td>");

                        $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(feedList[i].EDIT_USER==null?"":feedList[i].EDIT_USER)+"</td>");
                        $("#tbody_tab3 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(feedList[i].CREATE_TIME==null?"":feedList[i].CREATE_TIME).replace("T"," ")+"</td></tr>");

                    }
                }
                var packList = data.ajaxMap.packList;
                $("#tbody_tab4").empty();
                if(null != packList){
                    for(var i=0;i<packList.length;i++){
                        $("#tbody_tab4").append("<tr class='datagrid-row' style='cursor: pointer;' ondblclick='detailcon(this.id)' id='' >");
                        $("#tbody_tab4 tr:last").append("<td class='datagrid-cell' style='width:29.6px;text-align: center;'>"+(i+1)+"</td>");
                        $("#tbody_tab4 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(packList[i].PROJECT_ID==null?"":packList[i].PROJECT_ID)+"</td>");
                        $("#tbody_tab4 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(packList[i].FINISH_COUNT==null?"":packList[i].FINISH_COUNT)+"</td>");
                        $("#tbody_tab4 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(packList[i].EDIT_USER==null?"":packList[i].EDIT_USER)+"</td>");
                        $("#tbody_tab4 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(packList[i].EDIT_TIME==null?"":packList[i].EDIT_TIME).replace("T"," ")+"</td></tr>");

                    }
                }
                var packFeedList = data.ajaxMap.packFeedList;
                $("#tbody_tab6").empty();
                if(null != packFeedList){
                    for(var i=0;i<packFeedList.length;i++){
                        $("#tbody_tab6").append("<tr class='datagrid-row' style='cursor: pointer;' ondblclick='detailcon(this.id)' id='' >");
                        $("#tbody_tab6 tr:last").append("<td class='datagrid-cell' style='width:29.6px;text-align: center;'>"+(i+1)+"</td>");
                        $("#tbody_tab6 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(packFeedList[i].ITEM_CODE==null?"":packFeedList[i].ITEM_CODE)+"</td>");
                        $("#tbody_tab6 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(packFeedList[i].STOCK_CODE==null?"":packFeedList[i].STOCK_CODE)+"</td>");
                        $("#tbody_tab6 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(packFeedList[i].PACK_NUM==null?"":packFeedList[i].PACK_NUM)+"</td>");
                        $("#tbody_tab6 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(packFeedList[i].RAW_LOTNUMBER==null?"":packFeedList[i].RAW_LOTNUMBER)+"</td>");
                        $("#tbody_tab6 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(packFeedList[i].ITEM_MANE==null?"":packFeedList[i].ITEM_MANE)+"</td></tr>");

                    }
                }
                var checkdList = data.ajaxMap.checkdList;
                $("#tbody_tab5").empty();
                var checktype="";
                if(null != checkdList){

                    for(var i=0;i<checkdList.length;i++){
                        if(checkdList[i].CHECK_STATUS == null){
                            checktype="";
                        }else if(checkdList[i].CHECK_STATUS =='0'){
                            checktype="合格";
                        }else if(checkdList[i].CHECK_STATUS =='1'){
                            checktype="不合格";
                        }
                        $("#tbody_tab5").append("<tr class='datagrid-row' style='cursor: pointer;' ondblclick='detailcon(this.id)' id='' >");
                        $("#tbody_tab5 tr:last").append("<td class='datagrid-cell' style='width:29.6px;text-align: center;'>"+(i+1)+"</td>");
                        $("#tbody_tab5 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(checkdList[i].PROJECT_ID==null?"":checkdList[i].PROJECT_ID)+"</td>");
                        $("#tbody_tab5 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+checktype+"</td>");
                        $("#tbody_tab5 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(checkdList[i].QT_MON==null?"":checkdList[i].QT_MON)+"</td>");
                        $("#tbody_tab5 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(checkdList[i].CHECK_USER==null?"":checkdList[i].CHECK_USER)+"</td>");
                        $("#tbody_tab5 tr:last").append("<td class='datagrid-cell' style='width:200px;text-align: center;'>"+(checkdList[i].EDIT_TIME==null?"":checkdList[i].EDIT_TIME).replace("T"," ")+"</td></tr>");

                    }
                }

            },
            error: function(msg){
                util.closeLoading();
                utilsFp.confirmIcon(3,"","","", "error:"+"包装信息有误",0,"300","");
            }

        });
    }

    <%--生成异步表格--%>
    function createTableModel(ms,formId){
        var arrHtml = [];
        var arrLeftHtml = [];
        var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
        var trClass = ms.trClass(formId);
        var trStyle = ms.trStyle(formId);
        var trEvent = ms.trEvent(formId);
        var colNo = $("#relColVals").val();
        if(formId=='b827b6c4fede48ee8a411a4866072eae'){<%--LEO-工单明细查询表--%>
            $.each(uiTxt,function(i,v){
                var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
                arrHtml.push("<tr onclick='showprectitem(this);' class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
                arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
                arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_"+v.ID+"'  value='"+v.DATA_AUTH_ID+"' />");
                getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
                arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
                arrHtml.push("<input type='checkbox' id ='check_" + v.ID + "' name='"+formId+"$ID' value='"+v.ID+"' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell  " + ms.tdClass(formId, 'PROJECT_ID') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'PROJECT_ID') + "' " + ms.tdEvent(formId, 'PROJECT_ID') + ">")
                arrHtml.push("<span colno='PROJECT_ID' class='" + ms.uiClass(formId, 'PROJECT_ID') + "' style='" + ms.uiStyle(formId, 'PROJECT_ID') + "' " + ms.uiEvent(formId, 'PROJECT_ID') + " title='" + ms.titleAttr(formId, 'PROJECT_ID', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_ID'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td  colno='PROJECT_STATUS' name='noprintset_PROJECT_STATUS' class='datagrid-cell  " + ms.tdClass(formId, 'PROJECT_STATUS') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'PROJECT_STATUS') + "' " + ms.tdEvent(formId, 'PROJECT_STATUS') + ">")
                arrHtml.push("<span id='PROJECT_STATUS"+v.ID+"' colno='PROJECT_STATUS' class='" + ms.uiClass(formId, 'PROJECT_STATUS') + "' style='" + ms.uiStyle(formId, 'PROJECT_STATUS') + "' " + ms.uiEvent(formId, 'PROJECT_STATUS') + " title='" + ms.titleAttr(formId, 'PROJECT_STATUS', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_STATUS'] + "</span>")
                arrHtml.push("</td>");

                arrHtml.push("<td colno='LOT_NUMBER' name='noprintset_LOT_NUMBER' class='datagrid-cell  " + ms.tdClass(formId, 'LOT_NUMBER') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'LOT_NUMBER') + "' " + ms.tdEvent(formId, 'LOT_NUMBER') + ">")
                arrHtml.push("<span colno='LOT_NUMBER' class='" + ms.uiClass(formId, 'LOT_NUMBER') + "' style='" + ms.uiStyle(formId, 'LOT_NUMBER') + "' " + ms.uiEvent(formId, 'LOT_NUMBER') + " title='" + ms.titleAttr(formId, 'LOT_NUMBER', 'IS_TITLE_ATTR', v) + "' >" + v['LOT_NUMBER'] + "</span>")
                arrHtml.push("</td>");

                arrHtml.push("<td colno='PRODUCT_MATERIAL' name='noprintset_PRODUCT_MATERIAL' class='datagrid-cell  " + ms.tdClass(formId, 'PRODUCT_MATERIAL') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'PRODUCT_MATERIAL') + "' " + ms.tdEvent(formId, 'PRODUCT_MATERIAL') + ">")
                arrHtml.push("<span colno='PRODUCT_MATERIAL' class='" + ms.uiClass(formId, 'PRODUCT_MATERIAL') + "' style='" + ms.uiStyle(formId, 'PRODUCT_MATERIAL') + "' " + ms.uiEvent(formId, 'PRODUCT_MATERIAL') + " title='" + ms.titleAttr(formId, 'PRODUCT_MATERIAL', 'IS_TITLE_ATTR', v) + "' >" + v['PRODUCT_MATERIAL'] + "</span>")
                arrHtml.push("</td>");

                arrHtml.push("<td colno='PRODUCT_NAME' name='noprintset_PRODUCT_NAME' class='datagrid-cell  " + ms.tdClass(formId, 'PRODUCT_NAME') + "' style='text-align:center;width:150px;" + ms.tdStyle(formId, 'PRODUCT_NAME') + "' " + ms.tdEvent(formId, 'PRODUCT_NAME') + ">")
                arrHtml.push("<span colno='PRODUCT_NAME' class='" + ms.uiClass(formId, 'PRODUCT_NAME') + "' style='" + ms.uiStyle(formId, 'PRODUCT_NAME') + "' " + ms.uiEvent(formId, 'PRODUCT_NAME') + " title='" + ms.titleAttr(formId, 'PRODUCT_NAME', 'IS_TITLE_ATTR', v) + "' >" + v['PRODUCT_NAME'] + "</span>")
                arrHtml.push("</td>");

                arrHtml.push("<td colno='PRODUCT_COUNT' name='noprintset_PRODUCT_COUNT' class='datagrid-cell  " + ms.tdClass(formId, 'PRODUCT_COUNT') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'PRODUCT_COUNT') + "' " + ms.tdEvent(formId, 'PRODUCT_COUNT') + ">")
                arrHtml.push("<span colno='PRODUCT_COUNT' class='" + ms.uiClass(formId, 'PRODUCT_COUNT') + "' style='" + ms.uiStyle(formId, 'PRODUCT_COUNT') + "' " + ms.uiEvent(formId, 'PRODUCT_COUNT') + " title='" + ms.titleAttr(formId, 'PRODUCT_COUNT', 'IS_TITLE_ATTR', v) + "' >" + v['PRODUCT_COUNT'] + "</span>")
                arrHtml.push("</td>");

                arrHtml.push("<td colno='PROJECT_SORT' name='noprintset_PROJECT_SORT' class='datagrid-cell  " + ms.tdClass(formId, 'PROJECT_SORT') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'PROJECT_SORT') + "' " + ms.tdEvent(formId, 'PROJECT_SORT') + ">")
                arrHtml.push("<span colno='PROJECT_SORT' class='" + ms.uiClass(formId, 'PROJECT_SORT') + "' style='" + ms.uiStyle(formId, 'PROJECT_SORT') + "' " + ms.uiEvent(formId, 'PROJECT_SORT') + " title='" + ms.titleAttr(formId, 'PROJECT_SORT', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_SORT'] + "</span>")
                arrHtml.push("</td>");


                arrHtml.push("<td colno='REL_NUM' name='noprintset_REL_NUM' class='datagrid-cell  " + ms.tdClass(formId, 'REL_NUM') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'REL_NUM') + "' " + ms.tdEvent(formId, 'REL_NUM') + ">")
                arrHtml.push("<span colno='REL_NUM' class='" + ms.uiClass(formId, 'REL_NUM') + "' style='" + ms.uiStyle(formId, 'REL_NUM') + "' " + ms.uiEvent(formId, 'REL_NUM') + " title='" + ms.titleAttr(formId, 'REL_NUM', 'IS_TITLE_ATTR', v) + "' >" + v['REL_NUM'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_USER' name='noprintset_CREATE_USER' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_USER') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'CREATE_USER') + "' " + ms.tdEvent(formId, 'CREATE_USER') + ">")
                arrHtml.push("<span colno='CREATE_USER' class='" + ms.uiClass(formId, 'CREATE_USER') + "' style='" + ms.uiStyle(formId, 'CREATE_USER') + "' " + ms.uiEvent(formId, 'CREATE_USER') + " title='" + ms.titleAttr(formId, 'CREATE_USER', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_USER'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_TIME' name='noprintset_CREATE_TIME' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_TIME') + "' style='text-align:center;width:100px;" + ms.tdStyle(formId, 'CREATE_TIME') + "' " + ms.tdEvent(formId, 'CREATE_TIME') + ">")
                arrHtml.push("<span colno='CREATE_TIME' class='" + ms.uiClass(formId, 'CREATE_TIME') + "' style='" + ms.uiStyle(formId, 'CREATE_TIME') + "' " + ms.uiEvent(formId, 'CREATE_TIME') + " title='" + ms.titleAttr(formId, 'CREATE_TIME', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_TIME'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='EDIT_USER' name='noprintset_EDIT_USER' class='datagrid-cell  " + ms.tdClass(formId, 'EDIT_USER') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'EDIT_USER') + "' " + ms.tdEvent(formId, 'EDIT_USER') + ">")
                arrHtml.push("<span colno='EDIT_USER' class='" + ms.uiClass(formId, 'EDIT_USER') + "' style='" + ms.uiStyle(formId, 'EDIT_USER') + "' " + ms.uiEvent(formId, 'EDIT_USER') + " title='" + ms.titleAttr(formId, 'EDIT_USER', 'IS_TITLE_ATTR', v) + "' >" + v['EDIT_USER'] + "</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='EDIT_TIME' name='noprintset_EDIT_TIME' class='datagrid-cell  " + ms.tdClass(formId, 'EDIT_TIME') + "' style='text-align:center;width:100px;" + ms.tdStyle(formId, 'EDIT_TIME') + "' " + ms.tdEvent(formId, 'EDIT_TIME') + ">")
                arrHtml.push("<span colno='EDIT_TIME' class='" + ms.uiClass(formId, 'EDIT_TIME') + "' style='" + ms.uiStyle(formId, 'EDIT_TIME') + "' " + ms.uiEvent(formId, 'EDIT_TIME') + " title='" + ms.titleAttr(formId, 'EDIT_TIME', 'IS_TITLE_ATTR', v) + "' >" + v['EDIT_TIME'] + "</span>")
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
        setTableWidth(formId);
        setScroll(formId);
    }
</script><script>
    <%--生成异步表格--%>
    function createTableModel_print(ms,formId){
        var arrHtml = [];
        var arrLeftHtml = [];
        var uiTxt = ms.uiTxt(formId)==null?[]:ms.uiTxt(formId);
        var trClass = ms.trClass(formId);
        var trStyle = ms.trStyle(formId);
        var trEvent = ms.trEvent(formId);
        var colNo = $("#relColVals").val();
        if(formId=='b827b6c4fede48ee8a411a4866072eae'){<%--LEO-工单明细查询表--%>
            $.each(uiTxt,function(i,v){
                var backgroudColor = (i+1)%2 == 0 ? "tr-hover" : "";
                arrHtml.push("<tr class='datagrid-row "+backgroudColor+" "+trClass+"' id='"+v.ID+"' abbr='"+v.ID+"' style='cursor: pointer;"+trStyle+"' "+trEvent+">");
                arrHtml.push("<input type='hidden' name='ID' value='"+v.ID+"' />");
                getRelColVal(arrHtml,v,colNo);            arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>"+v._SEQ+"</span></td>");
                arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_ID')+"' style='"+ms.tdStyle(formId, 'PROJECT_ID')+"' "+ms.tdEvent(formId, 'PROJECT_ID')+">")
                arrHtml.push("<span colno='PROJECT_ID' class='"+ms.uiClass(formId, 'PROJECT_ID')+"' style='"+ms.uiStyle(formId, 'PROJECT_ID')+"' "+ms.uiEvent(formId, 'PROJECT_ID')+" title='"+ms.titleAttr(formId,'PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_ID']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROJECT_STATUS' name='noprintset_PROJECT_STATUS' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_STATUS')+"' style='"+ms.tdStyle(formId, 'PROJECT_STATUS')+"' "+ms.tdEvent(formId, 'PROJECT_STATUS')+">")
                arrHtml.push("<span colno='PROJECT_STATUS' class='"+ms.uiClass(formId, 'PROJECT_STATUS')+"' style='"+ms.uiStyle(formId, 'PROJECT_STATUS')+"' "+ms.uiEvent(formId, 'PROJECT_STATUS')+" title='"+ms.titleAttr(formId,'PROJECT_STATUS','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_STATUS']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='LOT_NUMBER' name='noprintset_LOT_NUMBER' class='datagrid-cell "+ms.tdClass(formId, 'LOT_NUMBER')+"' style='"+ms.tdStyle(formId, 'LOT_NUMBER')+"' "+ms.tdEvent(formId, 'LOT_NUMBER')+">")
                arrHtml.push("<span colno='LOT_NUMBER' class='"+ms.uiClass(formId, 'LOT_NUMBER')+"' style='"+ms.uiStyle(formId, 'LOT_NUMBER')+"' "+ms.uiEvent(formId, 'LOT_NUMBER')+" title='"+ms.titleAttr(formId,'LOT_NUMBER','IS_TITLE_ATTR',v)+"' >"+v['LOT_NUMBER']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_MATERIAL' name='noprintset_PRODUCT_MATERIAL' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_MATERIAL')+"' style='"+ms.tdStyle(formId, 'PRODUCT_MATERIAL')+"' "+ms.tdEvent(formId, 'PRODUCT_MATERIAL')+">")
                arrHtml.push("<span colno='PRODUCT_MATERIAL' class='"+ms.uiClass(formId, 'PRODUCT_MATERIAL')+"' style='"+ms.uiStyle(formId, 'PRODUCT_MATERIAL')+"' "+ms.uiEvent(formId, 'PRODUCT_MATERIAL')+" title='"+ms.titleAttr(formId,'PRODUCT_MATERIAL','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_MATERIAL']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_NAME' name='noprintset_PRODUCT_NAME' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_NAME')+"' style='"+ms.tdStyle(formId, 'PRODUCT_NAME')+"' "+ms.tdEvent(formId, 'PRODUCT_NAME')+">")
                arrHtml.push("<span colno='PRODUCT_NAME' class='"+ms.uiClass(formId, 'PRODUCT_NAME')+"' style='"+ms.uiStyle(formId, 'PRODUCT_NAME')+"' "+ms.uiEvent(formId, 'PRODUCT_NAME')+" title='"+ms.titleAttr(formId,'PRODUCT_NAME','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_NAME']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_COUNT' name='noprintset_PRODUCT_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_COUNT')+"' style='"+ms.tdStyle(formId, 'PRODUCT_COUNT')+"' "+ms.tdEvent(formId, 'PRODUCT_COUNT')+">")
                arrHtml.push("<span colno='PRODUCT_COUNT' class='"+ms.uiClass(formId, 'PRODUCT_COUNT')+"' style='"+ms.uiStyle(formId, 'PRODUCT_COUNT')+"' "+ms.uiEvent(formId, 'PRODUCT_COUNT')+" title='"+ms.titleAttr(formId,'PRODUCT_COUNT','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_COUNT']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='FINISH_COUNT' name='noprintset_FINISH_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'FINISH_COUNT')+"' style='"+ms.tdStyle(formId, 'FINISH_COUNT')+"' "+ms.tdEvent(formId, 'FINISH_COUNT')+">")
                arrHtml.push("<span colno='FINISH_COUNT' class='"+ms.uiClass(formId, 'FINISH_COUNT')+"' style='"+ms.uiStyle(formId, 'FINISH_COUNT')+"' "+ms.uiEvent(formId, 'FINISH_COUNT')+" title='"+ms.titleAttr(formId,'FINISH_COUNT','IS_TITLE_ATTR',v)+"' >"+v['FINISH_COUNT']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROJECT_SORT' name='noprintset_PROJECT_SORT' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_SORT')+"' style='"+ms.tdStyle(formId, 'PROJECT_SORT')+"' "+ms.tdEvent(formId, 'PROJECT_SORT')+">")
                arrHtml.push("<span colno='PROJECT_SORT' class='"+ms.uiClass(formId, 'PROJECT_SORT')+"' style='"+ms.uiStyle(formId, 'PROJECT_SORT')+"' "+ms.uiEvent(formId, 'PROJECT_SORT')+" title='"+ms.titleAttr(formId,'PROJECT_SORT','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_SORT']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='IS_REL' name='noprintset_IS_REL' class='datagrid-cell "+ms.tdClass(formId, 'IS_REL')+"' style='"+ms.tdStyle(formId, 'IS_REL')+"' "+ms.tdEvent(formId, 'IS_REL')+">")
                arrHtml.push("<span colno='IS_REL' class='"+ms.uiClass(formId, 'IS_REL')+"' style='"+ms.uiStyle(formId, 'IS_REL')+"' "+ms.uiEvent(formId, 'IS_REL')+" title='"+ms.titleAttr(formId,'IS_REL','IS_TITLE_ATTR',v)+"' >"+v['IS_REL']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROJECT_OFONESELF' name='noprintset_PROJECT_OFONESELF' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_OFONESELF')+"' style='"+ms.tdStyle(formId, 'PROJECT_OFONESELF')+"' "+ms.tdEvent(formId, 'PROJECT_OFONESELF')+">")
                arrHtml.push("<span colno='PROJECT_OFONESELF' class='"+ms.uiClass(formId, 'PROJECT_OFONESELF')+"' style='"+ms.uiStyle(formId, 'PROJECT_OFONESELF')+"' "+ms.uiEvent(formId, 'PROJECT_OFONESELF')+" title='"+ms.titleAttr(formId,'PROJECT_OFONESELF','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_OFONESELF']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROJECT_FLAG' name='noprintset_PROJECT_FLAG' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_FLAG')+"' style='"+ms.tdStyle(formId, 'PROJECT_FLAG')+"' "+ms.tdEvent(formId, 'PROJECT_FLAG')+">")
                arrHtml.push("<span colno='PROJECT_FLAG' class='"+ms.uiClass(formId, 'PROJECT_FLAG')+"' style='"+ms.uiStyle(formId, 'PROJECT_FLAG')+"' "+ms.uiEvent(formId, 'PROJECT_FLAG')+" title='"+ms.titleAttr(formId,'PROJECT_FLAG','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_FLAG']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_MATERIAL_VER' name='noprintset_PRODUCT_MATERIAL_VER' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_MATERIAL_VER')+"' style='"+ms.tdStyle(formId, 'PRODUCT_MATERIAL_VER')+"' "+ms.tdEvent(formId, 'PRODUCT_MATERIAL_VER')+">")
                arrHtml.push("<span colno='PRODUCT_MATERIAL_VER' class='"+ms.uiClass(formId, 'PRODUCT_MATERIAL_VER')+"' style='"+ms.uiStyle(formId, 'PRODUCT_MATERIAL_VER')+"' "+ms.uiEvent(formId, 'PRODUCT_MATERIAL_VER')+" title='"+ms.titleAttr(formId,'PRODUCT_MATERIAL_VER','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_MATERIAL_VER']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROJECT_ERPTYPE' name='noprintset_PROJECT_ERPTYPE' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_ERPTYPE')+"' style='"+ms.tdStyle(formId, 'PROJECT_ERPTYPE')+"' "+ms.tdEvent(formId, 'PROJECT_ERPTYPE')+">")
                arrHtml.push("<span colno='PROJECT_ERPTYPE' class='"+ms.uiClass(formId, 'PROJECT_ERPTYPE')+"' style='"+ms.uiStyle(formId, 'PROJECT_ERPTYPE')+"' "+ms.uiEvent(formId, 'PROJECT_ERPTYPE')+" title='"+ms.titleAttr(formId,'PROJECT_ERPTYPE','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_ERPTYPE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_CONFIGURE' name='noprintset_PRODUCT_CONFIGURE' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_CONFIGURE')+"' style='"+ms.tdStyle(formId, 'PRODUCT_CONFIGURE')+"' "+ms.tdEvent(formId, 'PRODUCT_CONFIGURE')+">")
                arrHtml.push("<span colno='PRODUCT_CONFIGURE' class='"+ms.uiClass(formId, 'PRODUCT_CONFIGURE')+"' style='"+ms.uiStyle(formId, 'PRODUCT_CONFIGURE')+"' "+ms.uiEvent(formId, 'PRODUCT_CONFIGURE')+" title='"+ms.titleAttr(formId,'PRODUCT_CONFIGURE','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_CONFIGURE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PM_CHANGE_TIMES' name='noprintset_PM_CHANGE_TIMES' class='datagrid-cell "+ms.tdClass(formId, 'PM_CHANGE_TIMES')+"' style='"+ms.tdStyle(formId, 'PM_CHANGE_TIMES')+"' "+ms.tdEvent(formId, 'PM_CHANGE_TIMES')+">")
                arrHtml.push("<span colno='PM_CHANGE_TIMES' class='"+ms.uiClass(formId, 'PM_CHANGE_TIMES')+"' style='"+ms.uiStyle(formId, 'PM_CHANGE_TIMES')+"' "+ms.uiEvent(formId, 'PM_CHANGE_TIMES')+" title='"+ms.titleAttr(formId,'PM_CHANGE_TIMES','IS_TITLE_ATTR',v)+"' >"+v['PM_CHANGE_TIMES']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_SN_START' name='noprintset_PRODUCT_SN_START' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_SN_START')+"' style='"+ms.tdStyle(formId, 'PRODUCT_SN_START')+"' "+ms.tdEvent(formId, 'PRODUCT_SN_START')+">")
                arrHtml.push("<span colno='PRODUCT_SN_START' class='"+ms.uiClass(formId, 'PRODUCT_SN_START')+"' style='"+ms.uiStyle(formId, 'PRODUCT_SN_START')+"' "+ms.uiEvent(formId, 'PRODUCT_SN_START')+" title='"+ms.titleAttr(formId,'PRODUCT_SN_START','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_SN_START']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_PACK_SEQ' name='noprintset_PRODUCT_PACK_SEQ' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_PACK_SEQ')+"' style='"+ms.tdStyle(formId, 'PRODUCT_PACK_SEQ')+"' "+ms.tdEvent(formId, 'PRODUCT_PACK_SEQ')+">")
                arrHtml.push("<span colno='PRODUCT_PACK_SEQ' class='"+ms.uiClass(formId, 'PRODUCT_PACK_SEQ')+"' style='"+ms.uiStyle(formId, 'PRODUCT_PACK_SEQ')+"' "+ms.uiEvent(formId, 'PRODUCT_PACK_SEQ')+" title='"+ms.titleAttr(formId,'PRODUCT_PACK_SEQ','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_PACK_SEQ']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_SN_PREFIX' name='noprintset_PRODUCT_SN_PREFIX' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_SN_PREFIX')+"' style='"+ms.tdStyle(formId, 'PRODUCT_SN_PREFIX')+"' "+ms.tdEvent(formId, 'PRODUCT_SN_PREFIX')+">")
                arrHtml.push("<span colno='PRODUCT_SN_PREFIX' class='"+ms.uiClass(formId, 'PRODUCT_SN_PREFIX')+"' style='"+ms.uiStyle(formId, 'PRODUCT_SN_PREFIX')+"' "+ms.uiEvent(formId, 'PRODUCT_SN_PREFIX')+" title='"+ms.titleAttr(formId,'PRODUCT_SN_PREFIX','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_SN_PREFIX']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_SN_END' name='noprintset_PRODUCT_SN_END' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_SN_END')+"' style='"+ms.tdStyle(formId, 'PRODUCT_SN_END')+"' "+ms.tdEvent(formId, 'PRODUCT_SN_END')+">")
                arrHtml.push("<span colno='PRODUCT_SN_END' class='"+ms.uiClass(formId, 'PRODUCT_SN_END')+"' style='"+ms.uiStyle(formId, 'PRODUCT_SN_END')+"' "+ms.uiEvent(formId, 'PRODUCT_SN_END')+" title='"+ms.titleAttr(formId,'PRODUCT_SN_END','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_SN_END']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='FAI_NUM' name='noprintset_FAI_NUM' class='datagrid-cell "+ms.tdClass(formId, 'FAI_NUM')+"' style='"+ms.tdStyle(formId, 'FAI_NUM')+"' "+ms.tdEvent(formId, 'FAI_NUM')+">")
                arrHtml.push("<span colno='FAI_NUM' class='"+ms.uiClass(formId, 'FAI_NUM')+"' style='"+ms.uiStyle(formId, 'FAI_NUM')+"' "+ms.uiEvent(formId, 'FAI_NUM')+" title='"+ms.titleAttr(formId,'FAI_NUM','IS_TITLE_ATTR',v)+"' >"+v['FAI_NUM']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROJECT_STEP' name='noprintset_PROJECT_STEP' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_STEP')+"' style='"+ms.tdStyle(formId, 'PROJECT_STEP')+"' "+ms.tdEvent(formId, 'PROJECT_STEP')+">")
                arrHtml.push("<span colno='PROJECT_STEP' class='"+ms.uiClass(formId, 'PROJECT_STEP')+"' style='"+ms.uiStyle(formId, 'PROJECT_STEP')+"' "+ms.uiEvent(formId, 'PROJECT_STEP')+" title='"+ms.titleAttr(formId,'PROJECT_STEP','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_STEP']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_STANDARD' name='noprintset_PRODUCT_STANDARD' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_STANDARD')+"' style='"+ms.tdStyle(formId, 'PRODUCT_STANDARD')+"' "+ms.tdEvent(formId, 'PRODUCT_STANDARD')+">")
                arrHtml.push("<span colno='PRODUCT_STANDARD' class='"+ms.uiClass(formId, 'PRODUCT_STANDARD')+"' style='"+ms.uiStyle(formId, 'PRODUCT_STANDARD')+"' "+ms.uiEvent(formId, 'PRODUCT_STANDARD')+" title='"+ms.titleAttr(formId,'PRODUCT_STANDARD','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_STANDARD']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='SCRAPPED_QTY' name='noprintset_SCRAPPED_QTY' class='datagrid-cell "+ms.tdClass(formId, 'SCRAPPED_QTY')+"' style='"+ms.tdStyle(formId, 'SCRAPPED_QTY')+"' "+ms.tdEvent(formId, 'SCRAPPED_QTY')+">")
                arrHtml.push("<span colno='SCRAPPED_QTY' class='"+ms.uiClass(formId, 'SCRAPPED_QTY')+"' style='"+ms.uiStyle(formId, 'SCRAPPED_QTY')+"' "+ms.uiEvent(formId, 'SCRAPPED_QTY')+" title='"+ms.titleAttr(formId,'SCRAPPED_QTY','IS_TITLE_ATTR',v)+"' >"+v['SCRAPPED_QTY']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='DESTROY_NO' name='noprintset_DESTROY_NO' class='datagrid-cell "+ms.tdClass(formId, 'DESTROY_NO')+"' style='"+ms.tdStyle(formId, 'DESTROY_NO')+"' "+ms.tdEvent(formId, 'DESTROY_NO')+">")
                arrHtml.push("<span colno='DESTROY_NO' class='"+ms.uiClass(formId, 'DESTROY_NO')+"' style='"+ms.uiStyle(formId, 'DESTROY_NO')+"' "+ms.uiEvent(formId, 'DESTROY_NO')+" title='"+ms.titleAttr(formId,'DESTROY_NO','IS_TITLE_ATTR',v)+"' >"+v['DESTROY_NO']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CUST_CODE' name='noprintset_CUST_CODE' class='datagrid-cell "+ms.tdClass(formId, 'CUST_CODE')+"' style='"+ms.tdStyle(formId, 'CUST_CODE')+"' "+ms.tdEvent(formId, 'CUST_CODE')+">")
                arrHtml.push("<span colno='CUST_CODE' class='"+ms.uiClass(formId, 'CUST_CODE')+"' style='"+ms.uiStyle(formId, 'CUST_CODE')+"' "+ms.uiEvent(formId, 'CUST_CODE')+" title='"+ms.titleAttr(formId,'CUST_CODE','IS_TITLE_ATTR',v)+"' >"+v['CUST_CODE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='FQC_COUNT' name='noprintset_FQC_COUNT' class='datagrid-cell "+ms.tdClass(formId, 'FQC_COUNT')+"' style='"+ms.tdStyle(formId, 'FQC_COUNT')+"' "+ms.tdEvent(formId, 'FQC_COUNT')+">")
                arrHtml.push("<span colno='FQC_COUNT' class='"+ms.uiClass(formId, 'FQC_COUNT')+"' style='"+ms.uiStyle(formId, 'FQC_COUNT')+"' "+ms.uiEvent(formId, 'FQC_COUNT')+" title='"+ms.titleAttr(formId,'FQC_COUNT','IS_TITLE_ATTR',v)+"' >"+v['FQC_COUNT']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WORKING_SC' name='noprintset_WORKING_SC' class='datagrid-cell "+ms.tdClass(formId, 'WORKING_SC')+"' style='"+ms.tdStyle(formId, 'WORKING_SC')+"' "+ms.tdEvent(formId, 'WORKING_SC')+">")
                arrHtml.push("<span colno='WORKING_SC' class='"+ms.uiClass(formId, 'WORKING_SC')+"' style='"+ms.uiStyle(formId, 'WORKING_SC')+"' "+ms.uiEvent(formId, 'WORKING_SC')+" title='"+ms.titleAttr(formId,'WORKING_SC','IS_TITLE_ATTR',v)+"' >"+v['WORKING_SC']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROJECT_TYPE' name='noprintset_PROJECT_TYPE' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_TYPE')+"' style='"+ms.tdStyle(formId, 'PROJECT_TYPE')+"' "+ms.tdEvent(formId, 'PROJECT_TYPE')+">")
                arrHtml.push("<span colno='PROJECT_TYPE' class='"+ms.uiClass(formId, 'PROJECT_TYPE')+"' style='"+ms.uiStyle(formId, 'PROJECT_TYPE')+"' "+ms.uiEvent(formId, 'PROJECT_TYPE')+" title='"+ms.titleAttr(formId,'PROJECT_TYPE','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_TYPE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROLEPSIS_START_DATE' name='noprintset_PROLEPSIS_START_DATE' class='datagrid-cell "+ms.tdClass(formId, 'PROLEPSIS_START_DATE')+"' style='"+ms.tdStyle(formId, 'PROLEPSIS_START_DATE')+"' "+ms.tdEvent(formId, 'PROLEPSIS_START_DATE')+">")
                arrHtml.push("<span colno='PROLEPSIS_START_DATE' class='"+ms.uiClass(formId, 'PROLEPSIS_START_DATE')+"' style='"+ms.uiStyle(formId, 'PROLEPSIS_START_DATE')+"' "+ms.uiEvent(formId, 'PROLEPSIS_START_DATE')+" title='"+ms.titleAttr(formId,'PROLEPSIS_START_DATE','IS_TITLE_ATTR',v)+"' >"+v['PROLEPSIS_START_DATE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROLEPSIS_END_DATE' name='noprintset_PROLEPSIS_END_DATE' class='datagrid-cell "+ms.tdClass(formId, 'PROLEPSIS_END_DATE')+"' style='"+ms.tdStyle(formId, 'PROLEPSIS_END_DATE')+"' "+ms.tdEvent(formId, 'PROLEPSIS_END_DATE')+">")
                arrHtml.push("<span colno='PROLEPSIS_END_DATE' class='"+ms.uiClass(formId, 'PROLEPSIS_END_DATE')+"' style='"+ms.uiStyle(formId, 'PROLEPSIS_END_DATE')+"' "+ms.uiEvent(formId, 'PROLEPSIS_END_DATE')+" title='"+ms.titleAttr(formId,'PROLEPSIS_END_DATE','IS_TITLE_ATTR',v)+"' >"+v['PROLEPSIS_END_DATE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='TPPB_PLAN_DELIVERY_DATE' name='noprintset_TPPB_PLAN_DELIVERY_DATE' class='datagrid-cell "+ms.tdClass(formId, 'TPPB_PLAN_DELIVERY_DATE')+"' style='"+ms.tdStyle(formId, 'TPPB_PLAN_DELIVERY_DATE')+"' "+ms.tdEvent(formId, 'TPPB_PLAN_DELIVERY_DATE')+">")
                arrHtml.push("<span colno='TPPB_PLAN_DELIVERY_DATE' class='"+ms.uiClass(formId, 'TPPB_PLAN_DELIVERY_DATE')+"' style='"+ms.uiStyle(formId, 'TPPB_PLAN_DELIVERY_DATE')+"' "+ms.uiEvent(formId, 'TPPB_PLAN_DELIVERY_DATE')+" title='"+ms.titleAttr(formId,'TPPB_PLAN_DELIVERY_DATE','IS_TITLE_ATTR',v)+"' >"+v['TPPB_PLAN_DELIVERY_DATE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PM_MEMO' name='noprintset_PM_MEMO' class='datagrid-cell "+ms.tdClass(formId, 'PM_MEMO')+"' style='"+ms.tdStyle(formId, 'PM_MEMO')+"' "+ms.tdEvent(formId, 'PM_MEMO')+">")
                arrHtml.push("<span colno='PM_MEMO' class='"+ms.uiClass(formId, 'PM_MEMO')+"' style='"+ms.uiStyle(formId, 'PM_MEMO')+"' "+ms.uiEvent(formId, 'PM_MEMO')+" title='"+ms.titleAttr(formId,'PM_MEMO','IS_TITLE_ATTR',v)+"' >"+v['PM_MEMO']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PRODUCT_LINE' name='noprintset_PRODUCT_LINE' class='datagrid-cell "+ms.tdClass(formId, 'PRODUCT_LINE')+"' style='"+ms.tdStyle(formId, 'PRODUCT_LINE')+"' "+ms.tdEvent(formId, 'PRODUCT_LINE')+">")
                arrHtml.push("<span colno='PRODUCT_LINE' class='"+ms.uiClass(formId, 'PRODUCT_LINE')+"' style='"+ms.uiStyle(formId, 'PRODUCT_LINE')+"' "+ms.uiEvent(formId, 'PRODUCT_LINE')+" title='"+ms.titleAttr(formId,'PRODUCT_LINE','IS_TITLE_ATTR',v)+"' >"+v['PRODUCT_LINE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ACTUAL_START_DATE' name='noprintset_ACTUAL_START_DATE' class='datagrid-cell "+ms.tdClass(formId, 'ACTUAL_START_DATE')+"' style='"+ms.tdStyle(formId, 'ACTUAL_START_DATE')+"' "+ms.tdEvent(formId, 'ACTUAL_START_DATE')+">")
                arrHtml.push("<span colno='ACTUAL_START_DATE' class='"+ms.uiClass(formId, 'ACTUAL_START_DATE')+"' style='"+ms.uiStyle(formId, 'ACTUAL_START_DATE')+"' "+ms.uiEvent(formId, 'ACTUAL_START_DATE')+" title='"+ms.titleAttr(formId,'ACTUAL_START_DATE','IS_TITLE_ATTR',v)+"' >"+v['ACTUAL_START_DATE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ACTUAL_END_DATE' name='noprintset_ACTUAL_END_DATE' class='datagrid-cell "+ms.tdClass(formId, 'ACTUAL_END_DATE')+"' style='"+ms.tdStyle(formId, 'ACTUAL_END_DATE')+"' "+ms.tdEvent(formId, 'ACTUAL_END_DATE')+">")
                arrHtml.push("<span colno='ACTUAL_END_DATE' class='"+ms.uiClass(formId, 'ACTUAL_END_DATE')+"' style='"+ms.uiStyle(formId, 'ACTUAL_END_DATE')+"' "+ms.uiEvent(formId, 'ACTUAL_END_DATE')+" title='"+ms.titleAttr(formId,'ACTUAL_END_DATE','IS_TITLE_ATTR',v)+"' >"+v['ACTUAL_END_DATE']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PM_CLOSE_REASON' name='noprintset_PM_CLOSE_REASON' class='datagrid-cell "+ms.tdClass(formId, 'PM_CLOSE_REASON')+"' style='"+ms.tdStyle(formId, 'PM_CLOSE_REASON')+"' "+ms.tdEvent(formId, 'PM_CLOSE_REASON')+">")
                arrHtml.push("<span colno='PM_CLOSE_REASON' class='"+ms.uiClass(formId, 'PM_CLOSE_REASON')+"' style='"+ms.uiStyle(formId, 'PM_CLOSE_REASON')+"' "+ms.uiEvent(formId, 'PM_CLOSE_REASON')+" title='"+ms.titleAttr(formId,'PM_CLOSE_REASON','IS_TITLE_ATTR',v)+"' >"+v['PM_CLOSE_REASON']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PM_OFONESELF' name='noprintset_PM_OFONESELF' class='datagrid-cell "+ms.tdClass(formId, 'PM_OFONESELF')+"' style='"+ms.tdStyle(formId, 'PM_OFONESELF')+"' "+ms.tdEvent(formId, 'PM_OFONESELF')+">")
                arrHtml.push("<span colno='PM_OFONESELF' class='"+ms.uiClass(formId, 'PM_OFONESELF')+"' style='"+ms.uiStyle(formId, 'PM_OFONESELF')+"' "+ms.uiEvent(formId, 'PM_OFONESELF')+" title='"+ms.titleAttr(formId,'PM_OFONESELF','IS_TITLE_ATTR',v)+"' >"+v['PM_OFONESELF']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PM_CHECK_STUST' name='noprintset_PM_CHECK_STUST' class='datagrid-cell "+ms.tdClass(formId, 'PM_CHECK_STUST')+"' style='"+ms.tdStyle(formId, 'PM_CHECK_STUST')+"' "+ms.tdEvent(formId, 'PM_CHECK_STUST')+">")
                arrHtml.push("<span colno='PM_CHECK_STUST' class='"+ms.uiClass(formId, 'PM_CHECK_STUST')+"' style='"+ms.uiStyle(formId, 'PM_CHECK_STUST')+"' "+ms.uiEvent(formId, 'PM_CHECK_STUST')+" title='"+ms.titleAttr(formId,'PM_CHECK_STUST','IS_TITLE_ATTR',v)+"' >"+v['PM_CHECK_STUST']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='REL_NUM' name='noprintset_REL_NUM' class='datagrid-cell "+ms.tdClass(formId, 'REL_NUM')+"' style='"+ms.tdStyle(formId, 'REL_NUM')+"' "+ms.tdEvent(formId, 'REL_NUM')+">")
                arrHtml.push("<span colno='REL_NUM' class='"+ms.uiClass(formId, 'REL_NUM')+"' style='"+ms.uiStyle(formId, 'REL_NUM')+"' "+ms.uiEvent(formId, 'REL_NUM')+" title='"+ms.titleAttr(formId,'REL_NUM','IS_TITLE_ATTR',v)+"' >"+v['REL_NUM']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CHECK_MON' name='noprintset_CHECK_MON' class='datagrid-cell "+ms.tdClass(formId, 'CHECK_MON')+"' style='"+ms.tdStyle(formId, 'CHECK_MON')+"' "+ms.tdEvent(formId, 'CHECK_MON')+">")
                arrHtml.push("<span colno='CHECK_MON' class='"+ms.uiClass(formId, 'CHECK_MON')+"' style='"+ms.uiStyle(formId, 'CHECK_MON')+"' "+ms.uiEvent(formId, 'CHECK_MON')+" title='"+ms.titleAttr(formId,'CHECK_MON','IS_TITLE_ATTR',v)+"' >"+v['CHECK_MON']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CHECK_USER' name='noprintset_CHECK_USER' class='datagrid-cell "+ms.tdClass(formId, 'CHECK_USER')+"' style='"+ms.tdStyle(formId, 'CHECK_USER')+"' "+ms.tdEvent(formId, 'CHECK_USER')+">")
                arrHtml.push("<span colno='CHECK_USER' class='"+ms.uiClass(formId, 'CHECK_USER')+"' style='"+ms.uiStyle(formId, 'CHECK_USER')+"' "+ms.uiEvent(formId, 'CHECK_USER')+" title='"+ms.titleAttr(formId,'CHECK_USER','IS_TITLE_ATTR',v)+"' >"+v['CHECK_USER']+"</span>")
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
            });
            if($("#leftTableDiv"+formId).length>0){
                $("#left-tbody_"+formId).html(arrLeftHtml.join(""));
            }
            setCrossWiseScroll(formId,arrHtml);
            $("#tbody_print_"+formId).html(arrHtml.join(""));
        }
        setNumColWidth(formId);
        clearAllSelect();
        setTableWidth(formId);
        setScroll(formId);
    }
</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17" />
    <jsp:param name="location" value="pageOver" />
</jsp:include>

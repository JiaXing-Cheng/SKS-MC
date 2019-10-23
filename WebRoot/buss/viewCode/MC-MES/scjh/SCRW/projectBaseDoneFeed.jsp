<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes" %>
<!-- 页面加载前 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
    <jsp:param name="location" value="beforePageLoad"/>
</jsp:include>
<head>
    <title>
        <dict:lang value="VOID-生产投料-当日已处理"/>
    </title>
    <%@ include file="/plf/common/pub_meta.jsp" %>
    <jsp:include page="/plf/common/fp/pub_head_fp.jsp">
        <jsp:param name="popDivWinFp" value="1"/>
        <jsp:param name="datePicker" value="1"/>
        <jsp:param name="chosen" value="1"/>
        <jsp:param name="msData" value="1"/>
        <jsp:param name="scroll" value="1"/>
        <jsp:param name="jqueryprint" value="1"/>

    </jsp:include>
    <%@ include file="/plf/page/common/buss/bussCommJs.jsp" %>
    <%@ include file="/plf/page/common/buss/listCommJs.jsp" %>
    <bu:header formId="a0cfcc72571b4ecfbbf29457cd0065de"/>


    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17"/>
        <jsp:param name="location" value="inHead"/>
    </jsp:include>
    <!-- head里面 -->
    <!-- 产品静态资源 -->


    <object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
        <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
    </object>
    <style>
        .tui-checkbox:checked {
            background:#1673ff
        }
        .tui-checkbox {
            width:25px;
            height:25px;
            background-color:#ffffff;
            border:solid 1px #dddddd;
            -webkit-border-radius:50%;
            border-radius:50%;
            font-size:0.8rem;
            margin:0;
            padding:0;
            position:relative;
            display:inline-block;
            vertical-align:top;
            cursor:default;
            -webkit-appearance:none;
            -webkit-user-select:none;
            user-select:none;
            -webkit-transition:background-color ease 0.1s;
            transition:background-color ease 0.1s;
        }
    </style>
</head>

<body>

<div class="content-in">
    <div class="dlist">
        <div class="hd">
            <bu:func viewId="079ee9c3a552401389da8c46ea37391f"/>
        </div>
        <div class="bd">
            <div class="search-box">
                <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                        <jsp:param name="modelName" value="VIEW_TYPE_17"/>
                        <jsp:param name="location" value="searchForm"/>
                    </jsp:include>


                    <table class="search_table">
                        <bu:search deal_mark="1" viewId="079ee9c3a552401389da8c46ea37391f"/>

                    </table>

                </form>
                <a href="javascript:void(0);" class="more"></a>
            </div>
            <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
                    <jsp:param name="location" value="listForm"/>
                </jsp:include>
                <input type="hidden" name="formPagea0cfcc72571b4ecfbbf29457cd0065de" id="formPagea0cfcc72571b4ecfbbf29457cd0065de" value="${formPagea0cfcc72571b4ecfbbf29457cd0065de}"/>
                <input type="hidden" name="formId" id="formId1" value='a0cfcc72571b4ecfbbf29457cd0065de'/>
                <input type="hidden" id="subRelColIds" name="subRelColIds" value='b4887891b965449590b07e02827ef021'/>
                <input type="hidden" id="subFormIds" name="subFormIds" value='f8a9d1a221784763af0205f8f4b07d54'/>
                <div class="panel-ajax datagrid datagrid-div1" id="a0cfcc72571b4ecfbbf29457cd0065de">
                    <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxa0cfcc72571b4ecfbbf29457cd0065de" style="">
                        <div class="datagrid-header">
                            <div class="datagrid-header-inner" id="datagrid-header-innera0cfcc72571b4ecfbbf29457cd0065de">
                                <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablea0cfcc72571b4ecfbbf29457cd0065de">
                                    <s:set name="_$type" value="'view'"/>
                                    <tbody class="isParentsTitle">
                                    <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
                                        <td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;">
                                            <bu:thSeq formId="a0cfcc72571b4ecfbbf29457cd0065de" i18n="1"/></td>
                                        <td class="datagrid-cell no-print" style="width:30px; text-align:center;">
                                            <span><input class='tui-checkbox' type="checkbox" id="selectAll_a0cfcc72571b4ecfbbf29457cd0065de" onclick="_selectAjaxTableAllData(this,'a0cfcc72571b4ecfbbf29457cd0065de')" style="cursor: pointer; display:none;" title="全选"/></span>
                                        </td>
                                        <!--
                                        <td class="datagrid-cell" style="width:200px;">
                                        <bu:uitn colNo="DATA_AUTH" formId="a0cfcc72571b4ecfbbf29457cd0065de"/></td>
                                        <td class="datagrid-cell" style="width:150px;">
                                        <bu:uitn colNo="PROJECT_ID" formId="a0cfcc72571b4ecfbbf29457cd0065de"/></td>
                                        <%--
                                        <td name="noprintset_MODEL_CODE" class="datagrid-cell">
                                            <bu:uitn colNo="MODEL_CODE" formId="a0cfcc72571b4ecfbbf29457cd0065de"/></td>
                                        --%>
                                        <td class="datagrid-cell" style="width:90px;">
                                        <bu:uitn colNo="WEIGHT_EMP" formId="a0cfcc72571b4ecfbbf29457cd0065de"/></td>
                                        <td class="datagrid-cell" style="width:90px;">
                                        <bu:uitn colNo="WEIGHT_MONITOR" formId="a0cfcc72571b4ecfbbf29457cd0065de"/></td>
                                        <td class="datagrid-cell" style="width:90px;">
                                        <bu:uitn colNo="CRAFTS_EMP" formId="a0cfcc72571b4ecfbbf29457cd0065de"/></td>
                                        <td class="datagrid-cell" style="width:90px;">
                                        <bu:uitn colNo="ADMIN_EMP" formId="a0cfcc72571b4ecfbbf29457cd0065de"/></td>
                                        <td class="datagrid-cell" style="width:90px;">
                                        <bu:uitn colNo="LOT_NUMBER" formId="a0cfcc72571b4ecfbbf29457cd0065de"/></td>
                                        <td class="datagrid-cell" style="width:90px;">
                                        <bu:uitn colNo="T5#PRODUCT_COUNT" formId="a0cfcc72571b4ecfbbf29457cd0065de"/></td>
                                        <td class="datagrid-cell" style="width:90px;">
                                        <bu:uitn colNo="T2#PREPARE_COUNT" formId="a0cfcc72571b4ecfbbf29457cd0065de"/></td>
                                        <td class="datagrid-cell" style="width:90px;">
                                        <bu:uitn colNo="T3#FEED_COUNT" formId="a0cfcc72571b4ecfbbf29457cd0065de"/></td>
                                        -->

                                        <td class="datagrid-cell" style="text-align:center;width:100px;">
                                            <bu:uitn colNo="PROJECT_ID" formId="a0cfcc72571b4ecfbbf29457cd0065de"/></td>
                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
                                            <bu:uitn colNo="T5#PROJECT_STATUS" formId="a0cfcc72571b4ecfbbf29457cd0065de"/></td>

                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
                                            <bu:uitn colNo="T5#LOT_NUMBER" formId="a0cfcc72571b4ecfbbf29457cd0065de"/></td>

                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
                                            <bu:uitn colNo="T5#PRODUCT_MATERIAL" formId="a0cfcc72571b4ecfbbf29457cd0065de"/></td>

                                        <td class="datagrid-cell" style="text-align:center;width:150px;">
                                            <bu:uitn colNo="T5#PRODUCT_NAME" formId="a0cfcc72571b4ecfbbf29457cd0065de"/></td>


                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
                                            <bu:uitn colNo="T5#PRODUCT_COUNT" formId="a0cfcc72571b4ecfbbf29457cd0065de"/></td>

                                        <td class="datagrid-cell" style="width:70px;">
                                            <bu:uitn colNo="T4#FEED_NUM" formId="a0cfcc72571b4ecfbbf29457cd0065de"/></td>

                                        <td class="datagrid-cell" style="width:70px;">
                                            <bu:uitn colNo="RECEIVE_COUNT" formId="a0cfcc72571b4ecfbbf29457cd0065de"/></td>

                                        <td class="datagrid-cell" style="width:90px;">
                                            <bu:uitn colNo="T5#PROJECT_SORT" formId="a0cfcc72571b4ecfbbf29457cd0065de"/></td>

                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
                                            <bu:uitn colNo="CREATE_USER" formId="a0cfcc72571b4ecfbbf29457cd0065de"/></td>
                                        <td class="datagrid-cell" style="text-align:center;width:100px;">
                                            <bu:uitn colNo="CREATE_TIME" formId="a0cfcc72571b4ecfbbf29457cd0065de"/></td>
                                        <td class="datagrid-cell" style="text-align:center;width:70px;">
                                            <bu:uitn colNo="ADMIN_EMP" formId="a0cfcc72571b4ecfbbf29457cd0065de"/></td>
                                        <td class="datagrid-cell" style="text-align:center;width:150px;">
                                            <bu:uitn colNo="EDIT_TIME" formId="a0cfcc72571b4ecfbbf29457cd0065de"/></td>



                                    </bu:tr>
                                    </tbody>
                                </bu:table>
                            </div>
                        </div>
                        <div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiva0cfcc72571b4ecfbbf29457cd0065de" onscroll="ajaxTableScroll(this,'a0cfcc72571b4ecfbbf29457cd0065de')">
                            <table class="datagrid-btable fixedTable dblClick" id="datagrid-btable-ajaxa0cfcc72571b4ecfbbf29457cd0065de">
                                <tbody id="tbody_a0cfcc72571b4ecfbbf29457cd0065de" class="isParents"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <c:if test="${formPagea0cfcc72571b4ecfbbf29457cd0065de==1}">
                    <div class="center">
                        <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=a0cfcc72571b4ecfbbf29457cd0065de&showLoading=0"/>
                    </div>
                </c:if>

                <div id="printset_div" style="background-color: white;margin-top: 50px;display:none;">
                    <div class="hd" style="background-color: #f6f5f7;height: 35px;">
                        <div class="optn" style="top:45px;right:30px;">
                            <button type="button" onclick="printset_17('a0cfcc72571b4ecfbbf29457cd0065de','1');">打印</button>
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
                                <td style="width: 100px;text-align: right;">
                                    <span>序号</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="SEQ" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="SEQ" value="30" title_name="序号"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>工单号</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="PROJECT_ID" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="PROJECT_ID" value="" title_name="工单号"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>机种料号</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="MODEL_CODE" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="MODEL_CODE" value="" title_name="机种料号"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>司称</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="WEIGHT_EMP" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="WEIGHT_EMP" value="" title_name="司称"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>监称</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="WEIGHT_MONITOR" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="WEIGHT_MONITOR" value="" title_name="监称"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>工艺员</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="CRAFTS_EMP" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="CRAFTS_EMP" value="" title_name="工艺员"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>管理员</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="ADMIN_EMP" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="ADMIN_EMP" value="" title_name="管理员"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>生产批次</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="LOT_NUMBER" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="LOT_NUMBER" value="" title_name="生产批次"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>总量总计</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="T5#PRODUCT_COUNT" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="T5#PRODUCT_COUNT" value="" title_name="总量总计"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>备料总重</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="T2#PREPARE_COUNT" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="T2#PREPARE_COUNT" value="" title_name="备料总重"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>实投总重</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="T3#FEED_COUNT" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="T3#FEED_COUNT" value="" title_name="实投总重"/>px
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px;text-align: right;">
                                    <span>投料个数</span>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="checkbox" name="T4#FEED_NUM" value="1" checked="checked"/>
                                </td>
                                <td style="padding-left: 5px;">
                                    <input type="text" name="T4#FEED_NUM" value="" title_name="投料个数"/>px
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <input type="hidden" name="formPagef8a9d1a221784763af0205f8f4b07d54" id="formPagef8a9d1a221784763af0205f8f4b07d54" value="${formPagef8a9d1a221784763af0205f8f4b07d54}"/>
                <input type="hidden" name="formId" id="formId2" value='f8a9d1a221784763af0205f8f4b07d54'/>
                <div class="panel-ajax datagrid datagrid-div1" id="f8a9d1a221784763af0205f8f4b07d54" style="display: none;">
                    <div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxf8a9d1a221784763af0205f8f4b07d54" style="">
                        <div class="datagrid-header">
                            <div class="datagrid-header-inner" id="datagrid-header-innerf8a9d1a221784763af0205f8f4b07d54">
                                <bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz" id="datagrid-htablef8a9d1a221784763af0205f8f4b07d54">
                                    <s:set name="_$type" value="'view'"/>
                                    <tbody class="isChildsTitle">
                                    <bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">
                                        <td class="datagrid-cell" name="noprintset_SEQ" style="width:30px; text-align:center;">
                                            <bu:thSeq formId="f8a9d1a221784763af0205f8f4b07d54" i18n="1"/></td>
                                        <td class="datagrid-cell no-print" style="width:30px; text-align:center;display:none;">
                                            <span><input type="checkbox" id="selectAll_f8a9d1a221784763af0205f8f4b07d54" onclick="_selectAjaxTableAllData(this,'f8a9d1a221784763af0205f8f4b07d54')" style="cursor: pointer;" title="全选"/></span>
                                        </td>
                                        <td name="noprintset_PROJECT_ID" class="datagrid-cell" style="text-align:center;width:100px;">
                                            <bu:uitn colNo="PROJECT_ID" formId="f8a9d1a221784763af0205f8f4b07d54"/></td>
                                        <td name="noprintset_ITEM_CODE" class="datagrid-cell" style="text-align:center;width:100px;">
                                            <bu:uitn colNo="ITEM_CODE" formId="f8a9d1a221784763af0205f8f4b07d54"/></td>
                                        <!--<td name="noprintset_MODEL_CODE" class="datagrid-cell">
                                        <bu:uitn colNo="MODEL_CODE" formId="f8a9d1a221784763af0205f8f4b07d54"/></td>-->
                                        <td name="noprintset_RAW_LOTNUMBER" class="datagrid-cell" Vstyle="text-align:center;width:100px;">
                                            <bu:uitn colNo="RAW_LOTNUMBER" formId="f8a9d1a221784763af0205f8f4b07d54"/></td>
                                        <td name="noprintset_STOCK_CODE" class="datagrid-cell" style="text-align:center;width:130px;">
                                            <bu:uitn colNo="STOCK_CODE" formId="f8a9d1a221784763af0205f8f4b07d54"/></td>

                                        <td name="noprintset_ITEM_NUM" class="datagrid-cell" style="text-align:center;width:90px;">
                                            <bu:uitn colNo="ITEM_NUM" formId="f8a9d1a221784763af0205f8f4b07d54"/></td>

                                        <td name="noprintset_FEED_NUM" class="datagrid-cell" style="text-align:center;width:90px;">
                                            <bu:uitn colNo="FEED_NUM" formId="f8a9d1a221784763af0205f8f4b07d54"/></td>

                                        <td name="noprintset_CREATE_USER" class="datagrid-cell" style="text-align:center;width:90px;">
                                            <bu:uitn colNo="CREATE_USER" formId="f8a9d1a221784763af0205f8f4b07d54"/></td>
                                        <td name="noprintset_T2#VAT_NO" class="datagrid-cell" style="text-align:center;width:90px;">
                                            <bu:uitn colNo="T2#VAT_NO" formId="f8a9d1a221784763af0205f8f4b07d54"/></td>
                                        <td name="noprintset_CREATE_TIME" class="datagrid-cell" style="text-align:center;width:90px;">
                                            <bu:uitn colNo="CREATE_TIME" formId="f8a9d1a221784763af0205f8f4b07d54"/></td>


                                    </bu:tr>
                                    </tbody>
                                </bu:table>
                            </div>
                        </div>
                        <div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivf8a9d1a221784763af0205f8f4b07d54" onscroll="ajaxTableScroll(this,'f8a9d1a221784763af0205f8f4b07d54')">
                            <table class="datagrid-btable fixedTable dblClick" id="datagrid-btable-ajaxf8a9d1a221784763af0205f8f4b07d54">
                                <tbody id="tbody_f8a9d1a221784763af0205f8f4b07d54" class="isChilds"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <c:if test="${formPagef8a9d1a221784763af0205f8f4b07d54==1}">
                    <div class="center" id="timef8a9d1a221784763af0205f8f4b07d54" style="display:none">
                        <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listChildAjaxTable&formId=f8a9d1a221784763af0205f8f4b07d54&showLoading=0"/>
                    </div>
                </c:if>
                <input type="hidden" id="relColVals" name="relColVals" value='PROJECT_ID'/>
                <input type="hidden" name="tableCount" id="tableCount" value='2'/>

            </form>
        </div>
    </div>
</div>
<bu:submit viewId="079ee9c3a552401389da8c46ea37391f"/>
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
    <jsp:param name="location" value="beforeJsLoad"/>
</jsp:include>
<bu:script viewId="079ee9c3a552401389da8c46ea37391f"/>

<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
    <jsp:param name="location" value="jsLoading"/>
</jsp:include>

<script type="text/javascript">
    $(function (){

        editDadtAuthStyle();
        var arr1 =  $("#EDIT_TIME_BEGIN").val().substr(0,11);

        var arr1 = arr1 + "00:00:00";

        var arr2 =  $("#EDIT_TIME_END").val().substr(0,11);

        var arr2 =  arr2 + "23:59:59";

        $("#EDIT_TIME_BEGIN").val(arr1);
        $("#EDIT_TIME_END").val(arr2);
    });

    function editDadtAuthStyle(){
        $("#DATA_AUTH").width("150px");
    }

    //单行选择时
    function chgCheckTr(e) {

        chgCheck(e);


    }



    //
    function chgCheck(e){


        if ($(e).attr('checked')) {
            $(e).attr("checked", false);
            $(e).prop('checked','false');
            $(":checkbox").removeAttr('checked');
        } else {
            $(":checkbox").removeAttr('checked');
            $(e).prop('checked','true');
        }

    }

</script>





<script>

    <%--生成异步表格--%>

    function createTableModel(ms, formId) {

        var arrHtml = [];
        var arrLeftHtml = [];
        var uiTxt = ms.uiTxt(formId) == null ? [] : ms.uiTxt(formId);
        var uiRaw = ms.uiRaw(formId) == null ? [] : ms.uiRaw(formId);
        var trClass = ms.trClass(formId);
        var trStyle = ms.trStyle(formId);
        var trEvent = ms.trEvent(formId);
        var colNo = $("#relColVals").val();
        if (formId == 'a0cfcc72571b4ecfbbf29457cd0065de') {<%--VOID-投料基础表单--%>
            $.each(uiTxt, function (i, v) {
                var backgroudColor = (i + 1) % 2 == 0 ? "tr-hover" : "";
                //onclick='chgCheckTr(this);'   onclick='itemJump2(\"" + v['PROJECT_ID'] + "\")'
                arrHtml.push("<tr onclick='itemJump2(\"" + v['PROJECT_ID'] + "\")'  class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                arrHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_" + v.ID + "'  value='" + v.DATA_AUTH_ID + "' />");
                getRelColVal(arrHtml, v, colNo);
                arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;'><span class='_noedit'>");
                arrHtml.push("<input type='checkbox' name='" + formId + "$ID' value='" + v.ID + "' class='isSubmit _selectdata tui-checkbox'  onchange='chgCheck(this);' style='cursor: pointer;margin:0;'></span>");
                arrHtml.push("</td>");

                arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell  " + ms.tdClass(formId, 'PROJECT_ID') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'PROJECT_ID') + "' " + ms.tdEvent(formId, 'PROJECT_ID') + ">");
                arrHtml.push("<span colno='PROJECT_ID' class='" + ms.uiClass(formId, 'PROJECT_ID') + "' style='" + ms.uiStyle(formId, 'PROJECT_ID') + "' " + ms.uiEvent(formId, 'PROJECT_ID') + " title='" + ms.titleAttr(formId, 'PROJECT_ID', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_ID'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='T5#PROJECT_STATUS' name='noprintset_T5#PROJECT_STATUS' class='datagrid-cell  " + ms.tdClass(formId, 'T5#PROJECT_STATUS') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'T5#PROJECT_STATUS') + "' " + ms.tdEvent(formId, 'T5#PROJECT_STATUS') + ">");
                arrHtml.push("<span colno='T5#PROJECT_STATUS' class='" + ms.uiClass(formId, 'T5#PROJECT_STATUS') + "' style='" + ms.uiStyle(formId, 'T5#PROJECT_STATUS') + "' " + ms.uiEvent(formId, 'T5#PROJECT_STATUS') + " title='" + ms.titleAttr(formId, 'T5#PROJECT_STATUS', 'IS_TITLE_ATTR', v) + "' >" + v['T5#PROJECT_STATUS'] + "</span>");
                arrHtml.push("</td>");

                arrHtml.push("<td colno='T5#LOT_NUMBER' name='noprintset_T5#LOT_NUMBER' class='datagrid-cell  " + ms.tdClass(formId, 'T5#LOT_NUMBER') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'T5#LOT_NUMBER') + "' " + ms.tdEvent(formId, 'T5#LOT_NUMBER') + ">");
                arrHtml.push("<span colno='T5#LOT_NUMBER' class='" + ms.uiClass(formId, 'T5#LOT_NUMBER') + "' style='" + ms.uiStyle(formId, 'T5#LOT_NUMBER') + "' " + ms.uiEvent(formId, 'T5#LOT_NUMBER') + " title='" + ms.titleAttr(formId, 'T5#LOT_NUMBER', 'IS_TITLE_ATTR', v) + "' >" + v['T5#LOT_NUMBER'] + "</span>");
                arrHtml.push("</td>");

                arrHtml.push("<td colno='T5#PRODUCT_MATERIAL' name='noprintset_T5#PRODUCT_MATERIAL' class='datagrid-cell  " + ms.tdClass(formId, 'T5#PRODUCT_MATERIAL') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'T5#PRODUCT_MATERIAL') + "' " + ms.tdEvent(formId, 'T5#PRODUCT_MATERIAL') + ">");
                arrHtml.push("<span colno='T5#PRODUCT_MATERIAL' class='" + ms.uiClass(formId, 'T5#PRODUCT_MATERIAL') + "' style='" + ms.uiStyle(formId, 'T5#PRODUCT_MATERIAL') + "' " + ms.uiEvent(formId, 'T5#PRODUCT_MATERIAL') + " title='" + ms.titleAttr(formId, 'T5#PRODUCT_MATERIAL', 'IS_TITLE_ATTR', v) + "' >" + v['T5#PRODUCT_MATERIAL'] + "</span>");
                arrHtml.push("</td>");

                arrHtml.push("<td colno='T5#PRODUCT_NAME' name='noprintset_T5#PRODUCT_NAME' class='datagrid-cell  " + ms.tdClass(formId, 'T5#PRODUCT_NAME') + "' style='text-align:center;width:150px;" + ms.tdStyle(formId, 'T5#PRODUCT_NAME') + "' " + ms.tdEvent(formId, 'T5#PRODUCT_NAME') + ">");
                arrHtml.push("<span colno='T5#PRODUCT_NAME' class='" + ms.uiClass(formId, 'T5#PRODUCT_NAME') + "' style='" + ms.uiStyle(formId, 'T5#PRODUCT_NAME') + "' " + ms.uiEvent(formId, 'T5#PRODUCT_NAME') + " title='" + ms.titleAttr(formId, 'T5#PRODUCT_NAME', 'IS_TITLE_ATTR', v) + "' >" + v['T5#PRODUCT_NAME'] + "</span>");
                arrHtml.push("</td>");



                arrHtml.push("<td colno='T5#PRODUCT_COUNT' name='noprintset_T5#PRODUCT_COUNT' class='datagrid-cell  " + ms.tdClass(formId, 'T5#PRODUCT_COUNT') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'T5#PRODUCT_COUNT') + "' " + ms.tdEvent(formId, 'T5#PRODUCT_COUNT') + ">");
                arrHtml.push("<span colno='T5#PRODUCT_COUNT' class='" + ms.uiClass(formId, 'T5#PRODUCT_COUNT') + "' style='" + ms.uiStyle(formId, 'T5#PRODUCT_COUNT') + "' " + ms.uiEvent(formId, 'T5#PRODUCT_COUNT') + " title='" + ms.titleAttr(formId, 'T5#PRODUCT_COUNT', 'IS_TITLE_ATTR', v) + "' >" + v['T5#PRODUCT_COUNT'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='T4#FEED_NUM' name='noprintset_T4#FEED_NUM' class='datagrid-cell  " + ms.tdClass(formId, 'T4#FEED_NUM') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'T4#FEED_NUM') + "' " + ms.tdEvent(formId, 'T4#FEED_NUM') + ">");
                arrHtml.push("<span colno='T4#FEED_NUM' class='" + ms.uiClass(formId, 'T4#FEED_NUM') + "' style='" + ms.uiStyle(formId, 'T4#FEED_NUM') + "' " + ms.uiEvent(formId, 'T4#FEED_NUM') + " title='" + ms.titleAttr(formId, 'T4#FEED_NUM', 'IS_TITLE_ATTR', v) + "' >" + v['T4#FEED_NUM'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='RECEIVE_COUNT' name='noprintset_RECEIVE_COUNT' class='datagrid-cell  " + ms.tdClass(formId, 'RECEIVE_COUNT') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'RECEIVE_COUNT') + "' " + ms.tdEvent(formId, 'RECEIVE_COUNT') + ">");
                arrHtml.push("<span colno='RECEIVE_COUNT' class='" + ms.uiClass(formId, 'RECEIVE_COUNT') + "' style='" + ms.uiStyle(formId, 'RECEIVE_COUNT') + "' " + ms.uiEvent(formId, 'RECEIVE_COUNT') + " title='" + ms.titleAttr(formId, 'RECEIVE_COUNT', 'IS_TITLE_ATTR', v) + "' >" + v['RECEIVE_COUNT'] + "</span>");
                arrHtml.push("</td>");

                arrHtml.push("<td colno='T5#PROJECT_SORT' name='noprintset_T5#PROJECT_SORT' class='datagrid-cell  " + ms.tdClass(formId, 'T5#PROJECT_SORT') + "' style='text-align:center;width:90px;" + ms.tdStyle(formId, 'T5#PROJECT_SORT') + "' " + ms.tdEvent(formId, 'T5#PROJECT_SORT') + ">");
                arrHtml.push("<span colno='T5#PROJECT_SORT' class='" + ms.uiClass(formId, 'T5#PROJECT_SORT') + "' style='" + ms.uiStyle(formId, 'T5#PROJECT_SORT') + "' " + ms.uiEvent(formId, 'T5#PROJECT_SORT') + " title='" + ms.titleAttr(formId, 'T5#PROJECT_SORT', 'IS_TITLE_ATTR', v) + "' >" + v['T5#PROJECT_SORT'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_USER' name='noprintset_CREATE_USER' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_USER') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'CREATE_USER') + "' " + ms.tdEvent(formId, 'CREATE_USER') + ">");
                arrHtml.push("<span colno='CREATE_USER' class='" + ms.uiClass(formId, 'CREATE_USER') + "' style='" + ms.uiStyle(formId, 'CREATE_USER') + "' " + ms.uiEvent(formId, 'CREATE_USER') + " title='" + ms.titleAttr(formId, 'CREATE_USER', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_USER'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CREATE_TIME' name='noprintset_CREATE_TIME' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_TIME') + "' style='text-align:center;width:100px;" + ms.tdStyle(formId, 'CREATE_TIME') + "' " + ms.tdEvent(formId, 'CREATE_TIME') + ">");
                arrHtml.push("<span colno='CREATE_TIME' class='" + ms.uiClass(formId, 'CREATE_TIME') + "' style='" + ms.uiStyle(formId, 'CREATE_TIME') + "' " + ms.uiEvent(formId, 'CREATE_TIME') + " title='" + ms.titleAttr(formId, 'CREATE_TIME', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_TIME'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ADMIN_EMP' name='noprintset_ADMIN_EMP' class='datagrid-cell  " + ms.tdClass(formId, 'ADMIN_EMP') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'ADMIN_EMP') + "' " + ms.tdEvent(formId, 'ADMIN_EMP') + ">");
                arrHtml.push("<span colno='ADMIN_EMP' class='" + ms.uiClass(formId, 'ADMIN_EMP') + "' style='" + ms.uiStyle(formId, 'ADMIN_EMP') + "' " + ms.uiEvent(formId, 'ADMIN_EMP') + " title='" + ms.titleAttr(formId, 'ADMIN_EMP', 'IS_TITLE_ATTR', v) + "' >" + v['ADMIN_EMP'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='EDIT_TIME' name='noprintset_EDIT_TIME' class='datagrid-cell  " + ms.tdClass(formId, 'EDIT_TIME') + "' style='text-align:center;width:100px;" + ms.tdStyle(formId, 'EDIT_TIME') + "' " + ms.tdEvent(formId, 'EDIT_TIME') + ">");
                arrHtml.push("<span colno='EDIT_TIME' class='" + ms.uiClass(formId, 'EDIT_TIME') + "' style='" + ms.uiStyle(formId, 'EDIT_TIME') + "' " + ms.uiEvent(formId, 'EDIT_TIME') + " title='" + ms.titleAttr(formId, 'EDIT_TIME', 'IS_TITLE_ATTR', v) + "' >" + v['EDIT_TIME'] + "</span>");
                arrHtml.push("</td>");


                arrHtml.push("</tr>")
            });
            if ($("#leftTableDiv" + formId).length > 0) {
                $("#left-tbody_" + formId).html(arrLeftHtml.join(""));
            }
            setCrossWiseScroll(formId, arrHtml);
            $("#tbody_" + formId).html(arrHtml.join(""));
        }
        if (formId == 'f8a9d1a221784763af0205f8f4b07d54') {<%--VOID-投料明细表单--%>
            $.each(uiTxt, function (i, v) {
                var backgroudColor = (i + 1) % 2 == 0 ? "tr-hover" : "";
                arrHtml.push("<tr class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                arrHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_" + v.ID + "'  value='" + v.DATA_AUTH_ID + "' />");
                arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;display:none;' ><span class='_noedit'>");
                arrHtml.push("<input type='checkbox' name='" + formId + "$ID' value='" + v.ID + "' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                arrHtml.push("</td>");

                arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell  " + ms.tdClass(formId, 'PROJECT_ID') + "' style='text-align:center;width:70px;" + "' " + ms.tdEvent(formId, 'PROJECT_ID') + ">");
                arrHtml.push("<span colno='PROJECT_ID' class='" + ms.uiClass(formId, 'PROJECT_ID') + "' style='" + ms.uiStyle(formId, 'PROJECT_ID') + "' " + ms.uiEvent(formId, 'PROJECT_ID') + " title='" + ms.titleAttr(formId, 'PROJECT_ID', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_ID'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ITEM_CODE' name='noprintset_ITEM_CODE' class='datagrid-cell  " + ms.tdClass(formId, 'ITEM_CODE') + "' style='" + ms.tdStyle(formId, 'ITEM_CODE') + "' " + ms.tdEvent(formId, 'ITEM_CODE') + ">");
                arrHtml.push("<span colno='ITEM_CODE' class='" + ms.uiClass(formId, 'ITEM_CODE') + "' style='" + ms.uiStyle(formId, 'ITEM_CODE') + "' " + ms.uiEvent(formId, 'ITEM_CODE') + " title='" + ms.titleAttr(formId, 'ITEM_CODE', 'IS_TITLE_ATTR', v) + "' >" + v['ITEM_CODE'] + "</span>");
                arrHtml.push("</td>");

                arrHtml.push("<td colno='RAW_LOTNUMBER' name='noprintset_RAW_LOTNUMBER' class='datagrid-cell  " + ms.tdClass(formId, 'RAW_LOTNUMBER') + "' style='" + ms.tdStyle(formId, 'RAW_LOTNUMBER') + "' " + ms.tdEvent(formId, 'RAW_LOTNUMBER') + ">");
                arrHtml.push("<span colno='RAW_LOTNUMBER' class='" + ms.uiClass(formId, 'RAW_LOTNUMBER') + "' style='" + ms.uiStyle(formId, 'RAW_LOTNUMBER') + "' " + ms.uiEvent(formId, 'RAW_LOTNUMBER') + " title='" + ms.titleAttr(formId, 'RAW_LOTNUMBER', 'IS_TITLE_ATTR', v) + "' >" + v['RAW_LOTNUMBER'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='STOCK_CODE' name='noprintset_STOCK_CODE' class='datagrid-cell  " + ms.tdClass(formId, 'STOCK_CODE') +"' style='text-align:center;width:100px;" + "' " + ms.tdEvent(formId, 'STOCK_CODE') + ">");
                arrHtml.push("<span colno='STOCK_CODE' class='" + ms.uiClass(formId, 'STOCK_CODE') + "' style='" + ms.uiStyle(formId, 'STOCK_CODE') + "' " + ms.uiEvent(formId, 'STOCK_CODE') + " title='" + ms.titleAttr(formId, 'STOCK_CODE', 'IS_TITLE_ATTR', v) + "' >" + v['STOCK_CODE'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ITEM_NUM' name='noprintset_ITEM_NUM' class='datagrid-cell  " + ms.tdClass(formId, 'ITEM_NUM') + "' style='" + ms.tdStyle(formId, 'ITEM_NUM') + "' " + ms.tdEvent(formId, 'ITEM_NUM') + ">");
                arrHtml.push("<span colno='ITEM_NUM' class='" + ms.uiClass(formId, 'ITEM_NUM') + "' style='" + ms.uiStyle(formId, 'ITEM_NUM') + "' " + ms.uiEvent(formId, 'ITEM_NUM') + " title='" + ms.titleAttr(formId, 'ITEM_NUM', 'IS_TITLE_ATTR', v) + "' >" + v['ITEM_NUM'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='FEED_NUM' name='noprintset_FEED_NUM' class='datagrid-cell  " + ms.tdClass(formId, 'FEED_NUM') + "' style='" + ms.tdStyle(formId, 'FEED_NUM') + "' " + ms.tdEvent(formId, 'FEED_NUM') + ">");
                arrHtml.push("<span colno='FEED_NUM' class='" + ms.uiClass(formId, 'FEED_NUM') + "' style='" + ms.uiStyle(formId, 'FEED_NUM') + "' " + ms.uiEvent(formId, 'FEED_NUM') + " title='" + ms.titleAttr(formId, 'FEED_NUM', 'IS_TITLE_ATTR', v) + "' >" + v['FEED_NUM'] + "</span>");
                arrHtml.push("</td>");

                //arrHtml.push("<td colno='EDIT_USER' name='noprintset_EDIT_USER' class='datagrid-cell  " + ms.tdClass(formId, 'EDIT_USER') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'EDIT_USER') + "' " + ms.tdEvent(formId, 'EDIT_USER') + ">")
                //arrHtml.push("<span colno='EDIT_USER' class='" + ms.uiClass(formId, 'EDIT_USER') + "' style='" + ms.uiStyle(formId, 'EDIT_USER') + "' " + ms.uiEvent(formId, 'EDIT_USER') + " title='" + ms.titleAttr(formId, 'EDIT_USER', 'IS_TITLE_ATTR', v) + "' >" + v['EDIT_USER'] + "</span>")
                //arrHtml.push("</td>");

                /*arrHtml.push("<td colno='EDIT_USER' name='noprintset_EDIT_USER' class='datagrid-cell  " + ms.tdClass(formId, 'EDIT_USER') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'EDIT_USER') + "' " + ms.tdEvent(formId, 'EDIT_USER') + ">")
              arrHtml.push("<span colno='EDIT_USER' class='" + ms.uiClass(formId, 'EDIT_USER') + "' style='" + ms.uiStyle(formId, 'EDIT_USER') + "' " + ms.uiEvent(formId, 'EDIT_USER') + " title='" + ms.titleAttr(formId, 'EDIT_USER', 'IS_TITLE_ATTR', v) + "' >" + v['EDIT_USER'] + "</span>")
              arrHtml.push("</td>");*/
                arrHtml.push("<td colno='CREATE_USER' name='noprintset_CREATE_USER' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_USER') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'CREATE_USER') + "' " + ms.tdEvent(formId, 'CREATE_USER') + ">");
                arrHtml.push("<span colno='CREATE_USER' class='" + ms.uiClass(formId, 'CREATE_USER') + "' style='" + ms.uiStyle(formId, 'CREATE_USER') + "' " + ms.uiEvent(formId, 'CREATE_USER') + " title='" + ms.titleAttr(formId, 'CREATE_USER', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_USER'] + "</span>");
                arrHtml.push("</td>");

                arrHtml.push("<td colno='T2#VAT_NO' name='noprintset_T2#VAT_NO' class='datagrid-cell  " + ms.tdClass(formId, 'T2#VAT_NO') + "' style='text-align:center;width:70px;" + ms.tdStyle(formId, 'T2#VAT_NO') + "' " + ms.tdEvent(formId, 'T2#VAT_NO') + ">");
                arrHtml.push("<span colno='T2#VAT_NO' class='" + ms.uiClass(formId, 'T2#VAT_NO') + "' style='" + ms.uiStyle(formId, 'T2#VAT_NO') + "' " + ms.uiEvent(formId, 'T2#VAT_NO') + " title='" + ms.titleAttr(formId, 'T2#VAT_NO', 'IS_TITLE_ATTR', v) + "' >" + v['T2#VAT_NO'] + "</span>");
                arrHtml.push("</td>");

                arrHtml.push("<td colno='CREATE_TIME' name='noprintset_CREATE_TIME' class='datagrid-cell  " + ms.tdClass(formId, 'CREATE_TIME') + "' style='text-align:center;width:100px;" + ms.tdStyle(formId, 'CREATE_TIME') + "' " + ms.tdEvent(formId, 'CREATE_TIME') + ">");
                arrHtml.push("<span colno='CREATE_TIME' class='" + ms.uiClass(formId, 'CREATE_TIME') + "' style='" + ms.uiStyle(formId, 'CREATE_TIME') + "' " + ms.uiEvent(formId, 'CREATE_TIME') + " title='" + ms.titleAttr(formId, 'CREATE_TIME', 'IS_TITLE_ATTR', v) + "' >" + v['CREATE_TIME'] + "</span>");
                arrHtml.push("</td>");

                arrHtml.push("</tr>")
            });
            if ($("#leftTableDiv" + formId).length > 0) {
                $("#left-tbody_" + formId).html(arrLeftHtml.join(""));
            }
            setCrossWiseScroll(formId, arrHtml);
            $("#tbody_" + formId).html(arrHtml.join(""));
        }
        setNumColWidth(formId);
        clearAllSelect();
        setTableWidth(formId);
        setScroll(formId);
    }
</script>
<script type="text/javascript">
    <%--生成异步表格--%>

    function createTableModel_print(ms, formId) {
        var arrHtml = [];
        var arrLeftHtml = [];
        var uiTxt = ms.uiTxt(formId) == null ? [] : ms.uiTxt(formId);
        var trClass = ms.trClass(formId);
        var trStyle = ms.trStyle(formId);
        var trEvent = ms.trEvent(formId);
        var colNo = $("#relColVals").val();
        if (formId == 'a0cfcc72571b4ecfbbf29457cd0065de') {<%--VOID-投料基础表单--%>
            $.each(uiTxt, function (i, v) {
                var backgroudColor = (i + 1) % 2 == 0 ? "tr-hover" : "";
                arrHtml.push("<tr class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                arrHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                getRelColVal(arrHtml, v, colNo);
                arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                /*
                                arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell " + ms.tdClass(formId, 'PROJECT_ID') + "' style='" + ms.tdStyle(formId, 'PROJECT_ID') + "' " + ms.tdEvent(formId, 'PROJECT_ID') + ">")
                                arrHtml.push("<span colno='PROJECT_ID' class='" + ms.uiClass(formId, 'PROJECT_ID') + "' style='" + ms.uiStyle(formId, 'PROJECT_ID') + "' " + ms.uiEvent(formId, 'PROJECT_ID') + " title='" + ms.titleAttr(formId, 'PROJECT_ID', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_ID'] + "</span>")
                                arrHtml.push("</td>");
                */

                arrHtml.push("<td colno='PROJECT_ID' class='datagrid-cell "+ms.tdClass(formId, 'PROJECT_ID')+"' style='width:150px;"+ms.tdStyle(formId, 'PROJECT_ID')+"' "+ms.tdEvent(formId, 'PROJECT_ID')+">");
                arrHtml.push("<span colno='PROJECT_ID' class='"+ms.uiClass(formId, 'PROJECT_ID')+"' onclick='itemJump1(\""+v['PROJECT_ID']+"\")' style='display: inline;border-bottom: 1px solid #004098;' "+ms.uiEvent(formId, 'PROJECT_ID')+" title='"+ms.titleAttr(formId,'PROJECT_ID','IS_TITLE_ATTR',v)+"' >"+v['PROJECT_ID']+"</span>");
                arrHtml.push("</td>");

                arrHtml.push("<td colno='MODEL_CODE' name='noprintset_MODEL_CODE' class='datagrid-cell " + ms.tdClass(formId, 'MODEL_CODE') + "' style='" + ms.tdStyle(formId, 'MODEL_CODE') + "' " + ms.tdEvent(formId, 'MODEL_CODE') + ">");
                arrHtml.push("<span colno='MODEL_CODE' class='" + ms.uiClass(formId, 'MODEL_CODE') + "' style='" + ms.uiStyle(formId, 'MODEL_CODE') + "' " + ms.uiEvent(formId, 'MODEL_CODE') + " title='" + ms.titleAttr(formId, 'MODEL_CODE', 'IS_TITLE_ATTR', v) + "' >" + v['MODEL_CODE'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WEIGHT_EMP' name='noprintset_WEIGHT_EMP' class='datagrid-cell " + ms.tdClass(formId, 'WEIGHT_EMP') + "' style='" + ms.tdStyle(formId, 'WEIGHT_EMP') + "' " + ms.tdEvent(formId, 'WEIGHT_EMP') + ">");
                arrHtml.push("<span colno='WEIGHT_EMP' class='" + ms.uiClass(formId, 'WEIGHT_EMP') + "' style='" + ms.uiStyle(formId, 'WEIGHT_EMP') + "' " + ms.uiEvent(formId, 'WEIGHT_EMP') + " title='" + ms.titleAttr(formId, 'WEIGHT_EMP', 'IS_TITLE_ATTR', v) + "' >" + v['WEIGHT_EMP'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='WEIGHT_MONITOR' name='noprintset_WEIGHT_MONITOR' class='datagrid-cell " + ms.tdClass(formId, 'WEIGHT_MONITOR') + "' style='" + ms.tdStyle(formId, 'WEIGHT_MONITOR') + "' " + ms.tdEvent(formId, 'WEIGHT_MONITOR') + ">");
                arrHtml.push("<span colno='WEIGHT_MONITOR' class='" + ms.uiClass(formId, 'WEIGHT_MONITOR') + "' style='" + ms.uiStyle(formId, 'WEIGHT_MONITOR') + "' " + ms.uiEvent(formId, 'WEIGHT_MONITOR') + " title='" + ms.titleAttr(formId, 'WEIGHT_MONITOR', 'IS_TITLE_ATTR', v) + "' >" + v['WEIGHT_MONITOR'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='CRAFTS_EMP' name='noprintset_CRAFTS_EMP' class='datagrid-cell " + ms.tdClass(formId, 'CRAFTS_EMP') + "' style='" + ms.tdStyle(formId, 'CRAFTS_EMP') + "' " + ms.tdEvent(formId, 'CRAFTS_EMP') + ">");
                arrHtml.push("<span colno='CRAFTS_EMP' class='" + ms.uiClass(formId, 'CRAFTS_EMP') + "' style='" + ms.uiStyle(formId, 'CRAFTS_EMP') + "' " + ms.uiEvent(formId, 'CRAFTS_EMP') + " title='" + ms.titleAttr(formId, 'CRAFTS_EMP', 'IS_TITLE_ATTR', v) + "' >" + v['CRAFTS_EMP'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ADMIN_EMP' name='noprintset_ADMIN_EMP' class='datagrid-cell " + ms.tdClass(formId, 'ADMIN_EMP') + "' style='" + ms.tdStyle(formId, 'ADMIN_EMP') + "' " + ms.tdEvent(formId, 'ADMIN_EMP') + ">");
                arrHtml.push("<span colno='ADMIN_EMP' class='" + ms.uiClass(formId, 'ADMIN_EMP') + "' style='" + ms.uiStyle(formId, 'ADMIN_EMP') + "' " + ms.uiEvent(formId, 'ADMIN_EMP') + " title='" + ms.titleAttr(formId, 'ADMIN_EMP', 'IS_TITLE_ATTR', v) + "' >" + v['ADMIN_EMP'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='T5#LOT_NUMBER' name='noprintset_T5#LOT_NUMBER' class='datagrid-cell " + ms.tdClass(formId, 'T5#LOT_NUMBER') + "' style='" + ms.tdStyle(formId, 'T5#LOT_NUMBER') + "' " + ms.tdEvent(formId, 'T5#LOT_NUMBER') + ">");
                arrHtml.push("<span colno='T5#LOT_NUMBER' class='" + ms.uiClass(formId, 'T5#LOT_NUMBER') + "' style='" + ms.uiStyle(formId, 'T5#LOT_NUMBER') + "' " + ms.uiEvent(formId, 'T5#LOT_NUMBER') + " title='" + ms.titleAttr(formId, 'T5#LOT_NUMBER', 'IS_TITLE_ATTR', v) + "' >" + v['T5#LOT_NUMBER'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='T5#PRODUCT_COUNT' name='noprintset_WEIGHT_COUNT' class='datagrid-cell " + ms.tdClass(formId, 'T5#PRODUCT_COUNT') + "' style='" + ms.tdStyle(formId, 'T5#PRODUCT_COUNT') + "' " + ms.tdEvent(formId, 'T5#PRODUCT_COUNT') + ">");
                arrHtml.push("<span colno='T5#PRODUCT_COUNT' class='" + ms.uiClass(formId, 'T5#PRODUCT_COUNT') + "' style='" + ms.uiStyle(formId, 'T5#PRODUCT_COUNT') + "' " + ms.uiEvent(formId, 'T5#PRODUCT_COUNT') + " title='" + ms.titleAttr(formId, 'T5#PRODUCT_COUNT', 'IS_TITLE_ATTR', v) + "' >" + v['T5#PRODUCT_COUNT'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='T2#PREPARE_COUNT' name='noprintset_PREPARE_COUNT' class='datagrid-cell " + ms.tdClass(formId, 'T2#PREPARE_COUNT') + "' style='" + ms.tdStyle(formId, 'T2#PREPARE_COUNT') + "' " + ms.tdEvent(formId, 'T2#PREPARE_COUNT') + ">");
                arrHtml.push("<span colno='T2#PREPARE_COUNT' class='" + ms.uiClass(formId, 'T2#PREPARE_COUNT') + "' style='" + ms.uiStyle(formId, 'T2#PREPARE_COUNT') + "' " + ms.uiEvent(formId, 'T2#PREPARE_COUNT') + " title='" + ms.titleAttr(formId, 'T2#PREPARE_COUNT', 'IS_TITLE_ATTR', v) + "' >" + v['T2#PREPARE_COUNT'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='T3#FEED_COUNT' name='noprintset_FEED_COUNT' class='datagrid-cell " + ms.tdClass(formId, 'T3#FEED_COUNT') + "' style='" + ms.tdStyle(formId, 'T3#FEED_COUNT') + "' " + ms.tdEvent(formId, 'T3#FEED_COUNT') + ">");
                arrHtml.push("<span colno='T3#FEED_COUNT' class='" + ms.uiClass(formId, 'T3#FEED_COUNT') + "' style='" + ms.uiStyle(formId, 'T3#FEED_COUNT') + "' " + ms.uiEvent(formId, 'T3#FEED_COUNT') + " title='" + ms.titleAttr(formId, 'T3#FEED_COUNT', 'IS_TITLE_ATTR', v) + "' >" + v['T3#FEED_COUNT'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='T4#FEED_NUM' name='noprintset_FEED_NUM' class='datagrid-cell " + ms.tdClass(formId, 'T4#FEED_NUM') + "' style='" + ms.tdStyle(formId, 'T4#FEED_NUM') + "' " + ms.tdEvent(formId, 'T4#FEED_NUM') + ">");
                arrHtml.push("<span colno='T4#FEED_NUM' class='" + ms.uiClass(formId, 'T4#FEED_NUM') + "' style='" + ms.uiStyle(formId, 'T4#FEED_NUM') + "' " + ms.uiEvent(formId, 'T4#FEED_NUM') + " title='" + ms.titleAttr(formId, 'T4#FEED_NUM', 'IS_TITLE_ATTR', v) + "' >" + v['T4#FEED_NUM'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
            });
            if ($("#leftTableDiv" + formId).length > 0) {
                $("#left-tbody_" + formId).html(arrLeftHtml.join(""));
            }
            setCrossWiseScroll(formId, arrHtml);
            $("#tbody_print_" + formId).html(arrHtml.join(""));
        }
        if (formId == 'f8a9d1a221784763af0205f8f4b07d54') {<%--VOID-投料明细表单--%>
            $.each(uiTxt, function (i, v) {
                var backgroudColor = (i + 1) % 2 == 0 ? "tr-hover" : "";
                arrHtml.push("<tr class='datagrid-row " + backgroudColor + " " + trClass + "' id='" + v.ID + "' abbr='" + v.ID + "' style='cursor: pointer;" + trStyle + "' " + trEvent + ">");
                arrHtml.push("<input type='hidden' name='ID' value='" + v.ID + "' />");
                arrHtml.push("<input type='hidden' id='DATA_AUTH_ID_" + v.ID + "'  value='" + v.DATA_AUTH_ID + "' />");
                getRelColVal(arrHtml, v, colNo);
                arrHtml.push("<td class='datagrid-cell' name='noprintset_SEQ' style='width:30px;text-align:center;' ><span class='_noedit'>" + v._SEQ + "</span></td>");
                arrHtml.push("<td class='datagrid-cell no-print' style='width:30px;text-align:center;' ><span class='_noedit'>");
                arrHtml.push("<input type='checkbox' name='" + formId + "$ID' value='" + v.ID + "' class='isSubmit _selectdata' style='cursor: pointer;margin:0'>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROJECT_ID' name='noprintset_PROJECT_ID' class='datagrid-cell  " + ms.tdClass(formId, 'PROJECT_ID') + "' style='" + ms.tdStyle(formId, 'PROJECT_ID') + "' " + ms.tdEvent(formId, 'PROJECT_ID') + ">");
                arrHtml.push("<span colno='PROJECT_ID' class='" + ms.uiClass(formId, 'PROJECT_ID') + "' style='" + ms.uiStyle(formId, 'PROJECT_ID') + "' " + ms.uiEvent(formId, 'PROJECT_ID') + " title='" + ms.titleAttr(formId, 'PROJECT_ID', 'IS_TITLE_ATTR', v) + "' >" + v['PROJECT_ID'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ITEM_CODE' name='noprintset_ITEM_CODE' class='datagrid-cell  " + ms.tdClass(formId, 'ITEM_CODE') + "' style='" + ms.tdStyle(formId, 'ITEM_CODE') + "' " + ms.tdEvent(formId, 'ITEM_CODE') + ">");
                arrHtml.push("<span colno='ITEM_CODE' class='" + ms.uiClass(formId, 'ITEM_CODE') + "' style='" + ms.uiStyle(formId, 'ITEM_CODE') + "' " + ms.uiEvent(formId, 'ITEM_CODE') + " title='" + ms.titleAttr(formId, 'ITEM_CODE', 'IS_TITLE_ATTR', v) + "' >" + v['ITEM_CODE'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='MODEL_CODE' name='noprintset_MODEL_CODE' class='datagrid-cell  " + ms.tdClass(formId, 'MODEL_CODE') + "' style='" + ms.tdStyle(formId, 'MODEL_CODE') + "' " + ms.tdEvent(formId, 'MODEL_CODE') + ">");
                arrHtml.push("<span colno='MODEL_CODE' class='" + ms.uiClass(formId, 'MODEL_CODE') + "' style='" + ms.uiStyle(formId, 'MODEL_CODE') + "' " + ms.uiEvent(formId, 'MODEL_CODE') + " title='" + ms.titleAttr(formId, 'MODEL_CODE', 'IS_TITLE_ATTR', v) + "' >" + v['MODEL_CODE'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='ITEM_NUM' name='noprintset_ITEM_NUM' class='datagrid-cell  " + ms.tdClass(formId, 'ITEM_NUM') + "' style='" + ms.tdStyle(formId, 'ITEM_NUM') + "' " + ms.tdEvent(formId, 'ITEM_NUM') + ">");
                arrHtml.push("<span colno='ITEM_NUM' class='" + ms.uiClass(formId, 'ITEM_NUM') + "' style='" + ms.uiStyle(formId, 'ITEM_NUM') + "' " + ms.uiEvent(formId, 'ITEM_NUM') + " title='" + ms.titleAttr(formId, 'ITEM_NUM', 'IS_TITLE_ATTR', v) + "' >" + v['ITEM_NUM'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='FEED_NUM' name='noprintset_FEED_NUM' class='datagrid-cell  " + ms.tdClass(formId, 'FEED_NUM') + "' style='" + ms.tdStyle(formId, 'FEED_NUM') + "' " + ms.tdEvent(formId, 'FEED_NUM') + ">");
                arrHtml.push("<span colno='FEED_NUM' class='" + ms.uiClass(formId, 'FEED_NUM') + "' style='" + ms.uiStyle(formId, 'FEED_NUM') + "' " + ms.uiEvent(formId, 'FEED_NUM') + " title='" + ms.titleAttr(formId, 'FEED_NUM', 'IS_TITLE_ATTR', v) + "' >" + v['FEED_NUM'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("<td colno='PROCESS_ORDER' name='noprintset_PROCESS_ORDER' class='datagrid-cell  " + ms.tdClass(formId, 'PROCESS_ORDER') + "' style='" + ms.tdStyle(formId, 'PROCESS_ORDER') + "' " + ms.tdEvent(formId, 'PROCESS_ORDER') + ">");
                arrHtml.push("<span colno='PROCESS_ORDER' class='" + ms.uiClass(formId, 'PROCESS_ORDER') + "' style='" + ms.uiStyle(formId, 'PROCESS_ORDER') + "' " + ms.uiEvent(formId, 'PROCESS_ORDER') + " title='" + ms.titleAttr(formId, 'PROCESS_ORDER', 'IS_TITLE_ATTR', v) + "' >" + v['PROCESS_ORDER'] + "</span>");
                arrHtml.push("</td>");
                arrHtml.push("</tr>")
            });
            if ($("#leftTableDiv" + formId).length > 0) {
                $("#left-tbody_" + formId).html(arrLeftHtml.join(""));
            }
            setCrossWiseScroll(formId, arrHtml);
            $("#tbody_print_" + formId).html(arrHtml.join(""));
        }
        setNumColWidth(formId);
        clearAllSelect();
        setTableWidth(formId);
        setScroll(formId);
    }

    function judgIsOpen(title, url) {
        var flag = true;
        var timestamp = Date.parse(new Date());
        $(window.parent.document).find("#tag1").siblings().each(function (seq, item) {
            //打开过的标签不再重复打开
            console.log(top);
            if (title == $(item).attr("title")) {
                var count = item.id.substring(3);
                $(window.parent.document).find("#iframe" + count).attr("src", url);
                top.switchTag(item.id, "content" + count, url);
                flag = false;

            }
        });
        if (flag) {
            showPopWinFp(url, 800, 400, null, title, timestamp, 1);
        }
    }

    function itemJump1(obj) {
        var title = "<dict:lang value="工单信息" />";
        var formId = $("#formId1").val();
        var url = "${path}buss/bussModel.ms?&formId=" + formId + "&exeid=53745dab58e344cdb6e278900138763f&FUNC_CODE=F3466&frameId=" + _currentFrame + "&jumpId=" + obj;
        judgIsOpen(title, url);
    }

    function itemJump2(obj) {

        $("#f8a9d1a221784763af0205f8f4b07d54").css({"display": "block"});
        $("#timef8a9d1a221784763af0205f8f4b07d54").css({"display": "block"});

    }
    <%-- 数据为空时设置横向滚动条 --%>
    function setCrossWiseScroll(formId, arrHtml) {
        if (arrHtml.length == 0) {
            var tableWidth = $("#datagrid-btable-ajax" + formId).width();
            arrHtml.push("<tr  style='width: ");
            arrHtml.push(tableWidth + "px");
            arrHtml.push(";");
            arrHtml.push("height:1000px;'");
            $("#tableDiv" + formId).css({"overflow-y": "hidden", "overflow-x": "auto"});
        } else {
            $("#tableDiv" + formId).css({"overflow-y": "auto", "overflow-x": "auto"});
        }
    }





</script>
<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp" %>
</body>
<%@ include file="/plf/common/pub_end.jsp" %>
<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17"/>
    <jsp:param name="location" value="pageOver"/>
</jsp:include>

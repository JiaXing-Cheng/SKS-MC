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
        <dict:lang value="LEO-工单批次追溯1.0" />
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
    <bu:header formId ="962c1815e12345308b3ad0dbde3cc81c"/>


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
<div style="height:calc(100%  - 10px);background-color:#fff;border:1px solid #eaeaea;box-sizing:border-box;">
    <!-- <div class="block1 optn" style="float:left;width:30%;height:100%;position: relative;">
   <div id="treeDiv" style="width: 33%;height:40%;float: left;position: relative;margin-left: 5px;">-->
    <div class="block1 optn " id="block2" style="float: left;left:0;overflow:auto;position: absolute;">
        <input type="text" class="input" id="itemSn" placeholder="请输入工单号,按Enter键或点击查询" style="margin-left:70px;margin-top:10px;height:28px;line-height:28px;">
        <input type="hidden" id="oneLot">
        <input type="hidden" id="jumpId" value="${param.jumpId}">
        <input type="hidden" name="formId" id="formId2" value='1111'/>
        <input type="hidden" name="formId" id="formId4" value='2222'/>
        <input type="hidden" name="formId" id="formId3" value='3333'/>
        <input type="hidden" name="formId" id="formId5" value='4444'/>
        <input type="hidden" name="formId" id="formId6" value='5555'/>
        <input type="hidden" name="formId" id="formId7" value='6666'/>
        <button type="button" onclick="queryItem();" ><i class="ico ico-search-new"></i><dict:lang value="查询" /></button>
        <button type="button" id="exportbtn" value="" onclick="exportProData()" sytle="f" class="botton_img_add"><i class="ico ico-show-detail "></i><dict:lang value="导出" /></button>

        <div class="mod" style="height:calc(100% - 38px);width:390px;margin-left: 5px; ">
            <div class="mod-hd">
                <h3 class="tit"><dict:lang value="关联工单" /></h3>
            </div>
            <div class="panel datagrid datagrid-div1" style="height:calc(100% - 70px);">
                <div class="datagrid-div2 datagrid-div6 datagrid-view" style="height:100%">
                    <div class="datagrid-header" style="width:100%">
                        <div class="datagrid-header-inner head" id="" style="width:100%;">
                            <table  class="datagrid-htable" id="datagrid-htable1111"  >
                                <tbody>
                                <tr class="datagrid-header-row thcolor">
                                    <td class="datagrid-cell" align="center" style="width:30px!important;text-align: center"></td >
                                    <td class="datagrid-cell" style="width:220px;"><dict:lang value="SAP工单" /></td >
                                    <td class="datagrid-cell statusRoll" style=""><dict:lang value="关联工单" /></td >
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="datagrid-body datagrid-div3 scroll"   style="height:calc(100% - 32px);">
                        <table class="datagrid-btable" style="table-layout:fixed;"  id="datagrid-btable-ajax1111" >
                            <tbody id="addlotItem" >
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div style="background-color: white;" >
                <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchLotItem&formId=formId2&showLoading=0" />
            </div>

        </div>
    </div>
    <div class="block2" style="width:68%;float:right;height:100%;">
        <div class="mod" style="height:100%;">
            <div class="mod-hd">
                <h3 class="tit"><dict:lang value="基本信息" /></h3>
            </div>
            <table style="width: 100%;line-height:35px;">
                <tr >
                    <td ><div class="name" ><dict:lang value="SAP工单" /></div></td><td><div class="dec"><input readonly  id="projectId" class="input coc" style="width:200px;"></div></td>
                    <td ><div class="name" ><dict:lang value="产品名称" /></div></td><td><div class="dec"><input readonly id="productName" class="input coc" style="width:200px;"></div></td>
                    <td ><div class="name" ><dict:lang value="产品编码" /></div></td><td><div class="dec"><input readonly id="productMaterial" class="input coc" style="width:200px;"></div></td>

                </tr>
                <tr>
                    <td ><div class="name" ><dict:lang value="客户" /></div></td><td><div class="dec"><input readonly id="custCode" class="input coc" style="width:200px;"></div></td>
                    <td ><div class="name" ><dict:lang value="生产批次" /></div></td><td><div class="dec"><input readonly id="lotNumber" class="input coc" style="width:200px;"></div></td>
                    <td ><div class="name" ><dict:lang value="工厂" /></div></td><td><div class="dec"><input readonly id="workSpace" class="input coc" style="width:200px;"></div></td>

                </tr>
                <tr>
                    <td ><div class="name" ><dict:lang value="计划数量" /></div></td><td><div class="dec"><input readonly id="productCount" class="input coc" style="width:200px;"></div></td>
                    <td ><div class="name" ><dict:lang value="实际数量" /></div></td><td><div class="dec"><input readonly id="finishCount" class="input coc" style="width:200px;"></div></td>
                    <td ><div class="name" ><dict:lang value="产品状态" /></div></td><td><div class="dec"><input readonly id="projectStatus" class="input coc" style="width:200px;"></div></td>

                </tr>
                <tr>
                    <td ><div class="name" ><dict:lang value="计划生产日期" /></div></td><td><div class="dec"><input readonly id="produceDate" class="input coc" style="width:200px;"></div></td>
                    <td ><div class="name" ><dict:lang value="计划完工日期" /></div></td><td><div class="dec"><input readonly id="invalidDate" class="input coc" style="width:200px;"></div></td>
                    <td ><div class="name" ><dict:lang value="入库时间" /></div></td><td><div class="dec"><input readonly id="receiveTime" class="input coc" style="width:200px;"></div></td>
                </tr>
            </table>

            <div class="js-tab" style="height:calc(100% - 180px)">
                <DIV id="container" style="padding:0 2px;box-sizing: border-box;height:100%;">
                    <DIV class="hd">
                        <UL class="tab-list tab">

                            <LI id="tag1"><A class=""
                                             onclick="switchTag('tag1','content1','');this.blur();"
                                             href="javascript:void(0);"> <SPAN><dict:lang value="备料信息" /></SPAN> </A>
                            </LI>
                            <LI id="tag2"><A class=""
                                             onclick="switchTag('tag2','content2','');this.blur();"
                                             href="javascript:void(0);"> <SPAN><dict:lang value="投料信息" /></SPAN> </A>
                            </LI>
                            <LI id="tag3"><A class=""
                                             onclick="switchTag('tag3','content3','');this.blur();"
                                             href="javascript:void(0);"> <SPAN><dict:lang value="包装信息" /></SPAN> </A>
                            </LI>
                            <LI id="tag4"><A class=""
                                             onclick="switchTag('tag4','content4','');this.blur();"
                                             href="javascript:void(0);"> <SPAN><dict:lang value="质检信息" /></SPAN> </A>
                            </LI>

                        </UL>
                    </DIV>
                    <DIV class="content1" id="content" style="margin-top: 15px;height:calc(100% - 45px)">
                        <DIV id="content1" style="height:100%;" data-tab="tag1">
                            <div class="panel datagrid datagrid-div1" style="height:calc(100% - 30px);">
                                <div class="datagrid-div2 datagrid-div6 datagrid-view"  id="datagrid-view1" style="height:100%;">
                                    <div class="datagrid-header" style="">
                                        <div class="datagrid-header-inner head1" style="width:100%;" id="datagrid-header-inner2">
                                            <table  class="datagrid-htable fixedTable  " id="datagrid-htable2222">
                                                <tbody>
                                                <tr class="datagrid-header-row datagrid-title-ajax">
                                                    <td class="datagrid-cell" style="width:30px;"></td>

                                                    <td class="datagrid-cell" style="width:150px;" ><dict:lang value="SAP工单" /></td >
                                                    <td class="datagrid-cell" style="width:250px;"><dict:lang value="物料编码" /></td >
                                                    <td class="datagrid-cell" style="width:130px;"><dict:lang value="物料名称" /></td >
                                                    <td class="datagrid-cell" style="width:150px;"><dict:lang value="作业人员" /></td >
                                                    <td class="datagrid-cell"style="width:70px;"><dict:lang value="作业时间" /></td >

                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="datagrid-body datagrid-div3 scroll1"   style="height:calc(100% - 35px);">
                                        <table class="datagrid-btable fixedTable" style="table-layout:fixed;"  id="datagrid-btable-ajax2222" >
                                            <tbody id="addItemLog" >
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>

                            <div style="background-color: white;" >
                                <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchItemLogInfo&formId=formId4&showLoading=0" />
                            </div>
                        </DIV>

                        <DIV id="content2" style="display:none;height:100%;" data-tab="tag2">
                            <div class="panel datagrid datagrid-div1"  style="height:calc(100% - 30px);">
                                <div class="datagrid-div2 datagrid-div6 datagrid-view" style="height:100%;" >
                                    <div class="datagrid-header" style="width:100%;">
                                        <div class="datagrid-header-inner head2" style="width:100%;">
                                            <table  class="datagrid-htable fixedTable  " id="datagrid-htable3333" style="">
                                                <tbody>
                                                <tr class="datagrid-header-row datagrid-title-ajax">
                                                    <td class="datagrid-cell" style="width:30px;"></td>
                                                    <td class="datagrid-cell" style="width:150px;" ><dict:lang value="SAP工单" /></td >
                                                    <td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料信息" /></td >
                                                    <td class="datagrid-cell" style="width:150px;" ><dict:lang value="物料名称" /></td >
                                                    <td class="datagrid-cell" style="width:120px;"><dict:lang value="投入数量" /></td >
                                                    <td class="datagrid-cell" style="width:120px;"><dict:lang value="作业人员" /></td >
                                                    <td class="datagrid-cell" style="width:120px;"><dict:lang value="作业时间" /></td >
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="datagrid-body datagrid-div3 scroll2" style="height:calc(100% - 35px);">
                                        <table class="datagrid-btable fixedTable" style="table-layout:fixed;" id="datagrid-btable-ajax3333"  >
                                            <tbody id="addProductInfo" >
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div style="background-color: white;" >
                                <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchProductInfo&formId=formId3&showLoading=0" />
                            </div>
                        </DIV>
                        <DIV id="content3" style="display:none;height:100%;" data-tab="tag3">
                            <!--<div class="panel datagrid datagrid-div1" style="height:100%;"> -->
                            <div class="panel datagrid datagrid-div1"  style="height:calc(100% - 30px);">
                                <div class="datagrid-div2 datagrid-div6 datagrid-view"  style="height:100%;" >
                                    <div class="datagrid-header" style="width:100%;">
                                        <div class="datagrid-header-inner head3" style="width:100%;">
                                            <table  class="datagrid-htable fixedTable  " id="datagrid-htable4444" style="">
                                                <tbody>
                                                <tr class="datagrid-header-row datagrid-title-ajax">
                                                    <td class="datagrid-cell" style="width:30px;"></td>
                                                    <td class="datagrid-cell" style="width:150px;" ><dict:lang value="SAP工单" /></td >
                                                    <td class="datagrid-cell" style="width:90px;" ><dict:lang value="物料信息" /></td >
                                                    <td class="datagrid-cell" style="width:90px;" ><dict:lang value="物料名称" /></td >
                                                    <td class="datagrid-cell" style="width:90px;" ><dict:lang value="包装数量" /></td >
                                                    <td class="datagrid-cell" style="width:90px;" ><dict:lang value="作业人员" /></td >
                                                    <td class="datagrid-cell" style="width:120px;"><dict:lang value="作业时间" /></td >
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="datagrid-body datagrid-div3 scroll3" style="height:calc(100% - 35px);">
                                        <table class="datagrid-btable fixedTable" style="table-layout:fixed;"  id="datagrid-btable-ajax4444" >
                                            <tbody id="addQualityInfo" >
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div style="background-color: white;" >
                                <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchPackInfo&formId=formId5&showLoading=0" />
                            </div>
                        </DIV>
                        <DIV id="content4" style="display:none;height:100%;" data-tab="tag4">
                            <!--<div class="panel datagrid datagrid-div1" style="height:100%;"> -->
                            <div class="panel datagrid datagrid-div1"  style="height:calc(100% - 30px);">
                                <div class="datagrid-div2 datagrid-div6 datagrid-view"  style="height:100%;" >
                                    <div class="datagrid-header" style="width:100%;">
                                        <div class="datagrid-header-inner head4" style="width:100%;">
                                            <table  class="datagrid-htable fixedTable  " id="datagrid-htable6666" style="">
                                                <tbody>
                                                <tr class="datagrid-header-row datagrid-title-ajax">
                                                    <td class="datagrid-cell" style="width:30px;"></td>
                                                    <td class="datagrid-cell" style="width:150px;" ><dict:lang value="SAP工单" /></td >
                                                    <td class="datagrid-cell" style="width:90px;" ><dict:lang value="质检结果" /></td >
                                                    <td class="datagrid-cell" style="width:90px;" ><dict:lang value="不良因素" /></td >
                                                    <td class="datagrid-cell" style="width:90px;" ><dict:lang value="质检备注" /></td >
                                                    <td class="datagrid-cell" style="width:90px;" ><dict:lang value="作业人员" /></td >
                                                    <td class="datagrid-cell" style="width:120px;"><dict:lang value="作业时间" /></td >
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="datagrid-body datagrid-div3 scroll4" style="height:calc(100% - 35px);">
                                        <table class="datagrid-btable fixedTable" style="table-layout:fixed;"  id="datagrid-btable-ajax6666" >
                                            <tbody id="addCheckInfo" >
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div style="background-color: white;" >
                                <s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=searchCheckInfo&formId=formId7&showLoading=0" />
                            </div>
                        </DIV>

                    </DIV>
                </div>

            </div>
        </div>
    </div>
    <bu:script viewId="845ba4d049c6429aaff7a29d23f7877e" />
    <bu:submit viewId="845ba4d049c6429aaff7a29d23f7877e" />
    <script type="text/javascript">
        var loaded = 1;
        var tab_len = 4;

        var currentTag;
        var tabs = "";
        function switchTag(tag, content, url) {
            if (currentTag == tag) {
                return false;
            }
            document.getElementById("content2").style.display="";
            document.getElementById("content3").style.display="";
            document.getElementById("content4").style.display="";
            for (i = 1; i < (tab_len + 1); i++) {
                if ("tag" + i == tag) {
                    document.getElementById(tag).getElementsByTagName("a")[0].className = "selectli1";
                    document.getElementById(tag).getElementsByTagName("a")[0]
                        .getElementsByTagName("span")[0].className = "selectspan1";
                } else {
                    document.getElementById("tag" + i).getElementsByTagName("a")[0].className = "";
                    document.getElementById("tag" + i).getElementsByTagName("a")[0]
                        .getElementsByTagName("span")[0].className = "";
                }
                $("#" + tag).addClass("current").siblings().removeClass("current");
                if ("content" + i == content) {
                    currentTag = tag;
                    document.getElementById(content).className = "";
                } else {
                    document.getElementById("content" + i).className = "hidecontent";
                }
                document.getElementById("content").className = content;
            }
            var itemSn = $.trim($("#itemSn").val());
            if(itemSn!=""){
                if(tag=="tag1"){
                    console.log(111);
                    getItemLogInfo(itemSn);
                }
                if(tag=="tag2"){
                    getProductInfo(itemSn);
                }
                if(tag=="tag3"){
                    getQualityInfo(itemSn);
                }
                if(tag=="tag4"){
                    getCheckInfo(itemSn);
                }
            }
        }
        $(function(){
            $("#tag1").addClass("current");
            var itemSn = $("#jumpId").val();
            if(itemSn!=""){
                clickTr(itemSn);
            }
            $(".statusRoll").css("width","");

        })
        //查询方法
        function queryItem(){
            var itemSn = $.trim($("#itemSn").val());
            var ddddd='${param.jumpId}';
            console.log("ddddd==>",ddddd);
            if(itemSn==""){
                utilsFp.confirmIcon(3,"","","", "请输入工单号",0,"300","");
                return;
            }else{
                getItemSnInfo(itemSn);
                oneLotItem(itemSn);
                if($("#tag1").attr("class")=="current"){
                    getItemLogInfo(itemSn);
                }
                if($("#tag2").attr("class")=="current"){
                    getProductInfo(itemSn);
                }
                if($("#tag3").attr("class")=="current"){
                    getQualityInfo(itemSn);
                }
                if($("#tag4").attr("class")=="current"){
                    getCheckInfo(itemSn);
                }
            }
        }
        //输入物料SN 按回车键
        $("#itemSn").keydown(function(event){
            if(event.keyCode == 13){
                queryItem();
            }
        });
        //双击事件
        function clickTr(itemSn){
            $("#itemSn").val(itemSn);
            getItemSnInfo(itemSn);
            oneLotItem(itemSn);
            if($("#tag1").attr("class")=="current"){
                getItemLogInfo(itemSn);
            }
            if($("#tag2").attr("class")=="current"){
                getProductInfo(itemSn);
            }
            if($("#tag3").attr("class")=="current"){
                getQualityInfo(itemSn);
            }
            if($("#tag4").attr("class")=="current"){
                getCheckInfo(itemSn);
            }
        }
        //跳转检验单
        function docJump0(obj){
            docJump(obj);
        }
        //跳转到产品信息页面
        function proJump(obj){
            var formId = $("#formId1").val();

            var url = "${path}buss/bussModel.ms?exeid=aec0089e4d69487cbe28b4b70b1ffa21&FUNC_CODE=F10630&formId="+formId+"&iframeId="+_currentFrame+"&proSn="+obj;
            showPopWinFp(url, 800, 400,null,"<dict:lang value="产品追溯报表" />",obj,1);
        }

        //查询批次号基本信息
        function getItemSnInfo(itemSn){
            util.showLoading("处理中...");
            $.ajax({
                type: "POST",
                dataType: "json",
                //url: "${path}buss/bussModel_exeFunc.ms?funcMId=402843938c1d464ea45f485f8b089b00",df224a8881b742de8e6d851cc7e07bc8
                url: "${path}buss/bussModel_exeFunc.ms?funcMId=80b6a73f9c1e4c79be6d6fb4bf74ab8d",
                data: {
                    "itemSn" : itemSn
                },
                success: function(data){
                    // $(".coc").val("");
                    util.closeLoading();
                    if(null != data.ajaxList){
                        var rccList = eval(data.ajaxList);
                        if(rccList.length==0){
                            utilsFp.confirmIcon(3,"","","", "请正确输入工单号",0,"300","");
                            return ;

                        }
                        for(var i=0;i<rccList.length;i++){
                            if(rccList[i].PROJECT_ID==null) rccList[i].PROJECT_ID="";
                            if(rccList[i].PRODUCT_NAME==null) rccList[i].PRODUCT_NAME="";
                            if(rccList[i].PRODUCT_MATERIAL==null) rccList[i].PRODUCT_MATERIAL="";
                            if(rccList[i].CUST_CODE==null) rccList[i].CUST_CODE="";
                            if(rccList[i].WORK_SPACE==null) rccList[i].WORK_SPACE="";
                            if(rccList[i].PROJECT_STATUS==null) rccList[i].PROJECT_STATUS="工单未下达";
                            if(rccList[i].PROJECT_STATUS=="1") rccList[i].PROJECT_STATUS="开立";
                            if(rccList[i].PROJECT_STATUS=="3") rccList[i].PROJECT_STATUS="备料";
                            if(rccList[i].PROJECT_STATUS=="4") rccList[i].PROJECT_STATUS="投料";
                            if(rccList[i].PROJECT_STATUS=="5") rccList[i].PROJECT_STATUS="包装";

                            if(rccList[i].PROLEPSIS_START_DATE==null) rccList[i].PROLEPSIS_START_DATE="";
                            if(rccList[i].PROLEPSIS_END_DATE==null) rccList[i].PROLEPSIS_END_DATE="";
                            if(rccList[i].CREATE_TIME==null) rccList[i].CREATE_TIME="还未缴库";
                            /*if(rccList[i].CHECK_STATUS==null) rccList[i].CHECK_STATUS="未质检";
                            if(rccList[i].CHECK_STATUS=="0") rccList[i].CHECK_STATUS="良品";
                            if(rccList[i].CHECK_STATUS=="1") rccList[i].CHECK_STATUS="不良品";*/
                            if(rccList[i].FINISH_COUNT==null) rccList[i].CHECK_STATUS="还未产出";
                            $("#projectId").val(rccList[i].PROJECT_ID);
                            $("#productName").val(rccList[i].PRODUCT_NAME);
                            $("#productMaterial").val(rccList[i].PRODUCT_MATERIAL);
                            $("#custCode").val(rccList[i].CUST_CODE);
                            $("#lotNumber").val(rccList[i].LOT_NUMBER);
                            $("#projectStatus").val(rccList[i].PROJECT_STATUS);
                            $("#finishCount").val(rccList[i].FINISH_COUNT);
                            $("#produceDate").val(rccList[i].PROLEPSIS_START_DATE.replace("T"," "));
                            $("#invalidDate").val(rccList[i].PROLEPSIS_END_DATE.replace("T"," "));
                            $("#receiveTime").val(rccList[i].CREATE_TIME.replace("T"," "));
                            $("#workSpace").val(rccList[i].WORK_SPACE);
                            $("#productCount").val(rccList[i].PRODUCT_COUNT);

                        }

                    }
                },
                error: function(msg){
                    util.closeLoading();
                    utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
                }
            });
        }
        //查询批次号关联工单
        function oneLotItem(itemLot){
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "${path}buss/bussModel_exeFunc.ms?funcMId=1e6adf9546d547bdbd206b3e2b21600b",
                data: {
                    "itemLot" : itemLot
                },
                success: function(data){
                    $("#addlotItem").empty();
                    if(null != data.ajaxPage.dataList){
                        var rccList = eval(data.ajaxPage.dataList);
                        for(var i=0;i<rccList.length;i++){
                            if(rccList[i].PROJECT_ID==null) rccList[i].STOCK_FLAG="未关联";
                            $("#datagrid-btable-ajax1111 tbody:last").append("<tr id='tr1_"+i+"' onclick=\"itemJump3('"+rccList[i].PROJECT_ID+"')\"></tr>");
                            $("#datagrid-btable-ajax1111 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px!important;text-align: center;'>"+(i+1)+"</td>");
                            $("#datagrid-btable-ajax1111 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:220px;text-align: center;'><span style='display: inline;border-bottom: 1px solid #004098'>"+rccList[i].PROJECT_ID+"</span></td>");
                            $("#datagrid-btable-ajax1111 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='text-align: center;'>"+rccList[i].REL_PROJECT_ID+"</td>");
                        }

                    }
                    pageFun(data.ajaxPage,"formId2");
                    var tableTrJs = $("#datagrid-btable-ajax1111 tbody tr");
                    _tongLineColor(tableTrJs);
                    $(".statusRoll").css("width","");
                    defTableWidthRewrite("1111");
                    //$('.scroll').mCustomScrollbar("destroy");
                    //          loadStockDetail();
                    //       setPopScroll('.scroll','.head');

                },
                error: function(msg){
                    util.closeLoading();
                    utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
                }
            });
        }
        //获取备料信息
        function getItemLogInfo(itemSn){

            $.ajax({
                type: "POST",
                dataType: "json",
                url: "${path}buss/bussModel_exeFunc.ms?funcMId=6a4071cb958c4b8c99df4abb9b255382",
                data: {
                    "itemSn" : itemSn,
                    "type" : "logType"
                },
                success: function(data){
                    console.log(data)
                    $("#addItemLog").empty();
                    if(null != data.ajaxPage.dataList){

                        var rccList = eval(data.ajaxPage.dataList);
                        for(var i=0;i<rccList.length;i++){
                            if(rccList[i].PROJECT_ID==null) rccList[i].PROJECT_ID="";
                            if(rccList[i].ITEM_CODE==null) rccList[i].ITEM_CODE="";
                            if(rccList[i].ITEM_NAME==null) rccList[i].ITEM_NAME="";
                            if(rccList[i].NAME==null) rccList[i].NAME="";
                            if(rccList[i].EDIT_TIME==null) rccList[i].EDIT_TIME="";
                            $("#datagrid-btable-ajax2222 tbody:last").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
                            $("#datagrid-btable-ajax2222 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
                            $("#datagrid-btable-ajax2222 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;'>"+rccList[i].PROJECT_ID+"</td>");
                            $("#datagrid-btable-ajax2222 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;'><span onclick='itemJump6(\""+rccList[i].ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].ITEM_CODE+"</span></td>");
                            $("#datagrid-btable-ajax2222 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>"+rccList[i].ITEM_NAME+"</td>");
                            $("#datagrid-btable-ajax2222 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;'>"+rccList[i].NAME+"</td>");
                            $("#datagrid-btable-ajax2222 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align:center;'>"+rccList[i].EDIT_TIME.replace("T"," ")+"</td>");
                        }

                    }
                    pageFun(data.ajaxPage,"formId4");
                    var tableTrJs = $("#datagrid-btable-ajax2222 tbody tr");
                    _tongLineColor(tableTrJs);
                    defTableWidthRewrite("2222");
                },
                error: function(msg){
                    util.closeLoading();
                    utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
                }
            });
        }

        //获取备料信息分页
        function searchItemLogInfo(paginationImpl){
            var isFirstLoad = firstLoadThisPage(paginationImpl);
            var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
            var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
            var itemSn = $.trim($("#itemSn").val());
            util.showLoading("处理中...");
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "${path}buss/bussModel_exeFunc.ms?funcMId=6a4071cb958c4b8c99df4abb9b255382",
                data: {
                    "itemSn" : itemSn,
                    "type" : "logType",
                    "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
                    "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
                },
                success: function(data){
                    util.closeLoading();
                    $("#addItemLog").empty();
                    if(null != data.ajaxPage.dataList){
                        var rccList = eval(data.ajaxPage.dataList);
                        for(var i=0;i<rccList.length;i++){
                            if(rccList[i].PROJECT_ID==null) rccList[i].PROJECT_ID="";
                            if(rccList[i].ITEM_CODE==null) rccList[i].ITEM_CODE="";
                            if(rccList[i].ITEM_NAME==null) rccList[i].ITEM_NAME="";
                            if(rccList[i].NAME==null) rccList[i].NAME="";
                            if(rccList[i].EDIT_TIME==null) rccList[i].EDIT_TIME="";
                            $("#datagrid-btable-ajax2222 tbody:last").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
                            $("#datagrid-btable-ajax2222 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
                            $("#datagrid-btable-ajax2222 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;'>"+rccList[i].PROJECT_ID+"</td>");
                            $("#datagrid-btable-ajax2222 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;'><span onclick='itemJump6(\""+rccList[i].ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].ITEM_CODE+"</span></td>");
                            $("#datagrid-btable-ajax2222 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>"+rccList[i].ITEM_NAME+"</td>");
                            $("#datagrid-btable-ajax2222 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;'>"+rccList[i].NAME+"</td>");
                            $("#datagrid-btable-ajax2222 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align:center;'>"+rccList[i].EDIT_TIME.replace("T"," ")+"</td>");
                        }

                    }
                    pageFun(data.ajaxPage,"formId4");
                    var tableTrJs = $("#datagrid-btable-ajax2222 tbody tr");
                    _tongLineColor(tableTrJs);
                    defTableWidthRewrite("2222");

                },
                error: function(msg){
                    util.closeLoading();
                    utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
                }
            });
        }
        //获取投料信息
        function getProductInfo(itemSn){
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "${path}buss/bussModel_exeFunc.ms?funcMId=6a4071cb958c4b8c99df4abb9b255382",
                data: {
                    "itemSn" : itemSn,
                    "type" : "product"
                },
                success: function(data){
                    $("#addProductInfo").empty();
                    if(null != data.ajaxPage.dataList){
                        var rccList = eval(data.ajaxPage.dataList);
                        for(var i=0;i<rccList.length;i++){
                            if(rccList[i].PROJECT_ID==null) rccList[i].PROJECT_ID="";
                            if(rccList[i].ITEM_CODE==null) rccList[i].ITEM_CODE="";
                            if(rccList[i].ITEM_NAME==null) rccList[i].ITEM_NAME="";
                            if(rccList[i].FEED_NUM==null) rccList[i].FEED_NUM="";
                            if(rccList[i].NAME==null) rccList[i].NAME="";
                            if(rccList[i].CREATE_TIME==null) rccList[i].CREATE_TIME="";
                            $("#datagrid-btable-ajax3333 tbody:last").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
                            $("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
                            $("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;'><span onclick='itemJump9(\""+rccList[i].PROJECT_ID+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].PROJECT_ID+"</span></td>");
                            $("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;'><span onclick='itemJump6(\""+rccList[i].ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].ITEM_CODE+"</span></td>");
                            $("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>"+rccList[i].ITEM_NAME+"</td>");
                            $("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;'>"+rccList[i].FEED_NUM+"</td>");
                            $("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;'>"+rccList[i].NAME+"</td>");
                            $("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align:center;'>"+rccList[i].CREATE_TIME.replace("T"," ")+"</td>");
                        }

                    }
                    pageFun(data.ajaxPage,"formId3");
                    var tableTrJs = $("#datagrid-btable-ajax3333 tbody tr");
                    _tongLineColor(tableTrJs);
                    defTableWidthRewrite("3333");
                },
                error: function(msg){
                    util.closeLoading();
                    utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
                }
            });
        }
        //产品投料分页
        function searchProductInfo(paginationImpl){
            var isFirstLoad = firstLoadThisPage(paginationImpl);
            var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
            var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
            var itemSn = $.trim($("#itemSn").val());
            util.showLoading("处理中...");
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "${path}buss/bussModel_exeFunc.ms?funcMId=6a4071cb958c4b8c99df4abb9b255382",
                data: {
                    "itemSn" : itemSn,
                    "type" : "product",
                    "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
                    "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
                },
                success: function(data){
                    util.closeLoading();
                    $("#addProductInfo").empty();
                    if(null != data.ajaxPage.dataList){
                        var rccList = eval(data.ajaxPage.dataList);
                        for(var i=0;i<rccList.length;i++){
                            if(rccList[i].ITEM_CODE==null) rccList[i].ITEM_CODE="";
                            if(rccList[i].ITEM_NAME==null) rccList[i].ITEM_NAME="";
                            if(rccList[i].FEED_NUM==null) rccList[i].FEED_NUM="";
                            if(rccList[i].NAME==null) rccList[i].NAME="";
                            if(rccList[i].CREATE_TIME==null) rccList[i].CREATE_TIME="";
                            $("#datagrid-btable-ajax3333 tbody:last").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
                            $("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
                            $("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;'><span onclick='itemJump9(\""+rccList[i].PROJECT_ID+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].PROJECT_ID+"</span></td>");
                            $("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;'><span onclick='itemJump6(\""+rccList[i].ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].ITEM_CODE+"</span></td>");
                            $("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>"+rccList[i].ITEM_NAME+"</td>");
                            $("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;'>"+rccList[i].FEED_NUM+"</td>");
                            $("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;'>"+rccList[i].NAME+"</td>");
                            $("#datagrid-btable-ajax3333 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align:center;'>"+rccList[i].CREATE_TIME.replace("T"," ")+"</td>");
                        }

                    }
                    pageFun(data.ajaxPage,"formId3");
                    var tableTrJs = $("#datagrid-btable-ajax3333 tbody tr");
                    _tongLineColor(tableTrJs);
                    defTableWidthRewrite("3333");
                },
                error: function(msg){
                    util.closeLoading();
                    utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
                }
            });
        }
        //获取包装信息
        function getQualityInfo(itemSn){
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "${path}buss/bussModel_exeFunc.ms?funcMId=6a4071cb958c4b8c99df4abb9b255382",
                data: {
                    "itemSn" : itemSn,
                    "type" : "quality"
                },
                success: function(data){
                    $("#addQualityInfo").empty();
                    if(null != data.ajaxPage.dataList){
                        var rccList = eval(data.ajaxPage.dataList);
                        for(var i=0;i<rccList.length;i++){
                            if(rccList[i].ITEM_CODE==null) rccList[i].ITEM_CODE="";
                            if(rccList[i].ITEM_NAME==null) rccList[i].ITEM_NAME="";
                            if(rccList[i].PACK_NUM==null) rccList[i].PACK_NUM="";
                            if(rccList[i].NAME==null) rccList[i].NAME="";
                            if(rccList[i].CREATE_TIME==null) rccList[i].CREATE_TIME="";
                            $("#datagrid-btable-ajax4444 tbody:last").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
                            $("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
                            $("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;'><span onclick='itemJump8(\""+rccList[i].PROJECT_ID+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].PROJECT_ID+"</span></td>");
                            $("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;'><span onclick='itemJump6(\""+rccList[i].ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].ITEM_CODE+"</span></td>");
                            $("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>"+rccList[i].ITEM_NAME+"</td>");
                            $("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;'>"+rccList[i].PACK_NUM+"</td>");
                            $("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;'>"+rccList[i].NAME+"</td>");
                            $("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align:center;'>"+rccList[i].CREATE_TIME.replace("T"," ")+"</td>");
                        }

                    }
                    pageFun(data.ajaxPage,"formId5");
                    var tableTrJs = $("#datagrid-btable-ajax4444 tbody tr");
                    _tongLineColor(tableTrJs);
                    defTableWidthRewrite("4444");
                },
                error: function(msg){
                    util.closeLoading();
                    utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
                }
            });
        }

        //产品包装分页
        function searchPackInfo(paginationImpl){
            var isFirstLoad = firstLoadThisPage(paginationImpl);
            var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
            var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
            var itemSn = $.trim($("#itemSn").val());
            util.showLoading("处理中...");
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "${path}buss/bussModel_exeFunc.ms?funcMId=6a4071cb958c4b8c99df4abb9b255382",
                data: {
                    "itemSn" : itemSn,
                    "type" : "quality",
                    "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
                    "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
                },
                success: function(data){
                    util.closeLoading();
                    $("#addQualityInfo").empty();
                    if(null != data.ajaxPage.dataList){
                        var rccList = eval(data.ajaxPage.dataList);
                        for(var i=0;i<rccList.length;i++){
                            if(rccList[i].ITEM_CODE==null) rccList[i].ITEM_CODE="";
                            if(rccList[i].ITEM_NAME==null) rccList[i].ITEM_NAME="";
                            if(rccList[i].PACK_NUM==null) rccList[i].PACK_NUM="";
                            if(rccList[i].NAME==null) rccList[i].NAME="";
                            if(rccList[i].CREATE_TIME==null) rccList[i].CREATE_TIME="";
                            $("#datagrid-btable-ajax4444 tbody:last").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
                            $("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
                            $("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;'><span onclick='itemJump8(\""+rccList[i].PROJECT_ID+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].PROJECT_ID+"</span></td>");
                            $("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;'><span onclick='itemJump6(\""+rccList[i].ITEM_CODE+"\")' style='display: inline;border-bottom: 1px solid #004098;'>"+rccList[i].ITEM_CODE+"</span></td>");
                            $("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>"+rccList[i].ITEM_NAME+"</td>");
                            $("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;'>"+rccList[i].PACK_NUM+"</td>");
                            $("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;'>"+rccList[i].NAME+"</td>");
                            $("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align:center;'>"+rccList[i].CREATE_TIME.replace("T"," ")+"</td>");
                        }

                    }
                    pageFun(data.ajaxPage,"formId5");
                    var tableTrJs = $("#datagrid-btable-ajax4444 tbody tr");
                    _tongLineColor(tableTrJs);
                    defTableWidthRewrite("4444");
                },
                error: function(msg){
                    util.closeLoading();
                    utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
                }
            });
        }

        //获取质检信息
        function getCheckInfo(itemSn){

            $.ajax({
                type: "POST",
                dataType: "json",
                url: "${path}buss/bussModel_exeFunc.ms?funcMId=6a4071cb958c4b8c99df4abb9b255382",
                data: {
                    "itemSn" : itemSn,
                    "type" : "checkType"
                },
                success: function(data){
                    console.log(data)
                    $("#addCheckInfo").empty();
                    if(null != data.ajaxPage.dataList){

                        var rccList = eval(data.ajaxPage.dataList);
                        for(var i=0;i<rccList.length;i++){
                            if(rccList[i].PROJECT_ID==null) rccList[i].PROJECT_ID="";
                            if(rccList[i].ITEM_CODE==null) rccList[i].ITEM_CODE="";
                            if(rccList[i].ITEM_NAME==null) rccList[i].ITEM_NAME="";
                            if(rccList[i].NAME==null) rccList[i].NAME="";
                            if(rccList[i].EDIT_TIME==null) rccList[i].EDIT_TIME="";
                            $("#datagrid-btable-ajax6666 tbody:last").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
                            $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
                            $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;'>"+rccList[i].PROJECT_ID+"</td>");
                            if(rccList[i].CHECK_STATUS == '0'){
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;'>合格</span></td>");
                            }else{
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;'>不合格</span></td>");
                            }
                            if(rccList[i].BAD_REASONS =='1'){
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>容器中状态外观</td>");
                            }else if(rccList[i].BAD_REASONS =='2'){
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>固含量</td>");
                            }else if(rccList[i].BAD_REASONS =='3'){
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>粘度</td>");
                            }else if(rccList[i].BAD_REASONS =='4'){
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>比重</td>");
                            }else if(rccList[i].BAD_REASONS =='5'){
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>细度</td>");
                            }else if(rccList[i].BAD_REASONS =='6'){
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>对比率</td>");
                            }else if(rccList[i].BAD_REASONS =='7'){
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>光泽</td>");
                            }else if(rccList[i].BAD_REASONS =='8'){
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>板效</td>");
                            }else if(rccList[i].BAD_REASONS =='9'){
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>色差</td>");
                            }else if(rccList[i].BAD_REASONS =='10'){
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>有害物质</td>");
                            }else if(rccList[i].BAD_REASONS =='11'){
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>型检项目</td>");
                            }else{
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'></td>");
                            }

                            $("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;'>"+rccList[i].QT_MON+"</td>");
                            $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;'>"+rccList[i].NAME+"</td>");
                            $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align:center;'>"+rccList[i].CREATE_TIME.replace("T"," ")+"</td>");
                        }

                    }
                    pageFun(data.ajaxPage,"formId7");
                    var tableTrJs = $("#datagrid-btable-ajax6666 tbody tr");
                    _tongLineColor(tableTrJs);
                    defTableWidthRewrite("6666");
                },
                error: function(msg){
                    util.closeLoading();
                    utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
                }
            });
        }

        //获取质检信息分页
        function searchCheckInfo(paginationImpl){
            var isFirstLoad = firstLoadThisPage(paginationImpl);
            var currentPage = isFirstLoad? 1 : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage;
            var pageRecord =  isFirstLoad? 20 : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord;
            var itemSn = $.trim($("#itemSn").val());
            util.showLoading("处理中...");
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "${path}buss/bussModel_exeFunc.ms?funcMId=6a4071cb958c4b8c99df4abb9b255382",
                data: {
                    "itemSn" : itemSn,
                    "type" : "checkType",
                    "page.currentPage" : _GLO_FORM_PAGE_MAP[paginationImpl].currentPage,
                    "page.pageRecord" : _GLO_FORM_PAGE_MAP[paginationImpl].pageRecord
                },
                success: function(data){
                    util.closeLoading();
                    $("#addCheckInfo").empty();
                    if(null != data.ajaxPage.dataList){
                        var rccList = eval(data.ajaxPage.dataList);
                        for(var i=0;i<rccList.length;i++){
                            if(rccList[i].PROJECT_ID==null) rccList[i].PROJECT_ID="";
                            if(rccList[i].ITEM_CODE==null) rccList[i].ITEM_CODE="";
                            if(rccList[i].ITEM_NAME==null) rccList[i].ITEM_NAME="";
                            if(rccList[i].NAME==null) rccList[i].NAME="";
                            if(rccList[i].EDIT_TIME==null) rccList[i].EDIT_TIME="";
                            $("#datagrid-btable-ajax6666 tbody:last").append("<tr id='tr1_"+rccList[i].ID+"' ></tr>");
                            $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-1' style='width:30px;text-align: center;'>"+(i+1)+"</td>");
                            $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-3' style='width:250px;'>"+rccList[i].PROJECT_ID+"</td>");
                            if(rccList[i].CHECK_STATUS == '0'){
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;'>合格</span></td>");
                            }else{
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;'>不合格</span></td>");
                            }
                            if(rccList[i].BAD_REASONS =='1'){
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>容器中状态外观</td>");
                            }else if(rccList[i].BAD_REASONS =='2'){
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>固含量</td>");
                            }else if(rccList[i].BAD_REASONS =='3'){
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>粘度</td>");
                            }else if(rccList[i].BAD_REASONS =='4'){
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>比重</td>");
                            }else if(rccList[i].BAD_REASONS =='5'){
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>细度</td>");
                            }else if(rccList[i].BAD_REASONS =='6'){
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>对比率</td>");
                            }else if(rccList[i].BAD_REASONS =='7'){
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>光泽</td>");
                            }else if(rccList[i].BAD_REASONS =='8'){
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>板效</td>");
                            }else if(rccList[i].BAD_REASONS =='9'){
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>色差</td>");
                            }else if(rccList[i].BAD_REASONS =='10'){
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>有害物质</td>");
                            }else if(rccList[i].BAD_REASONS =='11'){
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'>型检项目</td>");
                            }else{
                                $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:130px;'></td>");
                            }

                            $("#datagrid-btable-ajax4444 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;'>"+rccList[i].QT_MON+"</td>");
                            $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:70px;'>"+rccList[i].NAME+"</td>");
                            $("#datagrid-btable-ajax6666 tr:last").append("<td class='datagrid-cell datagrid-cell-4' style='width:150px;text-align:center;'>"+rccList[i].CREATE_TIME.replace("T"," ")+"</td>");
                        }

                    }
                    pageFun(data.ajaxPage,"formId7");
                    var tableTrJs = $("#datagrid-btable-ajax6666 tbody tr");
                    _tongLineColor(tableTrJs);
                    defTableWidthRewrite("6666");

                },
                error: function(msg){
                    util.closeLoading();
                    utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
                }
            });
        }



    </script>
    <script type="text/javascript" src="${path}buss/js/common.js"></script>
    <script>

        //产品追溯
        function itemJump1(obj){
            winOptMethod.jump("aec0089e4d69487cbe28b4b70b1ffa21","F10630","jumpId",obj);
        }


        //制令单信息
        function itemJump2(obj){
            winOptMethod.jump("7d0349f7a60b405299af347205b1d92f","F3454","jumpId",obj);
        }

        //工单信息
        function itemJump3(obj){
            winOptMethod.jump("53745dab58e344cdb6e278900138763f","F3466","jumpId",obj);
        }

        //BOM管理
        function itemJump4(obj){
            winOptMethod.jump("64d40315e7ae489a8bb8e0d1871234ae","F3811","jumpId",obj);
        }


        //品质检验单
        function itemJump5(obj){
            winOptMethod.jump("905fce48212c4ce9beecd8bdf72e2a72","F11330","jumpId",obj);
        }

        //仓库单据信息
        function itemJump6(obj){
            winOptMethod.jump("f4c3cfb840234a24b5ac7135d783b7e3","F7011","jumpId",obj);
        }

        //包装单明细
        function itemJump8(obj){
            winOptMethod.jump("059a524509444dcea68e986ad31d0b22","F_7cedb39017de407b80bcb2380bd7efd2","jumpId",obj);
        }

        //制造单明细
        function itemJump9(obj){
            winOptMethod.jump("cf3deea17ad5493795eb1fe3d8225b15","F_cfdff944e54b4a88b06924707e9c3247","jumpId",obj);
        }

        //excel导出
        function exportProData(){
            var itemSn = $.trim($("#itemSn").val());
            var url = "buss/bussModel_exeFunc.ms?funcMId=db55105fce2b4ca8ba0d7b150cd372bd"+"&itemSn="+itemSn;
            DownLoadExcelEx(url);
        }
        function DownLoadExcelEx(dataUrl, postData, type) {
            util.showLoading("处理中...");
            var form = $("<form>"); //定义一个form表单

            form.attr("style", "display:none");
            form.attr("target", "submitFrame");
            form.attr("method", "post"); //请求类型
            form.attr("action", dataUrl + "&exeid=" + $("input[name='exeid']").val()); //请求地址

            if (postData != undefined && !$.isEmptyObject(postData)) {
                $.each(postData, function(n, item) {
                    var input = $("<input>");
                    if (type && type == 1) {
                        input.attr("name", n);
                        input.attr("value", item);

                    } else {
                        input.attr("name", item.name);
                        input.attr("value", item.value);
                    }
                    form.append(input);
                });
            }
            //var iframe = document.createElement('iframe');
            $("body").append(form); //将表单放置在web中
            form.submit(); //表单提交

            form.remove();
            util.closeLoading();
        }
    </script>
    <script>(function($){
        $(window).on('load',function(){
            setPopScroll('.scroll','.head');
            setPopScroll('.scroll1','.head1');
            setPopScroll('.scroll2','.head2');
            setPopScroll('.scroll3','.head3');
        })
    })(jQuery)</script>
    <script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
    <%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17" />
    <jsp:param name="location" value="pageOver" />
</jsp:include>

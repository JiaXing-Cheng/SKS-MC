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
    <%@ include file="/plf/common/pub_meta.jsp"%>
    <%@ include file="/buss/inc_files/inc_dev.jsp"%>
    <title>
        <dict:lang value="MES工单信息报表" />
    </title>

    <script type="text/javascript" src="${path}buss/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="${path}buss/js/three/three.min.js"></script>
    <script type="text/javascript" src="${path}buss/js/three/TrackballControls.js"></script>
    <script type="text/javascript" src="${path}buss/js/three/OrbitControls.js"></script>
    <script type="text/javascript" src="${path}buss/js/three/CSS3DRenderer.js"></script>
    <script type="text/javascript" src="${path}buss/js/three/tween.min.js"></script>
    <script type="text/javascript" src="${path}buss/js/three/stats.min.js"></script>
    <script type="text/javascript" src="${path}buss/js/three/calculation.js?version=<%=CALCULATION %>"></script>
    <script src="${path}buss/js/echarts.min.js"></script>
    <script type="text/javascript" src="${path}buss/js/three/wms/wmsThree.js?version=<%=WMS_THREE %>"></script>
    <script type="text/javascript" src="${path}buss/js/three/fonts/helvetiker_regular.typeface.js"></script>
    <script src="${path}buss/js/slide.js"></script>
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
    <object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
        <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
    </object>


</head>

<body>
<div class="content-in">
    <div class="dlist">
        <div class="hd">
            <bu:func viewId="a3f99325023d4d309fe045ccbd3e73d9" />
        </div>
        <div class="bd">
            <div class="search-box">
                <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                        <jsp:param name="modelName" value="VIEW_TYPE_17" />
                        <jsp:param name="location" value="searchForm" />
                    </jsp:include>


                    <table class="search_table">
                        <bu:search deal_mark="1" viewId="a3f99325023d4d309fe045ccbd3e73d9" />

                    </table>

                </form>
                <a href="javascript:void(0);" class="more"></a>
            </div>
            <input type="hidden" id="dataAuth" name="dataAuth" value='${sessionScope.mcDataAuth}'/>
            <input type="hidden" name="formId" id="formId1" value='962c1815e12345308b3ad0dbde3cc81c'/>
            <input type="hidden" name="formPage962c1815e12345308b3ad0dbde3cc81c" id="formPage962c1815e12345308b3ad0dbde3cc81c" value="${formPage962c1815e12345308b3ad0dbde3cc81c}"/>
            <input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
            <input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
            <div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDiv962c1815e12345308b3ad0dbde3cc81c" onscroll="ajaxTableScroll(this,'962c1815e12345308b3ad0dbde3cc81c')" >
                <!-- 列表模块-->

                <div class="mod mod1"  >
                    <div class="mod-in">
                        <div class="hd" id="hd1">
                            <h2 class="tit">
                                <i class="ico-hd"></i>
                                "工单数列表"
                            </h2>

                        </div>
                        <div class="bd" style="height: 270px;" id="bd1">
                            <div style="width: 100%; overflow: hidden">
                                <table class="htable" style="width: 100%;" cellpadding="0" cellspacing="0">
                                    <tbody>
                                    <tr>
                                        <td width="40%">总工单数</td>
                                        <td width="40%" title="包装单数">包装单数</td>
                                        <td width="20%" title="制造单数">制造单数</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="scroll mCustomScrollbar _mCS_2 mCS-autoHide" style="width: 100%; height: 240px; overflow: visible; position: relative;">
                                <div id="mCSB_2" class="mCustomScrollBox mCS-minimal-dark mCSB_vertical_horizontal mCSB_outside" tabindex="0" style="max-height: none;">
                                    <div id="mCSB_2_container" class="mCSB_container mCS_x_hidden mCS_no_scrollbar_x" style="position: relative; top: 0px; left: 0px; width: 100%; margin: 0px;" dir="ltr">
                                        <table class="btable" cellpadding="0" cellspacing="0" style="width:100%">
                                            <tbody id="addlotItem" >
                                            <tr>
                                                <td width="40"   title="ZQL-D20180712-021-01">1000</td>
                                                <td width="40%" title="2017.BJBZB.0001">500</td>
                                                <td width="20%" title="338.2">500</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!--<div id="mCSB_2_scrollbar_vertical" class="mCSB_scrollTools mCSB_2_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical" style="display: block;">
                                    <div class="mCSB_draggerContainer">
                                        <div id="mCSB_2_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 50px; display: block; height: 189px; max-height: 230px; top: 0px;">
                                            <div class="mCSB_dragger_bar" style="line-height: 50px;"></div>
                                        </div>
                                        <div class="mCSB_draggerRail"></div>
                                    </div>
                                </div> -->
                                <div id="mCSB_2_scrollbar_horizontal" class="mCSB_scrollTools mCSB_2_scrollbar mCS-minimal-dark mCSB_scrollTools_horizontal" style="display: none;">
                                    <div class="mCSB_draggerContainer" style>
                                        <div id="mCSB_2_dragger_horizontal" class="mCSB_dragger" style="position: absolute; min-width: 50px; width: 0px; left: 0px;">
                                            <div class="mCSB_dragger_bar"></div>
                                        </div>
                                        <div class="mCSB_draggerRail"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- 柱形模块-->
                <div class="mod mod2">
                    <div class="mod-in">
                        <div class="hd" id="hd2">
                            <h2 class="tit">
                                <i class="ico-hd"></i>
                                "工单数对比"
                            </h2>
                            <div class="more"></div>
                        </div>
                        <div class="bd" style="height:270px;" id="bd2">
                            <div id="charts_auto_wh_6b9610d5b3364891abc6d432c38e34fd1" style="width: 500px; margin: 0px auto;">
                                <div id="charts_background_6b9610d5b3364891abc6d432c38e34fd1" style="width: 600px; height: 600px; max-height: 300px; max-width: 550px; background: transparent; opacity: 1; -webkit-tap-highlight-color: transparent; user-select: none; position: relative;" _echarts_instance_="ec_1560594072135">
                                    <div style="position: relative; overflow: hidden; width: 550px; height: 300px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;">
                                        <canvas width="687" height="375" data-zr-dom-id="zr_0" style="position: absolute; left: 0px; top: 0px; width: 550px; height: 300px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas>
                                    </div>
                                    <div style="position: absolute; display: none; border-style: solid; white-space: nowrap; z-index: 9999999; transition: left 0.4s cubic-bezier(0.23, 1, 0.32, 1), top 0.4s cubic-bezier(0.23, 1, 0.32, 1); background-color: rgba(50, 50, 50, 0.7); border-width: 0px; border-color: rgb(51, 51, 51); border-radius: 4px; color: rgb(255, 255, 255); font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 14px;  line-height: 21px; padding: 5px; left: 71px; top: 50px;font-family:Microsoft YaHei;">
                                        "包装单"
                                        <br/>
                                        <span style="display:inline-block;margin-right:5px;border-radius:10px;width:9px;height:9px;background-color:#0000ff;"></span>
                                        "制造单"
                                    </div>
                                </div>
                                <div id="charts_6b9610d5b3364891abc6d432c38e34fd1" style="width: 500px; height: 500px; max-height: 300px; max-width: 550px;"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--饼图模块-->
                <div class="mod mod4">
                    <div class="mod-in">
                        <div class="hd" id="hd4">
                            <h2 class="tit">
                                <i class="ico-hd"></i>
                                "工单占比率"
                            </h2>
                            <!--  <div class="more">
                                  <a href="javascript:void(0);" onclick="addTab('/N2/buss/bussModel.ms?exeid=53745dab58e344cdb6e278900138763f&FUNC_CODE=F3466','工单信息','818ca8f63dc644869d776c9981154496') "> </a>
                              </div>-->
                        </div>
                        <div class="bd" id="bd4" style="height:270px;">
                            <div id="charts_auto_wh_f29c33a19d4e43b598e73db4ec1c40f33" style="width: 500px; margin: 0px auto;">
                                <div id="charts_background_f29c33a19d4e43b598e73db4ec1c40f33" style="width: 600px; height: 600px; max-height: 300px; max-width: 550px; background: transparent; opacity: 1; -webkit-tap-highlight-color: transparent; user-select: none; position: relative;" _echarts_instance_="ec_1560740319605">
                                    <div style="position: relative; overflow: hidden; width: 550px; height: 300px; padding: 0px; margin: 0px; border-width: 0px;">
                                        <canvas width="687" height="375" data-zr-dom-id="zr_0" style="position: absolute; left: 0px; top: 0px; width: 550px; height: 300px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas>

                                    </div>
                                    <div></div>
                                </div>
                                <div id="charts_f29c33a19d4e43b598e73db4ec1c40f33" style="width: 500px; height: 500px; max-height: 300px; max-width: 550px;"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <script type="text/javascript">
                    function query(obj){

                        var beginTime = $("#CREATE_TIME_BEGIN").val();
                        var endTime = $("#CREATE_TIME_END").val();
                        var editAuth = $("#DATA_AUTH").val();
                        util.showLoading("处理中...");
                        $.ajax({
                            type: "POST",
                            dataType: "json",
                            url: "${path}buss/bussModel_exeFunc.ms?funcMId=bb4ba73b666f4986b77e6f09972e716c",
                            data: {
                                "beginTime" : beginTime,
                                "endTime" :  endTime,
                                "editAuth" : editAuth,

                            },
                            success: function(data){
                                util.closeLoading();
                                $("#addlotItem").empty();
                                if(null != data.ajaxList){
                                    var rccList = eval(data.ajaxList);
                                    if(rccList.length==0){
                                        utilsFp.confirmIcon(3,"","","", "未查到该条件下的作业数据",0,"300","");
                                        return ;

                                    }
                                    for(var i=0;i<rccList.length;i++){
                                        //列表数据
                                        $("#addlotItem").append("<td width='40%'   title='工单总数'>"+rccList[i].S_PROJECT_COUNT+"</td>");
                                        $("#addlotItem").append("<td width='40%'   title='包装单数'>"+rccList[i].P_PROJECT_COUNT+"</td>");
                                        $("#addlotItem").append("<td width='20%'   title='制造单数'>"+rccList[i].F_PROJECT_COUNT+"</td>");
                                        //饼图数据
                                        var myChart1 = echarts.init(document.getElementById("bd4"));
                                        var piedata = [{"department":"包装单","num":rccList[i].P_PROJECT_COUNT},{"department":"制造单","num":rccList[i].F_PROJECT_COUNT}];
                                        var names = [];
                                        var brower=[];
                                        //可优化后代代码带入处理数据
                                        names.push('包装单','制造单');
                                        brower.push({value:rccList[i].P_PROJECT_COUNT,name:'包装单'},{value:rccList[i].F_PROJECT_COUNT,name:'制造单'});
                                        var option={
                                            title:{
                                                text:'工单信息',
                                                subtext:'下级标签',
                                                x:'center'
                                            },
                                            tooltip:{
                                                trigger:'工单',
                                                formatter:"{a}<br/>{b}:({d}%)"
                                            },
                                            legend:{
                                                orient:'vertical',
                                                x:'left',
                                                data:names,
                                                // data:['1','2','3','4','5']
                                            },
                                            toolbox:{
                                                show:true,
                                                feature:{
                                                    mark:{show:true},
                                                    dataView:{show:true,readOnly:false},
                                                    magicType:{
                                                        show:true,
                                                        type:['pie','funnel'],
                                                        option:{
                                                            funnel:{
                                                                x:'25%',
                                                                width:'50%',
                                                                funnelAlign:'left',
                                                                //max:1548
                                                            }
                                                        }
                                                    },
                                                    restore:{show:true},
                                                    saveAsImage:{show:true}
                                                }
                                            },
                                            calculable:true,
                                            series:[{
                                                name:'工单信息',
                                                type:'pie',
                                                radius:'55%',
                                                center:['50%','60%'],
                                                data:brower
                                                /* data:[
                                                             {value:335,name:'1'},
                                                             {value:310,name:'2'},
                                                             {value:234,name:'3'},
                                                             {value:135,name:'4'},
                                                             {value:1500,name:'5'}
                                                         ]*/
                                            }]
                                        };
                                        myChart1.setOption(option);
                                        //柱形图解数据
                                        var myChart = echarts.init(document.getElementById('bd2'));
                                        //TODO 后续后代代码带入植入
                                        var option={
                                            tooltip:{
                                                show:true
                                            },
                                            legend:{
                                                data:['包装单','制造单']
                                            },
                                            xAxis:[{
                                                type:'category',
                                                data:['工单']
                                            }],
                                            yAxis:[{
                                                type:'value',
                                                data:['0',rccList[i].S_PROJECT_COUNT]
                                            }],
                                            series:[{
                                                "name":"包装单",
                                                "type":"bar",
                                                "data":[rccList[i].P_PROJECT_COUNT]
                                            },
                                                {
                                                    "name":"制造单",
                                                    "type":"bar",
                                                    "data":[rccList[i].F_PROJECT_COUNT]
                                                }
                                            ]
                                        };
                                        myChart.setOption(option);
                                    }

                                }
                            },


                            error: function(msg){
                                util.closeLoading();
                                utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
                            }
                        });

                    }


                    var myChart1 = echarts.init(document.getElementById("bd4"));
                    var piedata = [{"department":"包装单","num":500},{"department":"制造单","num":500}];
                    var names = [];
                    var brower=[];
                    //可优化后代代码带入处理数据
                    names.push(["包装单","制造单"]);



                    brower.push({name:"包装单",value:500},{name:"制造单",value:500}
                    );
                    var option={
                        title:{
                            text:'工单信息',
                            subtext:'下级标签',
                            x:'center'
                        },
                        tooltip:{
                            trigger:'工单',
                            formatter:"{a}<br/>{b}:({d}%)"
                        },
                        legend:{
                            orient:'vertical',
                            x:'left',
                            data:names,
                            // data:[
                            //     '1','2','3','4','5'
                            // ]
                        },
                        toolbox:{
                            show:true,
                            feature:{
                                mark:{show:true},
                                dataView:{show:true,readOnly:false},
                                magicType:{
                                    show:true,
                                    type:['pie','funnel'],
                                    option:{
                                        funnel:{
                                            x:'25%',
                                            width:'50%',
                                            funnelAlign:'left',
                                            max:1548
                                        }
                                    }
                                },
                                restore:{show:true},
                                saveAsImage:{show:true}
                            }
                        },
                        calculable:true,
                        series:[{
                            name:'工单信息',
                            type:'pie',
                            radius:'55%',
                            center:['50%','60%'],
                            data:brower
                            // data:[
                            //     {value:335,name:'1'},
                            //     {value:310,name:'2'},
                            //     {value:234,name:'3'},
                            //     {value:135,name:'4'},
                            //     {value:1500,name:'5'}
                            // ]
                        }]
                    };
                    myChart1.setOption(option);
                </script>
            </div>
            <script type="text/javascript">
                var myChart = echarts.init(document.getElementById('bd2'));
                //TODO 后续后代代码带入植入
                var xaxis=["0","1","2","3","4","5"];
                var yaxis=["0","20","40","60","80","100"];
                var bardata=[5,20,40,10,10,20];
                var option={
                    tooltip:{
                        show:true
                    },
                    legend:{
                        data:['包装单']
                    },
                    xAxis:[{
                        type:'category',
                        data:xaxis
                    }],
                    yAxis:[{
                        type:'value',
                        data:yaxis
                    }],
                    series:[{
                        "name":"工单",
                        "type":"bar",
                        "data":bardata
                    }]
                };
                myChart.setOption(option);
            </script>
        </div>
    </div>
</div>

<script type="text/javascript" src="${path}plf/page/fp/js/paginationMultAx.js?_mc_res_version=<%=PlfStaticRes.PaginationMultAx_JS %>"></script>
<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>
<!-- 页面结束 -->
<jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
    <jsp:param name="modelName" value="VIEW_TYPE_17" />
    <jsp:param name="location" value="pageOver" />
</jsp:include>

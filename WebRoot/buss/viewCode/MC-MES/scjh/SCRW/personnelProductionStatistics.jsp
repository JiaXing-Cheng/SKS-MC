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
		<dict:lang value="CJX-人员工作量报表" />
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
		<bu:header formId ="bf62c7fde943478882afd3e0d285f42f"/>

    
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
		<bu:func viewId="3d69fe7a5e994dd295bb235b6526a08c" />
            </div>
            <div class="bd">
                <div class="search-box">
                    <form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
                      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="searchForm" />
                       </jsp:include>
                     

  <table class="search_table">
      <bu:search deal_mark="1" viewId="3d69fe7a5e994dd295bb235b6526a08c" /> 

  </table>

                   </form>
                   <a href="javascript:void(0);" class="more"></a>
               </div>
               <form id="listForm" name="listForm" action="${path}buss/bussModel.ms?<s:property value='%{@com.more.fw.core.common.method.ConstantsMc@FUNC_CODE}' />=<s:property value='%{FUNC_CODE}' />" method="post">
                     <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
                         <jsp:param name="modelName" value="VIEW_TYPE_17" />
                         <jsp:param name="location" value="listForm" />
                     </jsp:include>
		<input type="hidden" name="formPagebf62c7fde943478882afd3e0d285f42f" id="formPagebf62c7fde943478882afd3e0d285f42f" value="${formPagebf62c7fde943478882afd3e0d285f42f}"/>
		<input type="hidden" name="formId" id="formId1" value='bf62c7fde943478882afd3e0d285f42f'/>
		<input type="hidden" id="subRelColIds" name="subRelColIds" value='null'/>
		<input type="hidden" id="subFormIds" name="subFormIds" value='null'/>
		<div class="panel-ajax datagrid datagrid-div1"  id="bf62c7fde943478882afd3e0d285f42f">
		<div class="datagrid-div2 datagrid-div6 datagrid-view-ajax" id="datagrid-view-ajaxbf62c7fde943478882afd3e0d285f42f" style="">
		<div class="datagrid-header">
		<div class="datagrid-header-inner" id="datagrid-header-innerbf62c7fde943478882afd3e0d285f42f">
		<bu:table cssClass="datagrid-htable fixedTable datagrid-div6 datagrid-htable-kz"
                  style="display: block;" id="datagrid-htablebf62c7fde943478882afd3e0d285f42f">
		<s:set name="_$type" value="'view'" />
		<tbody class="isParentsTitle">
		<bu:tr cssClass="datagrid-header-row datagrid-title-ajax" id="datagrid-title-ajax">

         <tbody class="tbodyClass">

          <bu:tr cssClass="datagrid-title-ajax" id="datagrid-title-ajax" >
          <td class="datagrid-cell" style="width:30px;"></td>
          <td class="datagrid-cell" style="width:200px;" ><dict:lang value="车间" /></td >
          <td class="datagrid-cell" style="width:200px;" ><dict:lang value="工种" /></td >
          <td class="datagrid-cell" style="width:200px;"><dict:lang value="员工" /></td >
          <td class="datagrid-cell" style="width:200px;"><dict:lang value="月产量" /></td >

          <td class="datagrid-cell" style="width:170px;"><dict:lang value="人均产出" /></td >
          <td class="datagrid-cell" style="width:263px;"><dict:lang value="作业时间" /></td >
         </bu:tr>
         </tbody>



         <!--<td name="noprintset_PM_MEMO" class="datagrid-cell"><bu:uitn colNo="PM_MEMO" formId="bf62c7fde943478882afd3e0d285f42f" /></td>
		-->
        </bu:tr>
		</tbody>
		</bu:table>
		</div>

         <div class="datagrid-body datagrid-div3" style="height:400px" onscroll="ajaxTableScroll(this,'bf62c7fde943478882afd3e0d285f42f')">

          <table class="glxb-table" style="width:100%" id="addTable_bf62c7fde943478882afd3e0d285f42f">
           <tbody id="dataList" >
           <c:forEach var="item" items="${dataList}" varStatus="status">
            <tr>
             <td id="INDEX_${status.count}" class='datagrid-cell datagrid-cell-1' style='width:30px;'>${status.count}</td>
             <c:if test="${item.FEED_SORT==1}">
              <%--
              <td id="INDEX_${status.count}" class='datagrid-cell datagrid-cell-1' style='width:30px;'>${status.count}</td>
           --%>
              <td id="FEED_DEPT_${status.count}" class='datagrid-cell datagrid-cell-2' style="width:200px;">${item.FEED_DEPT}</td>
              <td id="FEED_JOB_${status.count}" class='datagrid-cell datagrid-cell-4' style="width:200px;">${item.FEED_JOB}</td>
              <td id="FEED_NAME_${status.count}" class='datagrid-cell datagrid-cell-3' style="width:200px;">${item.FEED_NAME}</td>
              <td id="PACK_COUNT_${status.count}" class='datagrid-cell datagrid-cell-4' style="width:200px;">${item.FEED_COUNT}</td>
              <td id="AVG_FEED_COUNT_${status.count}" class='datagrid-cell datagrid-cell-4' style="width:170px;">${item.AVG_FEED_COUNT}</td>
              <td id="FEED_TIME_${status.count}" class='datagrid-cell datagrid-cell-4' style="width:263px;">${item.FEED_TIME}</td>
             </c:if>
             <c:if test="${item.PACK_SORT==2}">
              <td id="PACK_DEPT_${status.count}" class='datagrid-cell datagrid-cell-2' style="width:200px;">${item.PACK_DEPT}</td>
              <td id="PACK_JOB_${status.count}" class='datagrid-cell datagrid-cell-4' style="width:200px;">${item.JOB_NAME}</td>
              <td id="PACK_NAME_${status.count}" class='datagrid-cell datagrid-cell-3' style="width:200px;">${item.PACK_NAME}</td>
              <td id="PACK_COUNT_${status.count}" class='datagrid-cell datagrid-cell-4' style="width:200px;">${item.PACK_COUNT}</td>
              <td id="PACK_COUNT_${status.count}" class='datagrid-cell datagrid-cell-4' style="width:170px;">${item.AVG_PACK_COUNT}</td>
              <%--
              <td id="PACK_NAME_${status.count}" class='datagrid-cell datagrid-cell-4' style="width:200px;">${item.PACK_COUNT}</td>
              --%>
              <td id="PACK_TIME_${status.count}" class='datagrid-cell datagrid-cell-4' style="width:263px;">${item.PACK_TIME}</td>
             </c:if>

            </tr>
           </c:forEach>
           </tbody>
          </table>
         </div>



        </div>
		<div class="datagrid-body datagrid-div3 datagrid-body-ajax" id="tableDivbf62c7fde943478882afd3e0d285f42f" onscroll="ajaxTableScroll(this,'bf62c7fde943478882afd3e0d285f42f')">
		<table class="datagrid-btable fixedTable dblClick"  id="datagrid-btable-ajaxbf62c7fde943478882afd3e0d285f42f">
		<tbody id="tbody_bf62c7fde943478882afd3e0d285f42f" class="isParents">
		</tbody>
		</table>		</div>
		</div>
		</div>
		<c:if test="${formPagebf62c7fde943478882afd3e0d285f42f==1}">			<div class="center">
			<s:include value="/plf/page/fp/paginationPopMultAx.jsp?listDataFn=listAjaxTable&formId=bf62c7fde943478882afd3e0d285f42f&showLoading=0" />
			</div>
		</c:if>


		<input type="hidden" name="tableCount" id="tableCount" value='1' />

               </form>
            </div>
        </div>
    </div>
		<bu:submit viewId="3d69fe7a5e994dd295bb235b6526a08c" />
      <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
           <jsp:param name="modelName" value="VIEW_TYPE_17" />
           <jsp:param name="location" value="beforeJsLoad" />
      </jsp:include>
		<bu:script viewId="3d69fe7a5e994dd295bb235b6526a08c" />
    <%--
    <jsp:include page="/plf/page/mesdemo/commCode/commCode.jsp">
        <jsp:param name="modelName" value="VIEW_TYPE_17" />
        <jsp:param name="location" value="jsLoading" />
      </jsp:include>
    --%>


    <script	type="text/javascript">


     function query(obj){



      var beginTime = $("#CREATE_TIME_BEGIN").val();
      console.log("beginTime>>>");
      console.log(beginTime);
      var endTime = $("#CREATE_TIME_END").val();
      console.log("endTime>>>");
      console.log(endTime);

      var editAuth = $("#DATA_AUTH").val();
      console.log("editAuth>>>");
      console.log(editAuth);


      var editUser = $("#CREATE_USER").val();
      console.log("editUser>>>");
      console.log(editUser);

      var deptId = $('#DEPT_ID').find("option:selected").val();
      console.log("dept>>>");
      console.log(deptId);

      var jobId = $('#PM_MEMO').find("option:selected").val();
      console.log("job>>>");
      console.log(jobId);






      util.showLoading("处理中...");
      $.ajax({
       type: "POST",
       dataType: "json",
       url: "${path}buss/bussModel_exeFunc.ms?funcMId=f3a7f41149f94af8be9269ab51a02f4d",
       data: {
        "beginTime" : beginTime,
        "endTime" :  endTime,
        "editAuth" : editAuth,
        "editUser" : editUser,
        "deptId" : deptId,
        "jobId" : jobId

       },
       success: function(data){
        util.closeLoading();
        $("#dataList").empty();
        if(null != data.ajaxList){
         var rccList = eval(data.ajaxList);
         if(rccList.length==0){
          utilsFp.confirmIcon(3,"","","", "未查到该条件下的作业数据",0,"300","");
          return ;

         }
         var num =null;
         for(var i=0;i<rccList.length;i++){
          //列表数据
          num =i+1;

          if(rccList[i].PROJECT_SORT == 1){
           var tempHtml = "<tr id='addTableTr" + i + "_' >"
                   + "<td style='width:30px;height:30px;text-align:center' class='datagrid-cell datagrid-cell-1'>"+num+"</td>"

                   //部门号
                   + "<td  class='datagrid-cell datagrid-cell-4' width='200px'>"+rccList[i].DEPT_NAME+"</td>"

                   //工种
                   + "<td  class='datagrid-cell datagrid-cell-4' width='200px'>"+rccList[i].JOB_NAME+"</td>"

                   //名称
                   + "<td  class='datagrid-cell datagrid-cell-4' width='200px'>"+rccList[i].USER_NAME+"</td>"

                   //数量
                   + "<td  class='datagrid-cell datagrid-cell-4' width='200px'>"+rccList[i].FEED_COUNT+"</td>"


                   + "<td  class='datagrid-cell datagrid-cell-4' width='170px'>"+rccList[i].AVG_FEED_COUNT+"</td>"


                   //时间
                   + "<td  class='datagrid-cell datagrid-cell-4' width='263px'>"+rccList[i].WORK_TIME+"</td>"

                   + "</tr>";
           //$("#" + i + "EDIT_TIME").val(rccList[i].EDIT_TIME);

           $("#dataList").append(tempHtml);
          }
          if(rccList[i].PACK_SORT == 2){
           var tempHtml = "<tr id='addTableTr" + i + "_' >"
                   + "<td style='width:30px;height:30px;text-align:center' class='datagrid-cell datagrid-cell-1'>"+num+"</td>"

                   //部门号
                   + "<td  class='datagrid-cell datagrid-cell-4' width='200px'>"+rccList[i].DEPT_NAME+"</td>"

                   //工种
                   + "<td  class='datagrid-cell datagrid-cell-4' width='200px'>"+rccList[i].JOB_NAME+"</td>"

                   //名称
                   + "<td  class='datagrid-cell datagrid-cell-4' width='200px'>"+rccList[i].USER_NAME+"</td>"

                   //数量
                   + "<td  class='datagrid-cell datagrid-cell-4' width='200px'>"+rccList[i].PACK_COUNT+"</td>"

                   + "<td  class='datagrid-cell datagrid-cell-4' width='170px'>"+rccList[i].AVG_PACK_COUNT+"</td>"

                   //时间
                   + "<td  class='datagrid-cell datagrid-cell-4' width='263px'>"+rccList[i].WORK_TIME+"</td>"

                   + "</tr>";
           //$("#" + i + "EDIT_TIME").val(rccList[i].EDIT_TIME);

           $("#dataList").append(tempHtml);
          }




         }


        }
       },

       error: function(msg){
        util.closeLoading();
        utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
       }

      });


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

<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<title><dict:lang value="新增" />
	</title>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<script type = "text/javascript" src = "${path}plf/js/ui/include.js"></script>
	<script type="text/javascript">
	//加载父ifream中的js\css文件
		var linkList = window.parent.document.getElementsByTagName("link");
		var scriptList = window.parent.document.getElementsByTagName("script");
		var head = document.getElementsByTagName("head").item(0);
		//外联样式
		for(var i=0;i<linkList.length;i++)
		{
			var l = document.createElement("link");
			l.rel = 'stylesheet';
			l.type = 'text/css';
			l.href = linkList[i].href;
			head.appendChild(l);
		}
		
		//去除重复的js引用
		var json = {};
		var scripts = new Array();
		var j = 0;
		for(var i=0;i<scriptList.length;i++)
		{
			if(scriptList[i].src != null && '' != scriptList[i].src && !json[scriptList[i].src])
			{
				json[scriptList[i].src] = 1;
				//include(scriptList[i].src);
				//alert("include "+scriptList[i].src);
				var script = document.createElement("script");
				script.type = 'text/javascript';
				script.src = scriptList[i].src;
				head.appendChild(script);
				scripts[j] = script;
				j++;
			}
		}
		
		window.scripts = scripts;
		var addTableTrMap;


	</script>
</head>
<body>
	<div class="edit">
            <div class="hd">
                <!-- <h2 class="tit"><i class="ico-hd"></i>物料信息常规</h2> -->
			    <div class="optn">
			        <button type="button" onclick="addParentData('${param.piframeId}','${exeid}');"><i class="ico ico-save"></i>保存</button>
			        <button type="button" onclick="closeCurrentWindow();"><i class="ico ico-cancel"></i>取消</button>
			    </div>
			</div>
			<div class="bd">
				<form id="addForm" name="addForm" action="${path}buss/bussModel_addComm.ms" method="post" <bu:formet exeid="%{exeid}" />
				target="submitFrame">
			<input type="hidden" name="exeid" value="${exeid}">
			<input type="hidden" name="definedMsg" value="${definedMsg}">
			<input type="hidden" name="trId" value="${param.trId}">
			<input type="hidden" name="data" value="${param.data}">
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" value="%{FUNC_CODE_2}" />
			<s:token />
			<!-- <table class="basic-table">
							<tr>
												<th colspan="4">
													<span class="Eng">*</span>
													<dict:lang value="为必填项" />
												</th>
										</tr>
									</table>-->
		<bu:set name="paraMapObj" value="${dataId}" formId="f28e888470274e45b90a63f55d64ebb1" type="add" />
	<table class="basic-table" >
	<input type="hidden" name="formIds" value="f28e888470274e45b90a63f55d64ebb1" />
	<input type="hidden" name="f28e888470274e45b90a63f55d64ebb1" value="paraMap0@" />
	<input type="hidden" name="paraMap0@__LEVEL__" value="0" />
	<input type="hidden" name="paraMap0@__DATA_COUNT__" value="1" />
		<s:set name="_$viewId" value="'8a318e122f6b4ce0a165044d42511529'" />
		<s:set name="_$formId_0" value="'f28e888470274e45b90a63f55d64ebb1'" />
		<s:set name="_$type" value="'add'" />
		<tr>
			<td class="name-three" /><bu:uitn colNo="UUNAME" formId="f28e888470274e45b90a63f55d64ebb1" /></td>
			<bu:td cssClass="dec-self" colNo="UUNAME" formId="f28e888470274e45b90a63f55d64ebb1" ><bu:ui colNo="UUNAME" formId="f28e888470274e45b90a63f55d64ebb1" value="%{UUNAME}" formIndex="0" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="END_DATE" formId="f28e888470274e45b90a63f55d64ebb1" /></td>
			<bu:td cssClass="dec-self" colNo="END_DATE" formId="f28e888470274e45b90a63f55d64ebb1" ><bu:ui colNo="END_DATE" formId="f28e888470274e45b90a63f55d64ebb1" value="%{END_DATE}" formIndex="0" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="CHOICE" formId="f28e888470274e45b90a63f55d64ebb1" /></td>
			<bu:td cssClass="dec-self" colNo="CHOICE" formId="f28e888470274e45b90a63f55d64ebb1" ><bu:ui colNo="CHOICE" formId="f28e888470274e45b90a63f55d64ebb1" value="%{CHOICE}" formIndex="0" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="SW_NAME" formId="f28e888470274e45b90a63f55d64ebb1" /></td>
			<bu:td cssClass="dec-self" colNo="SW_NAME" formId="f28e888470274e45b90a63f55d64ebb1" ><bu:ui colNo="SW_NAME" formId="f28e888470274e45b90a63f55d64ebb1" value="%{SW_NAME}" formIndex="0" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="S_NAME" formId="f28e888470274e45b90a63f55d64ebb1" /></td>
			<bu:td cssClass="dec-self" colNo="S_NAME" formId="f28e888470274e45b90a63f55d64ebb1" ><bu:ui colNo="S_NAME" formId="f28e888470274e45b90a63f55d64ebb1" value="%{S_NAME}" formIndex="0" /></bu:td>
		</tr>
		<tr>
			<td class="name-three" /><bu:uitn colNo="UUID" formId="f28e888470274e45b90a63f55d64ebb1" /></td>
			<bu:td cssClass="dec-self" colNo="UUID" formId="f28e888470274e45b90a63f55d64ebb1" ><bu:ui colNo="UUID" formId="f28e888470274e45b90a63f55d64ebb1" value="%{UUID}" formIndex="0" /></bu:td>
		</tr>
	</table>
			<bu:jsVal formId="f28e888470274e45b90a63f55d64ebb1" formIndex="0" />
				<table class="func_table">
				<tr>
					<td width="100%" align="right">
						
					</td>
				</tr>
				</table>
			</form>
		</div>
		
	</div>

	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>

<script type="text/javascript">
		$(function(){
		var parentWindow = $(window.parent.document).contents().find("#"+'${param.piframeId}')[0].contentWindow;
		var cells = document.getElementsByTagName("td");
		if('${param.col}' != '')
		{
			//console.log(cells.length);
			for (var i = 0;i< cells.length;i++)
			{
				if($(cells[i]).hasClass("dec-self"))
				{
					
					var temp = parentWindow.findTr('td_' + '${param.col}' + '#' + $(cells[i]).attr("colno"));
					//console.log("temp:" + 'td_' + '${param.col}' + '#' + $(cells[i]).attr("colno"));
					//console.log("temp.children():" + temp.children());
					if(temp == null || typeof(temp) == 'undefind')
					{
						continue;
					}
					else
					{
					
						$(cells[i]).empty();
						$(cells[i]).append(temp.children());
					}
				}
			}
		}
	});
	
	
	
	
	function init(){
		$(".<s:property value="%{@com.more.fw.core.cont.formui.AbsBaseUi@IS_SELECT_FILTER}"/>").chosen();
		
	}//初始化方法
		
	$.fn.serializeObject = function()
	{
		var o = {};
		var a = this.serializeArray();
		$.each(a, function()
		{
			if (o[this.name]){
				if( !o[this.name].push){
					o[this.name] = [o[this.name]];
				}
				o[this.name].push(this.value || '');
			}
			else{
				o[this.name] = this.value || '';	
			}
		});
		return o;
	}

	function addParentData(e,exeid,viewid)
	{
		//console.log("e:" + e);
		//console.log("exeid:" +　exeid);
		//console.log("viewid:" + viewid);
		var parentWindows = $(window.parent.document).contents().find("#"+e)[0].contentWindow;
		var data = $("#addForm").serializeObject();
		var cp = $("table tr .dec-self").clone(1);
		
		var col = '${param.col}';
		if(col == '')
		{
			col = parentWindows.addData(e,exeid,viewid);
		//	console.log("col:" + col);
		}
		$("table").find("td").each(function(i,item){
				parentWindows.editData($(item).children(),col ,$(item).attr("colno"));
		});

		closeTopPopWinFp(window.frameElement.id + "pop");
	}
	function closeCurrentWindow()
	{
		closeTopPopWinFp(window.frameElement.id + "pop");
	}
	
	
</script>

	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>

</body>
<%@ include file="/plf/common/pub_end.jsp"%>

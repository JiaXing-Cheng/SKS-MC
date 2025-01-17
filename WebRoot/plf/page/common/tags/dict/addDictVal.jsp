<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/plf/common/pub_tag.jsp" %>
<html>
	<head>
		<title><dict:lang value="新增数据字典" /></title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<jsp:include page="/plf/common/fp/pub_dom_fp.jsp">
		<jsp:param name="needValidate" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/addCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	</head>

	<body>
		<div style="background-color: white;margin-top: 37px;">
		<div class="hd">
			<div style="margin-left:10px;margin-top: -35px;">
				<div class="save-close" title="<dict:lang value='保存并关闭窗口' />" onclick="saveClose(this)"></div>
				<input type="checkbox" checked id="isCloseWin" name="isCloseWin"  value="0" style="display:none;"/>
				
			</div>
			    <div class="optn">
			    <%-- <input type="button" value="<dict:lang value="提 交" />" onclick="submitForm(this);" class="botton_img_add">
				&nbsp;&nbsp;
				<input type="reset" value="<dict:lang value="重 置" />"class="botton_img_search" />
				&nbsp;&nbsp;
				<input type="button" value="<dict:lang value="返 回" />" onclick="goBack();" class="botton_img_search"> --%>
			        <button type="button" onclick="submitForm(this);"><i class="ico ico-save"></i><dict:lang value='保存' /></button>
			        <button type="button" onclick="closeWindow();"><i class="ico ico-cancel"></i><dict:lang value='取消' /></button>
			    </div>
			</div>
			<div style="height: 170px;">
	<form id="add_form" name="addForm" action="${path}comm/DictValAction_addDictValAx.ms?" method="post" style="margin-top: -35px;" target="submitFrame">
		<input type="hidden" id="iframeId" name="paraMap.iframeId" value="<c:out value='${iframeId}'/>"/>
		<input type="hidden" id="dictCode" name="paraMap.dictCode" value="<c:out value='${list[0].dictCode}'/>"/>
		<input type="hidden" id="isCloseWin_s" name="paraMap.isCloseWin"/>
	<table class="basic-table" style="text-align: center;">
        <tr>
			<td style="width: 150px;text-align: right;"><span class="dot">*</span><dict:lang value="明细项编码" /></td>
			<td style="text-align:left;padding-left: 5px;">
				<input class="input" name="paraMap.code" id="code" maxlength="125" style="width: 230px;" onkeyup="javascript:utilsFp.replaceLikeVal(this)"/>
			</td>
       </tr>
        <tr>
			<td style="width: 150px;text-align: right;"><dict:lang value="明细项编码值" /></td>
			<td style="text-align:left;padding-left: 5px;">
				<input class="input"  id="value" maxlength="125" style="width: 230px;" onchange="codeJSFun(this)"/>
				<input type="hidden" name="paraMap.value" />
			</td>
       </tr>
        <tr>
			<td style="width: 150px;text-align: right;"><dict:lang value="下拉列表显示顺序" /></td>
			<td style="text-align:left;padding-left: 5px;" title="备注：从小到大的顺序排列（不填默认为0）">
				<input class="input" onkeyup="this.value=this.value.replace(/[^1-9]/gi,'')" name="paraMap.dispIndx" id="dispIndx" maxlength="125" style="width: 230px;"/>
			</td>
       </tr>
       
       <!--  
        <tr>
			<td style="width: 150px;text-align: right;"></td>
			<td style="text-align:left;padding-left: 5px;">
				<dict:lang value="备注：从小到大的顺序排列（不填默认为0）" />
			</td>
       </tr>
       -->
       
        <tr>
			<td style="width: 150px;text-align: right;"><dict:lang value="不可删除" /></td>
			<td style="text-align: left;padding-left:5px;">
				<input type="checkbox" id="is_del" name="paraMap.is_del" value="1" maxlength="2" title="勾选上表示不可删除">
				
				<span style="margin-left: 60px;"><dict:lang value="编码值不可编辑" /></span>
				
				<input type="checkbox" id="is_edit" name="paraMap.is_edit" value="1" maxlength="2" title="勾选上表示编码值不可编辑">
			</td>
       </tr>
       
     </table>
     </form>
   </div>
	<div style="display: none;">
		<iframe id="submitFrame" name="submitFrame" src="" width="0" height="0"></iframe>
	</div>
</div>

</body>
	
	<script type="text/javascript">
		function codeJSFun(objThis){
  		var langs = _mcBase64JsToJava.getMcDealBase64Encode(objThis.value);  
  		 $(objThis).next().val(langs);
  		}
  		
		function submitForm(thisObj){
			var code = $("#code").val();
			var dictCode = $("#dictCode").val();
			var codes = document.getElementById("code");
			if (code!=""&&code!=null) {
			
			var reg = /^[a-zA-Z0-9\\_]{0,}$/;
			if(!reg.test(code)){
				_alertValMsg(codes,"<dict:lang value="明细项编码，只能由字母、数字、_组成请检查" />...");
				return ;
			}
			
			
				
			if ($("#isCloseWin").attr("checked")) {
				$("#isCloseWin_s").val("0");
			}else{
				$("#isCloseWin_s").val("1");
			} 
			var langs = _mcBase64JsToJava.getMcDealBase64Encode(code);
			var dictCodew = _mcBase64JsToJava.getMcDealBase64Encode(dictCode);
			$.ajax({
				type: "POST",
			    dataType: "json",
			    url: "${path}comm/DictValAction_dictValAxVal.ms",
			    data: {
			    	"paraMap.code" : langs,
			    	"paraMap.dictCode" : dictCodew
			    },
				success: function(data){
						if(null == data){
						return ;}
						if(data.ajaxMap != null && data.ajaxMap.msg !=null){
							util.closeLoading();
							utilsFp.confirmIcon(3,"","","", "error:"+data.ajaxMap.msg,0,"300","");
							return ;
						}
						if(null != data.ajaxMap){
							if (parseInt(data.ajaxMap.count)!=0) {
								_alertValMsg(codes,"<dict:lang value="明细项编码已存在" />");
				    			return false;
						}else{
							$("#iframeId").val(window.name);
							document.forms.add_form.submit(); 
						}
							}
							
				},
					error: function(msg){
						util.closeLoading();
						utilsFp.confirmIcon(3,"","","", "error:"+msg,0,"300","");
				  }	
				});
			}else{
				_alertValMsg(codes,"<dict:lang value="明细项编码不能为空" />");
			}
		}
		
	$(function(){
  	//获取当前iframe名称
		var ptfs = window.parent.frames;
		for(var i = 0 ; i < ptfs.length;i++){
			if(ptfs[i] == window){
				$("#iframeId").val(window.name);
			}
		}
  });
  	
    function goBack(){
   		var formObj= document.forms.add_form;
   		formObj.action = "${path}/comm/DictAction_listDict.ms?FUNC_CODE=F4";
   		formObj.submit();
    }
     function replaceLikeVal1(comp){
		  if (comp.value.indexOf("'") != -1 ||comp.value.indexOf("\"") != -1||comp.value.indexOf("<") != -1||comp.value.indexOf(">") != -1
	        		||comp.value.indexOf("{") != -1||comp.value.indexOf("}") != -1||comp.value.indexOf("[") != -1||comp.value.indexOf("]") != -1
	        		||comp.value.indexOf("(") != -1||comp.value.indexOf(")") != -1) {  
	            comp.value = comp.value.replace(/\'/g,"").replace(/\"/g,"").replace(/</g,"").replace(/>/g,"")
	            .replace(/{/g,"").replace(/\(/g,"").replace(/\)/g,"").replace(/\[/g,"").replace(/\]/g,"").replace(/\}/g,"");
	            utilsFp.alert("不能输入单引号双引号<>{}()[]");
	  }   }
	</script>

<%@ include file="/plf/common/fp/pub_dom_fp.jsp"%>
<%@ include file="/plf/common/pub_end.jsp" %>
</html>

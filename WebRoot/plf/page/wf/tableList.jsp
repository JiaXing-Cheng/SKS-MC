<%@page import="com.more.fw.core.common.method.StringUtilsMc"%>
<%@page import="com.more.fw.core.common.method.ConstantsMc"%>
<%@page import="com.more.fw.core.common.method.CommMethodMc"%>
<%@page import="com.more.fw.core.staticresource.PlfStaticRes"%>
<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/plf/tld/struts-tags.tld"%>
<%@ taglib prefix="dict" uri="/plf/tld/ldg-dict-tags.tld"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>表单元素</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <jsp:include page="/plf/common/pub_head.jsp">
	  <jsp:param name="layui" value="1" />
  </jsp:include>
</head>
<body>
<div class="layui-fluid">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md12">
      <div class="layui-card">
        <div class="layui-card-header">开启头部工具栏</div>
        <div class="layui-card-body">
        	
        	
        	<div class="layui-tab mc-tab">
	           <ul class="layui-tab-title">
	             <li class="layui-this"><a><span>网站设置</span></a></li>
	             <li class=""><a><span>网站设置</span></a></li>
	             <li><a><span>网站设置</span></a></li>
	             <li><a><span>网站设置</span></a></li>
	             <li><a><span>网站设置</span></a></li>
	           </ul>
	           <div class="layui-tab-content">
	             <div class="layui-tab-item layui-show  mc-table-content">
	                 <table class="layui-hide" id="test-table-toolbar" lay-filter="test-table-toolbar"></table>
	           
	          		<script type="text/html" id="test-table-toolbar-barDemo">
             			<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
              			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
            		</script>  
	             </div>
	             <div class="layui-tab-item">内容2</div>
	             <div class="layui-tab-item">内容3</div>
	             <div class="layui-tab-item">内容4</div>
	             <div class="layui-tab-item">内容5</div>
	           </div>
	         </div>
        	
          
       
    </div>
  </div>
</div>
  <script>
  layui.config({
    base: '${path}plf/style/layui/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'table'], function(){
    var admin = layui.admin
    ,table = layui.table;
  
    table.render({
      elem: '#test-table-toolbar'
      ,url: layui.setter.base + 'json/table/demo.js'
      ,title: '用户数据表'
      ,cols: [[
        {type: 'checkbox', fixed: 'left'}
        ,{field:'id', title:'ID', width:80, fixed: 'left', unresize: true, sort: true}
        ,{field:'username', title:'用户名', width:120, edit: 'text'}
        ,{field:'email', title:'邮箱', width:150, edit: 'text', templet: function(res){
          return '<em>'+ res.email +'</em>'
        }}
        ,{field:'sex', title:'性别', width:80, edit: 'text', sort: true}
        ,{field:'city', title:'城市', width:100}
        ,{field:'sign', title:'签名'}
        ,{field:'experience', title:'积分', width:80, sort: true}
        ,{field:'ip', title:'IP', width:120}
        ,{field:'logins', title:'登入次数', width:100, sort: true}
        ,{field:'joinTime', title:'加入时间', width:120}
        ,{fixed: 'right', title:'操作', toolbar: '#test-table-toolbar-barDemo', width:150}
      ]]
      ,page: true
    });
    
    //头工具栏事件
    table.on('toolbar(test-table-toolbar)', function(obj){
      var checkStatus = table.checkStatus(obj.config.id);
      switch(obj.event){
        case 'getCheckData':
          var data = checkStatus.data;
          layer.alert(JSON.stringify(data));
        break;
        case 'getCheckLength':
          var data = checkStatus.data;
          layer.msg('选中了：'+ data.length + ' 个');
        break;
        case 'isAll':
          layer.msg(checkStatus.isAll ? '全选': '未全选');
        break;
      };
    });
    
    //监听行工具事件
    table.on('tool(test-table-toolbar)', function(obj){
      var data = obj.data;
      if(obj.event === 'del'){
        layer.confirm('真的删除行么', function(index){
          obj.del();
          layer.close(index);
        });
      } else if(obj.event === 'edit'){
        layer.prompt({
          formType: 2
          ,value: data.email
        }, function(value, index){
          obj.update({
            email: value
          });
          layer.close(index);
        });
      }
    });
  
  });
  </script>
</body>

</html>
<%@ page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
<%@page import="com.more.fw.core.dbo.model.dao.PaginationImpl"%>
<%@ include file="/plf/common/pub_tag.jsp"%>
<head>
	<title>
		<dict:lang value="客户组" />
	</title>
	<%@ include file="/plf/common/pub_meta.jsp"%>
	<jsp:include page="/plf/common/fp/pub_head_fp.jsp">
		<jsp:param name="popDivWinFp" value="1" />
		<jsp:param name="datePicker" value="1" />
		<jsp:param name="chosen" value="1" />
	</jsp:include>
	<%@ include file="/plf/page/common/buss/bussCommJs.jsp"%>
	<%@ include file="/plf/page/common/buss/listCommJs.jsp"%>

</head>
<body scroll="auto" style="overflow: auto;" >

          <div class="content-in">
              <div class="edit">
                  <div class="hd">
                  
		<bu:func viewId="c5e4350b39c14e2aae4d4264e241e5eb" />
                    
                  </div>
                  <div class="bd">
                      <div class="search-box">
						<form id="searchForm" name="searchForm" action="${path}buss/bussModel.ms" method="post">
							<input type="hidden" name="exeid" value="${exeid}" />
							<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:search viewId="c5e4350b39c14e2aae4d4264e241e5eb" />
						</form>
                        <a href="javascript:;" class="more"></a>
                        <script type="text/javascript">
                          $('.search-box .more').click(function(){
                            $('.search-box').toggleClass('show');
                          })
                        </script>
                      </div>
                      
                      
		<form id="listForm" name="listForm" action="${path}buss/bussModel.ms" method="post">
			<input type="hidden" name="exeid" value="${exeid}" />
			<s:hidden name="%{@com.more.fw.core.common.method.Constants@FUNC_CODE}" />
		<bu:form viewId="c5e4350b39c14e2aae4d4264e241e5eb" formId="31d0426b962d4a3cb90ede1e278a7fbd" list="dataList" formidFirstId="31d0426b962d4a3cb90ede1e278a7fbd" relColIds="" subFormIds="" subRelColIds="" />
  <% if(null != request.getAttribute("page")){
  PaginationImpl _pageTop = (PaginationImpl)request.getAttribute("page"); 
  if(_pageTop.isPage()){%>
  <div class="center">
    <s:include value="/plf/page/fp/pagination.jsp?formId=searchForm" />
  </div>
  <% }}%></div>


		</form>
                      
                  </div>
                </div>
          </div>


		<bu:submit viewId="c5e4350b39c14e2aae4d4264e241e5eb" />
		<bu:script viewId="c5e4350b39c14e2aae4d4264e241e5eb" />
    <script type="text/javascript">
         $('.js-nav').slick({
            dots: false,
            autoplay: false,
            slidesToScroll:1,
            slidesToShow:8
        });
         $('.menu-sub').mCustomScrollbar({
          scrollInertia:150
        });
        $('#mCSB_1').css('overflow','visible');
        $('.banner .item1').hover(function(){
          $('.banner').css('border-bottom-color','#20c2ff');
        },
        function(){
           $('.banner').css('border-bottom-color','#20c2ff');
        });
        $('.banner .item2').hover(function(){
          $('.banner').css('border-bottom-color','#fccd00');
        },
        function(){
           $('.banner').css('border-bottom-color','#20c2ff');
        });
        $('.banner .item3').hover(function(){
          $('.banner').css('border-bottom-color','#8fcf3e');
        },
        function(){
           $('.banner').css('border-bottom-color','#20c2ff');
        });
        $('.banner .item4').hover(function(){
          $('.banner').css('border-bottom-color','#592e2e');
        },
        function(){
           $('.banner').css('border-bottom-color','#20c2ff');
        });

        function Height(){
          var H = $(window).height();
          $('.menu').css('height',H);
          $('.content').css('height',H - 70);
          $('.content').mCustomScrollbar({
            scrollInertia:150
          });
        }
        Height();
        $(window).resize(function(){
          $('.content').mCustomScrollbar("destroy");
          Height();
        });
        $(function(){
          $('.dept_select').chosen();
         
      });
        

    	var isQuery = false;
    	function query(thisObj){
    		//如果有时间段的存在，则复制到搜索表单中
    		if($("#timeBucketId")){
    			$("#searchForm").append($("#timeBucketId").clone());
    		}
    		if(isQuery){//utilsFp.alert("<dict:lang value="数据正在提交，请稍候" />...");
    		utilsFp.confirmIcon(3,"","","", "<dict:lang value="数据正在提交，请稍候" />...",0,"","");}
    		document.forms.searchForm.submit();
    		utilsFp.showTopLoading();
    		isQuery=true;
    	}
    	
    	function alertInfo(msg){
    		utilsFp.alert(msg);
    	}
    	
    	function reloadPg(msg,title,width,height,time){
		msgPop(msg,reloadPgExe,title,width,height,time);
	}
	
    	
    	function reloadPgExe(){
    		document.forms.searchForm.submit();
    		util.showTopLoading();
    		top.$(".dialog-close").click();
    	}
    	
    	function init(){
    		$(".table_list").each(function(seq) {
    			var tableTrJs =$(this).find("tbody tr");
    			_toClickColorMap(tableTrJs,$(this).attr("id"));
    			_tongLineColor(tableTrJs);
    		});
    		
    		<s:if test='null != #parameters[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] && #request[@com.more.fw.core.common.method.Constants@SHOW_INIT_LIST_DATA] == "1"'>query();</s:if>
    		//判断是否隐藏搜索框
    		if($("#searchParaNull").val()=="0"){
    			$(".search-box").hide();
    		}
    	}

    </script>

<%@ include file="/plf/common/pub_dom.jsp"%>
</body>
<%@ include file="/plf/common/pub_end.jsp"%>

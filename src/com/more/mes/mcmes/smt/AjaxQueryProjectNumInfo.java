package com.more.mes.mcmes.smt;

import java.util.List;
import java.util.Map;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 查询工单数据
 * @author LEO
 *
 */
public class AjaxQueryProjectNumInfo implements FuncService{

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        HttpServletRequest request = modelAction.getRequest();
        String beginTime = request.getParameter("beginTime");
        String endTime = request.getParameter("endTime");
        String editAuth = request.getParameter("editAuth");
        StringBuffer param = new StringBuffer();
        if( beginTime !="" && beginTime != null){
            param.append(" AND TRUNC(T1.CREATE_TIME) > TRUNC(to_date('"+beginTime+"', 'yyyy-mm-dd hh24:mi:ss'))");
        }
        if( endTime != "" && endTime != null){
            param.append(" AND TRUNC(T1.CREATE_TIME) < TRUNC(to_date('"+endTime+"', 'yyyy-mm-dd hh24:mi:ss'))");
        }
        if( editAuth != "" && editAuth != null){
            param.append(" AND T1.DATA_AUTH = '"+editAuth+"'");
        }
        List<Map> itemList = null;
        String userId = modelAction.getSessionUser().getId();
        String sql = " SELECT COUNT(T1.PROJECT_ID) AS S_PROJECT_COUNT,COUNT(T2.P_PROJECT) AS P_PROJECT_COUNT,COUNT(T3.S_PROJECT) AS F_PROJECT_COUNT "+
                " FROM T_PM_PROJECT_BASE T1 "+
                " LEFT JOIN (SELECT A.PROJECT_ID AS P_PROJECT FROM T_PM_PROJECT_BASE A WHERE 1=1 AND A.PROJECT_SORT='2') T2 "+
                " ON T2.P_PROJECT = T1.PROJECT_ID "+
                " LEFT JOIN (SELECT B.PROJECT_ID AS S_PROJECT FROM T_PM_PROJECT_BASE B WHERE 1=1 AND B.PROJECT_SORT='1') T3 "+
                " ON T3.S_PROJECT = T1.PROJECT_ID "+
                " WHERE 1 = 1 "+ param;
        itemList = modelService.listDataSql(sql);
        CommMethod.listToEscapeJs(itemList);
        modelAction.setAjaxList(itemList);
        return modelAction.AJAX;
    }


}

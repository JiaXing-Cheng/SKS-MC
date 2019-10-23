package com.more.mes.mcmes.smt;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 通过工单查询关联工单
 * @author LEO
 *
 */
public class AjaxQueryRelProject implements FuncService{

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        HttpServletRequest request = modelAction.getRequest();
        //String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
        String itemLot =  request.getParameter("itemLot");
        //String userId = modelAction.getSessionUser().getId();
        //判断是否下级工单
        boolean flag = true;
        String checkPackProjectSql = "SELECT * " +
                "  FROM T_PM_PROJECT_BASE T " +
                " WHERE 1 = 1 " +
                "   AND T.IS_REL='2' " +
                "   AND T.PROJECT_ID = ? ";
        int count = modelService.countSql(checkPackProjectSql, new Object[]{itemLot});
        List itemList = null;
        if(count <= 0) {
            String sql = "SELECT R.REL_PROJECT_ID as rel_project_id ,T1.project_id FROM t_pm_project_base t1 " +
                    "      left join t_pm_project_rel r " +
                    "      on r.project_id = t1.project_id " +
                    "      where  T1.PROJECT_ID = ? ";
            itemList = modelService.listDataSql(sql, new Object[]{itemLot});
        }else {
            String sql = " SELECT t1.project_id as rel_project_id ,r.project_id FROM t_pm_project_base t1 "+
                    " left join t_pm_project_rel r "+
                    " on r.rel_project_id = t1.project_id "+
                    " where 1=1 AND T1.PROJECT_ID =? ";
            itemList = modelService.listDataSql(sql, new Object[]{itemLot});
        }


        modelAction.setAjaxPage(modelAction.getPage());
        CommMethod.listToEscapeJs(itemList);
        modelAction.setAjaxList(itemList);
        modelAction.getAjaxPage().setDataList(itemList);
        return modelAction.AJAX;
    }

}

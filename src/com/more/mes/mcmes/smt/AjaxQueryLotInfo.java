package com.more.mes.mcmes.smt;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 追溯 ---根据工单查询基本信息
 * @author development
 *
 */
public class AjaxQueryLotInfo implements FuncService{

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        HttpServletRequest request = modelAction.getRequest();
        String itemSn = request.getParameter("itemSn");
        String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
        List<Map> itemList = null;
        String userId = modelAction.getSessionUser().getId();
        String sql = "  SELECT t1.project_id,"+
                "  t1.product_name,"+
                " t1.product_material,"+
                " t1.cust_code,"+
                " t1.lot_number," +
                " t1.product_count,"+
                " t1.work_space,"+
                " t1.project_status,"+
                " t1.prolepsis_start_date,"+
                " t1.prolepsis_end_date,"+
                " p.create_time,"+
                " t1.FINISH_COUNT "+
                " FROM t_pm_project_base t1"+
                " left join T_PM_PROJECT_POST p"+
                " on p.lot = t1.lot_number"+
                " and p.project_id = t1.project_id "+
                //" left join T_QM_PROJECT_CHECK c "+
                // " on c.project_id = t1.project_id "+
                " where 1=1 AND T1.PROJECT_ID = ?";
        itemList = modelService.listDataSql(sql, new Object[]{itemSn});
        CommMethod.listToEscapeJs(itemList);
        modelAction.setAjaxList(itemList);
        return modelAction.AJAX;
    }

}

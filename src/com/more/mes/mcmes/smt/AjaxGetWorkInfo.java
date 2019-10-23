package com.more.mes.mcmes.smt;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 根据批次获取--备料--投料--包装信息
 * @author development
 *
 */
public class AjaxGetWorkInfo implements FuncService{

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        HttpServletRequest request = modelAction.getRequest();
        String itemSn = request.getParameter("itemSn");
        String type = request.getParameter("type");//类型
        String userId = modelAction.getSessionUser().getId();
        //String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
        //判断是否包装单
        boolean flag = true;
        String checkPackProjectSql = "SELECT * " +
                "  FROM T_PM_PROJECT_BASE T " +
                " WHERE 1 = 1 " +
                "   AND T.PROJECT_SORT = '2' " +
                "   AND T.PROJECT_ID = ? ";
        int count = modelService.countSql(checkPackProjectSql, new Object[]{itemSn});
        if(count <= 0) {
            flag = false;
        }

        if(flag) {
            //包装单
            if(type.equals("logType")){ //备料
                String sql = " SELECT A.ID,D.CI_ITEM_CODE AS ITEM_CODE, " +
                        "       D.CI_ITEM_NAME AS ITEM_NAME, " +
                        "       A.PROJECT_ID, " +
                        "       u.name, " +
                        "       A.CHECK_MON AS EDIT_TIME " +
                        "  FROM T_PM_PROJECT_BASE A " +
                        "  LEFT JOIN T_PM_PROJECT_DETAIL C " +
                        "    ON C.PROJECT_ID = A.PROJECT_ID " +
                        "  LEFT JOIN  sy_user u "+
                        "  on u.id = A.CHECK_USER "+
                        "  LEFT JOIN T_CO_ITEM D " +
                        "    ON C.CBD_ITEM_CODE = D.CI_ITEM_CODE " +
                        " WHERE 1 = 1 " +
                        " AND A.PROJECT_ID= ? " ;
                List listParam = new ArrayList();
                listParam.add(itemSn);
                //listParam.add(userId);
                List<Map> itemList =modelService.listSql(sql, modelAction.getPage(), null, listParam, null,null);
                modelAction.setAjaxPage(modelAction.getPage());
                CommMethod.listToEscapeJs(itemList);
                modelAction.getAjaxPage().setDataList(itemList);
            }else if(type.equals("product")){ //投料
                String sql = "  SELECT A.ID, D.CI_ITEM_CODE AS ITEM_CODE," +
                        "                C.FEED_NUM," +
                        "                A.PROJECT_ID," +
                        "                U.NAME," +
                        "                C.CREATE_TIME," +
                        "                D.CI_ITEM_NAME AS ITEM_NAME " +
                        "                FROM T_PM_PROJECT_BASE A " +
                        "                LEFT JOIN T_PM_PROJECT_FEED_DETAIL C " +
                        "                ON C.PROJECT_ID = A.PROJECT_ID " +
                        "                LEFT JOIN T_CO_ITEM D " +
                        "                ON C.ITEM_CODE = D.CI_ITEM_CODE " +
                        "                LEFT JOIN  sy_user u " +
                        "                on u.id = C.create_user" +
                        "                LEFT JOIN T_PM_PROJECT_REL R" +
                        "                ON R.REL_PROJECT_ID = A.PROJECT_ID" +
                        "                WHERE 1 = 1 " +
                        "                AND R.project_Id = ?";
                List listParam = new ArrayList();
                listParam.add(itemSn);
                List<Map> itemList =modelService.listSql(sql, modelAction.getPage(), null, listParam, null,null);
                modelAction.setAjaxPage(modelAction.getPage());
                CommMethod.listToEscapeJs(itemList);
                modelAction.getAjaxPage().setDataList(itemList);
            }else if(type.equals("checkType")){ //质检
                String sql = " SELECT C.PROJECT_ID,C.CHECK_STATUS,C.BAD_REASONS,C.QT_MON,U.NAME,C.CREATE_TIME " +
                        "        FROM T_QM_PROJECT_CHECK C " +
                        "        LEFT JOIN T_PM_PROJECT_REL R " +
                        "        ON R.REL_PROJECT_ID = C.PROJECT_ID " +
                        "        LEFT JOIN SY_USER U " +
                        "        ON U.ID = C.CREATE_USER" +
                        "        WHERE 1=1 AND R.PROJECT_ID=?   ";
                List listParam = new ArrayList();
                listParam.add(itemSn);
                List<Map> itemList =modelService.listSql(sql, modelAction.getPage(), null, listParam, null,null);
                modelAction.setAjaxPage(modelAction.getPage());
                CommMethod.listToEscapeJs(itemList);
                modelAction.getAjaxPage().setDataList(itemList);
            } else{ //包装
                String sql =" SELECT T1.ID,t1.project_id,f.item_code,f.item_mane as item_name,f.pack_num,u.name,f.create_time FROM T_PM_Project_Base t1 "+
                        " left join t_project_pack_feed f "+
                        " on f.project_id = t1.project_id "+
                        " left join sy_user u "+
                        " on u.id = f.create_user "+
                        " where 1=1 "+
                        " and t1.project_id = ?";
                List listParam = new ArrayList();
                listParam.add(itemSn);
                List<Map> itemList =modelService.listSql(sql, modelAction.getPage(), null, listParam, null,null);
                modelAction.setAjaxPage(modelAction.getPage());
                CommMethod.listToEscapeJs(itemList);
                modelAction.getAjaxPage().setDataList(itemList);
            }
        }else {
            //制造单
            if(type.equals("logType")){ //备料
                String sql = " SELECT A.ID,D.CI_ITEM_CODE AS ITEM_CODE, " +
                        "       D.CI_ITEM_NAME AS ITEM_NAME, " +
                        "       A.PROJECT_ID,  " +
                        "       u.name, " +
                        "       A.CHECK_MON AS EDIT_TIME " +
                        "  FROM T_PM_PROJECT_BASE A " +
                        "  LEFT JOIN T_PM_PROJECT_DETAIL C " +
                        "    ON C.PROJECT_ID = A.PROJECT_ID " +
                        "  LEFT JOIN  sy_user u "+
                        "  on u.id = A.CHECK_USER "+
                        "  LEFT JOIN T_CO_ITEM D " +
                        "    ON C.CBD_ITEM_CODE = D.CI_ITEM_CODE " +
                        " WHERE 1 = 1 " +
                        " AND A.PROJECT_ID= ? " ;
                List listParam = new ArrayList();
                listParam.add(itemSn);
                //listParam.add(userId);
                List<Map> itemList =modelService.listSql(sql, modelAction.getPage(), null, listParam, null,null);
                modelAction.setAjaxPage(modelAction.getPage());
                CommMethod.listToEscapeJs(itemList);
                modelAction.getAjaxPage().setDataList(itemList);
            }else if(type.equals("product")){ //投料
                String sql = " SELECT A.ID, B.ITEM_CODE,  " +
                        "       B.FEED_NUM,  " +
                        "       A.PROJECT_ID,  " +
                        "       u.name,  " +
                        "       B.CREATE_TIME,  " +
                        "       D.CI_ITEM_NAME  AS ITEM_NAME  " +
                        "  FROM T_PM_PROJECT_FEED_BASE A  " +
                        "  LEFT JOIN T_PM_PROJECT_FEED_DETAIL B  " +
                        "    ON A.PROJECT_ID = B.PROJECT_ID  " +
                        "  LEFT JOIN T_CO_ITEM D  " +
                        "    ON B.ITEM_CODE = D.CI_ITEM_CODE  " +
                        "  LEFT JOIN  sy_user u "+
                        "  on u.id = B.create_user "+
                        "  LEFT JOIN T_PM_PROJECT_DETAIL P  " +
                        "    ON P.CBD_ITEM_CODE = B.ITEM_CODE  " +
                        "   AND P.PROJECT_ID = A.PROJECT_ID  " +
                        "  LEFT JOIN T_PM_PROJECT_BASE C  " +
                        "    ON C.PROJECT_ID = A.PROJECT_ID  " +
                        " WHERE 1 = 1  " +
                        "   AND C.PROJECT_ID = ?   ";
                List listParam = new ArrayList();
                listParam.add(itemSn);
                List<Map> itemList =modelService.listSql(sql, modelAction.getPage(), null, listParam, null,null);
                modelAction.setAjaxPage(modelAction.getPage());
                CommMethod.listToEscapeJs(itemList);
                modelAction.getAjaxPage().setDataList(itemList);
            }else if(type.equals("checkType")){ //质检
                String sql = " SELECT C.PROJECT_ID,C.CHECK_STATUS,C.BAD_REASONS,C.QT_MON,U.NAME,C.CREATE_TIME " +
                        "        FROM T_QM_PROJECT_CHECK C " +
                        "        LEFT JOIN SY_USER U " +
                        "        ON U.ID = C.CREATE_USER" +
                        "        WHERE 1=1 AND C.PROJECT_ID=?   ";
                List listParam = new ArrayList();
                listParam.add(itemSn);
                List<Map> itemList =modelService.listSql(sql, modelAction.getPage(), null, listParam, null,null);
                modelAction.setAjaxPage(modelAction.getPage());
                CommMethod.listToEscapeJs(itemList);
                modelAction.getAjaxPage().setDataList(itemList);
            } else{ //包装
                String sql =" SELECT T1.ID,t1.project_id,f.item_code,f.item_mane as item_name,f.pack_num,u.name,f.create_time FROM T_PM_Project_Base t1 "+
                        " left join t_project_pack_feed f "+
                        " on f.project_id = t1.project_id "+
                        " left join sy_user u "+
                        " on u.id = f.create_user "+
                        " where 1=1 "+
                        " and t1.project_id = (SELECT r.project_id FROM t_pm_project_rel r left join t_pm_project_base b on b.project_id = r.rel_project_id where b.PROJECT_ID=?)";
                List listParam = new ArrayList();
                listParam.add(itemSn);
                List<Map> itemList =modelService.listSql(sql, modelAction.getPage(), null, listParam, null,null);
                modelAction.setAjaxPage(modelAction.getPage());
                CommMethod.listToEscapeJs(itemList);modelAction.getAjaxPage().setDataList(itemList);
            }
        }


        return modelAction.AJAX;
    }

}

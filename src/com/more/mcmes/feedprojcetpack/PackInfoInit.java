package com.more.mcmes.feedprojcetpack;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

/**
 * -初始化数据
 */
public class PackInfoInit implements FuncService {

    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        HttpServletRequest req = modelAction.getRequest();
        String projectId = req.getParameter("projectId");
        String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));

        String reg = "ok";
        Map<String, String> resMap = new HashMap<>();

        //判断工单是否已包装
        String checkPackSql = "SELECT * FROM  T_PROJECT_PACK_FEED T  WHERE 1=1 AND  T.PROJECT_ID=?";
        List list1 = modelService.listDataSql(checkPackSql, new Object[]{projectId});

        if (list1.size() > 0) {
            reg = "N";
            resMap.put("res", reg);
            resMap.put("msg", "该工单【"+projectId+"】已包装，请勿重复包装");
            CommMethod.mapToEscapeJs(resMap);
            modelAction.setAjaxMap(resMap);
            return modelAction.AJAX;
        }


        //工单是否存在
//        String checksql = "SELECT * FROM  T_PM_PROJECT_BASE T  WHERE 1=1 AND (T.PROJECT_STATUS='4' or T.PROJECT_STATUS='3')  AND T.PROJECT_SORT = '2' AND T.PROJECT_ID=?  ";
        String checksql = "SELECT * FROM  T_PM_PROJECT_BASE T  WHERE 1=1 AND T.PROJECT_SORT = '2' AND T.PROJECT_ID=?  ";

        List list = modelService.listDataSql(checksql, new Object[]{projectId});

        String checksql2 = "SELECT * FROM T_PM_PROJECT_BASE T WHERE 1=1 AND T.PROJECT_SORT = '2' AND T.PROJECT_ID= ? ";
        List checksql2List = modelService.listDataSql(checksql2, new Object[]{projectId});

        if (list.size() <= 0) {
            if(checksql2List.size() <= 0){
                reg = "N";
                resMap.put("res", reg);
                resMap.put("msg", "该工单【"+projectId+"】不存在或状态错误不允许进行投料操作，请重新输入");
                CommMethod.mapToEscapeJs(resMap);
                modelAction.setAjaxMap(resMap);
                return modelAction.AJAX;
            }else{
                //判断工单是否已包装
                String checksql1 = "SELECT * FROM  T_PROJECT_PACK_FEED T  WHERE 1=1 AND  T.PROJECT_ID=?";
                list = modelService.listDataSql(checksql1, new Object[]{projectId});

                if (list.size() > 0) {
                    reg = "N";
                    resMap.put("res", reg);
                    resMap.put("msg", "该工单【"+projectId+"】已包装，请勿重复包装");
                    CommMethod.mapToEscapeJs(resMap);
                    modelAction.setAjaxMap(resMap);
                    return modelAction.AJAX;
                }else{
                    String prepareRes = "";
                    String relRes = "";
                    relRes = doRel(modelService, dataAuth, projectId, modelAction.getCurrUser().getId());
                    if (!"OK".equals(relRes)) {
                        reg = "N";
                        resMap.put("res", reg);
                        resMap.put("msg", "该工单【"+projectId+"】投料失败,快速通道关联失败");
                        CommMethod.mapToEscapeJs(resMap);
                        modelAction.setAjaxMap(resMap);
                        return BaseActionSupport.AJAX;
                    }

                    prepareRes = doPrepare(modelService, dataAuth, projectId, projectId);
                    if (!"OK".equals(prepareRes)) {
                        reg = "N";
                        resMap.put("res", reg);
                        resMap.put("msg", "该工单【"+projectId+"】投料失败,快速通道备料失败");
                        CommMethod.mapToEscapeJs(resMap);
                        modelAction.setAjaxMap(resMap);
                        return BaseActionSupport.AJAX;
                    }
                }
            }
        }

        //查询工单信息
        String psql = "SELECT T2.PROJECT_ID,T2.LOT_NUMBER,T2.PRODUCT_MATERIAL,T2.PRODUCT_NAME,T2.PRODUCT_COUNT,CASE WHEN T2.FINISH_COUNT > 0 THEN T2.FINISH_COUNT ELSE T2.PRODUCT_COUNT END AS FINISH_COUNT  FROM T_PM_PROJECT_BASE T2 where T2.PROJECT_id=?";
        Map map = modelService.queryForMap(psql, new Object[]{projectId});
        modelAction.setAjaxMap(map);
        //查询BOM初始化数据
        String sqlColCheck = "SELECT T1.CBD_ITEM_CODE, T3.STOCK_CODE,T3.SAP_COLOR_CODE , T1.WORK_SPACE "
                + "FROM T_PM_PROJECT_DETAIL T1 "
                + "LEFT JOIN T_PM_PROJECT_BASE T2 ON T1.PROJECT_ID = T2.PROJECT_ID  "
                + "LEFT JOIN T_CO_ITEM T3 ON T3.CI_ITEM_CODE = T1.CBD_ITEM_CODE  "
                + "WHERE 1=1 AND T2.PROJECT_ID = ?  ";
        List<Map> colList = modelService.listDataSql(sqlColCheck, new Object[]{projectId});
        String sql = "";
        List<Map> dataList = new ArrayList();
        Map map1 = null;
        for (Map m : colList) {
            Object itemCode = m.get("CBD_ITEM_CODE");
            Object stockCode = m.get("STOCK_CODE");
            Object colCode = m.get("SAP_COLOR_CODE");
            Object workSpace = m.get("WORK_SPACE");
            String sqlWhConfig = "SELECT * FROM T_SAP_WH_CONFIG T1 WHERE 1=1 AND  T1.WORK_SPACE=? ";
            List<Map> configList = modelService.listDataSql(sqlWhConfig, new Object[]{workSpace});
            if (configList.size() <= 0) {
                sql = "SELECT distinct T1.*,T3.CI_ITEM_NAME,T3.CI_ITEM_SPEC,T1.WORK_SPACE "
                        + "FROM T_PM_PROJECT_DETAIL T1 "
                        + "LEFT JOIN T_PM_PROJECT_BASE T2 ON T1.PROJECT_ID = T2.PROJECT_ID  "
                        + "LEFT JOIN T_CO_ITEM T3 ON T3.CI_ITEM_CODE = T1.CBD_ITEM_CODE  "
                        + "WHERE 1=1 AND T2.PROJECT_ID = ? AND T1.CBD_ITEM_CODE=?  ";
                map1 = modelService.queryForMap(sql, new Object[]{projectId, itemCode});
                map1.put("WARE_HOUSE", "0000");
                dataList.add(map1);
            } else {
                if (colCode != null) {
                    if (stockCode.equals(colCode)) {
                        sql = "SELECT distinct T1.*,T3.CI_ITEM_NAME,T3.CI_ITEM_SPEC,T4.WARE_HOUSE,T1.WORK_SPACE "
                                + "FROM T_PM_PROJECT_DETAIL T1 "
                                + "LEFT JOIN T_PM_PROJECT_BASE T2 ON T1.PROJECT_ID = T2.PROJECT_ID  "
                                + "LEFT JOIN T_CO_ITEM T3 ON T3.CI_ITEM_CODE = T1.CBD_ITEM_CODE  "
                                + "LEFT JOIN T_SAP_WH_CONFIG T4 ON T4.WORK_SPACE = T1.WORK_SPACE AND T4.WORK_CENTER = T2.PRODUCT_LINE "
                                + "WHERE 1=1 AND T4.IS_COLOR = '1' AND T1.WORK_SPACE=? AND T1.CBD_ITEM_CODE=? AND T2.PROJECT_ID = ?  ";
                        map1 = modelService.queryForMap(sql, new Object[]{workSpace, itemCode, projectId});
                        dataList.add(map1);
                    } else {
                        sql = "SELECT distinct T1.*,T3.CI_ITEM_NAME,T3.CI_ITEM_SPEC,T4.WARE_HOUSE,T1.WORK_SPACE "
                                + "FROM T_PM_PROJECT_DETAIL T1 "
                                + "LEFT JOIN T_PM_PROJECT_BASE T2 ON T1.PROJECT_ID = T2.PROJECT_ID  "
                                + "LEFT JOIN T_CO_ITEM T3 ON T3.CI_ITEM_CODE = T1.CBD_ITEM_CODE  "
                                + "LEFT JOIN T_SAP_WH_CONFIG T4 ON T4.WORK_SPACE = T1.WORK_SPACE  AND T4.WORK_CENTER = T2.PRODUCT_LINE "
                                + "WHERE 1=1 AND T4.IS_COLOR = '0' AND T1.WORK_SPACE=? AND T1.CBD_ITEM_CODE=? AND T2.PROJECT_ID = ?  ";
                        map1 = modelService.queryForMap(sql, new Object[]{workSpace, itemCode, projectId});
                        dataList.add(map1);
                    }
                } else {
                    sql = "SELECT distinct T1.*,T3.CI_ITEM_NAME,T3.CI_ITEM_SPEC,T4.WARE_HOUSE,T1.WORK_SPACE "
                            + "FROM T_PM_PROJECT_DETAIL T1 "
                            + "LEFT JOIN T_PM_PROJECT_BASE T2 ON T1.PROJECT_ID = T2.PROJECT_ID  "
                            + "LEFT JOIN T_CO_ITEM T3 ON T3.CI_ITEM_CODE = T1.CBD_ITEM_CODE  "
                            + "LEFT JOIN T_SAP_WH_CONFIG T4 ON T4.WORK_SPACE = T1.WORK_SPACE  AND T4.WORK_CENTER = T2.PRODUCT_LINE "
                            + "WHERE 1=1 AND T4.IS_COLOR = '1' AND T1.WORK_SPACE=? AND T1.CBD_ITEM_CODE=? AND T2.PROJECT_ID = ?  ";
                    map1 = modelService.queryForMap(sql, new Object[]{workSpace, itemCode, projectId});
                    dataList.add(map1);
                }
            }
        }

        modelAction.setAjaxString(reg);
        CommMethod.listToEscapeJs(dataList);
        modelAction.setAjaxList(dataList);
        return modelAction.AJAX;
    }

    /**
     * 调用工单关联存储过程
     *
     * @param modelService
     * @param dataAuth
     * @param workOrder
     * @param relWorkerOrder
     * @return
     */
    public String callProjectRel(ModelService modelService, String dataAuth, String workOrder, String relWorkerOrder, String userId) {
        ProFuncDto pf = new ProFuncDto();
        int[] inPlace = {1, 2, 3, 4};
        int[] outplace = {5};
        List<Object> list = new ArrayList<>();
        List<Object> outType = new ArrayList<Object>();
        list.add(dataAuth);
        list.add(workOrder);
        list.add(relWorkerOrder);
        list.add(userId);
        outType.add("String");
        pf.setClassName("P_LEO_REL_PROJECT_SN");
        pf.setInPlace(inPlace);
        pf.setOutPlace(outplace);
        pf.setTotalLen(list.size() + outType.size());
        pf.setValArgs(list);
        pf.setOutValType(outType);
        List<Object> relist = modelService.procComm(pf);
        String res = (String) relist.get(0);
        return res;
    }

    /**
     * 工单备料存储过程调用
     *
     * @param modelService
     * @param dataAuth
     * @param relWorkerOrder
     * @param userId
     * @return
     */
    public String callProjectPrepare(ModelService modelService, String dataAuth, String relWorkerOrder, String userId) {
        ProFuncDto pf = new ProFuncDto();
        int[] inPlace = {1, 2, 3};
        int[] outplace = {4};
        List<Object> list = new ArrayList<Object>();
        List<Object> outType = new ArrayList<Object>();
        list.add(dataAuth);
        list.add(relWorkerOrder);
        list.add(userId);
        outType.add("String");
        pf.setClassName("P_C_VOID_PREPARE_PROJECT_SN");
        pf.setInPlace(inPlace);
        pf.setOutPlace(outplace);
        pf.setTotalLen(list.size() + outType.size());
        pf.setValArgs(list);
        pf.setOutValType(outType);
        List<Object> relist = modelService.procComm(pf);
        String res = (String) relist.get(0);
        return res;
    }

    public String doRel(ModelService modelService, String dataAuth, String projectId, String userId) {
        String res = "";
        try {
            res = callProjectRel(modelService, dataAuth, projectId, projectId, userId);
            if (!"OK".equals(res)) {
                res = StringUtils.toString(res.split(":")[1]);
            }
        } catch (Exception e) {
            res = e.getMessage();
        }
        return res;
    }

    public String doPrepare(ModelService modelService, String dataAuth, String projectId, String userId) {
        String res = "";
        try {
            res = callProjectPrepare(modelService, dataAuth, projectId, userId);
            if (!"OK".equals(res)) {
                res = StringUtils.toString(res.split(":")[1]);
            }
        } catch (Exception e) {
            res = e.getMessage();
        }
        return res;
    }
}

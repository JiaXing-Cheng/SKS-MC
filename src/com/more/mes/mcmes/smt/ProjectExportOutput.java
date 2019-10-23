package com.more.mes.mcmes.smt;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.LinkedHashSet;

import javax.servlet.http.HttpServletRequest;
import com.more.mes.smt.stationitem.QueryTabMsg;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.morelean.aisino.basedata.ExcelOperator;

public class ProjectExportOutput implements FuncService{

    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        HttpServletRequest request = modelAction.getRequest();
        String itemSn = request.getParameter("itemSn");


        List<String> tableNameList = new ArrayList<String>();
        tableNameList.add("关联");
        tableNameList.add("备料");
        tableNameList.add("投料");
        tableNameList.add("包装");
        tableNameList.add("质检");

        Map<String, Map<String, String>> mHeadMap = GetTitleMap(tableNameList);
        Map<String, List<Map>> mTableMap = GetTableMap(modelService,tableNameList, itemSn);
        ExcelOperator eo = new ExcelOperator();
        try {
            eo.mHeadMap = mHeadMap;
            eo.downLoadExcel(modelAction.getResponse(), mTableMap,"工单号"+itemSn+"工单信息");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return modelAction.AJAX;
    }

    //设置表头中文描述
    @SuppressWarnings("unchecked")
    public Map<String, Map<String, String>> GetTitleMap(List<String> tableNameList) {
        Map<String, Map<String, String>> dataList = new HashMap<String, Map<String, String>>();
        for (String tableName : tableNameList) {
            if(tableName.equals("关联")) {
                HashMap mMap = new HashMap();
                mMap.put("PROJECT_ID", "工单号");
                mMap.put("REL_PROJECT_ID", "关联工单号");
                mMap.put("LOT_NUMBER", "生产批次");
                mMap.put("CUST_CODE", "客户");
                mMap.put("WORK_SPACE", "工厂");
                mMap.put("PROLEPSIS_START_DATE", "计划时间");
                mMap.put("EDIT_TIME", "入库时间");
                dataList.put(tableName, mMap);
            }
            if(tableName.equals("备料")) {
                HashMap mMap = new HashMap();
                mMap.put("PROJECT_ID", "工单号");
                mMap.put("ITEM_CODE", "物料信息");
                mMap.put("ITEM_NAME", "物料名称");
                mMap.put("PRODUCT_COUNT", "计划投入量");
                mMap.put("ITEM_UNIT", "单位");
                mMap.put("NAME", "作业人员");
                mMap.put("EDIT_TIME", "作业时间");
                dataList.put(tableName, mMap);
            }
            if(tableName.equals("投料")) {
                HashMap mMap = new HashMap();
                mMap.put("PROJECT_ID", "工单号");
                mMap.put("ITEM_CODE", "物料信息");
                mMap.put("ITEM_NAME", "物料名称");
                mMap.put("ITEM_STOCK", "存货码");
                mMap.put("ITEM_NUM", "实际投入量");
                mMap.put("ITEM_UNIT", "单位");
                mMap.put("PROCESS_ORDER", "投入顺序");
                mMap.put("NAME", "作业人员");
                mMap.put("CREATE_TIME", "作业时间");
                dataList.put(tableName, mMap);
            }
            if(tableName.equals("包装")) {
                HashMap mMap = new HashMap();
                mMap.put("PROJECT_ID", "工单号");
                mMap.put("ITEM_CODE", "物料信息");
                mMap.put("ITEM_MANE", "物料名称");
                mMap.put("ITEM_SPEC", "规格");
                mMap.put("PACK_NUM", "实际包装量");
                mMap.put("NAME", "作业人员");
                mMap.put("CREATE_TIME", "作业时间");
                dataList.put(tableName, mMap);
            }
            if(tableName.equals("质检")) {
                HashMap mMap = new HashMap();
                mMap.put("PROJECT_ID", "工单号");
                mMap.put("CHECK_STATUS", "质检状态");
                mMap.put("BAD_REASONS", "不良因素");
                mMap.put("QT_MON", "质检备注");
                mMap.put("NAME", "作业人员");
                mMap.put("CREATE_TIME", "作业时间");
                dataList.put(tableName, mMap);
            }
        }
        return dataList;
    }

    //获取数据
    public Map<String, List<Map>> GetTableMap(ModelService modelService,List<String> tableNameList, String itemSn) {
        Map<String, List<Map>> mMap = new HashMap<String, List<Map>>();
        List<Map> resList = new ArrayList<Map>();
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

        for (String tableName : tableNameList) {
            if(tableName.equals("关联")) {
                if(flag) {
                    String sql = "SELECT R.PROJECT_ID AS PROJECT_ID,R.REL_PROJECT_ID AS REL_PROJECT_ID,B.LOT_NUMBER,B1.CUST_CODE,B.WORK_SPACE,B.PROLEPSIS_START_DATE,P.EDIT_TIME  FROM T_PM_PROJECT_BASE B " +
                            " LEFT JOIN T_PM_PROJECT_REL R  " +
                            " ON B.PROJECT_ID = R.PROJECT_ID " +
                            " LEFT JOIN T_PM_PROJECT_BASE B1 " +
                            " ON B1.PROJECT_ID = R.PROJECT_ID " +
                            " LEFT JOIN T_PM_PROJECT_POST P " +
                            " ON P.PROJECT_ID = B.PROJECT_ID " +
                            " WHERE 1 =1  " +
                            " AND b.project_Id= ?";
                    resList =  modelService.listDataSql(sql, new Object[]{itemSn});
                    mMap.put(tableName, resList);
                }else {
                    String sql = "SELECT B.PROJECT_ID,R.PROJECT_ID AS REL_PROJECT_ID,B.LOT_NUMBER,B1.CUST_CODE,B.WORK_SPACE,B.PROLEPSIS_START_DATE,P.EDIT_TIME  FROM T_PM_PROJECT_BASE B "+
                            " LEFT JOIN T_PM_PROJECT_REL R  "+
                            " ON B.PROJECT_ID = R.REL_PROJECT_ID "+
                            " LEFT JOIN T_PM_PROJECT_BASE B1 "+
                            " ON B1.PROJECT_ID = R.PROJECT_ID "+
                            " LEFT JOIN T_PM_PROJECT_POST P "+
                            " ON P.PROJECT_ID = B.PROJECT_ID "+
                            " WHERE 1 =1  "+
                            " AND b.project_Id=?";
                    resList =  modelService.listDataSql(sql, new Object[]{itemSn});
                    mMap.put(tableName, resList);
                }

            }
            if(tableName.equals("备料")) {
                if(flag) {
                    String sql =  "SELECT T2.PROJECT_ID,T1.CBD_ITEM_CODE AS ITEM_CODE, T3.CI_ITEM_NAME AS ITEM_NAME,T2.PRODUCT_COUNT AS PRODUCT_COUNT, T1.CBD_UNITS    AS ITEM_UNIT," +
                            "                      U.NAME,T2.CHECK_MON AS EDIT_TIME " +
                            "                      FROM T_PM_PROJECT_DETAIL T1 " +
                            "                      LEFT JOIN T_PM_PROJECT_BASE T2 ON T1.PROJECT_ID = T2.PROJECT_ID   " +
                            "                      LEFT JOIN T_CO_ITEM T3 ON T3.CI_ITEM_CODE = T1.CBD_ITEM_CODE  " +
                            "                      LEFT JOIN SY_USER U ON U.ID = T2.CHECK_USER " +
                            "                      WHERE 1=1 AND T2.PROJECT_ID = ?";
                    resList =  modelService.listDataSql(sql, new Object[]{itemSn});
                    mMap.put(tableName, resList);
                }else {
                    String sql =  " SELECT A.PROJECT_ID,D.CI_ITEM_CODE AS ITEM_CODE, " +
                            "   D.CI_ITEM_NAME AS ITEM_NAME, " +
                            "   A.PRODUCT_COUNT  AS PRODUCT_COUNT, C.CBD_UNITS    AS ITEM_UNIT, " +
                            "   u.name, " +
                            "   A.CHECK_MON AS EDIT_TIME " +
                            "   FROM T_PM_PROJECT_BASE A " +
                            "   LEFT JOIN T_PM_PROJECT_DETAIL C " +
                            "   ON C.PROJECT_ID = A.PROJECT_ID " +
                            "   LEFT JOIN  sy_user u "+
                            "   on u.id = A.check_user "+
                            "   LEFT JOIN T_CO_ITEM D " +
                            "   ON C.CBD_ITEM_CODE = D.CI_ITEM_CODE " +
                            "   WHERE 1 = 1 " +
                            "   AND A.project_Id = ? " +
                            "   ORDER BY TO_NUMBER(C.WORKCENTER_NO) ASC";
                    resList =  modelService.listDataSql(sql, new Object[]{itemSn});
                    mMap.put(tableName, resList);
                }

            }
            if(tableName.equals("投料")) {
                if(flag) {
                    String sql =  " SELECT A.PROJECT_ID, D.CI_ITEM_CODE AS ITEM_CODE, " +
                            "       D.CI_ITEM_NAME AS ITEM_NAME, " +
                            "       D.STOCK_CODE AS ITEM_STOCK, " +
                            "       C.CBD_ITEM_NUM AS ITEM_NUM, " +
                            "       C.CBD_UNITS    AS ITEM_UNIT," +
                            "       C.WORKCENTER_NO AS PROCESS_ORDER, " +
                            "       u.name, " +
                            "       c.CREATE_TIME " +
                            "       FROM T_PM_PROJECT_BASE A " +
                            "       LEFT JOIN T_PM_PROJECT_DETAIL C " +
                            "       ON C.PROJECT_ID = A.PROJECT_ID " +
                            "       LEFT JOIN T_CO_ITEM D " +
                            "       ON C.CBD_ITEM_CODE = D.CI_ITEM_CODE " +
                            "       LEFT JOIN  sy_user u " +
                            "       on u.id = C.create_user" +
                            "       LEFT JOIN T_PM_PROJECT_REL R" +
                            "       ON R.REL_PROJECT_ID = A.PROJECT_ID" +
                            "       WHERE 1 = 1 " +
                            "       AND R.project_Id = ?";
                    resList =  modelService.listDataSql(sql, new Object[]{itemSn});
                    mMap.put(tableName, resList);
                }else {
                    String sql =  " SELECT A.PROJECT_ID, D.CI_ITEM_CODE AS ITEM_CODE, " +
                            "       D.CI_ITEM_NAME AS ITEM_NAME, " +
                            "       D.STOCK_CODE AS ITEM_STOCK, " +
                            "       C.CBD_ITEM_NUM AS ITEM_NUM, " +
                            "       C.CBD_UNITS    AS ITEM_UNIT," +
                            "       C.WORKCENTER_NO AS PROCESS_ORDER, " +
                            "   	u.name, " +
                            "       c.CREATE_TIME " +
                            "       FROM T_PM_PROJECT_BASE A " +
                            "       LEFT JOIN T_PM_PROJECT_DETAIL C " +
                            "       ON C.PROJECT_ID = A.PROJECT_ID " +
                            "       LEFT JOIN T_CO_ITEM D " +
                            "       ON C.CBD_ITEM_CODE = D.CI_ITEM_CODE " +
                            "       LEFT JOIN  sy_user u "+
                            "       on u.id = C.create_user "+
                            "       WHERE 1 = 1 " +
                            "       AND A.project_Id = ? " +
                            "       ORDER BY TO_NUMBER(C.WORKCENTER_NO) ASC";
                    resList =  modelService.listDataSql(sql, new Object[]{itemSn});
                    mMap.put(tableName, resList);
                }

            }
            if(tableName.equals("包装")) {
                if(flag) {
                    String sql =  " SELECT t1.project_id,f.item_code,f.item_mane,f.ITEM_SPEC,f.pack_num,u.name,f.create_time FROM T_PM_Project_Base t1 "+
                            " left join t_project_pack_feed f "+
                            " on f.project_id = t1.project_id "+
                            " left join sy_user u "+
                            " on u.id = f.create_user "+
                            " where 1=1 "+
                            " and t1.project_id = ?";
                    resList =  modelService.listDataSql(sql, new Object[]{itemSn});
                    mMap.put(tableName, resList);
                }else {
                    String sql =  " SELECT t1.project_id,f.item_code,f.item_mane,f.ITEM_SPEC,f.pack_num,u.name,f.create_time FROM T_PM_Project_Base t1 " +
                            "               left join t_project_pack_feed f " +
                            "               on f.project_id = t1.project_id" +
                            "               left join sy_user u " +
                            "               on u.id = f.create_user " +
                            "               LEFT JOIN T_PM_PROJECT_REL R" +
                            "               ON R.PROJECT_ID = T1.PROJECT_ID" +
                            "               where 1=1 " +
                            "               and R.REL_PROJECT_ID = ?";
                    resList =  modelService.listDataSql(sql, new Object[]{itemSn});
                    mMap.put(tableName, resList);
                }

            }
            if(tableName.equals("质检")) {
                if(flag) {
                    String sql =  " SELECT C.PROJECT_ID,C.CHECK_STATUS,C.BAD_REASONS,C.QT_MON,U.NAME,C.CREATE_TIME " +
                            "        FROM T_QM_PROJECT_CHECK C  " +
                            "        LEFT JOIN T_PM_PROJECT_REL R " +
                            "        ON R.REL_PROJECT_ID = C.PROJECT_ID " +
                            "        LEFT JOIN SY_USER U " +
                            "        ON U.ID = C.CREATE_USER " +
                            "        WHERE 1=1 AND R.PROJECT_ID=?";
                    resList =  modelService.listDataSql(sql, new Object[]{itemSn});
                    for(int i=0;i<resList.size();i++) {
                        if("0".equals(resList.get(i).get("CHECK_STATUS")) ) {
                            resList.get(i).replace("CHECK_STATUS", "合格" );
                        }else if("1".equals(resList.get(i).get("CHECK_STATUS"))) {
                            resList.get(i).replace("CHECK_STATUS", "不合格" );
                        }else {
                            resList.get(i).replace("CHECK_STATUS", "未质检" );
                        }

                        if("1".equals(resList.get(i).get("BAD_REASONS")) ) {
                            resList.get(i).replace("BAD_REASONS", "容器中状态外观" );
                        }else if("2".equals(resList.get(i).get("BAD_REASONS"))) {
                            resList.get(i).replace("BAD_REASONS", "固含量" );
                        }else if("3".equals(resList.get(i).get("BAD_REASONS"))) {
                            resList.get(i).replace("BAD_REASONS", "粘度" );
                        }else if("4".equals(resList.get(i).get("BAD_REASONS"))) {
                            resList.get(i).replace("BAD_REASONS", "比重" );
                        }else if("5".equals(resList.get(i).get("BAD_REASONS"))) {
                            resList.get(i).replace("BAD_REASONS", "细度" );
                        }else if("6".equals(resList.get(i).get("BAD_REASONS"))) {
                            resList.get(i).replace("BAD_REASONS", "对比率" );
                        }else if("7".equals(resList.get(i).get("BAD_REASONS"))) {
                            resList.get(i).replace("BAD_REASONS", "光泽" );
                        }else if("8".equals(resList.get(i).get("BAD_REASONS"))) {
                            resList.get(i).replace("BAD_REASONS", "板效" );
                        }else if("9".equals(resList.get(i).get("BAD_REASONS"))) {
                            resList.get(i).replace("BAD_REASONS", "色差" );
                        }else if("10".equals(resList.get(i).get("BAD_REASONS"))) {
                            resList.get(i).replace("BAD_REASONS", "有害物质" );
                        }else if("11".equals(resList.get(i).get("BAD_REASONS"))) {
                            resList.get(i).replace("BAD_REASONS", "型检项目" );
                        }else {
                            resList.get(i).replace("BAD_REASONS", "" );
                        }
                    }
                    mMap.put(tableName, resList);
                }else {
                    String sql =  " SELECT C.PROJECT_ID,C.CHECK_STATUS,C.BAD_REASONS,C.QT_MON,U.NAME,C.CREATE_TIME " +
                            "        FROM T_QM_PROJECT_CHECK C  " +
                            "        LEFT JOIN SY_USER U " +
                            "        ON U.ID = C.CREATE_USER " +
                            "        WHERE 1=1 AND C.PROJECT_ID=?";
                    resList =  modelService.listDataSql(sql, new Object[]{itemSn});
                    for(int i=0;i<resList.size();i++) {
                        if("0".equals(resList.get(i).get("CHECK_STATUS")) ) {
                            resList.get(i).replace("CHECK_STATUS", "合格" );
                        }else if("1".equals(resList.get(i).get("CHECK_STATUS"))) {
                            resList.get(i).replace("CHECK_STATUS", "不合格" );
                        }else {
                            resList.get(i).replace("CHECK_STATUS", "未质检" );
                        }

                        if("1".equals(resList.get(i).get("BAD_REASONS")) ) {
                            resList.get(i).replace("BAD_REASONS", "容器中状态外观" );
                        }else if("2".equals(resList.get(i).get("BAD_REASONS"))) {
                            resList.get(i).replace("BAD_REASONS", "固含量" );
                        }else if("3".equals(resList.get(i).get("BAD_REASONS"))) {
                            resList.get(i).replace("BAD_REASONS", "粘度" );
                        }else if("4".equals(resList.get(i).get("BAD_REASONS"))) {
                            resList.get(i).replace("BAD_REASONS", "比重" );
                        }else if("5".equals(resList.get(i).get("BAD_REASONS"))) {
                            resList.get(i).replace("BAD_REASONS", "细度" );
                        }else if("6".equals(resList.get(i).get("BAD_REASONS"))) {
                            resList.get(i).replace("BAD_REASONS", "对比率" );
                        }else if("7".equals(resList.get(i).get("BAD_REASONS"))) {
                            resList.get(i).replace("BAD_REASONS", "光泽" );
                        }else if("8".equals(resList.get(i).get("BAD_REASONS"))) {
                            resList.get(i).replace("BAD_REASONS", "板效" );
                        }else if("9".equals(resList.get(i).get("BAD_REASONS"))) {
                            resList.get(i).replace("BAD_REASONS", "色差" );
                        }else if("10".equals(resList.get(i).get("BAD_REASONS"))) {
                            resList.get(i).replace("BAD_REASONS", "有害物质" );
                        }else if("11".equals(resList.get(i).get("BAD_REASONS"))) {
                            resList.get(i).replace("BAD_REASONS", "型检项目" );
                        }else {
                            resList.get(i).replace("BAD_REASONS", "" );
                        }
                    }
                    mMap.put(tableName, resList);
                }

            }
        }
        return mMap;
    }

}


package com.morelean.mcmes.productReport;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.base.login.model.UserDto;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.auth.model.DataAuthDto;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;

import java.lang.reflect.Array;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class SelPersonProductImpl implements FuncService
{

	private final Log log = LogFactory.getLog(this.getClass());
	private  SelPersonProductImpl selPersonProductImpl;
	List<Map<String,String>> list = new ArrayList<Map<String,String>>();
	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		UserDto user = modelAction.getCurrUser();
		System.out.println("获取用户对象:"+user);

		Date date = new Date();

		//获取权限id,用户id,部门id
		List<DataAuthDto> daList = user.getDaList();
		DataAuthDto da=null;
		da = daList.get(2);
		String daStr = da.toString();
		String daAuId = daStr.substring(0, 32);
		System.out.println("daAuId:"+daAuId);
		String userId = daStr.substring(32, 64);
		System.out.println("userId:"+userId);
		String deptId = daStr.substring(64,96);
		System.out.println("deptId:"+deptId);

		List<Map<String,String>> avgFeed = selPerFedNum(modelService,date,date);
		System.out.println("perProFedList:"+avgFeed);

		//查询投料平均值(车间 岗位 时间)
		List<Map<String,String>> feedList =selFeedInfo(modelService,date,date);

		for(Map<String,String> personProductNums:avgFeed) {
			String jobName =personProductNums.get("JOB_NAME");
			System.out.println("jobName:"+jobName);
			Object avgNum = personProductNums.get("AVG_FEED_COUNT");
			String avgNumA = avgNum+"";
			System.out.println("avgNum:"+avgNum);

			for(Map<String,String> dataFeed:feedList) {
				String FEED_JOB = dataFeed.get("FEED_JOB");
				System.out.println("FEED_JOB:"+FEED_JOB);

				if(jobName.equals(FEED_JOB)) {

					dataFeed.put("AVG_FEED_COUNT", avgNumA);
				}
				list.add(dataFeed);
			}
			System.out.println("list 循环:"+list);
			System.out.println("personProductNums:"+personProductNums);
		}


		//加载页面时间
		for(Map<String,String> dataFeed:feedList) {
			String yearMonth = getYearMonth();
			dataFeed.put("FEED_TIME", yearMonth);
			list.add(dataFeed);

		}


		System.out.println("feedList:"+list);
		//查询包装数据
		List<Map<String,String>> packList =selPackInfo(modelService,date,date);
		System.out.println("查出来的packList:"+packList);
		//查询包装平均量selPerPakNum
		List<Map<String,String>> avgPak =selPerPakNum(modelService,date,date);
		System.out.println("avgPak:"+avgPak);
		for(Map<String,String> dataPak:avgPak) {
			String jobName =dataPak.get("JOB_NAME");
			System.out.println("jobName:"+jobName);
			Object avgNum = dataPak.get("AVG_PACK_COUNT");
			String avgNumA = avgNum+"";
			for(Map<String,String> selPak:packList) {
				String pakJob = selPak.get("JOB_NAME");
				System.out.println("pakJob:"+pakJob);
				if(jobName.equals(pakJob)) {
					selPak.put("AVG_PACK_COUNT", avgNumA);
				}
				list.add(selPak);
			}
		}
		System.out.println("listAddPAk:"+list);



		for(Map<String,String> dataPack:packList) {
			String yearMonth = getYearMonth();
			dataPack.put("PACK_TIME", yearMonth);
			list.add(dataPack);

		}
		System.out.println("feedList+packList:"+list);






		if (list.size() > 0) {
			CommMethod.listToEscapeJs(list);
			modelAction.setDataList(list);
			modelAction.setAjaxList(list);
		}

		return modelAction.ActionForwardExeid(modelAction.getExeid());

	}
	private List<Map<String,String>> selFeedInfo(){
		String feedSql = "";
		return null;
	}
	private List<Map<String,String>> selFeedInfo(ModelService modelService,Date timeFirst,Date timeLast){
		System.out.println("ttt");

		String feedSql ="select sum(t1.receive_count) AS FEED_COUNT,t3.project_sort as FEED_SORT,	" +
				"	t2.FEED_NAME,t2.FEED_DEPT,t4.JOB_NAME as FEED_JOB	"+
				"	from t_pm_project_feed_base t1	"+
				"	inner join (select a.id,a.name as FEED_NAME,b.name as FEED_DEPT from sy_user a inner join sy_dept b on a.dept_id=b.id) t2		"+
				"	on t1.create_user=t2.id 	"+
				"	inner join t_pm_project_base t3 on t1.project_id=t3.project_id 	"+
				"	left join (select B.JOB_NAME,A.USER_ID from SY_USER_JOB A inner join SY_JOB B on A.job_id = B.Id ) t4 on t1.create_user=t4.USER_ID	"+
				"	where 1=1 "	+
				"	and (t1.create_time between to_date(to_char(TRUNC(?, 'mm'),'yyyy-mm-dd') || '00:00:00','yyyy-mm-dd hh24:mi:ss')	"+
				"	and to_date(to_char(TRUNC(last_day(?)),'yyyy-mm-dd') || '23:59:59','yyyy-mm-dd hh24:mi:ss')) "+
				"	group by t2.FEED_NAME,t2.FEED_DEPT,t3.project_sort,t4.JOB_NAME";

		List feedList = modelService.listDataSql(feedSql,new Object[]{timeFirst,timeLast});
		return feedList;
	}

	private List<Map<String,String>> selPackInfo(ModelService modelService,Date timeFirst,Date timeLast){
		String packSql = "	select sum(t1.finish_count) AS PACK_COUNT,t2.PACK_NAME,t1.project_sort as PACK_SORT,t2.PACK_DEPT,t2.job_name as JOB_NAME 	"+
				"	from t_Pm_Project_Base t1	" +
				"	inner join (select a.id,a.name as PACK_NAME,b.name as PACK_DEPT ,c.job_name from sy_user a left join sy_dept b on a.dept_id=b.id	" +
				"	left join (select B.JOB_NAME,A.USER_ID from SY_USER_JOB A inner join SY_JOB B on A.job_id = B.Id) c  on a.id = c.user_id	" +
				"	) t2	"+
				"	on t1.edit_user=t2.id  " +
				"	and t1.project_status='5'	"+
				"	and (t1.edit_time between to_date(to_char(TRUNC(?, 'mm'),'yyyy-mm-dd') || '00:00:00','yyyy-mm-dd hh24:mi:ss')  " +
				"	and to_date(to_char(TRUNC(last_day(?)),'yyyy-mm-dd') || '23:59:59','yyyy-mm-dd hh24:mi:ss'))  " +
				"	group by t2.PACK_NAME,t2.PACK_DEPT,t1.project_sort,t2.job_name";

		List packList  = modelService.listDataSql(packSql,new Object[]{timeFirst,timeLast});

		return packList;
	}
	private List<Map<String,String>> selPerFedNum(ModelService modelService,Date timeFirst,Date timeLast){
		String productSql ="	select trunc((sum(t1.receive_count)/count(t1.create_user)) ,'2') as AVG_FEED_COUNT,t2.name,t3.JOB_NAME	"
				+"	from t_pm_project_feed_base t1	"
				+"	inner join sy_dept t2 on t1.dept_id = t2.id  "
				+"	inner join  (select B.JOB_NAME,A.USER_ID,B.id from SY_USER_JOB A  "
				+"	inner join SY_JOB B on A.job_id = B.Id) t3 on t1.create_user =  t3.user_id	"
				+"	where 1=1"
				+"	and (t1.edit_time between to_date(to_char(TRUNC(?, 'mm'),'yyyy-mm-dd') || '00:00:00','yyyy-mm-dd hh24:mi:ss')  "
				+"	and to_date(to_char(TRUNC(last_day(?)),'yyyy-mm-dd') || '23:59:59','yyyy-mm-dd hh24:mi:ss'))  "
				+"	group by t2.name,t3.JOB_NAME";
		List packList  = modelService.listDataSql(productSql,new Object[]{timeFirst,timeLast});
		return packList;
	}
	private List<Map<String,String>> selPerPakNum(ModelService modelService,Date timeFirst,Date timeLast){
		String perPakSql="	select trunc((sum(t1.finish_count))/(count(t1.edit_user)),'2') AS AVG_PACK_COUNT,t2.name,t1.project_sort as PACK_SORT,t3.job_name as JOB_NAME		"+
				"	from t_Pm_Project_Base t1	"	+
				"	inner join sy_dept t2 on t1.dept_id = t2.id	  "	+
				"	inner join  (select B.JOB_NAME,A.USER_ID,B.id from SY_USER_JOB A	"	+
				"	inner join SY_JOB B on A.job_id = B.Id) t3 on t1.edit_user =  t3.user_id	"	+
				"	where 1=1	"	+
				"	and (t1.edit_time between to_date(to_char(TRUNC(?, 'mm'),'yyyy-mm-dd') || '00:00:00','yyyy-mm-dd hh24:mi:ss')	"+
				"	and to_date(to_char(TRUNC(last_day(?)),'yyyy-mm-dd') || '23:59:59','yyyy-mm-dd hh24:mi:ss'))	"+
				"	group by t1.project_sort,t2.name,t3.JOB_NAME";
		List packList  = modelService.listDataSql(perPakSql,new Object[]{timeFirst,timeLast});
		return packList;
	}



	private List<Map<String,String>> selPackInfo(){
		String packSql = "";

		return null;
	}
	private List<Map<String,String>> selUserInfo(){
		String userSql="";
		return null;
	}







	//删除指定的字符
	private  String deleteString(String str, char delChar) {
		StringBuffer stringBuffer = new StringBuffer("");
		for (int i = 0; i < str.length(); i++) {
			if (str.charAt(i) != delChar) {
				stringBuffer.append(str.charAt(i));
			}
		}
		return stringBuffer.toString();
	}
	//获取时间年月日
	private String getYearMonth() {
		Calendar now = Calendar.getInstance();
		System.out.println("年: " + now.get(Calendar.YEAR));
		int year = now.get(Calendar.YEAR);
		int month = (now.get(Calendar.MONTH) + 1);
		String yearMonth = year+"年"+month+"月";
		System.out.println("月: " + (now.get(Calendar.MONTH) + 1) + "");
		return yearMonth;
	}

	//查询组织机构

	//截取字符串


}

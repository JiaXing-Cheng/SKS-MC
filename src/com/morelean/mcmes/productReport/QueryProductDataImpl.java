
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

/**
 *要根据对应的视图模型/基础信息：视图公用类的名称来替换继承类SuperServer
 *
 */
public class QueryProductDataImpl implements FuncService
{
	private final Log log = LogFactory.getLog(this.getClass());

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		List<Object> object = new ArrayList<Object>();
		List<Object> objectPack = new ArrayList<Object>();

		List<Object> objectAvgFed = new ArrayList<Object>();
		List<Object> objectAvgPak = new ArrayList<Object>();


		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		String timePeriod = "";
		String beginTime = request.getParameter("beginTime");
		System.out.println("beginTime:"+beginTime);
		String endTime = request.getParameter("endTime");
		System.out.println("endTime:"+endTime);


		String editAuth = request.getParameter("editAuth");
		System.out.println("editAuth:"+editAuth);
		String editUser = request.getParameter("editUser");
		System.out.println("editUser:"+editUser);
		String deptId = request.getParameter("deptId");
		System.out.println("deptId:"+deptId);
		String jobId = request.getParameter("jobId");
		System.out.println("jobId:"+jobId);

		String queryFeedSql="	select sum(t1.receive_count) AS FEED_COUNT,t3.project_sort as PROJECT_SORT,	"+
				"	t2.name as DEPT_NAME,t4.JOB_NAME as JOB_NAME,t5.name as USER_NAME	"+
				"	from t_pm_project_feed_base t1	"+
				"	inner join sy_dept t2 	 " +
				"	on t1.dept_id=t2.id	 "+
				"	inner join sy_user t5 on t1.create_user = t5.id	 "+
				"	inner join t_pm_project_base t3 on t1.project_id=t3.project_id	"+
				"	left join (select B.JOB_NAME,A.USER_ID,B.id from SY_USER_JOB A inner join SY_JOB B on A.job_id = B.Id ) t4  "+
				"	on t1.create_user=t4.USER_ID	"+
				"	where 1=1 ";

		String queryPackSql="select sum(t1.finish_count) AS PACK_COUNT,t1.PROJECT_SORT as PACK_SORT,t2.name as DEPT_NAME,t4.job_name as JOB_NAME,t5.name as USER_NAME	"
				+ "	from t_Pm_Project_Base t1	"
				+ "	inner join sy_dept t2     on t1.dept_id=t2.id	"
				+ "	inner join sy_user t5 on t1.edit_user = t5.id	"
				+ "	inner join t_pm_project_base t3 on t1.project_id=t3.project_id	"
				+ "	left join (select B.JOB_NAME,A.USER_ID,B.id from SY_USER_JOB A 	 "
				+ "	inner join SY_JOB B on A.job_id = B.Id ) t4	 "
				+ "	on t1.edit_user=t4.USER_ID	"
				+ "	where 1=1 and t1.project_status = '5'  "
				;


		String productSql ="	select trunc((sum(t1.receive_count)/count(t1.create_user)) ,'2') as AVG_FEED_COUNT,t2.name,t4.JOB_NAME	"
				+"	from t_pm_project_feed_base t1	"
				+"	inner join sy_dept t2 on t1.dept_id = t2.id  "
				+"	inner join  (select B.JOB_NAME,A.USER_ID,B.id from SY_USER_JOB A  "
				+"	inner join SY_JOB B on A.job_id = B.Id) t4 on t1.create_user =  t4.user_id	"
				+"	where 1=1	"
				;

		String perPakSql="	select trunc((sum(t1.finish_count))/(count(t1.edit_user)),'2') AS AVG_PACK_COUNT,t2.name,t1.project_sort as PACK_SORT,t4.job_name as JOB_NAME		"+
				"	from t_Pm_Project_Base t1	"	+
				"	inner join sy_dept t2 on t1.dept_id = t2.id	  "	+
				"	inner join  (select B.JOB_NAME,A.USER_ID,B.id from SY_USER_JOB A	"	+
				"	inner join SY_JOB B on A.job_id = B.Id) t4 on t1.edit_user =  t4.user_id	"+
				"	where 1=1 ";

		if(StringUtils.isNotBlank(editAuth)) {
			System.out.println("addAuthSql:"+editAuth);
			String addAuthSql = "	AND t2.id in (select c.id from sy_dept a	" +
					"	left join sy_dept b on a.id = b.up_id 	" +
					"	left join sy_dept c on b.id = c.up_id	" +
					"	where a.id=?	" +
					"	and b.id != '1')	";;
			queryFeedSql = queryFeedSql+addAuthSql;
			queryPackSql = queryPackSql+addAuthSql;
			productSql = productSql+addAuthSql;
			perPakSql = perPakSql+addAuthSql;
			objectPack.add(editAuth);
			object.add(editAuth);
			objectAvgFed.add(editAuth);
			objectAvgPak.add(editAuth);
		}

		if(StringUtils.isNotBlank(deptId)) {
			System.out.println("deptAddSql: "+deptId);
			String addDeptSql = "  AND t2.name=?   ";
			queryFeedSql= queryFeedSql+addDeptSql;
			queryPackSql = queryPackSql+addDeptSql;
			productSql = productSql+addDeptSql;
			perPakSql = perPakSql+addDeptSql;
			objectPack.add(deptId);
			object.add(deptId);
			objectAvgFed.add(deptId);
			objectAvgPak.add(deptId);
		}

		if(StringUtils.isNotBlank(editUser)) {

			System.out.println("editUser:"+editUser);
			String addEditUserSql = " AND t5.name =?	";
			queryFeedSql=queryFeedSql+addEditUserSql;
			queryPackSql=queryPackSql+addEditUserSql;
			object.add(editUser);
			objectPack.add(editUser);
		}
		if(StringUtils.isNotBlank(jobId)) {
			System.out.println("jobId");
			String addJobIdsql = "	AND t4.id =?	";
			queryFeedSql = queryFeedSql+addJobIdsql;
			queryPackSql = queryPackSql+addJobIdsql;
			productSql = productSql+addJobIdsql;
			perPakSql = perPakSql+addJobIdsql;
			object.add(jobId);
			objectPack.add(jobId);
			objectAvgFed.add(jobId);
			objectAvgPak.add(jobId);
		}



		if(StringUtils.isNotBlank(beginTime) && StringUtils.isNotBlank(endTime)) {
			System.out.println("beginTime&&endTime");
			System.out.println("beginTime:"+beginTime);
			System.out.println("endTime:"+endTime);
			timePeriod=beginTime+"~"+endTime;
			String addBeginEndTimeSql="	AND (t1.create_time between to_date(?,'yyyy-MM-dd HH24:mi:ss') "+
					"and to_date(?,'yyyy-MM-dd HH24:mi:ss'))	";
			String addBeginEndTimepaksql ="	AND (t1.edit_time between to_date(?,'yyyy-MM-dd HH24:mi:ss') "+
					"and to_date(?,'yyyy-MM-dd HH24:mi:ss'))	";
			object.add(beginTime);
			object.add(endTime);
			queryFeedSql=queryFeedSql + addBeginEndTimeSql;
			queryPackSql = queryPackSql + addBeginEndTimepaksql;
			productSql = productSql+addBeginEndTimepaksql;
			perPakSql = perPakSql+addBeginEndTimepaksql;


			objectPack.add(beginTime);
			objectPack.add(endTime);
			objectAvgFed.add(beginTime);
			objectAvgPak.add(beginTime);
			objectAvgFed.add(endTime);
			objectAvgPak.add(endTime);
		}
		if(StringUtils.isNotBlank(beginTime) && !StringUtils.isNotBlank(endTime)) {
			System.out.println("beginTime&& !endTime:");
			System.out.println("endTime:"+endTime);
			System.out.println("endTime:"+endTime);
			timePeriod = beginTime+"~";
			String addBeginEndsql = "	AND (t1.create_time >= to_date(?,'yyyy-MM-dd HH24:mi:ss'))  ";
			String addBeginEndPakSql = "	AND (t1.edit_time >= to_date(?,'yyyy-MM-dd HH24:mi:ss'))  ";

			queryFeedSql=queryFeedSql+addBeginEndsql;
			queryPackSql=queryPackSql+addBeginEndPakSql;
			productSql = productSql+addBeginEndsql;
			perPakSql = perPakSql+addBeginEndPakSql;

			objectAvgFed.add(beginTime);
			objectAvgPak.add(beginTime);
			object.add(beginTime);
			objectPack.add(beginTime);
		}
		if(StringUtils.isNotBlank(endTime) && !StringUtils.isNotBlank(beginTime)) {
			System.out.println("!endTime&&beginTime");
			System.out.println("endTime:"+endTime);
			timePeriod = "~"+endTime;
			String addEndTimesql = "	AND (t1.create_time <= to_date(?,'yyyy-MM-dd HH24:mi:ss'))  ";
			String addEndTimePaksql = "	AND (t1.edit_time <= to_date(?,'yyyy-MM-dd HH24:mi:ss'))  ";

			queryPackSql = queryPackSql + addEndTimePaksql;
			queryFeedSql=queryFeedSql+addEndTimesql;
			productSql = productSql+addEndTimesql;
			perPakSql = perPakSql+addEndTimePaksql;

			object.add(endTime);
			objectPack.add(endTime);
			objectAvgFed.add(endTime);
			objectAvgPak.add(endTime);
		}

		queryFeedSql=queryFeedSql+"	group by t2.name,t3.project_sort,t4.JOB_NAME,t5.name ";
		queryPackSql=queryPackSql+"	group by t2.name,t1.project_sort,t4.job_name,t5.name	";

		productSql = productSql + "	group by t2.name,t4.JOB_NAME	";
		perPakSql=perPakSql+"	group by t1.project_sort,t2.name,t4.JOB_NAME  ";


		System.out.println("queryFeedSql:"+queryFeedSql);
		System.out.println("queryPackSql:"+queryPackSql);
		System.out.println("productSql:"+productSql);
		System.out.println("perPakSql:"+perPakSql);

		Object[] objectFeedArray = (Object[])object.toArray(new Object[object.size()]);
		Object[] objectPackArray = (Object[])objectPack.toArray(new Object[objectPack.size()]);

		Object[] objectAvgFedArray = (Object[])objectAvgFed.toArray(new Object[objectAvgFed.size()]);
		Object[] objectAvgPakArray = (Object[])objectAvgPak.toArray(new Object[objectAvgPak.size()]);

		for(Object obj:objectFeedArray) {
			System.out.println("obj:"+obj);
		}

		//调用查询
		List<Map<String,String>> feedList =modelService.listDataSql(queryFeedSql,objectFeedArray);
		System.out.println("feedList: " +feedList);

		List<Map<String,String>> packList =modelService.listDataSql(queryPackSql,objectPackArray);
		System.out.println("packList: " +packList);

		List<Map<String,String>> feedAvgList =modelService.listDataSql(productSql,objectAvgFedArray);
		System.out.println("feedAvgList: " +feedAvgList);

		List<Map<String,String>> packAvgList =modelService.listDataSql(perPakSql,objectAvgPakArray);
		System.out.println("packAvgList: " +packAvgList);



		//
		for(Map<String,String> personProductNums:feedAvgList) {
			String jobName =personProductNums.get("JOB_NAME");
			System.out.println("jobName:"+jobName);
			Object avgNum = personProductNums.get("AVG_FEED_COUNT");
			String avgNumA = avgNum+"";
			System.out.println("avgNum:"+avgNum);

			for(Map<String,String> dataFeed:feedList) {
				String FEED_JOB = dataFeed.get("JOB_NAME");
				System.out.println("FEED_JOB:"+FEED_JOB);
				if(jobName.equals(FEED_JOB)) {
					dataFeed.put("AVG_FEED_COUNT", avgNumA);
				}
				list.add(dataFeed);
			}
		}

		//
		for(Map<String,String> dataPak:packAvgList) {
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

		System.out.println("LIST:"+list);

		for(Map<String,String> dataFeed:feedList) {

			dataFeed.put("WORK_TIME", timePeriod);
			list.add(dataFeed);

		}

		for(Map<String,String> dataPack:packList) {
			dataPack.put("WORK_TIME", timePeriod);
			list.add(dataPack);

		}



		if (list.size() > 0) {
			CommMethod.listToEscapeJs(list);
			modelAction.setDataList(list);
			modelAction.setAjaxList(list);
		}

		return modelAction.AJAX;

	}


	//

	//根据包装单
	private List<Map<String,String>> queryPackData(String beginTime,String endTime){

		return null;
	}
	//根据制造单
	private List<Map<String,String>> queryFeedData(String beginTime,String endTime){

		return null;
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



}

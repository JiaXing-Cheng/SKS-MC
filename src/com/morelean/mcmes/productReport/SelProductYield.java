
package com.morelean.mcmes.productReport;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.common.method.Constants;
public class SelProductYield implements FuncService
{
	/**
	 *	1:这个类跟自定义视图类的区别是这个方法是嵌入在页面或数据显示之前的一段代码，原有的数据及逻辑流程正常执行，不能改变跳转页面.
	 *	 要根据  private String viewShowScenc;// 视图显示场景(0:视图页面解析，1同步查询列表数据显示子表单，2异步列表数据显示，3异步列表数据显示子表单...)
	 *	 这个变量(modelAction.getViewShowScenc())来区分当前是在哪个视图显示场景下。
	 * 常量类中可以取到判断的值Constants.VIEW_SHOW_SCENC_0：
	 */
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();

		//查询关联数据
		List<Map<String,Object>> listForBack = new ArrayList<Map<String,Object>>();


		String sqlForYield ="	select d.vat_no,c.finish_count as pack_count,c.project_id,d.rel_project_id,"
				+ "	e.ci_item_spec,e.ci_item_name,e.ci_item_code,d.receive_count	"
				+ "	from t_pm_project_base c "
				+ "	inner join (select f.receive_count,d.project_id,d.rel_project_id,f.vat_no	"
				+ "	from t_pm_project_feed_base f inner join	"
				+ "	(select b.project_id,b.rel_project_id  from t_pm_project_base a  inner join	"
				+ "	t_pm_project_rel b on a.project_id=b.rel_project_id) d  on f.project_id = d.rel_project_id) d on c.project_id=d.project_id	"
				+ "	inner join T_CO_ITEM e on c.product_material=e.ci_item_code	"
				+ "	where 1=1	"
				+ "	and c.project_sort='2'	"
				+ "	and c.project_status='5' ";


		List<Map<String, Object>> list = modelService.listDataSql(sqlForYield);
		System.out.println("list:"+list);
		for(Map<String, Object> dataMap:list) {
			Object packWeight="";
			Object	productYield="";
			Object receiveCount = dataMap.get("receive_count");
			System.out.println("receiveCount:"+receiveCount);
			Object projectId = dataMap.get("project_id");
			System.out.println("projectId:"+projectId);

			Object itemSpec = dataMap.get("ci_item_spec");
//22KG/桶
			String itSp = itemSpec.toString();
//	        	格式
			String regEx = "[^0-9]";
			Pattern p = Pattern.compile(regEx);
			Matcher m = p.matcher(itSp);
			String itemArr = m.replaceAll(" ").trim();
			System.out.println("itemArr:"+itemArr);

			System.out.println("itSp:"+itSp);
			System.out.println("itemSpec:"+itemSpec);

			Object packCount = dataMap.get("pack_count");
			System.out.println("packCount:"+packCount);

			Object productName = dataMap.get("ci_item_name");
			System.out.println("productName:"+productName);

			Object productMaterial = dataMap.get("ci_item_code");
			System.out.println("productMaterial:"+productMaterial);

			Object vatNo = dataMap.get("vat_no");
			System.out.println("vatNo:"+vatNo);

			double itemNums = Double.parseDouble(itemArr==null?"":itemArr.toString());
			double feedNUms = Double.parseDouble(receiveCount==null?"":receiveCount.toString());
			double packNums = Double.parseDouble(packCount==null?"":packCount.toString());
			packWeight = itemNums*packNums;
			System.out.println("packWeight:"+packWeight);
			productYield = (itemNums*packNums)/feedNUms;
			System.out.println("productYield:"+productYield);
			dataMap.put("packWeight", packWeight);
			dataMap.put("productYield", productYield);

			dataMap.put("itemSpec", itemSpec);
			dataMap.put("receiveCount", receiveCount);
			dataMap.put("projectId", projectId);
			dataMap.put("packCount", packCount);

			dataMap.put("productName", productName);
			dataMap.put("productMaterial", receiveCount);
			dataMap.put("vatNo", vatNo);
			listForBack.add(dataMap);
		}


		System.out.println("listForBack:"+listForBack);

		if (listForBack.size() > 0) {
			CommMethod.listToEscapeJs(listForBack);
			modelAction.setDataList(listForBack);
			modelAction.setAjaxList(listForBack);
		}

		//return modelAction.ActionForwardExeid();
		return modelAction.ActionForwardExeid(modelAction.getExeid());
	}
}

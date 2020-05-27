package com.asiainfo.cmc.controller.provinceKpi;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.asiainfo.cmc.authority.pojo.User;
import com.asiainfo.cmc.common.ResultMap;
import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.controller.provinceKpi.businessIncome.businessIncomeController;
import com.asiainfo.cmc.enties.ZdKpiCfgAdjust;
import com.asiainfo.cmc.enties.ZdKpiCfgAdjustLog;
import com.asiainfo.cmc.service.ZdKpiCfgAdjustService;
import com.asiainfo.cmc.utils.PageInfo;

@Controller
@RequiresPermissions("provinceKpi:*")
@RequestMapping(value = "/provinceKpi")
public class ProvinceKpiController {

	private static final Logger logger = LoggerFactory.getLogger(businessIncomeController.class);
	
	@Resource
	private ZdKpiCfgAdjustService zdKpiCfgAdjustService;
	
	@DS("dataSource")@RequestMapping(value = "/dialog/adjust_dialog")
	public ModelAndView getCostDialog(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView("/dialog/adjust_dialog");
		return modelAndView;
	}
	
	
	@DS("dataSource")@RequestMapping(value = "/getColumns", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ResultMap getColumns(@RequestBody Map<String,Object> param) {
		
		//结果集
		ResultMap data =ResultMap.defaultResultMap(); //new HashMap<String,Object>();
		//kpiName 
		List<String> fieldIDs = new ArrayList<String>();
		//kpiID
		List<String> fieldNames = new ArrayList<String>();
		//value 字段对应的值
		List<String> values = new ArrayList<String>();
		//要调整的配置信息
		List<ZdKpiCfgAdjust> adjusts = zdKpiCfgAdjustService.getDataByKpiName(param);
			for (ZdKpiCfgAdjust zdKpiCfgAdjust : adjusts) {
				fieldNames.add(zdKpiCfgAdjust.getFieldName());
				fieldIDs.add(zdKpiCfgAdjust.getFieldID());
			}
		
		//查询的调整前的值  存入map
		Map<String, String> provinceAdjustMap = new HashMap<String, String>();
		String tableName = adjusts.get(0).getTableName();
		param.put("tableName", tableName);
		//要查询的字段  拼字符串
		StringBuffer columns = new StringBuffer();
		columns.append(fieldIDs.get(0));
		for (int i=1;i<fieldIDs.size();i++) {
			columns.append(","+fieldIDs.get(i));
		}
		
		param.put("columns", columns.toString());

		Map<String,String> provinceAdjustField = zdKpiCfgAdjustService.getDataByParam(param);
	/*	try {
			//对象变集合map
			provinceAdjustMap = BeanUtils.describe(provinceAdjustField);

		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		}*/
		
		//取对应字段的value
		for (int i = 0; i < fieldIDs.size(); i++) {
			values.add(String.valueOf(provinceAdjustField.get(fieldIDs.get(i))));
		}
		data.put("fieldNames", fieldNames);
		data.put("fieldIDs", fieldIDs);
		data.put("values", values);
		data.put("size", fieldIDs.size());
		
		return data;
	}
	
	//处理调整数据
	@DS("dataSource")@RequestMapping(value = "/submitAdjust", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ResultMap submitAdjust(@RequestBody Map<String,Object> param) {
		 
		try{
		//账期	KPI-KEY	KPI名称	字段ID	字段名称	调整前值	调整值	调整后值	调整时间	账号ID	调整人名称	备注
		//结果集
				ResultMap data =ResultMap.defaultResultMap(); //new HashMap<String,Object>();
				//kpiName 
				List<String> kpiNames = new ArrayList<String>();
				//kpiID
				List<String> kpiIDs = new ArrayList<String>();
				//fieldID
				List<String> fieldIDs = new ArrayList<String>();
				//fieldName
				List<String> fieldNames = new ArrayList<String>();

				//调整时间
				Date date = new Date();
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd HH:mm:ss");
				String tz_time = sdf.format(date);

				//调整人信息
				User user = (User) SecurityUtils.getSubject().getPrincipal();
				String userID=user.getUsername();//账号
				String userName=user.getNickname();//名称
				//要调整的配置信息
				param.put("month", param.get("zq_yf"));
				param.put("flag", param.get("kpiName"));
				List<ZdKpiCfgAdjust> adjusts = zdKpiCfgAdjustService.getDataByKpiName(param);
					for (ZdKpiCfgAdjust zdKpiCfgAdjust : adjusts) {
						fieldNames.add(zdKpiCfgAdjust.getFieldName());
						fieldIDs.add(zdKpiCfgAdjust.getFieldID());
						kpiNames.add(zdKpiCfgAdjust.getKpiName());
						kpiIDs.add(zdKpiCfgAdjust.getKpiID());
					}
					
				String tableName = adjusts.get(0).getTableName();
				param.put("tableName", tableName);
					
				//调整日志	
					List<ZdKpiCfgAdjustLog> adjustLogs= new ArrayList<ZdKpiCfgAdjustLog>();
					List<ZdKpiCfgAdjustLog> mbzLogs= new ArrayList<ZdKpiCfgAdjustLog>();
				//通过字段id 判断是否有调整  并将调整的数据存起来
					for (int i = 0; i < fieldIDs.size(); i++ ) {
						//调整值
						Float tzz=Float.parseFloat((String)param.get(fieldIDs.get(i)+"_tzz"));
						//是否调整
						if(tzz!=0){
							ZdKpiCfgAdjustLog adjustLog = new ZdKpiCfgAdjustLog();
								//保存调整过的数据
							adjustLog.setMonth((String)param.get("zq_yf"));
							adjustLog.setKpiID(kpiIDs.get(i));
							adjustLog.setKpiName(kpiNames.get(i));
							adjustLog.setFieldID(fieldIDs.get(i));
							adjustLog.setFieldName(fieldNames.get(i));
							adjustLog.setTzq((String)param.get(fieldIDs.get(i)));
							adjustLog.setTzz((String)param.get(fieldIDs.get(i)+"_tzz"));
							adjustLog.setTzh((String)param.get(fieldIDs.get(i)+"_tzh"));
							adjustLog.setTz_time(tz_time);
							adjustLog.setUserID(userID);
							adjustLog.setUserName(userName);
							adjustLog.setBz((String)param.get(fieldIDs.get(i)+"_bz"));
							adjustLogs.add(adjustLog);	
								if(fieldIDs.get(i).indexOf("mbz")!=-1 || fieldIDs.get(i).indexOf("mbcs")!=-1){
								//保存调整过的目标值 目标次数 的数据
									mbzLogs.add(adjustLog);
								}
						}
					}
					
					if(adjustLogs.size()>0){
						for (ZdKpiCfgAdjustLog adjustLog : adjustLogs) {
							param.put("field", adjustLog.getFieldID());
							param.put("value", adjustLog.getTzh());
							//调整数据
							zdKpiCfgAdjustService.updateAdjust(param);
						}
						//记录日志
						param.put("adjustLogs", adjustLogs);
						zdKpiCfgAdjustService.insertLog(param);
					}
					
					
					if(mbzLogs.size()>0){
						for (ZdKpiCfgAdjustLog adjustLog : mbzLogs) {
							param.put("field", adjustLog.getFieldID());
							param.put("value", adjustLog.getTzh());
							//调整数据
							zdKpiCfgAdjustService.updateAdjustMbz(param);
						}
						
					}
					
			data.put("month", param.get("zq_yf"));
			
		}catch(Exception e){
			//System.out.println("===================="+e.getMessage()+"===============================");
			e.printStackTrace();
			
		}	
		return null;
		
	}
	
	@DS("dataSource")@RequestMapping(value = "/dialog/adjustLog_dialog")
	public ModelAndView adjustLog_dialog(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView("/dialog/adjustLog_dialog");
		return modelAndView;
	}
	
	
	//查调整日志数据
		@DS("dataSource")@RequestMapping(value = "/adjust_log", method = {RequestMethod.GET,RequestMethod.POST})
		@ResponseBody
		public PageInfo getAdjustLogTable(@RequestBody Map<String,Object> params) {
			
			Integer page = Integer.parseInt(params.get("page").toString());
			Integer pageSize = Integer.parseInt((String) params.get("pageSize").toString());
			Integer pageNo= (page-1)*pageSize;
			params.put("pageNo", pageNo);
			params.put("pageSize", pageSize);
			List<ZdKpiCfgAdjustLog> list = zdKpiCfgAdjustService.getAdjustLogTable(params);
			Integer totalCount = zdKpiCfgAdjustService.getTotalByParam(params);
			
			int totalPage = (totalCount+ pageSize-1) / pageSize;
			PageInfo<ZdKpiCfgAdjustLog> pageInfo = new PageInfo<ZdKpiCfgAdjustLog>();
			pageInfo.setPage(page);
			pageInfo.setPageSize(pageSize);
			pageInfo.setTotalPages(totalPage);
			pageInfo.setTotalCount(totalCount);
			pageInfo.setList(list);
			return pageInfo;
		}
		
		//指标下的所有字段名称
				@DS("dataSource")@RequestMapping(value = "/getFieldNames", method = {RequestMethod.GET,RequestMethod.POST})
				@ResponseBody
				public List<String> getFieldNames(@RequestBody Map<String,Object> params) {
					List<String> fieldNames = zdKpiCfgAdjustService.getFieldNames(params);
					return fieldNames;
		}
		
}



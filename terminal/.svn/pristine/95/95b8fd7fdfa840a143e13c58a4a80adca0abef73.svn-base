package com.asiainfo.cmc.controller.provinceKpi.assetsTurnoverRatio;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.ThreeMonthStockRatio;
import com.asiainfo.cmc.service.impl.ThreeMonthStockRatioService;
import com.asiainfo.cmc.utils.PageInfo;

@Controller
@RequestMapping(value = "/assetsTurnoverRate/threeMonthStockRatio")
public class threeMonthStockRatioController {
	private static final Logger logger = LoggerFactory.getLogger(threeMonthStockRatioController.class);
	@Resource
	private ThreeMonthStockRatioService threeMonthStockRatioService;

	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);
		return "assetsTurnoverRatio/threemonth_stock_ratio";
	}

	@DS("dataSource")@RequestMapping(value = "/list")
	@ResponseBody
	public PageInfo list(@RequestBody Map<String,Object> params) {
//		Map<String,Object> data = new HashMap<String,Object>();
		Integer page = (Integer) params.get("page");
		Integer pageSize = (Integer) params.get("pageSize");
		String startMonth = (String) params.get("startMonth");
		String endMonth = (String) params.get("endMonth");
		List<ThreeMonthStockRatio> list = threeMonthStockRatioService.selectByParameter(startMonth,endMonth,page,pageSize);
		 updateData(  list,  startMonth,  endMonth);
		 list = threeMonthStockRatioService.selectByParameter(startMonth,endMonth,page,pageSize);
		Integer totalCount = threeMonthStockRatioService.getTotalByParameter(startMonth,endMonth,page,pageSize);
		int totalPage = (totalCount+ pageSize-1) / pageSize;
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPage(page);
		pageInfo.setPageSize(pageSize);
		pageInfo.setTotalPages(totalPage);
		pageInfo.setTotalCount(totalCount);
		pageInfo.setList(list);
		return pageInfo;
	}

	@DS("dataSource")@RequestMapping(value = "/updateByTargetVal")
	@ResponseBody
	public Map<String, Object> update(@RequestBody Map<String,Object> params) {
		Map<String,Object> result = new HashMap<String,Object>();
		try {
			String startMonth = (String) params.get("startMonth");
			String endMonth = (String) params.get("endMonth");
			String mkhjx = (String) params.get("mkhjx");
		    StringBuffer  mkhjx_param = new StringBuffer();
			String[] mkhjxArray = mkhjx.split(",");
			for(String str :mkhjxArray) {
				mkhjx_param.append("'");
				mkhjx_param.append(str);
				mkhjx_param.append("',");
			}
			String mkhjx_in = mkhjx_param.substring(0, mkhjx_param.length()-1);
			Integer id = (Integer) params.get("id");
			threeMonthStockRatioService.updateByTargetVal(startMonth,endMonth,mkhjx,id);
			threeMonthStockRatioService.callTHREE_MONTH_STOCK_RATIO(endMonth, mkhjx_in);
			result.put("code",0);
		}catch (Exception e){
			e.printStackTrace();
			result.put("code",1);
		}
		return result;
	}

	@DS("dataSource")@RequestMapping(value = "/getKeyData")
	@ResponseBody
	public Map<String,Object> getKeyData() {
		Map<String,Object> ketDatas = threeMonthStockRatioService.getKeyData();
		return ketDatas;
	}

	@DS("dataSource")@RequestMapping(value = "/getLastData")
	@ResponseBody
	public ThreeMonthStockRatio getLastData(@RequestBody Map<String,Object> params) {
		String endMonth = (String) params.get("endMonth");
		ThreeMonthStockRatio ThreeMonthStockRatio = threeMonthStockRatioService.getLastData(endMonth).get(0);
		return ThreeMonthStockRatio;
	}
	@DS("dataSource")@RequestMapping(value = "/querySelect2")
	@ResponseBody
	public  List<Map<String,String>>  querySelect2() {
		 List<Map<String,String>> resultList = new ArrayList<Map<String,String>>();
		 resultList = threeMonthStockRatioService.queryBrandMdlDesc();
	/*	  Map<String,String> result = new HashMap<String,String>();
		  result.put("value", "value");
		  result.put("text", "text ");
		  Map<String,String> result1 = new HashMap<String,String>();
		  result1.put("value", "value1");
		  result1.put("text", "text1");
		  Map<String,String> result2 = new HashMap<String,String>();
		  result2.put("value", "value2");
		  result2.put("text", "text2");
		  resultList.add(result);
		  resultList.add(result1);
		  resultList.add(result2);*/
		return resultList;
	}
	@DS("dataSource")@RequestMapping(value = "/queryModel")
	@ResponseBody
	public  List<Map<String,String>>  queryModel(HttpServletRequest request) {
		 String brand_id=request.getParameter("brand_id");
		 String[] brandIdArray = brand_id.split(",");
		 List<Map<String,String>> resultList = new ArrayList<Map<String,String>>();
		 resultList = threeMonthStockRatioService.queryModelDesc(brandIdArray);
		return resultList;
	}
	@DS("dataSource")@RequestMapping(value = "/queryConfigureDesc")
	@ResponseBody
	public  List<Map<String,String>>  queryConfigureDesc(HttpServletRequest request) {
		String brand_id=request.getParameter("brand_id");
		 String mobile_type=request.getParameter("mobile_type");
		 String[] brandIdArray = brand_id.split(",");
		 String[] mobileTypeArray = mobile_type.split(",");
		 List<Map<String,String>> resultList = new ArrayList<Map<String,String>>();
		 Map<String,Object> params = new HashMap<String,Object>();
		 params.put("brandIdArray", brandIdArray);
		 params.put("mobileTypeArray", mobileTypeArray);
		 resultList = threeMonthStockRatioService.queryConfigureDesc(params);
		return resultList;
	}
	@DS("dataSource")@RequestMapping(value = "/updateMaterialId")
	@ResponseBody
	public  Map<String,String>  updateMaterialId(HttpServletRequest request) {
		 Map<String,String> resultMap = new HashMap<String, String>();
		try {
			 String brand_id=request.getParameter("brand_id");
			 String mobile_type=request.getParameter("mobile_type");
			 String configure_id=request.getParameter("configure_id");
			 String month=request.getParameter("month");
			 String[] brandIdArray = brand_id.split(",");
			 String[] mobileTypeArray = mobile_type.split(",");
			 String[] configureIdArray = null;
			 if(configure_id!=null && !"".equals(configure_id)) {
				configureIdArray = configure_id.split(",");
			 }
			 Map<String,Object> params = new HashMap<String,Object>();
			 params.put("brandIdArray", brandIdArray);
			 params.put("mobileTypeArray", mobileTypeArray);
			 params.put("configureIdArray", configureIdArray);
			 params.put("month", month);
			 threeMonthStockRatioService.updateMaterialIdAndDesc(params);
			 resultMap.put("message", "success");
			 
		}catch (Exception e) {
			e.printStackTrace();
			 resultMap.put("message", "fail");
		}
		
		return resultMap;
	}
	
//	@DS("dataSource")@RequestMapping(value = "/getFormat")
//	@ResponseBody
//	public Map<String,Object> getFormat(Integer id) {
//		Map<String,Object> ketDatas = new HashMap<String,Object>();
//		ThreeMonthStockRatio ThreeMonthStockRatio = threeMonthStockRatioService.selectByPrimaryKey(id);
//		Float sjjd = ThreeMonthStockRatio.getSjjd();
//		Float f;
//		if(sjjd >= 0){
//			f = 100f;
//		}else {
//			f = (1 + sjjd) * 100;
//		}
//
//		StringBuffer stringBuffer = new StringBuffer();
//		if(ThreeMonthStockRatio != null){
//			stringBuffer.append("<small>当前进度:" + f + "%</small>");
//			stringBuffer.append("<div class=\"progress progress-mini\">");
//			stringBuffer.append("  <div style=\"width: " + f + "%;\" class=\"progress-bar\"></div>");
//			stringBuffer.append("</div>");
//			stringBuffer.append("");
//			stringBuffer.append("");
//			stringBuffer.append("");
//			stringBuffer.append("");
//		}
//		ketDatas.put("formatStr",stringBuffer.toString());
//		return ketDatas;
//	}

	@DS("dataSource")@RequestMapping(value = "/getWcqkzbs")
	@ResponseBody
	public Map<String,Object> getWcqkzbs(@RequestBody Map<String,Object> params) {
		Integer id = (Integer) params.get("id");
		ThreeMonthStockRatio ThreeMonthStockRatio = threeMonthStockRatioService.selectByPrimaryKey(id);
		String currentMonth = ThreeMonthStockRatio.getMonth();
		String teampMonth = currentMonth + "01";
		String currentMonthWcqkzb = ThreeMonthStockRatio.getKhknld90zb();
		String currentMonthWcqkzb2 = ThreeMonthStockRatio.getKhknld180zb();
		String currentMonthWcqkzb3 = ThreeMonthStockRatio.getKhknld360zb();
		Integer lastMonthWcqkzb = threeMonthStockRatioService.getLastMonthWcqkzb(teampMonth);
		Integer lastMonthWcqkzb2 = threeMonthStockRatioService.getLastMonthWcqkzb2(teampMonth);
		Integer lastMonthWcqkzb3 = threeMonthStockRatioService.getLastMonthWcqkzb3(teampMonth);
		if(lastMonthWcqkzb == null){
			lastMonthWcqkzb = 0;
		}
		if(lastMonthWcqkzb2 == null){
			lastMonthWcqkzb2 = 0;
		}
		if(lastMonthWcqkzb3 == null){
			lastMonthWcqkzb3 = 0;
		}
		Integer lastYearWcqkzb = threeMonthStockRatioService.getLastYearWcqkzb(teampMonth);
		Integer lastYearWcqkzb2 = threeMonthStockRatioService.getLastYearWcqkzb2(teampMonth);
		Integer lastYearWcqkzb3 = threeMonthStockRatioService.getLastYearWcqkzb3(teampMonth);
		if(currentMonthWcqkzb == null){
			currentMonthWcqkzb =  "0";
		}
		if(currentMonthWcqkzb2 == null){
			currentMonthWcqkzb2 =  "0";
		}
		if(currentMonthWcqkzb3 == null){
			currentMonthWcqkzb3 = "0";
		}
		
		if(lastYearWcqkzb == null){
			lastYearWcqkzb = 0;
		}
		if(lastYearWcqkzb2 == null){
			lastYearWcqkzb2 = 0;
		}
		if(lastYearWcqkzb3 == null){
			lastYearWcqkzb3 = 0;
		}
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("yf", currentMonth);
		result.put("currentMonthWcqkzb",Double.valueOf(currentMonthWcqkzb )* 100);
		result.put("currentMonthWcqkzb2",Double.valueOf(currentMonthWcqkzb2) * 100);
		result.put("currentMonthWcqkzb3",Double.valueOf(currentMonthWcqkzb3) * 100);
		result.put("lastMonthWcqkzb",lastMonthWcqkzb * 100);
		result.put("lastMonthWcqkzb2",lastMonthWcqkzb2 * 100);
		result.put("lastMonthWcqkzb3",lastMonthWcqkzb3 * 100);
		result.put("lastYearWcqkzb",lastYearWcqkzb * 100);
		result.put("lastYearWcqkzb2",lastYearWcqkzb2 * 100);
		result.put("lastYearWcqkzb3",lastYearWcqkzb3 * 100);
		return result;
	}
	private void updateData(List<ThreeMonthStockRatio> list,String startMonth,String endMonth) {
		  for(ThreeMonthStockRatio threeMonthStockRatio:list) {
				endMonth = String.valueOf(threeMonthStockRatio.getMonth());//(String) params.get("startMonth");
		 
				  endMonth =  threeMonthStockRatio.getMonth();
				String mkhjx = threeMonthStockRatio.getMkhjx();
			    StringBuffer  mkhjx_param = new StringBuffer();
			    if(mkhjx!=null && "".equals(mkhjx)) {
			    	String[] mkhjxArray =  mkhjx.split(",");
					for(String str :mkhjxArray) {
						mkhjx_param.append("'");
						mkhjx_param.append(str);
						mkhjx_param.append("',");
					}
			    }else {
			    	mkhjx_param.append("'',");
			    }
				
				String mkhjx_in = mkhjx_param.substring(0, mkhjx_param.length()-1);
				Integer id = threeMonthStockRatio.getId();
				threeMonthStockRatioService.updateByTargetVal(startMonth,endMonth,mkhjx,id);
				threeMonthStockRatioService.callTHREE_MONTH_STOCK_RATIO(endMonth, mkhjx_in);
		  }
		
	}
	//三个月以上存货占比算出一个累计值，
		@DS("dataSource")@RequestMapping(value = "/overview",method=RequestMethod.POST)
		@ResponseBody
		public  Map<String,Object>  overview(@RequestBody Map<String,Object> params) {
			Map<String,Object> result=new HashMap<String,Object>();
			ThreeMonthStockRatio threeMSR = threeMonthStockRatioService.overview(params);
			// khknld90zb  khknld180zb  khknld360zb  
			result.put("khknld90zb", threeMSR.getKhknld90zb());
			result.put("khknld180zb", threeMSR.getKhknld180zb());
			result.put("khknld360zb", threeMSR.getKhknld360zb());
			return result;
		}
	
}

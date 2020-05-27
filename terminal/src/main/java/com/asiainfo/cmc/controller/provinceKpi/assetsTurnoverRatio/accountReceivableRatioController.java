package com.asiainfo.cmc.controller.provinceKpi.assetsTurnoverRatio;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.AccountsReceivableRatio;
import com.asiainfo.cmc.service.impl.AccountsReceivableRatioService;
import com.asiainfo.cmc.utils.PageInfo;

@Controller
@RequestMapping(value = "/assetsTurnoverRate/accountReceivableRatio")
public class accountReceivableRatioController {
	private static final Logger logger = LoggerFactory.getLogger(accountReceivableRatioController.class);
	@Resource
	private AccountsReceivableRatioService accountsReceivableRatioService;

	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);
		return "assetsTurnoverRatio/accounts_receivable_ratio";
	}

	@DS("dataSource")@RequestMapping(value = "/list")
	@ResponseBody
	public PageInfo list(@RequestBody Map<String,Object> params) {
//		Map<String,Object> data = new HashMap<String,Object>();
		Integer page = (Integer) params.get("page");
		Integer pageSize = (Integer) params.get("pageSize");
		String startMonth = (String) params.get("startMonth");
		String endMonth = (String) params.get("endMonth");
		List<AccountsReceivableRatio> list = accountsReceivableRatioService.selectByParameter(startMonth,endMonth,page,pageSize);
		Integer totalCount = accountsReceivableRatioService.getTotalByParameter(startMonth,endMonth,page,pageSize);
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
			String sgtzx = (String) params.get("sgtzx");
			String mbcs = (String) params.get("mbcs");
			accountsReceivableRatioService.updateByTargetVal(startMonth,endMonth,sgtzx,mbcs);
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
		Map<String,Object> ketDatas = accountsReceivableRatioService.getKeyData();
		return ketDatas;
	}

	@DS("dataSource")@RequestMapping(value = "/getLastData")
	@ResponseBody
	public AccountsReceivableRatio getLastData(@RequestBody Map<String,Object> params) {
		String endMonth = (String) params.get("endMonth");
		List<AccountsReceivableRatio> accountsReceivableRatios = accountsReceivableRatioService.getLastData(endMonth);
		if(accountsReceivableRatios != null && accountsReceivableRatios.size() > 0){
			AccountsReceivableRatio ThreeMonthStockRatio = accountsReceivableRatios.get(0);
			return ThreeMonthStockRatio;
		}
		return null;

	}

//	@DS("dataSource")@RequestMapping(value = "/getFormat")
//	@ResponseBody
//	public Map<String,Object> getFormat(Integer id) {
//		Map<String,Object> ketDatas = new HashMap<String,Object>();
//		ThreeMonthStockRatio ThreeMonthStockRatio = accountsReceivableRatioService.selectByPrimaryKey(id);
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
		AccountsReceivableRatio ThreeMonthStockRatio = accountsReceivableRatioService.selectByPrimaryKey(id);
		String currentMonth = ThreeMonthStockRatio.getMonth();
		String teampMonth = currentMonth + "01";
		String currentMonthWcqkzb = ThreeMonthStockRatio.getYszkzb90();
		String currentMonthWcqkzb2 = ThreeMonthStockRatio.getYszkzb180();
		String lastMonthWcqkzb = accountsReceivableRatioService.getLastMonthWcqkzb(teampMonth);
		String lastMonthWcqkzb2 = accountsReceivableRatioService.getLastMonthWcqkzb2(teampMonth);
		if(lastMonthWcqkzb == null){
			lastMonthWcqkzb = "0";
		}
		if(lastMonthWcqkzb2 == null){
			lastMonthWcqkzb2 = "0";
		}
		String lastYearWcqkzb = accountsReceivableRatioService.getLastYearWcqkzb(teampMonth);
		String lastYearWcqkzb2 = accountsReceivableRatioService.getLastYearWcqkzb2(teampMonth);
		if(lastYearWcqkzb == null){
			lastYearWcqkzb = "0";
		}
		if(lastYearWcqkzb2 == null){
			lastYearWcqkzb2 = "0";
		}
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("yf", currentMonth);
		result.put("currentMonthWcqkzb",Double.valueOf(currentMonthWcqkzb) * 100);
		result.put("currentMonthWcqkzb2",Double.valueOf(currentMonthWcqkzb2) * 100);
		result.put("lastMonthWcqkzb",Double.valueOf(lastMonthWcqkzb) * 100);
		result.put("lastMonthWcqkzb2",Double.valueOf(lastMonthWcqkzb2 )* 100);
		result.put("lastYearWcqkzb",Double.valueOf(lastYearWcqkzb) * 100);
		result.put("lastYearWcqkzb2",Double.valueOf(lastYearWcqkzb2) * 100);
		return result;
	}
	private void updateData(List<AccountsReceivableRatio> list,String startMonth,String endMonth) {
		  for(AccountsReceivableRatio accountsReceivableRatio:list) {
				endMonth = String.valueOf(accountsReceivableRatio.getMonth());//(String) params.get("startMonth");
			 
				//String sgtzx = accountsReceivableRatio.gets//(String) params.get("sgtzx");
				//String mbcs = (String) params.get("mbcs");
				//accountsReceivableRatioService.updateByTargetVal(startMonth,endMonth,sgtzx,mbcs);
		  }
		
	}
	

	@DS("dataSource")@RequestMapping(value = "/overview")
	@ResponseBody
	public Map<String,Object> overview(@RequestBody Map<String,Object> params) {
		Map<String,Object> result=new HashMap<String,Object>();
		AccountsReceivableRatio arr=accountsReceivableRatioService.overview(params);
		//yszkzb90 yszkzb180
		result.put("yszkzb180", arr.getYszkzb180());
		result.put("yszkzb90", arr.getYszkzb90());
		return result;
	}
}

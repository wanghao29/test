package com.asiainfo.cmc.controller.provinceKpi.assetsTurnoverRatio;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.IncomePhoneBrand;
import com.asiainfo.cmc.enties.StockTurnoverRatio;
import com.asiainfo.cmc.service.impl.StockTurnoverService;
import com.asiainfo.cmc.utils.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Controller
@RequestMapping(value = "/assetsTurnoverRate/stockTurnoverRatio")
public class stockTurnoverRatioController {
	private static final Logger logger = LoggerFactory.getLogger(stockTurnoverRatioController.class);
	@Resource
	private StockTurnoverService stockTurnoverService;

	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);
		return "assetsTurnoverRatio/stock_turnover_ratio";
	}

	@DS("dataSource")@RequestMapping(value = "/list")
	@ResponseBody
	public PageInfo list(@RequestBody Map<String,Object> params) {
//		Map<String,Object> data = new HashMap<String,Object>();
		Integer page = (Integer) params.get("page");
		Integer pageSize = (Integer) params.get("pageSize");
		String startMonth = (String) params.get("startMonth");
		String endMonth = (String) params.get("endMonth");
		List<StockTurnoverRatio> list = stockTurnoverService.selectByParameter(startMonth,endMonth,page,pageSize);
		updateData(  list,  startMonth,  endMonth);
		list = stockTurnoverService.selectByParameter(startMonth,endMonth,page,pageSize);
		Integer totalCount = stockTurnoverService.getTotalByParameter(startMonth,endMonth,page,pageSize);
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
			String mbz = (String) params.get("mbz");
			stockTurnoverService.updateByTargetVal(endMonth,sgtzx,mbz);
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
		Map<String,Object> ketDatas = stockTurnoverService.getKeyData();
		return ketDatas;
	}

	@DS("dataSource")@RequestMapping(value = "/getLastData")
	@ResponseBody
	public StockTurnoverRatio getLastData(@RequestBody Map<String,Object> params) {
		String endMonth=(String) params.get("endMonth");
		StockTurnoverRatio StockTurnoverRatio = stockTurnoverService.getLastData(endMonth).get(0);
		return StockTurnoverRatio;
	}

//	@DS("dataSource")@RequestMapping(value = "/getFormat")
//	@ResponseBody
//	public Map<String,Object> getFormat(Integer id) {
//		Map<String,Object> ketDatas = new HashMap<String,Object>();
//		StockTurnoverRatio StockTurnoverRatio = stockTurnoverService.selectByPrimaryKey(id);
//		Float sjjd = StockTurnoverRatio.getSjjd();
//		Float f;
//		if(sjjd >= 0){
//			f = 100f;
//		}else {
//			f = (1 + sjjd) * 100;
//		}
//
//		StringBuffer stringBuffer = new StringBuffer();
//		if(StockTurnoverRatio != null){
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
		StockTurnoverRatio StockTurnoverRatio = stockTurnoverService.selectByPrimaryKey(id);
		String currentMonth = StockTurnoverRatio.getMonth();
		String teampMonth = currentMonth + "01";
		String currentMonthWcqkzb = StockTurnoverRatio.getLjchzzl();
		if(currentMonthWcqkzb==null){
			currentMonthWcqkzb="0";
		}
		String lastMonthWcqkzb = stockTurnoverService.getLastMonthWcqkzb(teampMonth);
		if(lastMonthWcqkzb == null){
			lastMonthWcqkzb = "0";
		}
		String lastYearWcqkzb = stockTurnoverService.getLastYearWcqkzb(teampMonth);
		if(lastYearWcqkzb == null){
			lastYearWcqkzb = "0";
		}
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("yf", currentMonth);
		result.put("currentMonthWcqkzb",Double.valueOf(currentMonthWcqkzb)  );
		result.put("lastMonthWcqkzb",Double.valueOf(lastMonthWcqkzb) );
		result.put("lastYearWcqkzb",Double.valueOf(lastYearWcqkzb ) );
		return result;
	}
	
	private void updateData(List<StockTurnoverRatio> list,String startMonth,String endMonth) {
		  for(StockTurnoverRatio stockTurnoverRatio:list) {
			     Map<String,Object> params = new HashMap<String,Object>();
				String sgtzx =String.valueOf(stockTurnoverRatio.getSgtzx());
				String mbz = String.valueOf(stockTurnoverRatio.getMbz());
				endMonth = stockTurnoverRatio.getMonth();
				stockTurnoverService.updateByTargetVal(endMonth,sgtzx,mbz);	
		  }
		
	}
	
	@DS("dataSource")@RequestMapping(value = "/overview")
	@ResponseBody
	public String overview(@RequestBody Map<String,Object> params) {
		String endMonth=(String) params.get("stopMonth");
		StockTurnoverRatio StockTurnoverRatio = stockTurnoverService.getLastData(endMonth).get(0);
		 String ljchzzl = StockTurnoverRatio.getLjchzzl();
		return ljchzzl;
	}
	
}

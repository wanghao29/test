package com.asiainfo.cmc.controller.provinceKpi.totalprofit;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.FeeProgressBalance;
import com.asiainfo.cmc.enties.GrossProfitRatio;
import com.asiainfo.cmc.service.impl.GrossProfitRatioService;
import com.asiainfo.cmc.utils.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Controller
@RequestMapping(value = "/totalProfit/grossProfitRatio")
public class grossProfitRatioController {
	private static final Logger logger = LoggerFactory.getLogger(grossProfitRatioController.class);
	@Resource
	private GrossProfitRatioService GrossProfitRatioService;

	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);
		return "totalprofit/gross_profit_ratio";
	}

	@DS("dataSource")@RequestMapping(value = "/dialog/getDialog")
	public ModelAndView getDialog(String limit) {
		ModelAndView modelAndView = new ModelAndView("/dialog/repayment_accuracy_forecast_dialog");
		return modelAndView;
	}

	@DS("dataSource")@RequestMapping(value = "/addAndEdit")
	@ResponseBody
	public Map<String, Object> addAndEdit(GrossProfitRatio GrossProfitRatio){
		Map<String,Object> result = new HashMap<String,Object>();
		try {
			Integer id = GrossProfitRatio.getId();
			if(id == null){
				GrossProfitRatioService.insert(GrossProfitRatio);
			}else {
				GrossProfitRatioService.updateByPrimaryKey(GrossProfitRatio);
			}
			result.put("code",0);
		}catch (Exception e){
			e.printStackTrace();
			result.put("code",1);
		}
		return result;
	}

	@DS("dataSource")@RequestMapping(value = "/updateBySgtzxm")
	@ResponseBody
	public Map<String, Object> updateByReceivePayment(@RequestBody GrossProfitRatio grossProfitRatio){
		Map<String,Object> result = new HashMap<String,Object>();
		try {
			GrossProfitRatioService.updateByPrimaryKeySelective(grossProfitRatio);
			result.put("code",0);
		}catch (Exception e){
			e.printStackTrace();
			result.put("code",1);
		}
		return result;
	}

	@DS("dataSource")@RequestMapping(value = "/list")
	@ResponseBody
	public PageInfo list(@RequestBody Map<String,Object> params) {
//		Map<String,Object> data = new HashMap<String,Object>();
		Integer page = (Integer) params.get("page");
		Integer pageSize = (Integer) params.get("pageSize");
		String startMonth = (String) params.get("startMonth");
		String endMonth = (String) params.get("endMonth");
		List<GrossProfitRatio> list = GrossProfitRatioService.selectByParameter(startMonth,endMonth,page,pageSize);
		updateData(  list);
		list = GrossProfitRatioService.selectByParameter(startMonth,endMonth,page,pageSize);
		Integer totalCount = GrossProfitRatioService.getTotalByParameter(startMonth,endMonth,page,pageSize);
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
			GrossProfitRatioService.updateByTargetVal(startMonth,endMonth,sgtzx,mbcs);
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
		Map<String,Object> ketDatas = GrossProfitRatioService.getKeyData();
		return ketDatas;
	}

	@DS("dataSource")@RequestMapping(value = "/getLastData")
	@ResponseBody
	public GrossProfitRatio getLastData(@RequestBody Map<String,Object> params) {
		String endMonth = (String) params.get("endMonth");
		List<GrossProfitRatio> grossProfitRatios = GrossProfitRatioService.getLastData(endMonth);
		if(grossProfitRatios != null && grossProfitRatios.size() > 0){
			GrossProfitRatio GrossProfitRatio = grossProfitRatios.get(0);
			return GrossProfitRatio;
		}
		return null;
	}

//	@DS("dataSource")@RequestMapping(value = "/getFormat")
//	@ResponseBody
//	public Map<String,Object> getFormat(Integer id) {
//		Map<String,Object> ketDatas = new HashMap<String,Object>();
//		GrossProfitRatio GrossProfitRatio = GrossProfitRatioService.selectByPrimaryKey(id);
//		Float sjjd = GrossProfitRatio.getSjjd();
//		Float f;
//		if(sjjd >= 0){
//			f = 100f;
//		}else {
//			f = (1 + sjjd) * 100;
//		}
//
//		StringBuffer stringBuffer = new StringBuffer();
//		if(GrossProfitRatio != null){
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
		GrossProfitRatio GrossProfitRatio = GrossProfitRatioService.selectByPrimaryKey(id);
		String currentMonth = GrossProfitRatio.getMonth();
		String teampMonth = currentMonth + "01";
		String currentMonthWcqkzb = GrossProfitRatio.getZzczzhmlb();
		String currentMonthWcqkzb2 = GrossProfitRatio.getZhmlb12();
		String lastMonthWcqkzb = GrossProfitRatioService.getLastMonthWcqkzb(teampMonth);
		String lastMonthWcqkzb2 = GrossProfitRatioService.getLastMonthWcqkzb2(teampMonth);
		if(lastMonthWcqkzb == null){
			lastMonthWcqkzb = "0";
		}
		if(lastMonthWcqkzb2 == null){
			lastMonthWcqkzb2 = "0";
		}
		String lastYearWcqkzb = GrossProfitRatioService.getLastYearWcqkzb(teampMonth);
		String lastYearWcqkzb2 = GrossProfitRatioService.getLastYearWcqkzb2(teampMonth);
		if(lastYearWcqkzb == null){
			lastYearWcqkzb ="0";
		}
		if(lastYearWcqkzb2 == null){
			lastYearWcqkzb2 = "0";
		}
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("currentMonthWcqkzb",String.valueOf(Double.valueOf(currentMonthWcqkzb )* 100));
		result.put("currentMonthWcqkzb2",String.valueOf(Double.valueOf(currentMonthWcqkzb2 )* 100));
		result.put("lastMonthWcqkzb",String.valueOf(Double.valueOf(lastMonthWcqkzb) * 100));
		result.put("lastMonthWcqkzb2",String.valueOf(Double.valueOf(lastMonthWcqkzb2) * 100));
		result.put("lastYearWcqkzb",String.valueOf(Double.valueOf(lastYearWcqkzb) * 100));
		result.put("lastYearWcqkzb2",String.valueOf(Double.valueOf(lastYearWcqkzb2) * 100));
		return result;
	}
	
	private void updateData(List<GrossProfitRatio> list) {
		  for(GrossProfitRatio grossProfitRatio:list) {
		 
			  GrossProfitRatioService.updateByPrimaryKeySelective(grossProfitRatio);
		  }
		
	}
	
}

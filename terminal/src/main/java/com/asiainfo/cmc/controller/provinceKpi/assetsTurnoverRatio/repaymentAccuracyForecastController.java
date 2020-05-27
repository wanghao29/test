package com.asiainfo.cmc.controller.provinceKpi.assetsTurnoverRatio;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.AccountReceivableTurnoverRatio;
import com.asiainfo.cmc.enties.RepaymentAccuracyForecast;
import com.asiainfo.cmc.enties.StockTurnoverRatio;
import com.asiainfo.cmc.service.impl.RepaymentAccuracyForecastService;
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
@RequestMapping(value = "/assetsTurnoverRate/repaymentAccuracyForecast")
public class repaymentAccuracyForecastController {
	private static final Logger logger = LoggerFactory.getLogger(repaymentAccuracyForecastController.class);
	@Resource
	private RepaymentAccuracyForecastService repaymentAccuracyForecastService;

	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);
		return "assetsTurnoverRatio/repayment_accuracy_farecast";
	}

	@DS("dataSource")@RequestMapping(value = "/dialog/getDialog")
	public ModelAndView getDialog(String limit) {
		ModelAndView modelAndView = new ModelAndView("/dialog/repayment_accuracy_forecast_dialog");
		return modelAndView;
	}

	@DS("dataSource")@RequestMapping(value = "/addAndEdit")
	@ResponseBody
	public Map<String, Object> addAndEdit(RepaymentAccuracyForecast repaymentAccuracyForecast){
		Map<String,Object> result = new HashMap<String,Object>();
		try {
			String  month = repaymentAccuracyForecast.getMonth();
			RepaymentAccuracyForecast check = repaymentAccuracyForecastService.selectByMonth(month);
			if(check == null){
				repaymentAccuracyForecastService.insert(repaymentAccuracyForecast);
			}else {
				repaymentAccuracyForecastService.updateByReceivePayment(repaymentAccuracyForecast);
			}
			result.put("code",0);
		}catch (Exception e){
			e.printStackTrace();
			result.put("code",1);
		}
		return result;
	}

	@DS("dataSource")@RequestMapping(value = "/updateByReceivePayment")
	@ResponseBody
	public Map<String, Object> updateByReceivePayment(@RequestBody RepaymentAccuracyForecast repaymentAccuracyForecast){
		Map<String,Object> result = new HashMap<String,Object>();
		try {
			repaymentAccuracyForecastService.updateByReceivePayment(repaymentAccuracyForecast);
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
		List<RepaymentAccuracyForecast> list = repaymentAccuracyForecastService.selectByParameter(startMonth,endMonth,page,pageSize);
		updateData(list);
		list = repaymentAccuracyForecastService.selectByParameter(startMonth,endMonth,page,pageSize);
		Integer totalCount = repaymentAccuracyForecastService.getTotalByParameter(startMonth,endMonth,page,pageSize);
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
			repaymentAccuracyForecastService.updateByTargetVal(startMonth,endMonth,sgtzx,mbcs);
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
		Map<String,Object> ketDatas = repaymentAccuracyForecastService.getKeyData();
		return ketDatas;
	}

	@DS("dataSource")@RequestMapping(value = "/getLastData")
	@ResponseBody
	public RepaymentAccuracyForecast getLastData(@RequestBody Map<String,Object> params) {
		String endMonth=(String) params.get("endMonth");
		RepaymentAccuracyForecast RepaymentAccuracyForecast = repaymentAccuracyForecastService.getLastData(endMonth).get(0);
		return RepaymentAccuracyForecast;
	}

//	@DS("dataSource")@RequestMapping(value = "/getFormat")
//	@ResponseBody
//	public Map<String,Object> getFormat(Integer id) {
//		Map<String,Object> ketDatas = new HashMap<String,Object>();
//		RepaymentAccuracyForecast RepaymentAccuracyForecast = repaymentAccuracyForecastService.selectByPrimaryKey(id);
//		Float sjjd = RepaymentAccuracyForecast.getSjjd();
//		Float f;
//		if(sjjd >= 0){
//			f = 100f;
//		}else {
//			f = (1 + sjjd) * 100;
//		}
//
//		StringBuffer stringBuffer = new StringBuffer();
//		if(RepaymentAccuracyForecast != null){
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
		RepaymentAccuracyForecast RepaymentAccuracyForecast = repaymentAccuracyForecastService.selectByPrimaryKey(id);
		String currentMonth = RepaymentAccuracyForecast.getMonth();
		String teampMonth = currentMonth + "01";
		Float currentMonthWcqkzb = RepaymentAccuracyForecast.getHkyczqd();
		Float lastMonthWcqkzb = repaymentAccuracyForecastService.getLastMonthWcqkzb(teampMonth);
		if(lastMonthWcqkzb == null){
			lastMonthWcqkzb = 0f;
		}
		Float lastYearWcqkzb = repaymentAccuracyForecastService.getLastYearWcqkzb(teampMonth);
		if(lastYearWcqkzb == null){
			lastYearWcqkzb = 0f;
		}
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("yf", currentMonth);
		result.put("currentMonthWcqkzb",currentMonthWcqkzb * 100);
		result.put("lastMonthWcqkzb",lastMonthWcqkzb * 100);
		result.put("lastYearWcqkzb",lastYearWcqkzb * 100);
		return result;
	}
	
	private void updateData(List<RepaymentAccuracyForecast> list) {
		  for(RepaymentAccuracyForecast repaymentAccuracyForecast:list) {
			  repaymentAccuracyForecastService.updateByReceivePayment(repaymentAccuracyForecast);
			//     endMonth = (String) params.get("endMonth");
			//	String sgtzx = repaymentAccuracyForecast.get(String) params.get("sgtzx");
				//String mbcs = (String) params.get("mbcs");
				//repaymentAccuracyForecastService.updateByTargetVal(startMonth,endMonth,sgtzx,mbcs);
				
		  }
		
	}
	
	@DS("dataSource")@RequestMapping(value = "/overview")
	@ResponseBody
	public String overview(@RequestBody Map<String,Object> params) {
		String endMonth=(String) params.get("stopMonth");
		RepaymentAccuracyForecast repaymentAccuracyForecast = repaymentAccuracyForecastService.getLastData(endMonth).get(0);
		return repaymentAccuracyForecast.getHkyczqd().toString();
	}
	
}

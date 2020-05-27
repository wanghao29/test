package com.asiainfo.cmc.controller.gfKpi.overview;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asiainfo.cmc.aopLog.SystemControllerLog;
import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.gfKpi.overview.Overview;
import com.asiainfo.cmc.service.gfKpi.operateEfficiency.IReceivableTurnoverRateService;
import com.asiainfo.cmc.service.gfKpi.overview.IOverviewService;
import com.asiainfo.cmc.utils.RequestUtils;



@Controller
@RequestMapping("/gfOverview")
public class overviewController {

	private static final Logger logger = LoggerFactory.getLogger(overviewController.class);
	/**
	 * 首页
	 * @param locale
	 * @param model
	 * @return
	 */
	@Resource
	private IOverviewService overviewService;
	
	@Resource
	private IReceivableTurnoverRateService receivableTurnoverRateService;
	
	
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/queryData", method = RequestMethod.POST)
	@SystemControllerLog(description = "查询经分监控总览数据",module="经分监控",business="经分监控",type="QUERY")  
	public Map<String,List<Overview>>   queryData(HttpServletRequest request, Locale locale, Model model,String special,String billcyc) {
		logger.info("customerChannel  {}.", locale);
		model.addAttribute("special", special);
		//String billcyc =request.getParameter("billcyc");// "201901";
		receivableTurnoverRateService.calculatedScore(String.valueOf(billcyc.substring(0,4)+"01"), String.valueOf(billcyc));
		Map<String,List<Overview>> result =  overviewService.queryData(billcyc);
		//list = overviewService.queryData();
		return  result;
	}
	
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/updateRemarks", method = RequestMethod.POST)
	public Map<String,String>   updateRemarks(HttpServletRequest request, Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);
		Map<String,String> result = new HashMap<String,String>();
		Map<String,Object> params = new HashMap<String,Object>();
		params = RequestUtils.getParamsMapObj(request);
		int temp = overviewService.updateRemarks(params);
		result.put("success", String.valueOf(temp));
		//list = overviewService.queryData();
		return  result;
	}
	
	
	
}

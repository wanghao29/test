package com.asiainfo.cmc.controller.provinceKpi.pointOption;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.AverageProfit;
import com.asiainfo.cmc.enties.TerminalSaleShare;
import com.asiainfo.cmc.service.impl.AverageProfitService;
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
import javax.servlet.http.HttpServletRequest;

import java.util.*;

@Controller
@RequestMapping(value = "/pointOption/averageProfit")
public class averageProfitController {
	private static final Logger logger = LoggerFactory.getLogger(averageProfitController.class);
	@Resource
	private AverageProfitService AverageProfitService;

	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model, HttpServletRequest request,String special,String billcyc) {
		logger.info("customerChannel  {}.", locale);
		request.getSession().setAttribute("special",special);
		model.addAttribute("special", special );
		request.getSession().setAttribute("billcyc",billcyc);
		model.addAttribute("billcyc", billcyc );
		return "pointOption/average_profit";
	}

	@DS("dataSource")@RequestMapping(value = "/list")
	@ResponseBody
	public PageInfo list(@RequestBody Map<String,Object> params) {
//		Map<String,Object> data = new HashMap<String,Object>();
		Integer page = (Integer) params.get("page");
		Integer pageSize = (Integer) params.get("pageSize");
		String startMonth = (String) params.get("startMonth");
		String endMonth = (String) params.get("endMonth");
		List<AverageProfit> list = AverageProfitService.selectByParameter(startMonth,endMonth,page,pageSize);
		updateData(list, startMonth, endMonth);
		list = AverageProfitService.selectByParameter(startMonth,endMonth,page,pageSize);
		Integer totalCount = AverageProfitService.getTotalByParameter(startMonth,endMonth,page,pageSize);
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
			String htzygsl =  params.get("htzygsl") + "";
			String lwpqygsl = params.get("lwpqygsl") + "";
			String df = params.get("df") + "";
			AverageProfitService.updateByTargetVal(startMonth,endMonth,htzygsl,lwpqygsl,df);
			result.put("code",0);
		}catch (Exception e){
			e.printStackTrace();
			result.put("code",1);
		}
		return result;
	}

	@DS("dataSource")@RequestMapping(value = "/updateByPrimaryKey")
	@ResponseBody
	public Map<String, Object> updateByPrimaryKey(@RequestBody AverageProfit AverageProfit) {
		Map<String,Object> result = new HashMap<String,Object>();
		try {
			AverageProfitService.updateByPrimaryKey(AverageProfit);
			result.put("code",0);
		}catch (Exception e){
			e.printStackTrace();
			result.put("code",1);
		}
		return result;
	}

	@DS("dataSource")@RequestMapping(value = "/getEchartData")
	@ResponseBody
	public Map<String,Object> getEchartData(@RequestBody Map<String,Object> params) {
		Map<String,Object> data = new HashMap<String,Object>();
		String startMonth = (String) params.get("startMonth");
		String endMonth = (String) params.get("endMonth");
		List<AverageProfit> list = AverageProfitService.getLastData(endMonth);
		AverageProfit lastAverageProfit = new AverageProfit();
		if(list != null && list.size()>0) {
			lastAverageProfit = list.get(0);
		}
		
		List<AverageProfit> AverageProfits = AverageProfitService.getEchartData(startMonth,endMonth);
		List<String> months = new ArrayList<String>();
		List<String> xlzbs = new ArrayList<String>();
		if(AverageProfits != null && AverageProfits.size() > 0){
			for(AverageProfit AverageProfit : AverageProfits){
				months.add(AverageProfit.getMonth());
				xlzbs.add(AverageProfit.getRjlr());
			}
		}
		data.put("months", months);
		data.put("qnwcsrs", xlzbs);
		data.put("lastData",lastAverageProfit);
		return data;
	}
	
	private void updateData(List<AverageProfit> list,String startMonth,String endMonth) {
		  for(AverageProfit averageProfit:list) {
				//AverageProfitService.updateByPrimaryKey(averageProfit);
			 
				String htzygsl =String.valueOf(averageProfit.getHtzygsl());
				String lwpqygsl = String.valueOf(averageProfit.getLwpqygsl());
				String df = String.valueOf(averageProfit.getDf());
				endMonth = averageProfit.getMonth();
				AverageProfitService.updateByTargetVal(startMonth,endMonth,htzygsl,lwpqygsl,df);
		  }
		
	}
	
}

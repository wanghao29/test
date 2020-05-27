package com.asiainfo.cmc.controller.provinceKpi.businessIncome;
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
import com.asiainfo.cmc.enties.BusinessIncome;
import com.asiainfo.cmc.service.BusinessIncomeService;
import com.asiainfo.cmc.utils.DateUtils;
import com.asiainfo.cmc.utils.PageInfo;

@Controller
@RequestMapping(value = "/businessIncome/businessIncome")
public class businessIncomeController {
	private static final Logger logger = LoggerFactory.getLogger(businessIncomeController.class);
	@Resource
	private BusinessIncomeService businessIncomeService;

	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model, HttpServletRequest request,String special,String billcyc) {
		logger.info("customerChannel  {}.", locale);
		request.getSession().setAttribute("special",special);
		model.addAttribute("special", special );
		request.getSession().setAttribute("billcyc",billcyc);
		model.addAttribute("billcyc", billcyc );
		
		return "businessIncome/business_income";
	}

	@DS("dataSource")@RequestMapping(value = "/list")
	@ResponseBody
	public PageInfo list(@RequestBody Map<String,Object> params) {
//		Map<String,Object> data = new HashMap<String,Object>();
		Integer page = (Integer) params.get("page");
		Integer pageSize = (Integer) params.get("pageSize");
		String startMonth = (String) params.get("startMonth");
		String endMonth = (String) params.get("endMonth");
		List<BusinessIncome> list = businessIncomeService.list(startMonth,endMonth,page,pageSize);
		updateData( list, startMonth, endMonth); 
	    list = businessIncomeService.list(startMonth,endMonth,page,pageSize);
		Integer totalCount = businessIncomeService.getTotalByParameter(startMonth,endMonth,page,pageSize);
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
	public Map<String, Object> updateByTargetVal(@RequestBody Map<String,Object> params) {
		Map<String,Object> result = new HashMap<String,Object>();
		try {
			String startMonth = (String) params.get("startMonth");
			String endMonth = (String) params.get("endMonth");
			String mbz = (String) params.get("mbz");
			businessIncomeService.updateByTargetVal(startMonth,endMonth,mbz);
			result.put("code",0);
		}catch (Exception e){
			e.printStackTrace();
			result.put("code",1);
		}
		return result;
	}

	@DS("dataSource")@RequestMapping(value = "/update")
	@ResponseBody
	public Map<String, Object> update(@RequestBody Map<String,Object> params) {
		Map<String,Object> result = new HashMap<String,Object>();
		try {
			String startMonth = (String) params.get("month");
			String endMonth = (String) params.get("month");
			String mbz = String.valueOf( params.get("mbz"));
			businessIncomeService.update(params);
			businessIncomeService.updateByTargetVal(startMonth,endMonth,mbz);
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
		BusinessIncome lastBusinessIncome = ((List<BusinessIncome>) businessIncomeService.getLastData(endMonth)).get(0);
		List<BusinessIncome> businessIncomes = businessIncomeService.getEchartData(startMonth,endMonth);
		List<String> months = new ArrayList<String>();
		List<String> qnwcsrs = new ArrayList<String>();
		List<String> qnwcds = new ArrayList<String>();
		if(businessIncomes != null && businessIncomes.size() > 0){
			for(BusinessIncome businessIncome : businessIncomes){
				months.add(businessIncome.getMonth());
				qnwcsrs.add(businessIncome.getBywcqk());
				qnwcds.add(String.valueOf(Double.valueOf(businessIncome.getBysrwcl())*100));// 
			}
		}
		data.put("months", months);
		data.put("qnwcsrs", qnwcsrs);
		data.put("qnwcds", qnwcds);
		data.put("lastData",lastBusinessIncome);
		return data;
	}
	
	
	private void updateData(List<BusinessIncome> list,String startMonth,String endMonth) {
		  for(BusinessIncome businessIncome:list) {
			     Map<String,Object> params = new HashMap<String,Object>();
				String mbz = String.valueOf(businessIncome.getMbz());
				params.put("bywcqktz", businessIncome.getBywcqktz());
				params.put("id", businessIncome.getId());
				businessIncomeService.update(params);
				businessIncomeService.updateByTargetVal(startMonth,endMonth,mbz);
		  }
		
	}
}

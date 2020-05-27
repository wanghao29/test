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
import com.asiainfo.cmc.enties.IncomeMultiForm;
import com.asiainfo.cmc.service.IncomeMultiFormService;
import com.asiainfo.cmc.utils.PageInfo;

@Controller
@RequestMapping(value = "/businessIncome/incomeMultiForm")
public class incomeMultiformController {
	private static final Logger logger = LoggerFactory.getLogger(incomeMultiformController.class);
	@Resource
	private IncomeMultiFormService incomeMultiFormService;

	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model, HttpServletRequest request,String special,String billcyc) {
		logger.info("customerChannel  {}.", locale);
		request.getSession().setAttribute("special",special);
		model.addAttribute("special", special );
		request.getSession().setAttribute("billcyc",billcyc);
		model.addAttribute("billcyc", billcyc );
		return "businessIncome/income_multi_form";
	}

	@DS("dataSource")@RequestMapping(value = "/list")
	@ResponseBody
	public PageInfo list(@RequestBody Map<String,Object> params) {
//		Map<String,Object> data = new HashMap<String,Object>();
		Integer page = (Integer) params.get("page");
		Integer pageSize = (Integer) params.get("pageSize");
		String startMonth = (String) params.get("startMonth");
		String endMonth = (String) params.get("endMonth");
		List<IncomeMultiForm> list = incomeMultiFormService.list(startMonth,endMonth,page,pageSize);
		updateData(list, startMonth, endMonth);
		list = incomeMultiFormService.list(startMonth,endMonth,page,pageSize);
		Integer totalCount = incomeMultiFormService.getTotalByParameter(startMonth,endMonth,page,pageSize);
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
			incomeMultiFormService.updateByTargetVal(startMonth,endMonth,mbz);
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
			incomeMultiFormService.update(params);
			incomeMultiFormService.updateByTargetVal(startMonth,endMonth,mbz);
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
		IncomeMultiForm lastIncomeMultiForm = ((List<IncomeMultiForm>) incomeMultiFormService.getLastData(endMonth)).get(0);
		List<IncomeMultiForm> IncomeMultiForms = incomeMultiFormService.getEchartData(startMonth,endMonth);
		List<String> months = new ArrayList<String>();
		List<String> srs = new ArrayList<String>();
		List<String> bysrwcls = new ArrayList<String>();
		if(IncomeMultiForms != null && IncomeMultiForms.size() > 0){
			for(IncomeMultiForm IncomeMultiForm : IncomeMultiForms){
				months.add(IncomeMultiForm.getMonth());
				srs.add(IncomeMultiForm.getSr());
				bysrwcls.add(String.valueOf(Double.valueOf(IncomeMultiForm.getBysrwcl())*100));//杞负鐧惧垎鐜�
			}
		}
		data.put("months", months);
		data.put("srs", srs);
		data.put("bysrwcls", bysrwcls);
		data.put("lastData",lastIncomeMultiForm);
		return data;
	}
	
	private void updateData(List<IncomeMultiForm> list,String startMonth,String endMonth) {
		  for(IncomeMultiForm incomeMultiForm:list) {
			     Map<String,Object> params = new HashMap<String,Object>();
				String mbz = String.valueOf(incomeMultiForm.getMbz());
				params.put("srtz", incomeMultiForm.getSrtz());
				params.put("id", incomeMultiForm.getId());
				incomeMultiFormService.update(params);
				incomeMultiFormService.updateByTargetVal(startMonth,endMonth,mbz);
		  }
		
	}
}

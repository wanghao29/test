package com.asiainfo.cmc.controller.provinceKpi.businessIncome;

import java.util.*;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.IncomeMultiForm;
import com.asiainfo.cmc.enties.IncomePhoneBrand;
import com.asiainfo.cmc.service.IncomePhoneBrandService;
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


@Controller
@RequestMapping(value = "/businessIncome/privateBrandIncome")
public class privateBrandIncomeController {
	private static final Logger logger = LoggerFactory.getLogger(privateBrandIncomeController.class);
	@Resource
	private IncomePhoneBrandService incomePhoneBrandService;

	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model, HttpServletRequest request,String special,String billcyc) {
		logger.info("customerChannel  {}.", locale);
		request.getSession().setAttribute("special",special);
		model.addAttribute("special", special );
		request.getSession().setAttribute("billcyc",billcyc);
		model.addAttribute("billcyc", billcyc );
		return "businessIncome/private_brand_income";
	}

	@DS("dataSource")@RequestMapping(value = "/list")
	@ResponseBody
	public PageInfo list(@RequestBody Map<String,Object> params) {
//		Map<String,Object> data = new HashMap<String,Object>();
		Integer page = (Integer) params.get("page");
		Integer pageSize = (Integer) params.get("pageSize");
		String startMonth = (String) params.get("startMonth");
		String endMonth = (String) params.get("endMonth");
		List<IncomePhoneBrand> list = incomePhoneBrandService.list(startMonth,endMonth,page,pageSize);
		updateData(  list, startMonth, endMonth);
		list = incomePhoneBrandService.list(startMonth,endMonth,page,pageSize);
		Integer totalCount = incomePhoneBrandService.getTotalByParameter(startMonth,endMonth,page,pageSize);
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
			incomePhoneBrandService.updateByTargetVal(startMonth,endMonth,mbz);
			result.put("code",0);
		}catch (Exception e){
			e.printStackTrace();
			result.put("code",1);
		}
		return result;
	}

	@DS("dataSource")@RequestMapping(value = "/update")
	@ResponseBody
	public Map<String, Object> update(@RequestBody IncomePhoneBrand incomePhoneBrand) {
		Map<String,Object> result = new HashMap<String,Object>();
		try {
			incomePhoneBrandService.update(incomePhoneBrand);
			incomePhoneBrandService.updateByTargetVal(incomePhoneBrand.getMonth(),incomePhoneBrand.getMonth(),String.valueOf(incomePhoneBrand.getMbz()));
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
		IncomePhoneBrand lastIncomePhoneBrand = ((List<IncomePhoneBrand>) incomePhoneBrandService.getLastData(endMonth)).get(0);
		List<IncomePhoneBrand> incomePhoneBrands = incomePhoneBrandService.getEchartData(startMonth,endMonth);
		List<String> months = new ArrayList<String>();
		List<String> qnwcsrs = new ArrayList<String>();
		List<String> qnwcds = new ArrayList<String>();
		if(incomePhoneBrands != null && incomePhoneBrands.size() > 0){
			for(IncomePhoneBrand incomePhoneBrand : incomePhoneBrands){
				months.add(incomePhoneBrand.getMonth());
				qnwcsrs.add(incomePhoneBrand.getSr());
				qnwcds.add(incomePhoneBrand.getBysrwcl());
			}
		}
		data.put("months", months);
		data.put("qnwcsrs", qnwcsrs);
		data.put("qnwcds", qnwcds);
		data.put("lastData",lastIncomePhoneBrand);
		return data;
	}
	
	private void updateData(List<IncomePhoneBrand> list,String startMonth,String endMonth) {
		  for(IncomePhoneBrand incomePhoneBrand:list) {
			     Map<String,Object> params = new HashMap<String,Object>();
				String mbz = String.valueOf(incomePhoneBrand.getMbz());
				params.put("srtz", incomePhoneBrand.getSrtz());
				params.put("id", incomePhoneBrand.getId());
				incomePhoneBrandService.update(incomePhoneBrand);
				incomePhoneBrandService.updateByTargetVal(incomePhoneBrand.getMonth(),incomePhoneBrand.getMonth(),String.valueOf(incomePhoneBrand.getMbz()));
			
		  }
		
	}
	
}

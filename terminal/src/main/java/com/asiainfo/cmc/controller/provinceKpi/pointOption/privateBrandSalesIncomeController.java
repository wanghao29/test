package com.asiainfo.cmc.controller.provinceKpi.pointOption;

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
import com.asiainfo.cmc.enties.BrandProductSalesIncome;
import com.asiainfo.cmc.enties.PrivateBrandSalesIncome;
import com.asiainfo.cmc.service.PrivateBrandSalesIncomeService;
import com.asiainfo.cmc.utils.PageInfo;


@Controller
@RequestMapping(value = "/pointOption/privateBrandSalesIncome")
public class privateBrandSalesIncomeController {
	private static final Logger logger = LoggerFactory.getLogger(privateBrandSalesIncomeController.class);
	@Resource
	private PrivateBrandSalesIncomeService PrivateBrandSalesIncomeService;

	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model, HttpServletRequest request,String special,String billcyc) {
		logger.info("customerChannel  {}.", locale);
		request.getSession().setAttribute("special",special);
		model.addAttribute("special", special );
		request.getSession().setAttribute("billcyc",billcyc);
		model.addAttribute("billcyc", billcyc );
		return "pointOption/private_brand_sales_income";
	}

	@DS("dataSource")@RequestMapping(value = "/list")
	@ResponseBody
	public PageInfo list(@RequestBody Map<String,Object> params) {
//		Map<String,Object> data = new HashMap<String,Object>();
		Integer page = (Integer) params.get("page");
		Integer pageSize = (Integer) params.get("pageSize");
		String startMonth = (String) params.get("startMonth");
		String endMonth = (String) params.get("endMonth");
		List<BrandProductSalesIncome> list = PrivateBrandSalesIncomeService.list(startMonth,endMonth,page,pageSize);
		updateData( list, startMonth, endMonth);
		list = PrivateBrandSalesIncomeService.list(startMonth,endMonth,page,pageSize);
		Integer totalCount = PrivateBrandSalesIncomeService.getTotalByParameter(startMonth,endMonth,page,pageSize);
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
			String zyppsjsrmbz = String.valueOf( params.get("zyppsjsrmbz"));
			String zyppdxtzdsrmbz = String.valueOf( params.get("zyppdxtzdsrmbz"));
			PrivateBrandSalesIncomeService.updateByTargetVal(startMonth,endMonth,zyppsjsrmbz,zyppdxtzdsrmbz);
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
		//	BrandProductSalesIncome brandProductSalesIncome = new BrandProductSalesIncome();
			String startMonth = (String) params.get("startMonth");
			String endMonth = (String) params.get("month");
			String zyppsjsrmbz =  String.valueOf(params.get("zyppsjsrmbz"));
			String zyppdxtzdsrmbz =  String.valueOf( params.get("zyppdxtzdsrmbz"));
			PrivateBrandSalesIncomeService.updateByPrimaryKeySelective(params);
			PrivateBrandSalesIncomeService.updateByTargetVal(startMonth,endMonth,zyppsjsrmbz,zyppdxtzdsrmbz);
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
		startMonth=startMonth.replace("-", "");
		endMonth=endMonth.replace("-", "");
		//PrivateBrandSalesIncome lastData = ((List<PrivateBrandSalesIncome>) PrivateBrandSalesIncomeService.getLastData(endMonth)).get(0);
		BrandProductSalesIncome brandProductSalesIncome = new BrandProductSalesIncome();
		List<BrandProductSalesIncome> BrandProductSalesIncomes = PrivateBrandSalesIncomeService.getEchartData(startMonth,endMonth);
		List<String> months = new ArrayList<String>();
		List<String> dxtsr = new ArrayList<String>();
		List<String> dxtwcl = new ArrayList<String>();
		List<String> sjsr = new ArrayList<String>();
		List<String> sjwcl = new ArrayList<String>();
		if(BrandProductSalesIncomes != null && BrandProductSalesIncomes.size() > 0){
			brandProductSalesIncome = BrandProductSalesIncomes.get(0);
			for(BrandProductSalesIncome BrandProductSalesIncome : BrandProductSalesIncomes){
				months.add(BrandProductSalesIncome.getMonth());
				dxtsr.add(BrandProductSalesIncome.getZyppdxtzdsr());
				dxtwcl.add(String.valueOf(Double.valueOf(BrandProductSalesIncome.getZyppdxtzdsrwcl())*100));
				sjsr.add(BrandProductSalesIncome.getZyppsr());
				sjwcl.add(String.valueOf(Double.valueOf(BrandProductSalesIncome.getZyppsjsrwcl())*100));
			}
		}
		data.put("months", months);
		data.put("dxtsr", dxtsr);
		data.put("dxtwcl", dxtwcl);
		data.put("sjsr", sjsr);
		data.put("sjwcl", sjwcl);
		data.put("lastData",brandProductSalesIncome);
		return data;
	}
	
	private void updateData(List<BrandProductSalesIncome> list,String startMonth,String endMonth) {
		  for(BrandProductSalesIncome brandProductSalesIncome:list) {
			     Map<String,Object> params = new HashMap<String,Object>();
					String zyppsjsrmbz =  String.valueOf(brandProductSalesIncome.getZyppsjsrmbz());
					String zyppdxtzdsrmbz =  String.valueOf( brandProductSalesIncome.getZyppdxtzdsrmbz());
					params.put("sgtzxm",brandProductSalesIncome.getSgtzxm());
					params.put("id",brandProductSalesIncome.getId());
					PrivateBrandSalesIncomeService.updateByPrimaryKeySelective(params);
					PrivateBrandSalesIncomeService.updateByTargetVal(startMonth,endMonth,zyppsjsrmbz,zyppdxtzdsrmbz);
		  }
		
	}
	
}

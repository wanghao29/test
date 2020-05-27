package com.asiainfo.cmc.controller.provinceKpi.socialChannelExpand;

import java.text.DecimalFormat;
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
import com.asiainfo.cmc.enties.CustomerSaleTargetVal;
import com.asiainfo.cmc.service.impl.CustomerSaleTargetValService;
import com.asiainfo.cmc.utils.PageInfo;

@Controller
@RequestMapping(value = "/socialChannelExpand/customerSalesTargetValue")
public class customerSalesTargetValController {
	private static final Logger logger = LoggerFactory.getLogger(customerSalesTargetValController.class);
	@Resource
	private CustomerSaleTargetValService customerSaleTargetValService;

	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model, HttpServletRequest request,String special,String billcyc) {
		logger.info("customerChannel  {}.", locale);
		request.getSession().setAttribute("special",special);
		model.addAttribute("special", special );
		request.getSession().setAttribute("billcyc",billcyc);
		model.addAttribute("billcyc", billcyc );
		return "socialChannelExpand/customer_sales_target_value";
	}

	@DS("dataSource")@RequestMapping(value = "/list", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public PageInfo list(@RequestBody Map<String,Object> params) {
		/*Map<String,String> params = RequestUtils.getParamsMap(request);*/
//		Map<String,Object> data = new HashMap<String,Object>();
		Integer page =   (Integer) params.get("page");
		Integer pageSize =  (Integer)  params.get("pageSize");
		String startMonth =  (String) params.get("startMonth");
		String endMonth =   (String) params.get("endMonth");
		List<CustomerSaleTargetVal> list = customerSaleTargetValService.selectByParameter(startMonth,endMonth,page,pageSize);
		updateData(  list,  startMonth,  endMonth);
		list = customerSaleTargetValService.selectByParameter(startMonth,endMonth,page,pageSize);
		Integer totalCount = customerSaleTargetValService.getTotalByParameter(startMonth,endMonth,page,pageSize);
		int totalPage = (totalCount+ pageSize-1) / pageSize;
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPage(page);
		pageInfo.setPageSize(pageSize);
		pageInfo.setTotalPages(totalPage);
		pageInfo.setTotalCount(totalCount);
		pageInfo.setList(list);
		return pageInfo;
	}
	@DS("dataSource")@RequestMapping(value = "/queryKaCustomerCode")
	@ResponseBody
	public  List<Map<String,String>>  queryKaCustomerCode() {
		 List<Map<String,String>> resultList = new ArrayList<Map<String,String>>();
	  resultList = customerSaleTargetValService.queryKaCustomerCode();
		 
			return resultList;
	}
	
	@DS("dataSource")@RequestMapping(value = "/addKa", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public  List<Map<String,String>>  addKa(@RequestBody Map<String,Object> params) {
		 List<Map<String,String>> resultList = new ArrayList<Map<String,String>>();
		 String customerCode = (String) params.get("customer_code");
		 String customerCodeDesc = (String) params.get("customer_code_desc");
		 String month = (String) params.get("month");
		 String customer_sales = (String) params.get("customer_sales");
		 String target_efficiency = (String) params.get("target_efficiency");
		 String[] customerCodeArray = customerCode.split(",");
		 params.put("customerCodeArray", customerCodeArray);
		 String customerSales = customerSaleTargetValService.queryCustomerSales(params);
		 if(customerSales == null || "".equals(customerSales)) {
			 customerSales = "0";
		 }
		 CustomerSaleTargetVal customerSaleTargetVal = customerSaleTargetValService.queryCustomerSaleByMonth(month);
		 if(customerSaleTargetVal == null ) {
			 customerSaleTargetVal = new CustomerSaleTargetVal();
			 customerSaleTargetVal.setMonth(month);
			 customerSaleTargetVal.setMbz(target_efficiency);
			 customerSaleTargetVal.setKakhxs(customerSales);
			 customerSaleTargetVal.setKakhxlmbz(customer_sales);
			 customerSaleTargetVal.setKakhdm(customerCode);
			 customerSaleTargetVal.setKakhdmdesc(customerCodeDesc);
			 customerSaleTargetValService.insert(customerSaleTargetVal);
		 }else {
			 customerSaleTargetVal.setKakhxs(customerSales);
			 customerSaleTargetVal.setKakhdm(customerCode);
			 customerSaleTargetVal.setKakhdmdesc(customerCodeDesc);
			 customerSaleTargetValService.updateByPrimaryKey(customerSaleTargetVal);
		 }
			return resultList;
	}
	
	
	@DS("dataSource")@RequestMapping(value = "/updateByTargetVal")
	@ResponseBody
	public Map<String, Object> updateByTargetVal(@RequestBody Map<String,Object> params) {
		Map<String,Object> result = new HashMap<String,Object>();
		try {
			String startMonth = (String) params.get("startMonth");
			String endMonth = (String) params.get("endMonth");
			String mbz = (String) params.get("mbz");
			customerSaleTargetValService.updateByTargetVal(startMonth,endMonth,mbz);
			result.put("code",0);
		}catch (Exception e){
			e.printStackTrace();
			result.put("code",1);
		}
		return result;
	}

	@DS("dataSource")@RequestMapping(value = "/updateByPrimaryKey")
	@ResponseBody
	public Map<String, Object> updateByPrimaryKey(@RequestBody CustomerSaleTargetVal customerSaleTargetVal) {
		Map<String,Object> result = new HashMap<String,Object>();
		try {
			String startMonth = customerSaleTargetVal.getMonth();
			String endMonth = customerSaleTargetVal.getMonth();
			String mbz = String.valueOf( customerSaleTargetVal.getMbz());
			customerSaleTargetValService.updateByPrimaryKey(customerSaleTargetVal);
			customerSaleTargetValService.updateByTargetVal(startMonth,endMonth,mbz);
			
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
		Map<String,Object> ketDatas = customerSaleTargetValService.getKeyData();
		return ketDatas;
	}

	@DS("dataSource")@RequestMapping(value = "/getLastData")
	@ResponseBody
	public CustomerSaleTargetVal getLastData(@RequestBody Map<String,Object> params) {
		String endMonth=(String)params.get("endMonth");
		List<CustomerSaleTargetVal> list =  customerSaleTargetValService.getLastData(endMonth);
		CustomerSaleTargetVal customerSaleTargetVal = new CustomerSaleTargetVal ();
		if(list != null && list.size() >0) {
			customerSaleTargetVal=list.get(0);
		}
			
		
		return customerSaleTargetVal;
	}

	@DS("dataSource")@RequestMapping(value = "/getFormat")
	@ResponseBody
	public Map<String,Object> getFormat(Integer id) {
		Map<String,Object> ketDatas = new HashMap<String,Object>();
		CustomerSaleTargetVal CustomerSaleTargetVal = customerSaleTargetValService.selectByPrimaryKey(id);
		String sjjd = CustomerSaleTargetVal.getSjjd();
		String f;
		if(Double.valueOf(sjjd) >= 0){
			f = "100";
		}else {
			f = String.valueOf((1 + Double.valueOf(sjjd)) * 100);
		}

		StringBuffer stringBuffer = new StringBuffer();
		if(CustomerSaleTargetVal != null){
			stringBuffer.append("<small>当前进度:" + f + "%</small>");
			stringBuffer.append("<div class=\"progress progress-mini\">");
			stringBuffer.append("  <div style=\"width: " + f + "%;\" class=\"progress-bar\"></div>");
			stringBuffer.append("</div>");
			stringBuffer.append("");
			stringBuffer.append("");
			stringBuffer.append("");
			stringBuffer.append("");
		}
		ketDatas.put("formatStr",stringBuffer.toString());
		return ketDatas;
	}

	@DS("dataSource")@RequestMapping(value = "/getWcqkzbs")
	@ResponseBody
	public Map<String,Object> getWcqkzbs(@RequestBody Map<String,Object> params) {
		Integer id = (Integer) params.get("id");
		CustomerSaleTargetVal CustomerSaleTargetVal = customerSaleTargetValService.selectByPrimaryKey(id);
		String currentMonth = CustomerSaleTargetVal.getMonth();
		String teampMonth = currentMonth + "01";
		String currentMonthWcqkzb = CustomerSaleTargetVal.getWcqkzb();
		String lastMonthWcqkzb = customerSaleTargetValService.getLastMonthWcqkzb(teampMonth);
		if(lastMonthWcqkzb == null){
			lastMonthWcqkzb = "0";
		}
		String lastYearWcqkzb = customerSaleTargetValService.getLastYearWcqkzb(teampMonth);
		if(lastYearWcqkzb == null){
			lastYearWcqkzb = "0";
		}
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("currentMonthWcqkzb", String.valueOf(Double.valueOf(currentMonthWcqkzb) * 100));
		result.put("lastMonthWcqkzb",String.valueOf(Double.valueOf(lastMonthWcqkzb) * 100));
		result.put("lastYearWcqkzb",String.valueOf(Double.valueOf(lastYearWcqkzb )* 100));
		return result;
	}

	public Float retainDecimal(Float f) {
		 DecimalFormat df = new DecimalFormat("#.0");
		 return Float.valueOf(df.format(f));
	 }
	
	private void updateData(List<CustomerSaleTargetVal> list,String startMonth,String endMonth) {
		  for(CustomerSaleTargetVal customerSaleTargetVal:list) {
			        Map<String,Object> params = new HashMap<String,Object>();
					String mbz = String.valueOf( customerSaleTargetVal.getMbz());
					customerSaleTargetValService.updateByPrimaryKey(customerSaleTargetVal);
					customerSaleTargetValService.updateByTargetVal(startMonth,endMonth,mbz);
		  }
		
	}
}

package com.asiainfo.cmc.controller.provinceKpi.terminalSales;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.servlet.ModelAndView;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.ProductSalesRate;
import com.asiainfo.cmc.service.impl.ProductSalesRateService;
import com.asiainfo.cmc.utils.DateUtils;
import com.asiainfo.cmc.utils.PageInfo;

@Controller
@RequestMapping(value = "/terminalSales/productSalesRate")
public class productSalesRateController {
	private static final Logger logger = LoggerFactory.getLogger(productSalesRateController.class);
	@Resource
	private ProductSalesRateService ProductSalesRateService;

	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model, HttpServletRequest request,String special,String billcyc) {
		logger.info("customerChannel  {}.", locale);
		request.getSession().setAttribute("special",special);
		model.addAttribute("special", special );
		request.getSession().setAttribute("billcyc",billcyc);
		model.addAttribute("billcyc", billcyc );
		return "terminalSales/product_sales_rate";
	}

	@DS("dataSource")@RequestMapping(value = "/list")
	@ResponseBody
	public PageInfo list(@RequestBody Map<String,Object> params) {
//		Map<String,Object> data = new HashMap<String,Object>();
		Integer page = (Integer) params.get("page");
		Integer pageSize = (Integer) params.get("pageSize");
		String startMonth = (String) params.get("startMonth");
		String endMonth = (String) params.get("endMonth");
		List<ProductSalesRate> list = ProductSalesRateService.selectByParameter(startMonth,endMonth,page,pageSize);
		Integer totalCount = ProductSalesRateService.getTotalByParameter(startMonth,endMonth,page,pageSize);
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
			String mbz = (String) params.get("mbz");
			ProductSalesRateService.updateByTargetVal(startMonth,endMonth,mbz);
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
		ProductSalesRate lastProductSalesRate = ((List<ProductSalesRate>) ProductSalesRateService.getLastData(endMonth)).get(0);
		List<ProductSalesRate> ProductSalesRates = ProductSalesRateService.getEchartData(startMonth,endMonth);
		List<String> months = new ArrayList<String>();
		List<String> wcls = new ArrayList<String>();
		List<String> khxls = new ArrayList<String>();
		if(ProductSalesRates != null && ProductSalesRates.size() > 0){
			for(ProductSalesRate ProductSalesRate : ProductSalesRates){
				months.add(ProductSalesRate.getMonth());
				String  wcl = ProductSalesRate.getWcl();
				if(wcl==null){
					wcl="0";
				}
				wcls.add(String.valueOf(Double.valueOf(wcl)*100));//转化为百分率
				khxls.add(ProductSalesRate.getKhxl());
			}
		}
		data.put("months", months);
		data.put("wcls", wcls);
		data.put("khxls", khxls);
		data.put("lastData",lastProductSalesRate);
		return data;
	}
	
	@DS("dataSource")@RequestMapping(value = "/getLastData")
	@ResponseBody
	public ProductSalesRate getLastData(@RequestBody Map<String,Object> params) {
		String endMonth = (String) params.get("endMonth");
		List<ProductSalesRate> productSalesRateService = ProductSalesRateService.getLastData(endMonth);
		if(productSalesRateService != null && productSalesRateService.size() > 0){
			ProductSalesRate product = productSalesRateService.get(0);
			return product;
		}
		return null;

	}
	
	@DS("dataSource")@RequestMapping(value = "/dialog/getDialog")
	@ResponseBody
	public ModelAndView getDialog(String limit) {
		ModelAndView modelAndView = new ModelAndView("/dialog/product_sales_rate");
		return modelAndView;
	}
	
	@DS("dataSource")@RequestMapping(value = "/dialog/getProductList")
	@ResponseBody
	public List<String> getProductList(@RequestBody Map<String,Object> params) {
		String month =DateUtils.getSpecifiedDayBefore( DateUtils.GetCurDate(),1);
		List<String> zdcpList = ProductSalesRateService.getZdcpsByMonth(month);
		/*for (String string : zdcpList) {
			System.out.println(string);
		}*/
		return zdcpList;
	}
	
 
	@DS("dataSource")@RequestMapping(value = "/updateMBZ")
	@ResponseBody
	public void updateMBZ(@RequestBody Map<String,Object> params) throws ParseException{
		String month = (String) params.get("month");
		Map<String,Object> queryParm = new HashMap<String,Object>();
		String filetime = DateUtils.getSpecifiedDayBefore( DateUtils.GetCurDate(),1);
		String mbz = (String) params.get("mbz");
		String brand_id =  (String) params.get("brandIdArray");
		String mobile_type =   (String) params.get("mobileTypeArray");
		String configure_id =   (String) params.get("configureIdArray");
		 String[] brandIdArray = null;
		 String[] mobileTypeArray = null ;
		 String[] configureIdArray = null;
		 if(brand_id!=null && !"".equals(brand_id)) {
			 brandIdArray = brand_id.split(",");
		 }
		 if(mobile_type!=null && !"".equals(mobile_type)) {
			 mobileTypeArray = mobile_type.split(",");
			 }
		 if(configure_id!=null && !"".equals(configure_id)) {
				configureIdArray = configure_id.split(",");
			 }
		 String  productDesc =  (String) params.get("productDesc");
		Integer count = ProductSalesRateService.getCountByMonth(month);
/*		String zdcp="";
    	for (int i = 0; i < productArray.size(); i++) {
    		zdcp += "'"+productArray.get(i)+"',";
		}
    	zdcp = zdcp.substring(0,zdcp.length()-1);*/
	
    	SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
    	
        Date date = df.parse(month+"01");
        String end_deliver_day = df.format(DateUtils.getLastDayOf(date));
        queryParm.put("brandIdArray", brandIdArray);
        queryParm.put("mobileTypeArray", mobileTypeArray);
        queryParm.put("configureIdArray", configureIdArray);
        queryParm.put("filetime", filetime);
        queryParm.put("strat_deliver_day", month+"01");
        queryParm.put("end_deliver_day", end_deliver_day);
        String khxl_record = ProductSalesRateService.queryKhxlByBand(queryParm);
    	ProductSalesRate record = new ProductSalesRate();
    	 if(mbz==null || "".equals(mbz)) {
    		 mbz = "0";
		}
    	
		record.setMbz( mbz);
		if(khxl_record == null) {
			record.setKhxl( "0.00");
		}else {
			record.setKhxl(khxl_record);
			record.setZdcp(productDesc);
		}
			
		
		record.setMonth(month);
    	if(count > 0) {
    		ProductSalesRateService.updateProductSalesRateByMonth(record);
    	}else {
    		ProductSalesRateService.insert(record);
    	}
		String startMonth = (String) params.get("startMonth");
		ProductSalesRateService.updateByTargetVal(startMonth,month,mbz);
/*    	if (updateList.size()>0) {
    		for (int i = 0; i < updateList.size(); i++) {
				
				
			}
		}
    	if (addList.size()>0) {
    		for (int i = 0; i < addList.size(); i++) {
				ProductSalesRate record = new ProductSalesRate();
				record.setZdcp(addList.get(i));
				record.setMbz(Float.valueOf(mbz));
				record.setMonth(month);
				
			}
    		
		}*/
	} 
}

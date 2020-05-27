package com.asiainfo.cmc.controller.provinceKpi.socialChannelExpand;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.CustomerSaleTargetVal;
import com.asiainfo.cmc.enties.CustomerTargetVal;
import com.asiainfo.cmc.service.impl.CustomerTargetValService;
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
@RequestMapping(value = "/socialChannelExpand/customerTargetValue")
public class customerTargetValController {
	private static final Logger logger = LoggerFactory.getLogger(customerTargetValController.class);
	@Resource
	private CustomerTargetValService customerTargetValService;

	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model, HttpServletRequest request,String special,String billcyc) {
		logger.info("customerChannel  {}.", locale);
		request.getSession().setAttribute("special",special);
		model.addAttribute("special", special );
		request.getSession().setAttribute("billcyc",billcyc);
		model.addAttribute("billcyc", billcyc );
		return "socialChannelExpand/customer_target_value";
	}

	@DS("dataSource")@RequestMapping(value = "/list")
	@ResponseBody
	public PageInfo list(@RequestBody Map<String,Object> params) {
//		Map<String,Object> data = new HashMap<String,Object>();
		Integer page = (Integer) params.get("page");
		Integer pageSize = (Integer) params.get("pageSize");
		String startMonth = (String) params.get("startMonth");
		String endMonth = (String) params.get("endMonth");
		List<CustomerTargetVal> list = customerTargetValService.selectByParameter(startMonth,endMonth,page,pageSize);
		updateData(  list,  startMonth,  endMonth);
		list = customerTargetValService.selectByParameter(startMonth,endMonth,page,pageSize);
		Integer totalCount = customerTargetValService.getTotalByParameter(startMonth,endMonth,page,pageSize);
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
			customerTargetValService.updateByTargetVal(startMonth,endMonth,mbz);
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
		Map<String,Object> ketDatas = customerTargetValService.getKeyData();
		return ketDatas;
	}

	@DS("dataSource")@RequestMapping(value = "/getLastData")
	@ResponseBody
	public CustomerTargetVal getLastData(@RequestBody Map<String,Object> params) {
		String endMonth=(String)params.get("endMonth");
		CustomerTargetVal customerTargetVal = customerTargetValService.getLastData(endMonth).get(0);
		return customerTargetVal;
	}

	@DS("dataSource")@RequestMapping(value = "/getFormat")
	@ResponseBody
	public Map<String,Object> getFormat(Integer id) {
		Map<String,Object> ketDatas = new HashMap<String,Object>();
		CustomerTargetVal customerTargetVal = customerTargetValService.selectByPrimaryKey(id);
		String sjjd = customerTargetVal.getSjjd();
		String f;
		if(Double.valueOf(sjjd) >= 0){
			f = "100";
		}else {
			f = String.valueOf((1 + Double.valueOf(sjjd)) * 100);
		}

		StringBuffer stringBuffer = new StringBuffer();
		if(customerTargetVal != null){
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
		CustomerTargetVal customerTargetVal = customerTargetValService.selectByPrimaryKey(id);
		String currentMonth = customerTargetVal.getMonth();
		String teampMonth = currentMonth + "01";
		String currentMonthWcqkzb = customerTargetVal.getWqqkzb();
		String lastMonthWcqkzb = customerTargetValService.getLastMonthWcqkzb(teampMonth);
		if(lastMonthWcqkzb == null){
			lastMonthWcqkzb = "0";
		}
		String lastYearWcqkzb = customerTargetValService.getLastYearWcqkzb(teampMonth);
		if(lastYearWcqkzb == null){
			lastYearWcqkzb = "0";
		}
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("yf", currentMonth);
		result.put("currentMonthWcqkzb",String.valueOf(Double.valueOf(currentMonthWcqkzb) * 100));
		result.put("lastMonthWcqkzb",String.valueOf(Double.valueOf(lastMonthWcqkzb) * 100));
		result.put("lastYearWcqkzb",String.valueOf(Double.valueOf(lastYearWcqkzb) * 100));
		return result;
	}
	
	private void updateData(List<CustomerTargetVal> list,String startMonth,String endMonth) {
		  for(CustomerTargetVal customerTargetVal:list) {
			        Map<String,Object> params = new HashMap<String,Object>();
					String mbz =  customerTargetVal.getMbz() ;
					endMonth = customerTargetVal.getMonth();
					customerTargetValService.updateByTargetVal(startMonth,endMonth,mbz);
				//	customerSaleTargetValService.updateByPrimaryKey(customerSaleTargetVal);
				//	customerSaleTargetValService.updateByTargetVal(startMonth,endMonth,mbz);
		  }
		
	}
	
}

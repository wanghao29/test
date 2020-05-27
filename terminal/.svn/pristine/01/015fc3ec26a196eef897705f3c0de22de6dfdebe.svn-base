package com.asiainfo.cmc.controller.provinceKpi.mobileCorporationCollaboration;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.asiainfo.cmc.enties.SalesShare4G;
import com.asiainfo.cmc.service.impl.SalesShare4GService;
import com.asiainfo.cmc.utils.PageInfo;
import com.asiainfo.cmc.utils.RequestUtils;

@Controller
@RequestMapping(value = "/corporationCollaboration/salesShare4G")
public class saleShare4GController {
	private static final Logger logger = LoggerFactory.getLogger(saleShare4GController.class);
	@Resource
	private SalesShare4GService SalesShare4GService;

	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model, HttpServletRequest request,String special,String billcyc) {
		logger.info("customerChannel  {}.", locale);
		request.getSession().setAttribute("special",special);
		model.addAttribute("special", special );
		request.getSession().setAttribute("billcyc",billcyc);
		model.addAttribute("billcyc", billcyc );
		return "mobileCorporationCollaboration/sales_share_4g";
	}

	@DS("dataSource")@RequestMapping(value = "/dialog/getDialog")
	public ModelAndView getDialog(String limit) {
		ModelAndView modelAndView = new ModelAndView("/dialog/sales_share_4g_dialog");
		return modelAndView;
	}

	@DS("dataSource")@RequestMapping(value = "/addAndEdit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addAndEdit( HttpServletRequest request,
			HttpServletResponse response ){
		Map<String,String> params = RequestUtils.getParamsMap(request);
		params.put("month", params.get("month").replace("-", ""));
		Map<String,Object> result = new HashMap<String,Object>();
		try {
			SalesShare4G salesShare4G = SalesShare4GService.selectSalesShare(params.get("month"));
			if(salesShare4G == null){
				SalesShare4GService.insert(params);
			}else {
				SalesShare4GService.updateByPrimaryKey(params);
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
	public Map<String, Object> updateByReceivePayment(HttpServletRequest request,
			HttpServletResponse response ){
		Map<String,Object> result = new HashMap<String,Object>();
		try {
			Map<String,String> params = RequestUtils.getParamsMap(request);
			params.put("month", params.get("month").replace("-", ""));
			SalesShare4GService.updateByPrimaryKey(params);
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
		List<SalesShare4G> list = SalesShare4GService.selectByParameter(startMonth,endMonth,page,pageSize);
		Integer totalCount = SalesShare4GService.getTotalByParameter(startMonth,endMonth,page,pageSize);
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
			SalesShare4GService.updateByTargetVal(startMonth,endMonth,sgtzx,mbcs);
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
		Map<String,Object> ketDatas = SalesShare4GService.getKeyData();
		return ketDatas;
	}

	@DS("dataSource")@RequestMapping(value = "/getLastData")
	@ResponseBody
	public SalesShare4G getLastData(@RequestBody Map<String,Object> params) {
		String endMonth=(String) params.get("endMonth");
		List<SalesShare4G> salesShare4GS = SalesShare4GService.getLastData(endMonth);
		if(salesShare4GS != null && salesShare4GS.size() > 0){
			SalesShare4G SalesShare4G = salesShare4GS.get(0);
			return SalesShare4G;
		}
		return null;
	}

//	@DS("dataSource")@RequestMapping(value = "/getFormat")
//	@ResponseBody
//	public Map<String,Object> getFormat(Integer id) {
//		Map<String,Object> ketDatas = new HashMap<String,Object>();
//		SalesShare4G SalesShare4G = SalesShare4GService.selectByPrimaryKey(id);
//		Float sjjd = SalesShare4G.getSjjd();
//		Float f;
//		if(sjjd >= 0){
//			f = 100f;
//		}else {
//			f = (1 + sjjd) * 100;
//		}
//
//		StringBuffer stringBuffer = new StringBuffer();
//		if(SalesShare4G != null){
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
		SalesShare4G SalesShare4G = SalesShare4GService.selectByPrimaryKey(id);
		String currentMonth = SalesShare4G.getMonth();
		String teampMonth = currentMonth + "01";
		String currentMonthWcqkzb = SalesShare4G.getDyzb();
		Float lastMonthWcqkzb = SalesShare4GService.getLastMonthWcqkzb(teampMonth);
		if(lastMonthWcqkzb == null){
			lastMonthWcqkzb = 0f;
		}
		Float lastYearWcqkzb = SalesShare4GService.getLastYearWcqkzb(teampMonth);
		if(lastYearWcqkzb == null){
			lastYearWcqkzb = 0f;
		}
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("yf", currentMonth);
		result.put("currentMonthWcqkzb",Double.valueOf(currentMonthWcqkzb) * 100);
		result.put("lastMonthWcqkzb",lastMonthWcqkzb * 100);
		result.put("lastYearWcqkzb",lastYearWcqkzb * 100);
		return result;
	}
	
	private void updateData(List<SalesShare4G> list,String startMonth,String endMonth) {
		  for(SalesShare4G salesShare4G:list) {
			     Map<String,Object> params = new HashMap<String,Object>();
					String sgtzx = (String) params.get("sgtzx");
					String mbcs = (String) params.get("mbcs");
					SalesShare4GService.updateByTargetVal(startMonth,endMonth,sgtzx,mbcs);
			
		  }
		
	}
	
	
}

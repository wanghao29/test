package com.asiainfo.cmc.controller.provinceKpi.mobileCorporationCollaboration;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.IncomePhoneBrand;
import com.asiainfo.cmc.enties.TerminalSaleShare;
import com.asiainfo.cmc.service.impl.TerminalSaleShareService;
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
@RequestMapping(value = "/corporationCollaboration/terminalSaleShare")
public class terminalSaleShareController {
	private static final Logger logger = LoggerFactory.getLogger(terminalSaleShareController.class);
	@Resource
	private TerminalSaleShareService terminalSaleShareService;

	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model, HttpServletRequest request,String special,String billcyc) {
		logger.info("customerChannel  {}.", locale);
		request.getSession().setAttribute("special",special);
		model.addAttribute("special", special );
		request.getSession().setAttribute("billcyc",billcyc);
		model.addAttribute("billcyc", billcyc );
		return "mobileCorporationCollaboration/terminal_sale_share";
	}

	@DS("dataSource")@RequestMapping(value = "/list")
	@ResponseBody
	public PageInfo list(@RequestBody Map<String,Object> params) {
//		Map<String,Object> data = new HashMap<String,Object>();
		Integer page = (Integer) params.get("page");
		Integer pageSize = (Integer) params.get("pageSize");
		String startMonth = (String) params.get("startMonth");
		String endMonth = (String) params.get("endMonth");
		List<TerminalSaleShare> list = terminalSaleShareService.selectByParameter(startMonth,endMonth,page,pageSize);
		updateData(list);
		list = terminalSaleShareService.selectByParameter(startMonth,endMonth,page,pageSize);
		Integer totalCount = terminalSaleShareService.getTotalByParameter(startMonth,endMonth,page,pageSize);
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
	public Map<String, Object> update(@RequestBody TerminalSaleShare terminalSaleShare) {
		Map<String,Object> result = new HashMap<String,Object>();
		try {
			terminalSaleShareService.updateByPrimaryKeySelective(terminalSaleShare);
			result.put("code",0);
		}catch (Exception e){
			e.printStackTrace();
			result.put("code",1);
		}
		return result;
	}

	@DS("dataSource")@RequestMapping(value = "/updateByPrimaryKey")
	@ResponseBody
	public Map<String, Object> updateByPrimaryKey(@RequestBody TerminalSaleShare terminalSaleShare) {
		Map<String,Object> result = new HashMap<String,Object>();
		try {
			terminalSaleShareService.updateByPrimaryKey(terminalSaleShare);
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
		TerminalSaleShare lastTerminalSaleShare = ((List<TerminalSaleShare>) terminalSaleShareService.getLastData(endMonth)).get(0);
		List<TerminalSaleShare> TerminalSaleShares = terminalSaleShareService.getEchartData(startMonth,endMonth);
		List<String> months = new ArrayList<String>();
		List<String> xlzbs = new ArrayList<String>();
		if(TerminalSaleShares != null && TerminalSaleShares.size() > 0){
			for(TerminalSaleShare TerminalSaleShare : TerminalSaleShares){
				months.add(TerminalSaleShare.getMonth());
				xlzbs.add(TerminalSaleShare.getXlzb());
			}
		}
		data.put("months", months);
		data.put("qnwcsrs", xlzbs);
		data.put("lastData",lastTerminalSaleShare);
		return data;
	}
	
	private void updateData(List<TerminalSaleShare> list) {
		  for(TerminalSaleShare terminalSaleShare:list) {
				terminalSaleShareService.updateByPrimaryKeySelective(terminalSaleShare);
				terminalSaleShareService.updateByPrimaryKey(terminalSaleShare);
		  }
		
	}
	
}

package com.asiainfo.cmc.controller.provinceKpi.terminalSales;

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
import org.springframework.web.servlet.ModelAndView;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.TerminalSales;
import com.asiainfo.cmc.service.impl.TerminalSalesService;
import com.asiainfo.cmc.utils.PageInfo;

@Controller
@RequestMapping(value = "/terminalSales/terminalSales")
public class terminalSalesController {
	private static final Logger logger = LoggerFactory.getLogger(terminalSalesController.class);
	@Resource
	private TerminalSalesService terminalSalesService;

	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model, HttpServletRequest request,String special,String billcyc) {
		logger.info("customerChannel  {}.", locale);
		request.getSession().setAttribute("special",special);
		model.addAttribute("special", special );
		request.getSession().setAttribute("billcyc",billcyc);
		model.addAttribute("billcyc", billcyc );
		return "terminalSales/terminal_sales";
	}

	@DS("dataSource")@RequestMapping(value = "/getDialog")
	public ModelAndView getDialog(String limit) {
		ModelAndView modelAndView = new ModelAndView("/home");
		modelAndView.addObject("a","a");
		return modelAndView;
	}

	@DS("dataSource")@RequestMapping(value = "/list")
	@ResponseBody
	public PageInfo list(@RequestBody Map<String,Object> params) {
//		Map<String,Object> data = new HashMap<String,Object>();
		Integer page = (Integer) params.get("page");
		Integer pageSize = (Integer) params.get("pageSize");
		String startMonth = (String) params.get("startMonth");
		String endMonth = (String) params.get("endMonth");
		List<TerminalSales> list = terminalSalesService.selectByParameter(startMonth,endMonth,page,pageSize);
		 updateData( list,  startMonth,  endMonth);
		 list = terminalSalesService.selectByParameter(startMonth,endMonth,page,pageSize);
		Integer totalCount = terminalSalesService.getTotalByParameter(startMonth,endMonth,page,pageSize);
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
			String startMonth = (String) params.get("month");
			String endMonth = (String) params.get("month");
			String mbz = (String) params.get("mbz");
			terminalSalesService.updateByTargetVal(startMonth,endMonth,mbz);
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
			terminalSalesService.update(params);
			terminalSalesService.updateByTargetVal(startMonth,endMonth,mbz);
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
		TerminalSales lastTerminalSales = ((List<TerminalSales>) terminalSalesService.getLastData(endMonth)).get(0);
		List<TerminalSales> terminalSaless = terminalSalesService.getEchartData(startMonth,endMonth);
		List<String> months = new ArrayList<String>();
		List<String> bykhxl = new ArrayList<String>();
		List<String> bysrwcl = new ArrayList<String>();
		if(terminalSaless != null && terminalSaless.size() > 0){
			for(TerminalSales terminalSales : terminalSaless){
				months.add(terminalSales.getMonth());
				bykhxl.add(terminalSales.getBykhxl());
				bysrwcl.add(String.valueOf(Double.valueOf(terminalSales.getBysrwcl())*100));// 
			}
		}
		data.put("months", months);
		data.put("bykhxl", bykhxl);
		data.put("bysrwcl", bysrwcl);
		data.put("lastData",lastTerminalSales);
		return data;
	}
	private void updateData(List<TerminalSales> list,String startMonth,String endMonth) {
		  for(TerminalSales terminalSales:list) {
			     Map<String,Object> params = new HashMap<String,Object>();
				String mbz = String.valueOf(terminalSales.getMbz());
				params.put("id", terminalSales.getId());
				params.put("hlwsj", terminalSales.getHlwsj());
				params.put("tzxl", terminalSales.getTzxl());
				terminalSalesService.update(params);
				terminalSalesService.updateByTargetVal(startMonth,endMonth,mbz);
		  }
		
	}
	
	
}

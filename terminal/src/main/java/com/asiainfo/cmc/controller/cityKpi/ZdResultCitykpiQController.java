/**
 * Copyright (C) 2018 Long Inc., All Rights Reserved.
 */
package com.asiainfo.cmc.controller.cityKpi;

import java.io.IOException;
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

import tk.mybatis.mapper.util.StringUtil;

import com.asiainfo.cmc.common.CommonResponse;
import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.ZdResultCitykpiCalc;
import com.asiainfo.cmc.enties.ZdResultCitykpiExtraQ;
import com.asiainfo.cmc.enties.ZdResultCitykpiQ;
import com.asiainfo.cmc.service.ZdResultCitykpiExtraQService;
import com.asiainfo.cmc.service.ZdResultCitykpiQService;

/**
 * @TODO
 * @author Long
 * @date 2018年9月14日下午2:12:48
 */
@Controller
@RequestMapping("/zdResultCitykpiQ")
public class ZdResultCitykpiQController {

	private static final Logger logger = LoggerFactory.getLogger(ZdResultCitykpiQController.class);
	
	@Resource
	private ZdResultCitykpiQService zdResultCitykpiQService;
	
	@Resource
	private ZdResultCitykpiExtraQService zdResultCitykpiExtraQService;
	
	/**
	 * 首页
	 * @param locale
	 * @param model
	 * @return
	 */
	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);
		model.addAttribute("special", "cityKpi");
		return "cityKpi/zdResultCitykpiQIndex";
	}
	
	/**
	 * 列表数据
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/list", method = RequestMethod.POST)
	public Map<String,List<Map<String,Object>>> list(HttpServletRequest request,HttpServletResponse response) throws IOException {
			 
		String year = request.getParameter("year");
		String quarter = request.getParameter("quarter");
		
		if(StringUtil.isEmpty(year)){
			Map<String, List<Map<String, Object>>> map = new HashMap<String, List<Map<String, Object>>>();
			return map;
		}
		
		List<ZdResultCitykpiQ> objList = zdResultCitykpiQService.findAllByParam(year, quarter);
		if(objList == null || objList.size() <=0){
			logger.info("no data.");
			return null;
		}
		
		Map<String, List<Map<String, Object>>> map = zdResultCitykpiQService.constructKpi(objList);
		return zdResultCitykpiQService.handleExtra(map,year,quarter);
	}
	
	/**
	 * 保存
	 * @param zdKpiImptProdt
	 * @param oper
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/save", method = RequestMethod.POST)
	public CommonResponse edit(@RequestBody Map<String,Object> paramMap) throws IOException {
		
		logger.debug("paramMap: "+paramMap);
		
		try {
			List<ZdResultCitykpiQ> list = zdResultCitykpiQService.parseParam(paramMap);
			for(ZdResultCitykpiQ obj : list){
				zdResultCitykpiQService.updateByPrimaryKeySelective(obj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return CommonResponse.getSuccessRes();
	}
	
	/**
	 * 清算结果集界面
	 * @param locale
	 * @param model
	 * @return
	 */
	@DS("dataSource")@RequestMapping(value = "/calcResultIndex", method = RequestMethod.GET)
	public String calcResultIndex(Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);	 
		model.addAttribute("special", "cityKpi");
		return "cityKpi/calcResultIndex";
	}
	
	/**
	 * 清算结果数据列表
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/calcResultList", method = RequestMethod.POST)
	public List<ZdResultCitykpiCalc> calcResultList(HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		String year = request.getParameter("year");
		String quarter = request.getParameter("quarter");
		
		List<ZdResultCitykpiQ> objList = zdResultCitykpiQService.findAllByParam(year, quarter);
		if(objList == null || objList.size() <=0){
			logger.info("no data.");
			return null;
		}
		
		Map<String,List<Map<String,Object>>> map = zdResultCitykpiQService.constructKpi(objList);
		
		List<ZdResultCitykpiCalc> dataList = zdResultCitykpiQService.constructCalcResult(map.get("list"));
		
		List<ZdResultCitykpiCalc> sumList = zdResultCitykpiQService.calcResultSum(dataList);
		
		return zdResultCitykpiQService.calcResultRank(sumList);
	}
	
	/**
	 * 重点产品销量明细界面
	 * @param locale
	 * @param model
	 * @return
	 */
	@DS("dataSource")@RequestMapping(value = "/extraIndex", method = RequestMethod.GET)
	public String zdcpxlIndex(Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);	 
		return "cityKpi/extraIndex";
	}
	
	/**
	 * 重点产品销量明细列表数据
	 * @param request
	 * @param response
	 * @param record
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/extraList", method = RequestMethod.POST)
	public List<ZdResultCitykpiExtraQ> zdcpxlList(HttpServletRequest request,HttpServletResponse response, 
			@RequestBody ZdResultCitykpiExtraQ record) throws IOException {

		return zdResultCitykpiExtraQService.findAllByParam(record);
	}
	
}



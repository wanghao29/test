/**
 * Copyright (C) 2018 Long Inc., All Rights Reserved.
 */
package com.asiainfo.cmc.controller.cityKpi;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.util.StringUtils;
import com.asiainfo.cmc.common.CommonResponse;
import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.ZdKpiImptProdt;
import com.asiainfo.cmc.service.ZdKpiImptProdtService;

/**
 * @TODO
 * @author Long
 * @date 2018年9月14日下午2:12:48
 */
@Controller
@RequestMapping("/zdKpiImptProdt")
public class ZdKpiImptProdtController {

	private static final Logger logger = LoggerFactory.getLogger(ZdKpiImptProdtController.class);
	
	@Resource
	private ZdKpiImptProdtService zdKpiImptProdtService;
	
	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);	 
		model.addAttribute("special", "cityKpi");
		return "cityKpi/zdKpiImptProdtIndex";
	}
	
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/list", method = RequestMethod.POST)
	public List<ZdKpiImptProdt> list(HttpServletRequest request,HttpServletResponse response) throws IOException {
			 
		String year = request.getParameter("year");
		String quarter = request.getParameter("quarter");
		
		return zdKpiImptProdtService.findAllByParam(year, quarter);
	}
	
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/save", method = RequestMethod.POST)
	public CommonResponse edit(ZdKpiImptProdt zdKpiImptProdt, String oper) throws IOException {
		
		if(StringUtils.isEmpty(oper)){
			logger.error("param oper can not be null or empty.");
			return CommonResponse.getFailureRes();
		}
		
		int rows = 0;
		if("edit".equals(oper)){
			rows = zdKpiImptProdtService.updateByPrimaryKeySelective(zdKpiImptProdt);
		}else if("add".equals(oper)){
			rows = zdKpiImptProdtService.insert(zdKpiImptProdt);
		}
		
		if(rows == 1){
			return CommonResponse.getSuccessRes();
		}else{
			return CommonResponse.getFailureRes();
		}
	}
	
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/del/{id}", method = RequestMethod.POST)
	public CommonResponse del(@PathVariable("id") int id) throws IOException {
		
		int rows = zdKpiImptProdtService.deleteByPrimaryKey(id);
		if(rows == 1){
			return CommonResponse.getSuccessRes();
		}else{
			return CommonResponse.getFailureRes();
		}
	}

	
	
}


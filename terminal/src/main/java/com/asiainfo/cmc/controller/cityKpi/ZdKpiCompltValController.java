/**
 * Copyright (C) 2018 Long Inc., All Rights Reserved.
 */
package com.asiainfo.cmc.controller.cityKpi;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tk.mybatis.mapper.util.StringUtil;

import com.alibaba.druid.util.StringUtils;
import com.asiainfo.cmc.common.CommonResponse;
import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.ZdKpiCompltVal;
import com.asiainfo.cmc.service.ZdKpiCompltValService;

/**
 * @TODO
 * @author Long
 * @date 2018年9月14日下午2:12:48
 */
@Controller
@RequestMapping("/zdKpiCompltVal")
public class ZdKpiCompltValController {

	private static final Logger logger = LoggerFactory.getLogger(ZdKpiCompltValController.class);
	
	@Resource
	private ZdKpiCompltValService zdKpiCompltValService;
	
	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);	 
		model.addAttribute("special", "cityKpi");
		return "cityKpi/zdKpiCompltValIndex";
	}
	
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/list", method = RequestMethod.POST)
	public List<ZdKpiCompltVal> list(HttpServletRequest request,HttpServletResponse response) throws IOException {
			 
		String year = request.getParameter("year");
		String quarter = request.getParameter("quarter");
		String city = request.getParameter("city");
		
		return zdKpiCompltValService.findAllByParam(year, quarter, city);
	}
	
	@ResponseBody
	@DS("dataSource")@RequestMapping(value="/upload", method = RequestMethod.POST)
	public String doSomeThing(@RequestParam("file") MultipartFile file) throws IOException {
		try{
			List<ZdKpiCompltVal> zdKpiCompltVals = new ArrayList<ZdKpiCompltVal>();
			InputStream is = null;
			try {
				is = file.getInputStream();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String files=file.getOriginalFilename();
			Workbook workbook = null;
			if(files.toLowerCase().endsWith("xlsx")){
				workbook=new XSSFWorkbook(is);
			}else if(files.toLowerCase().endsWith("xls")){
				workbook = new HSSFWorkbook(new POIFSFileSystem(is));
			}
			Sheet sheet = workbook.getSheetAt(0);
			
			for (Row r : sheet) {
				if(r.getRowNum()<1){
					continue;
				}
				int cellNum = r.getLastCellNum();
				if(cellNum<1) {					
					break;
				}
				
				for(int num=0;num<cellNum;num++){
					r.getCell(num).setCellType(Cell.CELL_TYPE_STRING);
				}
				
				ZdKpiCompltVal zdKpiCompltVal = new ZdKpiCompltVal();
				String year = r.getCell(0).getStringCellValue();
				String quarter = r.getCell(1).getStringCellValue();
				String city = r.getCell(2).getStringCellValue();
				BigDecimal account = strToBig(r.getCell(3).getStringCellValue());
				BigDecimal account_in180 = strToBig(r.getCell(4).getStringCellValue());
				BigDecimal proportion_in180 = strToBig(r.getCell(5).getStringCellValue());
				BigDecimal score_in180 = strToBig(r.getCell(6).getStringCellValue());
				BigDecimal account_out180 = strToBig(r.getCell(7).getStringCellValue());
				BigDecimal proportion_out180 = strToBig(r.getCell(8).getStringCellValue());
				BigDecimal score_out180 = strToBig(r.getCell(9).getStringCellValue());
				BigDecimal score = strToBig(r.getCell(10).getStringCellValue());
				BigDecimal retail_sales = strToBig(r.getCell(11).getStringCellValue());
				BigDecimal retail_pretax_profits = strToBig(r.getCell(12).getStringCellValue());
				BigDecimal shop_score = strToBig(r.getCell(13).getStringCellValue());
				BigDecimal sale_profits = strToBig(r.getCell(14).getStringCellValue());
				BigDecimal hardware_gpr = strToBig(r.getCell(15).getStringCellValue());
				BigDecimal efct_cust_account = strToBig(r.getCell(16).getStringCellValue());
				
				zdKpiCompltVal.setYear(year);
				zdKpiCompltVal.setQuarter(quarter);
				zdKpiCompltVal.setCity(city);
				zdKpiCompltVal.setAccount(account);
				zdKpiCompltVal.setAccountIn180(account_in180);
				zdKpiCompltVal.setProportionIn180(proportion_in180);
				zdKpiCompltVal.setScoreIn180(score_in180);
				zdKpiCompltVal.setAccountOut180(account_out180);
				zdKpiCompltVal.setProportionOut180(proportion_out180);
				zdKpiCompltVal.setScoreOut180(score_out180);
				zdKpiCompltVal.setScore(score);
				zdKpiCompltVal.setRetailSales(retail_sales);
				zdKpiCompltVal.setRetailPretaxProfits(retail_pretax_profits);
				zdKpiCompltVal.setShopScore(shop_score);
				zdKpiCompltVal.setSaleProfits(sale_profits);
				zdKpiCompltVal.setHardwareGpr(hardware_gpr);
				zdKpiCompltVal.setEfctCustAccount(efct_cust_account);
				
				zdKpiCompltVals.add(zdKpiCompltVal);			    
	        }
			zdKpiCompltValService.insertSelective(zdKpiCompltVals);  
		}catch(Exception e) {
			e.printStackTrace();
			return "no";  
	    } 
	
		return "ok";
	}  
	
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/oper", method = RequestMethod.POST)
	public CommonResponse edit(ZdKpiCompltVal zdKpiCompltVal, String oper) throws IOException {
		
		if(StringUtils.isEmpty(oper)){
			logger.error("param oper can not be null or empty.");
			return CommonResponse.getFailureRes();
		}
		
		int rows = 0;
		if("edit".equals(oper)){
			rows = zdKpiCompltValService.updateByPrimaryKey(zdKpiCompltVal);
		}else if("add".equals(oper)){
			rows = zdKpiCompltValService.insert(zdKpiCompltVal);
		}else if("del".equals(oper)){
			rows = zdKpiCompltValService.deleteByPrimaryKey(zdKpiCompltVal.getId());
		}
		
		if(rows == 1){
			return CommonResponse.getSuccessRes();
		}else{
			return CommonResponse.getFailureRes();
		}
	}
	
	public BigDecimal strToBig(String str){
		String strTrim = str.trim(); 
		strTrim = "-".equalsIgnoreCase(strTrim) || StringUtil.isEmpty(strTrim)?"0":strTrim;
		return new BigDecimal(strTrim);		
	}
	
	
}

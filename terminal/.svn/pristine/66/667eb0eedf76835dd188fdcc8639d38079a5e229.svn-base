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
import com.asiainfo.cmc.enties.ZdKpiGoalVal;
import com.asiainfo.cmc.service.ZdKpiGoalValService;

/**
 * @TODO
 * @author Long
 * @date 2018年9月14日下午2:12:48
 */
@Controller
@RequestMapping("/zdKpiGoalVal")
public class ZdKpiGoalValController {

	private static final Logger logger = LoggerFactory.getLogger(ZdKpiGoalValController.class);
	
	@Resource
	private ZdKpiGoalValService zdKpiGoalValService;
	
	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);	 
		model.addAttribute("special", "cityKpi");
		return "cityKpi/zdKpiGoalValIndex";
	}
	
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/list", method = RequestMethod.POST)
	public List<ZdKpiGoalVal> list(HttpServletRequest request,HttpServletResponse response) throws IOException {
			 
		String year = request.getParameter("year");
		String quarter = request.getParameter("quarter");
		String city = request.getParameter("city");
		
		return zdKpiGoalValService.findAllByParam(year, quarter, city);
	}
	
	@ResponseBody
	@DS("dataSource")@RequestMapping(value="/upload", method = RequestMethod.POST)
	public String doSomeThing(@RequestParam("file") MultipartFile file) throws IOException {
		try{
			List<ZdKpiGoalVal> zdKpiGoalVals = new ArrayList<ZdKpiGoalVal>();
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
				
				ZdKpiGoalVal zdKpiGoalVal = new ZdKpiGoalVal();
				zdKpiGoalVal.setOperationCenter(r.getCell(0).getStringCellValue());
				zdKpiGoalVal.setCity(r.getCell(1).getStringCellValue());				
				zdKpiGoalVal.setQuarter(r.getCell(3).getStringCellValue());
				zdKpiGoalVal.setYear(r.getCell(2).getStringCellValue());

				String yearCount = r.getCell(4).getStringCellValue();
				zdKpiGoalVal.setYearCount(strToBig(yearCount));
				zdKpiGoalVal.setQcBaseGoal(strToBig(r.getCell(5).getStringCellValue()));
				zdKpiGoalVal.setQcUrgeGoal(strToBig(r.getCell(6).getStringCellValue()));
				zdKpiGoalVal.setQcSprintGoal(strToBig(r.getCell(7).getStringCellValue()));
				zdKpiGoalVal.setYearSales(strToBig(r.getCell(8).getStringCellValue()));
				zdKpiGoalVal.setQsBaseGoal(strToBig(r.getCell(9).getStringCellValue()));
				zdKpiGoalVal.setQsUrgeGoal(strToBig(r.getCell(10).getStringCellValue()));
				zdKpiGoalVal.setQsSprintGoal(strToBig(r.getCell(11).getStringCellValue()));
				zdKpiGoalVal.setYearHdwSales(strToBig(r.getCell(12).getStringCellValue()));
				zdKpiGoalVal.setQhsBaseGoal(strToBig(r.getCell(13).getStringCellValue()));
				zdKpiGoalVal.setQhsUrgeGoal(strToBig(r.getCell(14).getStringCellValue()));
				zdKpiGoalVal.setQhsSprintGoal(strToBig(r.getCell(15).getStringCellValue()));
				zdKpiGoalVal.setYmbmSales(strToBig(r.getCell(16).getStringCellValue()));
				zdKpiGoalVal.setQmbmSales(strToBig(r.getCell(17).getStringCellValue()));
				zdKpiGoalVal.setYmbhSales(strToBig(r.getCell(18).getStringCellValue()));
				zdKpiGoalVal.setQmbhSales(strToBig(r.getCell(19).getStringCellValue()));
				zdKpiGoalVal.setYmbnhSales(strToBig(r.getCell(20).getStringCellValue()));
				zdKpiGoalVal.setQmbnhBaseGoal(strToBig(r.getCell(21).getStringCellValue()));
				zdKpiGoalVal.setQmbnhUrgeGoal(strToBig(r.getCell(22).getStringCellValue()));
				zdKpiGoalVal.setQmbnhSprintGoal(strToBig(r.getCell(23).getStringCellValue()));
				zdKpiGoalVal.setActCustGoal(strToBig(r.getCell(24).getStringCellValue()));
				zdKpiGoalVal.setQActCustGoal(strToBig(r.getCell(25).getStringCellValue()));
				zdKpiGoalVal.setKaCustSales(strToBig(r.getCell(26).getStringCellValue()));
				zdKpiGoalVal.setQKaCustSales(strToBig(r.getCell(27).getStringCellValue()));
				zdKpiGoalVal.setMsActCustCount(strToBig(r.getCell(28).getStringCellValue()));
				zdKpiGoalVal.setQMsActCustCount(strToBig(r.getCell(29).getStringCellValue()));
				zdKpiGoalVal.setRetailDchnSales(strToBig(r.getCell(30).getStringCellValue()));
				zdKpiGoalVal.setQRetailDchnSales(strToBig(r.getCell(31).getStringCellValue()));
				zdKpiGoalVal.setRetailDchnProfits(strToBig(r.getCell(32).getStringCellValue()));
				zdKpiGoalVal.setQRetailDchnProfits(strToBig(r.getCell(33).getStringCellValue()));
				zdKpiGoalVal.setAftSaleProfits(strToBig(r.getCell(34).getStringCellValue()));
				zdKpiGoalVal.setQAftSaleProfits(strToBig(r.getCell(35).getStringCellValue()));
				zdKpiGoalVal.setEfctCustDedtScore(strToBig(r.getCell(36).getStringCellValue()));
				zdKpiGoalVal.setQEfctCustDedtScore(strToBig(r.getCell(37).getStringCellValue()));				

				zdKpiGoalVals.add(zdKpiGoalVal);				
	        }
		    
			zdKpiGoalValService.insertSelective(zdKpiGoalVals);  
		}catch(Exception e) {
			e.printStackTrace();
			return "no";  
	    } 
	
		return "ok";
	
	} 
	
	
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/oper", method = RequestMethod.POST)
	public CommonResponse edit(ZdKpiGoalVal zdKpiGoalVal, String oper) throws IOException {
		
		if(StringUtils.isEmpty(oper)){
			logger.error("param oper can not be null or empty.");
			return CommonResponse.getFailureRes();
		}
		
		int rows = 0;
		if("edit".equals(oper)){
			rows = zdKpiGoalValService.updateByPrimaryKey(zdKpiGoalVal);
		}else if("add".equals(oper)){
			rows = zdKpiGoalValService.insert(zdKpiGoalVal);
		}else if("del".equals(oper)){
			rows = zdKpiGoalValService.deleteByPrimaryKey(zdKpiGoalVal.getId());
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

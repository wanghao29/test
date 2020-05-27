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

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.CityKpi2019;

import com.asiainfo.cmc.service.CityKpi2019Service;




/** 
* @author 作者 Your-Name:wanghao 
* @version 创建时间：2019年4月11日 下午3:43:34 
* 
*/
@Controller
@RequestMapping("/zdResultCitykpi2019")
public class ZdResultCitykpi2019Controller {

	@Resource
	private CityKpi2019Service cityKpi2019Service;
	
	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		//logger.info("customerChannel  {}.", locale);
		model.addAttribute("special", "cityKpi2019");
		return "cityKpi/zdCitykpi2019";
	}	
	
	@ResponseBody
	@DS("dataSource")@RequestMapping(value="/upload", method = RequestMethod.POST)
	public String doSomeThing( MultipartFile file,HttpServletRequest request, HttpServletResponse response) throws IOException {
		String spare = request.getParameter("tName");
	//	System.out.println(spare);
		System.err.println("========================="+file.getOriginalFilename());
		
		List<CityKpi2019> zdKpiGoalVals = new ArrayList<CityKpi2019>();
		//首先判断导入的数据是否已经存在
		
		
		
		
		
		//System.out.println("--------------------------------------------------"+month);
		InputStream is = null;
		try {
			//is = new FileInputStream(file.getOriginalFilename());
			is=file.getInputStream();
		
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String	files=file.getOriginalFilename();
		
		//工作薄
		Workbook workbook = null;
		if(files.toLowerCase().endsWith("xlsx")){
			workbook=new XSSFWorkbook(is);
		}else if(files.toLowerCase().endsWith("xls")){
			workbook = new HSSFWorkbook(new POIFSFileSystem(is));
		}
		
	       try {
	       
	    	 //获取Excel文档中的第一个表单
	   		Sheet sheet = workbook.getSheetAt(0);
	   		//获取行数
	   		@SuppressWarnings("unused")
			int rows= sheet.getLastRowNum();//最后一行的序号  总的行数为  （rows+1）
	   		//PrintWriter writer = response.getWriter();
	   		//对Sheet中的每一行进行迭代
	           @SuppressWarnings("unused")
			String tt="0";
	   		for (Row r : sheet) {
	   			rows ++;
	   			// 跳过标题行
	   			if(r.getRowNum()<2){
	   			continue;
	   			}// 跳过标题行
	   			//获取每行的列数
	   			int cellNum = r.getLastCellNum();//---获取的是最后一列的序号
	   			if(cellNum<1) {
	   				
	   				break;
	   			}
	@SuppressWarnings("unused")
	String row=r.toString();
	r.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(5).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(6).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(7).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(8).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(9).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(10).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(11).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(12).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(13).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(14).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(15).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(16).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(17).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(18).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(19).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(20).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(21).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(22).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(23).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(24).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(25).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(26).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(27).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(28).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(29).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(30).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(31).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(32).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(33).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(34).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(35).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(36).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(37).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(38).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(39).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(40).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(41).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(42).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(43).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(44).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(45).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(46).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(47).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(48).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(49).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(50).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(51).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(52).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(53).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(54).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(55).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(56).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(57).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(58).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(59).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(60).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(61).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(62).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(63).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(64).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(65).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(66).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(67).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(68).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(69).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(70).setCellType(Cell.CELL_TYPE_STRING);
	r.getCell(71).setCellType(Cell.CELL_TYPE_STRING);
	//r.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
	CityKpi2019 zdKpiGoalVal = new CityKpi2019();
	zdKpiGoalVal.setSpare(spare);
	zdKpiGoalVal.setCenter(r.getCell(0).getStringCellValue());//运营中心
	zdKpiGoalVal.setCity(r.getCell(1).getStringCellValue());//地市				
	zdKpiGoalVal.setRate1(r.getCell(2).getStringCellValue());//直接毛利率季度指标
	zdKpiGoalVal.setRateDown(r.getCell(3).getStringCellValue());//直接毛利率完成
	zdKpiGoalVal.setRateRatio(r.getCell(4).getStringCellValue());//直接毛利率完成比率	
	zdKpiGoalVal.setRateScore((r.getCell(5).getStringCellValue()));//直接毛利率得分
	zdKpiGoalVal.setNetprofit((r.getCell(6).getStringCellValue()));//直接净利率季度指标
	zdKpiGoalVal.setProfitDown((r.getCell(7).getStringCellValue()));//直接净利率完成
	zdKpiGoalVal.setProfitRate((r.getCell(8).getStringCellValue()));//直接净利率完成比率
	zdKpiGoalVal.setProfitScore((r.getCell(9).getStringCellValue()));//直接净利率得分
	zdKpiGoalVal.setBusinessFull((r.getCell(10).getStringCellValue()));//运营收入全年指标
	zdKpiGoalVal.setBusiness1((r.getCell(11).getStringCellValue()));//运营收入-1-3月累计完成
	zdKpiGoalVal.setBusinessTimeDown((r.getCell(12).getStringCellValue()));//运营收入-时间进度完成率	
	zdKpiGoalVal.setBusinessProgress((r.getCell(13).getStringCellValue()));//运营收入-时间进度
	zdKpiGoalVal.setBusinessQuarter((r.getCell(14).getStringCellValue()));//运营收入-1季度指标（万元）
	zdKpiGoalVal.setBusinessDown((r.getCell(15).getStringCellValue()));//运营收入-完成（万元）
	zdKpiGoalVal.setBusinessScore((r.getCell(16).getStringCellValue()));//运营收入-得分
	zdKpiGoalVal.setBrandselfYear((r.getCell(17).getStringCellValue()));//自有品牌手机收入-全年指标
	zdKpiGoalVal.setBrandselfDown1((r.getCell(18).getStringCellValue()));//自有品牌手机收入-1-3月累计完成
	zdKpiGoalVal.setBrandselfTimeRate((r.getCell(19).getStringCellValue()));//自有品牌手机收入-时间进度完成率
	zdKpiGoalVal.setBrandselfMobileD((r.getCell(20).getStringCellValue()));//自有品牌手机收入-时间进度
	zdKpiGoalVal.setBrandselfQuarter((r.getCell(21).getStringCellValue()));//自有品牌手机收入-1季度指标（万元）
	zdKpiGoalVal.setBrandselfMobileD((r.getCell(22).getStringCellValue()));//自有品牌手机收入-完成（万元）
	zdKpiGoalVal.setBrandselfScore((r.getCell(23).getStringCellValue()));//自有品牌手机收入-得分
	zdKpiGoalVal.setHardwardYear((r.getCell(24).getStringCellValue()));//自有品牌智能硬件收入-全年指标（万元）
	zdKpiGoalVal.setHardwardMonth((r.getCell(25).getStringCellValue()));//自有品牌智能硬件收入-1-3月累计完成
	zdKpiGoalVal.setHardwardIncomeD((r.getCell(26).getStringCellValue()));//自有品牌智能硬件收入-时间进度完成率
	zdKpiGoalVal.setHardwardIncome((r.getCell(27).getStringCellValue()));//自有品牌智能硬件收入-时间进度
	zdKpiGoalVal.setHardwardQuarter((r.getCell(28).getStringCellValue()));//自有品牌智能硬件收入-1季度指标（万元）
	zdKpiGoalVal.setHardwardD((r.getCell(29).getStringCellValue()));//自有品牌智能硬件收入-完成（万元）
	zdKpiGoalVal.setHardwardScore((r.getCell(30).getStringCellValue()));//自有品牌智能硬件收入-得分
	zdKpiGoalVal.setNotGroupIncome((r.getCell(31).getStringCellValue()));//非集团集采类别自有品牌智能硬件收入-全年指标（万元）
	zdKpiGoalVal.setNotGroupHard1((r.getCell(32).getStringCellValue()));//非集团集采类别自有品牌智能硬件收入-1-3月累计完成
	zdKpiGoalVal.setNotGroupTime((r.getCell(33).getStringCellValue()));//非集团集采类别自有品牌智能硬件收入-时间进度完成率
	zdKpiGoalVal.setNotGroupIncomeD((r.getCell(34).getStringCellValue()));//非集团集采类别自有品牌智能硬件收入-时间进度
	zdKpiGoalVal.setNotGroupQuarter((r.getCell(35).getStringCellValue()));//非集团集采类别自有品牌智能硬件收入-1季度指标（万元）
	zdKpiGoalVal.setNotGroupTimeD((r.getCell(36).getStringCellValue()));//非集团集采类别自有品牌智能硬件收入-完成（万元）
	zdKpiGoalVal.setNotGroupScore((r.getCell(37).getStringCellValue()));//非集团集采类别自有品牌智能硬件收入-得分				
	zdKpiGoalVal.setKeyNot((r.getCell(38).getStringCellValue()));//重点产品
	zdKpiGoalVal.setKeyNotScore((r.getCell(39).getStringCellValue()));//重点产品得分		
	zdKpiGoalVal.setQualityYear((r.getCell(40).getStringCellValue()));//优质客户目标值-全年目标值（个）		
	zdKpiGoalVal.setQualityQuarter((r.getCell(41).getStringCellValue()));//优质客户目标值-1季度指标		
	zdKpiGoalVal.setQualityQuarterD((r.getCell(42).getStringCellValue()));//优质客户目标值-1季度完成		
	zdKpiGoalVal.setQualityQuarterR((r.getCell(43).getStringCellValue()));//优质客户目标值-1季度完成率		
	zdKpiGoalVal.setQualityScore((r.getCell(44).getStringCellValue()));//优质客户目标值-1季度得分		
	zdKpiGoalVal.setkAcustomerY((r.getCell(45).getStringCellValue()));//KA客户手机销量目标值-全年目标值（台）		
	zdKpiGoalVal.setkAcustomerQuarter((r.getCell(46).getStringCellValue()));//KA客户手机销量目标值-1季度指标		
	zdKpiGoalVal.setkAcustomerQuarterD((r.getCell(47).getStringCellValue()));//KA客户手机销量目标值-1季度完成		
	zdKpiGoalVal.setkAcustomerRate((r.getCell(48).getStringCellValue()));//KA客户手机销量目标值-1季度完成率		
	zdKpiGoalVal.setkAcustomerScore((r.getCell(49).getStringCellValue()));//KA客户手机销量目标值-1季度得分		
	zdKpiGoalVal.setTieTongYear((r.getCell(50).getStringCellValue()));//铁通终端销量-全年（万台）		
	zdKpiGoalVal.setTieTongQuarter((r.getCell(51).getStringCellValue()));//铁通终端销量-1季度（万台）		
	zdKpiGoalVal.setTieTongQuarterD((r.getCell(52).getStringCellValue()));//铁通终端销量-1季度完成		
	zdKpiGoalVal.setTieTongScore((r.getCell(53).getStringCellValue()));//铁通终端销量-1季度得分
	zdKpiGoalVal.setSellRetail((r.getCell(54).getStringCellValue()));//新零售厅店建设-厅店（个）
	zdKpiGoalVal.setSellRetailScore((r.getCell(55).getStringCellValue()));//新零售厅店建设-得分
	zdKpiGoalVal.setAfterSaleYear((r.getCell(56).getStringCellValue()));//售后净利率-年度指标
	zdKpiGoalVal.setAfterSaleQuarter((r.getCell(57).getStringCellValue()));//售后净利率-1季度指标
	zdKpiGoalVal.setAfterSaleD((r.getCell(58).getStringCellValue()));//售后净利率-1季度完成
	zdKpiGoalVal.setAfterSaleScore((r.getCell(59).getStringCellValue()));//售后净利率-1季度得分
	zdKpiGoalVal.setDirectRate((r.getCell(60).getStringCellValue()));//直接净利率-值
	zdKpiGoalVal.setDirectRateScore((r.getCell(61).getStringCellValue()));//直接净利率-1季度得分
	zdKpiGoalVal.setThreeMonth((r.getCell(62).getStringCellValue()));//三个月以上应收账款占比-值
	zdKpiGoalVal.setThreeMonthQuarter((r.getCell(63).getStringCellValue()));//三个月以上应收账款占比-1季度得分
	zdKpiGoalVal.setMajorScore((r.getCell(64).getStringCellValue()));//重大事项扣分项-值
	zdKpiGoalVal.setKpiSumScore1((r.getCell(65).getStringCellValue()));//kpi直接总分（加总）-值
	zdKpiGoalVal.setKpiQuarter1((r.getCell(66).getStringCellValue()));//1季度重点系数A（权重50%):自主品牌手机收入指标/万元-值
	zdKpiGoalVal.setKpiRateD((r.getCell(67).getStringCellValue()));//1季度重点系数A完成率-值
	zdKpiGoalVal.setKpiGoal((r.getCell(68).getStringCellValue()));//1季度重点系数B（权重50%):智能音箱发展目标/万台-值
	zdKpiGoalVal.setKpiCompelete((r.getCell(69).getStringCellValue()));//1季度重点系数B完成率-值
	zdKpiGoalVal.setKpiCompeleteRate((r.getCell(70).getStringCellValue()));//完成率加总-值
	zdKpiGoalVal.setKpiSumScore((r.getCell(71).getStringCellValue()));//考虑重点系数后的KPI总分-值			
				
				zdKpiGoalVals.add(zdKpiGoalVal);				
	   		} 
	   		List<CityKpi2019> list = cityKpi2019Service.selectAll(spare);
	   		
			if(list.isEmpty()) {
				cityKpi2019Service.insertSelective(zdKpiGoalVals); 
				
			}else if(!list.isEmpty()){
				
				//cityKpi2019Service.updateSelective(zdKpiGoalVals);	
				 return "update";  
			}
			
			}catch(Exception e) {
           return "no";  
	       
	       }   
      
	     return "ok";
	   }
	
		
	
	
	/**
	 * 
	 * @param locale
	 * @param model
	 * @param request
	 * @param response
	 * 查询所有kpi数据进行数据封装显示到页面
	 */
	
	@DS("dataSource")@RequestMapping(value="/allList", method = {RequestMethod.GET,RequestMethod.POST})
	public String index(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
	
	        String spare = request.getParameter("quarter");
	       // System.out.println(parameter);
		List<CityKpi2019> list = cityKpi2019Service.selectAll(spare);
	    model.addAttribute("special", "cityKpi2019");
	    if(list.isEmpty() && spare.equals("1")) {
			return "cityKpi/zdCitykpi2019";
		}
	    if(list.isEmpty() && spare.equals("2")) {
			return "cityKpi/zdCitykpi2019_02";
		}else {
		for (CityKpi2019 cityKpi2019 : list) {
			//处理百分号数据显示的问题
			String rate1 = cityKpi2019.getRate1();
			if(!rate1.equals("")&&rate1!=null) {
			float float1 = Float.parseFloat(rate1);
			float tt=float1*100;
			String mm=tt+""+"%";
			cityKpi2019.setRate1(mm);
			}
			String rate2 = cityKpi2019.getNetprofit();
			if(!rate2.equals("")&&rate2!=null) {
			float float1 = Float.parseFloat(rate2);
			float tt=float1*100;
			String mm=tt+""+"%";
			cityKpi2019.setNetprofit(mm);
			}
			String afterSaleQuarter = cityKpi2019.getAfterSaleQuarter();
			if(!afterSaleQuarter.equals("")&&afterSaleQuarter!=null) {
				float float1 = Float.parseFloat(afterSaleQuarter);
				float tt=float1*100;
				String mm=tt+""+"%";
				cityKpi2019.setAfterSaleQuarter(mm);
				}
			
			
		if(cityKpi2019.getCenter().equals("广州运营中心")) {
			if(cityKpi2019.getCity().equals("广州")) {
				float gz=0;
				
				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
				String profitScore = cityKpi2019.getProfitScore();//直接净利率
				String businessScore = cityKpi2019.getBusinessScore();//运营收入
				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
				String majorScore = cityKpi2019.getMajorScore();//重大事项
				if(!scoreRate.equals("")) {
					float float1 = Float.parseFloat(scoreRate);	
					gz=gz+float1;
				}
				if(!profitScore.equals("")) {
					float float1 = Float.parseFloat(profitScore);	
					gz=gz+float1;
				}
				if(!businessScore.equals("")) {
					float float1 = Float.parseFloat(businessScore);	
					gz=gz+float1;
				}
				if(!brandselfScore.equals("")) {
					float float1 = Float.parseFloat(brandselfScore);	
					gz=gz+float1;
				}
				if(!hardwardScore.equals("")) {
					float float1 = Float.parseFloat(hardwardScore);	
					gz=gz+float1;
				}
				if(!notGroupScore.equals("")) {
					float float1 = Float.parseFloat(notGroupScore);	
					gz=gz+float1;
				}
				if(!keyNotScore.equals("")) {
					float float1 = Float.parseFloat(keyNotScore);	
					gz=gz+float1;
				}
				if(!keyNotScore1.equals("")) {
					float float1 = Float.parseFloat(keyNotScore1);	
					gz=gz+float1;
				}
				if(!qualityScore.equals("")) {
					float float1 = Float.parseFloat(qualityScore);	
					gz=gz+float1;
				}
				if(!getkAcustomerScore.equals("")) {
					float float1 = Float.parseFloat(getkAcustomerScore);	
					gz=gz+float1;
				}
				if(!tieTongScore.equals("")) {
					float float1 = Float.parseFloat(tieTongScore);	
					gz=gz+float1;
				}
				if(!sellRetailScore.equals("")) {
					float float1 = Float.parseFloat(sellRetailScore);	
					gz=gz+float1;
				}
				if(!afterSaleScore.equals("")) {
					float float1 = Float.parseFloat(afterSaleScore);	
					gz=gz+float1;
				}
				if(!directRateScore.equals("")) {
					float float1 = Float.parseFloat(directRateScore);	
					gz=gz+float1;
				}
				if(!threeMonthQuarter.equals("")) {
					float float1 = Float.parseFloat(threeMonthQuarter);	
					gz=gz+float1;
				}
				if(!majorScore.equals("")) {
					float float1 = Float.parseFloat(majorScore);	
					gz=gz+float1;
				}
				 
			      float  b   =  (float)(Math.round(gz*100))/100;
				model.addAttribute("GZscore", b);	
				
				model.addAttribute("GZgzDte", cityKpi2019);	
				
			}		
            if(cityKpi2019.getCity().equals("肇庆")) {
	             float gz=0;
				
				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
				String profitScore = cityKpi2019.getProfitScore();//直接净利率
				String businessScore = cityKpi2019.getBusinessScore();//运营收入
				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
				String majorScore = cityKpi2019.getMajorScore();//重大事项
				if(!scoreRate.equals("")) {
					float float1 = Float.parseFloat(scoreRate);	
					gz=gz+float1;
				}
				if(!profitScore.equals("")) {
					float float1 = Float.parseFloat(profitScore);	
					gz=gz+float1;
				}
				if(!businessScore.equals("")) {
					float float1 = Float.parseFloat(businessScore);	
					gz=gz+float1;
				}
				if(!brandselfScore.equals("")) {
					float float1 = Float.parseFloat(brandselfScore);	
					gz=gz+float1;
				}
				if(!hardwardScore.equals("")) {
					float float1 = Float.parseFloat(hardwardScore);	
					gz=gz+float1;
				}
				if(!notGroupScore.equals("")) {
					float float1 = Float.parseFloat(notGroupScore);	
					gz=gz+float1;
				}
				if(!keyNotScore.equals("")) {
					float float1 = Float.parseFloat(keyNotScore);	
					gz=gz+float1;
				}
				if(!keyNotScore1.equals("")) {
					float float1 = Float.parseFloat(keyNotScore1);	
					gz=gz+float1;
				}
				if(!qualityScore.equals("")) {
					float float1 = Float.parseFloat(qualityScore);	
					gz=gz+float1;
				}
				if(!getkAcustomerScore.equals("")) {
					float float1 = Float.parseFloat(getkAcustomerScore);	
					gz=gz+float1;
				}
				if(!tieTongScore.equals("")) {
					float float1 = Float.parseFloat(tieTongScore);	
					gz=gz+float1;
				}
				if(!sellRetailScore.equals("")) {
					float float1 = Float.parseFloat(sellRetailScore);	
					gz=gz+float1;
				}
				if(!afterSaleScore.equals("")) {
					float float1 = Float.parseFloat(afterSaleScore);	
					gz=gz+float1;
				}
				if(!directRateScore.equals("")) {
					float float1 = Float.parseFloat(directRateScore);	
					gz=gz+float1;
				}
				if(!threeMonthQuarter.equals("")) {
					float float1 = Float.parseFloat(threeMonthQuarter);	
					gz=gz+float1;
				}
				if(!majorScore.equals("")) {
					float float1 = Float.parseFloat(majorScore);	
					gz=gz+float1;
				}
				 
			      float  b   =  (float)(Math.round(gz*100))/100;
				model.addAttribute("ZQscore", b);
				model.addAttribute("GZzqDte", cityKpi2019);	
			}		
             if(cityKpi2019.getCity().equals("清远")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("QYscore", b);
				model.addAttribute("GZqyDte", cityKpi2019);	
			}		
             if(cityKpi2019.getCity().equals("韶关")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("SGscore", b);
 				model.addAttribute("GZsgDte", cityKpi2019);	
 			}
             if(cityKpi2019.getCity().equals("云浮")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("YFscore", b);
 				model.addAttribute("GZyfDte", cityKpi2019);	
 			}		
             if(cityKpi2019.getCity().equals("合计1")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("HJscore", b);
 				model.addAttribute("GZhj1Dte", cityKpi2019);	
 			}		
		
		}	
		if(cityKpi2019.getCenter().equals("深圳运营中心")) {
			if(cityKpi2019.getCity().equals("深圳")) {
	float gz=0;
				
				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
				String profitScore = cityKpi2019.getProfitScore();//直接净利率
				String businessScore = cityKpi2019.getBusinessScore();//运营收入
				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
				String majorScore = cityKpi2019.getMajorScore();//重大事项
				if(!scoreRate.equals("")) {
					float float1 = Float.parseFloat(scoreRate);	
					gz=gz+float1;
				}
				if(!profitScore.equals("")) {
					float float1 = Float.parseFloat(profitScore);	
					gz=gz+float1;
				}
				if(!businessScore.equals("")) {
					float float1 = Float.parseFloat(businessScore);	
					gz=gz+float1;
				}
				if(!brandselfScore.equals("")) {
					float float1 = Float.parseFloat(brandselfScore);	
					gz=gz+float1;
				}
				if(!hardwardScore.equals("")) {
					float float1 = Float.parseFloat(hardwardScore);	
					gz=gz+float1;
				}
				if(!notGroupScore.equals("")) {
					float float1 = Float.parseFloat(notGroupScore);	
					gz=gz+float1;
				}
				if(!keyNotScore.equals("")) {
					float float1 = Float.parseFloat(keyNotScore);	
					gz=gz+float1;
				}
				if(!keyNotScore1.equals("")) {
					float float1 = Float.parseFloat(keyNotScore1);	
					gz=gz+float1;
				}
				if(!qualityScore.equals("")) {
					float float1 = Float.parseFloat(qualityScore);	
					gz=gz+float1;
				}
				if(!getkAcustomerScore.equals("")) {
					float float1 = Float.parseFloat(getkAcustomerScore);	
					gz=gz+float1;
				}
				if(!tieTongScore.equals("")) {
					float float1 = Float.parseFloat(tieTongScore);	
					gz=gz+float1;
				}
				if(!sellRetailScore.equals("")) {
					float float1 = Float.parseFloat(sellRetailScore);	
					gz=gz+float1;
				}
				if(!afterSaleScore.equals("")) {
					float float1 = Float.parseFloat(afterSaleScore);	
					gz=gz+float1;
				}
				if(!directRateScore.equals("")) {
					float float1 = Float.parseFloat(directRateScore);	
					gz=gz+float1;
				}
				if(!threeMonthQuarter.equals("")) {
					float float1 = Float.parseFloat(threeMonthQuarter);	
					gz=gz+float1;
				}
				if(!majorScore.equals("")) {
					float float1 = Float.parseFloat(majorScore);	
					gz=gz+float1;
				}
				 
			      float  b   =  (float)(Math.round(gz*100))/100;
				model.addAttribute("SZscore", b);
				model.addAttribute("SZszDte", cityKpi2019);	
			}		
            if(cityKpi2019.getCity().equals("汕头")) {
	float gz=0;
				
				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
				String profitScore = cityKpi2019.getProfitScore();//直接净利率
				String businessScore = cityKpi2019.getBusinessScore();//运营收入
				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
				String majorScore = cityKpi2019.getMajorScore();//重大事项
				if(!scoreRate.equals("")) {
					float float1 = Float.parseFloat(scoreRate);	
					gz=gz+float1;
				}
				if(!profitScore.equals("")) {
					float float1 = Float.parseFloat(profitScore);	
					gz=gz+float1;
				}
				if(!businessScore.equals("")) {
					float float1 = Float.parseFloat(businessScore);	
					gz=gz+float1;
				}
				if(!brandselfScore.equals("")) {
					float float1 = Float.parseFloat(brandselfScore);	
					gz=gz+float1;
				}
				if(!hardwardScore.equals("")) {
					float float1 = Float.parseFloat(hardwardScore);	
					gz=gz+float1;
				}
				if(!notGroupScore.equals("")) {
					float float1 = Float.parseFloat(notGroupScore);	
					gz=gz+float1;
				}
				if(!keyNotScore.equals("")) {
					float float1 = Float.parseFloat(keyNotScore);	
					gz=gz+float1;
				}
				if(!keyNotScore1.equals("")) {
					float float1 = Float.parseFloat(keyNotScore1);	
					gz=gz+float1;
				}
				if(!qualityScore.equals("")) {
					float float1 = Float.parseFloat(qualityScore);	
					gz=gz+float1;
				}
				if(!getkAcustomerScore.equals("")) {
					float float1 = Float.parseFloat(getkAcustomerScore);	
					gz=gz+float1;
				}
				if(!tieTongScore.equals("")) {
					float float1 = Float.parseFloat(tieTongScore);	
					gz=gz+float1;
				}
				if(!sellRetailScore.equals("")) {
					float float1 = Float.parseFloat(sellRetailScore);	
					gz=gz+float1;
				}
				if(!afterSaleScore.equals("")) {
					float float1 = Float.parseFloat(afterSaleScore);	
					gz=gz+float1;
				}
				if(!directRateScore.equals("")) {
					float float1 = Float.parseFloat(directRateScore);	
					gz=gz+float1;
				}
				if(!threeMonthQuarter.equals("")) {
					float float1 = Float.parseFloat(threeMonthQuarter);	
					gz=gz+float1;
				}
				if(!majorScore.equals("")) {
					float float1 = Float.parseFloat(majorScore);	
					gz=gz+float1;
				}
				 
			      float  b   =  (float)(Math.round(gz*100))/100;
				model.addAttribute("STscore", b);
				model.addAttribute("SZstDte", cityKpi2019);	
			}		
             if(cityKpi2019.getCity().equals("揭阳")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("JYscore", b);
				model.addAttribute("SZjyDte", cityKpi2019);	
			}		
             if(cityKpi2019.getCity().equals("梅州")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("MZscore", b);
 				model.addAttribute("SZmzDte", cityKpi2019);	
 			}
             if(cityKpi2019.getCity().equals("潮州")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("CZscore", b);
 				model.addAttribute("SZczDte", cityKpi2019);	
 			}		
             if(cityKpi2019.getCity().equals("汕尾")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("SWscore", b);
 				model.addAttribute("SZswDte", cityKpi2019);	
 			}		
             if(cityKpi2019.getCity().equals("合计2")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("HJ2score", b);
  				model.addAttribute("SZhj2Dte", cityKpi2019);	
  			}		
             
		}
			
		if(cityKpi2019.getCenter().equals("佛山运营中心")) {
			if(cityKpi2019.getCity().equals("佛山")) {
	float gz=0;
				
				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
				String profitScore = cityKpi2019.getProfitScore();//直接净利率
				String businessScore = cityKpi2019.getBusinessScore();//运营收入
				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
				String majorScore = cityKpi2019.getMajorScore();//重大事项
				if(!scoreRate.equals("")) {
					float float1 = Float.parseFloat(scoreRate);	
					gz=gz+float1;
				}
				if(!profitScore.equals("")) {
					float float1 = Float.parseFloat(profitScore);	
					gz=gz+float1;
				}
				if(!businessScore.equals("")) {
					float float1 = Float.parseFloat(businessScore);	
					gz=gz+float1;
				}
				if(!brandselfScore.equals("")) {
					float float1 = Float.parseFloat(brandselfScore);	
					gz=gz+float1;
				}
				if(!hardwardScore.equals("")) {
					float float1 = Float.parseFloat(hardwardScore);	
					gz=gz+float1;
				}
				if(!notGroupScore.equals("")) {
					float float1 = Float.parseFloat(notGroupScore);	
					gz=gz+float1;
				}
				if(!keyNotScore.equals("")) {
					float float1 = Float.parseFloat(keyNotScore);	
					gz=gz+float1;
				}
				if(!keyNotScore1.equals("")) {
					float float1 = Float.parseFloat(keyNotScore1);	
					gz=gz+float1;
				}
				if(!qualityScore.equals("")) {
					float float1 = Float.parseFloat(qualityScore);	
					gz=gz+float1;
				}
				if(!getkAcustomerScore.equals("")) {
					float float1 = Float.parseFloat(getkAcustomerScore);	
					gz=gz+float1;
				}
				if(!tieTongScore.equals("")) {
					float float1 = Float.parseFloat(tieTongScore);	
					gz=gz+float1;
				}
				if(!sellRetailScore.equals("")) {
					float float1 = Float.parseFloat(sellRetailScore);	
					gz=gz+float1;
				}
				if(!afterSaleScore.equals("")) {
					float float1 = Float.parseFloat(afterSaleScore);	
					gz=gz+float1;
				}
				if(!directRateScore.equals("")) {
					float float1 = Float.parseFloat(directRateScore);	
					gz=gz+float1;
				}
				if(!threeMonthQuarter.equals("")) {
					float float1 = Float.parseFloat(threeMonthQuarter);	
					gz=gz+float1;
				}
				if(!majorScore.equals("")) {
					float float1 = Float.parseFloat(majorScore);	
					gz=gz+float1;
				}
				 
			      float  b   =  (float)(Math.round(gz*100))/100;
				model.addAttribute("FSscore", b);
				model.addAttribute("FSfsDte", cityKpi2019);	
			}		
            if(cityKpi2019.getCity().equals("江门")) {
	float gz=0;
				
				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
				String profitScore = cityKpi2019.getProfitScore();//直接净利率
				String businessScore = cityKpi2019.getBusinessScore();//运营收入
				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
				String majorScore = cityKpi2019.getMajorScore();//重大事项
				if(!scoreRate.equals("")) {
					float float1 = Float.parseFloat(scoreRate);	
					gz=gz+float1;
				}
				if(!profitScore.equals("")) {
					float float1 = Float.parseFloat(profitScore);	
					gz=gz+float1;
				}
				if(!businessScore.equals("")) {
					float float1 = Float.parseFloat(businessScore);	
					gz=gz+float1;
				}
				if(!brandselfScore.equals("")) {
					float float1 = Float.parseFloat(brandselfScore);	
					gz=gz+float1;
				}
				if(!hardwardScore.equals("")) {
					float float1 = Float.parseFloat(hardwardScore);	
					gz=gz+float1;
				}
				if(!notGroupScore.equals("")) {
					float float1 = Float.parseFloat(notGroupScore);	
					gz=gz+float1;
				}
				if(!keyNotScore.equals("")) {
					float float1 = Float.parseFloat(keyNotScore);	
					gz=gz+float1;
				}
				if(!keyNotScore1.equals("")) {
					float float1 = Float.parseFloat(keyNotScore1);	
					gz=gz+float1;
				}
				if(!qualityScore.equals("")) {
					float float1 = Float.parseFloat(qualityScore);	
					gz=gz+float1;
				}
				if(!getkAcustomerScore.equals("")) {
					float float1 = Float.parseFloat(getkAcustomerScore);	
					gz=gz+float1;
				}
				if(!tieTongScore.equals("")) {
					float float1 = Float.parseFloat(tieTongScore);	
					gz=gz+float1;
				}
				if(!sellRetailScore.equals("")) {
					float float1 = Float.parseFloat(sellRetailScore);	
					gz=gz+float1;
				}
				if(!afterSaleScore.equals("")) {
					float float1 = Float.parseFloat(afterSaleScore);	
					gz=gz+float1;
				}
				if(!directRateScore.equals("")) {
					float float1 = Float.parseFloat(directRateScore);	
					gz=gz+float1;
				}
				if(!threeMonthQuarter.equals("")) {
					float float1 = Float.parseFloat(threeMonthQuarter);	
					gz=gz+float1;
				}
				if(!majorScore.equals("")) {
					float float1 = Float.parseFloat(majorScore);	
					gz=gz+float1;
				}
				 
			      float  b   =  (float)(Math.round(gz*100))/100;
				model.addAttribute("JMscore", b);
				model.addAttribute("FSjmDte", cityKpi2019);	
			}		
             if(cityKpi2019.getCity().equals("湛江")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("ZZscore", b);
				model.addAttribute("FSzzDte", cityKpi2019);	
			}		
             if(cityKpi2019.getCity().equals("茂名")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("MMscore", b);
 				model.addAttribute("FSmmDte", cityKpi2019);	
 			}
             if(cityKpi2019.getCity().equals("阳江")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("YJscore", b);
 				model.addAttribute("FSyjDte", cityKpi2019);	
 			}		
             if(cityKpi2019.getCity().equals("合计4")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("HJ4score", b);
 				model.addAttribute("FShj4Dte", cityKpi2019);	
 			}		
		
		}
		if(cityKpi2019.getCenter().equals("东莞运营中心")) {
			if(cityKpi2019.getCity().equals("东莞")) {
	float gz=0;
				
				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
				String profitScore = cityKpi2019.getProfitScore();//直接净利率
				String businessScore = cityKpi2019.getBusinessScore();//运营收入
				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
				String majorScore = cityKpi2019.getMajorScore();//重大事项
				if(!scoreRate.equals("")) {
					float float1 = Float.parseFloat(scoreRate);	
					gz=gz+float1;
				}
				if(!profitScore.equals("")) {
					float float1 = Float.parseFloat(profitScore);	
					gz=gz+float1;
				}
				if(!businessScore.equals("")) {
					float float1 = Float.parseFloat(businessScore);	
					gz=gz+float1;
				}
				if(!brandselfScore.equals("")) {
					float float1 = Float.parseFloat(brandselfScore);	
					gz=gz+float1;
				}
				if(!hardwardScore.equals("")) {
					float float1 = Float.parseFloat(hardwardScore);	
					gz=gz+float1;
				}
				if(!notGroupScore.equals("")) {
					float float1 = Float.parseFloat(notGroupScore);	
					gz=gz+float1;
				}
				if(!keyNotScore.equals("")) {
					float float1 = Float.parseFloat(keyNotScore);	
					gz=gz+float1;
				}
				if(!keyNotScore1.equals("")) {
					float float1 = Float.parseFloat(keyNotScore1);	
					gz=gz+float1;
				}
				if(!qualityScore.equals("")) {
					float float1 = Float.parseFloat(qualityScore);	
					gz=gz+float1;
				}
				if(!getkAcustomerScore.equals("")) {
					float float1 = Float.parseFloat(getkAcustomerScore);	
					gz=gz+float1;
				}
				if(!tieTongScore.equals("")) {
					float float1 = Float.parseFloat(tieTongScore);	
					gz=gz+float1;
				}
				if(!sellRetailScore.equals("")) {
					float float1 = Float.parseFloat(sellRetailScore);	
					gz=gz+float1;
				}
				if(!afterSaleScore.equals("")) {
					float float1 = Float.parseFloat(afterSaleScore);	
					gz=gz+float1;
				}
				if(!directRateScore.equals("")) {
					float float1 = Float.parseFloat(directRateScore);	
					gz=gz+float1;
				}
				if(!threeMonthQuarter.equals("")) {
					float float1 = Float.parseFloat(threeMonthQuarter);	
					gz=gz+float1;
				}
				if(!majorScore.equals("")) {
					float float1 = Float.parseFloat(majorScore);	
					gz=gz+float1;
				}
				 
			      float  b   =  (float)(Math.round(gz*100))/100;
				model.addAttribute("DGscore", b);
				model.addAttribute("DGdgDte", cityKpi2019);	
			}		
            if(cityKpi2019.getCity().equals("中山")) {
	float gz=0;
				
				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
				String profitScore = cityKpi2019.getProfitScore();//直接净利率
				String businessScore = cityKpi2019.getBusinessScore();//运营收入
				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
				String majorScore = cityKpi2019.getMajorScore();//重大事项
				if(!scoreRate.equals("")) {
					float float1 = Float.parseFloat(scoreRate);	
					gz=gz+float1;
				}
				if(!profitScore.equals("")) {
					float float1 = Float.parseFloat(profitScore);	
					gz=gz+float1;
				}
				if(!businessScore.equals("")) {
					float float1 = Float.parseFloat(businessScore);	
					gz=gz+float1;
				}
				if(!brandselfScore.equals("")) {
					float float1 = Float.parseFloat(brandselfScore);	
					gz=gz+float1;
				}
				if(!hardwardScore.equals("")) {
					float float1 = Float.parseFloat(hardwardScore);	
					gz=gz+float1;
				}
				if(!notGroupScore.equals("")) {
					float float1 = Float.parseFloat(notGroupScore);	
					gz=gz+float1;
				}
				if(!keyNotScore.equals("")) {
					float float1 = Float.parseFloat(keyNotScore);	
					gz=gz+float1;
				}
				if(!keyNotScore1.equals("")) {
					float float1 = Float.parseFloat(keyNotScore1);	
					gz=gz+float1;
				}
				if(!qualityScore.equals("")) {
					float float1 = Float.parseFloat(qualityScore);	
					gz=gz+float1;
				}
				if(!getkAcustomerScore.equals("")) {
					float float1 = Float.parseFloat(getkAcustomerScore);	
					gz=gz+float1;
				}
				if(!tieTongScore.equals("")) {
					float float1 = Float.parseFloat(tieTongScore);	
					gz=gz+float1;
				}
				if(!sellRetailScore.equals("")) {
					float float1 = Float.parseFloat(sellRetailScore);	
					gz=gz+float1;
				}
				if(!afterSaleScore.equals("")) {
					float float1 = Float.parseFloat(afterSaleScore);	
					gz=gz+float1;
				}
				if(!directRateScore.equals("")) {
					float float1 = Float.parseFloat(directRateScore);	
					gz=gz+float1;
				}
				if(!threeMonthQuarter.equals("")) {
					float float1 = Float.parseFloat(threeMonthQuarter);	
					gz=gz+float1;
				}
				if(!majorScore.equals("")) {
					float float1 = Float.parseFloat(majorScore);	
					gz=gz+float1;
				}
				 
			      float  b   =  (float)(Math.round(gz*100))/100;
				model.addAttribute("ZSscore", b);
				model.addAttribute("DGzsDte", cityKpi2019);	
			}		
             if(cityKpi2019.getCity().equals("惠州")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("HZscore", b);
				model.addAttribute("DGhzDte", cityKpi2019);	
			}		
             if(cityKpi2019.getCity().equals("珠海")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("ZHscore", b);
 				model.addAttribute("DGzhDte", cityKpi2019);	
 			}
             if(cityKpi2019.getCity().equals("河源")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("HYscore", b);
 				model.addAttribute("DGhyDte", cityKpi2019);	
 			}		
             if(cityKpi2019.getCity().equals("合计3")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("HJ3score", b);
 				model.addAttribute("DGhj3Dte", cityKpi2019);	
 			}		
		
		}
			
		if(cityKpi2019.getCenter().equals("分值")) {
			if(cityKpi2019.getCity().equals("分值")) {
				
				model.addAttribute("score", cityKpi2019);	
			}		
           
		
		}
		
		if(cityKpi2019.getCenter().equals("全省")) {
			if(cityKpi2019.getCity().equals("全省合计")) {
				
				model.addAttribute("cityAll", cityKpi2019);	
			}		
           
		
		}
		
		
			
		    }
		
	}
		
		
		
		
	
	
		
		
		
		return "cityKpi/zdCitykpi2019";
		
	}
	
	
	
	@DS("dataSource")@RequestMapping(value="/allList02", method = {RequestMethod.GET,RequestMethod.POST})
	public String index02(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
	
	        String spare = request.getParameter("quarter");
	       // System.out.println(parameter);
		List<CityKpi2019> list = cityKpi2019Service.selectAll(spare);
	    model.addAttribute("special", "cityKpi2019");
	    if(list.isEmpty() && spare.equals("1")) {
			return "cityKpi/zdCitykpi2019";
		}
	    if(list.isEmpty() && spare.equals("2")) {
			return "cityKpi/zdCitykpi2019_02";
		}
		
		else {
		for (CityKpi2019 cityKpi2019 : list) {
			//处理百分号数据显示的问题
			String rate1 = cityKpi2019.getRate1();
			if(!rate1.equals("")&&rate1!=null) {
			float float1 = Float.parseFloat(rate1);
			float tt=float1*100;
			String mm=tt+""+"%";
			cityKpi2019.setRate1(mm);
			}
			String rate2 = cityKpi2019.getNetprofit();
			if(!rate2.equals("")&&rate2!=null) {
			float float1 = Float.parseFloat(rate2);
			float tt=float1*100;
			String mm=tt+""+"%";
			cityKpi2019.setNetprofit(mm);
			}
			String afterSaleQuarter = cityKpi2019.getAfterSaleQuarter();
			if(!afterSaleQuarter.equals("")&&afterSaleQuarter!=null) {
				float float1 = Float.parseFloat(afterSaleQuarter);
				float tt=float1*100;
				String mm=tt+""+"%";
				cityKpi2019.setAfterSaleQuarter(mm);
				}
			
			
		if(cityKpi2019.getCenter().equals("广州运营中心")) {
			if(cityKpi2019.getCity().equals("广州")) {
				float gz=0;
				
				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
				String profitScore = cityKpi2019.getProfitScore();//直接净利率
				String businessScore = cityKpi2019.getBusinessScore();//运营收入
				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
				String majorScore = cityKpi2019.getMajorScore();//重大事项
				if(!scoreRate.equals("")) {
					float float1 = Float.parseFloat(scoreRate);	
					gz=gz+float1;
				}
				if(!profitScore.equals("")) {
					float float1 = Float.parseFloat(profitScore);	
					gz=gz+float1;
				}
				if(!businessScore.equals("")) {
					float float1 = Float.parseFloat(businessScore);	
					gz=gz+float1;
				}
				if(!brandselfScore.equals("")) {
					float float1 = Float.parseFloat(brandselfScore);	
					gz=gz+float1;
				}
				if(!hardwardScore.equals("")) {
					float float1 = Float.parseFloat(hardwardScore);	
					gz=gz+float1;
				}
				if(!notGroupScore.equals("")) {
					float float1 = Float.parseFloat(notGroupScore);	
					gz=gz+float1;
				}
				if(!keyNotScore.equals("")) {
					float float1 = Float.parseFloat(keyNotScore);	
					gz=gz+float1;
				}
				if(!keyNotScore1.equals("")) {
					float float1 = Float.parseFloat(keyNotScore1);	
					gz=gz+float1;
				}
				if(!qualityScore.equals("")) {
					float float1 = Float.parseFloat(qualityScore);	
					gz=gz+float1;
				}
				if(!getkAcustomerScore.equals("")) {
					float float1 = Float.parseFloat(getkAcustomerScore);	
					gz=gz+float1;
				}
				if(!tieTongScore.equals("")) {
					float float1 = Float.parseFloat(tieTongScore);	
					gz=gz+float1;
				}
				if(!sellRetailScore.equals("")) {
					float float1 = Float.parseFloat(sellRetailScore);	
					gz=gz+float1;
				}
				if(!afterSaleScore.equals("")) {
					float float1 = Float.parseFloat(afterSaleScore);	
					gz=gz+float1;
				}
				if(!directRateScore.equals("")) {
					float float1 = Float.parseFloat(directRateScore);	
					gz=gz+float1;
				}
				if(!threeMonthQuarter.equals("")) {
					float float1 = Float.parseFloat(threeMonthQuarter);	
					gz=gz+float1;
				}
				if(!majorScore.equals("")) {
					float float1 = Float.parseFloat(majorScore);	
					gz=gz+float1;
				}
				 
			      float  b   =  (float)(Math.round(gz*100))/100;
				model.addAttribute("GZscore", b);	
				
				model.addAttribute("GZgzDte", cityKpi2019);	
				
			}		
            if(cityKpi2019.getCity().equals("肇庆")) {
	             float gz=0;
				
				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
				String profitScore = cityKpi2019.getProfitScore();//直接净利率
				String businessScore = cityKpi2019.getBusinessScore();//运营收入
				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
				String majorScore = cityKpi2019.getMajorScore();//重大事项
				if(!scoreRate.equals("")) {
					float float1 = Float.parseFloat(scoreRate);	
					gz=gz+float1;
				}
				if(!profitScore.equals("")) {
					float float1 = Float.parseFloat(profitScore);	
					gz=gz+float1;
				}
				if(!businessScore.equals("")) {
					float float1 = Float.parseFloat(businessScore);	
					gz=gz+float1;
				}
				if(!brandselfScore.equals("")) {
					float float1 = Float.parseFloat(brandselfScore);	
					gz=gz+float1;
				}
				if(!hardwardScore.equals("")) {
					float float1 = Float.parseFloat(hardwardScore);	
					gz=gz+float1;
				}
				if(!notGroupScore.equals("")) {
					float float1 = Float.parseFloat(notGroupScore);	
					gz=gz+float1;
				}
				if(!keyNotScore.equals("")) {
					float float1 = Float.parseFloat(keyNotScore);	
					gz=gz+float1;
				}
				if(!keyNotScore1.equals("")) {
					float float1 = Float.parseFloat(keyNotScore1);	
					gz=gz+float1;
				}
				if(!qualityScore.equals("")) {
					float float1 = Float.parseFloat(qualityScore);	
					gz=gz+float1;
				}
				if(!getkAcustomerScore.equals("")) {
					float float1 = Float.parseFloat(getkAcustomerScore);	
					gz=gz+float1;
				}
				if(!tieTongScore.equals("")) {
					float float1 = Float.parseFloat(tieTongScore);	
					gz=gz+float1;
				}
				if(!sellRetailScore.equals("")) {
					float float1 = Float.parseFloat(sellRetailScore);	
					gz=gz+float1;
				}
				if(!afterSaleScore.equals("")) {
					float float1 = Float.parseFloat(afterSaleScore);	
					gz=gz+float1;
				}
				if(!directRateScore.equals("")) {
					float float1 = Float.parseFloat(directRateScore);	
					gz=gz+float1;
				}
				if(!threeMonthQuarter.equals("")) {
					float float1 = Float.parseFloat(threeMonthQuarter);	
					gz=gz+float1;
				}
				if(!majorScore.equals("")) {
					float float1 = Float.parseFloat(majorScore);	
					gz=gz+float1;
				}
				 
			      float  b   =  (float)(Math.round(gz*100))/100;
				model.addAttribute("ZQscore", b);
				model.addAttribute("GZzqDte", cityKpi2019);	
			}		
             if(cityKpi2019.getCity().equals("清远")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("QYscore", b);
				model.addAttribute("GZqyDte", cityKpi2019);	
			}		
             if(cityKpi2019.getCity().equals("韶关")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("SGscore", b);
 				model.addAttribute("GZsgDte", cityKpi2019);	
 			}
             if(cityKpi2019.getCity().equals("云浮")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("YFscore", b);
 				model.addAttribute("GZyfDte", cityKpi2019);	
 			}		
             if(cityKpi2019.getCity().equals("合计1")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("HJscore", b);
 				model.addAttribute("GZhj1Dte", cityKpi2019);	
 			}		
		
		}	
		if(cityKpi2019.getCenter().equals("深圳运营中心")) {
			if(cityKpi2019.getCity().equals("深圳")) {
	float gz=0;
				
				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
				String profitScore = cityKpi2019.getProfitScore();//直接净利率
				String businessScore = cityKpi2019.getBusinessScore();//运营收入
				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
				String majorScore = cityKpi2019.getMajorScore();//重大事项
				if(!scoreRate.equals("")) {
					float float1 = Float.parseFloat(scoreRate);	
					gz=gz+float1;
				}
				if(!profitScore.equals("")) {
					float float1 = Float.parseFloat(profitScore);	
					gz=gz+float1;
				}
				if(!businessScore.equals("")) {
					float float1 = Float.parseFloat(businessScore);	
					gz=gz+float1;
				}
				if(!brandselfScore.equals("")) {
					float float1 = Float.parseFloat(brandselfScore);	
					gz=gz+float1;
				}
				if(!hardwardScore.equals("")) {
					float float1 = Float.parseFloat(hardwardScore);	
					gz=gz+float1;
				}
				if(!notGroupScore.equals("")) {
					float float1 = Float.parseFloat(notGroupScore);	
					gz=gz+float1;
				}
				if(!keyNotScore.equals("")) {
					float float1 = Float.parseFloat(keyNotScore);	
					gz=gz+float1;
				}
				if(!keyNotScore1.equals("")) {
					float float1 = Float.parseFloat(keyNotScore1);	
					gz=gz+float1;
				}
				if(!qualityScore.equals("")) {
					float float1 = Float.parseFloat(qualityScore);	
					gz=gz+float1;
				}
				if(!getkAcustomerScore.equals("")) {
					float float1 = Float.parseFloat(getkAcustomerScore);	
					gz=gz+float1;
				}
				if(!tieTongScore.equals("")) {
					float float1 = Float.parseFloat(tieTongScore);	
					gz=gz+float1;
				}
				if(!sellRetailScore.equals("")) {
					float float1 = Float.parseFloat(sellRetailScore);	
					gz=gz+float1;
				}
				if(!afterSaleScore.equals("")) {
					float float1 = Float.parseFloat(afterSaleScore);	
					gz=gz+float1;
				}
				if(!directRateScore.equals("")) {
					float float1 = Float.parseFloat(directRateScore);	
					gz=gz+float1;
				}
				if(!threeMonthQuarter.equals("")) {
					float float1 = Float.parseFloat(threeMonthQuarter);	
					gz=gz+float1;
				}
				if(!majorScore.equals("")) {
					float float1 = Float.parseFloat(majorScore);	
					gz=gz+float1;
				}
				 
			      float  b   =  (float)(Math.round(gz*100))/100;
				model.addAttribute("SZscore", b);
				model.addAttribute("SZszDte", cityKpi2019);	
			}		
            if(cityKpi2019.getCity().equals("汕头")) {
	float gz=0;
				
				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
				String profitScore = cityKpi2019.getProfitScore();//直接净利率
				String businessScore = cityKpi2019.getBusinessScore();//运营收入
				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
				String majorScore = cityKpi2019.getMajorScore();//重大事项
				if(!scoreRate.equals("")) {
					float float1 = Float.parseFloat(scoreRate);	
					gz=gz+float1;
				}
				if(!profitScore.equals("")) {
					float float1 = Float.parseFloat(profitScore);	
					gz=gz+float1;
				}
				if(!businessScore.equals("")) {
					float float1 = Float.parseFloat(businessScore);	
					gz=gz+float1;
				}
				if(!brandselfScore.equals("")) {
					float float1 = Float.parseFloat(brandselfScore);	
					gz=gz+float1;
				}
				if(!hardwardScore.equals("")) {
					float float1 = Float.parseFloat(hardwardScore);	
					gz=gz+float1;
				}
				if(!notGroupScore.equals("")) {
					float float1 = Float.parseFloat(notGroupScore);	
					gz=gz+float1;
				}
				if(!keyNotScore.equals("")) {
					float float1 = Float.parseFloat(keyNotScore);	
					gz=gz+float1;
				}
				if(!keyNotScore1.equals("")) {
					float float1 = Float.parseFloat(keyNotScore1);	
					gz=gz+float1;
				}
				if(!qualityScore.equals("")) {
					float float1 = Float.parseFloat(qualityScore);	
					gz=gz+float1;
				}
				if(!getkAcustomerScore.equals("")) {
					float float1 = Float.parseFloat(getkAcustomerScore);	
					gz=gz+float1;
				}
				if(!tieTongScore.equals("")) {
					float float1 = Float.parseFloat(tieTongScore);	
					gz=gz+float1;
				}
				if(!sellRetailScore.equals("")) {
					float float1 = Float.parseFloat(sellRetailScore);	
					gz=gz+float1;
				}
				if(!afterSaleScore.equals("")) {
					float float1 = Float.parseFloat(afterSaleScore);	
					gz=gz+float1;
				}
				if(!directRateScore.equals("")) {
					float float1 = Float.parseFloat(directRateScore);	
					gz=gz+float1;
				}
				if(!threeMonthQuarter.equals("")) {
					float float1 = Float.parseFloat(threeMonthQuarter);	
					gz=gz+float1;
				}
				if(!majorScore.equals("")) {
					float float1 = Float.parseFloat(majorScore);	
					gz=gz+float1;
				}
				 
			      float  b   =  (float)(Math.round(gz*100))/100;
				model.addAttribute("STscore", b);
				model.addAttribute("SZstDte", cityKpi2019);	
			}		
             if(cityKpi2019.getCity().equals("揭阳")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("JYscore", b);
				model.addAttribute("SZjyDte", cityKpi2019);	
			}		
             if(cityKpi2019.getCity().equals("梅州")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("MZscore", b);
 				model.addAttribute("SZmzDte", cityKpi2019);	
 			}
             if(cityKpi2019.getCity().equals("潮州")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("CZscore", b);
 				model.addAttribute("SZczDte", cityKpi2019);	
 			}		
             if(cityKpi2019.getCity().equals("汕尾")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("SWscore", b);
 				model.addAttribute("SZswDte", cityKpi2019);	
 			}		
             if(cityKpi2019.getCity().equals("合计2")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("HJ2score", b);
  				model.addAttribute("SZhj2Dte", cityKpi2019);	
  			}		
             
		}
			
		if(cityKpi2019.getCenter().equals("佛山运营中心")) {
			if(cityKpi2019.getCity().equals("佛山")) {
	float gz=0;
				
				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
				String profitScore = cityKpi2019.getProfitScore();//直接净利率
				String businessScore = cityKpi2019.getBusinessScore();//运营收入
				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
				String majorScore = cityKpi2019.getMajorScore();//重大事项
				if(!scoreRate.equals("")) {
					float float1 = Float.parseFloat(scoreRate);	
					gz=gz+float1;
				}
				if(!profitScore.equals("")) {
					float float1 = Float.parseFloat(profitScore);	
					gz=gz+float1;
				}
				if(!businessScore.equals("")) {
					float float1 = Float.parseFloat(businessScore);	
					gz=gz+float1;
				}
				if(!brandselfScore.equals("")) {
					float float1 = Float.parseFloat(brandselfScore);	
					gz=gz+float1;
				}
				if(!hardwardScore.equals("")) {
					float float1 = Float.parseFloat(hardwardScore);	
					gz=gz+float1;
				}
				if(!notGroupScore.equals("")) {
					float float1 = Float.parseFloat(notGroupScore);	
					gz=gz+float1;
				}
				if(!keyNotScore.equals("")) {
					float float1 = Float.parseFloat(keyNotScore);	
					gz=gz+float1;
				}
				if(!keyNotScore1.equals("")) {
					float float1 = Float.parseFloat(keyNotScore1);	
					gz=gz+float1;
				}
				if(!qualityScore.equals("")) {
					float float1 = Float.parseFloat(qualityScore);	
					gz=gz+float1;
				}
				if(!getkAcustomerScore.equals("")) {
					float float1 = Float.parseFloat(getkAcustomerScore);	
					gz=gz+float1;
				}
				if(!tieTongScore.equals("")) {
					float float1 = Float.parseFloat(tieTongScore);	
					gz=gz+float1;
				}
				if(!sellRetailScore.equals("")) {
					float float1 = Float.parseFloat(sellRetailScore);	
					gz=gz+float1;
				}
				if(!afterSaleScore.equals("")) {
					float float1 = Float.parseFloat(afterSaleScore);	
					gz=gz+float1;
				}
				if(!directRateScore.equals("")) {
					float float1 = Float.parseFloat(directRateScore);	
					gz=gz+float1;
				}
				if(!threeMonthQuarter.equals("")) {
					float float1 = Float.parseFloat(threeMonthQuarter);	
					gz=gz+float1;
				}
				if(!majorScore.equals("")) {
					float float1 = Float.parseFloat(majorScore);	
					gz=gz+float1;
				}
				 
			      float  b   =  (float)(Math.round(gz*100))/100;
				model.addAttribute("FSscore", b);
				model.addAttribute("FSfsDte", cityKpi2019);	
			}		
            if(cityKpi2019.getCity().equals("江门")) {
	float gz=0;
				
				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
				String profitScore = cityKpi2019.getProfitScore();//直接净利率
				String businessScore = cityKpi2019.getBusinessScore();//运营收入
				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
				String majorScore = cityKpi2019.getMajorScore();//重大事项
				if(!scoreRate.equals("")) {
					float float1 = Float.parseFloat(scoreRate);	
					gz=gz+float1;
				}
				if(!profitScore.equals("")) {
					float float1 = Float.parseFloat(profitScore);	
					gz=gz+float1;
				}
				if(!businessScore.equals("")) {
					float float1 = Float.parseFloat(businessScore);	
					gz=gz+float1;
				}
				if(!brandselfScore.equals("")) {
					float float1 = Float.parseFloat(brandselfScore);	
					gz=gz+float1;
				}
				if(!hardwardScore.equals("")) {
					float float1 = Float.parseFloat(hardwardScore);	
					gz=gz+float1;
				}
				if(!notGroupScore.equals("")) {
					float float1 = Float.parseFloat(notGroupScore);	
					gz=gz+float1;
				}
				if(!keyNotScore.equals("")) {
					float float1 = Float.parseFloat(keyNotScore);	
					gz=gz+float1;
				}
				if(!keyNotScore1.equals("")) {
					float float1 = Float.parseFloat(keyNotScore1);	
					gz=gz+float1;
				}
				if(!qualityScore.equals("")) {
					float float1 = Float.parseFloat(qualityScore);	
					gz=gz+float1;
				}
				if(!getkAcustomerScore.equals("")) {
					float float1 = Float.parseFloat(getkAcustomerScore);	
					gz=gz+float1;
				}
				if(!tieTongScore.equals("")) {
					float float1 = Float.parseFloat(tieTongScore);	
					gz=gz+float1;
				}
				if(!sellRetailScore.equals("")) {
					float float1 = Float.parseFloat(sellRetailScore);	
					gz=gz+float1;
				}
				if(!afterSaleScore.equals("")) {
					float float1 = Float.parseFloat(afterSaleScore);	
					gz=gz+float1;
				}
				if(!directRateScore.equals("")) {
					float float1 = Float.parseFloat(directRateScore);	
					gz=gz+float1;
				}
				if(!threeMonthQuarter.equals("")) {
					float float1 = Float.parseFloat(threeMonthQuarter);	
					gz=gz+float1;
				}
				if(!majorScore.equals("")) {
					float float1 = Float.parseFloat(majorScore);	
					gz=gz+float1;
				}
				 
			      float  b   =  (float)(Math.round(gz*100))/100;
				model.addAttribute("JMscore", b);
				model.addAttribute("FSjmDte", cityKpi2019);	
			}		
             if(cityKpi2019.getCity().equals("湛江")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("ZZscore", b);
				model.addAttribute("FSzzDte", cityKpi2019);	
			}		
             if(cityKpi2019.getCity().equals("茂名")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("MMscore", b);
 				model.addAttribute("FSmmDte", cityKpi2019);	
 			}
             if(cityKpi2019.getCity().equals("阳江")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("YJscore", b);
 				model.addAttribute("FSyjDte", cityKpi2019);	
 			}		
             if(cityKpi2019.getCity().equals("合计4")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("HJ4score", b);
 				model.addAttribute("FShj4Dte", cityKpi2019);	
 			}		
		
		}
		if(cityKpi2019.getCenter().equals("东莞运营中心")) {
			if(cityKpi2019.getCity().equals("东莞")) {
	float gz=0;
				
				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
				String profitScore = cityKpi2019.getProfitScore();//直接净利率
				String businessScore = cityKpi2019.getBusinessScore();//运营收入
				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
				String majorScore = cityKpi2019.getMajorScore();//重大事项
				if(!scoreRate.equals("")) {
					float float1 = Float.parseFloat(scoreRate);	
					gz=gz+float1;
				}
				if(!profitScore.equals("")) {
					float float1 = Float.parseFloat(profitScore);	
					gz=gz+float1;
				}
				if(!businessScore.equals("")) {
					float float1 = Float.parseFloat(businessScore);	
					gz=gz+float1;
				}
				if(!brandselfScore.equals("")) {
					float float1 = Float.parseFloat(brandselfScore);	
					gz=gz+float1;
				}
				if(!hardwardScore.equals("")) {
					float float1 = Float.parseFloat(hardwardScore);	
					gz=gz+float1;
				}
				if(!notGroupScore.equals("")) {
					float float1 = Float.parseFloat(notGroupScore);	
					gz=gz+float1;
				}
				if(!keyNotScore.equals("")) {
					float float1 = Float.parseFloat(keyNotScore);	
					gz=gz+float1;
				}
				if(!keyNotScore1.equals("")) {
					float float1 = Float.parseFloat(keyNotScore1);	
					gz=gz+float1;
				}
				if(!qualityScore.equals("")) {
					float float1 = Float.parseFloat(qualityScore);	
					gz=gz+float1;
				}
				if(!getkAcustomerScore.equals("")) {
					float float1 = Float.parseFloat(getkAcustomerScore);	
					gz=gz+float1;
				}
				if(!tieTongScore.equals("")) {
					float float1 = Float.parseFloat(tieTongScore);	
					gz=gz+float1;
				}
				if(!sellRetailScore.equals("")) {
					float float1 = Float.parseFloat(sellRetailScore);	
					gz=gz+float1;
				}
				if(!afterSaleScore.equals("")) {
					float float1 = Float.parseFloat(afterSaleScore);	
					gz=gz+float1;
				}
				if(!directRateScore.equals("")) {
					float float1 = Float.parseFloat(directRateScore);	
					gz=gz+float1;
				}
				if(!threeMonthQuarter.equals("")) {
					float float1 = Float.parseFloat(threeMonthQuarter);	
					gz=gz+float1;
				}
				if(!majorScore.equals("")) {
					float float1 = Float.parseFloat(majorScore);	
					gz=gz+float1;
				}
				 
			      float  b   =  (float)(Math.round(gz*100))/100;
				model.addAttribute("DGscore", b);
				model.addAttribute("DGdgDte", cityKpi2019);	
			}		
            if(cityKpi2019.getCity().equals("中山")) {
	float gz=0;
				
				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
				String profitScore = cityKpi2019.getProfitScore();//直接净利率
				String businessScore = cityKpi2019.getBusinessScore();//运营收入
				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
				String majorScore = cityKpi2019.getMajorScore();//重大事项
				if(!scoreRate.equals("")) {
					float float1 = Float.parseFloat(scoreRate);	
					gz=gz+float1;
				}
				if(!profitScore.equals("")) {
					float float1 = Float.parseFloat(profitScore);	
					gz=gz+float1;
				}
				if(!businessScore.equals("")) {
					float float1 = Float.parseFloat(businessScore);	
					gz=gz+float1;
				}
				if(!brandselfScore.equals("")) {
					float float1 = Float.parseFloat(brandselfScore);	
					gz=gz+float1;
				}
				if(!hardwardScore.equals("")) {
					float float1 = Float.parseFloat(hardwardScore);	
					gz=gz+float1;
				}
				if(!notGroupScore.equals("")) {
					float float1 = Float.parseFloat(notGroupScore);	
					gz=gz+float1;
				}
				if(!keyNotScore.equals("")) {
					float float1 = Float.parseFloat(keyNotScore);	
					gz=gz+float1;
				}
				if(!keyNotScore1.equals("")) {
					float float1 = Float.parseFloat(keyNotScore1);	
					gz=gz+float1;
				}
				if(!qualityScore.equals("")) {
					float float1 = Float.parseFloat(qualityScore);	
					gz=gz+float1;
				}
				if(!getkAcustomerScore.equals("")) {
					float float1 = Float.parseFloat(getkAcustomerScore);	
					gz=gz+float1;
				}
				if(!tieTongScore.equals("")) {
					float float1 = Float.parseFloat(tieTongScore);	
					gz=gz+float1;
				}
				if(!sellRetailScore.equals("")) {
					float float1 = Float.parseFloat(sellRetailScore);	
					gz=gz+float1;
				}
				if(!afterSaleScore.equals("")) {
					float float1 = Float.parseFloat(afterSaleScore);	
					gz=gz+float1;
				}
				if(!directRateScore.equals("")) {
					float float1 = Float.parseFloat(directRateScore);	
					gz=gz+float1;
				}
				if(!threeMonthQuarter.equals("")) {
					float float1 = Float.parseFloat(threeMonthQuarter);	
					gz=gz+float1;
				}
				if(!majorScore.equals("")) {
					float float1 = Float.parseFloat(majorScore);	
					gz=gz+float1;
				}
				 
			      float  b   =  (float)(Math.round(gz*100))/100;
				model.addAttribute("ZSscore", b);
				model.addAttribute("DGzsDte", cityKpi2019);	
			}		
             if(cityKpi2019.getCity().equals("惠州")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("HZscore", b);
				model.addAttribute("DGhzDte", cityKpi2019);	
			}		
             if(cityKpi2019.getCity().equals("珠海")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("ZHscore", b);
 				model.addAttribute("DGzhDte", cityKpi2019);	
 			}
             if(cityKpi2019.getCity().equals("河源")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("HYscore", b);
 				model.addAttribute("DGhyDte", cityKpi2019);	
 			}		
             if(cityKpi2019.getCity().equals("合计3")) {
            		float gz=0;
    				
    				String scoreRate = cityKpi2019.getRateScore();//直接毛利率				
    				String profitScore = cityKpi2019.getProfitScore();//直接净利率
    				String businessScore = cityKpi2019.getBusinessScore();//运营收入
    				String brandselfScore = cityKpi2019.getBrandselfScore();//自有品牌收入
    				String hardwardScore = cityKpi2019.getHardwardScore();//自有硬件品牌
    				String notGroupScore = cityKpi2019.getNotGroupScore();//非集团采集类
    				String keyNotScore = cityKpi2019.getKeyNotScore();//重点手机销售
    				String keyNotScore1 = cityKpi2019.getKeyNotScore();//重点智能硬件
    				String qualityScore = cityKpi2019.getQualityScore();//优质客户目标值
    				String getkAcustomerScore = cityKpi2019.getkAcustomerScore();//KA客户手机销量
    				String tieTongScore = cityKpi2019.getTieTongScore();//铁通
    				String sellRetailScore = cityKpi2019.getSellRetailScore();//新零售厅店
    				String afterSaleScore = cityKpi2019.getAfterSaleScore();//售后净利率
    				String directRateScore = cityKpi2019.getDirectRateScore();//直接净利率
    				String threeMonthQuarter = cityKpi2019.getThreeMonthQuarter();//三个月以上
    				String majorScore = cityKpi2019.getMajorScore();//重大事项
    				if(!scoreRate.equals("")) {
    					float float1 = Float.parseFloat(scoreRate);	
    					gz=gz+float1;
    				}
    				if(!profitScore.equals("")) {
    					float float1 = Float.parseFloat(profitScore);	
    					gz=gz+float1;
    				}
    				if(!businessScore.equals("")) {
    					float float1 = Float.parseFloat(businessScore);	
    					gz=gz+float1;
    				}
    				if(!brandselfScore.equals("")) {
    					float float1 = Float.parseFloat(brandselfScore);	
    					gz=gz+float1;
    				}
    				if(!hardwardScore.equals("")) {
    					float float1 = Float.parseFloat(hardwardScore);	
    					gz=gz+float1;
    				}
    				if(!notGroupScore.equals("")) {
    					float float1 = Float.parseFloat(notGroupScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore);	
    					gz=gz+float1;
    				}
    				if(!keyNotScore1.equals("")) {
    					float float1 = Float.parseFloat(keyNotScore1);	
    					gz=gz+float1;
    				}
    				if(!qualityScore.equals("")) {
    					float float1 = Float.parseFloat(qualityScore);	
    					gz=gz+float1;
    				}
    				if(!getkAcustomerScore.equals("")) {
    					float float1 = Float.parseFloat(getkAcustomerScore);	
    					gz=gz+float1;
    				}
    				if(!tieTongScore.equals("")) {
    					float float1 = Float.parseFloat(tieTongScore);	
    					gz=gz+float1;
    				}
    				if(!sellRetailScore.equals("")) {
    					float float1 = Float.parseFloat(sellRetailScore);	
    					gz=gz+float1;
    				}
    				if(!afterSaleScore.equals("")) {
    					float float1 = Float.parseFloat(afterSaleScore);	
    					gz=gz+float1;
    				}
    				if(!directRateScore.equals("")) {
    					float float1 = Float.parseFloat(directRateScore);	
    					gz=gz+float1;
    				}
    				if(!threeMonthQuarter.equals("")) {
    					float float1 = Float.parseFloat(threeMonthQuarter);	
    					gz=gz+float1;
    				}
    				if(!majorScore.equals("")) {
    					float float1 = Float.parseFloat(majorScore);	
    					gz=gz+float1;
    				}
    				 
    			      float  b   =  (float)(Math.round(gz*100))/100;
    				model.addAttribute("HJ3score", b);
 				model.addAttribute("DGhj3Dte", cityKpi2019);	
 			}		
		
		}
			
		if(cityKpi2019.getCenter().equals("分值")) {
			if(cityKpi2019.getCity().equals("分值")) {
				
				model.addAttribute("score", cityKpi2019);	
			}		
           
		
		}
		
		if(cityKpi2019.getCenter().equals("全省")) {
			if(cityKpi2019.getCity().equals("全省合计")) {
				
				model.addAttribute("cityAll", cityKpi2019);	
			}		
           
		
		}
		
		
			
		    }
		
	}
		
		
		
		
	
	
		
		
		
		return "cityKpi/zdCitykpi2019_02";
		
	}
	
	
	@DS("dataSource")@RequestMapping(value="/allList03", method = {RequestMethod.GET,RequestMethod.POST})
	public String index03(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
	
	        String spare = request.getParameter("quarter");
	       // System.out.println(parameter);
		List<CityKpi2019> list = cityKpi2019Service.selectAll(spare);
	    model.addAttribute("special", "cityKpi2019");
	    if(list.isEmpty() && spare.equals("1")) {
			return "cityKpi/zdCitykpi2019";
		}
	    if(list.isEmpty() && spare.equals("2")) {
			return "cityKpi/zdCitykpi2019_02";
		}
	
	    return "cityKpi/zdCitykpi2019_03";
}
}
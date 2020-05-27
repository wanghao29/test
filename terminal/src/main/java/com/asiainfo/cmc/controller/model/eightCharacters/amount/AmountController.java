package com.asiainfo.cmc.controller.model.eightCharacters.amount;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.asiainfo.cmc.common.ResultMap;
import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.config.DataSourceContextHolder;
import com.asiainfo.cmc.enties.brandmodel.ReturnRate;
import com.asiainfo.cmc.enties.brandmodel.ZdResult8AreaD;
import com.asiainfo.cmc.enties.brandmodel.ZdResult8BrandD;
import com.asiainfo.cmc.enties.brandmodel.ZdResult8MonscmM;
import com.asiainfo.cmc.enties.importExcel.ImportCost;
import com.asiainfo.cmc.enties.importExcel.ImportGrossProfit;
import com.asiainfo.cmc.enties.importExcel.ImportInfoProfitCost;
import com.asiainfo.cmc.enties.importExcel.ImportPeopleNum;
import com.asiainfo.cmc.enties.importExcel.ImportTeamIncom;
import com.asiainfo.cmc.enties.importExcel.ImportWugexiaomie;
import com.asiainfo.cmc.enties.importExcel.ImportWuweiyiti;
import com.asiainfo.cmc.enties.model.eightCharacters.Zd8typeInfoConfirm;
import com.asiainfo.cmc.enties.model.eightCharacters.Zd8typeInfoConfirmLog;
import com.asiainfo.cmc.service.model.eightCharacters.IAmonutService;
import com.asiainfo.cmc.utils.PageInfo;
import com.asiainfo.cmc.utils.RequestUtils;
/*

*
*  
*
*/
import com.asiainfo.cmc.vo.model.EcharDataVo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

 


@Controller
@RequestMapping(value = "/amount")
public class AmountController {
	private static final Logger logger = LoggerFactory.getLogger(AmountController.class);

	@Autowired
	private IAmonutService amonutService;
	   
	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model , HttpServletResponse response, String special) {
		//logger.info("customerChannel  {}.", locale);
	
		String type_8=request.getParameter("type_8");
		/*try {
			type_8 = new String(request.getParameter("type_8").getBytes("iso-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		model.addAttribute("special", special );
		model.addAttribute("type_8", type_8);
		return "model/eightCharacters/amount/amount";
	}
	
	@DS("dataSource")@RequestMapping(value = "/salesOfOurCompany", method = RequestMethod.GET)
	public String salesOfOurCompany(Locale locale, Model model) {
		logger.info("customerChannel  {}.", locale);
	 
		return "model/eightCharacters/amount/salesOfOurCompanyExclude";
	}
	
	
 
	@DS("dataSource2")@RequestMapping(value = "/getDimMods", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ResultMap getDimMods(Locale locale, Model model,HttpServletRequest request) {
		ResultMap data =ResultMap.defaultResultMap(); //new HashMap<String,Object>();
		Map<String,String>  param = RequestUtils.getParamsMap(request);
		data.put("rows", amonutService.getDimMods(param));
		return data;
	}
	@DS("dataSource2")@RequestMapping(value = "/getKpis", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ResultMap getKpis(Locale locale, Model model,HttpServletRequest request) {
		ResultMap data =ResultMap.defaultResultMap(); //new HashMap<String,Object>();
		Map<String,String>  param = RequestUtils.getParamsMap(request);
		
		//单个八字下的所有指标
		List<Map<String, String>> kpis = amonutService.getKpis(param);
	
		//yyyyMM--yyyyMMdd
		//Map<String, String> cdf_param = changeDateFormate(param);
		List<Object> list=getListByindex(kpis,param);
		List<Zd8typeInfoConfirm> confrimInfos = amonutService.getConfirmInfo(kpis, param);
		data.put("infos", confrimInfos);
		data.put("list", list);
		data.put("rows", kpis);
		return data;
	}
	//查指标的数据概览
	public List<Object> getListByindex(List<Map<String, String>> kpis,Map<String,String>  param){
		List<Object> list=new ArrayList<Object>();
		for (Map<String, String> kpi : kpis) {
			param.put("dim_key", kpi.get("kpiKey"));
			if("kpi_assess_profit".equals(kpi.get("kpiKey"))) {
				  DataSourceContextHolder.setDB("dataSource");
			      EcharDataVo echarDataVo = amonutService.getListByindex(param);
			      list.add(echarDataVo.getData().get(0));
			}else {
				 DataSourceContextHolder.setDB("dataSource2");
			      EcharDataVo echarDataVo = amonutService.getListByindex(param);
			      list.add(echarDataVo.getData().get(0));
			}
			
		}
		return list;
	}
	
	@DS("dataSource2")@RequestMapping(value = "/getCharData", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public EcharDataVo getCharData(Locale locale, Model model,HttpServletRequest request) {
		Map<String,String>  param = RequestUtils.getParamsMap(request);
		
		EcharDataVo echarDataVo = amonutService.getEcharDataVo(param);
		return echarDataVo;
	}
	
	@DS("dataSource2")@RequestMapping(value = "/initJqGrid", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> initJqGrid(Locale locale, Model model,HttpServletRequest request,HttpServletResponse response){
		
		Map<String, Object> mapJson = new HashMap<String, Object>();
		
		ResultMap data =ResultMap.defaultResultMap(); //new HashMap<String,Object>();
		Map<String,String>  param = RequestUtils.getParamsMap(request);
		
		//Map<String, String> changeDF = changeDateFormate(param);
		
		//jqGrid 分页
		String page =param.get("page");//当前页 默认1
		String rows=param.get("rows");//每页行数
		
		//分页显示的数据
		String kpiKey=param.get("dim_key");
		if(kpiKey.indexOf("return_rate")!=-1){
			List<ReturnRate> list = amonutService.initJqGridRR(param);			//退货率  详情数据的
			List<ReturnRate> pageList = new ArrayList<ReturnRate>();
			
			int currentPage = ((page == null) || page.trim().equals(""))? 1:Integer.parseInt(page);
			int currRow = ((rows == null) || rows.trim().equals(""))? 10:Integer.parseInt(rows);
			int rowNumber = (list == null)?0:list.size();
			int totalPage = rowNumber % currRow == 0 ? rowNumber/currRow : rowNumber/currRow+1;
			int index = (Integer.parseInt(page)-1)*Integer.parseInt(rows);//显示的第一条数据的序号
//			ResultJson resultJson = new ResultJson();
			int num=(index+currRow);
			
			//jqGrid 的查询search按钮 功能实现
			String searchString=param.get("searchString");//查询的字段值
			String searchField=param.get("searchField");//查询的字段
			String searchOper=param.get("searchOper");//查询的逻辑关系
			if(searchString!=null&&!"".equals(searchString)){//查询字段非空
				List<ReturnRate> searchList = new ArrayList<ReturnRate>();
				
				if("eq".equals(searchOper)){//等于
					if(searchField.contains("city")){
						for (ReturnRate returnRate : list) {
							if(returnRate.getCity().toLowerCase().equals(searchString.toLowerCase())){
								searchList.add(returnRate);
							}
						}
					}else if(searchField.contains("pmName")){
						for (ReturnRate returnRate : list) {
							if(returnRate.getPmName().toLowerCase().equals(searchString.toLowerCase())){
								searchList.add(returnRate);
							}
						}
					}else if(searchField.contains("pmBelone")){
						for (ReturnRate returnRate : list) {
							if(returnRate.getPmBelone().toLowerCase().equals(searchString.toLowerCase())){
								searchList.add(returnRate);
							}
						}
					}
				}else{//包含
					if(searchField.contains("city")){
						for (ReturnRate returnRate : list) {
							if(returnRate.getCity().toLowerCase().contains(searchString.toLowerCase())){
								searchList.add(returnRate);
							}
						}
					}else if(searchField.contains("pmName")){
						for (ReturnRate returnRate : list) {
							if(returnRate.getPmName().toLowerCase().contains(searchString.toLowerCase())){
								searchList.add(returnRate);
							}
						}
					}else if(searchField.contains("pmBelone")){
						for (ReturnRate returnRate : list) {
							if(returnRate.getPmBelone().toLowerCase().contains(searchString.toLowerCase())){
								searchList.add(returnRate);
							}
						}
					}
				}
				
//				 else{
//					searchList=list;
//				}
				
				if(searchList.size()<num){
					num=searchList.size();
				}
				for (int i = index; i < num; i++) {
					pageList.add(searchList.get(i));
				}
				rowNumber = (searchList == null)?0:searchList.size();
			}else{
				if(list.size()<num){
					num=list.size();
				}
				for (int i = index; i < num; i++) {
					pageList.add(list.get(i));
				}
			}
			
			mapJson.put("sidx", index);
			mapJson.put("totalPage", totalPage);
			mapJson.put("currentPage", currentPage);
			mapJson.put("rowNumber", rowNumber);
			mapJson.put("list", pageList);
			
			return mapJson;
		}else if(kpiKey.indexOf("inventory")!=-1){//库龄库存
			List<ZdResult8MonscmM> list = amonutService.initJqGrid_invent(param);
			List<ZdResult8MonscmM> pageList = new ArrayList<ZdResult8MonscmM>();
			
			int currentPage = ((page == null) || page.trim().equals(""))? 1:Integer.parseInt(page);
			int currRow = ((rows == null) || rows.trim().equals(""))? 10:Integer.parseInt(rows);
			int rowNumber = (list == null)?0:list.size();
			int totalPage = rowNumber % currRow == 0 ? rowNumber/currRow : rowNumber/currRow+1;
			int index = (Integer.parseInt(page)-1)*Integer.parseInt(rows);//显示的第一条数据的序号
//			ResultJson resultJson = new ResultJson();
			int num=(index+currRow);
			
			//合计值
			float values=0f;
			
			//jqGrid 的查询search按钮 功能实现
			String searchString=param.get("searchString");//查询的字段值
			String searchField=param.get("searchField");//查询的字段
			String searchOper=param.get("searchOper");//查询的逻辑关系
			if(searchString!=null&&!"".equals(searchString.toLowerCase())){//查询字段非空
				List<ZdResult8MonscmM> searchList = new ArrayList<ZdResult8MonscmM>();
				
				if("eq".equals(searchOper)){//等于
					if(searchField.contains("brandName")){
						for (ZdResult8MonscmM zdResult8BrandD : list) {
							if(zdResult8BrandD.getBrandName().toLowerCase().equals(searchString.toLowerCase())){
								searchList.add(zdResult8BrandD);
							}
						}
					}else if(searchField.contains("subtype")){
						for (ZdResult8MonscmM zdResult8BrandD : list) {
							if(zdResult8BrandD.getSubtype().toLowerCase().equals(searchString.toLowerCase())){
								searchList.add(zdResult8BrandD);
							}
						}
					}else if(searchField.contains("category")){
						for (ZdResult8MonscmM zdResult8BrandD : list) {
							if(zdResult8BrandD.getCategory().toLowerCase().equals(searchString.toLowerCase())){
								searchList.add(zdResult8BrandD);
							}
						}
					}
				}else{//包含
					if(searchField.contains("brandName")){
						for (ZdResult8MonscmM zdResult8BrandD : list) {
							if(zdResult8BrandD.getBrandName().toLowerCase().contains(searchString.toLowerCase())){
								searchList.add(zdResult8BrandD);
							}
						}
					}else if(searchField.contains("subtype")){
						for (ZdResult8MonscmM zdResult8BrandD : list) {
							if(zdResult8BrandD.getSubtype().toLowerCase().contains(searchString.toLowerCase())){
								searchList.add(zdResult8BrandD);
							}
						}
					}else if(searchField.contains("category")){
						for (ZdResult8MonscmM zdResult8BrandD : list) {
							if(zdResult8BrandD.getCategory().toLowerCase().contains(searchString.toLowerCase())){
								searchList.add(zdResult8BrandD);
							}
						}
					}
				}
				
				for (ZdResult8MonscmM zd : searchList) {
					values+=zd.getValue();
				}
				
				if(searchList.size()<num){
					num=searchList.size();
				}
				for (int i = index; i < num; i++) {
					pageList.add(searchList.get(i));
				}
				rowNumber = (searchList == null)?0:searchList.size();
			}else{
				for (ZdResult8MonscmM zd : list) {
					values+=zd.getValue();
				}
				if(list.size()<num){
					num=list.size();
				}
				for (int i = index; i < num; i++) {
					pageList.add(list.get(i));
				}
			}
			
			mapJson.put("sidx", index);
			mapJson.put("totalPage", totalPage);
			mapJson.put("currentPage", currentPage);
			mapJson.put("rowNumber", rowNumber);
			mapJson.put("list", pageList);
			mapJson.put("values", values);
			
			return mapJson;
			
		}else if(kpiKey.indexOf("retail_company")!=-1){//我司零售量 厅店列表
		List<ZdResult8AreaD> list = amonutService.initJqGrid_retail(param);
		List<ZdResult8AreaD> pageList = new ArrayList<ZdResult8AreaD>();
		
		int currentPage = ((page == null) || page.trim().equals(""))? 1:Integer.parseInt(page);
		int currRow = ((rows == null) || rows.trim().equals(""))? 10:Integer.parseInt(rows);
		int rowNumber = (list == null)?0:list.size();
		int totalPage = rowNumber % currRow == 0 ? rowNumber/currRow : rowNumber/currRow+1;
		int index = (Integer.parseInt(page)-1)*Integer.parseInt(rows);//显示的第一条数据的序号
//		ResultJson resultJson = new ResultJson();
		int num=(index+currRow);
		
		//合计值
		float values=0f;
		
		//jqGrid 的查询search按钮 功能实现
		String searchString=param.get("searchString");//查询的字段值
		String searchField=param.get("searchField");//查询的字段
		String searchOper=param.get("searchOper");//查询的逻辑关系
		if(searchString!=null&&!"".equals(searchString.toLowerCase())){//查询字段非空
			List<ZdResult8AreaD> searchList = new ArrayList<ZdResult8AreaD>();
			
			if("eq".equals(searchOper)){//等于
				if(searchField.contains("areaname")){
					for (ZdResult8AreaD zdResult8BrandD : list) {
						if(zdResult8BrandD.getAreaname().toLowerCase().equals(searchString.toLowerCase())){
							searchList.add(zdResult8BrandD);
						}
					}
				}else if(searchField.contains("subname")){
					for (ZdResult8AreaD zdResult8BrandD : list) {
						if(zdResult8BrandD.getSubname().toLowerCase().equals(searchString.toLowerCase())){
							searchList.add(zdResult8BrandD);
						}
					}
				}else if(searchField.contains("tfullname")){
					for (ZdResult8AreaD zdResult8BrandD : list) {
						if(zdResult8BrandD.getTfullname().toLowerCase().equals(searchString.toLowerCase())){
							searchList.add(zdResult8BrandD);
						}
					}
				}
			}else{//包含
				if(searchField.contains("areaname")){
					for (ZdResult8AreaD zdResult8BrandD : list) {
						if(zdResult8BrandD.getAreaname().toLowerCase().contains(searchString.toLowerCase())){
							searchList.add(zdResult8BrandD);
						}
					}
				}else if(searchField.contains("subname")){
					for (ZdResult8AreaD zdResult8BrandD : list) {
						if(zdResult8BrandD.getSubname().toLowerCase().contains(searchString.toLowerCase())){
							searchList.add(zdResult8BrandD);
						}
					}
				}else if(searchField.contains("tfullname")){
					for (ZdResult8AreaD zdResult8BrandD : list) {
						if(zdResult8BrandD.getTfullname().toLowerCase().contains(searchString.toLowerCase())){
							searchList.add(zdResult8BrandD);
						}
					}
				}
			}
			
			for (ZdResult8AreaD zd : searchList) {
				values+=zd.getValue();
			}
			
			if(searchList.size()<num){
				num=searchList.size();
			}
			for (int i = index; i < num; i++) {
				pageList.add(searchList.get(i));
			}
			rowNumber = (searchList == null)?0:searchList.size();
		}else{
			for (ZdResult8AreaD zd : list) {
				values+=zd.getValue();
			}
			if(list.size()<num){
				num=list.size();
			}
			for (int i = index; i < num; i++) {
				pageList.add(list.get(i));
			}
		}
		mapJson.put("sidx", index);
		mapJson.put("totalPage", totalPage);
		mapJson.put("currentPage", currentPage);
		mapJson.put("rowNumber", rowNumber);
		mapJson.put("list", pageList);
		mapJson.put("values", values);
		
		return mapJson;
	}else{
			List<ZdResult8BrandD> list = amonutService.initJqGrid(param);
			List<ZdResult8BrandD> pageList = new ArrayList<ZdResult8BrandD>();
			
			int currentPage = ((page == null) || page.trim().equals(""))? 1:Integer.parseInt(page);
			int currRow = ((rows == null) || rows.trim().equals(""))? 10:Integer.parseInt(rows);
			int rowNumber = (list == null)?0:list.size();
			int totalPage = rowNumber % currRow == 0 ? rowNumber/currRow : rowNumber/currRow+1;
			int index = (Integer.parseInt(page)-1)*Integer.parseInt(rows);//显示的第一条数据的序号
//			ResultJson resultJson = new ResultJson();
			int num=(index+currRow);
			
			//合计值
			float values=0f;
			
			//jqGrid 的查询search按钮 功能实现
			String searchString=param.get("searchString");//查询的字段值 
			String searchField=param.get("searchField");//查询的字段
			String searchOper=param.get("searchOper");//查询的逻辑关系
			if(searchString!=null&&!"".equals(searchString.toLowerCase())){//查询字段非空
				List<ZdResult8BrandD> searchList = new ArrayList<ZdResult8BrandD>();
				if("eq".equals(searchOper)){//等于
					if(searchField.contains("areaName")){
						for (ZdResult8BrandD zdResult8BrandD : list) {
							if(zdResult8BrandD.getAreaName().toLowerCase().equals(searchString.toLowerCase())){
								searchList.add(zdResult8BrandD);
							}
						}
					}else if(searchField.contains("brandName")){
						for (ZdResult8BrandD zdResult8BrandD : list) {
							if(zdResult8BrandD.getBrandName().toLowerCase().equals(searchString.toLowerCase())){
								searchList.add(zdResult8BrandD);
							}
						}
					}else if(searchField.contains("spec")){
						for (ZdResult8BrandD zdResult8BrandD : list) {
							if(zdResult8BrandD.getSpec().toLowerCase().equals(searchString.toLowerCase())){
								searchList.add(zdResult8BrandD);
							}
						}
					}else if(searchField.contains("priceRange")){
						for (ZdResult8BrandD zdResult8BrandD : list) {
							if(zdResult8BrandD.getPriceRange().toLowerCase().equals(searchString.toLowerCase())){
								searchList.add(zdResult8BrandD);
							}
						}
					}else if(searchField.contains("custName")){
						for (ZdResult8BrandD zdResult8BrandD : list) {
							if(zdResult8BrandD.getCustName().toLowerCase().equals(searchString.toLowerCase())){
								searchList.add(zdResult8BrandD);
							}
						}
					}else if(searchField.contains("custStage")){
						for (ZdResult8BrandD zdResult8BrandD : list) {
							if(zdResult8BrandD.getCustStage().toLowerCase().equals(searchString.toLowerCase())){
								searchList.add(zdResult8BrandD);
							}
						}
					}
					
				}else{//包含
					if(searchField.contains("areaName")){
						for (ZdResult8BrandD zdResult8BrandD : list) {
							if(zdResult8BrandD.getAreaName().toLowerCase().contains(searchString.toLowerCase())){
								searchList.add(zdResult8BrandD);
							}
						}
					}else if(searchField.contains("brandName")){
						for (ZdResult8BrandD zdResult8BrandD : list) {
							if(zdResult8BrandD.getBrandName().toLowerCase().contains(searchString.toLowerCase())){
								searchList.add(zdResult8BrandD);
							}
						}
					}else if(searchField.contains("spec")){
						for (ZdResult8BrandD zdResult8BrandD : list) {
							if(zdResult8BrandD.getSpec().toLowerCase().contains(searchString.toLowerCase())){
								searchList.add(zdResult8BrandD);
							}
						}
					}else if(searchField.contains("priceRange")){
						for (ZdResult8BrandD zdResult8BrandD : list) {
							if(zdResult8BrandD.getPriceRange().toLowerCase().contains(searchString.toLowerCase())){
								searchList.add(zdResult8BrandD);
							}
						}
					}else if(searchField.contains("custName")){
					for (ZdResult8BrandD zdResult8BrandD : list) {
						if(zdResult8BrandD.getCustName().contains(searchString)){
							searchList.add(zdResult8BrandD);
						}
					}
				}else if(searchField.contains("custStage")){
					for (ZdResult8BrandD zdResult8BrandD : list) {
						if(zdResult8BrandD.getCustStage().contains(searchString)){
							searchList.add(zdResult8BrandD);
						}
					}
				}
				}
//				if(searchField.contains("statDay")){
//					for (ZdResult8BrandD zdResult8BrandD : list) {
//						if(zdResult8BrandD.getStatDay().toLowerCase().contains(searchString.toLowerCase())){
//							searchList.add(zdResult8BrandD);
//						}
//					}
//				}else
					
//				else if(searchField.contains("custName")){
//					for (ZdResult8BrandD zdResult8BrandD : list) {
//						if(zdResult8BrandD.getCustName().contains(searchString)){
//							searchList.add(zdResult8BrandD);
//						}
//					}
//				}else if(searchField.contains("custStage")){
//					for (ZdResult8BrandD zdResult8BrandD : list) {
//						if(zdResult8BrandD.getCustStage().contains(searchString)){
//							searchList.add(zdResult8BrandD);
//						}
//					}
//				}else if(searchField.contains("subType")){
//					for (ZdResult8BrandD zdResult8BrandD : list) {
//						if(zdResult8BrandD.getSubType().contains(searchString)){
//							searchList.add(zdResult8BrandD);
//						}
//					}
//				}else if(searchField.contains("value")){
//							searchList=list;
//				}
				
				for (ZdResult8BrandD zd : searchList) {
					values+=zd.getValue();
				}
				
				if(searchList.size()<num){
					num=searchList.size();
				}
				for (int i = index; i < num; i++) {
					pageList.add(searchList.get(i));
				}
				rowNumber = (searchList == null)?0:searchList.size();
			}else{
				for (ZdResult8BrandD zd : list) {
					values+=zd.getValue();
				}
				if(list.size()<num){
					num=list.size();
				}
				for (int i = index; i < num; i++) {
					pageList.add(list.get(i));
				}
			}
			
			mapJson.put("sidx", index);
			mapJson.put("totalPage", totalPage);
			mapJson.put("currentPage", currentPage);
			mapJson.put("rowNumber", rowNumber);
			mapJson.put("list", pageList);
			mapJson.put("values", values);
			
			return mapJson;
		}
		
	}
	
	@DS("dataSource2")@RequestMapping(value = "/inportTwoFivesMonitorExcel", method = {RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> inportTwoFivesMonitorExcel(HttpServletRequest request,@RequestParam("uploadTwoFivesMonitor") MultipartFile uploadTwoFivesMonitor,
			@RequestParam("startMonth") String startMonth,@RequestParam("typeName") String typeName ) throws IllegalStateException, IOException{
		 Map<String,Object> result = new HashMap<String,Object>();
		if(!uploadTwoFivesMonitor.isEmpty()){
			String location=request.getSession().getServletContext().getRealPath("");
		//	System.out.println(location);
			
			//获取文件名
			String sourceName=uploadTwoFivesMonitor.getOriginalFilename();
			
			String fileName = location+File.pathSeparatorChar+sourceName;
			//保存文件
			uploadTwoFivesMonitor.transferTo(new File(fileName));
			FileInputStream in=new FileInputStream(fileName);
			   //开始导入Excel文件
			   Workbook wb;
			    if(fileName.endsWith(".xls")) {  
			     //Excel2003
			             wb = new HSSFWorkbook(in);  
			        }else{  
			         //Excel 2007
			             wb = new XSSFWorkbook(in);  
			      } 
			    
			  //获取工作簿
				Sheet sheet = wb.getSheetAt(0);
				//数据条数
				int rows= sheet.getLastRowNum();//rows是最后一条数据的序号，其不包含文件的表头；
				if("zd_result_8wuweiyiti_t".equals(typeName)) {
					List<ImportWuweiyiti> importWuweiyitiList=new ArrayList<ImportWuweiyiti>();
					
				       for (Row r : sheet) {
				        	if(r.getCell(0)==null){
				        		break;
				        	}else {
				        	// 跳过表头
							if(r.getRowNum()<1){
							continue;
							}
							ImportWuweiyiti importWuweiyiti = new ImportWuweiyiti();
							//获取单条数据的列数
							int cellNum = r.getLastCellNum();//---获取单条数据的最后一列的序号
							r.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
							r.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
							r.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
							r.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
							r.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
							r.getCell(5).setCellType(Cell.CELL_TYPE_STRING);
							r.getCell(6).setCellType(Cell.CELL_TYPE_STRING);
							r.getCell(7).setCellType(Cell.CELL_TYPE_STRING);
							r.getCell(8).setCellType(Cell.CELL_TYPE_STRING);
							importWuweiyiti.setMonth(startMonth);
							importWuweiyiti.setDimension(r.getCell(0).getStringCellValue()==""?"0":r.getCell(0).getStringCellValue());
							importWuweiyiti.setSubtype(r.getCell(1).getStringCellValue()==""?"0":r.getCell(1).getStringCellValue());
							importWuweiyiti.setDimension2(r.getCell(2).getStringCellValue()==""?"0":r.getCell(2).getStringCellValue());
							
							importWuweiyiti.setAmount(r.getCell(3).getStringCellValue()==""?"0":r.getCell(3).getStringCellValue());
							importWuweiyiti.setIncome(r.getCell(4).getStringCellValue()==""?"0":r.getCell(4).getStringCellValue());
							importWuweiyiti.setZsml(r.getCell(5).getStringCellValue()==""?"0":r.getCell(5).getStringCellValue());
							importWuweiyiti.setYwml(r.getCell(6).getStringCellValue()==""?"0":r.getCell(6).getStringCellValue());
					
							importWuweiyiti.setDtml(r.getCell(7).getStringCellValue()==""?"0":r.getCell(7).getStringCellValue());
							importWuweiyiti.setMll(r.getCell(8).getStringCellValue()==""?"0":r.getCell(8).getStringCellValue());
							importWuweiyiti.setOrder_id(String.valueOf(r.getRowNum()));
							importWuweiyitiList.add(importWuweiyiti);
						
				        	}
				        }
				   	amonutService.insertWuweiyiti(importWuweiyitiList,startMonth);
				}else if("zd_result_8wugexiaomie_t".equals(typeName)) {
					List<ImportWugexiaomie> importWugexiaomieList=new ArrayList<ImportWugexiaomie>();
				       for (Row r : sheet) {
				    	   
				        	if(r.getCell(0)==null){
				        		break;
				        	}else {
				        		
				        		ImportWugexiaomie importWugexiaomie = new ImportWugexiaomie();
				        	// 跳过表头
							if(r.getRowNum()<1){
							continue;
							}
							//获取单条数据的列数
							int cellNum = r.getLastCellNum();//---获取单条数据的最后一列的序号
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
							importWugexiaomie.setMonth(startMonth);
							importWugexiaomie.setDimension(r.getCell(0).getStringCellValue()==""?"0":r.getCell(0).getStringCellValue());
							importWugexiaomie.setDimension2(r.getCell(1).getStringCellValue()==""?"0":r.getCell(1).getStringCellValue());
							importWugexiaomie.setAmount(r.getCell(2).getStringCellValue()==""?"0":r.getCell(2).getStringCellValue());
							importWugexiaomie.setIncome(r.getCell(3).getStringCellValue()==""?"0":r.getCell(3).getStringCellValue());
							importWugexiaomie.setYwml(r.getCell(4).getStringCellValue()==""?"0":r.getCell(4).getStringCellValue());
							importWugexiaomie.setDtml(r.getCell(5).getStringCellValue()==""?"0":r.getCell(5).getStringCellValue());
							importWugexiaomie.setMll(r.getCell(6).getStringCellValue()==""?"0":r.getCell(6).getStringCellValue());
							importWugexiaomie.setGsfy(r.getCell(7).getStringCellValue()==""?"0":r.getCell(7).getStringCellValue());
							importWugexiaomie.setZjlr(r.getCell(8).getStringCellValue()==""?"0":r.getCell(8).getStringCellValue());
							importWugexiaomie.setZjlrl(r.getCell(9).getStringCellValue()==""?"0":r.getCell(9).getStringCellValue());
							importWugexiaomie.setGswtffy(r.getCell(10).getStringCellValue()==""?"0":r.getCell(10).getStringCellValue());
							importWugexiaomie.setGslrze(r.getCell(11).getStringCellValue()==""?"0":r.getCell(11).getStringCellValue());
							importWugexiaomieList.add(importWugexiaomie);
				        	}
				        }
				       amonutService.insertWugexiaomie(importWugexiaomieList,startMonth);
				}else if("zd_8type_info_profit_cost".equals(typeName)) {
					List<ImportInfoProfitCost> importInfoProfitCostList=new ArrayList<ImportInfoProfitCost>();
				       for (Row r : sheet) {
				    	   
				        	if(r.getCell(0)==null){
				        		break;
				        	}else {
				        		
				        		ImportInfoProfitCost importInfoProfitCost = new ImportInfoProfitCost();
				        	// 跳过表头
							if(r.getRowNum()<1){
							continue;
							}
							//获取单条数据的列数
							int cellNum = r.getLastCellNum();//---获取单条数据的最后一列的序号
							r.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
							r.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
							r.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
							r.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
							r.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
							importInfoProfitCost.setMonth(r.getCell(0).getStringCellValue()==""?"0":r.getCell(0).getStringCellValue());
							importInfoProfitCost.setCostName(r.getCell(2).getStringCellValue()==""?"0":r.getCell(2).getStringCellValue());
							importInfoProfitCost.setValue(r.getCell(4).getStringCellValue()==""?"0":r.getCell(4).getStringCellValue());
							
				/*			importWugexiaomie.setMonth(startMonth);
							importWugexiaomie.setDimension(r.getCell(0).getStringCellValue()==""?"0":r.getCell(0).getStringCellValue());
							importWugexiaomie.setDimension2(r.getCell(1).getStringCellValue()==""?"0":r.getCell(1).getStringCellValue());
							importWugexiaomie.setAmount(r.getCell(2).getStringCellValue()==""?"0":r.getCell(2).getStringCellValue());
							importWugexiaomie.setIncome(r.getCell(3).getStringCellValue()==""?"0":r.getCell(3).getStringCellValue());
							importWugexiaomie.setYwml(r.getCell(4).getStringCellValue()==""?"0":r.getCell(4).getStringCellValue());
							importWugexiaomie.setDtml(r.getCell(5).getStringCellValue()==""?"0":r.getCell(5).getStringCellValue());
							importWugexiaomie.setMll(r.getCell(6).getStringCellValue()==""?"0":r.getCell(6).getStringCellValue());
							importWugexiaomie.setGsfy(r.getCell(7).getStringCellValue()==""?"0":r.getCell(7).getStringCellValue());
							importWugexiaomie.setZjlr(r.getCell(8).getStringCellValue()==""?"0":r.getCell(8).getStringCellValue());
							importWugexiaomie.setZjlrl(r.getCell(9).getStringCellValue()==""?"0":r.getCell(9).getStringCellValue());
							importWugexiaomie.setGswtffy(r.getCell(10).getStringCellValue()==""?"0":r.getCell(10).getStringCellValue());
							importWugexiaomie.setGslrze(r.getCell(11).getStringCellValue()==""?"0":r.getCell(11).getStringCellValue());*/
							importInfoProfitCostList.add(importInfoProfitCost);
				        	}
				        }
				       amonutService.insertInfoProfitCost(importInfoProfitCostList,startMonth);
				}
		 
			    
			    
			    
			    
			   // Integer num = this.importExcel(wb);
				Integer num = 200;
			    if (num==200) {
					result.put("code", 200);
				}else {
					result.put("code", "数据格式不符或重复导入");
				}
		}else{
			result.put("code", "导入文件不能为空");
		}
		return result;
	}
		
	@DS("dataSource2")@RequestMapping(value = "/exportExcel", method = {RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> importPeopleNum(HttpServletRequest request,@RequestParam("uploadFile") MultipartFile uploadFile) throws IllegalStateException, IOException{
		 Map<String,Object> result = new HashMap<String,Object>();
		if(!uploadFile.isEmpty()){
			String location=request.getSession().getServletContext().getRealPath("");
		//	System.out.println(location);
			
			//获取文件名
			String sourceName=uploadFile.getOriginalFilename();
			
			String fileName = location+File.pathSeparatorChar+sourceName;
			//保存文件
			uploadFile.transferTo(new File(fileName));
			FileInputStream in=new FileInputStream(fileName);
			   //开始导入Excel文件
			   Workbook wb;
			    if(fileName.endsWith(".xls")) {  
			     //Excel2003
			             wb = new HSSFWorkbook(in);  
			        }else{  
			         //Excel 2007
			             wb = new XSSFWorkbook(in);  
			      } 
			    Integer num = this.importExcel(wb);
			    
			    if (num==200) {
					result.put("code", 200);
				}else {
					result.put("code", "数据格式不符或重复导入");
				}
		}else{
			result.put("code", "导入文件不能为空");
		}
		return result;
	}
	
	/** 导入Excel文件**/
	@SuppressWarnings("unused")
	private Integer importExcel(Workbook workbook){
		List<ImportPeopleNum> list =new ArrayList<>();
		
		//获取工作簿
		Sheet sheet = workbook.getSheetAt(0);
		//数据条数
		int rows= sheet.getLastRowNum();//rows是最后一条数据的序号，其不包含文件的表头；
		//导入前做去重处理
		Set<String> monSet = new HashSet<String>();
		String month;
		for (int i = 2; i <=rows; i++) {
			sheet.getRow(i).getCell(2).setCellType(Cell.CELL_TYPE_STRING);
			month=sheet.getRow(i).getCell(2).getStringCellValue();
			monSet.add(month);
		}
										
		//repeat("month",monSet,"ZD_8TYPE_IMPORT_PEOPLENO");
		repeat("month",monSet,"zd_etype_import_peopleno");
		//遍历sheet 存数据
        for (Row r : sheet) {
        	if(r.getCell(0)==null){
        		break;
        	}
        	// 跳过表头
			if(r.getRowNum()<1){
			continue;
			}
			//获取单条数据的列数
			int cellNum = r.getLastCellNum();//---获取单条数据的最后一列的序号
			r.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
			r.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
			r.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
			r.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
			r.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
			
			ImportPeopleNum PeopleNum = new ImportPeopleNum();
			PeopleNum.setType8(r.getCell(0).getStringCellValue());
			PeopleNum.setDimension(r.getCell(1).getStringCellValue());
			PeopleNum.setMonth(r.getCell(2).getStringCellValue());
			PeopleNum.setAREANAME(r.getCell(3).getStringCellValue());
			PeopleNum.setPeople_num(Integer.parseInt(r.getCell(4).getStringCellValue()));
			
			list.add(PeopleNum);
//			if(list.size()==(rows-1)){
//				break;
//			}
        }
        try{
        	amonutService.importPeopleNum(list);
        	return 200;
        }catch(Exception e){
        	return 0;
        }
	}
	
/** 导入团队售后收入的Excel**/
	@DS("dataSource2")@RequestMapping(value = "/exportTeamExcel", method = {RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> exportTeamExcel(HttpServletRequest request,@RequestParam("uploadTeam") MultipartFile uploadTeam) throws IllegalStateException, IOException{
		 Map<String,Object> result = new HashMap<String,Object>();
		if(!uploadTeam.isEmpty()){
			String location=request.getSession().getServletContext().getRealPath("");
		//	System.out.println(location);
			
			//获取文件名
			String sourceName=uploadTeam.getOriginalFilename();
			
			String fileName = location+File.pathSeparatorChar+sourceName;
			//存文件
			uploadTeam.transferTo(new File(fileName));
			FileInputStream in=new FileInputStream(fileName);
			   //开始导入Excel文件
			   Workbook wb;
			    if(fileName.endsWith(".xls")) {  
			     //Excel2003
			             wb = new HSSFWorkbook(in);  
			        } else {  
			         //Excel 2007
			             wb = new XSSFWorkbook(in);  
			      } 
			    
			    Integer num = this.importTeam(wb);
			   
			    if (num==200) {
					result.put("code", 200);
				}else {
					result.put("code", "数据格式不符或重复导入");
				}
		}else{
			result.put("code", "文件不能为空");
		}
		return result;
	}
	
	/** 导入售后团队Excel**/
	@SuppressWarnings("unused")
	private Integer importTeam(Workbook workbook){
		List<ImportTeamIncom> list =new ArrayList<>();
		
		//获取第一个工作簿
		Sheet sheet = workbook.getSheetAt(0);
		//获取最后一条数据的序号
		int rows= sheet.getLastRowNum();//将最一条数据的序号代表数据条数，rows+1 表示加了表头
		
		//导入前做去重处理
		Set<String> monSet = new HashSet<String>();
		String month;
		for (int i = 2; i <=rows; i++) {
			sheet.getRow(i).getCell(0).setCellType(Cell.CELL_TYPE_STRING);
			month=sheet.getRow(i).getCell(0).getStringCellValue();
			monSet.add(month);
		}
								
		//repeat("month",monSet,"ZD_8TYPE_IMPORT_TEAM_INCOME");
		repeat("month",monSet,"zd_etype_import_team_income");
		//遍历sheet
        for (Row r : sheet) {
        	if(r.getCell(0)==null){
        		break;
        	}
        	// 第一行数据为表头
			if(r.getRowNum()<1){
			continue;
			}//跳过表头
			//获取单条数据的列数
			int cellNum = r.getLastCellNum();//---最后一列的列序号  
			r.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
			r.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
			r.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
			r.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
			
			ImportTeamIncom teamIncome = new ImportTeamIncom();
			teamIncome.setMonth(r.getCell(0).getStringCellValue());
			teamIncome.setCity(r.getCell(1).getStringCellValue());
			teamIncome.setType(r.getCell(2).getStringCellValue());
			teamIncome.setValue(r.getCell(3).getStringCellValue());
			list.add(teamIncome);
//			if(list.size()==(rows-1)){
//				break;
//			}
        }
        try{
        	amonutService.importTeam(list);
        	return 200;
        }catch(Exception e){
        	return 0;
        }
	}
	
	
	
	
	/**导入酬金**/
	@DS("dataSource2")@RequestMapping(value = "/exportCost", method = {RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> exportCost(HttpServletRequest request,@RequestParam("uploadCost") MultipartFile uploadCost) throws IllegalStateException, IOException{
		 Map<String,Object> result = new HashMap<String,Object>();
		if(!uploadCost.isEmpty()){
			String location=request.getSession().getServletContext().getRealPath("");
	//		System.out.println(location);
			
			//获取文件名
			String sourceName=uploadCost.getOriginalFilename();
			
			String fileName = location+File.pathSeparatorChar+sourceName;
			//存文件
			uploadCost.transferTo(new File(fileName));
			FileInputStream in=new FileInputStream(fileName);
			   //导入文件
			   Workbook wb;
			    if(fileName.endsWith(".xls")) {  
			     //Excel2003
			             wb = new HSSFWorkbook(in);  
			        } else {  
			         //Excel 2007
			             wb = new XSSFWorkbook(in);  
			      } 
			    
			    Integer num = this.importCost(wb);
			   
			    if (num==200) {
					result.put("code", 200);
				}else {
					result.put("code", "数据格式不符或重复导入 ");
				}
		}else{
			result.put("code", "文件不能为空");
		}
		return result;
	}
	
	/** 导入酬金Excel**/
	@SuppressWarnings("unused")
	private Integer importCost(Workbook workbook){
		List<ImportCost> list =new ArrayList<>();
		
		//获取第一个工作簿
		Sheet sheet = workbook.getSheetAt(0);
		//文件的数据条数
		int rows= sheet.getLastRowNum();//以最后一条数据的序号为总条数  其中，rows+1 表示包含表头行
		
		//导入前做去重处理
		Set<String> monSet = new HashSet<String>();
		String month;
		for (int i = 2; i <=rows; i++) {
			sheet.getRow(i).getCell(2).setCellType(Cell.CELL_TYPE_STRING);
			month=sheet.getRow(i).getCell(2).getStringCellValue();
			monSet.add(month);
		}
						
		repeat("stat_day",monSet,"ZD_8TYPE_IMPORT_COMMISSION_COST");
		//遍历sheet
        for (Row r : sheet) {
        	if(r.getCell(0)==null){
        		break;
        	}
        	//读取每行的数据
			if(r.getRowNum()<1){
			continue;
			}// 跳过表头
			
			//维度|五大战区|月份|地市 |酬金|费用
			int cellNum = r.getLastCellNum();//---
			
			r.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
			r.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
			r.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
			r.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
			r.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
			r.getCell(5).setCellType(Cell.CELL_TYPE_STRING);
			
			ImportCost importCost = new ImportCost();
			importCost.setType8("利");
			importCost.setDimension(r.getCell(0).getStringCellValue());
			importCost.setKpiName(r.getCell(1).getStringCellValue());
			importCost.setMonth(r.getCell(2).getStringCellValue());
			importCost.setAREANAME(r.getCell(3).getStringCellValue());
			importCost.setCommission(r.getCell(4).getStringCellValue());
			importCost.setCost(r.getCell(5).getStringCellValue());
			
			list.add(importCost);
//			if(list.size()==(rows-1)){
//				break;
//			}
        }
        try{
        	amonutService.importCost(list);
        	return 200;
        }catch(Exception e){
        	return 0;
        }
	}
	
	/**导入毛利额-地市**/
	@DS("dataSource2")@RequestMapping(value = "/exportGross", method = {RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> exportGross(HttpServletRequest request,@RequestParam("uploadGross") MultipartFile uploadGross) throws IllegalStateException, IOException{
		 Map<String,Object> result = new HashMap<String,Object>();
		if(!uploadGross.isEmpty()){
			String location=request.getSession().getServletContext().getRealPath("");
		//	System.out.println(location);
			
			//获取文件名
			String sourceName=uploadGross.getOriginalFilename();
			
			String fileName = location+File.pathSeparatorChar+sourceName;
			//存文件
			uploadGross.transferTo(new File(fileName));
			FileInputStream in=new FileInputStream(fileName);
			   //导入文件
			   Workbook wb;
			    if(fileName.endsWith(".xls")) {  
			     //Excel2003
			             wb = new HSSFWorkbook(in);  
			        } else {  
			         //Excel 2007
			             wb = new XSSFWorkbook(in);  
			      } 
			    
			    Integer num = this.importGross(wb);
			   
			    if (num==200) {
					result.put("code", 200);
				}else {
					result.put("code", "数据格式不符或重复导入 ");
				}
		}else{
			result.put("code", "文件不能为空");
		}
		return result;
	}
	
	/** 导入毛利额Excel-地市**/
	@SuppressWarnings("unused")
	private Integer importGross(Workbook workbook){
		List<ImportGrossProfit> list =new ArrayList<>();
		
		//获取第一个工作簿
		Sheet sheet = workbook.getSheetAt(0);
		//文件的数据条数
		int rows= sheet.getLastRowNum();//以最后一条数据的序号为总条数  其中，rows+1 表示包含表头行
		
		//导入前做去重处理
		Set<String> monSet = new HashSet<String>();
		String month;
		for (int i = 2; i <=rows; i++) {
			sheet.getRow(i).getCell(0).setCellType(Cell.CELL_TYPE_STRING);
			month=sheet.getRow(i).getCell(0).getStringCellValue();
			monSet.add(month);
		}
				
		repeat("month",monSet,"ZD_8TYPE_IMPORT_GROSS_PROFIT_CITY");
		
		//遍历sheet
        for (Row r : sheet) {
        	if(r.getCell(0)==null){
        		break;
        	}
        	//读取每行的数据
			if(r.getRowNum()<1){
			continue;
			}// 跳过表头
			
			//账期|地市|毛利额
			int cellNum = r.getLastCellNum();//---
			
			r.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
			r.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
			r.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
			
			ImportGrossProfit importGross = new ImportGrossProfit();
			importGross.setMonth(r.getCell(0).getStringCellValue());
			importGross.setCity(r.getCell(1).getStringCellValue());
			importGross.setValue(r.getCell(2).getStringCellValue());
			list.add(importGross);
//			if(list.size()==(rows-1)){
//				break;
//			}
        }
        try{
        	amonutService.importGross(list);
        	return 200;
        }catch(Exception e){
        	return 0;
        }
	}
	
	/**导入毛利额-品牌**/
	@DS("dataSource2")@RequestMapping(value = "/exportGross_brand", method = {RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> exportGross_brand(HttpServletRequest request,@RequestParam("uploadGross_brand") MultipartFile uploadGross_brand) throws IllegalStateException, IOException{
		 Map<String,Object> result = new HashMap<String,Object>();
		if(!uploadGross_brand.isEmpty()){
			String location=request.getSession().getServletContext().getRealPath("");
		//	System.out.println(location);
			
			//获取文件名
			String sourceName=uploadGross_brand.getOriginalFilename();
			
			String fileName = location+File.pathSeparatorChar+sourceName;
			//存文件
			uploadGross_brand.transferTo(new File(fileName));
			FileInputStream in=new FileInputStream(fileName);
			   //导入文件
			   Workbook wb;
			    if(fileName.endsWith(".xls")) {  
			     //Excel2003
			             wb = new HSSFWorkbook(in);  
			        } else {  
			         //Excel 2007
			             wb = new XSSFWorkbook(in);  
			      } 
			    
			    Integer num = this.importGross_brand(wb);
			   
			    if (num==200) {
					result.put("code", 200);
				}else {
					result.put("code", "数据格式不符或重复导入 ");
				}
		}else{
			result.put("code", "文件不能为空");
		}
		return result;
	}
	
	/** 导入毛利额Excel-品牌**/
	@SuppressWarnings("unused")
	private Integer importGross_brand(Workbook workbook){
		List<ImportGrossProfit> list =new ArrayList<>();
		
		//获取第一个工作簿
		Sheet sheet = workbook.getSheetAt(0);
		//文件的数据条数
		int rows= sheet.getLastRowNum();//以最后一条数据的序号为总条数  其中，rows+1 表示包含表头行
		
		//导入前做去重处理
		Set<String> monSet = new HashSet<String>();
		String month;
		for (int i = 2; i <=rows; i++) {
			sheet.getRow(i).getCell(0).setCellType(Cell.CELL_TYPE_STRING);
			month=sheet.getRow(i).getCell(0).getStringCellValue();
			monSet.add(month);
		}
		
		repeat("month",monSet,"ZD_8TYPE_IMPORT_GROSS_PROFIT_BRAND");

		//遍历sheet
        for (Row r : sheet) {
        	if(r.getCell(0)==null){
        		break;
        	}
        	//读取每行的数据
			if(r.getRowNum()<1){
			continue;
			}// 跳过表头
		//	System.out.println();
			//账期|品牌|毛利额
			int cellNum = r.getLastCellNum();//---
			
			r.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
			r.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
			r.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
			
			ImportGrossProfit importGross = new ImportGrossProfit();
			importGross.setMonth(r.getCell(0).getStringCellValue());
			importGross.setBrand(r.getCell(1).getStringCellValue());
			importGross.setValue(r.getCell(2).getStringCellValue());
			list.add(importGross);
//			if(list.size()==(rows-1)){
//				break;
//			}
        }
        try{
        	amonutService.importGross_brand(list);
        	return 200;
        }catch(Exception e){
        	return 0;
        }
	}
	
	@DS("dataSource2")@RequestMapping(value = "/initBatchExport", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public void initBatchExport(Locale locale, Model model,HttpServletRequest request,HttpServletResponse response){
		ResultMap data =ResultMap.defaultResultMap(); //new HashMap<String,Object>();
		//Map<String,String>  param = RequestUtils.getParamsMap(request);
		Map<String,String>  param =new HashMap<String,String>();
		Map map = request.getParameterMap();
		String current_sub_num = request.getParameter("current_sub_num");
		String startMonth = request.getParameter("startMonth");
		String stopMonth = request.getParameter("stopMonth");
		String dim_key = request.getParameter("dim_key");
		String type = request.getParameter("type");
		String colNames="";
		try {
			colNames = URLDecoder.decode(request.getParameter("colNames"),"UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		for (int i = 1; i <=Integer.parseInt(current_sub_num); i++) {
			String parent_key = "parent_dim_"+(i);
			param.put(parent_key, request.getParameter(parent_key));
		}
		param.put("current_sub_num", current_sub_num);
		param.put("startMonth",startMonth );
		param.put("stopMonth",stopMonth );
		param.put("dim_key", dim_key);
		param.put("type", type);
		param.put("colNames", colNames);
		
		
		//Map<String, String> changeDF = changeDateFormate(param);
		
		
		
		//需导出的数据
		if(dim_key.indexOf("return_rate")!=-1){//导出的方法为  退货率  则走此分支
			List<ReturnRate> list = amonutService.initJqGridRR(param);			//退货率  详情数据的
			BatchExport(list,request,response,param);
		}else if(dim_key.indexOf("inventory")!=-1){
			List<ZdResult8MonscmM> list = amonutService.initJqGrid_invent(param);			//库龄库存 详情数据的
			BatchExport_invent(list,request,response,param);
		}else if(dim_key.indexOf("retail_company")!=-1){
			List<ZdResult8AreaD> list = amonutService.initJqGrid_retail(param);			//我司零售量  详情数据的
			BatchExport_retail(list,request,response,param);
		}else{
		JSONObject jsobj =  JSONObject.fromObject(param.get("colNames"));
		Map<String, String> mapJson = JSONObject.fromObject(jsobj);
		
		List<Map> list = amonutService.initJqGridExport(param);
 
		
		//初始化导出Excel
		// 第一步，创建一个webbook，对应一个Excel文件 
		  HSSFWorkbook wb = new HSSFWorkbook(); 
		  // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet 
		  HSSFSheet sheet = wb.createSheet("Sheet1"); 
		  // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short 
		  HSSFRow row = sheet.createRow(0); 
		  // 第四步，创建单元格，并设置值表头 设置表头居中 
		  HSSFCellStyle style = wb.createCellStyle(); 
		  style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式 

		  HSSFCell cell = row.createCell(0);
		  //'账期', '地市', '品牌','机型', '价格段', '客户','分类客户', 'subtype','value'
		  int cellNum=1;
		  for(String key :mapJson.keySet()) {
			  cell.setCellValue(mapJson.get(key)); 
			  cell.setCellStyle(style); 
			  cell = row.createCell(cellNum);
			  cellNum++;
		  }
		/*  cell.setCellValue("账期"); 
		  cell.setCellStyle(style); 
		  cell = row.createCell(1); 
		  cell.setCellValue("地市"); 
		  cell.setCellStyle(style); 
		  cell = row.createCell(2); 
		  cell.setCellValue("品牌"); 
		  cell.setCellStyle(style); 
		  cell = row.createCell(3); 
		  cell.setCellValue("机型"); 
		  cell.setCellStyle(style);
		  cell = row.createCell(4); 
		  cell.setCellValue("价格段"); 
		  cell.setCellStyle(style);
		  cell = row.createCell(5); 
		  cell.setCellValue("客户"); 
		  cell.setCellStyle(style);
		  cell = row.createCell(6); 
		  cell.setCellValue("分类客户"); 
		  cell.setCellStyle(style);
		  cell = row.createCell(7); 
		  cell.setCellValue("子类"); 
		  cell.setCellStyle(style);
		  cell = row.createCell(8); 
		  cell.setCellValue("值"); 
		  cell.setCellStyle(style);*/

		  // 第五步，写入实体数据
		  for (int i = 0; i < list.size(); i++){ 
			   row = sheet.createRow(i + 1); 
			   Map zdResult = list.get(i);
			   int cell_num=0;
			   for(String key :mapJson.keySet()) {
				   row.createCell(cell_num).setCellValue(String.valueOf(zdResult.get(key))); 
				   cell_num++;
			   }
			   // 第四步，创建单元格，并设置值 
			/*   row.createCell(0).setCellValue(zdResult.getStatDay()); 
			   row.createCell(1).setCellValue(zdResult.getAreaName()); 
			   row.createCell(2).setCellValue(zdResult.getBrandName()); 
			   row.createCell(3).setCellValue(zdResult.getSpec()); 
			   row.createCell(4).setCellValue(zdResult.getPriceRange()); 
			   row.createCell(5).setCellValue(zdResult.getCustName()); 
			   row.createCell(6).setCellValue(zdResult.getCustStage()); 
			   row.createCell(7).setCellValue(zdResult.getSubType()); 
			   row.createCell(8).setCellValue(zdResult.getValue()); */
//			   cell = row.createCell(3); 
//			   cell.setCellValue(new SimpleDateFormat("yyyy-MM-dd").format(stu.getTime())); 
			  }

		//第六步,输出Excel文件
		  try {
		  OutputStream output=response.getOutputStream();
		  response.reset();
		  SimpleDateFormat df = new SimpleDateFormat("yyyy_MM_dd HHmmss");//设置日期格式
		  String fileName = dim_key+df.format(new Date());// new Date()为获取当前系统时间
		  response.setHeader("Content-disposition", "attachment; filename="+fileName+".xls");
		  response.setContentType("application/msexcel");  
		
			wb.write(output);
			output.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
			
		}

		//return resultMap;
	}
	
//------------编辑促销人数------------------------------------------	
	@DS("dataSource")@RequestMapping(value = "/dialog/editTeamIncome_dialog")
	public ModelAndView getTeamDialog(String limit) {
		ModelAndView modelAndView = new ModelAndView("/dialog/editTeamIncome_dialog");
		return modelAndView;
	}
	//促销人员信息列表
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@DS("dataSource")@RequestMapping(value = "/getPersonList", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public PageInfo getPersonList(@RequestBody Map<String,String>  params){
		
		Integer page = Integer.parseInt(params.get("page"));
		Integer pageSize = Integer.parseInt(params.get("pageSize"));
		Integer pageNo= (page-1)*pageSize;
		params.put("pageNo", pageNo.toString());
		String startMonth = (String) params.get("startMonth");
		String stopMonth = (String) params.get("stopMonth");
		List<ImportPeopleNum> list=amonutService.getPersonList(params);
		Integer totalCount = amonutService.getTotalByPerson(params);
		int totalPage = (totalCount+ pageSize-1) / pageSize;
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPage(page);
		pageInfo.setPageSize(pageSize);
		pageInfo.setTotalPages(totalPage);
		pageInfo.setTotalCount(totalCount);
		pageInfo.setList(list);
		return pageInfo;
	}
	
//-----------编辑团队收入--------------------------------------------	
		@DS("dataSource")@RequestMapping(value = "/dialog/editPersonDialog")
		public ModelAndView getDialog(String limit) {
			ModelAndView modelAndView = new ModelAndView("/dialog/editPerson_dialog");
			return modelAndView;
		}
	//团队收入信息列表
		@SuppressWarnings({ "rawtypes", "unchecked" })
		@DS("dataSource")@RequestMapping(value = "/getTeamList", method = {RequestMethod.GET,RequestMethod.POST})
		@ResponseBody
		public PageInfo getTeamList(@RequestBody Map<String,String>  params){
			
			Integer page = Integer.parseInt(params.get("page"));
			Integer pageSize = Integer.parseInt(params.get("pageSize"));
			Integer pageNo= (page-1)*pageSize;
			params.put("pageNo", pageNo.toString());
			String startMonth = (String) params.get("startMonth");
			String stopMonth = (String) params.get("stopMonth");
			List<ImportTeamIncom> list=amonutService.getTeamList(params);
			Integer totalCount = amonutService.getTotalByTeam(params);
			int totalPage = (totalCount+ pageSize-1) / pageSize;
			PageInfo pageInfo = new PageInfo();
			pageInfo.setPage(page);
			pageInfo.setPageSize(pageSize);
			pageInfo.setTotalPages(totalPage);
			pageInfo.setTotalCount(totalCount);
			pageInfo.setList(list);
			return pageInfo;
		}
		
//-------------------------------费用  佣金---------------------------------------
				@DS("dataSource")@RequestMapping(value = "/dialog/editCost_dialog")
				public ModelAndView getCostDialog(String limit) {
					ModelAndView modelAndView = new ModelAndView("/dialog/editCost_dialog");
					return modelAndView;
				}
			//费用  佣金信息列表
				@SuppressWarnings({ "rawtypes", "unchecked" })
				@DS("dataSource")@RequestMapping(value = "/getCostList", method = {RequestMethod.GET,RequestMethod.POST})
				@ResponseBody
				public PageInfo getCostList(@RequestBody Map<String,String>  params){
					
					Integer page = Integer.parseInt(params.get("page"));
					Integer pageSize = Integer.parseInt(params.get("pageSize"));
					Integer pageNo= (page-1)*pageSize;
					params.put("pageNo", pageNo.toString());
					String startMonth = (String) params.get("startMonth");
					String stopMonth = (String) params.get("stopMonth");
					List<ImportCost> list=amonutService.getCostList(params);
					Integer totalCount = amonutService.getTotalByCost(params);
					int totalPage = (totalCount+ pageSize-1) / pageSize;
					PageInfo pageInfo = new PageInfo();
					pageInfo.setPage(page);
					pageInfo.setPageSize(pageSize);
					pageInfo.setTotalPages(totalPage);
					pageInfo.setTotalCount(totalCount);
					pageInfo.setList(list);
					return pageInfo;
				}
				
//---------------------------毛利额--------------------------------------------
				@DS("dataSource")@RequestMapping(value = "/dialog/editGross_dialog")
				public ModelAndView getGrossDialog(String limit) {
					ModelAndView modelAndView = new ModelAndView("/dialog/editGross_dialog");
					return modelAndView;
				}
			//毛利额信息列表
				@SuppressWarnings({ "rawtypes", "unchecked" })
				@DS("dataSource")@RequestMapping(value = "/getGrossList", method = {RequestMethod.GET,RequestMethod.POST})
				@ResponseBody
				public PageInfo getGrossList(@RequestBody Map<String,String>  params){
					
					Integer page = Integer.parseInt(params.get("page"));
					Integer pageSize = Integer.parseInt(params.get("pageSize"));
					Integer pageNo= (page-1)*pageSize;
					params.put("pageNo", pageNo.toString());
					String startMonth = (String) params.get("startMonth");
					String stopMonth = (String) params.get("stopMonth");
					List<ImportGrossProfit> list=amonutService.getGrossList(params);
					Integer totalCount = amonutService.getTotalByGross(params);
					int totalPage = (totalCount+ pageSize-1) / pageSize;
					PageInfo pageInfo = new PageInfo();
					pageInfo.setPage(page);
					pageInfo.setPageSize(pageSize);
					pageInfo.setTotalPages(totalPage);
					pageInfo.setTotalCount(totalCount);
					pageInfo.setList(list);
					return pageInfo;
				}
		
	//库龄库存量  
	@DS("dataSource")@RequestMapping(value = "/inventory_number", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public EcharDataVo getInventory_number(Locale locale, Model model,HttpServletRequest request) {
		Map<String,String>  param = RequestUtils.getParamsMap(request);
		EcharDataVo inventory_number = amonutService.getInventory_number(param);
		return inventory_number;
	}
	//库龄库存金额 
	@DS("dataSource")@RequestMapping(value = "/inventory_money", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public EcharDataVo getInventory_money(Locale locale, Model model,HttpServletRequest request) {
		Map<String,String>  param = RequestUtils.getParamsMap(request);
		EcharDataVo inventory_money = amonutService.getInventory_money(param);
		return inventory_money;
	}
	
	//库龄库存合计值
		@DS("dataSource")@RequestMapping(value = "/inventory_all", method = {RequestMethod.GET,RequestMethod.POST})
		@ResponseBody
		public Map<String, Object> getInventory_all(Locale locale, Model model,HttpServletRequest request) {
			Map<String,String>  param = RequestUtils.getParamsMap(request);
			
			Map<String, Object> result = amonutService.getInventory_all(param);
			return result;
		}
	
	public Map<String,String> changeDateFormate(Map<String,String> param){
		
		param.put("startMonth", param.get("startMonth")+"01");
		String month= param.get("stopMonth").substring(4);
		int key=Integer.parseInt(month);
		switch (key) {
		case 1:case 3:case 5:case 7:case 8:case 10:case 12:
			param.put("stopMonth", param.get("stopMonth")+"31");
			break;
		case 4:case 6:case 9:case 11:
			param.put("stopMonth", param.get("stopMonth")+"30");
			break;
		case 2:
			param.put("stopMonth", param.get("stopMonth")+"28");
			break;
		default:
			break;
		}
		return param;
		
	}
	
		//编辑-保存促销人员
			@DS("dataSource")@RequestMapping(value = "/updateByPerson", method = {RequestMethod.GET,RequestMethod.POST})
			@ResponseBody
			public Map<String, Object> updateByPerson(@RequestBody Map<String,String>  params) {
				Map<String, Object> map = new  HashMap<String, Object>();
				amonutService.updateByPerson(params);
				return map;
			}
			
			//编辑-保存团队收入
			@DS("dataSource")@RequestMapping(value = "/updateByTeam", method = {RequestMethod.GET,RequestMethod.POST})
			@ResponseBody
			public Map<String, Object> updateByTeam(@RequestBody Map<String,String>  params) {
				Map<String, Object> map = new  HashMap<String, Object>();
				amonutService.updateByTeam(params);
				return map;
			}
			//编辑-保存费用  佣金
			@DS("dataSource")@RequestMapping(value = "/updateByCost", method = {RequestMethod.GET,RequestMethod.POST})
			@ResponseBody
			public Map<String, Object> updateByCost(@RequestBody Map<String,String>  params) {
				Map<String, Object> map = new  HashMap<String, Object>();
				amonutService.updateByCost(params);
				return map;
			}
			//编辑-保存毛利额
			@DS("dataSource")@RequestMapping(value = "/updateByGross", method = {RequestMethod.GET,RequestMethod.POST})
			@ResponseBody
			public Map<String, Object> updateByGross(@RequestBody Map<String,String>  params) {
				Map<String, Object> map = new  HashMap<String, Object>();
				amonutService.updateByGross(params);
				return map;
			}
			
			//新增 -- 费用 -佣金 addCost
			@DS("dataSource")@RequestMapping(value = "/addCost", method = {RequestMethod.GET,RequestMethod.POST})
			@ResponseBody
			public Map<String, Object> addCost(@RequestBody Map<String,String>  params) {
				Map<String, Object> map = amonutService.addCost(params);
				return map;
			}
			//新增 -- 毛利额   addGross
			@DS("dataSource")@RequestMapping(value = "/addGross", method = {RequestMethod.GET,RequestMethod.POST})
			@ResponseBody
			public Map<String, Object> addGross(@RequestBody Map<String,String>  params) {
				Map<String, Object> map = amonutService.addGross(params);
				return map;
			}
			
			//新增 -- 促销人员数 addPerson
			@DS("dataSource")@RequestMapping(value = "/addPerson", method = {RequestMethod.GET,RequestMethod.POST})
			@ResponseBody
			public Map<String, Object> addPerson(@RequestBody Map<String,String>  params) {
				Map<String, Object> map = amonutService.addPerson(params);
				return map;
			}
			//新增 -- 售后团队收入 addTeam
			@DS("dataSource")@RequestMapping(value = "/addTeam", method = {RequestMethod.GET,RequestMethod.POST})
			@ResponseBody
			public Map<String, Object> addTeam(@RequestBody Map<String,String>  params) {
				Map<String, Object> map = amonutService.addTeam(params);
				return map;
			}
			
			
			public static void BatchExport(List<ReturnRate> list,HttpServletRequest request,HttpServletResponse response,Map<String,String>  param){
				String dim_key =param.get("dim_key");
				
				//初始化导出Excel
				// 第一步，创建一个webbook，对应一个Excel文件 
				  HSSFWorkbook wb = new HSSFWorkbook(); 
				  // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet 
				  HSSFSheet sheet = wb.createSheet("Sheet1"); 
				  // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short 
				  HSSFRow row = sheet.createRow(0); 
				  // 第四步，创建单元格，并设置值表头 设置表头居中 
				  HSSFCellStyle style = wb.createCellStyle(); 
				  style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式 
				  
				  HSSFCell cell = row.createCell(0);
				
				if(dim_key.indexOf("znyj_return_rate")!=-1){//智能硬件发货与退货情况 
					//'账期','行业名称', '发货量','退货量', '退货率'
					String[] names={"账期","行业名称", "发货量","退货量", "退货率"};
					for (int i = 0; i < names.length; i++) {
						cell.setCellValue(names[i]); 
						cell.setCellStyle(style); 
						cell = row.createCell(i+1);
					}
					  
					for (int i = 0; i < list.size(); i++){ 
						   row = sheet.createRow(i + 1); 
						   ReturnRate rate = list.get(i); 
						   // 第四步，创建单元格，并设置值 
						   row.createCell(0).setCellValue(rate.getMonth()); 
						   row.createCell(1).setCellValue(rate.getPmName()); 
						   row.createCell(2).setCellValue(rate.getSendAmount()); 
						   row.createCell(3).setCellValue(rate.getReturnAmount()); 
						   row.createCell(4).setCellType(HSSFCell.CELL_TYPE_STRING); 
						   row.createCell(4).setCellValue(rate.getReturnRatio()+"%"); 
						  }
					
				}else if(dim_key.indexOf("cpjl_return_rate")!=-1){//产品经理退货台数
					//'账期', '所在线条','产品经理','已发量（台）','退货量（台）-普通机', '退货量（台）-体验机','退货量（台）','退货率'
					String[] names={"账期", "所在线条","产品经理","已发量（台）","退货量（台）-普通机", "退货量（台）-体验机","退货量（台）","退货率"};
					for (int i = 0; i < names.length; i++) {
						cell.setCellValue(names[i]); 
						cell.setCellStyle(style); 
						cell = row.createCell(i+1);
					}
					  
					for (int i = 0; i < list.size(); i++){ 
						   row = sheet.createRow(i + 1); 
						   ReturnRate rate = list.get(i); 
						   // 第四步，创建单元格，并设置值 
						   row.createCell(0).setCellValue(rate.getMonth()); 
						   row.createCell(1).setCellValue(rate.getPmBelone()); 
						   row.createCell(2).setCellValue(rate.getPmName()); 
						   row.createCell(3).setCellValue(rate.getSendAmount()); 
						   row.createCell(4).setCellValue(rate.getNormalReturnAmount()); 
						   row.createCell(5).setCellValue(rate.getExperienceReturnAmount()); 
						   row.createCell(6).setCellValue(rate.getReturnAmount()); 
						   row.createCell(7).setCellType(HSSFCell.CELL_TYPE_STRING); 
						   row.createCell(7).setCellValue(rate.getReturnRatio()+"%"); 
						  }
				}else if(dim_key.indexOf("hsfs_return_rate")!=-1){//回收方式
					//'账期', '全省退货量','非自主回收','非自主回收占总退货率','非自主回收环比', '自主回收','自主回收占总退货率','自主回收环比'
					String[] names={"账期", "全省退货量","非自主回收","非自主回收占总退货率","非自主回收环比", "自主回收","自主回收占总退货率","自主回收环比"};
					for (int i = 0; i < names.length; i++) {
						cell.setCellValue(names[i]); 
						cell.setCellStyle(style); 
						cell = row.createCell(i+1);
					}
					  
					for (int i = 0; i < list.size(); i++){ 
						   row = sheet.createRow(i + 1); 
						   ReturnRate rate = list.get(i); 
						   // 第四步，创建单元格，并设置值 
						   row.createCell(0).setCellValue(rate.getMonth()); 
						   row.createCell(1).setCellValue(rate.getProvinceReturnAmount()); 
						   row.createCell(2).setCellValue(rate.getInvoluntaryReturnAmount()); 
						   row.createCell(3).setCellValue(rate.getInvoluntaryReturnRatio()); 
						   row.createCell(4).setCellType(HSSFCell.CELL_TYPE_STRING); 
						   row.createCell(4).setCellValue(rate.getInvoluntaryReturnRinkRatio()+"%"); 
						   row.createCell(5).setCellValue(rate.getAutonomousReturnAmount()); 
						   row.createCell(6).setCellValue(rate.getAutonomousReturnRatio()); 
						   row.createCell(7).setCellType(HSSFCell.CELL_TYPE_STRING); 
						   row.createCell(7).setCellValue(rate.getAutonomousReturnRinkRatio()+"%"); 
						  }
				}else{//退货率  一类的详情表格1-6张表
					//'账期', '地市', '发货量','退货量', '退货率'
					String[] names={"账期", "地市", "发货量","退货量", "退货率"};
					for (int i = 0; i < names.length; i++) {
						cell.setCellValue(names[i]); 
						cell.setCellStyle(style); 
						cell = row.createCell(i+1);
					}
					  
					for (int i = 0; i < list.size(); i++){ 
						   row = sheet.createRow(i + 1); 
						   ReturnRate rate = list.get(i); 
						   // 第四步，创建单元格，并设置值 
						   row.createCell(0).setCellValue(rate.getMonth()); 
						   row.createCell(1).setCellValue(rate.getCity()); 
						   row.createCell(2).setCellValue(rate.getSendAmount()); 
						   row.createCell(3).setCellValue(rate.getReturnAmount()); 
						   row.createCell(4).setCellType(HSSFCell.CELL_TYPE_STRING); 
						   row.createCell(4).setCellValue(rate.getReturnRatio()+"%"); 
						  }
				}
				
				//第六步,输出Excel文件
				  try {
				  OutputStream output=response.getOutputStream();
				  response.reset();
				  
				  Map<String,String> fileNames =new HashMap<String,String>();
				  fileNames.put("jq_city_return_rate_up", "各地市退货率-上半月");
				  fileNames.put("jq_city_return_rate_down", "各地市退货率-全月");
				  fileNames.put("jq_city_retail_return_rate_up", "零售各地市退货率-上半月");
				  fileNames.put("jq_city_retail_return_rate_down", "零售各地市退货率-全月");
				  fileNames.put("jq_city_tt_return_rate_up", "铁通各地市退货率-上半月");
				  fileNames.put("jq_city_tt_return_rate_down", "铁通各地市退货率-全月");
				  fileNames.put("jq_city_zgds_return_rate_up", "直供代售各地市退货率-上半月");
				  fileNames.put("jq_city_zgds_return_rate_down", "直供代售各地市退货率-全月");
				  fileNames.put("jq_city_rgs_return_rate_up", "入柜商各地市退货率-上半月");
				  fileNames.put("jq_city_rgs_return_rate_down", "入柜商各地市退货率-全月");
				  fileNames.put("jq_city_zydx_return_rate_up", "自营代销各地市退货率-上半月");
				  fileNames.put("jq_city_zydx_return_rate_down", "自营代销各地市退货率-全月");
				  fileNames.put("jq_znyj_return_rate_up", "智能硬件发货与退货情况-上半月");
				  fileNames.put("jq_znyj_return_rate_down", "智能硬件发货与退货情况-全月");
				  fileNames.put("jq_cpjl_return_rate_up", "产品经理退货台数-上半月");
				  fileNames.put("jq_cpjl_return_rate_down", "产品经理退货台数-全月");
				  fileNames.put("jq_hsfs_return_rate_up", "回收方式-上半月");
				  fileNames.put("jq_hsfs_return_rate_down", "回收方式-全月");
				  
				  String month = param.get("startMonth");
				  String fileName = month.substring(0, 6)+fileNames.get(dim_key);// new Date()为获取当前系统时间
				  String agent = request.getHeader("USER-AGENT").toLowerCase();
				  String codedFileName = java.net.URLEncoder.encode(fileName, "UTF-8");
//				  response.setHeader("Content-disposition", "attachment; filename="+fileName+".xls");
				  
			      response.setHeader("content-disposition", "attachment;filename=" + codedFileName + ".xls");
				  response.setContentType("application/msexcel; charset=utf-8");  
				
					wb.write(output);
					output.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}
			
			public static void BatchExport_invent(List<ZdResult8MonscmM> list,HttpServletRequest request,HttpServletResponse response,Map<String,String>  param){
				String dim_key =param.get("dim_key");
				
				//初始化导出Excel
				// 第一步，创建一个webbook，对应一个Excel文件 
				  HSSFWorkbook wb = new HSSFWorkbook(); 
				  // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet 
				  HSSFSheet sheet = wb.createSheet("Sheet1"); 
				  // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short 
				  HSSFRow row = sheet.createRow(0); 
				  // 第四步，创建单元格，并设置值表头 设置表头居中 
				  HSSFCellStyle style = wb.createCellStyle(); 
				  style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式 
				  
				  HSSFCell cell = row.createCell(0);
				
					//'账期', '地市', '发货量','退货量', '退货率'
					String[] names;
						if(dim_key=="inventory_money"){
							names=new String[]{"月份", "品牌","类型", "库龄","库存金额"};
						}else{
							names=new String[]{"月份", "品牌","类型", "库龄","库存量"};
						}
						
					for (int i = 0; i < names.length; i++) {
						cell.setCellValue(names[i]); 
						cell.setCellStyle(style); 
						cell = row.createCell(i+1);
					}
					  
					for (int i = 0; i < list.size(); i++){ 
						   row = sheet.createRow(i + 1); 
						   ZdResult8MonscmM rate = list.get(i); 
						   // 第四步，创建单元格，并设置值 
						   row.createCell(0).setCellValue(rate.getMonth()); 
						   row.createCell(1).setCellValue(rate.getBrandName()); 
						   row.createCell(2).setCellValue(rate.getSpec()); 
						   row.createCell(3).setCellValue(rate.getSubtype()); 
						   row.createCell(4).setCellValue(rate.getValue()); 
						  }
				
				//第六步,输出Excel文件
				  try {
				  OutputStream output=response.getOutputStream();
				  response.reset();
				  
				  Map<String,String> fileNames =new HashMap<String,String>();
				  fileNames.put("inventory_money", "库龄库存金额");
				  fileNames.put("inventory_amount", "库龄库存量");
				  String flag;
				  if(dim_key.indexOf("inventory_money")!=-1){
					  flag="inventory_money";
				  }else{
					  flag="inventory_amount";
				  }
				  
				  String month = param.get("startMonth").substring(0, 6)+"-"+param.get("stopMonth").substring(0, 6);
				  String fileName = month+fileNames.get(flag);// new Date()为获取当前系统时间
				  String agent = request.getHeader("USER-AGENT").toLowerCase();
				  String codedFileName = java.net.URLEncoder.encode(fileName, "UTF-8");
//				  response.setHeader("Content-disposition", "attachment; filename="+fileName+".xls");
				  
			      response.setHeader("content-disposition", "attachment;filename=" + codedFileName + ".xls");
				  response.setContentType("application/msexcel; charset=utf-8");  
				
					wb.write(output);
					output.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}
			
			public static void BatchExport_retail(List<ZdResult8AreaD> list,HttpServletRequest request,HttpServletResponse response,Map<String,String>  param){
				String dim_key =param.get("dim_key");
				
				//初始化导出Excel
				// 第一步，创建一个webbook，对应一个Excel文件 
				  HSSFWorkbook wb = new HSSFWorkbook(); 
				  // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet 
				  HSSFSheet sheet = wb.createSheet("Sheet1"); 
				  // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short 
				  HSSFRow row = sheet.createRow(0); 
				  // 第四步，创建单元格，并设置值表头 设置表头居中 
				  HSSFCellStyle style = wb.createCellStyle(); 
				  style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式 
				  
				  HSSFCell cell = row.createCell(0);
				
					//'账期', '地市', '发货量','退货量', '退货率'
					String[] names=new String[]{"月份", "地市","厅店类型", "厅店名称","销量"};
						
					for (int i = 0; i < names.length; i++) {
						cell.setCellValue(names[i]); 
						cell.setCellStyle(style); 
						cell = row.createCell(i+1);
					}
					  
					for (int i = 0; i < list.size(); i++){ 
						   row = sheet.createRow(i + 1); 
						   ZdResult8AreaD rate = list.get(i); 
						   // 第四步，创建单元格，并设置值 
						   row.createCell(0).setCellValue(rate.getMonth()); 
						   row.createCell(1).setCellValue(rate.getAreaname()); 
						   row.createCell(2).setCellValue(rate.getSubname()); 
						   row.createCell(3).setCellValue(rate.getTfullname()); 
						   row.createCell(4).setCellValue(rate.getValue()); 
						  }
				
				//第六步,输出Excel文件
				  try {
				  OutputStream output=response.getOutputStream();
				  response.reset();
				  
				  Map<String,String> fileNames =new HashMap<String,String>();
				  fileNames.put("subname", "厅店列表");
				  
				  String month = param.get("startMonth").substring(0, 6)+"-"+param.get("stopMonth").substring(0, 6);
				  String fileName = month+fileNames.get("subname");// new Date()为获取当前系统时间
				  String agent = request.getHeader("USER-AGENT").toLowerCase();
				  String codedFileName = java.net.URLEncoder.encode(fileName, "UTF-8");
//				  response.setHeader("Content-disposition", "attachment; filename="+fileName+".xls");
				  
			      response.setHeader("content-disposition", "attachment;filename=" + codedFileName + ".xls");
				  response.setContentType("application/msexcel; charset=utf-8");  
				
					wb.write(output);
					output.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}
			
			//毛利额  总览
			@DS("dataSource")@RequestMapping(value = "/gross_profit_zl", method = {RequestMethod.GET,RequestMethod.POST})
			@ResponseBody
			public Map<String, Object> gross_profit_zl(@RequestBody Map<String,String>  params) {
				Map<String,Object> result= amonutService.gross_profit_zl(params);
				return result;
			}
			
			//去重
			public  void repeat(String monthField,Set<String> monSet,String tableName){
				amonutService.repeat(monthField,monSet,tableName);
			}
			
			//总览为特殊处理的 指标查询  【信息来源人】和【确认人】
			@DS("dataSource")@RequestMapping(value = "/zlConfirmInfTS", method = {RequestMethod.GET,RequestMethod.POST})
			@ResponseBody
			public Zd8typeInfoConfirm zlConfirmInfTS(@RequestBody Map<String,String>  params) {
				Zd8typeInfoConfirm result= amonutService.zlConfirmInfTS(params.get("id"));
				return result;
			} 
			
			//-----------数据确认窗口跳转------------------------------------------	
			@DS("dataSource")@RequestMapping(value = "/dialog/confirmInfo_dialog")
			public ModelAndView confirmInfo(String limit) {
				
				Subject subject = SecurityUtils.getSubject();
				if(subject.isPermitted(limit+":*")) {
				    //有权限
					ModelAndView modelAndView = new ModelAndView("/dialog/confirmInfo_dialog");
					return modelAndView;
				} else{
				    //无权限
					ModelAndView modelAndView = new ModelAndView("/dialog/error_dialog");
					return modelAndView;
				}
			}
			//查询数据确认日志
			@DS("dataSource")@RequestMapping(value = "/confirm_log")
			@ResponseBody
			public Zd8typeInfoConfirmLog getConfirmLog(@RequestBody Map<String,String>  params) {
				
				Zd8typeInfoConfirmLog result =new Zd8typeInfoConfirmLog();
				result= amonutService.getConfirmLog(params);
				return result;
			} 

			// 保存确认日志    要去重   一个指标只能对应一条记录
			@DS("dataSource")@RequestMapping(value = "/insertInfo")
			@ResponseBody
			public void insertInfo(@RequestBody Map<String,String>  params) {
				amonutService.insertInfo(params);
			} 

			//平台份额详情按钮dialog
			@DS("dataSource")@RequestMapping(value = "/dialog/platform_share_dialog")
			public ModelAndView platform_share_details(String limit) {
				ModelAndView modelAndView = new ModelAndView("/dialog/platform_share_dialog");
				return modelAndView;
			}
			
			
			//八字 -份-平台份额-详情按钮-弹窗界面数据获取 
			@DS("dataSource")@RequestMapping(value = "/getCharData_share", method = {RequestMethod.GET,RequestMethod.POST})
			@ResponseBody
			public EcharDataVo getCharData_share(Locale locale, Model model,HttpServletRequest request) {
				Map<String,String>  param = RequestUtils.getParamsMap(request);
				
				EcharDataVo echarDataVo = amonutService.getEcharDataVo_share(param);
				return echarDataVo;
			}
			
			//获取目标值
			@DS("dataSource")@RequestMapping(value = "/getMbz", method = {RequestMethod.GET,RequestMethod.POST})
			@ResponseBody
			public String getMbz(@RequestBody Map<String,String>  param) {
				String mbz = amonutService.getMbz(param);
				return mbz;
			}
			
			//通过指标id获取八字备注
			@DS("dataSource")@RequestMapping(value = "/getRemarks", method = {RequestMethod.GET,RequestMethod.POST})
			@ResponseBody
			public Map<String,String> getRemarks(@RequestBody Map<String,String>  param) {
				String remarks  = amonutService.getRemarks(param);
				Map<String,String> result =new HashMap<String,String>();
				result.put("remarks", remarks);
				return result;
			}
			//编辑八字备注 
		//	@RequiresPermissions("remarks_all:dialog")
			@DS("dataSource")@RequestMapping(value = "/dialog/remarks_dialog")
			public ModelAndView remarks_dialog(String limit) {
				ModelAndView modelAndView = new ModelAndView("/dialog/remarks_dialog");
				return modelAndView;
			}
			//保存八字的备注
			@DS("dataSource")@RequestMapping(value = "/saveRemarks", method = {RequestMethod.GET,RequestMethod.POST})
			@ResponseBody
			public void saveRemarks(@RequestBody Map<String,String>  param) {
				amonutService.saveRemarks(param);
			}
			//获取利的备注
			@DS("dataSource")@RequestMapping(value = "/getProfitRemarks", method = {RequestMethod.GET,RequestMethod.POST})
			@ResponseBody
			public Map<String,String> getProfitRemarks(@RequestBody Map<String,String>  param) {
				Map<String,String> remarks  = amonutService.getProfitRemarks(param);
				return remarks;
			}
			//编辑利的备注 
			@RequiresPermissions("ml_zjlr:dialog")
			@DS("dataSource")@RequestMapping(value = "/dialog/ml_zjlr_dialog")
			public ModelAndView ml_zjlr_dialog(String limit) {
				ModelAndView modelAndView = new ModelAndView("/dialog/ml_zjlr_dialog");
				return modelAndView;
			}
			//保存利的备注
			@DS("dataSource")@RequestMapping(value = "/saveProfitR", method = {RequestMethod.GET,RequestMethod.POST})
			@ResponseBody
			public void saveProfitR(@RequestBody Map<String,String>  param) {
				amonutService.saveProfitR(param);
			}

			//在利中选择维度一   改变相应指标总览值。（因为两大计划  和 五大野战区 的统计值有差异）
			@DS("dataSource2")@RequestMapping(value = "/dimOneToKpiVal", method = {RequestMethod.GET,RequestMethod.POST})
			@ResponseBody
			public Map<String,String> dimOneToKpiVal(@RequestBody Map<String,String>  param) {
				Map<String,String> result =amonutService.dimOneToKpiVal(param);
				return result;
			}
 }

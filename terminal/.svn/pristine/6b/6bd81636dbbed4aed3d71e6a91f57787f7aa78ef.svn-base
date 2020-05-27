package com.asiainfo.cmc.service.impl.model.eightCharacters;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.authority.pojo.User;
import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.SumProvstockGd;
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
import com.asiainfo.cmc.enties.model.eightCharacters.ZdEightDimDict;
import com.asiainfo.cmc.mapper.model.eightCharacters.AmountMapper;
import com.asiainfo.cmc.service.model.eightCharacters.IAmonutService;
import com.asiainfo.cmc.utils.DateUtils;
import com.asiainfo.cmc.utils.sqlUtils.SqlMapper;
import com.asiainfo.cmc.vo.model.EcharDataVo;
import com.asiainfo.cmc.vo.model.PieCharVo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
 
@Service
@Transactional
public class AmountService implements IAmonutService{

	
	@Resource//自动注入
	private  SqlSession sqlSession;
	
	@Resource
	private  AmountMapper amountMapper;
	
	   
	
	
	@Override
	public List<ZdEightDimDict> getDimMods(Map<String,String> param) {
		 
		List<ZdEightDimDict> list = amountMapper.getDimMods(param);
		
		return list ;
	}


	@Override
	public List<Map<String,String>> getKpis(Map<String, String> param) {
		 
		return amountMapper.getKpis(param);
	}


	@Override
	public EcharDataVo getPieCharData(String sql,Map<String, String> param) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public EcharDataVo getEcharDataVo(Map<String, String> param) {
		//param.put("dim_key", "four_platoon_sales_company");
		EcharDataVo echarDataVo = new EcharDataVo();
		ZdEightDimDict zdEightDimDict = amountMapper.getDimDictByDim(param);
       
		switch (zdEightDimDict.getCharType()) {
		case "pie":
			echarDataVo = getCharDataToPie( zdEightDimDict.getResultTable(),param,zdEightDimDict.getKpiCycle());
			break;
		case "bar":
			echarDataVo = getCharDataToBar( zdEightDimDict.getResultTable(),param,zdEightDimDict.getKpiCycle());
			break;
		case "line":
			echarDataVo = getCharDataToPie( zdEightDimDict.getResultTable(),param,zdEightDimDict.getKpiCycle());
			break;
		case "barline":
			echarDataVo = getCharDataToBarLine( zdEightDimDict.getResultTable(),param,zdEightDimDict.getKpiCycle());
			break;
		case "nestPie":
			echarDataVo = getCharDataToNestPie( zdEightDimDict.getResultTable(),param,zdEightDimDict.getKpiCycle());
			break;
		default:
			break;
		}
		echarDataVo.setUnit(zdEightDimDict.getUnit());
           
           // System.out.println("*******"+list.toString());
       
		//System.out.println("*******"+zdEightDimDict.toString());
		return echarDataVo;
	}

	//查询指标概览
	@Override
/*	@DS("dataSource2")*/
	public EcharDataVo getListByindex(Map<String, String> param) {
		Map<String,String> Map = new HashMap<String,String>();
		Map.putAll(param);
		EcharDataVo echarDataVo ;
		ZdEightDimDict zdEightDimDict = amountMapper.getDimDictByDim(param);
		if("day".equals(zdEightDimDict.getKpiCycle())) {
			Map =  changeDateFormate(Map);
		}
/*		if("kpi_assess_profit".equals(zdEightDimDict.getDim())) {
			  DataSourceContextHolder.setDB("dataSource");
			  System.out.println("*********"+DataSourceContextHolder.getDB());
				echarDataVo  = getListData( zdEightDimDict.getResultTable(),Map);
		}else {
			  DataSourceContextHolder.setDB("dataSource2");
			echarDataVo  = getListData( zdEightDimDict.getResultTable(),Map);
		}
		*/
		
		
		echarDataVo  = getListData( zdEightDimDict.getResultTable(),Map);
		return echarDataVo;
	}
	@SuppressWarnings("unchecked")
	private EcharDataVo getListData(String Sql,Map<String, String> param){
		 EcharDataVo echarDataVo = new EcharDataVo();
		 SqlMapper sqlMapper = new SqlMapper(sqlSession);
		 List<Map> list = sqlMapper.selectList(Sql, param, Map.class);
		for(int i=0;i<list.size();i++) {
			 Map map = list.get(i);
			 if(!map.containsKey("value")) {
				 map.put("value", "0");
			 }else if("nan".equals(map.get("value").toString())) {
				 map.put("value", "0");
			 }else if("NaN".equals(map.get("value").toString())) {
				 map.put("value", "0");
			 }
		 }
        echarDataVo.setData(JSONArray.fromObject(list));
		return echarDataVo;
	}
	
	private EcharDataVo getCharDataToPie(String Sql,Map<String, String> param,String kpiCycle){
		 String startMonth = param.get("startMonth");
		 String stopMonth = param.get("stopMonth");
		 param.put("startMonth",startMonth);
		 param.put("stopMonth", stopMonth);
		// Map<String, String> changeDF = changeDateFormate(param);
		 Map<String, String> changeDF = new HashMap<String,String>();
			if("month".equals(kpiCycle)) {
				changeDF.putAll(param);
			}else {
				changeDF = changeDateFormate(param);
			}
		 EcharDataVo echarDataVo = new EcharDataVo();
		 SqlMapper sqlMapper = new SqlMapper(sqlSession);
		 List<Map> list = sqlMapper.selectList(Sql, changeDF, Map.class);
		 param.put("startMonth", DateUtils.getBeforeMonth(startMonth));
		 param.put("stopMonth", DateUtils.getBeforeMonth(stopMonth));
		// Map<String, String> changeDF_mom = changeDateFormate(param);
		 Map<String, String> changeDF_mom = new HashMap<String,String>();
			if("month".equals(kpiCycle)) {
				changeDF_mom.putAll(param);
			}else {
				changeDF_mom = changeDateFormate(param);
			}
		 
		 List<Map> list_mom = sqlMapper.selectList(Sql, changeDF_mom, Map.class);
		 param.put("startMonth", DateUtils.DateToStr(DateUtils.getLastYearOf(DateUtils.StrToDate(startMonth, "yyyyMM")), "yyyyMM"));
		 param.put("stopMonth", DateUtils.DateToStr(DateUtils.getLastYearOf(DateUtils.StrToDate(stopMonth, "yyyyMM")), "yyyyMM"));
		// Map<String, String> changeDF_year = changeDateFormate(param);
		 Map<String, String> changeDF_year = new HashMap<String,String>();
			if("month".equals(kpiCycle)) {
				changeDF_year.putAll(param);
			}else {
				changeDF_year = changeDateFormate(param);
			}
		 
		 List<Map> list_year = sqlMapper.selectList(Sql, changeDF_year, Map.class);
		 
         PieCharVo pieCharVo = new PieCharVo();
         pieCharVo.setData(list);
         echarDataVo.setData(JSONArray.fromObject(list));
         echarDataVo.setData_year(JSONArray.fromObject(list_year));
         echarDataVo.setData_mom(JSONArray.fromObject(list_mom));
         JSONArray legend = new JSONArray();
         for(Map map:list){
         	legend.add(map.get("name"));
         }
         echarDataVo.setLegend_data(legend);
		return echarDataVo;
	}
	
	private EcharDataVo getCharDataToNestPie(String Sql,Map<String, String> param,String kpiCycle){
		 String startMonth = param.get("startMonth");
		 String stopMonth = param.get("stopMonth");
		 param.put("startMonth",startMonth);
		 param.put("stopMonth", stopMonth);
		// Map<String, String> changeDF = changeDateFormate(param);
		 Map<String, String> changeDF = new HashMap<String,String>();
			if("month".equals(kpiCycle)) {
				changeDF.putAll(param);
			}else {
				changeDF = changeDateFormate(param);
			}
		 EcharDataVo echarDataVo = new EcharDataVo();
		 SqlMapper sqlMapper = new SqlMapper(sqlSession);
		 List<Map> list = sqlMapper.selectList(Sql, changeDF, Map.class);
		 param.put("startMonth", DateUtils.getBeforeMonth(startMonth));
		 param.put("stopMonth", DateUtils.getBeforeMonth(stopMonth));
		// Map<String, String> changeDF_mom = changeDateFormate(param);
		 Map<String, String> changeDF_mom = new HashMap<String,String>();
			if("month".equals(kpiCycle)) {
				changeDF_mom.putAll(param);
			}else {
				changeDF_mom = changeDateFormate(param);
			}
		 List<Map> list_mom = sqlMapper.selectList(Sql, changeDF_mom, Map.class);
		 param.put("startMonth", DateUtils.DateToStr(DateUtils.getLastYearOf(DateUtils.StrToDate(startMonth, "yyyyMM")), "yyyyMM"));
		 param.put("stopMonth", DateUtils.DateToStr(DateUtils.getLastYearOf(DateUtils.StrToDate(stopMonth, "yyyyMM")), "yyyyMM"));
		 //Map<String, String> changeDF_year = changeDateFormate(param);
		 Map<String, String> changeDF_year = new HashMap<String,String>();
			if("month".equals(kpiCycle)) {
				changeDF_year.putAll(param);
			}else {
				changeDF_year = changeDateFormate(param);
			}
		 List<Map> list_year = sqlMapper.selectList(Sql, changeDF_year, Map.class);
		 echarDataVo.setData(JSONArray.fromObject(list));
	     echarDataVo.setData_year(JSONArray.fromObject(list_year));
	     echarDataVo.setData_mom(JSONArray.fromObject(list_mom));
	     Map<String,JSONArray> nestMap =  getNestData(list);
	     echarDataVo.setNest_data(nestMap.get("nestArray"));
	     echarDataVo.setLegend_data(nestMap.get("legend"));
	     
	     Map<String,JSONArray> nestMap_mom =  getNestData(list_mom);
	     echarDataVo.setNest_data_mom(nestMap_mom.get("nestArray"));
	   
	     
	     Map<String,JSONArray> nestMap_year =  getNestData(list_year);
	     echarDataVo.setNest_data_year(nestMap_year.get("nestArray"));
	  
	     
	     
		return echarDataVo;
		
	}
	private  Map<String,JSONArray>  getNestData( List<Map> list){
		     Map<String,JSONArray> resultMap = new HashMap<String,JSONArray>();
		     JSONArray legend = new JSONArray();
		     JSONArray nestArray = new JSONArray();
		 	 Map<String,String> nestMap = new LinkedHashMap<String,String>();
		     for(Map map:list){
		    	 
		    	 	if(nestMap.containsKey(map.get("dimension"))){
		    	 		Double value = Double.valueOf(nestMap.get(map.get("dimension")));
		    	 		nestMap.put(String.valueOf(map.get("dimension")) ,String.valueOf(value +  Double.valueOf(String.valueOf(map.get("value")))));
		    	 	}else{
		    	 		nestMap.put(String.valueOf(map.get("dimension")) ,String.valueOf(map.get("value")));
		    	 		 
		    	 	}
		    	 	//JSONObject nest = new JSONObject();
		    	 	//nest.put("name", value);
		    	 	//nest.put("value", value);
		         //	legend.add(map.get("name"));
		      }
		     for (String key : nestMap.keySet()) { 
		    	 legend.add(key);
		    	 JSONObject nest = new JSONObject();
		    	 nest.put("name", key);
		    	 nest.put("value", nestMap.get(key));
		    	 nestArray.add(nest);
		    } 
		     resultMap.put("nestArray", nestArray);
		     resultMap.put("legend", legend);
		     return resultMap;
	}
	
	private EcharDataVo getCharDataToBar(String Sql,Map<String, String> param,String kpiCycle){
		 String startMonth = param.get("startMonth");
		 String stopMonth = param.get("stopMonth");
		 param.put("startMonth",startMonth);
		 param.put("stopMonth", stopMonth);
		 EcharDataVo echarDataVo = new EcharDataVo();
		 SqlMapper sqlMapper = new SqlMapper(sqlSession);
		// Map<String, String> changeDF = changeDateFormate(param);
		 Map<String, String> changeDF = new HashMap<String,String>();
			if("month".equals(kpiCycle)) {
				changeDF.putAll(param);
			}else {
				changeDF = changeDateFormate(param);
			}
		 List<Map> list = sqlMapper.selectList(Sql, changeDF, Map.class);
		 param.put("startMonth", DateUtils.getBeforeMonth(startMonth));
		 param.put("stopMonth", DateUtils.getBeforeMonth(stopMonth));
		// Map<String, String> changeDF_mom = changeDateFormate(param);
		 Map<String, String> changeDF_mom = new HashMap<String,String>();
			if("month".equals(kpiCycle)) {
				changeDF_mom.putAll(param);
			}else {
				changeDF_mom = changeDateFormate(param);
			}
		 
		 List<Map> list_mom = sqlMapper.selectList(Sql, changeDF_mom, Map.class);
		 param.put("startMonth", DateUtils.DateToStr(DateUtils.getLastYearOf(DateUtils.StrToDate(startMonth, "yyyyMM")), "yyyyMM"));
		 param.put("stopMonth", DateUtils.DateToStr(DateUtils.getLastYearOf(DateUtils.StrToDate(stopMonth, "yyyyMM")), "yyyyMM"));
		// Map<String, String> changeDF_year = changeDateFormate(param);
		 Map<String, String> changeDF_year = new HashMap<String,String>();
			if("month".equals(kpiCycle)) {
				changeDF_year.putAll(param);
			}else {
				changeDF_year = changeDateFormate(param);
			}
		 List<Map> list_year = sqlMapper.selectList(Sql, changeDF_year, Map.class);
         JSONArray xAxis_data = new JSONArray();
         JSONArray data = new JSONArray();
         JSONArray data_year = new JSONArray();
         JSONArray data_mom = new JSONArray();
         for(Map map:list){
         	//legend.add(map.get("name"));
        	 //
        	 xAxis_data.add(map.get("name"));
        	 data.add(map.get("value"));
         }
         JSONArray xAxis_mom = new JSONArray();
         JSONArray xAxis_year = new JSONArray();
         for(Map map:list_mom){
          	//legend.add(map.get("name"));
         	xAxis_mom.add(map.get("name"));
         	 data_mom.add(map.get("value"));
         	 
          }
         for(Map map:list_year){
          	//legend.add(map.get("name"));
        	 xAxis_year.add(map.get("name"));
         	 data_year.add(map.get("value"));
          }
         echarDataVo.setData(data);
         echarDataVo.setData_year(data_year);
         echarDataVo.setData_mom(data_mom);
         if(xAxis_data==null || xAxis_data.size()==0){
        	 if( xAxis_mom.size()>0){
        		 xAxis_data=xAxis_mom;
        	 }else if(xAxis_year.size()>0){
        		 xAxis_data=xAxis_year;
        	 }
         }
         echarDataVo.setxAxis_data(xAxis_data);
		return echarDataVo;
	}
	
	//柱状图和折线图混搭的数据
	private EcharDataVo getCharDataToBarLine(String Sql,Map<String, String> param,String kpiCycle){
		 String startMonth = param.get("startMonth");
		 param.put("startMonth",startMonth);
		 EcharDataVo echarDataVo = new EcharDataVo();
		 SqlMapper sqlMapper = new SqlMapper(sqlSession);
		 List<Map> list = sqlMapper.selectList(Sql, param, Map.class);
		 //剔除了 同比  环比的数据展示
//		 param.put("startMonth", DateUtils.getBeforeMonth(startMonth));
//		 List<Map> list_mom = sqlMapper.selectList(Sql, param, Map.class);
//		 param.put("startMonth", DateUtils.DateToStr(DateUtils.getLastYearOf(DateUtils.StrToDate(startMonth, "yyyyMM")), "yyyyMM"));
//		 List<Map> list_year = sqlMapper.selectList(Sql, param, Map.class);
        JSONArray xAxis_data = new JSONArray();
        JSONArray data = new JSONArray();
//        JSONArray data_year = new JSONArray();
//        JSONArray data_mom = new JSONArray();
        JSONArray nest_data = new JSONArray();
//        JSONArray nest_data_year = new JSONArray();
//        JSONArray nest_data_mom = new JSONArray();
        
        for(Map map:list){
        	//legend.add(map.get("name"));
       	 //
       	 xAxis_data.add(map.get("name"));		//横坐标
       	 data.add(map.get("value"));			//发货量
       	 nest_data.add(map.get("value1"));			//退货率
       	 
        }
//        for(Map map:list_mom){
//         	//legend.add(map.get("name"));
//        	// xAxis_data.add(map.get("name"));
//        	 data_mom.add(map.get("value"));
//        	 nest_data_mom.add(map.get("value1"));
//        	 
//         }
//        for(Map map:list_year){
//         	//legend.add(map.get("name"));
//        	// xAxis_data.add(map.get("name"));
//        	 data_year.add(map.get("value"));
//        	 nest_data_year.add(map.get("value1"));
//         }
        echarDataVo.setData(data);
//        echarDataVo.setData_year(data_year);
//        echarDataVo.setData_mom(data_mom);
        echarDataVo.setxAxis_data(xAxis_data);
        echarDataVo.setNest_data(nest_data);
//        echarDataVo.setNest_data_mom(nest_data_mom);
//        echarDataVo.setNest_data_year(nest_data_year);
		return echarDataVo;
	}
	//明细表--客户--机型
	public List<ZdResult8BrandD>  initJqGrid(Map<String,String> param){
		ZdEightDimDict zdEightDimDict = amountMapper.getDimDictByDim(param);
		 Map<String, String> changeDF = new HashMap<String,String>();
		if("month".equals(zdEightDimDict.getKpiCycle())) {
			changeDF.putAll(param);
		}else if("day".equals(zdEightDimDict.getKpiCycle()))  {
			changeDF = changeDateFormate(param);
		}
		List<ZdResult8BrandD> list = getCharDataToJqGrid( zdEightDimDict.getResultTable(),changeDF);
		
		return list;
	};
	//明细表--退货率
	public List<ReturnRate>  initJqGridRR(Map<String,String> param){
		
		
		
		
		ZdEightDimDict zdEightDimDict = amountMapper.getDimDictByDim(param);
		 Map<String, String> changeDF = new HashMap<String,String>();
		if("month".equals(zdEightDimDict.getKpiCycle())) {
			changeDF.putAll(param);
		}else  if("day".equals(zdEightDimDict.getKpiCycle())) {
			changeDF = changeDateFormate(param);
		}
		List<ReturnRate> list = getCharDataToJqGridRR( zdEightDimDict.getResultTable(),param);
		
		return list;
	};

	//明细表--库龄库存
	public List<ZdResult8MonscmM>  initJqGrid_invent(Map<String,String> param){
		ZdEightDimDict zdEightDimDict = amountMapper.getDimDictByDim(param);
		 Map<String, String> changeDF = new HashMap<String,String>();
		 
			if("month".equals(zdEightDimDict.getKpiCycle())) {
				changeDF.putAll(param);
			}else if("day".equals(zdEightDimDict.getKpiCycle())) {
				changeDF = changeDateFormate(param);
			}       
		List<ZdResult8MonscmM> list = getCharDataToJqGrid_invent( zdEightDimDict.getResultTable(),param);
			
		return list;
	};
		
	//明细表--我司零售量 厅店列表
	public List<ZdResult8AreaD>  initJqGrid_retail(Map<String,String> param){
		ZdEightDimDict zdEightDimDict = amountMapper.getDimDictByDim(param);
		 Map<String, String> changeDF = new HashMap<String,String>();
	 
		if("month".equals(zdEightDimDict.getKpiCycle())) {
			changeDF.putAll(param);
		}else if("day".equals(zdEightDimDict.getKpiCycle())) {
			changeDF = changeDateFormate(param);
		}
		List<ZdResult8AreaD> list = getCharDataToJqGrid_retail( zdEightDimDict.getResultTable(),changeDF);
					
		return list;
	};
	
	private List<ZdResult8BrandD> getCharDataToJqGrid(String Sql,Map<String, String> param){
		 SqlMapper sqlMapper = new SqlMapper(sqlSession);
		 List<ZdResult8BrandD> list = sqlMapper.selectList(Sql, param, ZdResult8BrandD.class);
		return list;
	}
	
	private List<Map> getCharDataToJqGridExport(String Sql,Map<String, String> param){
		 SqlMapper sqlMapper = new SqlMapper(sqlSession);
		 List<Map> list = sqlMapper.selectList(Sql, param, Map.class);
		return list;
	}
	private List<ReturnRate> getCharDataToJqGridRR(String Sql,Map<String, String> param){
		 SqlMapper sqlMapper = new SqlMapper(sqlSession);
		 List<ReturnRate> list = sqlMapper.selectList(Sql, param, ReturnRate.class);
		return list;
	}
	private List<ZdResult8MonscmM> getCharDataToJqGrid_invent(String Sql,Map<String, String> param){
		 SqlMapper sqlMapper = new SqlMapper(sqlSession);
		 List<ZdResult8MonscmM> list = sqlMapper.selectList(Sql, param, ZdResult8MonscmM.class);
		return list;
	}
	private List<ZdResult8AreaD> getCharDataToJqGrid_retail(String Sql,Map<String, String> param){
		 SqlMapper sqlMapper = new SqlMapper(sqlSession);
		 List<ZdResult8AreaD> list = sqlMapper.selectList(Sql, param, ZdResult8AreaD.class);
		return list;
	}
	
	/** 导入促销人数**/
	public void importPeopleNum(List<ImportPeopleNum> list){
		 amountMapper.importPeopleNum(list);
	}
	/**导入团队售后收入**/
	public void importTeam(List<ImportTeamIncom> list){
		amountMapper.importTeam(list);
	}
	
	/**导入酬金Excel**/
	public void importCost(List<ImportCost> list){
		amountMapper.importCost(list);
	}
	/**导入毛利额-地市**/
	public void importGross(List<ImportGrossProfit> list){
		amountMapper.importGross(list);
	}
	/**导入毛利额-品牌**/
	public void importGross_brand(List<ImportGrossProfit> list){
		amountMapper.importGross_brand(list);
	}
	/** 取促销人数数据**/
	public List<ImportPeopleNum>  getPersonList(Map<String,String> param){
		return  amountMapper.getPersonList(param);
	}
	public int  getTotalByPerson(Map<String,String> param){
		return amountMapper.getTotalByPerson(param);
	}
	
	/** 取团队收入数据**/
	public List<ImportTeamIncom>  getTeamList(Map<String,String> param){
		return  amountMapper.getTeamList(param);
	}
	public int  getTotalByTeam(Map<String,String> param){
		return amountMapper.getTotalByTeam(param);
	}
	
	/** 净利的费用数据**/
	public List<ImportCost>  getCostList(Map<String,String> param){
		return  amountMapper.getCostList(param);
	}
	public int  getTotalByCost(Map<String,String> param){
		return amountMapper.getTotalByCost(param);
	}
	
	/** 毛利额数据**/
	public List<ImportGrossProfit>  getGrossList(Map<String,String> param){
		return  amountMapper.getGrossList(param);
	}
	public int  getTotalByGross(Map<String,String> param){
		return amountMapper.getTotalByGross(param);
	}
	
	
	public void updateByPerson(Map<String,String>  params){
		amountMapper.updateByPerson(params);
	}
	
	public void updateByTeam(Map<String,String>  params){
		amountMapper.updateByTeam(params);
	}
	public void updateByCost(Map<String,String>  params){
		amountMapper.updateByCost(params);
	}
	public void updateByGross(Map<String,String>  params){
		amountMapper.updateByGross(params);
	}
	/**新增费用 -酬金信息**/
	public Map<String, Object>  addCost(Map<String,String>  params){
		Map<String, Object> map = new  HashMap<String, Object>();
		//新增数据是否存在
		int n=amountMapper.selectCost(params);
		//存在就修改
		if(n>0){
			params.put("month", params.get("addMonth"));
			params.put("type8", params.get("addType8"));
			params.put("areaname", params.get("addCity"));
			params.put("dimension", params.get("addDimension"));
			params.put("kpiName", params.get("addKpiName"));
			params.put("commission", params.get("addCommission"));
			params.put("cost", params.get("addCost"));
			amountMapper.updateByCost(params);
			map.put("code", 200);
		}else{//不存在就新增
			amountMapper.addCost(params);
			map.put("code", 200);
		}
		return map;
	}
	/**新增毛利额信息**/
	public Map<String, Object>  addGross(Map<String,String>  params){
		Map<String, Object> map = new  HashMap<String, Object>();
		//新增数据是否存在
		int n=amountMapper.selectGross(params);
		//存在就修改
		if(n>0){
			params.put("month", params.get("addMonth"));
			params.put("brand", params.get("addBrand"));
			params.put("city", params.get("addCity"));
			params.put("value", params.get("addValue"));
			amountMapper.updateByGross(params);
			map.put("code", 200);
		}else{//不存在就新增
			amountMapper.addGross(params);
			map.put("code", 200);
		}
		return map;
	}
	/**新增促销人员数信息**/
	public Map<String, Object>  addPerson(Map<String,String>  params){
		Map<String, Object> map = new  HashMap<String, Object>();
		//新增数据是否存在
		int n=amountMapper.selectPerson(params);
		//存在就修改
		if(n>0){
			params.put("month", params.get("addMonth"));
			params.put("type8", params.get("addType8"));
			params.put("areaname", params.get("addCity"));
			params.put("dimension", params.get("addDimension"));
			params.put("people_num", params.get("addPeople_num"));
			amountMapper.updateByPerson(params);
			map.put("code", 200);
		}else{//不存在就新增
			amountMapper.addPerson(params);
			map.put("code", 200);
		}
		return map;
	}
	/**新增售后团队收入信息**/
	public Map<String, Object>  addTeam(Map<String,String>  params){
		Map<String, Object> map = new  HashMap<String, Object>();
		//新增数据是否存在
		int n=amountMapper.selectTeam(params);
		//存在就修改
		if(n>0){
			params.put("month", params.get("addMonth"));
			params.put("type", params.get("addType"));
			params.put("city", params.get("addCity"));
			params.put("value", params.get("addValue"));
			amountMapper.updateByTeam(params);
			map.put("code", 200);
		}else{//不存在就新增
			amountMapper.addTeam(params);
			map.put("code", 200);
		}
		return map;
	}
	
	/**库龄库存量**/
	public EcharDataVo  getInventory_number(Map<String,String> param){
		 String startMonth = param.get("startMonth");
		 String stopMonth = param.get("stopMonth");
		 param.put("startMonth", startMonth);
		 param.put("stopMonth", stopMonth);
		 Map<String, String> changeDF = lastDayMonths(param);
		 SumProvstockGd gd = amountMapper.getInventory_number(changeDF);
		 param.put("startMonth", DateUtils.getBeforeMonth(startMonth));
		 param.put("stopMonth", DateUtils.getBeforeMonth(stopMonth));
		 Map<String, String> changeDF_mom = lastDayMonths(param);
		 SumProvstockGd gd_mom = amountMapper.getInventory_number(changeDF_mom);
		 param.put("startMonth", DateUtils.DateToStr(DateUtils.getLastYearOf(DateUtils.StrToDate(startMonth, "yyyyMM")), "yyyyMM"));
		 param.put("stopMonth", DateUtils.DateToStr(DateUtils.getLastYearOf(DateUtils.StrToDate(stopMonth, "yyyyMM")), "yyyyMM"));
		 Map<String, String> changeDF_year = lastDayMonths(param);
		 SumProvstockGd gd_year = amountMapper.getInventory_number(changeDF_year);
		 
        Map<String,Object> pie = new HashMap<String,Object>();
      
       Integer [] list={gd.getStage1Amount(),gd.getStage2Amount(),gd.getStage3Amount(),gd.getStage4Amount(),gd.getStage5Amount(),gd.getStage6Amount()};
       Integer [] list_mom={gd_mom.getStage1Amount(),gd_mom.getStage2Amount(),gd_mom.getStage3Amount(),gd_mom.getStage4Amount(),gd_mom.getStage5Amount(),gd_mom.getStage6Amount()};
       Integer [] list_year={gd_year.getStage1Amount(),gd_year.getStage2Amount(),gd_year.getStage3Amount(),gd_year.getStage4Amount(),gd_year.getStage5Amount(),gd_year.getStage6Amount()};
       //String [] legends={"0-30天库存数","30-90天库存数","90-180天库存数","180-270天库存数","270-360天库存数","360天以上库存数"};
       String [] legends={"0-30天","30-90天","90-180天","180-270天","270-360天","360天以上"};
       
       List<Map> gdlist=new ArrayList<Map>();
       for (int i = 0; i < legends.length; i++) {
    	   Map<String,Object> map=new HashMap<String,Object>();
    	   map.put("name",legends[i]);
    	   map.put("value",list[i]);
    	   gdlist.add(map);
       }
       List<Map> gdlist_year=new ArrayList<Map>();
       for (int i = 0; i < legends.length; i++) {
    	   Map<String,Object> map=new HashMap<String,Object>();
    	   map.put("name",legends[i]);
    	   map.put("value",list_year[i]);
    	   gdlist_year.add(map);
       }
       List<Map> gdlist_mom=new ArrayList<Map>();
       for (int i = 0; i < legends.length; i++) {
    	   Map<String,Object> map=new HashMap<String,Object>();
    	   map.put("name",legends[i]);
    	   map.put("value",list_mom[i]);
    	   gdlist_mom.add(map);
       }
       
       EcharDataVo echarDataVo = new EcharDataVo();
       PieCharVo pieCharVo = new PieCharVo();
       pieCharVo.setData(gdlist);
       echarDataVo.setData(JSONArray.fromObject(gdlist));
       echarDataVo.setData_year(JSONArray.fromObject(gdlist_year));
       echarDataVo.setData_mom(JSONArray.fromObject(gdlist_mom));
       JSONArray legend = new JSONArray();
       for(Map map:gdlist){
       	legend.add(map.get("name"));
       }
       echarDataVo.setLegend_data(legend);
      
		return echarDataVo;
	}
	/**库龄库存金额**/
	public EcharDataVo  getInventory_money(Map<String,String> param){
		 String startMonth = param.get("startMonth");
		 String stopMonth = param.get("stopMonth");
		 param.put("startMonth", startMonth);
		 param.put("stopMonth", stopMonth);
		 Map<String, String> changeDF = lastDayMonths(param);
		 SumProvstockGd gd = amountMapper.getInventory_money(changeDF);
		 param.put("startMonth", DateUtils.getBeforeMonth(startMonth));
		 param.put("stopMonth", DateUtils.getBeforeMonth(stopMonth));
		 Map<String, String> changeDF_mom = lastDayMonths(param);
		 SumProvstockGd gd_mom = amountMapper.getInventory_money(changeDF_mom);
		 param.put("startMonth", DateUtils.DateToStr(DateUtils.getLastYearOf(DateUtils.StrToDate(startMonth, "yyyyMM")), "yyyyMM"));
		 param.put("stopMonth", DateUtils.DateToStr(DateUtils.getLastYearOf(DateUtils.StrToDate(stopMonth, "yyyyMM")), "yyyyMM"));
		 Map<String, String> changeDF_year = lastDayMonths(param);
		 SumProvstockGd gd_year = amountMapper.getInventory_money(changeDF_year);
		 
        Map<String,Object> pie = new HashMap<String,Object>();
      
       Float [] list={gd.getStage1Money(),gd.getStage2Money(),gd.getStage3Money(),gd.getStage4Money(),gd.getStage5Money(),gd.getStage6Money()};
       Float [] list_mom={gd_mom.getStage1Money(),gd_mom.getStage2Money(),gd_mom.getStage3Money(),gd_mom.getStage4Money(),gd_mom.getStage5Money(),gd_mom.getStage6Money()};
       Float [] list_year={gd_year.getStage1Money(),gd_year.getStage2Money(),gd_year.getStage3Money(),gd_year.getStage4Money(),gd_year.getStage5Money(),gd_year.getStage6Money()};
       //String [] legends={"0-30天库存金额","30-90天库存金额","90-180天库存金额","180-270天库存金额","270-360天库存金额","360天以上库存金额"};
       String [] legends={"0-30天","30-90天","90-180天","180-270天","270-360天","360天以上"};

       List<Map> gdlist=new ArrayList<Map>();
	       for (int i = 0; i < legends.length; i++) {
	    	   Map<String,Object> map=new HashMap<String,Object>();
	    	   map.put("name",legends[i]);
	    	   map.put("value",list[i]);
	    	   gdlist.add(map);
	       }
	       List<Map> gdlist_year=new ArrayList<Map>();
	       for (int i = 0; i < legends.length; i++) {
	    	   Map<String,Object> map=new HashMap<String,Object>();
	    	   map.put("name",legends[i]);
	    	   map.put("value",list_year[i]);
	    	   gdlist_year.add(map);
	       }
	       List<Map> gdlist_mom=new ArrayList<Map>();
	       for (int i = 0; i < legends.length; i++) {
	    	   Map<String,Object> map=new HashMap<String,Object>();
	    	   map.put("name",legends[i]);
	    	   map.put("value",list_mom[i]);
	    	   gdlist_mom.add(map);
	       }
	       
	       EcharDataVo echarDataVo = new EcharDataVo();
	       PieCharVo pieCharVo = new PieCharVo();
	       pieCharVo.setData(gdlist);
	       echarDataVo.setData(JSONArray.fromObject(gdlist));
	       echarDataVo.setData_year(JSONArray.fromObject(gdlist_year));
	       echarDataVo.setData_mom(JSONArray.fromObject(gdlist_mom));
	       JSONArray legend = new JSONArray();
	       for(Map map:gdlist){
	       	legend.add(map.get("name"));
	       }
	       echarDataVo.setLegend_data(legend);
	       
			return echarDataVo;
	}
	
	public Map<String, Object>  getInventory_all(Map<String,String> param){
		Map<String, String> lastDayMonths = lastDayMonths(param);
		SumProvstockGd gd= amountMapper.getInventory_all(lastDayMonths);
		Map<String, Object> gdMap = new HashMap<String,Object>();
		gdMap.put("stockAmount", gd.getStockAmount());
		gdMap.put("stockMoney", gd.getStockMoney());
		return gdMap;
	}
	
	public static Map<String,String> changeDateFormate(Map<String,String> param){
		Map<String,String> resultMap = new HashMap<String,String>();
		resultMap.putAll(param);
		resultMap.put("startMonth", param.get("startMonth")+"01");
		String month= param.get("stopMonth").substring(4);
		int key=Integer.parseInt(month);
		switch (key) {
		case 1:case 3:case 5:case 7:case 8:case 10:case 12:
			resultMap.put("stopMonth", param.get("stopMonth")+"31");
			break;
		case 4:case 6:case 9:case 11:
			resultMap.put("stopMonth", param.get("stopMonth")+"30");
			break;
		case 2:
			resultMap.put("stopMonth", param.get("stopMonth")+"28");
			break;
		default:
			break;
		}
		return resultMap;
		
	}
	
	
	//计算两个月份之间的所有月的最后一天yyyyMMDD
	public static Map<String,String> lastDayMonths(Map<String,String> param){
		StringBuffer sb=new  StringBuffer();
		
		String startMonth=param.get("startMonth");
		String stopMonth=param.get("stopMonth");
		
		int start=Integer.parseInt(startMonth);
		int stop=Integer.parseInt(stopMonth);
		
		String nowDate = new SimpleDateFormat("yyyyMM").format(new Date()).toString();
		
		if(start<stop){
			sb.append(lastDay(startMonth)+",");
			String month=startMonth;
			for (int i = 0; i !=-1; i++) {
				if(month.equals(nowDate)){
					sb.append(month+"01");
					break;
				}
				month = monthAddFrist(month);
				sb.append(lastDay(month));
				if(month.equals(stopMonth)){
					break;
				}else{
					sb.append(",");
				}
			}
		}else if(start>stop){
			sb.append(lastDay(stopMonth)+",");
			String month=stopMonth;
			for (int i = 0; i !=-1; i++) {
				if(month.equals(nowDate)){
					sb.append(month+"01");
					break;
				}
				month = monthAddFrist(month);
				sb.append(lastDay(month));
				if(month.equals(startMonth)){
					break;
				}else{
					sb.append(",");
				}
			}
		}else{
			sb.append(lastDay(stopMonth));
		}
		param.put("months", sb.toString());
		return param;
	}
	
	//月份加一
public static String monthAddFrist(String date){
		
		DateFormat df=new SimpleDateFormat("yyyyMM");
		try {
			Calendar ct=Calendar.getInstance();
			
				ct.setTime(df.parse(date));
			
			ct.add(Calendar.MONTH, +1);
			return df.format(ct.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "";
}
	//最后一天
	public static String lastDay(String month){
		String lastDay;
		String mon=month.substring(4);
		int key=Integer.parseInt(mon);
		switch (key) {
		case 1:case 3:case 5:case 7:case 8:case 10:case 12:
			lastDay=month+"31";
			break;
		case 4:case 6:case 9:case 11:
			lastDay=month+"30";
			break;
		case 2:
			lastDay=month+"28";
			break;
		default:
			lastDay="";
			break;
		}
		return lastDay;
	}
	public Map<String, Object> gross_profit_zl( Map<String,String>  params){
		Map<String, Object> result=new HashMap<String, Object>();
		//地市维度下的总览值
		String gross_profit_city = amountMapper.gross_profit_city(params);
		//品牌维度下的总览值
		String gross_profit_brand = amountMapper.gross_profit_brand(params);
		
		result.put("city",gross_profit_city );
		result.put("brand",gross_profit_brand );
		return  result;
	}


	@Override
	public void repeat(String monthField,Set<String> monSet,String tableName) {
		
			amountMapper.delete_gross(monthField,monSet, tableName);
	}


	@Override
	@DS("dataSource")
	public List<Zd8typeInfoConfirm> getConfirmInfo(List<Map<String, String>> kpis,Map<String,String>  param) {
		List<Zd8typeInfoConfirm> list = new ArrayList<Zd8typeInfoConfirm>();
		for (Map<String, String> kpi : kpis) {
			String dim=kpi.get("kpiKey");
			Zd8typeInfoConfirm info = amountMapper.getConfirmInfo(dim);
			list.add(info);
		}
		return list;
	}


	@Override
	@DS("dataSource")
	public Zd8typeInfoConfirm zlConfirmInfTS(String id) {
		
		return amountMapper.zlConfirmInfTS(id);
	}


	@Override
	@DS("dataSource")
	public Zd8typeInfoConfirmLog getConfirmLog(Map<String, String> params) {
		Zd8typeInfoConfirmLog log = amountMapper.getConfirmLog(params);
			return log;
	}


	@Override
	@DS("dataSource")
	public void insertInfo(Map<String, String> params) {
		//删除以往记录
		amountMapper.delete_confirm_log(params);
		
		//插入新记录
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd HHmmss");
		String confirmTime = sdf.format(new Date());
		//登录人信息
		User user = (User) SecurityUtils.getSubject().getPrincipal();
//		String userID=user.getUsername();//账号
		String userName=user.getNickname();//名称
		
		params.put("person", userName);
		params.put("confirmTime", confirmTime);
		
		amountMapper.insertInfo(params);
		
	}
	
	@Override
	public EcharDataVo getEcharDataVo_share(Map<String, String> param) {
		//param.put("dim_key", "four_platoon_sales_company");
		EcharDataVo echarDataVo = new EcharDataVo();
		ZdEightDimDict zdEightDimDict = amountMapper.getDimDictByDim(param);
       
		switch (zdEightDimDict.getCharType()) {
		case "pie":
			echarDataVo = getCharDataToPie_share( zdEightDimDict.getResultTable(),param);
			break;
//		case "bar":
//			echarDataVo = getCharDataToBar( zdEightDimDict.getResultTable(),param);
//			break;
		case "line":
			echarDataVo = getCharDataToLine_share( zdEightDimDict.getResultTable(),param);
			break;
//		case "barline":
//			echarDataVo = getCharDataToBarLine( zdEightDimDict.getResultTable(),param);
//			break;
//		case "nestPie":
//			echarDataVo = getCharDataToNestPie( zdEightDimDict.getResultTable(),param);
//			break;
		default:
			break;
		}
		
           
           // System.out.println("*******"+list.toString());
       
		//System.out.println("*******"+zdEightDimDict.toString());
		return echarDataVo;
	}
	
	private EcharDataVo getCharDataToPie_share(String Sql,Map<String, String> param){
		 String startMonth = param.get("startMonth");
		 String stopMonth = param.get("stopMonth");
		 EcharDataVo echarDataVo = new EcharDataVo();
		 SqlMapper sqlMapper = new SqlMapper(sqlSession);
		 List<Map> list = sqlMapper.selectList(Sql, param, Map.class);
		 param.put("startMonth", DateUtils.getBeforeMonth(startMonth));
		 param.put("stopMonth", DateUtils.getBeforeMonth(stopMonth));
		 List<Map> list_mom = sqlMapper.selectList(Sql, param, Map.class);
		 param.put("startMonth", DateUtils.DateToStr(DateUtils.getLastYearOf(DateUtils.StrToDate(startMonth, "yyyyMM")), "yyyyMM"));
		 param.put("stopMonth", DateUtils.DateToStr(DateUtils.getLastYearOf(DateUtils.StrToDate(stopMonth, "yyyyMM")), "yyyyMM"));
		 List<Map> list_year = sqlMapper.selectList(Sql, param, Map.class);
		 
        PieCharVo pieCharVo = new PieCharVo();
        pieCharVo.setData(list);
        echarDataVo.setData(JSONArray.fromObject(list));
        echarDataVo.setData_year(JSONArray.fromObject(list_year));
        echarDataVo.setData_mom(JSONArray.fromObject(list_mom));
        JSONArray legend = new JSONArray();
        for(Map map:list){
        	legend.add(map.get("name"));
        }
        echarDataVo.setLegend_data(legend);
		return echarDataVo;
	}
	
	//柱状图和折线图混搭的数据
		private EcharDataVo getCharDataToLine_share(String Sql,Map<String, String> param){
			 String startMonth = param.get("startMonth");
			 param.put("startMonth",startMonth);
			 EcharDataVo echarDataVo = new EcharDataVo();
			 SqlMapper sqlMapper = new SqlMapper(sqlSession);
			 List<Map> list = sqlMapper.selectList(Sql, param, Map.class);
	        JSONArray xAxis_data = new JSONArray();
	        JSONArray data = new JSONArray();
	        
	        for(Map map:list){
	       	 xAxis_data.add(map.get("name"));		//横坐标
	       	 data.add(map.get("value"));			//值
	       	 
	        }
	        echarDataVo.setData(data);
	        echarDataVo.setxAxis_data(xAxis_data);
			return echarDataVo;
		}


		@Override
		public String getMbz(Map<String, String> param) {
			String kpiKey=param.get("kpiKey");
			String month = param.get("month");
			String year= month.substring(0, 4);
			if(year.equals("2019")){
				if("accountReceivableTurnoverRatio".equals(kpiKey)){//应收帐款周转率
					param.put("field", "mbz");
					param.put("tableName", "KPI_ACCOUNT_RECEIVABLE_TURNOVER_RATIO");
				}else if("stockTurnoverRatio".equals(kpiKey)){//存货周转率
					param.put("field", "mbcs");
					param.put("tableName", "KPI_STOCK_TURNOVER_RATIO");
				}
			}else{
				param.put("field", "mbz");
				if("accountReceivableTurnoverRatio".equals(kpiKey)){//应收帐款周转率
					param.put("tableName", "ACCOUNT_RECEIVABLE_TURNOVER_RATIO");
				}else if("stockTurnoverRatio".equals(kpiKey)){//存货周转率
					param.put("tableName", "STOCK_TURNOVER_RATIO");
				}
			}
			
			String mbz = amountMapper.getMbz(param);
			return mbz;
		}


		@Override
		public  String getRemarks(Map<String, String> param) {
			String remarks = amountMapper.getRemarks(param);
			if(remarks==null){
				return "暂无";
			}
			return remarks;
		}
		@Override
		public void saveRemarks(Map<String, String> param) {
			//去重
			amountMapper.deleteProfitR(param);
			//插入
			amountMapper.saveProfitR(param);
		}
		
		@Override
		public Map<String, String> getProfitRemarks(Map<String, String> param) {
			Map<String, String> remarks = new HashMap<String, String>();
			//毛利
			param.put("kpiId", "ml");
			String ml = amountMapper.getProfitRemarks(param);
			//费用
			param.put("kpiId", "fy");
			String fy = amountMapper.getProfitRemarks(param);
			//直接利润
			param.put("kpiId", "zjlr");
			String zjlr = amountMapper.getProfitRemarks(param);
			
			remarks.put("ml", ml);
			remarks.put("fy", fy);
			remarks.put("zjlr", zjlr);
			return remarks;
		}


		@Override
		public void saveProfitR(Map<String, String> param) {
			String kpiId= param.get("kpiId");
			if("ml".equals(kpiId)){
				param.put("kpiName", "毛利");
			}else if("zjlr".equals(kpiId)){
				param.put("kpiName", "直接利润");
			}else if("fy".equals(kpiId)){
				param.put("kpiName", "费用");
			}
			//去重
			amountMapper.deleteProfitR(param);
			//插入
			amountMapper.saveProfitR(param);
		}


		@Override
		public Map<String, String> dimOneToKpiVal(Map<String, String> param) {
			ZdEightDimDict zdEightDimDict = amountMapper.getDimDictByDim(param);
		       
			String sql=zdEightDimDict.getResultTable();
			 SqlMapper sqlMapper = new SqlMapper(sqlSession);
			 List<Map> list = sqlMapper.selectList(sql, param, Map.class);
			 Float money = 0f;
			 for (Map map : list) {
				money+=Float.parseFloat(map.get("value").toString())/10000;
			}
			 Map<String, String> result = new HashMap<String, String>();
			 result.put("value", money.toString());
			 result.put("unit", "万元");
			return result;
		}


		@Override
		public void insertWuweiyiti(List<ImportWuweiyiti> importWuweiyitiList,String month) {
			amountMapper.deleteWuweiyiti(month);
			for(ImportWuweiyiti ImportWuweiyiti:importWuweiyitiList) {
				
				amountMapper.insertWuweiyiti(ImportWuweiyiti);
			}
		}


		@Override
		public void insertWugexiaomie(List<ImportWugexiaomie> importWugexiaomieList,String month) {
			amountMapper.deleteWugexiaomie(month);
			for(ImportWugexiaomie importWugexiaomie:importWugexiaomieList) {
				
				amountMapper.insertWugexiaomie(importWugexiaomie);
			}
		}


		@Override
		public void insertInfoProfitCost(List<ImportInfoProfitCost> importInfoProfitCostList, String month) {
			// TODO Auto-generated method stub
			amountMapper.deleteInfoProfitCost(month);
			for(ImportInfoProfitCost importInfoProfitCost:importInfoProfitCostList) {
				
				amountMapper.insertInfoProfitCost(importInfoProfitCost);
			}
		}


		@Override
		public List<Map> initJqGridExport(Map<String, String> param) {
			ZdEightDimDict zdEightDimDict = amountMapper.getDimDictByDim(param);
			 Map<String, String> changeDF = new HashMap<String,String>();
			if("month".equals(zdEightDimDict.getKpiCycle())) {
				changeDF.putAll(param);
			}else if("day".equals(zdEightDimDict.getKpiCycle()))  {
				changeDF = changeDateFormate(param);
			}
			List<Map> list = getCharDataToJqGridExport( zdEightDimDict.getResultTable(),changeDF);
			
			return list;
		}


		 



}

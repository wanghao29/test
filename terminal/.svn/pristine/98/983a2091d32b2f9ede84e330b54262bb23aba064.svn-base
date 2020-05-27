/**
 * Copyright (C) 2018 Long Inc., All Rights Reserved.
 */
package com.asiainfo.cmc.service.impl;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;

import com.asiainfo.cmc.enties.ZdResultCitykpiCalc;
import com.asiainfo.cmc.enties.ZdResultCitykpiQ;
import com.asiainfo.cmc.mapper.ZdResultCitykpiQMapper;
import com.asiainfo.cmc.service.ZdResultCitykpiQService;

/**
 * @TODO
 * @author Long
 * @date 2018年9月14日下午2:17:19
 */
@Service
public class ZdResultCitykpiQServiceImpl implements ZdResultCitykpiQService{

	//Logger logger = Logger.getLogger(ZdResultCitykpiQServiceImpl.class);
	
	@Resource
    private ZdResultCitykpiQMapper zdResultCitykpiQMapper;
	
	@Override
	public List<ZdResultCitykpiQ> findAllByParam(){
		return this.findAllByParam(null, null);
	}

	@Override
	public List<ZdResultCitykpiQ> findAllByParam(String year, String quarter) {
		
		return zdResultCitykpiQMapper.findAllByParam(new ZdResultCitykpiQ(year, quarter));
	}

	@Override
	public int updateByPrimaryKeySelective(ZdResultCitykpiQ record) {
		
		return zdResultCitykpiQMapper.updateByPrimaryKey(record);
	}

	/**
	 * 组装各指标KPI数据
	 * @param objList
	 * @return
	 */
	@Override
	public Map<String,List<Map<String,Object>>> constructKpi(List<ZdResultCitykpiQ> objList){
		Map<String,List<Map<String,Object>>> result = new HashMap<String,List<Map<String,Object>>>();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		
		//年度+季度+地市 数据合并
		Map<String,Map<String,Object>> map = new LinkedHashMap<String, Map<String,Object>>();
		for(ZdResultCitykpiQ obj : objList){
			
			String key = obj.getYear()+obj.getQuarter()+obj.getCity();
			String pre = CITYKPIMAP.get(obj.getKpiname());
			
			// 如果key值存在 将其他指标下的所有字段进行追加，否则新建一个map
			if(map.containsKey(key)){
				Map<String, Object> containsMap = map.get(key);
				containsMap.put(pre+"_Progress", obj.getProgress());
				containsMap.put(pre+"_QGoal", obj.getQGoal());
				containsMap.put(pre+"_QRate", obj.getQRate());
				containsMap.put(pre+"_QValue", obj.getQValue());
				containsMap.put(pre+"_Score", obj.getScore());
				containsMap.put(pre+"_YGoal", obj.getYGoal());
				containsMap.put(pre+"_YRate", obj.getYRate());
				containsMap.put(pre+"_YValue", obj.getYValue());
				map.put(key, containsMap);
			}else{
				Map<String,Object> objMap = new HashMap<String, Object>();
				objMap.put("year", obj.getYear());
				objMap.put("quarter", obj.getQuarter());
				objMap.put("operationCenter", obj.getOperationCenter());
				objMap.put("city", obj.getCity());
				objMap.put(pre+"_Progress", obj.getProgress());
				objMap.put(pre+"_QGoal", obj.getQGoal());
				objMap.put(pre+"_QRate", obj.getQRate());
				objMap.put(pre+"_QValue", obj.getQValue());
				objMap.put(pre+"_Score", obj.getScore());
				objMap.put(pre+"_YGoal", obj.getYGoal());
				objMap.put(pre+"_YRate", obj.getYRate());
				objMap.put(pre+"_YValue", obj.getYValue());
				map.put(key, objMap);
			}
		}
		
		for (Map<String,Object> value : map.values()) {
			list.add(value);
		}
		
		result.put("list", list);
		return result;
	}
	
	@Override
	public Map<String, List<Map<String, Object>>> handleExtra(Map<String, List<Map<String, Object>>> map,String year,String quarter) {
		
		Map<String,Object> sumMap = new HashMap<String,Object>();
		sumMap.put("city", "全省合计");
		sumMap.put("year", year);
		sumMap.put("quarter", quarter);
		sumMap.put("operationCenter", "全省合计");
		
		List<Map<String, Object>> list = map.get("list");
		for(Map<String, Object> objMap : list){
			for(String key : objMap.keySet()){ //1_1 sumMap第一次没有 objMap该值100
				if(key.contains("_")){
					sumMap.put(key, sumMap.containsKey(key) ? 
							Double.valueOf(sumMap.get(key).toString())+(objMap.get(key)==null ? 0d : Double.valueOf(objMap.get(key).toString())) 
							:
						    objMap.get(key)==null ? 0d : Double.valueOf(objMap.get(key).toString()));
				}
			}
			
			//重点产品销量
			objMap.put("zdcpxl_QGoal", "<a href=\"#\" onclick=\"vagueQuery('重点产品销量','"+objMap.get("year")+"','"+objMap.get("quarter")+"','"+objMap.get("city")+"')\" style=\"color:#1addfa;\">查看明细</a>");
			objMap.put("zdcpxl_QRate", "<a href=\"#\" onclick=\"vagueQuery('重点产品销量','"+objMap.get("year")+"','"+objMap.get("quarter")+"','"+objMap.get("city")+"')\" style=\"color:#1addfa;\">查看明细</a>");
			objMap.put("zdcpxl_QValue", "<a href=\"#\" onclick=\"vagueQuery('重点产品销量','"+objMap.get("year")+"','"+objMap.get("quarter")+"','"+objMap.get("city")+"')\" style=\"color:#1addfa;\">查看明细</a>");
			
			//三个月以上存货原值占比
			objMap.put("sgyyschyzzb_QGoal", "<a href=\"#\" onclick=\"vagueQuery('三个月以上存货原值占比','"+objMap.get("year")+"','"+objMap.get("quarter")+"','"+objMap.get("city")+"')\" style=\"color:#1addfa;\">查看明细</a>");
			objMap.put("sgyyschyzzb_QRate", "<a href=\"#\" onclick=\"vagueQuery('三个月以上存货原值占比','"+objMap.get("year")+"','"+objMap.get("quarter")+"','"+objMap.get("city")+"')\" style=\"color:#1addfa;\">查看明细</a>");
			objMap.put("sgyyschyzzb_QValue", "<a href=\"#\" onclick=\"vagueQuery('三个月以上存货原值占比','"+objMap.get("year")+"','"+objMap.get("quarter")+"','"+objMap.get("city")+"')\" style=\"color:#1addfa;\">查看明细</a>");
			
			//三个月以上应收账款占比
			objMap.put("sgyysyszkzb_QGoal", "<a href=\"#\" onclick=\"vagueQuery('三个月以上应收账款占比','"+objMap.get("year")+"','"+objMap.get("quarter")+"','"+objMap.get("city")+"')\" style=\"color:#1addfa;\">查看明细</a>");
			objMap.put("sgyysyszkzb_QRate", "<a href=\"#\" onclick=\"vagueQuery('三个月以上应收账款占比','"+objMap.get("year")+"','"+objMap.get("quarter")+"','"+objMap.get("city")+"')\" style=\"color:#1addfa;\">查看明细</a>");
			objMap.put("sgyysyszkzb_QValue", "<a href=\"#\" onclick=\"vagueQuery('三个月以上应收账款占比','"+objMap.get("year")+"','"+objMap.get("quarter")+"','"+objMap.get("city")+"')\" style=\"color:#1addfa;\">查看明细</a>");
		}
		
		sumMap.put("zdcpxl_QGoal", "");
		sumMap.put("zdcpxl_QRate", "");
		sumMap.put("zdcpxl_QValue", "");
		sumMap.put("sgyyschyzzb_QGoal", "");
		sumMap.put("sgyyschyzzb_QRate", "");
		sumMap.put("sgyyschyzzb_QValue", "");
		sumMap.put("sgyysyszkzb_QGoal", "");
		sumMap.put("sgyysyszkzb_QRate", "");
		sumMap.put("sgyysyszkzb_QValue", "");
		
		list.add(sumMap);
		return map;
	}
	
	/**
	 * 获取清算结果
	 */
	@Override
	public List<ZdResultCitykpiCalc> constructCalcResult(List<Map<String,Object>> list){
		
		List<ZdResultCitykpiCalc> resultList = new ArrayList<ZdResultCitykpiCalc>();
		
		for(Map<String,Object> map : list){
			
			Double scopeKpi=0d,channelKpi=0d,operationKpi=0d,addSubKpi=0d,imptDeduct=0d;
			ZdResultCitykpiCalc obj = new ZdResultCitykpiCalc();
			
			for(String key : map.keySet()){
				//规模  //销量、销售量、智能硬件收入、自主品牌手机收入
				if("xl_Score".equals(key) || "xse_Score".equals(key) || "znyjsr_Score".equals(key) || "zzppsjsr_Score".equals(key) || 
					  //自主品牌非配额智能硬件收入、自主品牌配额智能硬件收入、重点产品销量
						"zzppfpeznyjsr_Score".equals(key) || "zzpppeznyjsr_Score".equals(key) || "zdcpxl_Score".equals(key)){
					scopeKpi += ((Double)map.get(key)==null) ? 0d : (Double)map.get(key);
				}
				
				//渠道  //活跃客户目标、KA维系客户销量、中小活跃客户数
				else if("hykhmbz_Score".equals(key) || "kawxkhxl_Score".equals(key) || "zxhykhs_Score".equals(key)){
					channelKpi += ((Double)map.get(key)==null) ? 0d : (Double)map.get(key);
				}
				
				//运营效率 //三个月以上存货原值占比、三个月以上应收账款占比
				else if("sgyyschyzzb_Score".equals(key) || "sgyysyszkzb_Score".equals(key)){
					operationKpi += ((Double)map.get(key)==null) ? 0d : (Double)map.get(key);
				}
				
				//加减分项 //零售侧双渠道销量、零售侧双渠道净利润、新零售门店运营、售后净利
				else if("lscsqdxl_Score".equals(key) || "lscsqdjlr_Score".equals(key) || "xlsmdyy_Score".equals(key) || "shjl_Score".equals(key) || 
						//自主品牌销售额加分项、智能硬件毛利率、有效客户规模扣分项
						"zzppxsejfx_Score".equals(key) || "znyjmll_Score".equals(key) || "yhkhgmkfx_Score".equals(key)){
					addSubKpi += ((Double)map.get(key)==null) ? 0d : (Double)map.get(key);
				}
			}
			
			//重点扣分项、//?zdsxkfx?
			//imptDeduct = ((Double)map.get("imptDeduct_Score") == null) ? 0d : (Double)map.get("imptDeduct_Score");
			imptDeduct = ((Double)map.get("zdsxkfx_Score") == null) ? 0d : (Double)map.get("zdsxkfx_Score");
			
			if(map.get("operationCenter") != null && map.get("city") != null && map.get("year") != null && map.get("quarter") != null){
				obj.setOperationCenter(map.get("operationCenter").toString());
				obj.setYear(map.get("year").toString());
				obj.setQuarter(map.get("quarter").toString());
				obj.setCity(map.get("city").toString());
				obj.setScopeKpi(scopeKpi);
				obj.setChannelKpi(channelKpi);
				obj.setOperationKpi(operationKpi);
				obj.setAddSubKpi(addSubKpi);
				obj.setImptDeduct(imptDeduct);
				obj.setKpi(scopeKpi+channelKpi+operationKpi+addSubKpi+imptDeduct);
				resultList.add(obj);
			}
		}
		
		return resultList;
	}
	
	/**
	 * 统计各营运中心合计值
	 * @param list
	 * @return
	 */
	public List<ZdResultCitykpiCalc> calcResultSum(List<ZdResultCitykpiCalc> list){
		
		List<ZdResultCitykpiCalc> newList = new ArrayList<ZdResultCitykpiCalc>();
		
		ZdResultCitykpiCalc dg = new ZdResultCitykpiCalc("","合计1");
		ZdResultCitykpiCalc fs = new ZdResultCitykpiCalc("","合计2");
		ZdResultCitykpiCalc gz = new ZdResultCitykpiCalc("","合计3");
		ZdResultCitykpiCalc sz = new ZdResultCitykpiCalc("","合计4");
		ZdResultCitykpiCalc all = new ZdResultCitykpiCalc("","全省合计");
		
		List<ZdResultCitykpiCalc> dgList = new ArrayList<ZdResultCitykpiCalc>();
		List<ZdResultCitykpiCalc> fsList = new ArrayList<ZdResultCitykpiCalc>();
		List<ZdResultCitykpiCalc> gzList = new ArrayList<ZdResultCitykpiCalc>();
		List<ZdResultCitykpiCalc> szList = new ArrayList<ZdResultCitykpiCalc>();
		
		//计算各运营中心合计值
		for(ZdResultCitykpiCalc obj : list){
			if("东莞运营中心".equals(obj.getOperationCenter())){
				dgList.add(obj);
				dg.setScopeKpi(dg.getScopeKpi()+obj.getScopeKpi());
				dg.setAddSubKpi(dg.getAddSubKpi()+obj.getAddSubKpi());
				dg.setChannelKpi(dg.getChannelKpi()+obj.getChannelKpi());
				dg.setImptDeduct(dg.getImptDeduct()+obj.getImptDeduct());
				dg.setKpi(dg.getKpi()+obj.getKpi());
				dg.setOperationKpi(dg.getOperationKpi()+obj.getOperationKpi());
			}else if("佛山运营中心".equals(obj.getOperationCenter())){
				fsList.add(obj);
				fs.setScopeKpi(fs.getScopeKpi()+obj.getScopeKpi());
				fs.setAddSubKpi(fs.getAddSubKpi()+obj.getAddSubKpi());
				fs.setChannelKpi(fs.getChannelKpi()+obj.getChannelKpi());
				fs.setImptDeduct(fs.getImptDeduct()+obj.getImptDeduct());
				fs.setKpi(fs.getKpi()+obj.getKpi());
				fs.setOperationKpi(fs.getOperationKpi()+obj.getOperationKpi());
			}else if("广州运营中心".equals(obj.getOperationCenter())){
				gzList.add(obj);
				gz.setScopeKpi(gz.getScopeKpi()+obj.getScopeKpi());
				gz.setAddSubKpi(gz.getAddSubKpi()+obj.getAddSubKpi());
				gz.setChannelKpi(gz.getChannelKpi()+obj.getChannelKpi());
				gz.setImptDeduct(gz.getImptDeduct()+obj.getImptDeduct());
				gz.setKpi(gz.getKpi()+obj.getKpi());
				gz.setOperationKpi(gz.getOperationKpi()+obj.getOperationKpi());
			}else if("深圳运营中心".equals(obj.getOperationCenter())){
				szList.add(obj);
				sz.setScopeKpi(sz.getScopeKpi()+obj.getScopeKpi());
				sz.setAddSubKpi(sz.getAddSubKpi()+obj.getAddSubKpi());
				sz.setChannelKpi(sz.getChannelKpi()+obj.getChannelKpi());
				sz.setImptDeduct(sz.getImptDeduct()+obj.getImptDeduct());
				sz.setKpi(sz.getKpi()+obj.getKpi());
				sz.setOperationKpi(sz.getOperationKpi()+obj.getOperationKpi());
			}
		}
		dgList.add(dg);
		fsList.add(fs);
		gzList.add(gz);
		szList.add(sz);
		
		//计算全省合计值
		all.setAddSubKpi(dg.getAddSubKpi()+fs.getAddSubKpi()+gz.getAddSubKpi()+sz.getAddSubKpi());
		all.setChannelKpi(dg.getChannelKpi()+fs.getChannelKpi()+gz.getChannelKpi()+sz.getChannelKpi());
		all.setImptDeduct(dg.getImptDeduct()+fs.getImptDeduct()+gz.getImptDeduct()+sz.getImptDeduct());
		all.setKpi(dg.getKpi()+fs.getKpi()+gz.getKpi()+sz.getKpi());
		all.setOperationKpi(dg.getOperationKpi()+fs.getOperationKpi()+gz.getOperationKpi()+sz.getOperationKpi());
		all.setScopeKpi(dg.getScopeKpi()+fs.getScopeKpi()+gz.getScopeKpi()+sz.getScopeKpi());
		
		//保持顺序（各运营中心合计值在运营中心所有地市后面，全省合计值在最后面）
		newList.addAll(dgList);
		newList.addAll(fsList);
		newList.addAll(gzList);
		newList.addAll(szList);
		newList.add(all);
		
		return newList;
	}
	
	/**
	 * 统计排名
	 * @param list
	 * @return
	 */
	public List<ZdResultCitykpiCalc> calcResultRank(List<ZdResultCitykpiCalc> list){
		
		//重装List<Map<Obj,kpi>
		LinkedHashMap<ZdResultCitykpiCalc,Double> cityMap = new LinkedHashMap<ZdResultCitykpiCalc,Double>();
		LinkedHashMap<ZdResultCitykpiCalc,Double> operationMap = new LinkedHashMap<ZdResultCitykpiCalc,Double>();
		for(ZdResultCitykpiCalc obj : list){
			if(false == obj.getCity().contains("合计")){
				cityMap.put(obj, obj.getKpi());
			}else if("合计1".equals(obj.getCity()) || "合计2".equals(obj.getCity()) || "合计3".equals(obj.getCity()) || "合计4".equals(obj.getCity())){
				operationMap.put(obj, obj.getKpi());
			}else{
				//TODO
			}
		}
		ArrayList<Entry<ZdResultCitykpiCalc,Double>> cityList = new ArrayList<Map.Entry<ZdResultCitykpiCalc,Double>>(cityMap.entrySet());
		ArrayList<Entry<ZdResultCitykpiCalc,Double>> operationList = new ArrayList<Map.Entry<ZdResultCitykpiCalc,Double>>(operationMap.entrySet());

		//排序
		this.sort(cityList);
		this.sort(operationList);
		
		return list;
	}
	
	/**
	 * 排序
	 * @param list
	 */
	private void sort(ArrayList<Entry<ZdResultCitykpiCalc,Double>> list){
		//倒序排序
		Collections.sort(list, new Comparator<Map.Entry<ZdResultCitykpiCalc,Double>>() {
		    @Override
		    public int compare(Entry<ZdResultCitykpiCalc,Double> o1, Entry<ZdResultCitykpiCalc,Double> o2) {
		    	return ((o2.getValue() - o1.getValue() == 0) ? 
		                0: (o2.getValue() - o1.getValue() > 0) ? 1: -1);
		    }
		});
		
		//标记排名顺序（注：暂不支持等值排名相同的问题）
		for(int i=0;i<list.size();i++){
			list.get(i).getKey().setRank(i+1);
		}
	}

	/**
	 * 解析参数
	 */
	@Override
	public List<ZdResultCitykpiQ> parseParam(Map<String, Object> paramMap) throws Exception {
		 Map<String, Map<String, Object>> cityKpiKeyMapObj = this.getCityKpiKeyMapObj();
		
		String year = paramMap.get("year").toString();
		String quarter = paramMap.get("quarter").toString();
		String city = paramMap.get("city").toString();
		
		List<ZdResultCitykpiQ> list = new ArrayList<ZdResultCitykpiQ>();
		
		//构建各个对象的Map
		for(String paramKey : paramMap.keySet()){
			if(paramKey.contains("_")){
				String[] keyArr = paramKey.split("_");
				String val="";
				if(paramMap.get(paramKey) != null){
					val = paramMap.get(paramKey).toString();
				}
				
				for(String key : cityKpiKeyMapObj.keySet()){
					if(key.equals(keyArr[0])){
						cityKpiKeyMapObj.get(key).put(keyArr[1], val);
					}
				}
			}
		}
		
		//logger.debug("CITYKPIKEYMAPOBJ: "+cityKpiKeyMapObj);
		this.constructObj(year, quarter, city, list,cityKpiKeyMapObj);
		return list;
	}
	
	/**
	 * 构建对象
	 * @param year
	 * @param quarter
	 * @param city
	 * @throws Exception
	 */
	private List<ZdResultCitykpiQ> constructObj(String year, String quarter, String city, List<ZdResultCitykpiQ> list,Map<String, Map<String, Object>> cityKpiKeyMapObj) throws Exception {
		
		for(String kpiname : cityKpiKeyMapObj.keySet()){
			ZdResultCitykpiQ obj = new ZdResultCitykpiQ(year, quarter, city, CITYKPIKEYMAP.get(kpiname));
			Map<String,Object> map = cityKpiKeyMapObj.get(kpiname);
			for(String key : map.keySet()){
				String setMethodName = this.parSetName(key);
				//剔除指标【重点产品销量】、【三个月以上存货原值占比】、【三个月以上应收账款占比】的季度值
				if(false == (("zdcpxl".equals(kpiname) || "sgyyschyzzb".equals(kpiname) || "sgyysyszkzb".equals(kpiname)) 
						&& ("QValue".equals(key) || "QGoal".equals(key) || "QRate".equals(key)))){
					Method method = ZdResultCitykpiQ.class.getMethod(setMethodName, Double.class);
					method.invoke(obj, Double.valueOf(map.get(key).toString()));
				}
			}
			list.add(obj);
		}
		return list;
	}
	
	public String parSetName(String fieldName) {		
		if (null == fieldName || "".equals(fieldName)) {			
			return null;		
		}		
		int startIndex = 0;		
		if (fieldName.charAt(0) == '_')			
			startIndex = 1;		
		return "set"+fieldName.substring(startIndex, startIndex + 1).toUpperCase()+ fieldName.substring(startIndex + 1);	
	}

	@SuppressWarnings("serial")
	public static final Map<String,String> CITYKPIMAP = new HashMap<String,String>(){
		{
			put("销量", "xl");
			put("销售额", "xse");
			put("自主品牌非配额智能硬件收入", "zzppfpeznyjsr");
			put("自主品牌配额智能硬件收入", "zzpppeznyjsr");
			put("自主品牌手机收入", "zzppsjsr");
			put("活跃客户目标值", "hykhmbz");
			put("智能硬件收入", "znyjsr");
			put("中小活跃客户数", "zxhykhs");
			put("KA维系客户销量", "kawxkhxl");
			put("重点产品销量", "zdcpxl");
			put("三个月以上存货原值占比", "sgyyschyzzb");
			put("三个月以上应收账款占比", "sgyysyszkzb");
			put("零售侧双渠道销量", "lscsqdxl");
			put("零售侧双渠道净利润", "lscsqdjlr");
			put("新零售门店运营", "xlsmdyy");
			put("售后净利", "shjl");
			put("自主品牌销售额加分项", "zzppxsejfx");
			put("智能硬件毛利率", "znyjmll");
			put("有效客户规模扣分项", "yhkhgmkfx");
			put("重大事项扣分项", "zdsxkfx");
		}
	};
	
	@SuppressWarnings("serial")
	public static final Map<String,String> CITYKPIKEYMAP = new HashMap<String,String>(){
		{
			put("xl", "销量");
			put("xse", "销售额");
			put("zzppfpeznyjsr", "自主品牌非配额智能硬件收入");
			put("zzpppeznyjsr", "自主品牌配额智能硬件收入");
			put("zzppsjsr", "自主品牌手机收入");
			put("hykhmbz", "活跃客户目标值");
			put("znyjsr", "智能硬件收入");
			put("zxhykhs", "中小活跃客户数");
			put("kawxkhxl", "KA维系客户销量");
			put("zdcpxl", "重点产品销量");
			put("sgyyschyzzb", "三个月以上存货原值占比");
			put("sgyysyszkzb", "三个月以上应收账款占比");
			put("lscsqdxl", "零售侧双渠道销量");
			put("lscsqdjlr", "零售侧双渠道净利润");
			put("xlsmdyy", "新零售门店运营");
			put("shjl", "售后净利");
			put("zzppxsejfx", "自主品牌销售额加分项");
			put("znyjmll", "智能硬件毛利率");
			put("yhkhgmkfx", "有效客户规模扣分项");
			put("zdsxkfx", "重大事项扣分项");
		}
	};
	
	public Map<String, Map<String, Object>> getCityKpiKeyMapObj(){
		Map<String, Map<String, Object>> cityKpiKeyMapObj = new HashMap<String, Map<String, Object>>(){
			{
				put("xl", new HashMap<String, Object>());
				put("xse", new HashMap<String, Object>());
				put("zzppfpeznyjsr", new HashMap<String, Object>());
				put("zzpppeznyjsr", new HashMap<String, Object>());
				put("zzppsjsr", new HashMap<String, Object>());
				put("hykhmbz", new HashMap<String, Object>());
				put("znyjsr", new HashMap<String, Object>());
				put("zxhykhs", new HashMap<String, Object>());
				put("kawxkhxl", new HashMap<String, Object>());
				put("zdcpxl", new HashMap<String, Object>());
				put("sgyyschyzzb", new HashMap<String, Object>());
				put("sgyysyszkzb", new HashMap<String, Object>());
				put("lscsqdxl", new HashMap<String, Object>());
				put("lscsqdjlr", new HashMap<String, Object>());
				put("xlsmdyy", new HashMap<String, Object>());
				put("shjl", new HashMap<String, Object>());
				put("zzppxsejfx", new HashMap<String, Object>());
				put("znyjmll", new HashMap<String, Object>());
				put("yhkhgmkfx", new HashMap<String, Object>());
				put("zdsxkfx", new HashMap<String, Object>());
			}
		};
		return cityKpiKeyMapObj;
	}
	


	

}



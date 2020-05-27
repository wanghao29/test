/**
 * Copyright (C) 2018 Long Inc., All Rights Reserved.
 */
package com.asiainfo.cmc.service;

import java.util.List;
import java.util.Map;

import com.asiainfo.cmc.enties.ZdResultCitykpiCalc;
import com.asiainfo.cmc.enties.ZdResultCitykpiQ;

/**
 * @TODO
 * @author Long
 * @date 2018年9月14日下午2:16:40
 */
public interface ZdResultCitykpiQService {
	
	/**
	 * 更新
	 * @param record
	 * @return
	 */
	int updateByPrimaryKeySelective(ZdResultCitykpiQ record);
	
	/**
	 * 解析参数
	 * @param map
	 * @return
	 */
	List<ZdResultCitykpiQ> parseParam(Map<String,Object> paramMap) throws Exception;

	/**
	 * 条件查询
	 * @return
	 */
	public List<ZdResultCitykpiQ> findAllByParam();
	
	/**
	 * 条件查询
	 * @param year
	 * @param quarter
	 * @return
	 */
	public List<ZdResultCitykpiQ> findAllByParam(String year, String quarter);
	
	/**
	 * 组装各指标数据
	 * @param objList
	 * @return
	 */
	public Map<String,List<Map<String,Object>>> constructKpi(List<ZdResultCitykpiQ> objList);
	
	/**
	 * 处理重点产品销量【季度目标值、完成值、完成率】的链接
	 * @param map
	 * @return
	 */
	public Map<String,List<Map<String,Object>>> handleExtra(Map<String,List<Map<String,Object>>> map,String year,String quarter);
	
	/**
	 * 组装清算结果集数据
	 * @param list
	 * @return
	 */
	public List<ZdResultCitykpiCalc> constructCalcResult(List<Map<String,Object>> list);
	
	/**
	 * 统计排名
	 * @param list
	 * @return
	 */
	public List<ZdResultCitykpiCalc> calcResultRank(List<ZdResultCitykpiCalc> list);
	
	/**
	 * 统计各营运中心合计值
	 * @param list
	 * @return
	 */
	public List<ZdResultCitykpiCalc> calcResultSum(List<ZdResultCitykpiCalc> list);
	
}

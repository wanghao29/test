package com.asiainfo.cmc.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;

import com.asiainfo.cmc.enties.ProvinceAdjustField;
import com.asiainfo.cmc.enties.ZdKpiCfgAdjust;
import com.asiainfo.cmc.enties.ZdKpiCfgAdjustLog;

public interface ZdKpiCfgAdjustService {

	/** 根据kpiName查询数据 **/
	public List<ZdKpiCfgAdjust> getDataByKpiName(Map<String,Object> param);
	/**通过  month 。调整字段  和  tableName 查询数据 **/
	public Map<String,String> getDataByParam(Map<String,Object> param);
	/** 更新调整数据 **/
	public void updateAdjust(Map<String,Object> param);
	public void updateAdjustMbz(Map<String,Object> param);
	
	public void insertLog(Map<String,Object> param);
	/** 查询调整日志 **/
	public List<ZdKpiCfgAdjustLog>  getAdjustLogTable(Map<String,Object> param);
	
	public Integer getTotalByParam(Map<String,Object> param);
	
	public List<String> getFieldNames(Map<String,Object> params);
	
	
}

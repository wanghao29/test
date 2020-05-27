package com.asiainfo.cmc.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.asiainfo.cmc.enties.ProvinceAdjustField;
import com.asiainfo.cmc.enties.ZdKpiCfgAdjust;
import com.asiainfo.cmc.enties.ZdKpiCfgAdjustLog;

@Repository
public interface ZdKpiCfgAdjustMapper {

	List<ZdKpiCfgAdjust> getDataByKpiName(Map<String, Object> param);
	
	Map<String,String> getDataByParam(Map<String, Object> param);
	
	void updateAdjust(Map<String,Object> param);
	void updateAdjustMbz(Map<String,Object> param);
	
	void insertLog(Map<String,Object> param);
	
	List<ZdKpiCfgAdjustLog> getAdjustLogTable(Map<String, Object> param);
	
	Integer getTotalByParam(Map<String,Object> param);
	
	List<String> getFieldNames(Map<String,Object> params);
}

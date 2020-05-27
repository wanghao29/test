package com.asiainfo.cmc.mapper.gfKpi.operateEfficiency;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.asiainfo.cmc.enties.gfKpi.operateEfficiency.BackForecastAccuracy;

public interface BackForecastAccuracyMapper {
	public List<BackForecastAccuracy> queryData(Map<String, Object> params);
	public void calculatedScore(@Param("startMonth")String startMonth, @Param("endMonth")String endMonth);
	public void insert(Map<String, Object> params);
	public BackForecastAccuracy  queryDataByMonth(@Param("billcyc")String billcyc);
	public void updateByMonth(Map<String, Object> params);
	
	public BackForecastAccuracy overview(Map<String, Object> params);
	public List<BackForecastAccuracy> getList(Map<String,Object> params);
	public int getTotal(Map<String,Object> params);
}

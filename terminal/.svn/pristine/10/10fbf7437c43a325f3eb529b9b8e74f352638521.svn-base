package com.asiainfo.cmc.service.gfKpi.operateEfficiency;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;

import com.asiainfo.cmc.enties.gfKpi.operateEfficiency.BackForecastAccuracy;
import com.github.pagehelper.PageInfo;

public interface IBackForecastAccuracyService {
	public  PageInfo<BackForecastAccuracy> queryData(Map<String, Object> params);
	public void calculatedScore( String startMonth, String endMonth);
	public void insert(Map<String, Object> params);
	public BackForecastAccuracy  queryDataByMonth(String startMonth);
	public void updateByMonth(Map<String, Object> params);
	
	public  BackForecastAccuracy overview(Map<String, Object> params);
	public List<BackForecastAccuracy> getList(Map<String,Object> params);
	public int getTotal(Map<String,Object> params);
}

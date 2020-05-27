package com.asiainfo.cmc.service.gfKpi.operateEfficiency;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;

import com.asiainfo.cmc.enties.gfKpi.operateEfficiency.ThreeStockValueProportion;
import com.github.pagehelper.PageInfo;

public interface IThreeStockValueProportionService {
	public  PageInfo<ThreeStockValueProportion> queryData(Map<String, Object> params);
	public void calculatedScore( String startMonth, String endMonth);
	
	public  ThreeStockValueProportion  overview(Map<String,Object> params);
	public List<ThreeStockValueProportion> getList( Map<String,Object> params);
	public int getTotal( Map<String,Object> params);
}

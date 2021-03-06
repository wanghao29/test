package com.asiainfo.cmc.service.gfKpi.operateEfficiency;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;

import com.asiainfo.cmc.enties.gfKpi.operateEfficiency.ThreeReceivableProportion;
import com.github.pagehelper.PageInfo;

public interface IThreeReceivableProportionService {
	public  PageInfo<ThreeReceivableProportion> queryData(Map<String, Object> params);
	
	public void calculatedScore( String startMonth, String endMonth);
	
	public  ThreeReceivableProportion overview(Map<String, Object> params);
	public List<ThreeReceivableProportion> getList(Map<String,Object> params);
	public int getTotal( Map<String,Object> params);
}

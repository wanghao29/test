package com.asiainfo.cmc.service.gfKpi.operateEfficiency;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;

import com.asiainfo.cmc.enties.gfKpi.operateEfficiency.ReceivableTurnoverRate;
import com.github.pagehelper.PageInfo;

public interface IReceivableTurnoverRateService {
	public  PageInfo<ReceivableTurnoverRate> queryData(Map<String, Object> params);
	
	public void calculatedScore( String startMonth, String endMonth);
	
	public  ReceivableTurnoverRate overview(Map<String, Object> params);
	public List<ReceivableTurnoverRate> getList(Map<String,Object> params);
	public int getTotal( Map<String,Object> params);
}

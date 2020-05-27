package com.asiainfo.cmc.mapper.gfKpi.operateEfficiency;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestBody;

import com.asiainfo.cmc.enties.gfKpi.operateEfficiency.ReceivableTurnoverRate;

public interface ReceivableTurnoverRateMapper {
	public List<ReceivableTurnoverRate> queryData(Map<String, Object> params);
	public void calculatedScore(@Param("startMonth")String startMonth, @Param("endMonth")String endMonth);
	
	public  ReceivableTurnoverRate overview(Map<String, Object> params);
	public List<ReceivableTurnoverRate> getList(Map<String,Object> params);
	public int getTotal( Map<String,Object> params);
}

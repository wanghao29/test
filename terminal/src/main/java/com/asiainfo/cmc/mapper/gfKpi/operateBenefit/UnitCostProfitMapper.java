package com.asiainfo.cmc.mapper.gfKpi.operateBenefit;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.asiainfo.cmc.enties.gfKpi.operateBenefit.UnitCostProfit;

public interface UnitCostProfitMapper {
	public List<UnitCostProfit> queryData(Map<String, Object> params);
	public void calculatedScore(@Param("startMonth")String startMonth, @Param("endMonth")String endMonth);
}

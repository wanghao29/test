package com.asiainfo.cmc.service.gfKpi.operateBenefit;

import java.util.Map;

import com.asiainfo.cmc.enties.gfKpi.operateBenefit.UnitCostProfit;
import com.github.pagehelper.PageInfo;

public interface IUnitCostProfitService {
	public  PageInfo<UnitCostProfit> queryData(Map<String, Object> params);
	public void calculatedScore( String startMonth, String endMonth);
}

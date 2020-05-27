package com.asiainfo.cmc.service.gfKpi.operateBenefit;

import java.util.Map;

import com.asiainfo.cmc.enties.gfKpi.operateBenefit.TotalProfit;
import com.github.pagehelper.PageInfo;

public interface ITotalProfitService {
	public  PageInfo<TotalProfit> queryData(Map<String, Object> params);
	public void calculatedScore( String startMonth, String endMonth);
}

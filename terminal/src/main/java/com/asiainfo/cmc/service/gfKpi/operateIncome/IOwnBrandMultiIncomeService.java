package com.asiainfo.cmc.service.gfKpi.operateIncome;

import java.util.Map;

import com.asiainfo.cmc.enties.gfKpi.operateIncome.OwnBrandMultiIncome;
import com.github.pagehelper.PageInfo;

public interface IOwnBrandMultiIncomeService {
	public PageInfo<OwnBrandMultiIncome> queryData(Map<String, Object> params) ;
	public void calculatedScore( String startMonth,  String endMonth);
}

package com.asiainfo.cmc.service.gfKpi.operateIncome;

import java.util.Map;

import com.asiainfo.cmc.enties.gfKpi.operateIncome.OwnBrandOtherMultiIncome;
import com.github.pagehelper.PageInfo;

public interface IOwnBrandOtherMultiIncomeService {
	public PageInfo<OwnBrandOtherMultiIncome> queryData(Map<String, Object> params) ;
	public void calculatedScore( String startMonth,  String endMonth);
}

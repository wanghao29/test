package com.asiainfo.cmc.service.gfKpi.operateIncome;

import java.util.Map;

import com.asiainfo.cmc.enties.gfKpi.operateIncome.OperateIncome;
import com.github.pagehelper.PageInfo;

public interface IOperateIncomeaService {
	public PageInfo<OperateIncome> queryData(Map<String, Object> params) ;
	public void calculatedScore( String startMonth,  String endMonth);
}

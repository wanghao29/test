package com.asiainfo.cmc.mapper.gfKpi.operateIncome;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.asiainfo.cmc.enties.gfKpi.operateIncome.OperateIncome;
import com.github.pagehelper.PageInfo;

public interface OperateIncomeMapper {
	public List<OperateIncome> queryData(Map<String, Object> params);
	public void calculatedScore(@Param("startMonth")String startMonth, @Param("endMonth")String endMonth);
	
}

package com.asiainfo.cmc.mapper.gfKpi.operateIncome;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.asiainfo.cmc.enties.gfKpi.operateIncome.OwnBrandOtherMultiIncome;

public interface OwnBrandOtherMultiIncomeMapper {
	public List<OwnBrandOtherMultiIncome> queryData(Map<String, Object> params);
	public void calculatedScore(@Param("startMonth")String startMonth, @Param("endMonth")String endMonth);
}

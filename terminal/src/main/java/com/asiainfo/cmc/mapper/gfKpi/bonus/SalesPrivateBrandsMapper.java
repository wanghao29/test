package com.asiainfo.cmc.mapper.gfKpi.bonus;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.asiainfo.cmc.enties.gfKpi.bonus.SalesPrivateBrands;

public interface SalesPrivateBrandsMapper {
	public List<SalesPrivateBrands> queryData(Map<String, Object> params);
	public void calculatedScore(@Param("startMonth")String startMonth, @Param("endMonth")String endMonth);
}

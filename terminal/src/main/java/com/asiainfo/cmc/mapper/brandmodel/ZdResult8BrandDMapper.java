package com.asiainfo.cmc.mapper.brandmodel;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.asiainfo.cmc.enties.brandmodel.ZdResult8BrandD;

public interface ZdResult8BrandDMapper {

	/**
	 *通过月份和8字类型  获取value值
	 */
	List<ZdResult8BrandD> getValueByMonthAndType(@Param(value = "month") String month);
	
	String getSqlByDim(@Param(value="dim")String dim);
	
	Float aRTRatio(@Param(value = "month") String month);
	
	Float aRRatio(@Param(value = "month") String month);
}

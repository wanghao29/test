package com.asiainfo.cmc.mapper.gfKpi.operateEfficiency;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.asiainfo.cmc.enties.gfKpi.operateEfficiency.InventoryTurnover;

public interface InventoryTurnoverMapper {
	public List<InventoryTurnover> queryData(Map<String, Object> params);
	public void calculatedScore(@Param("startMonth")String startMonth, @Param("endMonth")String endMonth);
	
	public InventoryTurnover overview(Map<String, Object> params);
	public List<InventoryTurnover> getList( Map<String,Object> params);
	public int getTotal( Map<String,Object> params);}

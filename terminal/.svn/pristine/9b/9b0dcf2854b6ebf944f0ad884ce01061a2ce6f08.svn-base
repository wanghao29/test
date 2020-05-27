package com.asiainfo.cmc.mapper.gfKpi.operateCoordination;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.asiainfo.cmc.enties.gfKpi.operateCoordination.NetPhonesSalesProportion;

public interface NetPhonesSalesProportionMapper {
	public List<NetPhonesSalesProportion> queryData(Map<String, Object> params);
	public void calculatedScore(@Param("startMonth")String startMonth, @Param("endMonth")String endMonth);
	public void insert(Map<String, Object> params);
	public NetPhonesSalesProportion  queryDataByMonth(@Param("billcyc")String billcyc);
	public void updateByMonth(Map<String, Object> params);
}

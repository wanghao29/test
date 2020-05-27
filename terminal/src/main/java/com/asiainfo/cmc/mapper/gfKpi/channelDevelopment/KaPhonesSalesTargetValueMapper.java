package com.asiainfo.cmc.mapper.gfKpi.channelDevelopment;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.asiainfo.cmc.enties.gfKpi.channelDevelopment.KaPhonesSalesTargetValue;

public interface KaPhonesSalesTargetValueMapper {
	public List<KaPhonesSalesTargetValue> queryData(Map<String, Object> params);
	public void calculatedScore(@Param("startMonth")String startMonth, @Param("endMonth")String endMonth);
}

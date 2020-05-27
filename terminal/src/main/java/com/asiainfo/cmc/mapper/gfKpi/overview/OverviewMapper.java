package com.asiainfo.cmc.mapper.gfKpi.overview;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.asiainfo.cmc.enties.gfKpi.overview.Overview;

public interface OverviewMapper {
	public List<Overview> queryData(@Param("billcyc")String billcyc);
	public void calculatedScore(@Param("billcyc")String billcyc);
	public int updateRemarks(Map<String, String> param);
}

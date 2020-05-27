package com.asiainfo.cmc.qudao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;


import com.asiainfo.cmc.qudao.enties.HallBrndTttt;
import com.asiainfo.cmc.qudao.vo.BrndCoverVo;

/**
 * 厅店维度 各覆盖程度中厅店类型
 */
public interface HallBrndTtttMapper {
	
	/**
	 * 根据地市、品牌、月份、类型(新增、存量),获取某覆盖程度中厅店类型
	 */
	public List<HallBrndTttt> getHallBrndTttt(BrndCoverVo vo);
	public List<HallBrndTttt> getHallBrndTttt1(BrndCoverVo vo);
	public List<Map<String,Object>> getMapHallBrndTttt(BrndCoverVo vo);
	
	
	/**
	 * 根据地市、品牌、类型(新增、存量)、基础类型(覆盖程度、厅店类型)，查到连续月份的基站总数
	 */
	public List<Map<String,Object>> listCntANdNumByMons(BrndCoverVo vo);	
	public List<Map<String,Object>> listCntANdNumByMons1(BrndCoverVo vo);	
	/**
	 * 获取品牌列表
	 */
	public List<String> listBrand(BrndCoverVo vo);
	
	
	 /**
     * 连续查询品牌覆盖情况
     * @param vo
     * @return
     */
    
    public List<String> listCoverBrand(@Param(value = "DODATE") String startMonth,@Param(value = "DODATE1") String endMonth,@Param(value = "BRANDNAME") String brandname,@Param(value = "AREANAME") String areaname);

}

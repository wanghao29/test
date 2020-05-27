package com.asiainfo.cmc.qudao.mapper;

import java.util.List;
import java.util.Map;

import com.asiainfo.cmc.qudao.enties.HallBrndFfff;
import com.asiainfo.cmc.qudao.vo.BrndCoverVo;

/**
 * 主要品牌厅店维度覆盖程度
 */
public interface HallBrndFfffMapper {

	/**
	 * 根据地市、品牌、月份、类型(新增、存量)、获取某基础类型(覆盖程度、厅店类型) 的对象
	 */
	public List<HallBrndFfff> getHallBrndFfff(BrndCoverVo vo);
	public List<HallBrndFfff> getHallBrndFfff1(BrndCoverVo vo);
	public List<Map<String,Object>> getMapHallBrndFfff(BrndCoverVo vo);

	
	/**
	 * 根据地市、品牌、类型(新增、存量)、基础类型(覆盖程度、厅店类型)，查到连续月份的基站总数
	 */
	public List<Map<String,Object>> listCntANdNumByMons(BrndCoverVo vo);
	public List<Map<String,Object>> listCntANdNumByMons1(BrndCoverVo vo);

}

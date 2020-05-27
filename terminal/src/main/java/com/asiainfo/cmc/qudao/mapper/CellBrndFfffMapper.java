package com.asiainfo.cmc.qudao.mapper;

import java.util.List;
import java.util.Map;

import com.asiainfo.cmc.qudao.enties.CellBrndFfff;
import com.asiainfo.cmc.qudao.vo.BrndCoverVo;

/**
 * 主要品牌基站维度覆盖程度
 */
public interface CellBrndFfffMapper {

	/**
	 * 根据地市、品牌、月份、类型(新增、存量)、基础类型(覆盖程度、基站类型) 获取对象
	 */
	public List<CellBrndFfff> getCellBrndFfff(BrndCoverVo vo);
	public List<CellBrndFfff> getCellBrndFfff1(BrndCoverVo vo);
	public List<Map<String, Object>> getMapCellBrndFfff(BrndCoverVo vo);
	
	/**
	 * 根据地市、品牌、类型(新增、存量)、基础类型(覆盖程度、基站类型)，查到连续月份的基站总数
	 */
	public List<Map<String,Object>> listCntANdNumByMons(BrndCoverVo vo);
	public List<Map<String,Object>> listCntANdNumByMons1(BrndCoverVo vo);
	
}

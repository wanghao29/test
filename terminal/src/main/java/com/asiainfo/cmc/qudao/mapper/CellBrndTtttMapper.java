package com.asiainfo.cmc.qudao.mapper;

import java.util.List;
import java.util.Map;

import com.asiainfo.cmc.qudao.enties.CellBrndTttt;
import com.asiainfo.cmc.qudao.vo.BrndCoverVo;

/**
 * 基站维度 各覆盖程度中厅店类型
 */
public interface CellBrndTtttMapper {

	/**
	 * 根据地市、品牌、月份、类型(新增、存量),列出各覆盖程度中基站类型
	 */
	public List<CellBrndTttt> getCellBrndTttt(BrndCoverVo vo);
	public List<CellBrndTttt> getCellBrndTttt1(BrndCoverVo vo);
	public List<Map<String, Object>> getMapCellBrndTttt(BrndCoverVo vo);
	
	/**
	 * 根据地市、品牌、类型(新增、存量)、基础类型(覆盖程度、基站类型)，查到连续月份的基站总数
	 */
	public List<Map<String,Object>> listCntANdNumByMons(BrndCoverVo vo);
	public List<Map<String,Object>> listCntANdNumByMons1(BrndCoverVo vo);
	
	/**
	 * 获取品牌列表
	 */
	public List<String> listBrand(BrndCoverVo vo);
	
}

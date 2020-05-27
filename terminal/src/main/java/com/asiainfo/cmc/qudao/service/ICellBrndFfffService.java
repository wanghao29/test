package com.asiainfo.cmc.qudao.service;

import java.util.List;
import java.util.Map;

import com.asiainfo.cmc.qudao.enties.CellBrndFfff;
import com.asiainfo.cmc.qudao.enties.CusChanPortray;
import com.asiainfo.cmc.qudao.vo.BrndCoverVo;

/**
 * 主要品牌基站维度覆盖程度
 */
public interface ICellBrndFfffService {

	/**
	 * 根据地市、品牌、月份、类型(新增、存量)、基础类型(覆盖程度、基站类型) 获取对象
	 */
	public List<CellBrndFfff> getCellBrndFfff(BrndCoverVo vo);
	public List<CellBrndFfff> getCellBrndFfff1(BrndCoverVo vo);
	public List<Map<String,Object>> getMapCellBrndFfff(BrndCoverVo vo);
	
	/**
	 * 根据地市、品牌、类型(新增、存量)、基础类型(覆盖程度、基站类型)，查到连续月份的基站总数
	 */
	public Map<String,String> listCntANdNumByMons(BrndCoverVo vo);
	public Map<String,String> listCntANdNumByMons1(BrndCoverVo vo);

	
	 /**
     * 获取各门店类型覆盖程度占比表中所有字段
     */
	public List<CusChanPortray> listPortrayFieldInCellBrandFfff();

}

package com.asiainfo.cmc.qudao.service;

import java.util.List;
import java.util.Map;

import com.asiainfo.cmc.qudao.enties.CusChanPortray;
import com.asiainfo.cmc.qudao.enties.HallBrndFfff;
import com.asiainfo.cmc.qudao.vo.BrndCoverVo;

/**
 * 主要品牌厅店维度覆盖程度
 */
public interface IHallBrndFfffService {

	/**
	 * 根据地市、品牌、月份、类型(新增、存量)、基础类型(覆盖程度、厅店类型) 获取对象
	 */
	public List<HallBrndFfff> getHallBrndFfff(BrndCoverVo vo);
	public List<HallBrndFfff> getHallBrndFfff1(BrndCoverVo vo);	
	public List<Map<String,Object>> getMapHallBrndFfff(BrndCoverVo vo);
	
	/**
	 * 根据地市、品牌、类型(新增、存量)、基础类型(覆盖程度、厅店类型)，查到连续月份的基站总数
	 */
	public Map<String,String> listCntANdNumByMons(BrndCoverVo vo);
	public Map<String,String> listCntANdNumByMons1(BrndCoverVo vo);
	
	 /**
     * 获取各门店类型覆盖程度占比表中所有字段
     */
    public List<CusChanPortray> listPortrayFieldInHallBrandFfff();
	
}

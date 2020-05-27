package com.asiainfo.cmc.qudao.service;

import java.util.List;
import java.util.Map;

import com.asiainfo.cmc.enties.brandmodel.OverCustomer;
import com.asiainfo.cmc.qudao.enties.CusChanPortray;
import com.asiainfo.cmc.qudao.enties.HallBrndTttt;
import com.asiainfo.cmc.qudao.vo.BrndCoverVo;

/**
 * 厅店维度 各覆盖程度中厅店类型
 */
public interface IHallBrndTtttService {

	/**
	 * 根据地市、品牌、月份、类型(新增、存量),列出各覆盖程度中厅店类型
	 */
	public List<HallBrndTttt> getHallBrndTttt(BrndCoverVo vo);
	public List<HallBrndTttt> getHallBrndTttt1(BrndCoverVo vo);
	public List<Map<String,Object>> getMapHallBrndTttt(BrndCoverVo vo);
	
	/**
	 * 根据地市、品牌、类型(新增、存量)、基础类型(覆盖程度、厅店类型)，查到连续月份的基站总数
	 */
	public Map<String,String> listCntANdNumByMons(BrndCoverVo vo);
	public Map<String,String> listCntANdNumByMons1(BrndCoverVo vo);
	/**
	 * 获取品牌列表
	 */
	public List<String> listBrand(BrndCoverVo vo);
	
	 /**
     * 获取各覆盖程度中门店类型占比表中所有字段
     */
    public List<CusChanPortray> listPortrayFieldInHallBrandTttt();
    
    /**
     * 连续查询品牌覆盖情况
     * @param vo
     * @return
     */
    
    public List<String> listCoverBrand(String startMonth,String endMonth,String brandname,String areaname);
	
}

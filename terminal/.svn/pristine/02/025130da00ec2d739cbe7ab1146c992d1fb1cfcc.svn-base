package com.asiainfo.cmc.qudao.mapper;

import java.util.List;
import java.util.Map;

import com.asiainfo.cmc.qudao.vo.QudaoVo;

/**
 * 基站渠道月
 */
public interface ZdResultCellQudaoMMapper {
	
	/**
	 *  获取指定条件下所有的基站
	 */
	public List<QudaoVo> listCellQudao(QudaoVo vo);
	
	/**
	 * 根据月份集合获取指定字段的值 
	 * sum group by stat_month 因为条件可能品牌、品牌门店、品牌门店机型
	 */
	public List<Map<String,Object>> listFieldByMonths(QudaoVo vo);	
	
	/**
	 * 根据月份获取指定字段的值
	 * sum group by stat_month 因为条件可能品牌、品牌门店、品牌门店机型
	 */
	public Map<String,Object> getFieldByMonth(QudaoVo vo);
	
    /**
     * 获取所有品牌
     */
    public List<String> listBrand(QudaoVo vo);
    
    /**
     * 获取某品牌下的所有门店
     */
    public List<QudaoVo> listSpecByBrand(QudaoVo vo);

}

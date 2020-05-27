package com.asiainfo.cmc.qudao.mapper;

import java.util.List;
import java.util.Map;

import com.asiainfo.cmc.qudao.enties.ZdResultHallQudaoM;
import com.asiainfo.cmc.qudao.vo.QudaoVo;

/**
 * 厅店渠道月
 */
public interface ZdResultHallQudaoMMapper {
	
	/**
	 *  获取所有的厅店，指定品牌下、或者指定品牌和型号
	 */
	public List<QudaoVo> listHallQudao(QudaoVo vo);
	
	/**
	 * 根据月份集合获取指定字段的值集合
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
    
    
	 /**
     * 获取每一条厅店渠道,根据画像表中厅店渠道的id转的name，和日期、地市、品牌、机型、门店
     */
    List<ZdResultHallQudaoM> listAllTtemHallQudaoByPortIds(QudaoVo vo);
}

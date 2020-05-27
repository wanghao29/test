package com.asiainfo.cmc.qudao.service;

import java.util.List;
import com.asiainfo.cmc.qudao.enties.CusChanPortray;
import com.asiainfo.cmc.qudao.enties.ZdResultHallQudaoM;
import com.asiainfo.cmc.qudao.vo.QudaoVo;

/**
 * 厅店渠道月
 */
public interface IZdResultHallQudaoMService {
	
	/**
	 *  获取所有的厅店，指定品牌下、或者指定品牌和型号
	 */
	public List<QudaoVo> listHallQudao(QudaoVo vo);
    
    /**
     * 获取所有品牌
     */
    public List<String> listBrand(QudaoVo vo);
    
    /**
     * 获取某品牌下的所有门店
     */
    public List<QudaoVo> listSpecByBrand(QudaoVo vo);
	
	 /**
    * 获取渠道门店表中所有字段
    */
   public List<CusChanPortray> listPortrayFieldInHallQudao();
	
	 /**
    * 获取厅店渠道画像列表信息,根据ids;ids为空时选取choose=1的
    */
   public List<CusChanPortray> listHallQudaoByIds(QudaoVo vo);
   
   
	 /**
    * 获取厅店渠道,根据画像表中厅店渠道的id转的name，和日期、地市、品牌、机型、门店
    */
	public List<ZdResultHallQudaoM> listAllTtemHallQudaoByPortIds(QudaoVo vo);
}

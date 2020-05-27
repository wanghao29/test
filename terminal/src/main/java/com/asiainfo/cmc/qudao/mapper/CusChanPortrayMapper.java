package com.asiainfo.cmc.qudao.mapper;

import java.util.List;

import com.asiainfo.cmc.qudao.enties.CusChanPortray;
import com.asiainfo.cmc.qudao.vo.IdentifyInfoVo;

 
public interface CusChanPortrayMapper  {    
    //根据相关表中的画像信息，用作查询条件展示
    
	 /**
     * 获取渠道客商列表所有可以展示画像的字段（不包含show_type=0、1）
     */
    public List<CusChanPortray> listPortrayFieldInCusChanl();
    public List<CusChanPortray> listPortrayFieldInHallPortrait();
    
	 /**
     * 获取渠道门店表中所有字段
     */
    public List<CusChanPortray> listPortrayFieldInHallQudao();
    
	 /**
     * 获取各覆盖程度中门店类型占比表中所有字段
     */
    public List<CusChanPortray> listPortrayFieldInHallBrandTttt();
	 /**
     * 获取各门店类型覆盖程度占比表中所有字段
     */
    public List<CusChanPortray> listPortrayFieldInHallBrandFfff();
	 /**
     * 获取各覆盖程度中基站类型占比表中所有字段
     */
    public List<CusChanPortray> listPortrayFieldInCellBrandTttt();
	 /**
     * 获取各基站类型覆盖程度占比表中所有字段
     */
    public List<CusChanPortray> listPortrayFieldInCellBrandFfff();
    
    
    //以下根据参数ids，获取画像信息
	
	 /**
     * 获取渠道客户画像列表信息,根据ids (并且包含show_type=1)
     */
    public List<CusChanPortray> listCustomerByIds(List<Integer> ids);
    /**
     * 获取渠道厅店画像列表信息,根据ids (并且包含show_type=1)
     */
    public List<CusChanPortray> listHallByIds(List<Integer> ids);
    
	 /**
     * 获取厅店渠道画像列表信息,根据ids
     */
    public List<CusChanPortray> listHallQudaoByIds(List<Integer> ids);
    
	 /**
     * 获取基站渠道画像列表信息,根据ids
     */
    public List<CusChanPortray> listCellQudaoByIds(List<Integer> ids);
    
	 /**
     * 获取门店作战厂商画像列表信息,根据ids(不包含show_type=1)
     */
    public List<CusChanPortray> listCusStoreBattleByIds(List<Integer> ids);
    
	 /**
     * 获取门店作战厅店画像列表信息,根据ids
     */
    public List<CusChanPortray> listHallStoreBattleByIds(List<Integer> ids);
    
	 /**
     * 获取厅店特征信息画像列表信息,根据ids
     */
    public List<CusChanPortray> listHallIdentifyInfoByIds(IdentifyInfoVo vo);
    
	 /**
     * 获取客商特征信息画像列表信息,根据ids
     */
    public List<CusChanPortray> listCustomerIdentifyInfoByIds(IdentifyInfoVo vo);
    
    public List<CusChanPortray> listXfzzlBigData(List<Integer> ids);
    public List<CusChanPortray> listZdtzzlBigData(List<Integer> ids);
    public List<CusChanPortray> listJlfxBigData(List<Integer> ids);

	
    
}

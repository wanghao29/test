package com.asiainfo.cmc.mapper.brandmodel;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.asiainfo.cmc.enties.brandmodel.BrandEnty;

public interface BrandEntyMapper {

	

	//查询手机品牌
	List <String> selectBrand(); 

	//查询手机型号
	List <String> selectModel(BrandEnty bety);
	//查询手机品牌
	List <String> selectOtherBrand(); 

	//查询手机型号
	List <String> selectOtherModel(BrandEnty bety);

	/**
	 * 根据价格查询出对应的品牌和机型
	 * @param price
	 * @param price1
	 * @return
	 */
	List <String> selectPrice(@Param(value = "avg_price") String price,@Param(value = "avg_price1") String price1);
	
	/**
	 * 根据品牌和机型查询出改手机的价格
	 * @param bety
	 * @return
	 */
	List<String> selectBrandAndModelPrice(BrandEnty bety);
	
	/**
	 * 根据品牌和价格区间来查询出型号
	 * @param price
	 * @param price1
	 * @param brand
	 * @return
	 */
	List<String> selectListModel(@Param(value = "avg_price") String price,@Param(value = "avg_price1") String price1,@Param(value = "term_brnd_nam")String term_brnd_nam);	

//*****************************************************BI
	/**
	 * 根据价格查询出对应的品牌和机型
	 * @param price
	 * @param price1
	 * @return
	 */
	List <String> selectPriceBI(@Param(value = "avg_price") String price,@Param(value = "avg_price1") String price1);
	
	/**
	 * 根据品牌和机型查询出改手机的价格
	 * @param bety
	 * @return
	 */
	List<String> selectBrandAndModelPriceBI(BrandEnty bety);
	
	/**
	 * 根据品牌和价格区间来查询出型号
	 * @param price
	 * @param price1
	 * @param brand
	 * @return
	 */
	List<String> selectListModelBI(@Param(value = "avg_price") String price,@Param(value = "avg_price1") String price1,@Param(value = "term_brnd_nam")String term_brnd_nam);


}

	
	


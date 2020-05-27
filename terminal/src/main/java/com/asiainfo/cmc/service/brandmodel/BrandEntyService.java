package com.asiainfo.cmc.service.brandmodel;

import java.util.List;

import com.asiainfo.cmc.enties.brandmodel.BrandEnty;

/**
 * 手机品牌和型号接口
 * @author Administrator
 *
 */
public interface BrandEntyService {

//查询手机品牌
List <String> selectBrand(); 

//查询手机型号
List <String> selectModel(BrandEnty bety);

//查询手机品牌
List <String> selectOtherBrand(); 

//查询手机型号
List <String> selectOtherModel(BrandEnty bety);


/**
 * 根据品牌的价格来查询出相同价格的手机和型号
 * @param price
 * @param price1
 * @return
 */
List <String> selectPrice(String price,String price1);

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
List<String> selectListModel(String price,String price1,String term_brnd_nam);


/*********************BI*****************************************/

/**
 * 根据品牌的价格来查询出相同价格的手机和型号
 * @param price
 * @param price1
 * @return
 */
List <String> selectPriceBI(String price,String price1);

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
List<String> selectListModelBI(String price,String price1,String term_brnd_nam);





}

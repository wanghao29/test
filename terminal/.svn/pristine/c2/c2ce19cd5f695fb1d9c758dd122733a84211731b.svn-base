package com.asiainfo.cmc.mapper.brandmodel;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.asiainfo.cmc.enties.brandmodel.ProductInformation;

/**
 * 规划值信息设置接口
 * @author Administrator
 *
 */
public interface ProductInformationMapper {

	
	/**
	 * 增加信息
	 */

	int insertProductInformation(ProductInformation pt);

	/**
	 * 更新信息
	 * @param pt
	 * @return
	 */
	int updateProductInformation(ProductInformation pt);

	/**
	 * 查询所有的信息
	 */

	List<ProductInformation> selectAllProductInformation();
	/**
	 *  根据品牌和型号查询出相应的信息
	 */

	List<ProductInformation> selectProductInformations(@Param("BRANDNAME") String BRANDNAME,@Param("SPEC") String SPEC);
}

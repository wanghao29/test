package com.asiainfo.cmc.mapper.brandmodel;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.asiainfo.cmc.enties.brandmodel.ProductInformationSetMajor;
/**
 * 产品设置主表
 * @author Administrator
 *ZD_RESULT_OPER_PRODUCT_ALL_INFO 
 *规划主表
 */

public interface ProductInformationSetMajorMapper {

	 /**
     * 开始时间
     */
	  
	String selectStart();
	
	
	/**
	 * 结束时间
	 */
	
	String selectEnd();
	

		/**
		 * 根据查询主表所有数据
		 */
		
	   List <ProductInformationSetMajor> selectListEntry(@Param(value = "start") String start,@Param(value = "end") String end);

		/**
		 * 查询出当前时间距离开始销量时间的时间差
		 */

	   int selectTimeRange(@Param(value = "BRANDNAME") String brand,@Param(value = "SPEC") String spec);

	     /**
	      * 根据品牌型号和所属周期进行更新操作
	      */
	   int updateDate(@Param(value = "BRANDNAME") String brand,@Param(value = "SPEC") String spec,@Param(value = "RANGER") String ranger);
	
	   /**
	    * 更新一个对象
	    */
	  	
	  int updateToatal(ProductInformationSetMajor pm);
	
	  
	  /**
	   * 根据品牌和型号查询一个对象
	   */

	  ProductInformationSetMajor selectOnePm(@Param(value = "BRANDNAME") String brand,@Param(value = "SPEC") String spec); 
	  
	//对品牌型号执行增加操作
	  int  insertMajor(ProductInformationSetMajor pm);
	  
	//查询top数据

	  List <ProductInformationSetMajor> selectListTop10();
	  
	  //查询出一个top10中的品牌和型号
	  
	  ProductInformationSetMajor selectOneTop10 (ProductInformationSetMajor pm);
	  
	  //更新一个top10
	  int updateTop10(ProductInformationSetMajor pm);
	  
	  List <String> selectBrandTop10();
	  
	  //根据品牌查询出top10中的型号

	 List <String> selectModelTop10(ProductInformationSetMajor pm);
	  
	 ProductInformationSetMajor selectNewPM(@Param(value = "BRANDNAME") String brand,@Param(value = "SPEC") String spec); 
	  
}

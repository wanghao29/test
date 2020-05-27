package com.asiainfo.cmc.service.brandmodel;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.asiainfo.cmc.enties.brandmodel.LifeDate;
import com.asiainfo.cmc.enties.brandmodel.LifeDateS;



public interface LifeDateService {

	
	/*增加操作*/
	int insertLifeDate (LifeDate LD);
	
	 //根据月份查询出记录
		List<LifeDate> selectLifeDate(LifeDate LD);
	
	//根据品牌和型号进行更新操作
	
	int updateLifeDate(LifeDate LD);
	//根据品牌和型号查询出相应的数据
	
	List <LifeDateS> selectBrandAndSpec(String brand,String spec);
	List <LifeDate> selectBrandAndSpecS(String brand,String spec);
	
	//根据品牌型号和生命周期进行查询
	/**
	 * 根据品牌型号和生命周期进行查询
	 * @param brand
	 * @param spec
	 * @param CYCLE
	 * @return
	 */
	LifeDate selectAddAndUpdate(String brand,String spec,String CYCLE);
	/**
	 * 查询销量等信息进行汇总
	 */

	LifeDate selectTotal(String brand,String spec);
	
	
	List<LifeDate> selectAllLife( String brand,String spec);
	
	
	
	
	
	
	
	
}

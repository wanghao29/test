package com.asiainfo.cmc.mapper.brandmodel;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.asiainfo.cmc.enties.brandmodel.AbsoluteRange;
import com.asiainfo.cmc.enties.brandmodel.CityDate;
import com.asiainfo.cmc.enties.brandmodel.CityDateS;
import com.asiainfo.cmc.enties.brandmodel.OverCustomer;

public interface CityDateMapper {

	/*增加操作*/
	int insertCityDate (CityDate CT);
	
	//根据月份查询出记录
	List<CityDateS> selectCityDate(CityDateS CT);
	
	//根据品牌和型号更新数据
	int updateCityDate(CityDate CT);
	//根据品牌和型号更新销量数据
	int updateCityDateAmountXL(CityDate CT);
	
	//根据品牌和型号更新数据
	int updateCityDateIncome(CityDate CT);
	//根据品牌和型号更新数据
		int updateCityDateOver(CityDate CT);
	
	//根据品牌和型号查询出数据

	CityDate selectCiteDate(@Param(value = "BRANDNAME") String brand,@Param(value = "SPEC") String spec,@Param(value = "AREANAME") String city);
	
	// 根据品牌，型号，和地区来增加一个数据
	
		//int insertCityDateNew(@Param(value = "BRANDNAME") String brand,@Param(value = "SPEC") String spec,@Param(value = "AREANAME") String city );
	    int insertCityDateNew(CityDate cityDate);
	
	  //根据品牌和型号查询出相应的销量，收入
	  List<AbsoluteRange> selectCityDateAmountAndIncome(AbsoluteRange CT);
	
		//根据品牌和型号查询出客户覆盖的数   OverCustomer
		List<OverCustomer> selectCityDateAmountAndIncomeKH(OverCustomer ct);
	
	
}

package com.asiainfo.cmc.service.brandmodel;


import java.util.List;

import com.asiainfo.cmc.enties.brandmodel.AbsoluteRange;
import com.asiainfo.cmc.enties.brandmodel.CityDate;
import com.asiainfo.cmc.enties.brandmodel.CityDateS;
import com.asiainfo.cmc.enties.brandmodel.OverCustomer;

public interface CityDateService {

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

	CityDate selectCiteDate(String brand,String spec,String city);
	
	// 根据品牌，型号，和地区来增加一个数据
	
	//int insertCityDateNew(String brand,String spec,String city );
    //增加销量的方法
	int insertCityDateNew(CityDate cityDate);
	
	//根据品牌和型号查询出相应的销量，收入
	List<AbsoluteRange> selectCityDateAmountAndIncome(AbsoluteRange ct);
	//根据品牌和型号查询出客户覆盖的数   OverCustomer
	List<OverCustomer> selectCityDateAmountAndIncomeKH(OverCustomer ct);
	
}

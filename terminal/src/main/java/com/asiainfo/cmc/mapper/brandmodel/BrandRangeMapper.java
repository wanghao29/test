package com.asiainfo.cmc.mapper.brandmodel;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


import com.asiainfo.cmc.enties.brandmodel.BrandRange;
@Repository
public interface BrandRangeMapper {
	/*增加操作*/
	
	public int insertBrandRange (BrandRange br);

	//根据月份查询出记录
	List<BrandRange> selectBrandRanges(@Param(value = "month") int month,@Param(value = "month2") int month2);
	
	//根据月份查询出记录
	List<BrandRange> selectBrandRanges2(@Param(value = "month") int month,@Param(value = "month2") int month2);
	
	List<BrandRange> selectBrandPriceNew(@Param(value = "month") int month);
}

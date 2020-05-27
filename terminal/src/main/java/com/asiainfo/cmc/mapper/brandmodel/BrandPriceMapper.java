package com.asiainfo.cmc.mapper.brandmodel;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.brandmodel.BrandPrice;

@Repository
public interface BrandPriceMapper {

	
	
	
	    /*增加操作*/
	    @Transactional
		public int insertBrandPrice (BrandPrice bp);

		//根据月份查询出记录
		
	    List<BrandPrice> selectBrandPriceNew(@Param(value = "month") int month);
	    List<BrandPrice> selectBrandPrice(@Param(value = "month") int month,@Param(value = "month2") int month2);
	}

	
	


package com.asiainfo.cmc.mapper.brandmodel;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.asiainfo.cmc.enties.brandmodel.FiveLine;
import com.asiainfo.cmc.enties.brandmodel.FiveLineS;

public interface FiveLineMapper {

	
	/*增加操作*/
	int insertFiveLine (FiveLine FL);
	
	//根据月份查询出记录
	List <FiveLineS> selectFiveLine(@Param(value = "BRANDNAME") String brand,@Param(value = "SPEC") String spec);
	 //更新数据的操作
		
	int updateFiveLine(FiveLine FL);
	//根据品牌和型号查询出数据
	
	List <FiveLine> selectFiveandLine(@Param(value = "BRANDNAME") String brand,@Param(value = "SPEC") String spec);

	/**
	 * 根据五线七口 查询数据
	 * @param brand
	 * @param spec
	 * @param lineName
	 * @param portName
	 * @return
	 */
	
	
	FiveLine selectFine(@Param(value = "BRANDNAME") String brand,@Param(value = "SPEC") String spec,
			@Param(value = "LINENAME") String lineName,@Param(value = "PORTNAME") String portName);


}

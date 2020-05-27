package com.asiainfo.cmc.mapper.brandmodel;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.asiainfo.cmc.enties.brandmodel.LifeDate;
import com.asiainfo.cmc.enties.brandmodel.LifeDateS;
import com.asiainfo.cmc.enties.brandmodel.NewDate;

public interface LifeDateMapper {

	
	
	/*增加操作*/
	int insertLifeDate (LifeDate LD);
	
	//根据月份查询出记录
		List<LifeDate> selectLifeDate(LifeDate LD);
	
		//根据品牌和型号进行更新操作
		
		int updateLifeDate(LifeDate LD);
	
		//根据品牌和型号查询出相应的数据
		
		List <LifeDateS> selectBrandAndSpec(@Param(value = "BRANDNAME") String brand,@Param(value = "SPEC") String spec);
		List <LifeDate> selectBrandAndSpecS(@Param(value = "BRANDNAME") String brand,@Param(value = "SPEC") String spec);
		/**
		 * 根据品牌型号和生命周期进行查询
		 * @param brand
		 * @param spec
		 * @param CYCLE
		 * @return
		 */
		LifeDate selectAddAndUpdate(
				@Param(value = "BRANDNAME") String brand,
				@Param(value = "SPEC")String spec,
				@Param(value = "CYCLE") String CYCLE);
		
		/**
		 * 查询销量等信息进行汇总
		 */

		LifeDate selectTotal(@Param(value = "BRANDNAME") String brand,@Param(value = "SPEC") String spec);	
		
		/**
		 * 根据品牌型号和生命周期进行查询
		 * @param brand
		 * @param spec
		 * @param CYCLE
		 * @return
		 */
		List<LifeDate> selectAllLife(
				@Param(value = "BRANDNAME") String brand,
				@Param(value = "SPEC")String spec);
			
		
	/**
	 * 查询开始时间	
	 */
@Select("SELECT MIN(DODATE) DODATE FROM ZD_RESULT_OPER_LSLJ_AREA_D WHERE BRANDNAME=#{BRANDNAME} and SPEC=#{SPEC}")		
String startTime(@Param(value = "BRANDNAME") String brand,
		@Param(value = "SPEC")String spec);	
		
/**
 * 取量的值		
 * @param brand
 * @param spec
 * @param COMPETBRANDNAME1
 * @param COMPETSPEC1
 * @param COMPETBRANDNAME2
 * @param COMPETSPEC2
 * @param time
 * @param startTime
 * @param endTime
 * @return
 */
NewDate showAllNewDate(@Param(value = "brand") String brand, 
		@Param(value = "spec") String spec, 
		@Param(value = "COMPETBRANDNAME1") String COMPETBRANDNAME1, 
		@Param(value = "COMPETSPEC1") String COMPETSPEC1,
		@Param(value = "COMPETBRANDNAME2") String COMPETBRANDNAME2, 
		@Param(value = "COMPETSPEC2") String COMPETSPEC2,
		@Param(value = "time") String time,
		@Param(value = "startTime") String startTime,
		@Param(value = "endTime") String endTime);
/**
 * 取利润的值
 * @param brand
 * @param spec
 * @param COMPETBRANDNAME1
 * @param COMPETSPEC1
 * @param COMPETBRANDNAME2
 * @param COMPETSPEC2
 * @param time
 * @param startTime
 * @param endTime
 * @return
 */
NewDate showProfit(@Param(value = "brand") String brand, 
		@Param(value = "spec") String spec, 
		@Param(value = "COMPETBRANDNAME1") String COMPETBRANDNAME1, 
		@Param(value = "COMPETSPEC1") String COMPETSPEC1,
		@Param(value = "COMPETBRANDNAME2") String COMPETBRANDNAME2, 
		@Param(value = "COMPETSPEC2") String COMPETSPEC2,
		@Param(value = "time") String time,
		@Param(value = "startTime") String startTime,
		@Param(value = "endTime") String endTime);	
		
/**
 * 取价钱的值
 */
NewDate showPrice(@Param(value = "brand") String brand, 
		@Param(value = "spec") String spec, 
		@Param(value = "COMPETBRANDNAME1") String COMPETBRANDNAME1, 
		@Param(value = "COMPETSPEC1") String COMPETSPEC1,
		@Param(value = "COMPETBRANDNAME2") String COMPETBRANDNAME2, 
		@Param(value = "COMPETSPEC2") String COMPETSPEC2,
		@Param(value = "time") String time,
		@Param(value = "startTime") String startTime,
		@Param(value = "endTime") String endTime);	


/**
 * 取覆的值
 */
NewDate showCover(@Param(value = "brand") String brand, 
		@Param(value = "spec") String spec, 
		@Param(value = "COMPETBRANDNAME1") String COMPETBRANDNAME1, 
		@Param(value = "COMPETSPEC1") String COMPETSPEC1,
		@Param(value = "COMPETBRANDNAME2") String COMPETBRANDNAME2, 
		@Param(value = "COMPETSPEC2") String COMPETSPEC2,
		@Param(value = "time") String time,
		@Param(value = "startTime") String startTime,
		@Param(value = "endTime") String endTime);	

/**
 * 取秩的值
 */

NewDate showOrder(@Param(value = "brand") String brand, 
		@Param(value = "spec") String spec, 
		@Param(value = "COMPETBRANDNAME1") String COMPETBRANDNAME1, 
		@Param(value = "COMPETSPEC1") String COMPETSPEC1,
		@Param(value = "COMPETBRANDNAME2") String COMPETBRANDNAME2, 
		@Param(value = "COMPETSPEC2") String COMPETSPEC2,
		@Param(value = "time") String time,
		@Param(value = "startTime") String startTime,
		@Param(value = "endTime") String endTime);	

/**
 * 取收的值
 */

NewDate showIncome(@Param(value = "brand") String brand, 
		@Param(value = "spec") String spec, 
		@Param(value = "COMPETBRANDNAME1") String COMPETBRANDNAME1, 
		@Param(value = "COMPETSPEC1") String COMPETSPEC1,
		@Param(value = "COMPETBRANDNAME2") String COMPETBRANDNAME2, 
		@Param(value = "COMPETSPEC2") String COMPETSPEC2,
		@Param(value = "time") String time,
		@Param(value = "startTime") String startTime,
		@Param(value = "endTime") String endTime);	

/**
 * 取份的值		
 */

NewDate showShare(@Param(value = "brand") String brand, 
		@Param(value = "spec") String spec, 
		@Param(value = "COMPETBRANDNAME1") String COMPETBRANDNAME1, 
		@Param(value = "COMPETSPEC1") String COMPETSPEC1,
		@Param(value = "COMPETBRANDNAME2") String COMPETBRANDNAME2, 
		@Param(value = "COMPETSPEC2") String COMPETSPEC2,
		@Param(value = "time") String time,
		@Param(value = "startTime") String startTime,
		@Param(value = "endTime") String endTime);	


/**
 * 取库的值
 */

NewDate showStock(@Param(value = "brand") String brand, 
		@Param(value = "spec") String spec, 
		@Param(value = "COMPETBRANDNAME1") String COMPETBRANDNAME1, 
		@Param(value = "COMPETSPEC1") String COMPETSPEC1,
		@Param(value = "COMPETBRANDNAME2") String COMPETBRANDNAME2, 
		@Param(value = "COMPETSPEC2") String COMPETSPEC2,
		@Param(value = "time") String time,
		@Param(value = "startTime") String startTime,
		@Param(value = "endTime") String endTime);	


}

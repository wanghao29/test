package com.asiainfo.cmc.mapper.brandmodel;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.asiainfo.cmc.enties.brandmodel.AbsoluteLine;
import com.asiainfo.cmc.enties.brandmodel.AbsoluteRange;
import com.asiainfo.cmc.enties.brandmodel.DoublePrice;
import com.asiainfo.cmc.enties.brandmodel.ImportantProduct;
import com.asiainfo.cmc.enties.brandmodel.LifeDate;
import com.asiainfo.cmc.enties.brandmodel.OderZhi;
import com.asiainfo.cmc.enties.brandmodel.OverCustomer;
import com.asiainfo.cmc.enties.brandmodel.ShareFen;
import com.asiainfo.cmc.enties.brandmodel.StockSet;

public interface AbsoluteRangeMapper {

	
	/**
	 * 量
	 */

	//当前销量-------根据日指标来查询数据，查询出所选开始时间到结束时间每天的销量（时间格式是YYYY-MM-DD）

	List <AbsoluteRange> selectEveryDay(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);
		
	//当前销量-------根据月指标来查询数据，查询出所选开始时间到所选结束时间每个月的销量（时间格式是YYYY-MM）

	List <AbsoluteRange> selectEveryMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//规划销量--------先算出选择的开始时间和实际产品开始销售的时间相差多少天（时间格式是YYYY-MM-DD）

	int selectHowDay(@Param(value = "DODATE") String start,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	////规划销量--------用户所选时间段相差多少天， 算出所选择的开始时间和所选择的结束时间相差了多少天（时间格式是YYYY-MM-DD）

	int selectHowDays(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end);

	//判断产品的生命周期 ,查询表ZD_RESULT_OPER_PRODUCT_CYCLE_INFO，所属周期和持续时间字段进行查询  

	List<LifeDate> selectBrandLife(@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);


	//月规划销量计算      算出选择的开始月份，与当前产品开始销售月份之间相差多少个月
	int selectMonthRange(@Param(value = "DODATE") String start,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);


	//结束月份和开始月份相差几个月

	int selectMonthDiffer(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end);

	/**
	 * 
	 * 对标品销量
	 * 
	 */

	//日指标取数语句如下，sum(AMOUNT) 即为对应销量值：（日期格式：yyyy-mm-dd 例：2018-06-01）

	List <AbsoluteRange> selectDayDate(@Param(value = "DODATE") String start,
			@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") 
	String BRANDNAME,@Param(value = "SPEC") String SPEC,@Param(value = "BRANDNAME2") 
	String brand1,@Param(value = "SPEC2") String model1);

	//月指标取数    （例2018-06）

	List <AbsoluteRange> selectMonthDate(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC,@Param(value = "BRANDNAME2") String brand1,@Param(value = "SPEC2") String model1);


	/**
	 * 竞品销量
	 * 
	 */

	//日指标取数语句如下，sum(AMOUNT) 即为对应销量值：（日期格式：yyyy-mm-dd 例：2018-06-01）

	List <AbsoluteRange> selectDayDate1(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC,@Param(value = "BRANDNAME1") String brand1,@Param(value = "SPEC1") String model1);

	//月指标取数    （例2018-06）

	List <AbsoluteRange> selectMonthDate1(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC,@Param(value = "BRANDNAME1") String brand1,@Param(value = "SPEC1") String model1);


	/**
	 * 五线七口销量
	 */

	//日指标取数语句如下，sum(AMOUNT) 即为对应销量值：（日期格式：yyyy-mm-dd 例：2018-06-01）

	List <AbsoluteLine> selectFiveDate(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//月指标取数语句如下，sum(AMOUNT) 即为对应销量值：（月份格式：yyyy-mm 例：2018-06）

	List <AbsoluteLine> selectFiveMonthDate(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);


	/**
	 * 地市销量
	 */
	//日指标取数语句如下，sum(AMOUNT) 即为对应销量值：（日期格式：yyyy-mm-dd 例：2018-06-01）

	List <AbsoluteRange> selectAreaDay(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	
	//月指标取数语句如下，sum(AMOUNT) 即为对应销量值：（月份格式：yyyy-mm 例：2018-06）
	List <AbsoluteRange> selectAreaMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);


	/**
	 * 销量趋势
	 */
	//日指标取数语句如下，sum(AMOUNT) 即为对应销量值：（日期格式：yyyy-mm-dd 例：2018-06-01）   当前所选时间销量：

	List <AbsoluteRange> selectSayDay(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//日指标取数语句如下,去年同期销量：

	List <AbsoluteRange> selectSayDay1(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//月指标取数语句如下，sum(AMOUNT) 即为对应销量值：（月份格式：yyyy-mm 例：2018-06）当前所选时间销量：


	List <AbsoluteRange> selectSayMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//月指标取数语句如下，去年同期销量：
	List <AbsoluteRange> selectSayMonth1(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);


	/**
	 * 重点产品达成率           咨询KPI那边的取数逻辑
	 */


	/**
	 * 收
	 */

	//当前收入       日指标取数语句如下，sum(AMOUNTPRICE) 即为对应收入值：（日期格式：yyyy-mm-dd 例：2018-06-01）

	List <AbsoluteRange> selectIncomeDay(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//当前收入        月指标取数语句如下，sum(AMOUNTPRICE) 即为对应收入值：（月份格式：yyyy-mm 例：2018-06）

	List <AbsoluteRange> selectIncomeMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//规划收入  日指标取数语句如下：（日期格式：yyyy-mm-dd 例：2018-06-01）首先，算出选择的开始日期，与当前产品开始销售日期之间相差多少天

	String selectSerachDay(@Param(value = "DODATE") String start,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);


	/*调用selectHowDays接口来实现*/

	// 规划收入   从生命周期规划信息从表ZD_RESULT_OPER_PRODUCT_CYCLE_INFO中，通过所属周期CYCLE字段和持续周数DURATION字段，判断当前产品

	/*调用selectBrandLife接口来实现*/

	// 规划收入 月指标取数据   首先，算出选择的开始月份，与当前产品开始销售月份之间相差多少个月

	/*调用selectMonthRange接口来实现*/

	// 规划收入   算出选择的结束月份，与开始月份之间相差多少个月

	/*调用selectMonthDiffer接口来实现*/


	/**
	 * 对标品收入
	 */

	//日指标取数     sum(AMOUNTPRICE) 即为对应收入值：（日期格式：yyyy-mm-dd 例：2018-06-01）
	List <AbsoluteRange> selectIncomeDays(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC,@Param(value = "BRANDNAME2") String brand1,@Param(value = "SPEC2") String model1);

	//月指标取数语句如下，sum(AMOUNTPRICE) 即为对应收入值：（月份格式：yyyy-mm 例：2018-06）
	List <AbsoluteRange> selectIncomeMonths(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC,@Param(value = "BRANDNAME2") String brand1,@Param(value = "SPEC2") String model1);


	/**
	 * 竞品收入
	 */
	//日指标取数据  sum(AMOUNTPRICE) 即为对应收入值：（日期格式：yyyy-mm-dd 例：2018-06-01）
	List <AbsoluteRange> selectComeDays(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC,@Param(value = "BRANDNAME1") String brand2,@Param(value = "SPEC1") String model2);

	//月指标取数语句如下，sum(AMOUNTPRICE) 即为对应收入值：（月份格式：yyyy-mm 例：2018-06）
	List <AbsoluteRange> selectComeMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC,@Param(value = "BRANDNAME1") String brand1,@Param(value = "SPEC1") String model1);

	/**五线七口收入
	 * 
	 */

	//日指标取数语句如下，sum(AMOUNTPRICE) 即为对应收入值：（日期格式：yyyy-mm-dd 例：2018-06-01） 表ZD_RESULT_OPER_LSLJ_LINE_D

	List <AbsoluteLine> selectFive(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//月指标取数语句如下，sum(AMOUNTPRICE) 即为对应收入值：（月份格式：yyyy-mm 例：2018-06）表ZD_RESULT_OPER_LSLJ_LINE_D
	List <AbsoluteLine> selectFiveMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);


	/**
	 * 地市收入
	 */
	//日指标取数语句如下，sum(AMOUNTPRICE) 即为对应收入值：（日期格式：yyyy-mm-dd 例：2018-06-01） 表ZD_RESULT_OPER_LSLJ_AREA_D
	List <AbsoluteRange> selectAreaFiveDay(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//月指标取数语句如下，sum(AMOUNTPRICE) 即为对应收入值：（月份格式：yyyy-mm 例：2018-06） 表ZD_RESULT_OPER_LSLJ_AREA_D
	List <AbsoluteRange> selectAreaFiveMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);


	/**
	 * 收入趋势
	 */
	//日指标取数语句如下，sum(AMOUNTPRICE) 即为对应收入值：（日期格式：yyyy-mm-dd 例：2018-06-01）表ZD_RESULT_OPER_LSLJ_AREA_D
		//当前所选时间收入
	List <AbsoluteRange> selectIncomes(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//去年同期收入
	List <AbsoluteRange> selectIncomeDayed(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//月指标取数语句如下，sum(AMOUNTPRICE) 即为对应收入值：（月份格式：yyyy-mm 例：2018-06）表ZD_RESULT_OPER_LSLJ_AREA_D
		//当前所选时间收入
	List <AbsoluteRange> selectIncomeMonthed(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//去年同期收入

	List <AbsoluteRange> selectIncomeMonthes(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);


	/**
	 * 利
	 */
	//当前利润   日指标取数语句如下，sum(SALECOSTPRICE) 即为对应利润值：（日期格式：yyyy-mm-dd 例：2018-06-01）表ZD_RESULT_OPER_LSLJ_AREA_D

	List <AbsoluteRange> selectProfitDay(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//月指标取数语句如下，sum(SALECOSTPRICE) 即为对应利润值：（月份格式：yyyy-mm 例：2018-06）

	List <AbsoluteRange> selectProfitMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//规划利润         日指标取数语句如下：（日期格式：yyyy-mm-dd 例：2018-06-01）表ZD_RESULT_OPER_LSLJ_AREA_D
		//首先，算出选择的开始日期，与当前产品开始销售日期之间相差多少天

		/*调用selectSerachDay接口来实现*/

		//算出选择的结束日期，与开始日期之间相差多少天

		/*调用selectHowDays接口来实现*/
	
	
	//从生命周期规划信息从表ZD_RESULT_OPER_PRODUCT_CYCLE_INFO中，通过所属周期CYCLE字段和持续周数DURATION字段，判断当前产品

		/*调用selectBrandLife接口来实现*/

		//月指标取数语句如下：（月份格式：yyyy-mm 例：2018-06）首先，算出选择的开始月份，与当前产品开始销售月份之间相差多少个月

		/*调用selectMonthRange接口来实现*/

		//算出选择的结束月份，与开始月份之间相差多少个月

		/*调用selectMonthDiffer接口来实现*/

		//对标品利润   日指标取数语句如下，sum(SALECOSTPRICE) 即为对应利润值：（日期格式：yyyy-mm-dd 例：2018-06-01）表ZD_RESULT_OPER_LSLJ_AREA_D
	
	List <AbsoluteRange> selectProductProfitDay(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC,@Param(value = "BRANDNAME2") String brand1,@Param(value = "SPEC2") String model1);

	//月指标取数语句如下，sum(SALECOSTPRICE) 即为对应利润值：（月份格式：yyyy-mm 例：2018-06）

	List <AbsoluteRange> selectProductProfitMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC,@Param(value = "BRANDNAME2") String brand1,@Param(value = "SPEC2") String model1);

	//竞品利润  日指标取数语句如下，sum(SALECOSTPRICE) 即为对应利润值：（日期格式：yyyy-mm-dd 例：2018-06-01）表ZD_RESULT_OPER_LSLJ_AREA_D

	List <AbsoluteRange> selectCompetitiveProductDay(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC,@Param(value = "BRANDNAME1") String brand2,@Param(value = "SPEC1") String model2);

	//月指标取数语句如下，sum(SALECOSTPRICE) 即为对应利润值：（月份格式：yyyy-mm 例：2018-06）
	List <AbsoluteRange> selectCompetitiveProductMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC,@Param(value = "BRANDNAME1") String brand2,@Param(value = "SPEC1") String model2);

	//五线七口利润    日指标取数语句如下，sum(SALECOSTPRICE) 即为对应利润值：（日期格式：yyyy-mm-dd) ZD_RESULT_OPER_LSLJ_LINE_D

	List <AbsoluteLine> selectProfitDays(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//月指标取数语句如下，sum(SALECOSTPRICE) 即为对应利润值：（月份格式：yyyy-mm 例：2018-06）
	
	List <AbsoluteLine> selectProfitMonths(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//地市利润     日指标取数语句如下，sum(SALECOSTPRICE) 即为对应利润值：（日期格式：yyyy-mm-dd 例：2018-06-01）表 ZD_RESULT_OPER_LSLJ_AREA_D

	List <AbsoluteRange> selectCityDay(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);
	 
	//月指标取数语句如下，sum(SALECOSTPRICE) 即为对应利润值：（月份格式：yyyy-mm 例：2018-06）
	
	List <AbsoluteRange> selectCityMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//利润趋势   日指标取数语句如下，sum(SALECOSTPRICE) 即为对应利润值：（日期格式：yyyy-mm-dd 例：2018-06-01）表 ZD_RESULT_OPER_LSLJ_AREA_D
		//当前所选时间利润：

	List <AbsoluteRange> selectTrendDay(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//去年同期利润：

	List <AbsoluteRange> selectLastYearTrendDays(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//月指标取数语句如下，sum(SALECOSTPRICE) 即为对应利润值：（月份格式：yyyy-mm 例：2018-06）

		//当前所选时间利润

	List <AbsoluteRange> selectTrendMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//去年同期利润：

	List <AbsoluteRange> selectLastYearTrendMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);


	/**
	 * 价
	 */

	//本品价格  
	//日指标取数语句如下，avg(SALEPRICE) 即为对应价格值：（日期格式：yyyy-mm-dd 例：2018-06-01）表 ZD_RESULT_OPER_LSLJ_AREA_D
	
	List <AbsoluteRange> selectPriceDay(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//月指标取数语句如下，avg(SALEPRICE) 即为对应价格值：（月份格式：yyyy-mm 例：2018-06）

	List <AbsoluteRange> selectPriceMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//本品二级市场价格
		//日指标取数语句如下，OPENPRICE 即为对应价格值：（日期格式：yyyy-mm-dd 例：2018-06-01）表ZD_RESULT_OPER_OPEN_PRICE_FINAL_D

	List <DoublePrice> selectPriceDoubleDay(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//月指标取数语句如下，OPENPRICE 即为对应价格值：（月份格式：yyyy-mm 例：2018-06）

	List <DoublePrice> selectPriceDoubleMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//本品二级市场价格
		//日指标取数语句如下，OPENPRICE 即为对应价格值：（日期格式：yyyy-mm-dd 例：2018-06-01）表ZD_RESULT_OPER_OPEN_PRICE_FINAL_D

	List <DoublePrice> selectPriceDoubleCompetitive(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME1") String brand1,@Param(value = "SPEC1") String model1);

	//月指标取数语句如下，OPENPRICE 即为对应价格值：（月份格式：yyyy-mm 例：2018-06）

	List <DoublePrice> selectPriceDoubleCompetitiveMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME1") String brand1,@Param(value = "SPEC1") String model1);

	//竞品二级市场价格
		//日指标取数语句如下，OPENPRICE 即为对应价格值：（日期格式：yyyy-mm-dd 例：2018-06-01）表ZD_RESULT_OPER_OPEN_PRICE_FINAL_D

	List <AbsoluteRange> selectPriceDays(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//月指标取数语句如下，OPENPRICE 即为对应价格值：（月份格式：yyyy-mm 例：2018-06）

	List <AbsoluteRange> selectPriceMonths(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//地市价格
		//日指标取数语句如下，avg(SALEPRICE)即为对应价格值：（日期格式：yyyy-mm-dd 例：2018-06-01）表 ZD_RESULT_OPER_LSLJ_AREA_D
	
	List <AbsoluteRange> selectNowPrice(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//月指标取数语句如下，avg(SALEPRICE)即为对应价格值：（月份格式：yyyy-mm 例：2018-06）

	List <AbsoluteRange> selectLastYearPrice(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//价格趋势
		//当前所选时间利润：日指标取数语句如下，avg(SALEPRICE) 即为对应利润值：（日期格式：yyyy-mm-dd 例：2018-06-01）表 ZD_RESULT_OPER_LSLJ_AREA_D

	List <AbsoluteRange> selectNowPriceMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//去年同期利润：
	List <AbsoluteRange> selectLastYearPriceMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);



	/**
	 * 覆
	 */
	//累积覆盖客户数    日指标取数语句如下，count(1) 即为对应覆盖客户数值：（日期格式：yyyy-mm-dd 例：2018-06-01）表ZD_RESULT_OPER_OVER_CUST_AREA_D

	List <OverCustomer> selectAccumulativeDay(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//月指标取数语句如下，count(1) 即为对应覆盖客户数值：（月份格式：yyyy-mm 例：2018-06）

	List <OverCustomer> selectAccumulativeMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//规划累积覆盖客户数
		//日指标取数语句如下：（日期格式：yyyy-mm-dd 例：2018-06-01）  首先，算出选择的开始日期，与当前产品开始销售日期之间相差多少天

		/*调用selectSerachDay接口来实现*/

		//算出选择的结束日期，与开始日期之间相差多少天

		/*调用selectHowDays接口来实现*/

		//从生命周期规划信息从表ZD_RESULT_OPER_PRODUCT_CYCLE_INFO中，通过所属周期CYCLE字段和持续周数DURATION字段，判断当前产品

		/*调用selectBrandLife接口来实现*/

		//月指标取数语句如下：（月份格式：yyyy-mm 例：2018-06）首先，算出选择的开始月份，与当前产品开始销售月份之间相差多少个月

		/*调用selectMonthRange接口来实现*/

		//算出选择的结束月份，与开始月份之间相差多少个月

		/*调用selectMonthDiffer接口来实现*/

		/**
		 * 存
		 */
		//实际库存周转
		//日指标取数语句如下，sum(REAL_TIME_AMOUNT) 即为对应值：（日期格式：yyyy-mm-dd 例：2018-06-01）表ZD_RESULT_OPER_STOCK_AREA_D

	List <StockSet> selectDepositDay(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);
	/**
	 * 存取去年的数据来进行对比
	 * @param start
	 * @param end
	 * @param brand
	 * @param model
	 * @return
	 */
	List <StockSet> selectLastYear(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);
	//月指标取数语句如下，sum(REAL_TIME_AMOUNT) 即为对应值：（月份格式：yyyy-mm 例：2018-06）

	List <StockSet> selectDepositMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	/**
	 * 存月指标取去年同期的数据来对比
	 */
	List <StockSet> selectLastYearMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);	
	/**
	 * 存地市趋势取日指标数据
	 */
	List <StockSet> cunAreaDay(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	/**
	 * 存地市趋势取月指标数据
	 */
	List <StockSet> cunAreaMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);
	
	//规划库存周转
	//日指标取数语句如下：（日期格式：yyyy-mm-dd 例：2018-06-01）  首先，算出选择的开始日期，与当前产品开始销售日期之间相差多少天

	/*调用selectSerachDay接口来实现*/

	//算出选择的结束日期，与开始日期之间相差多少天

	/*调用selectHowDays接口来实现*/

	//从生命周期规划信息从表ZD_RESULT_OPER_PRODUCT_CYCLE_INFO中，通过所属周期CYCLE字段和持续周数DURATION字段，判断当前产品

	/*调用selectBrandLife接口来实现*/

	//月指标取数语句如下：（月份格式：yyyy-mm 例：2018-06）首先，算出选择的开始月份，与当前产品开始销售月份之间相差多少个月

	/*调用selectMonthRange接口来实现*/

	//算出选择的结束月份，与开始月份之间相差多少个月

	/*调用selectMonthDiffer接口来实现*/


	/**
	 * 份
	 */
	//当前份额   日指标取数语句如下，avg(PRO_SHARE) 即为对应值：（日期格式：yyyy-mm-dd 例：2018-06-01）表 ZD_RESULT_OPER_SHARE_AREA_D
	
	List <ShareFen> selectShareDay(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//月指标取数语句如下，avg(PRO_SHARE) 即为对应值：（月份格式：yyyy-mm 例：2018-06）

	List <ShareFen> selectShareMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//规划份额
		//日指标取数语句如下：（日期格式：yyyy-mm-dd 例：2018-06-01）  首先，算出选择的开始日期，与当前产品开始销售日期之间相差多少天

		/*调用selectSerachDay接口来实现*/

		//算出选择的结束日期，与开始日期之间相差多少天

		/*调用selectHowDays接口来实现*/

		//从生命周期规划信息从表ZD_RESULT_OPER_PRODUCT_CYCLE_INFO中，通过所属周期CYCLE字段和持续周数DURATION字段，判断当前产品

		/*调用selectBrandLife接口来实现*/

		//月指标取数语句如下：（月份格式：yyyy-mm 例：2018-06）首先，算出选择的开始月份，与当前产品开始销售月份之间相差多少个月

		/*调用selectMonthRange接口来实现*/

		//算出选择的结束月份，与开始月份之间相差多少个月

		/*调用selectMonthDiffer接口来实现*/


		/**
		 * 秩
		 */

		//DM本地激活率     
		//日指标取数语句如下，avg(LOCAL_RATIO) 即为对应值：（日期格式：yyyy-mm-dd 例：2018-06-01）表ZD_RESULT_OPER_ORDER_AREA_D

	List <OderZhi> selectLocalDay(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//月指标取数语句如下，avg(LOCAL_RATIO) 即为对应值：（月份格式：yyyy-mm 例：2018-06）

	List <OderZhi> selectLocalMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//DM异地激活率
		//日指标取数语句如下，avg(REMOTE_RATIO) 即为对应值：（日期格式：yyyy-mm-dd 例：2018-06-01）

	List <OderZhi> selectDifferentDay(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//月指标取数语句如下，avg(LOCAL_RATIO) 即为对应值：（月份格式：yyyy-mm 例：2018-06）

	List <OderZhi> selectDifferentMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//疑似套机率
		//日指标取数语句如下，avg(REMOTE_RATIO) 即为对应值：（日期格式：yyyy-mm-dd 例：2018-06-01）

	List <OderZhi> selectDoubtfulDay(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//月指标取数语句如下，avg(LOCAL_RATIO) 即为对应值：（月份格式：yyyy-mm 例：2018-06）

	List <OderZhi> selectDoubtfulMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);
	
	/**
	 * 查询出重点产品达成率的数据信息
	 */

	List <ImportantProduct> selectListImportant(@Param(value = "BRANDNAME") String brand,@Param(value = "SPEC") String model);
	
	/**五线七口价格
	 * 
	 */

	//日指标取数语句如下，sum(AMOUNTPRICE) 即为对应收入值：（日期格式：yyyy-mm-dd 例：2018-06-01） 表ZD_RESULT_OPER_LSLJ_LINE_D

	List <AbsoluteLine> selectPriceDate(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//月指标取数语句如下，sum(AMOUNTPRICE) 即为对应收入值：（月份格式：yyyy-mm 例：2018-06）表ZD_RESULT_OPER_LSLJ_LINE_D
	List <AbsoluteLine> selectPriceMonthDate(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);
	//份额销量趋势日指标取数据
	List <ShareFen> selectShareDayNow(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);
	//去年同期
	List <ShareFen> selectShareYearDayNow(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//月指标取数语句如下，avg(PRO_SHARE) 即为对应值：（月份格式：yyyy-mm 例：2018-06）

	List <ShareFen> selectSayMonthNow(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);
	//去年同期
	List <ShareFen> selectSayYearMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);
	
	/**
	 * 份额地市销量
	 */
	//日指标取数语句如下

	List <ShareFen> selectAreaShareDay(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//月指标取数语句如下

	List <ShareFen> selectAreaShareMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	/**
	 * 覆盖销量趋势
	 * @param start
	 * @param end
	 * @param brand
	 * @param model
	 * @return
	 */
	//日指标取数据
	List <OverCustomer> selectCoverDayNow(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);
	//去年同期
	List <OverCustomer> selectCoverYearDayNow(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//月指标取数语句如下，avg(PRO_SHARE) 即为对应值：（月份格式：yyyy-mm 例：2018-06）

	List <OverCustomer> selectCoverSayMonthNow(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);
	//去年同期
	List <OverCustomer> selectCoverSayYearMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);
	/**
	* 覆盖地市销量
	*/
	//日指标取数语句如下

	List <OverCustomer> selectCoverAreaShareDay(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//月指标取数语句如下

	List <OverCustomer> selectCoverAreaShareMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	/**
	 * 秩序销量趋势
	 * @param start
	 * @param end
	 * @param brand
	 * @param model
	 * @return
	 */
	//日指标取数据
	List <OderZhi> selectOrderDayNow(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);
	//去年同期
	List <OderZhi> selectOrderYearDayNow(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//月指标取数语句如下，avg(PRO_SHARE) 即为对应值：（月份格式：yyyy-mm 例：2018-06）

	List <OderZhi> selectOrderSayMonthNow(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);
	//去年同期
	List <OderZhi> selectOrderSayYearMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);
	/**
	* 秩序地市销量
	*/
	//日指标取数语句如下

	List <OderZhi> selectOrderAreaShareDay(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//月指标取数语句如下

	List <OderZhi> selectOrderAreaShareMonth(@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	/**
	 * 汇总销量数据取数据                  
	 * 
	 * 
	 */
	String selectTotalAmount (@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);
	
	/**
	 * 汇总总收入值
	 */

	Float selectTotalIncome (@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);
	/**
	 * 汇总覆盖客户值
	 */
	Float selectTotalCustomer (@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);
	/**
	 * 汇总覆盖网点值
	 */
	Float selectTotalStore (@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);

	//月指标取数据

	/**
	 * 汇总销量数据取数据                  
	 * 
	 * 
	 */
	String selectTotalAmountMonth (@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);
	/**
	 * 汇总总收入值
	 */

	Float selectTotalIncomeMonth (@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);
	/**
	 * 汇总覆盖客户值
	 */
	Float selectTotalCustomerMonth (@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);
	/**
	 * 汇总覆盖网点值
	 */
	Float selectTotalStoreMonth (@Param(value = "DODATE") String start,@Param(value = "DODATE1") String end,@Param(value = "BRANDNAME") String BRANDNAME,@Param(value = "SPEC") String SPEC);
	
	
	
	
	
	
}

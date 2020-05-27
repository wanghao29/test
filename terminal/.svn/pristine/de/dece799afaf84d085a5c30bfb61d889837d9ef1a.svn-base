package com.asiainfo.cmc.service.brandmodel;

import java.util.List;

import com.asiainfo.cmc.enties.brandmodel.AbsoluteLine;
import com.asiainfo.cmc.enties.brandmodel.AbsoluteRange;
import com.asiainfo.cmc.enties.brandmodel.DoublePrice;
import com.asiainfo.cmc.enties.brandmodel.ImportantProduct;
import com.asiainfo.cmc.enties.brandmodel.LifeDate;
import com.asiainfo.cmc.enties.brandmodel.OderZhi;
import com.asiainfo.cmc.enties.brandmodel.OverCustomer;
import com.asiainfo.cmc.enties.brandmodel.ShareFen;
import com.asiainfo.cmc.enties.brandmodel.StockSet;



public interface AbsoluteRangeService {

/**
 * 量
 */

//当前销量-------根据日指标来查询数据，查询出所选开始时间到结束时间每天的销量（时间格式是YYYY-MM-DD）

List <AbsoluteRange> selectEveryDay(String start,String end,String brand,String model);
	
//当前销量-------根据月指标来查询数据，查询出所选开始时间到所选结束时间每个月的销量（时间格式是YYYY-MM）

List <AbsoluteRange> selectEveryMonth(String start,String end,String brand,String model);

//规划销量--------先算出选择的开始时间和实际产品开始销售的时间相差多少天（时间格式是YYYY-MM-DD）

int selectHowDay(String start,String brand,String model);

//规划销量--------用户所选时间段相差多少天， 算出所选择的开始时间和所选择的结束时间相差了多少天（时间格式是YYYY-MM-DD）

int selectHowDays(String start,String end);

//判断产品的生命周期 ,查询表ZD_RESULT_OPER_PRODUCT_CYCLE_INFO，所属周期和持续时间字段进行查询  

List<LifeDate> selectBrandLife(String brand,String model);


//月规划销量计算      算出选择的开始月份，与当前产品开始销售月份之间相差多少个月

int selectMonthRange(String start,String brand,String model);


//结束月份和开始月份相差几个月

int selectMonthDiffer(String start,String end);

/**
 * 
 * 对标品销量
 * 
 */

//日指标取数语句如下，sum(AMOUNT) 即为对应销量值：（日期格式：yyyy-mm-dd 例：2018-06-01）

List <AbsoluteRange> selectDayDate(String start,String end,String brand,String model,String brand1,String model1);

//月指标取数    （例2018-06）

List <AbsoluteRange> selectMonthDate(String start,String end,String brand,String model,String brand1,String model1);


/**
 * 竞品销量
 * 
 */

//日指标取数语句如下，sum(AMOUNT) 即为对应销量值：（日期格式：yyyy-mm-dd 例：2018-06-01）

List <AbsoluteRange> selectDayDate1(String start,String end,String brand,String model,String brand2,String model2);

//月指标取数    （例2018-06）

List <AbsoluteRange> selectMonthDate1(String start,String end,String brand,String model,String brand2,String model2);


/**
 * 五线七口销量
 */

//日指标取数语句如下，sum(AMOUNT) 即为对应销量值：（日期格式：yyyy-mm-dd 例：2018-06-01）

List <AbsoluteLine> selectFiveDate(String start,String end,String brand,String model);

//月指标取数语句如下，sum(AMOUNT) 即为对应销量值：（月份格式：yyyy-mm 例：2018-06）

List <AbsoluteLine> selectFiveMonthDate(String start,String end,String brand,String model);


/**
 * 地市销量
 */
//日指标取数语句如下，sum(AMOUNT) 即为对应销量值：（日期格式：yyyy-mm-dd 例：2018-06-01）

List <AbsoluteRange> selectAreaDay(String start,String end,String brand,String model);

//月指标取数语句如下，sum(AMOUNT) 即为对应销量值：（月份格式：yyyy-mm 例：2018-06）

List <AbsoluteRange> selectAreaMonth(String start,String end,String brand,String model);


/**
 * 销量趋势
 */
//日指标取数语句如下，sum(AMOUNT) 即为对应销量值：（日期格式：yyyy-mm-dd 例：2018-06-01）   当前所选时间销量：

List <AbsoluteRange> selectSayDay(String start,String end,String brand,String model);

//日指标取数语句如下,去年同期销量：

List <AbsoluteRange> selectSayDay1(String start,String end,String brand,String model);

//月指标取数语句如下，sum(AMOUNT) 即为对应销量值：（月份格式：yyyy-mm 例：2018-06）当前所选时间销量：

List <AbsoluteRange> selectSayMonth(String start,String end,String brand,String model);

//月指标取数语句如下，去年同期销量：

List <AbsoluteRange> selectSayMonth1(String start,String end,String brand,String model);


/**
 * 重点产品达成率           咨询KPI那边的取数逻辑
 */




/**
 * 收
 */

//当前收入       日指标取数语句如下，sum(AMOUNTPRICE) 即为对应收入值：（日期格式：yyyy-mm-dd 例：2018-06-01）

List <AbsoluteRange> selectIncomeDay(String start,String end,String brand,String model);

//当前收入        月指标取数语句如下，sum(AMOUNTPRICE) 即为对应收入值：（月份格式：yyyy-mm 例：2018-06）

List <AbsoluteRange> selectIncomeMonth(String start,String end,String brand,String model);

//规划收入  日指标取数语句如下：（日期格式：yyyy-mm-dd 例：2018-06-01）首先，算出选择的开始日期，与当前产品开始销售日期之间相差多少天

String selectSerachDay(String start,String brand, String model);

//规划收入   其次，算出选择的结束日期，与开始日期之间相差多少天

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

List <AbsoluteRange> selectIncomeDays(String start,String end,String brand,String model,String brand1,String model1);

//月指标取数语句如下，sum(AMOUNTPRICE) 即为对应收入值：（月份格式：yyyy-mm 例：2018-06）

List <AbsoluteRange> selectIncomeMonths(String start,String end,String brand,String model,String brand2,String model2);


/**
 * 竞品收入
 */
//日指标取数据  sum(AMOUNTPRICE) 即为对应收入值：（日期格式：yyyy-mm-dd 例：2018-06-01）

List <AbsoluteRange> selectComeDays(String start,String end,String brand,String model,String brand1,String model1);

//月指标取数语句如下，sum(AMOUNTPRICE) 即为对应收入值：（月份格式：yyyy-mm 例：2018-06）

List <AbsoluteRange> selectComeMonth(String start,String end,String brand,String model,String brand2,String model2);

/**
 * 五线七口收入
 */

//日指标取数语句如下，sum(AMOUNTPRICE) 即为对应收入值：（日期格式：yyyy-mm-dd 例：2018-06-01） 表ZD_RESULT_OPER_LSLJ_LINE_D

List <AbsoluteLine> selectFive(String start,String end,String brand,String model);

//月指标取数语句如下，sum(AMOUNTPRICE) 即为对应收入值：（月份格式：yyyy-mm 例：2018-06）表ZD_RESULT_OPER_LSLJ_LINE_D

List <AbsoluteLine> selectFiveMonth(String start,String end,String brand,String model);


/**
 * 地市收入
 */
//日指标取数语句如下，sum(AMOUNTPRICE) 即为对应收入值：（日期格式：yyyy-mm-dd 例：2018-06-01） 表ZD_RESULT_OPER_LSLJ_AREA_D

List <AbsoluteRange> selectAreaFiveDay(String start,String end,String brand,String model);

//月指标取数语句如下，sum(AMOUNTPRICE) 即为对应收入值：（月份格式：yyyy-mm 例：2018-06） 表ZD_RESULT_OPER_LSLJ_AREA_D

List <AbsoluteRange> selectAreaFiveMonth(String start,String end,String brand,String model);


/**
 * 收入趋势
 */
//日指标取数语句如下，sum(AMOUNTPRICE) 即为对应收入值：（日期格式：yyyy-mm-dd 例：2018-06-01）表ZD_RESULT_OPER_LSLJ_AREA_D
//当前所选时间收入
List <AbsoluteRange> selectIncomes(String start,String end,String brand,String model);

//去年同期收入
List <AbsoluteRange> selectIncomeDayed(String start,String end,String brand,String model);

//月指标取数语句如下，sum(AMOUNTPRICE) 即为对应收入值：（月份格式：yyyy-mm 例：2018-06）表ZD_RESULT_OPER_LSLJ_AREA_D
//当前所选时间收入

List <AbsoluteRange> selectIncomeMonthed(String start,String end,String brand,String model);

//去年同期收入

List <AbsoluteRange> selectIncomeMonthes(String start,String end,String brand,String model);


/**
 * 利
 */
//当前利润   日指标取数语句如下，sum(SALECOSTPRICE) 即为对应利润值：（日期格式：yyyy-mm-dd 例：2018-06-01）表ZD_RESULT_OPER_LSLJ_AREA_D

List <AbsoluteRange> selectProfitDay(String start,String end,String brand,String model);

//月指标取数语句如下，sum(SALECOSTPRICE) 即为对应利润值：（月份格式：yyyy-mm 例：2018-06）

List <AbsoluteRange> selectProfitMonth(String start,String end,String brand,String model);

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

List <AbsoluteRange> selectProductProfitDay(String start,String end,String brand,String model,String brand2,String model2);

//月指标取数语句如下，sum(SALECOSTPRICE) 即为对应利润值：（月份格式：yyyy-mm 例：2018-06）

List <AbsoluteRange> selectProductProfitMonth(String start,String end,String brand,String model,String brand1,String model1);

//竞品利润  日指标取数语句如下，sum(SALECOSTPRICE) 即为对应利润值：（日期格式：yyyy-mm-dd 例：2018-06-01）表ZD_RESULT_OPER_LSLJ_AREA_D

List <AbsoluteRange> selectCompetitiveProductDay(String start,String end,String brand,String model,String brand2,String model2);

//月指标取数语句如下，sum(SALECOSTPRICE) 即为对应利润值：（月份格式：yyyy-mm 例：2018-06）

List <AbsoluteRange> selectCompetitiveProductMonth(String start,String end,String brand,String model,String brand2,String model2);

//五线七口利润    日指标取数语句如下，sum(SALECOSTPRICE) 即为对应利润值：（日期格式：yyyy-mm-dd) ZD_RESULT_OPER_LSLJ_LINE_D

List <AbsoluteLine> selectProfitDays(String start,String end,String brand,String model);

//月指标取数语句如下，sum(SALECOSTPRICE) 即为对应利润值：（月份格式：yyyy-mm 例：2018-06）

List <AbsoluteLine> selectProfitMonths(String start,String end,String brand,String model);

//地市利润     日指标取数语句如下，sum(SALECOSTPRICE) 即为对应利润值：（日期格式：yyyy-mm-dd 例：2018-06-01）表 ZD_RESULT_OPER_LSLJ_AREA_D

List <AbsoluteRange> selectCityDay(String start,String end,String brand,String model);
 
//月指标取数语句如下，sum(SALECOSTPRICE) 即为对应利润值：（月份格式：yyyy-mm 例：2018-06）

List <AbsoluteRange> selectCityMonth(String start,String end,String brand,String model);

//利润趋势   日指标取数语句如下，sum(SALECOSTPRICE) 即为对应利润值：（日期格式：yyyy-mm-dd 例：2018-06-01）表 ZD_RESULT_OPER_LSLJ_AREA_D
//当前所选时间利润：

List <AbsoluteRange> selectTrendDay(String start,String end,String brand,String model);

//去年同期利润：

List <AbsoluteRange> selectLastYearTrendDays(String start,String end,String brand,String model);

//月指标取数语句如下，sum(SALECOSTPRICE) 即为对应利润值：（月份格式：yyyy-mm 例：2018-06）

//当前所选时间利润：

List <AbsoluteRange> selectTrendMonth(String start,String end,String brand,String model);

//去年同期利润：

List <AbsoluteRange> selectLastYearTrendMonth(String start,String end,String brand,String model);


/**
 * 价
 */

//本品价格  
//日指标取数语句如下，avg(SALEPRICE) 即为对应价格值：（日期格式：yyyy-mm-dd 例：2018-06-01）表 ZD_RESULT_OPER_LSLJ_AREA_D

List <AbsoluteRange> selectPriceDay(String start,String end,String brand,String model);

//月指标取数语句如下，avg(SALEPRICE) 即为对应价格值：（月份格式：yyyy-mm 例：2018-06）

List <AbsoluteRange> selectPriceMonth(String start,String end,String brand,String model);

//本品二级市场价格
//日指标取数语句如下，OPENPRICE 即为对应价格值：（日期格式：yyyy-mm-dd 例：2018-06-01）表ZD_RESULT_OPER_OPEN_PRICE_FINAL_D

List <DoublePrice> selectPriceDoubleDay(String start,String end,String brand,String model);

//月指标取数语句如下，OPENPRICE 即为对应价格值：（月份格式：yyyy-mm 例：2018-06）

List <DoublePrice> selectPriceDoubleMonth(String start,String end,String brand,String model);

//竞品二级市场价格
//日指标取数语句如下，OPENPRICE 即为对应价格值：（日期格式：yyyy-mm-dd 例：2018-06-01）表ZD_RESULT_OPER_OPEN_PRICE_FINAL_D

List <DoublePrice> selectPriceDoubleCompetitive(String start,String end,String brand1,String model1);

//月指标取数语句如下，OPENPRICE 即为对应价格值：（月份格式：yyyy-mm 例：2018-06）

List <DoublePrice> selectPriceDoubleCompetitiveMonth(String start,String end,String brand1,String model1);

//地市价格
//日指标取数语句如下，avg(SALEPRICE)即为对应价格值：（日期格式：yyyy-mm-dd 例：2018-06-01）表 ZD_RESULT_OPER_LSLJ_AREA_D

List <AbsoluteRange> selectPriceDays(String start,String end,String brand,String model);

//月指标取数语句如下，avg(SALEPRICE)即为对应价格值：（月份格式：yyyy-mm 例：2018-06）

List <AbsoluteRange> selectPriceMonths(String start,String end,String brand,String model);


//价格趋势
//当前所选时间利润：日指标取数语句如下，avg(SALEPRICE) 即为对应利润值：（日期格式：yyyy-mm-dd 例：2018-06-01）表 ZD_RESULT_OPER_LSLJ_AREA_D

List <AbsoluteRange> selectNowPrice(String start,String end,String brand,String model);

//去年同期利润：

List <AbsoluteRange> selectLastYearPrice(String start,String end,String brand,String model);

//月指标取数语句如下，avg(SALEPRICE) 即为对应利润值：（月份格式：yyyy-mm 例：2018-06）
//当前所选时间利润：

List <AbsoluteRange> selectNowPriceMonth(String start,String end,String brand,String model);

//去年同期利润：

List <AbsoluteRange> selectLastYearPriceMonth(String start,String end,String brand,String model);



/**
 * 覆
 */
//累积覆盖客户数    日指标取数语句如下，count(1) 即为对应覆盖客户数值：（日期格式：yyyy-mm-dd 例：2018-06-01）表ZD_RESULT_OPER_OVER_CUST_AREA_D

List <OverCustomer> selectAccumulativeDay(String start,String end,String brand,String model);

//月指标取数语句如下，count(1) 即为对应覆盖客户数值：（月份格式：yyyy-mm 例：2018-06）

List <OverCustomer> selectAccumulativeMonth(String start,String end,String brand,String model);

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

List <StockSet> selectDepositDay(String start,String end,String brand,String model);
/**
 * 存取去年的数据来进行对比
 * @param start
 * @param end
 * @param brand
 * @param model
 * @return
 */
List <StockSet> selectLastYear(String start,String end,String brand,String model);
//月指标取数语句如下，sum(REAL_TIME_AMOUNT) 即为对应值：（月份格式：yyyy-mm 例：2018-06）

List <StockSet> selectDepositMonth(String start,String end,String brand,String model);
/**
 * 存月指标取去年同期的数据来对比
 */
List <StockSet> selectLastYearMonth(String start,String end,String brand,String model);
/**
 * 存地市趋势取日指标数据
 */
List <StockSet> cunAreaDay(String start,String end,String brand,String model);

/**
 * 存地市趋势取月指标数据
 */
List <StockSet> cunAreaMonth(String start,String end,String brand,String model);
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

List <ShareFen> selectShareDay(String start,String end,String brand,String model);

//月指标取数语句如下，avg(PRO_SHARE) 即为对应值：（月份格式：yyyy-mm 例：2018-06）

List <ShareFen> selectShareMonth(String start,String end,String brand,String model);


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

List <OderZhi> selectLocalDay(String start,String end,String brand,String model);

//月指标取数语句如下，avg(LOCAL_RATIO) 即为对应值：（月份格式：yyyy-mm 例：2018-06）

List <OderZhi> selectLocalMonth(String start,String end,String brand,String model);

//DM异地激活率
//日指标取数语句如下，avg(REMOTE_RATIO) 即为对应值：（日期格式：yyyy-mm-dd 例：2018-06-01）

List <OderZhi> selectDifferentDay(String start,String end,String brand,String model);


//月指标取数语句如下，avg(LOCAL_RATIO) 即为对应值：（月份格式：yyyy-mm 例：2018-06）

List <OderZhi> selectDifferentMonth(String start,String end,String brand,String model);

//疑似套机率
//日指标取数语句如下，avg(REMOTE_RATIO) 即为对应值：（日期格式：yyyy-mm-dd 例：2018-06-01）

List <OderZhi> selectDoubtfulDay(String start,String end,String brand,String model);

//月指标取数语句如下，avg(LOCAL_RATIO) 即为对应值：（月份格式：yyyy-mm 例：2018-06）

List <OderZhi> selectDoubtfulMonth(String start,String end,String brand,String model);

/**
 * 查询出重点产品达成率的数据信息
 */

List <ImportantProduct> selectListImportant(String brand,String model);

/**
 * 五线七口价格
 * @param start
 * @param end
 * @param brand
 * @param model
 * @return
 */

//日指标取数语句如下，sum(AMOUNTPRICE) 即为对应收入值：（日期格式：yyyy-mm-dd 例：2018-06-01） 表ZD_RESULT_OPER_LSLJ_LINE_D

List <AbsoluteLine> selectPriceDate(String start,String end,String brand,String model);
/**
 * 五线七口价格
 * @param start
 * @param end
 * @param brand
 * @param model
 * @return
 */
//月指标取数语句如下，sum(AMOUNTPRICE) 即为对应收入值：（月份格式：yyyy-mm 例：2018-06）表ZD_RESULT_OPER_LSLJ_LINE_D

List <AbsoluteLine> selectPriceMonthDate(String start,String end,String brand,String model);

//当前份额   日指标取数语句如下，avg(PRO_SHARE) 即为对应值：（日期格式：yyyy-mm-dd 例：2018-06-01）表 ZD_RESULT_OPER_SHARE_AREA_D

List <ShareFen> selectShareDayNow(String start,String end,String brand,String model);
//去年同期
List <ShareFen> selectShareYearDayNow(String start,String end,String brand,String model);

//月指标取数语句如下，avg(PRO_SHARE) 即为对应值：（月份格式：yyyy-mm 例：2018-06）

List <ShareFen> selectSayMonthNow(String start,String end,String brand,String model);
//去年同期
List <ShareFen> selectSayYearMonth(String start,String end,String brand,String model);
/**
 * 份额地市销量
 */
//日指标取数语句如下

List <ShareFen> selectAreaShareDay(String start,String end,String brand,String model);

//月指标取数语句如下

List <ShareFen> selectAreaShareMonth(String start,String end,String brand,String model);


/**
 * 覆盖销量趋势
 * @param start
 * @param end
 * @param brand
 * @param model
 * @return
 */
//日指标取数据
List <OverCustomer> selectCoverDayNow(String start,String end,String brand,String model);
//去年同期
List <OverCustomer> selectCoverYearDayNow(String start,String end,String brand,String model);

//月指标取数语句如下，avg(PRO_SHARE) 即为对应值：（月份格式：yyyy-mm 例：2018-06）

List <OverCustomer> selectCoverSayMonthNow(String start,String end,String brand,String model);
//去年同期
List <OverCustomer> selectCoverSayYearMonth(String start,String end,String brand,String model);
/**
* 覆盖地市销量
*/
//日指标取数语句如下

List <OverCustomer> selectCoverAreaShareDay(String start,String end,String brand,String model);

//月指标取数语句如下

List <OverCustomer> selectCoverAreaShareMonth(String start,String end,String brand,String model);




/**
 * 秩序销量趋势
 * @param start
 * @param end
 * @param brand
 * @param model
 * @return
 */
//日指标取数据
List <OderZhi> selectOrderDayNow(String start,String end,String brand,String model);
//去年同期
List <OderZhi> selectOrderYearDayNow(String start,String end,String brand,String model);

//月指标取数语句如下，avg(PRO_SHARE) 即为对应值：（月份格式：yyyy-mm 例：2018-06）

List <OderZhi> selectOrderSayMonthNow(String start,String end,String brand,String model);
//去年同期
List <OderZhi> selectOrderSayYearMonth(String start,String end,String brand,String model);
/**
* 秩序地市销量
*/
//日指标取数语句如下

List <OderZhi> selectOrderAreaShareDay(String start,String end,String brand,String model);

//月指标取数语句如下

List <OderZhi> selectOrderAreaShareMonth(String start,String end,String brand,String model);

/**
 * 汇总销量数据取数据                  
 * 
 * 
 */
String selectTotalAmount (String start,String end,String brand,String model);
/**
 * 汇总总收入值
 */

Float selectTotalIncome (String start,String end,String brand,String model);
/**
 * 汇总覆盖客户值
 */
Float selectTotalCustomer (String start,String end,String brand,String model);
/**
 * 汇总覆盖网点值
 */
Float selectTotalStore (String start,String end,String brand,String model);
//月指标取数据

/**
 * 汇总销量数据取数据                  
 * 
 * 
 */
String selectTotalAmountMonth (String start,String end,String brand,String model);
/**
 * 汇总总收入值
 */

Float selectTotalIncomeMonth (String start,String end,String brand,String model);
/**
 * 汇总覆盖客户值
 */
Float selectTotalCustomerMonth (String start,String end,String brand,String model);
/**
 * 汇总覆盖网点值
 */
Float selectTotalStoreMonth (String start,String end,String brand,String model);







}
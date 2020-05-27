package com.asiainfo.cmc.controller.brandRangeSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.sql.visitor.functions.Substring;
import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.brandmodel.AbsoluteLine;
import com.asiainfo.cmc.enties.brandmodel.AbsoluteRange;
import com.asiainfo.cmc.enties.brandmodel.ImportantProduct;
import com.asiainfo.cmc.enties.brandmodel.OderZhi;
import com.asiainfo.cmc.enties.brandmodel.OverCustomer;
import com.asiainfo.cmc.enties.brandmodel.ShareFen;
import com.asiainfo.cmc.enties.brandmodel.StockSet;
import com.asiainfo.cmc.service.brandmodel.AbsoluteRangeService;
import com.asiainfo.cmc.service.brandmodel.ImportantProductService;
import com.asiainfo.cmc.service.impl.brandmodel.PlanSaleUtils;

/**
 * 全生命周期监控取数据
 * 
 * @author Administrator
 *
 */

@Controller
@RequestMapping(value = "/absolute1")
public class AbsoluteRange1Controller {

	@Resource
	private AbsoluteRangeService absoluteRangeService;
	@Resource
	private PlanSaleUtils planSaleUtils;
	@Resource
	private ImportantProductService importantProductService;
	/**
	 * 收 表取日指标数据
	 * 
	 * @param locale
	 * @param models
	 * @param request
	 * @param response
	 * @return
	 */

	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/shou", method = RequestMethod.POST)
	public Map<String, Object> indexs(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");
		String brand1 = request.getParameter("brand1");
		String model1 = request.getParameter("model1");
		String brand2 = request.getParameter("brand2");
		String model2 = request.getParameter("model2");
		// 当前收入指标取数据
		List<AbsoluteRange> selectIncomeDay = absoluteRangeService.selectIncomeDay(start, end, brand, model);
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();
		if (selectIncomeDay != null && !selectIncomeDay.isEmpty()) {

			for (AbsoluteRange obj : selectIncomeDay) {
				dayListResuleSet.add(obj.getDODATE());
			}
			for (AbsoluteRange obj : selectIncomeDay) {
				float f = obj.getAMOUNTPRICE();

				String str = String.valueOf(f);
				amountList.add(str);
			}
		}
		List<String> dayList = getBetweenDays(start, end);
		
		List<String> amountLists = new ArrayList<String>();
		for(String day : dayList) {
			if(dayListResuleSet.contains(day)) {
				for(AbsoluteRange obj : selectIncomeDay) {		
					if(day.equals(obj.getDODATE())) {
						amountList.add(obj.getAmount());
					}
				}
			}else {
				amountLists.add("0");
			}
		}
		
		// 对标品收入日指标取数据selectIncomeDays
		List<AbsoluteRange> selectIncomeDays = absoluteRangeService.selectIncomeDays(start, end, brand, model, brand1,
				model1);
		List<String> timeListResuleSet = new ArrayList<String>();
		List<String> duiList = new ArrayList<String>();
		if (selectIncomeDays != null && !selectIncomeDays.isEmpty()) {

			for (AbsoluteRange obj : selectIncomeDays) {
				timeListResuleSet.add(obj.getDODATE());
			}
			for (AbsoluteRange obj : selectIncomeDays) {
				float f = obj.getAMOUNTPRICE();

				String str = String.valueOf(f);

				duiList.add(str);
			}
		}

		// 竞品收入日指标取数据selectIncomeDays
		List<AbsoluteRange> IncomeDays = absoluteRangeService.selectComeDays(start, end, brand, model, brand2, model2);
		List<String> timeIncomeDaysResuleSet = new ArrayList<String>();
		List<String> incomeDaysList = new ArrayList<String>();
		if (IncomeDays != null && !IncomeDays.isEmpty()) {

			for (AbsoluteRange obj : IncomeDays) {
				timeIncomeDaysResuleSet.add(obj.getDODATE());
			}
			for (AbsoluteRange obj : IncomeDays) {
				float f = obj.getAMOUNTPRICE();

				String str = String.valueOf(f);

				incomeDaysList.add(str);
			}
		}

		//收入 规划值取数据
		@SuppressWarnings("rawtypes")
		List dayIncome = planSaleUtils.incomePlanDay(start, end, brand, model);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayListResuleSet);
		map.put("1", amountList);
		map.put("2", dayIncome);
		map.put("3", incomeDaysList);
		map.put("4", duiList);

		return map;
	}

	/**
	 * 存 表日指标取数据
	 * 
	 * @param locale
	 * @param models
	 * @param request
	 * @param response
	 * @return
	 */

	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/cun", method = RequestMethod.POST)
	public Map<String, Object> indexeds(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");

		// 实际库存周转
		List<StockSet> selectDepositDay = absoluteRangeService.selectDepositDay(start, end, brand, model);
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();
		if (selectDepositDay != null && !selectDepositDay.isEmpty()) {

			for (StockSet obj : selectDepositDay) {
				dayListResuleSet.add(obj.getDODATE());
			}
			for (StockSet obj : selectDepositDay) {
				float f = obj.getREALTIMEAMOUNT();

				String str = String.valueOf(f);
				amountList.add(str);
			}
		}
       //规划库存周数
		@SuppressWarnings("rawtypes")
		List dayShock = planSaleUtils.shockPlan(start, end, brand, model);		
		
		
     List<String> dayList = getBetweenDays(start, end);
		
		List<String> amountLists = new ArrayList<String>();
		for(String day : dayList) {
			if(dayListResuleSet.contains(day)) {
				for(StockSet obj : selectDepositDay) {		
					if(day.equals(obj.getDODATE())) {
						float f = obj.getREALTIMEAMOUNT();

						String str = String.valueOf(f);
						
						amountList.add(str);
					}
				}
			}else {
				amountLists.add("0");
			}
		}
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayList);
		map.put("1", amountList);
	    map.put("2", dayShock);
		// map.put("3", duiList);
		// map.put("4", incomeDaysList);

		return map;
	}

	/**
	 * 存 表月指标取数据
	 * 
	 * @param locale
	 * @param models
	 * @param request
	 * @param response
	 * @return
	 */

	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/cunMonth", method = RequestMethod.POST)
	public Map<String, Object> indexes(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");

		// 实际库存周转
		List<StockSet> selectDepositDay = absoluteRangeService.selectDepositMonth(start, end, brand, model);
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();
		if (selectDepositDay != null && !selectDepositDay.isEmpty()) {

			for (StockSet obj : selectDepositDay) {
				dayListResuleSet.add(obj.getDODATE());
			}
			for (StockSet obj : selectDepositDay) {
				float f = obj.getREALTIMEAMOUNT();

				String str = String.valueOf(f);
				amountList.add(str);
			}
		}

		@SuppressWarnings("rawtypes")
		List monthShock = planSaleUtils.shockPlanMonth(start, end, brand, model);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayListResuleSet);
		map.put("1", amountList);
	    map.put("2", monthShock);
		// map.put("3", duiList);
		// map.put("4", incomeDaysList);

		return map;
	}

	/**
	 * 收 表取月指标数据
	 * 
	 * @param locale
	 * @param models
	 * @param request
	 * @param response
	 * @return
	 */

	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/shouMonth", method = RequestMethod.POST)
	public Map<String, Object> indexed(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		//获取参数信息
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");
		String brand1 = request.getParameter("brand1");
		String model1 = request.getParameter("model1");
		String brand2 = request.getParameter("brand2");
		String model2 = request.getParameter("model2");
		// 当前收入指标取数据
		List<AbsoluteRange> selectIncomeMonth = absoluteRangeService.selectIncomeMonth(start, end, brand, model);
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();
		if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

			for (AbsoluteRange obj : selectIncomeMonth) {
				dayListResuleSet.add(obj.getDODATE());
			}
			for (AbsoluteRange obj : selectIncomeMonth) {
				float f = obj.getAMOUNTPRICE();

				String str = String.valueOf(f);
				amountList.add(str);
			}
		}
		// 对标品收入月指标取数据selectIncomeDays
		List<AbsoluteRange> selectIncomeMonths = absoluteRangeService.selectIncomeMonths(start, end, brand, model,
				brand1, model1);
		List<String> timeListResuleSet = new ArrayList<String>();
		List<String> duiList = new ArrayList<String>();
		if (selectIncomeMonths != null && !selectIncomeMonths.isEmpty()) {

			for (AbsoluteRange obj : selectIncomeMonths) {
				timeListResuleSet.add(obj.getDODATE());
			}
			for (AbsoluteRange obj : selectIncomeMonths) {
				float f = obj.getAMOUNTPRICE();

				String str = String.valueOf(f);

				duiList.add(str);
			}
		}

		// 竞品收入月指标取数据selectIncomeDays
		List<AbsoluteRange> selectComeMonth = absoluteRangeService.selectComeMonth(start, end, brand, model, brand2,
				model2);
		List<String> timeIncomeDaysResuleSet = new ArrayList<String>();
		List<String> incomeDaysList = new ArrayList<String>();
		if (selectComeMonth != null && !selectComeMonth.isEmpty()) {

			for (AbsoluteRange obj : selectComeMonth) {
				timeIncomeDaysResuleSet.add(obj.getDODATE());
			}
			for (AbsoluteRange obj : selectComeMonth) {
				float f = obj.getAMOUNTPRICE();

				String str = String.valueOf(f);

				incomeDaysList.add(str);
			}
		}

		@SuppressWarnings("rawtypes")
		List incomeCompetition = planSaleUtils.incomePlanMonth(start, end, brand, model);		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayListResuleSet);
		map.put("1", amountList);
		map.put("2", incomeCompetition);
		map.put("3", duiList);
		map.put("4", incomeDaysList);

		return map;

	}

	/**
	 * 利 表取日指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/li", method = RequestMethod.POST)
	public Map<String, Object> liTable(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");

		String brand2 = request.getParameter("brand2");
		String model2 = request.getParameter("model2");
		// 当前利润指标取数据
		List<AbsoluteRange> selectIncomeMonth = absoluteRangeService.selectProfitDay(start, end, brand, model);
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();
		if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

			for (AbsoluteRange obj : selectIncomeMonth) {
				dayListResuleSet.add(obj.getDODATE());
			}
			for (AbsoluteRange obj : selectIncomeMonth) {
				float f = obj.getSALECOSTPRICE();

				String str = String.valueOf(f);
				amountList.add(str);
			}
		}
		List<String> dayList = getBetweenDays(start, end);
		
		List<String> amountLists = new ArrayList<String>();
		for(String day : dayList) {
			if(dayListResuleSet.contains(day)) {
				for(AbsoluteRange obj : selectIncomeMonth) {		
					if(day.equals(obj.getDODATE())) {
						float f = obj.getSALECOSTPRICE();

						String str = String.valueOf(f);
						amountList.add(str);
						amountList.add(str);
					}
				}
			}else {
				amountLists.add("0");
			}
		}
		// 对标品利润指标取数据selectIncomeDays
		List<AbsoluteRange> selectIncomeMonths = absoluteRangeService.selectProductProfitDay(start, end, brand, model,
				brand2, model2);
		List<String> timeListResuleSet = new ArrayList<String>();
		List<String> duiList = new ArrayList<String>();
		if (selectIncomeMonths != null && !selectIncomeMonths.isEmpty()) {

			for (AbsoluteRange obj : selectIncomeMonths) {
				timeListResuleSet.add(obj.getDODATE());
			}
			for (AbsoluteRange obj : selectIncomeMonths) {
				float f = obj.getSALECOSTPRICE();

				String str = String.valueOf(f);

				duiList.add(str);
			}
		}
        //规划利润取数据
		@SuppressWarnings("rawtypes")
		List day = planSaleUtils.profitPlan(start, end, brand, model);		
		
		
		// 竞品利润指标取数据selectIncomeDays
		List<AbsoluteRange> selectComeMonth = absoluteRangeService.selectCompetitiveProductDay(start, end, brand, model,
				brand2, model2);
		List<String> timeIncomeDaysResuleSet = new ArrayList<String>();
		List<String> incomeDaysList = new ArrayList<String>();
		if (selectComeMonth != null && !selectComeMonth.isEmpty()) {

			for (AbsoluteRange obj : selectComeMonth) {
				timeIncomeDaysResuleSet.add(obj.getDODATE());
			}
			for (AbsoluteRange obj : selectComeMonth) {
				float f = obj.getSALECOSTPRICE();

				String str = String.valueOf(f);

				incomeDaysList.add(str);
			}
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayList);
		map.put("1", amountList);
		map.put("2", day);
		map.put("3", duiList);
		map.put("4", incomeDaysList);

		return map;

	}

	/**
	 * 利 表取月指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/liMonth", method = RequestMethod.POST)
	public Map<String, Object> liMonthTable(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");
		String brand1 = request.getParameter("brand1");
		String model1 = request.getParameter("model1");
		String brand2 = request.getParameter("brand2");
		String model2 = request.getParameter("model2");
		// 当前利润指标取数据
		List<AbsoluteRange> selectIncomeMonth = absoluteRangeService.selectProfitMonth(start, end, brand, model);
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();
		if (selectIncomeMonth.size() != 0 && !selectIncomeMonth.isEmpty()) {

			for (AbsoluteRange obj : selectIncomeMonth) {
				dayListResuleSet.add(obj.getDODATE());
			}
			for (AbsoluteRange obj : selectIncomeMonth) {
				float f = obj.getSALECOSTPRICE();

				String str = String.valueOf(f);
				amountList.add(str);
			}
		}
		// 对标品利润月指标取数据selectIncomeDays
		List<AbsoluteRange> selectIncomeMonths = absoluteRangeService.selectProductProfitMonth(start, end, brand, model,
				brand1, model1);
		List<String> timeListResuleSet = new ArrayList<String>();
		List<String> duiList = new ArrayList<String>();
		if (selectIncomeMonths != null && !selectIncomeMonths.isEmpty()) {

			for (AbsoluteRange obj : selectIncomeMonths) {
				timeListResuleSet.add(obj.getDODATE());
			}
			for (AbsoluteRange obj : selectIncomeMonths) {
				float f = obj.getSALECOSTPRICE();

				String str = String.valueOf(f);

				duiList.add(str);
			}
		}

		// 竞品利润月指标取数据selectIncomeDays
		List<AbsoluteRange> selectComeMonth = absoluteRangeService.selectCompetitiveProductMonth(start, end, brand,
				model, brand2, model2);
		List<String> timeIncomeDaysResuleSet = new ArrayList<String>();
		List<String> incomeDaysList = new ArrayList<String>();
		if (selectComeMonth != null && !selectComeMonth.isEmpty()) {

			for (AbsoluteRange obj : selectComeMonth) {
				timeIncomeDaysResuleSet.add(obj.getDODATE());
			}
			for (AbsoluteRange obj : selectComeMonth) {
				float f = obj.getSALECOSTPRICE();

				String str = String.valueOf(f);

				incomeDaysList.add(str);
			}
		}

		@SuppressWarnings("rawtypes")
		List MonthProfit = planSaleUtils.profitPlanMonth(start, end, brand, model);		
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayListResuleSet);
		map.put("1", amountList);
		map.put("2", MonthProfit);
		map.put("3", duiList);
		map.put("4", incomeDaysList);

		return map;

	}

	/**
	 * 份 表取日指标数据
	 */

	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/fen", method = RequestMethod.POST)
	public Map<String, Object> fenTable(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");

		// 当前份儿
		List<ShareFen> selectDepositDay = absoluteRangeService.selectShareDay(start, end, brand, model);
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();
		if (selectDepositDay != null && !selectDepositDay.isEmpty()) {

			for (ShareFen obj : selectDepositDay) {
				dayListResuleSet.add(obj.getDODATE());
			}
			for (ShareFen obj : selectDepositDay) {
				float f = obj.getPROSHARE();

				String str = String.valueOf(f);
				amountList.add(str);
			}
		}
          //规划份额值
		@SuppressWarnings("rawtypes")
		List shareDateDay = planSaleUtils.coverShare(start, end, brand, model);	
		
		
		List<String> dayList = getBetweenDays(start, end);
		
		List<String> amountLists = new ArrayList<String>();
		for(String day : dayList) {
			if(dayListResuleSet.contains(day)) {
				for(ShareFen obj : selectDepositDay) {		
					if(day.equals(obj.getDODATE())) {
						float f = obj.getPROSHARE();

						String str = String.valueOf(f);
						amountList.add(str);
					}
				}
			}else {
				amountLists.add("0");
			}
		}
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayList);
		map.put("1", amountList);
	    map.put("2", shareDateDay);
		// map.put("3", duiList);
		// map.put("4", incomeDaysList);

		return map;
	}

	/**
	 * 份 表取月指标数据
	 * 
	 * @param locale
	 * @param models
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/fenMonth", method = RequestMethod.POST)
	public Map<String, Object> fenMonthTable(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");

		// 当前份儿
		List<ShareFen> selectDepositDay = absoluteRangeService.selectShareMonth(start, end, brand, model);
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();
		if (selectDepositDay != null && !selectDepositDay.isEmpty()) {

			for (ShareFen obj : selectDepositDay) {
				dayListResuleSet.add(obj.getDODATE());
			}
			for (ShareFen obj : selectDepositDay) {
				float f = obj.getPROSHARE();

				String str = String.valueOf(f);
				amountList.add(str);
			}
		}

		@SuppressWarnings("rawtypes")
		List shareDateMonth = planSaleUtils.coverShareMonth(start, end, brand, model);	
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayListResuleSet);
		map.put("1", amountList);
		map.put("2", shareDateMonth);
		// map.put("3", duiList);
		// map.put("4", incomeDaysList);

		return map;
	}

	/**
	 * 覆 表取日指标数据
	 * 
	 * @param locale
	 * @param models
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/fu", method = RequestMethod.POST)
	public Map<String, Object> fuTable(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");
		// 累计覆盖客户数
		List<OverCustomer> selectDepositDay = absoluteRangeService.selectAccumulativeDay(start, end, brand, model);
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();
		if (selectDepositDay != null && !selectDepositDay.isEmpty()) {

			for (OverCustomer obj : selectDepositDay) {
				dayListResuleSet.add(obj.getDODATE());
			}
			for (OverCustomer obj : selectDepositDay) {
				float f = obj.getCnt();

				String str = String.valueOf(f);
				amountList.add(str);
			}
		}

		List<String> dayList = getBetweenDays(start, end);
		
		List<String> amountLists = new ArrayList<String>();
		for(String day : dayList) {
			if(dayListResuleSet.contains(day)) {
				for(OverCustomer obj : selectDepositDay) {		
					if(day.equals(obj.getDODATE())) {
						float f = obj.getCnt();

						String str = String.valueOf(f);
						amountList.add(str);
					}
				}
			}else {
				amountLists.add("0");
			}
		}
	
	//规划累计覆盖数	
		

		@SuppressWarnings("rawtypes")
		List dayCover = planSaleUtils.coverPlan(start, end, brand, model);	
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayList);
		map.put("1", amountList);
		map.put("2", dayCover);
		// map.put("3", duiList);
		// map.put("4", incomeDaysList);

		return map;
	}

	/**
	 * 覆 表取月指标数据
	 * 
	 * @param locale
	 * @param models
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/fuMonth", method = RequestMethod.POST)
	public Map<String, Object> fuMonthTable(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");

		// 累计覆盖客户数
		List<OverCustomer> selectDepositDay = absoluteRangeService.selectAccumulativeMonth(start, end, brand, model);
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();
		if (selectDepositDay != null && !selectDepositDay.isEmpty()) {

			for (OverCustomer obj : selectDepositDay) {
				dayListResuleSet.add(obj.getDODATE());
			}
			for (OverCustomer obj : selectDepositDay) {
				float f = obj.getCnt();

				String str = String.valueOf(f);
				amountList.add(str);
			}
		}

		@SuppressWarnings("rawtypes")
		List MonthCover = planSaleUtils.coverPlanMonth(start, end, brand, model);	
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayListResuleSet);
		map.put("1", amountList);
		map.put("2", MonthCover);
		// map.put("3", duiList);
		// map.put("4", incomeDaysList);

		return map;
	}

	/**
	 * 秩 表取日指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/zhi", method = RequestMethod.POST)
	public Map<String, Object> zhiMonthTable(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");

		// DM本地激活率
		List<OderZhi> selectIncomeMonth = absoluteRangeService.selectLocalDay(start, end, brand, model);
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();
		if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

			for (OderZhi obj : selectIncomeMonth) {
				dayListResuleSet.add(obj.getDODATE());
			}
			for (OderZhi obj : selectIncomeMonth) {
				float f = obj.getLOCALRATIO();

				String str = String.valueOf(f);
				amountList.add(str);
			}
		}
		List<String> dayList = getBetweenDays(start, end);
		
		/*List<String> amountLists = new ArrayList<String>();
		for(String day : dayList) {
			if(dayListResuleSet.contains(day)) {
				for(OderZhi obj : selectIncomeMonth) {		
					if(day.equals(obj.getDODATE())) {
						float f = obj.getLOCALRATIO();

						String str = String.valueOf(f);
						amountList.add(str);
					}
				}
			}else {
				amountLists.add("0");
			}
		}*/
		
		// DM 异地激活率
		List<OderZhi> selectIncomeMonths = absoluteRangeService.selectDifferentDay(start, end, brand, model);
		List<String> timeListResuleSet = new ArrayList<String>();
		List<String> duiList = new ArrayList<String>();
		if (selectIncomeMonths != null && !selectIncomeMonths.isEmpty()) {

			for (OderZhi obj : selectIncomeMonths) {
				timeListResuleSet.add(obj.getDODATE());
			}
			for (OderZhi obj : selectIncomeMonths) {
				float f = obj.getREMOTERATIO();

				String str = String.valueOf(f);

				duiList.add(str);
			}
		}

		// 疑似套机率
		List<OderZhi> selectComeMonth = absoluteRangeService.selectDoubtfulDay(start, end, brand, model);
		List<String> timeIncomeDaysResuleSet = new ArrayList<String>();
		List<String> incomeDaysList = new ArrayList<String>();
		if (selectComeMonth != null && !selectComeMonth.isEmpty()) {

			for (OderZhi obj : selectComeMonth) {
				timeIncomeDaysResuleSet.add(obj.getDODATE());
			}
			for (OderZhi obj : selectComeMonth) {
				float f = obj.getYKRATIO();

				String str = String.valueOf(f);

				incomeDaysList.add(str);
			}
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayList);
		map.put("1", amountList);
		map.put("2", duiList);
		map.put("3", incomeDaysList);
		// map.put("4", incomeDaysList);

		return map;

	}

	/**
	 * 秩 表取月指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/zhiMonth", method = RequestMethod.POST)
	public Map<String, Object> zhiMonth(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");

		// DM本地激活率
		List<OderZhi> selectIncomeMonth = absoluteRangeService.selectLocalMonth(start, end, brand, model);
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();
		if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

			for (OderZhi obj : selectIncomeMonth) {
				dayListResuleSet.add(obj.getDODATE());
			}
			for (OderZhi obj : selectIncomeMonth) {
				float f = obj.getLOCALRATIO();

				String str = String.valueOf(f);
				amountList.add(str);
			}
		}
		// DM 异地激活率
		List<OderZhi> selectIncomeMonths = absoluteRangeService.selectDifferentMonth(start, end, brand, model);
		List<String> timeListResuleSet = new ArrayList<String>();
		List<String> duiList = new ArrayList<String>();
		if (selectIncomeMonths != null && !selectIncomeMonths.isEmpty()) {

			for (OderZhi obj : selectIncomeMonths) {
				timeListResuleSet.add(obj.getDODATE());
			}
			for (OderZhi obj : selectIncomeMonths) {
				float f = obj.getREMOTERATIO();

				String str = String.valueOf(f);

				duiList.add(str);
			}
		}

		// 疑似套机率
		List<OderZhi> selectComeMonth = absoluteRangeService.selectDoubtfulMonth(start, end, brand, model);
		List<String> timeIncomeDaysResuleSet = new ArrayList<String>();
		List<String> incomeDaysList = new ArrayList<String>();
		if (selectComeMonth != null && !selectComeMonth.isEmpty()) {

			for (OderZhi obj : selectComeMonth) {
				timeIncomeDaysResuleSet.add(obj.getDODATE());
			}
			for (OderZhi obj : selectComeMonth) {
				float f = obj.getYKRATIO();

				String str = String.valueOf(f);

				incomeDaysList.add(str);
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayListResuleSet);
		map.put("1", amountList);
		map.put("2", duiList);
		map.put("3", incomeDaysList);
		// map.put("4", incomeDaysList);

		return map;

	}

	
	
	/**
	 * 销量趋势表取日指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/direction", method = RequestMethod.POST)
	public Map<String, Object> directionDay(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		//量收利价
		String number = request.getParameter("number");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");

		// 2018年销量
		List<AbsoluteRange> selectIncomeMonth = absoluteRangeService.selectSayDay(start, end, brand, model);
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();
		if(number!=""&&number.equals("量")) {
		
		if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

			for (AbsoluteRange obj : selectIncomeMonth) {
				String string = obj.getDODATE();
				String substring = string.substring(5);
				dayListResuleSet.add(substring);
			}
			for (AbsoluteRange obj : selectIncomeMonth) {
				
				amountList.add(obj.getAmount());
			}
		}
		}
		if(number!=""&&number.equals("收")) {
			
			if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

				for (AbsoluteRange obj : selectIncomeMonth) {
					dayListResuleSet.add(obj.getDODATE());
				}
				for (AbsoluteRange obj : selectIncomeMonth) {
					float f = obj.getAMOUNTPRICE();

					String str = String.valueOf(f);
					amountList.add(str);
					
				
				
				}
			}
			}
		if(number!=""&&number.equals("利")) {
			
			if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

				for (AbsoluteRange obj : selectIncomeMonth) {
					String string = obj.getDODATE();
					String substring = string.substring(5);
					dayListResuleSet.add(substring);
				}
				for (AbsoluteRange obj : selectIncomeMonth) {
					float f = obj.getSALECOSTPRICE();

					String str = String.valueOf(f);
					amountList.add(str);
					
				}
			}
			}
		if(number!=""&&number.equals("价")) {
			
			if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

				for (AbsoluteRange obj : selectIncomeMonth) {
					String string = obj.getDODATE();
					String substring = string.substring(5);
					dayListResuleSet.add(substring);
				}
				for (AbsoluteRange obj : selectIncomeMonth) {
					float f = obj.getSALEPRICE();

					String str = String.valueOf(f);
					amountList.add(str);
					
				}
			}
			}
		// 2017年销量
		List<AbsoluteRange> selectComeMonth = absoluteRangeService.selectSayDay1(start, end, brand, model);
		List<String> timeIncomeDaysResuleSet = new ArrayList<String>();
		List<String> incomeDaysList = new ArrayList<String>();
		if(number!=""&&number.equals("量")) {
		if (selectComeMonth != null && !selectComeMonth.isEmpty()) {

			for (AbsoluteRange obj : selectComeMonth) {
				String string = obj.getDODATE();
				String substring = string.substring(5);
				timeIncomeDaysResuleSet.add(substring);
			}
			for (AbsoluteRange obj : selectComeMonth) {
				

				incomeDaysList.add(obj.getAmount());
			}
		}
		}
		if(number!=""&&number.equals("收")) {
			if (selectComeMonth != null && !selectComeMonth.isEmpty()) {

				for (AbsoluteRange obj : selectComeMonth) {
					String string = obj.getDODATE();
					String substring = string.substring(5);
					timeIncomeDaysResuleSet.add(substring);
				}
				for (AbsoluteRange obj : selectComeMonth) {
					float f = obj.getAMOUNTPRICE();

					String str = String.valueOf(f);
					incomeDaysList.add(str);

					
				}
			}
			}
		if(number!=""&&number.equals("利")) {
			if (selectComeMonth != null && !selectComeMonth.isEmpty()) {

				for (AbsoluteRange obj : selectComeMonth) {
					String string = obj.getDODATE();
					String substring = string.substring(5);
					timeIncomeDaysResuleSet.add(substring);
				}
				for (AbsoluteRange obj : selectComeMonth) {
					float f = obj.getSALECOSTPRICE();

					String str = String.valueOf(f);
					incomeDaysList.add(str);


					
				}
			}
			}
		if(number!=""&&number.equals("价")) {
			if (selectComeMonth != null && !selectComeMonth.isEmpty()) {

				for (AbsoluteRange obj : selectComeMonth) {
					String string = obj.getDODATE();
					String substring = string.substring(5);
					timeIncomeDaysResuleSet.add(substring);
				}
				for (AbsoluteRange obj : selectComeMonth) {
					float f = obj.getSALEPRICE();

					String str = String.valueOf(f);
					incomeDaysList.add(str);


					
				}
			}
			}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayListResuleSet);
		map.put("1",timeIncomeDaysResuleSet);
		map.put("2", amountList);
		map.put("3", incomeDaysList);
		// map.put("4", incomeDaysList);

		return map;

	}	
	
	/**
	 * 销量趋势表取月指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/directionMonth", method = RequestMethod.POST)
	public Map<String, Object> directionMonth(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		//量收利价
		String number = request.getParameter("number");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");

		// 2017年销量
		List<AbsoluteRange> selectIncomeMonth = absoluteRangeService.selectSayMonth1(start, end, brand, model);
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();
		
		if(number!=""&&number.equals("量")) {
		if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

			for (AbsoluteRange obj : selectIncomeMonth) {
				String string = obj.getDODATE();
				String substring = string.substring(5);
				
				dayListResuleSet.add(substring);
			}
			for (AbsoluteRange obj : selectIncomeMonth) {
				
				amountList.add(obj.getAmount());
			}
		}
		}
		if(number!=""&&number.equals("收")) {
			if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

				for (AbsoluteRange obj : selectIncomeMonth) {
					String string = obj.getDODATE();
					String substring = string.substring(5);
					dayListResuleSet.add(substring);
				}
				for (AbsoluteRange obj : selectIncomeMonth) {
					float f = obj.getAMOUNTPRICE();

					String str = String.valueOf(f);
					amountList.add(str);
					
				}
			}
			}
		if(number!=""&&number.equals("利")) {
			if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

				for (AbsoluteRange obj : selectIncomeMonth) {
					String string = obj.getDODATE();
					String substring = string.substring(5);
					dayListResuleSet.add(substring);
				}
				for (AbsoluteRange obj : selectIncomeMonth) {
					float f = obj.getSALECOSTPRICE();

					String str = String.valueOf(f);
					amountList.add(str);
					
				}
			}
			}
		if(number!=""&&number.equals("价")) {
			if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

				for (AbsoluteRange obj : selectIncomeMonth) {
					String string = obj.getDODATE();
					String substring = string.substring(5);
					dayListResuleSet.add(substring);
				}
				for (AbsoluteRange obj : selectIncomeMonth) {
					float f = obj.getSALEPRICE();

					String str = String.valueOf(f);
					amountList.add(str);
					
				}
			}
			}
		
		// 2018年销量
		List<AbsoluteRange> selectComeMonth = absoluteRangeService.selectSayMonth(start, end, brand, model);
		List<String> timeIncomeDaysResuleSet = new ArrayList<String>();
		List<String> incomeDaysList = new ArrayList<String>();
		
		if(number!=""&&number.equals("量")) {
		if (selectComeMonth != null && !selectComeMonth.isEmpty()) {

			for (AbsoluteRange obj : selectComeMonth) {
				String string = obj.getDODATE();
				String substring = string.substring(5);
				timeIncomeDaysResuleSet.add(substring);
			}
			for (AbsoluteRange obj : selectComeMonth) {
				

				incomeDaysList.add(obj.getAmount());
			}
		}
		}
		
		if(number!=""&&number.equals("收")) {
		if (selectComeMonth != null && !selectComeMonth.isEmpty()) {

			for (AbsoluteRange obj : selectComeMonth) {
				String string = obj.getDODATE();
				String substring = string.substring(5);
				timeIncomeDaysResuleSet.add(substring);
			}
			for (AbsoluteRange obj : selectComeMonth) {
				float f = obj.getAMOUNTPRICE();

				String str = String.valueOf(f);
				incomeDaysList.add(str);

				
			}
		}
		}
		
		if(number!=""&&number.equals("利")) {
		if (selectComeMonth != null && !selectComeMonth.isEmpty()) {

			for (AbsoluteRange obj : selectComeMonth) {
				String string = obj.getDODATE();
				String substring = string.substring(5);
				timeIncomeDaysResuleSet.add(substring);
			}
			for (AbsoluteRange obj : selectComeMonth) {
				float f = obj.getSALECOSTPRICE();

				String str = String.valueOf(f);
				incomeDaysList.add(str);

				
			}
		}
		}
		
		if(number!=""&&number.equals("价")) {
		if (selectComeMonth != null && !selectComeMonth.isEmpty()) {

			for (AbsoluteRange obj : selectComeMonth) {
				String string = obj.getDODATE();
				String substring = string.substring(5);
				timeIncomeDaysResuleSet.add(substring);
			}
			for (AbsoluteRange obj : selectComeMonth) {
				float f = obj.getSALEPRICE();

				String str = String.valueOf(f);
				incomeDaysList.add(str);

				
			}
		}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayListResuleSet);
		map.put("1", amountList);
		map.put("2",incomeDaysList );
		map.put("3",timeIncomeDaysResuleSet );
		// map.put("4", incomeDaysList);

		return map;

	}	
	

	/**
	 * 各地市销量表取日指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/areaDay", method = RequestMethod.POST)
	public Map<String, Object> areaDays(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		
		String number = request.getParameter("number");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");

		List<AbsoluteRange> selectIncomeMonth = absoluteRangeService.selectAreaDay(start, end, brand, model);
		
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();
		
		if(number!=""&&number.equals("量")) {
		if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

			for (AbsoluteRange obj : selectIncomeMonth) {
				dayListResuleSet.add(obj.getAREANAME());
			}
			for (AbsoluteRange obj : selectIncomeMonth) {
				
				amountList.add(obj.getAmount());
			}
		}
		}
		if(number!=""&&number.equals("价")) {
			if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

				for (AbsoluteRange obj : selectIncomeMonth) {
					dayListResuleSet.add(obj.getAREANAME());
				}
				for (AbsoluteRange obj : selectIncomeMonth) {
					float f = obj.getSALEPRICE();

					String str = String.valueOf(f);
					amountList.add(str);
					
				}
			}
			}
		if(number!=""&&number.equals("收")) {
			if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

				for (AbsoluteRange obj : selectIncomeMonth) {
					dayListResuleSet.add(obj.getAREANAME());
				}
				for (AbsoluteRange obj : selectIncomeMonth) {
					
					float f = obj.getAMOUNTPRICE();

					String str = String.valueOf(f);
					amountList.add(str);
				}
			}
			}
		if(number!=""&&number.equals("利")) {
			if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

				for (AbsoluteRange obj : selectIncomeMonth) {
					dayListResuleSet.add(obj.getAREANAME());
				}
				for (AbsoluteRange obj : selectIncomeMonth) {
					
					float f = obj.getSALECOSTPRICE();

					String str = String.valueOf(f);
					amountList.add(str);
				}
			}
			}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", amountList);
		map.put("1", dayListResuleSet);
		//map.put("2", incomeDaysList);
		//map.put("3", duiList);
		// map.put("4", incomeDaysList);

		return map;

	}	
	
	
	
	/**
	 * 各地市销量表取月指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/areaMonth", method = RequestMethod.POST)
	public Map<String, Object> areaMonthTable(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		String number = request.getParameter("number");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");

		// 2017年销量
		List<AbsoluteRange> selectIncomeMonth = absoluteRangeService.selectAreaMonth(start, end, brand, model);
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();
		
		
		if(number!=""&&number.equals("量")) {
			if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

				for (AbsoluteRange obj : selectIncomeMonth) {
					dayListResuleSet.add(obj.getAREANAME());
				}
				for (AbsoluteRange obj : selectIncomeMonth) {
					
					amountList.add(obj.getAmount());
				}
			}
			}
			if(number!=""&&number.equals("价")) {
				if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

					for (AbsoluteRange obj : selectIncomeMonth) {
						dayListResuleSet.add(obj.getAREANAME());
					}
					for (AbsoluteRange obj : selectIncomeMonth) {
						float f = obj.getSALEPRICE();

						String str = String.valueOf(f);
						amountList.add(str);
						
					}
				}
				}
			if(number!=""&&number.equals("收")) {
				if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

					for (AbsoluteRange obj : selectIncomeMonth) {
						dayListResuleSet.add(obj.getAREANAME());
					}
					for (AbsoluteRange obj : selectIncomeMonth) {
						
						float f = obj.getAMOUNTPRICE();

						String str = String.valueOf(f);
						amountList.add(str);
					}
				}
				}
			if(number!=""&&number.equals("利")) {
				if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

					for (AbsoluteRange obj : selectIncomeMonth) {
						dayListResuleSet.add(obj.getAREANAME());
					}
					for (AbsoluteRange obj : selectIncomeMonth) {
						
						float f = obj.getSALECOSTPRICE();

						String str = String.valueOf(f);
						amountList.add(str);
					}
				}
				}
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", amountList);
		map.put("1", dayListResuleSet);
		//map.put("2", incomeDaysList);
		//map.put("3", duiList);
		// map.put("4", incomeDaysList);

		return map;

	}	
	

	/**
	 * 五线七口销售表取日指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/areaPortDay", method = RequestMethod.POST)
	public Map<String, Object> areaPort(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");
	

		List<AbsoluteLine> selectIncomeMonth = absoluteRangeService.selectFiveDate(start, end, brand, model);
		
		HashMap<String, Map<String,Object>> hashMap = new HashMap<String, Map<String,Object>>();		
		
		
		for(AbsoluteLine abo : selectIncomeMonth) {
			String fiveName = abo.getFiveName();
			String savenName = abo.getSavenName();
			if(!hashMap.keySet().contains(fiveName)) {
				hashMap.put(fiveName, new HashMap<String, Object>());
			}
			Map<String, Object> m = hashMap.get(fiveName);
			m.put(savenName, abo.getAMOUNT());
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> innerMap = new LinkedHashMap<String, Object>();
		HashMap<String, Object> outterMap = new LinkedHashMap<String, Object>();
		for (Map.Entry<String, Map<String,Object>> entry : hashMap.entrySet()) { 
			  String key = entry.getKey();
			  Map<String,Object> valueMap = entry.getValue();
			  Long l = 0l;
			  for (Map.Entry<String, Object> entry2 : valueMap.entrySet()) { 
				  Object value = entry2.getValue();
				  outterMap.put(entry2.getKey(), value);
				  l += value==null?0:Long.parseLong(value.toString());
			  }
			  innerMap.put(key, l);
		}

		map.put("innerMap", innerMap);
		map.put("outterMap", outterMap);
		return map;

	}	
	/**
	 * 五线七口销售表取月指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/areaPortMonth", method = RequestMethod.POST)
	public Map<String, Object> areaPortMonth(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");
	

		List<AbsoluteLine> selectIncomeMonth = absoluteRangeService.selectFiveMonthDate(start, end, brand, model);
		
		HashMap<String, Map<String,Object>> hashMap = new HashMap<String, Map<String,Object>>();		
		for(AbsoluteLine abo : selectIncomeMonth) {
			String fiveName = abo.getFiveName();
			String savenName = abo.getSavenName();
			if(!hashMap.keySet().contains(fiveName)) {
				hashMap.put(fiveName, new HashMap<String, Object>());
			}
			Map<String, Object> m = hashMap.get(fiveName);
			m.put(savenName, abo.getAMOUNT());
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> innerMap = new LinkedHashMap<String, Object>();
		HashMap<String, Object> outterMap = new LinkedHashMap<String, Object>();
		for (Map.Entry<String, Map<String,Object>> entry : hashMap.entrySet()) { 
			  String key = entry.getKey();
			  Map<String,Object> valueMap = entry.getValue();
			  Long l = 0l;
			  for (Map.Entry<String, Object> entry2 : valueMap.entrySet()) { 
				  Object value = entry2.getValue();
				  outterMap.put(entry2.getKey(), value);
				  l += value==null?0:Long.parseLong(value.toString());
			  }
			  innerMap.put(key, l);
		}

		map.put("innerMap", innerMap);
		map.put("outterMap", outterMap);
		return map;

	}
	
	
	
	/**
	 * 根据信品牌和型号查询重点产品达成率的信息
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/important", method = RequestMethod.POST)
	public Map<String, Object> importantProduct(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		
		
//		String start = request.getParameter("start");
//		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");
	    String zdcp=brand+"_"+model; 
		System.err.println(zdcp);
		HashMap<String, Object> map = new HashMap<String, Object>();	
		List<ImportantProduct> list = importantProductService.selectAllList(zdcp);
		List<String> monthEnd = new ArrayList<String>();
		List<String> fish = new ArrayList<String>();
		if(list != null && !list.isEmpty()) {
			
			for (ImportantProduct importantProduct : list) {
				
				float wcl = importantProduct.getWcl();
				String str = String.valueOf(wcl);
				String month = importantProduct.getMonth();
				fish.add(str);
				monthEnd.add(month);
			}
			map.put("fish", fish);
			map.put("monthEnd", monthEnd);
			
		}
		
		
	
		return map;

	}	
	/**
	 * 根据品牌和型号查询重点产品达成率的月指标信息
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/importantMonth", method = RequestMethod.POST)
	public Map<String, Object> importantProductMonth(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		
		
//		String start = request.getParameter("start");
//		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");
	    String zdcp=brand+"_"+model; 
		System.err.println(zdcp);
		HashMap<String, Object> map = new HashMap<String, Object>();	
		List<ImportantProduct> list = importantProductService.selectAllList(zdcp);
		List<String> monthEnd = new ArrayList<String>();
		List<String> fish = new ArrayList<String>();
		if(list != null && !list.isEmpty()) {
			
			for (ImportantProduct importantProduct : list) {
				
				float wcl = importantProduct.getWcl();
				String str = String.valueOf(wcl);
				String month = importantProduct.getMonth();
				fish.add(str);
				monthEnd.add(month);
			}
			map.put("fish", fish);
			map.put("monthEnd", monthEnd);
			
		}
		
		
	
		return map;

	}
	/**
	 * 五线七口价格表取日指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/priceAreaPortDay", method = RequestMethod.POST)
	public Map<String, Object> areaPortPrice(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		
		String number = request.getParameter("number");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> innerMap = new LinkedHashMap<String, Object>();
		HashMap<String, Object> outterMap = new LinkedHashMap<String, Object>();
		HashMap<String, Map<String,Object>> hashMap = new HashMap<String, Map<String,Object>>();
		List<AbsoluteLine> selectIncomeMonth = absoluteRangeService.selectPriceDate(start, end, brand, model);
		
		if(number!=""&&number.equals("价")) {		
		for(AbsoluteLine abo : selectIncomeMonth) {
			String fiveName = abo.getFiveName();
			String savenName = abo.getSavenName();
			
			if(!hashMap.keySet().contains(fiveName)) {
				hashMap.put(fiveName, new HashMap<String, Object>());
			}
			Map<String, Object> m = hashMap.get(fiveName);
			float saleprice = abo.getSALEPRICE();
			String str=String.valueOf(saleprice);
			m.put(savenName, str);
		}
		
		}
		
		if(number!=""&&number.equals("收")) {		
			for(AbsoluteLine abo : selectIncomeMonth) {
				String fiveName = abo.getFiveName();
				String savenName = abo.getSavenName();
				
				if(!hashMap.keySet().contains(fiveName)) {
					hashMap.put(fiveName, new HashMap<String, Object>());
				}
				Map<String, Object> m = hashMap.get(fiveName);
				float saleprice = abo.getAMOUNTPRICE();
				String str=String.valueOf(saleprice);
				m.put(savenName, str);
			}
			
			}
		if(number!=""&&number.equals("利")) {		
			for(AbsoluteLine abo : selectIncomeMonth) {
				String fiveName = abo.getFiveName();
				String savenName = abo.getSavenName();
				
				if(!hashMap.keySet().contains(fiveName)) {
					hashMap.put(fiveName, new HashMap<String, Object>());
				}
				Map<String, Object> m = hashMap.get(fiveName);
				float saleprice = abo.getSALECOSTPRICE();
				String str=String.valueOf(saleprice);
				m.put(savenName, str);
			}
			
			}
		
		for (Map.Entry<String, Map<String,Object>> entry : hashMap.entrySet()) { 
			  String key = entry.getKey();
			  Map<String,Object> valueMap = entry.getValue();
			  Long l = 0l;
			  for (Map.Entry<String, Object> entry2 : valueMap.entrySet()) { 
				  Object value = entry2.getValue();
				  outterMap.put(entry2.getKey(), value);
				  Double.parseDouble((String) (value.equals("")?"0":value));
				  //l += value==null?0:Long.parseLong(value.toString());
			  }
			  innerMap.put(key, l);
		}

		map.put("innerMap", innerMap);
		map.put("outterMap", outterMap);
		return map;

	}	
	/**
	 * 五线七口价格表取月指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/areaPricePortMonth", method = RequestMethod.POST)
	public Map<String, Object> areaPortMonthPrice(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		
		String number = request.getParameter("number");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");
	

		List<AbsoluteLine> selectIncomeMonth = absoluteRangeService.selectPriceMonthDate(start, end, brand, model);
		
		HashMap<String, Map<String,Object>> hashMap = new HashMap<String, Map<String,Object>>();		
		if(number!=""&&number.equals("价")) {		
			for(AbsoluteLine abo : selectIncomeMonth) {
				String fiveName = abo.getFiveName();
				String savenName = abo.getSavenName();
				
				if(!hashMap.keySet().contains(fiveName)) {
					hashMap.put(fiveName, new HashMap<String, Object>());
				}
				Map<String, Object> m = hashMap.get(fiveName);
				float saleprice = abo.getSALEPRICE();
				String str=String.valueOf(saleprice);
				m.put(savenName, str);
			}
			
			}
			
			if(number!=""&&number.equals("收")) {		
				for(AbsoluteLine abo : selectIncomeMonth) {
					String fiveName = abo.getFiveName();
					String savenName = abo.getSavenName();
					
					if(!hashMap.keySet().contains(fiveName)) {
						hashMap.put(fiveName, new HashMap<String, Object>());
					}
					Map<String, Object> m = hashMap.get(fiveName);
					float saleprice = abo.getAMOUNTPRICE();
					String str=String.valueOf(saleprice);
					m.put(savenName, str);
				}
				
				}
			if(number!=""&&number.equals("利")) {		
				for(AbsoluteLine abo : selectIncomeMonth) {
					String fiveName = abo.getFiveName();
					String savenName = abo.getSavenName();
					
					if(!hashMap.keySet().contains(fiveName)) {
						hashMap.put(fiveName, new HashMap<String, Object>());
					}
					Map<String, Object> m = hashMap.get(fiveName);
					float saleprice = abo.getSALECOSTPRICE();
					String str=String.valueOf(saleprice);
					m.put(savenName, str);
				}
				
				}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> innerMap = new LinkedHashMap<String, Object>();
		HashMap<String, Object> outterMap = new LinkedHashMap<String, Object>();
		for (Map.Entry<String, Map<String,Object>> entry : hashMap.entrySet()) { 
			  String key = entry.getKey();
			  Map<String,Object> valueMap = entry.getValue();
			  Long l = 0l;
			  for (Map.Entry<String, Object> entry2 : valueMap.entrySet()) { 
				  Object value = entry2.getValue();
				  outterMap.put(entry2.getKey(), value);
				  Double.parseDouble((String) (value.equals("")?"0":value));
				  //l += value==null?0:Long.parseLong(value.toString());
			  }
			  innerMap.put(key, l);
		}

		map.put("innerMap", innerMap);
		map.put("outterMap", outterMap);
		return map;

	}
	
	/**
	 * 存销量趋势表取日指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/directionDayNow", method = RequestMethod.POST)
	public Map<String, Object> cunDate(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");
	
		// 2018年销量
		List<StockSet> selectIncomeMonth = absoluteRangeService.selectDepositDay(start, end, brand, model);
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();

		
		if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

			for (StockSet obj : selectIncomeMonth) {
				dayListResuleSet.add(obj.getDODATE());
			}
			for (StockSet obj : selectIncomeMonth) {
				float saleprice = obj.getREALTIMEAMOUNT();
				String str=String.valueOf(saleprice);
				amountList.add(str);
			
			
			}
		}
		
	
		// 2017年销量
		List<StockSet> selectComeMonth = absoluteRangeService.selectLastYear(start, end, brand, model);
		List<String> timeIncomeDaysResuleSet = new ArrayList<String>();
		List<String> incomeDaysList = new ArrayList<String>();
		
		if (selectComeMonth != null && !selectComeMonth.isEmpty()) {

			for (StockSet obj : selectComeMonth) {
				String string = obj.getDODATE();
				String substring = string.substring(5);
				timeIncomeDaysResuleSet.add(substring);
			}
			for (StockSet obj : selectComeMonth) {
				
				float saleprice = obj.getREALTIMEAMOUNT();
				String str=String.valueOf(saleprice);
				incomeDaysList.add(str);
			}
		}
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", timeIncomeDaysResuleSet);
		map.put("1", amountList);
		map.put("2", incomeDaysList);
		map.put("3", dayListResuleSet);
		// map.put("4", incomeDaysList);

		return map;

	}		
	
	/**
	 * 存销量趋势表取月指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/directionMonthNow", method = RequestMethod.POST)
	public Map<String, Object> cunDateMonth(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");
	
		// 2018年销量
		List<StockSet> selectIncomeMonth = absoluteRangeService.selectDepositMonth(start, end, brand, model);
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();

		
		if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

			for (StockSet obj : selectIncomeMonth) {
				String string = obj.getDODATE();
				String substring = string.substring(5);
				dayListResuleSet.add(substring);
			}
			for (StockSet obj : selectIncomeMonth) {
				float saleprice = obj.getREALTIMEAMOUNT();
				String str=String.valueOf(saleprice);
				amountList.add(str);
			
			
			}
		}
		
	
		// 2017年销量
		List<StockSet> selectComeMonth = absoluteRangeService.selectLastYearMonth(start, end, brand, model);
		List<String> timeIncomeDaysResuleSet = new ArrayList<String>();
		List<String> incomeDaysList = new ArrayList<String>();
		
		if (selectComeMonth != null && !selectComeMonth.isEmpty()) {

			for (StockSet obj : selectComeMonth) {
				String string = obj.getDODATE();
				String substring = string.substring(5);
				timeIncomeDaysResuleSet.add(substring);
			}
			for (StockSet obj : selectComeMonth) {
				
				float saleprice = obj.getREALTIMEAMOUNT();
				String str=String.valueOf(saleprice);
				incomeDaysList.add(str);
			}
		}
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", timeIncomeDaysResuleSet);
		map.put("1", amountList);
		map.put("2", incomeDaysList);
		map.put("3", dayListResuleSet);
		// map.put("4", incomeDaysList);

		return map;

	}		
	
//汇总值数据进行取数
	
	
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/sumTotal", method = RequestMethod.POST)
	public AbsoluteRange sumToal(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {		
		
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");
		String line = request.getParameter("line");
        //若传过来的时间为日指标line=1为日指标，line=2为月指标
		AbsoluteRange ar=new AbsoluteRange();
		if(!line.equals("") && line.equals("1")) {
			//查询总销量值
			try {
				String amount = absoluteRangeService.selectTotalAmount(start, end, brand, model);
				if(amount!=null && !amount.equals("")) {
					ar.setAmount(amount);	
				}
				if(amount==null || amount.equals("")) {
					ar.setAmount("0");	
				}
				
				//查询总收入值
				Float income = absoluteRangeService.selectTotalIncome(start, end, brand, model);
				if(income!=null) {
					ar.setAMOUNTPRICE(income);
				}
				
				//查询出总覆盖值
				Float customer = absoluteRangeService.selectTotalCustomer(start, end, brand, model);
				if(customer!=null) {
					ar.setSALECOSTPRICE(customer);
				}
				ar.setSALECOSTPRICE(customer);
				//查询出总覆盖网点值
				Float store = absoluteRangeService.selectTotalStore(start, end, brand, model);
				if(store!=null) {
					ar.setSALEPRICE(store);
				}
				ar.setSALEPRICE(store);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			
			
			
		}
		if(!line.equals("") && line.equals("2")) {
			
			//查询总销量值
			try {
				String amount = absoluteRangeService.selectTotalAmountMonth(start, end, brand, model);
				if(amount!=null && !amount.equals("")) {
					ar.setAmount(amount);	
				}
				if(amount==null || amount.equals("")) {
					ar.setAmount("0");	
				}
				
				//查询总收入值
				Float income = absoluteRangeService.selectTotalIncomeMonth(start, end, brand, model);
				if(income!=null) {
					ar.setAMOUNTPRICE(income);
				}
				
				//查询出总覆盖值
				Float customer = absoluteRangeService.selectTotalCustomerMonth(start, end, brand, model);
				if(customer!=null) {
					ar.setSALECOSTPRICE(customer);
				}
				ar.setSALECOSTPRICE(customer);
				//查询出总覆盖网点值
				Float store = absoluteRangeService.selectTotalStoreMonth(start, end, brand, model);
				if(store!=null) {
					ar.setSALEPRICE(store);
				}
				ar.setSALEPRICE(store);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			
			
			
			
		}
		
		
		
		
		
		
		return ar;

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 根据月份，获取曲线图的月份范围集合
	 */
	public static List<String> getBetweenDays(String stratDayStr,String endDayStr){
		SimpleDateFormat year_Mon_DayFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date startDay = null;
		Date endDay = null;
		try {
			startDay = year_Mon_DayFormat.parse(stratDayStr);
			endDay = year_Mon_DayFormat.parse(endDayStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Calendar  startDayCal = Calendar.getInstance();
		Calendar  endDayCal = Calendar.getInstance();
		startDayCal.setTime(startDay);
		endDayCal.setTime(endDay);
		
		List<String> dayList = new ArrayList<String>();
		while(startDayCal.before(endDayCal)) {
			dayList.add(year_Mon_DayFormat.format(startDayCal.getTime()));
			startDayCal.add(Calendar.DAY_OF_YEAR, 1);
		}
		dayList.add(year_Mon_DayFormat.format(endDayCal.getTime()));
		return dayList;
	}

	
	
	
	
	
}
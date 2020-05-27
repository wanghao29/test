package com.asiainfo.cmc.controller.brandRangeSet;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
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

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.brandmodel.AbsoluteRange;
import com.asiainfo.cmc.enties.brandmodel.OderZhi;
import com.asiainfo.cmc.enties.brandmodel.OverCustomer;
import com.asiainfo.cmc.enties.brandmodel.ShareFen;
import com.asiainfo.cmc.enties.brandmodel.StockSet;
import com.asiainfo.cmc.service.brandmodel.AbsoluteRangeService;

@Controller
@RequestMapping(value = "/absoluteNew")
public class AbsoluteChangeNewDateController {

	@Resource
	private AbsoluteRangeService absoluteRangeService;
	/*@Resource
	private PlanSaleUtils planSaleUtils;*/
	
	/**
	 * 量
	 * 当前销量日指标和月指标
	 * @param locale
	 * @param models
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/liang", method = RequestMethod.POST)
	public Map<String,Object> indexs(Locale locale, Model models,HttpServletRequest request,HttpServletResponse response) {
		//PlanSaleUtils pt=new PlanSaleUtils();
		
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");
		String brand1 = request.getParameter("brand1");
		String model1 = request.getParameter("model1");
		String brand2 = request.getParameter("brand2");
		String model2 = request.getParameter("model2");
		//量  当前销量日指标数据
		
		
		List<AbsoluteRange> liang = absoluteRangeService.selectEveryDay(start, end, brand, model);
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();
		List<String> amountListed = new ArrayList<String>();
		
		
		if(liang.size()!=0&&!liang.isEmpty()) {
			
			for(AbsoluteRange obj : liang) {		
				dayListResuleSet.add(obj.getDODATE());
			}	
			for(AbsoluteRange obj : liang) {		
				amountList.add(obj.getAmount());
			}
		}
		
	    List<String> dayList = getBetweenDays(start, end);
		
		List<String> amountLists = new ArrayList<String>();
		for(String day : dayList) {
			if(dayListResuleSet.contains(day)) {
				for(AbsoluteRange obj : liang) {		
					if(day.equals(obj.getDODATE())) {
						String amount = obj.getAmount();
						int a = Integer.parseInt(amount);
						int b=a+3;
					String	s=String.valueOf(b);
					amountListed.add(s);
					
					}
				}
			}else {
				amountLists.add("0");
			}
		}
		
		
		
		
		
		//对标品销量日指标取数据
		
		List<AbsoluteRange> duibiao = absoluteRangeService.selectEveryDay(start, end,brand1, model1);
		List<String> duiResuleSet = new ArrayList<String>();
		if(duibiao!=null&&!duibiao.isEmpty()) {
		for(AbsoluteRange obj : duibiao) {		
			duiResuleSet.add(obj.getAmount());
		}
		}
		//竞品销量日指标取数据
		
		List<AbsoluteRange> date1 = absoluteRangeService.selectEveryDay(start, end, brand2, model2);
		
		List<String> date1ResuleSet = new ArrayList<String>();
		if(date1!=null&&!date1.isEmpty()) {
			
			for(AbsoluteRange obj : date1) {		
				date1ResuleSet.add(obj.getAmount());
			}
			
		}
		
		@SuppressWarnings("rawtypes")
		//List day = planSaleUtils.addAvgDate(start, end, brand, model);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("0", dayListResuleSet);
		map.put("1", amountList);
		//map.put("2", amountListed);				
		map.put("2", duiResuleSet);						
		map.put("3", date1ResuleSet);
		
		//规划销量
		
		
		//int day = absoluteRangeService.selectHowDay(DODATE, BRANDNAME, SPEC);
		return map;		
	}
	/**
	 * 量  的月指标取数据
	 * @param locale
	 * @param models
	 * @param request
	 * @param response
	 * @return
	 */
	//月指标
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/month", method = RequestMethod.POST)
	public Map<String, Object> monthed(Locale locale, Model models,HttpServletRequest request,HttpServletResponse response) {
		
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");
		String brand1 = request.getParameter("brand1");
		String model1 = request.getParameter("model1");
		String brand2 = request.getParameter("brand2");
		String model2 = request.getParameter("model2");
		// 当前销量  月指标取数据
		List<AbsoluteRange> everyMonth = absoluteRangeService.selectEveryMonth(start, end, brand, model);
		List<String> mostResuleSet = new ArrayList<String>();
		List<String> monthResuleSet = new ArrayList<String>();
		if(everyMonth!=null&&!everyMonth.isEmpty()) {
			for(AbsoluteRange obj:everyMonth) {
				
				monthResuleSet.add(obj.getDODATE()); 
						
			}
		
	    for(AbsoluteRange obj:everyMonth) {
				
		mostResuleSet.add(obj.getAmount()); 
							
			}
			
		}
		//规划月指标
		@SuppressWarnings("rawtypes")
		//List monthDatePlan = planSaleUtils.addAvgMonthDate(start, end, brand, model);
		
		
		
	    //对标品销量月指标取数据	
		  
		List<AbsoluteRange> monthDate = absoluteRangeService.selectEveryMonth(start, end, brand1, model1);
		
		List<String> duiResuleSet = new ArrayList<String>();
		List<String> biaoResuleSet = new ArrayList<String>();
		   if(monthDate!=null&&!monthDate.isEmpty()) {
			
			  for(AbsoluteRange obj:monthDate) {
					
				  duiResuleSet.add(obj.getDODATE()); 
		
				}
			  for(AbsoluteRange obj:monthDate) {
					
				  biaoResuleSet.add(obj.getAmount()); 

						}

		}
		//竞品销量月指标取数据
		   
		   List<AbsoluteRange> monthDate1 = absoluteRangeService.selectEveryMonth(start, end,  brand2, model2);
		   List<String> timeResuleSet = new ArrayList<String>();
			List<String> proResuleSet = new ArrayList<String>();
		  if(monthDate1!=null&&!monthDate1.isEmpty()) {
			for(AbsoluteRange obj:monthDate1) {
				
				timeResuleSet.add(obj.getDODATE());
				
			}
			
	       for(AbsoluteRange obj:monthDate1) {
				
	    	   proResuleSet.add(obj.getAmount());
				
			}
			
		}
		   

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("0", monthResuleSet);
		map.put("1", mostResuleSet);
		//map.put("2", monthDatePlan);
		map.put("2", biaoResuleSet);
		map.put("3", proResuleSet);
		
		return map;		
	}

	/**
	 *  价  表取数据日指标数据
	 */

	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/jiaDay", method = RequestMethod.POST)
	public Map<String,Object> indexed(Locale locale, Model models,HttpServletRequest request,HttpServletResponse response) {
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");
		String brand1 = request.getParameter("brand1");
		String model1 = request.getParameter("model1");
		String brand2 = request.getParameter("brand2");
		String model2 = request.getParameter("model2");
	      //本品价格
		List<AbsoluteRange> priceDay = absoluteRangeService.selectPriceDay(start, end, brand, model);
		 List<String> jiaTimeResuleSet = new ArrayList<String>();
		 List<String> priceTimeResuleSet = new ArrayList<String>();
	    if(priceDay!=null&&!priceDay.isEmpty()) {
	    	
	    	for(AbsoluteRange obj:priceDay) {
	    		
	    		jiaTimeResuleSet.add(obj.getDODATE());
	    	}
	    	
	      for(AbsoluteRange obj:priceDay) {
	    	 
	    	  float f = obj.getSALEPRICE();
	    	  
	    	  String str = String.valueOf(f);
	    	  priceTimeResuleSet.add(str);
	    	}	

	    }
	List<String> dayList = getBetweenDays(start, end);
		
		List<String> amountLists = new ArrayList<String>();
		for(String day : dayList) {
			if(jiaTimeResuleSet.contains(day)) {
				for(AbsoluteRange obj : priceDay) {		
					if(day.equals(obj.getDODATE())) {
						priceTimeResuleSet.add(obj.getAmount());
					}
				}
			}else {
				amountLists.add("0");
			}
		}
	    
	    
	   //本品二级市场价格
	  
	    List<AbsoluteRange> doubleDay = absoluteRangeService.selectPriceDay(start, end, brand2, model2);
	    //接收时间
	    List<String> doubleTimeResuleSet = new ArrayList<String>();
	    //接收金额
	    List<String> doubleResuleSet = new ArrayList<String>();
	    if(doubleDay!=null&&!doubleDay.isEmpty()) {
	    	
	    	for(AbsoluteRange obj:doubleDay) {
	    		
	    		doubleTimeResuleSet.add(obj.getDODATE());
	    	}
	    	
	      for(AbsoluteRange obj:doubleDay) {
              float f = obj.getSALEPRICE();
	    	  
	    	  String str = String.valueOf(f);
	    	  doubleResuleSet.add(str);
	    	}	

	    }
	    
	  //竞品二级市场价格
	    
	    List<AbsoluteRange> competitive = absoluteRangeService.selectPriceDay(start, end, brand1, model1);
	    
	    //接收时间
	    List<String> competitiveTimeResuleSet = new ArrayList<String>();
	    //接收金额
	    List<String> competitiveResuleSet = new ArrayList<String>();
	    if(competitive!=null&&!competitive.isEmpty()) {
	    	
	    	for(AbsoluteRange obj:competitive) {
	    		
	    		competitiveTimeResuleSet.add(obj.getDODATE());
	    	}
	    	
	      for(AbsoluteRange obj:competitive) {    	 
              float f = obj.getSALEPRICE();
	    	  
	    	  String str = String.valueOf(f);
	    	  competitiveResuleSet.add(str);
	    	}	

	    }
	    
	    
	    
	    Map<String,Object> map = new HashMap<String,Object>();
		map.put("0", jiaTimeResuleSet);
		map.put("1", priceTimeResuleSet);
		map.put("2", doubleResuleSet);
		map.put("3", competitiveResuleSet);

		
		return map;		




	}
	/**
	 *  价  表取数据月指标数据
	 */

	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/jiaMonth", method = RequestMethod.POST)
	public Map<String,Object> indexeds(Locale locale, Model models,HttpServletRequest request,HttpServletResponse response) {
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");
		String brand1 = request.getParameter("brand1");
		String model1 = request.getParameter("model1");
		String brand2 = request.getParameter("brand2");
		String model2 = request.getParameter("model2");
	    //本品价格
		List<AbsoluteRange> priceMonth = absoluteRangeService.selectPriceMonth(start, end, brand, model);
		 //接收时间
	    List<String> priceTimeResuleSet = new ArrayList<String>();
	    //接收金额
	    List<String> priceResuleSet = new ArrayList<String>();
	    if(priceMonth!=null&&!priceMonth.isEmpty()) {
	    	
	    	for(AbsoluteRange obj:priceMonth) {
	    		
	    		priceTimeResuleSet.add(obj.getDODATE());
	    	}
	    	
	      for(AbsoluteRange obj:priceMonth) {
	         float f = obj.getSALEPRICE();
	    	  
	    	  String str = String.valueOf(f);
	    	  priceResuleSet.add(str);
	    	  
	    	  
	    	}	

	    }
		
		
		
		//本品二级市场价格
		
	    List<AbsoluteRange> month = absoluteRangeService.selectPriceMonth(start, end, brand2, model2);
	    
	    
	   	 //接收时间
	       List<String> doubleTimeResuleSet = new ArrayList<String>();
	       //接收金额
	       List<String> doubleResuleSet = new ArrayList<String>();
	       if(priceMonth!=null&&!priceMonth.isEmpty()) {
	       	
	       	for(AbsoluteRange obj:month) {
	       		
	       		doubleTimeResuleSet.add(obj.getDODATE());
	       	}
	       	
	         for(AbsoluteRange obj:month) {
	        	 float f = obj.getSALEPRICE();
		    	  
		    	  String str = String.valueOf(f);
	        	 doubleResuleSet.add(str);
	       	  
	       	}	

	       }
	    
		
		
		
		//竞品二级市场价格
	       List<AbsoluteRange> monthCompetitive = absoluteRangeService.selectPriceMonth(start, end, brand1, model1);
	       
	       
	     	 //接收时间
	         List<String> doubleCompetitiveResuleSet = new ArrayList<String>();
	         //接收金额
	         List<String> competitiveResuleSet = new ArrayList<String>();
	         if(monthCompetitive!=null&&!monthCompetitive.isEmpty()) {
	         	
	         	for(AbsoluteRange obj:monthCompetitive) {
	         		
	         		doubleCompetitiveResuleSet.add(obj.getDODATE());
	         	}
	         	
	           for(AbsoluteRange obj:monthCompetitive) {
	        	   float f = obj.getSALEPRICE();
			    	  
			    	  String str = String.valueOf(f);
	        	   competitiveResuleSet.add(str);
	         	  
	         	}	

	         }
		
	    Map<String,Object> map = new HashMap<String,Object>();
	   	map.put("0", priceTimeResuleSet);
	   	map.put("1", priceResuleSet);
	   	map.put("2", doubleResuleSet);
	  	map.put("3", competitiveResuleSet);

	   	return map;		

	}

	/**
	 * 存各地市销量表取日指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/cunAreaDay", method = RequestMethod.POST)
	public Map<String, Object> areaDays(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		
		@SuppressWarnings("unused")
		String number = request.getParameter("number");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");


		
		List<StockSet> selectIncomeMonth = absoluteRangeService.cunAreaDay(start, end, brand, model);
		
		
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();
		
		
			if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

				for (StockSet obj : selectIncomeMonth) {
					dayListResuleSet.add(obj.getAREANAME());
				}
				for (StockSet obj : selectIncomeMonth) {
					
					float f = obj.getREALTIMEAMOUNT();

					String str = String.valueOf(f);
					amountList.add(str);
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
	 * 存各地市销量表取月指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/cunAreaMonth", method = RequestMethod.POST)
	public Map<String, Object> areaMonth(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		
		@SuppressWarnings("unused")
		String number = request.getParameter("number");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");

		List<StockSet> selectIncomeMonth = absoluteRangeService.cunAreaMonth(start, end, brand, model);

		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();	
			if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

				for (StockSet obj : selectIncomeMonth) {
					dayListResuleSet.add(obj.getAREANAME());
				}
				for (StockSet obj : selectIncomeMonth) {
					
					float f = obj.getREALTIMEAMOUNT();

					String str = String.valueOf(f);
					amountList.add(str);
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
	 * 份额销量趋势表取日指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/showDayNow", method = RequestMethod.POST)
	public Map<String, Object> cunDate(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");

		// 2018年销量
		List<ShareFen> selectIncomeMonth = absoluteRangeService.selectShareDayNow(start, end, brand, model);
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();

		
		if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

			for (ShareFen obj : selectIncomeMonth) {
				dayListResuleSet.add(obj.getDODATE());
			}
			for (ShareFen obj : selectIncomeMonth) {
				float saleprice = obj.getPROSHARE();
				String str=String.valueOf(saleprice);
				amountList.add(str);
			
			
			}
		}
		

		// 2017年销量
		List<ShareFen> selectComeMonth = absoluteRangeService.selectShareYearDayNow(start, end, brand, model);
		List<String> timeIncomeDaysResuleSet = new ArrayList<String>();
		List<String> incomeDaysList = new ArrayList<String>();
		
		if (selectComeMonth != null && !selectComeMonth.isEmpty()) {

			for (ShareFen obj : selectComeMonth) {
				String string = obj.getDODATE();
				String substring = string.substring(5);
				timeIncomeDaysResuleSet.add(substring);
			}
			for (ShareFen obj : selectComeMonth) {
				
				float saleprice = obj.getPROSHARE();
				String str=String.valueOf(saleprice);
				incomeDaysList.add(str);
			}
		}
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayListResuleSet);
		map.put("1", amountList);
		map.put("2", incomeDaysList);
		map.put("3", timeIncomeDaysResuleSet);
		// map.put("4", incomeDaysList);

		return map;

	}		

	/**
	 * 份额销量趋势表取月指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/showMonthNow", method = RequestMethod.POST)
	public Map<String, Object> cunDateMonth(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");

		// 2018年销量
		List<ShareFen> selectIncomeMonth = absoluteRangeService.selectSayMonthNow(start, end, brand, model);
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();

		
		if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

			for (ShareFen obj : selectIncomeMonth) {
				dayListResuleSet.add(obj.getDODATE());
			}
			for (ShareFen obj : selectIncomeMonth) {
				float saleprice = obj.getPROSHARE();
				String str=String.valueOf(saleprice);
				amountList.add(str);
			
			
			}
		}
		

		// 2017年销量
		List<ShareFen> selectComeMonth = absoluteRangeService.selectSayYearMonth(start, end, brand, model);
		List<String> timeIncomeDaysResuleSet = new ArrayList<String>();
		List<String> incomeDaysList = new ArrayList<String>();
		
		if (selectComeMonth != null && !selectComeMonth.isEmpty()) {

			for (ShareFen obj : selectComeMonth) {
				String string = obj.getDODATE();
				String substring = string.substring(5);
				timeIncomeDaysResuleSet.add(substring);
			}
			for (ShareFen obj : selectComeMonth) {
				
				float saleprice = obj.getPROSHARE();
				String str=String.valueOf(saleprice);
				incomeDaysList.add(str);
			}
		}
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayListResuleSet);
		map.put("1", amountList);
		map.put("2", incomeDaysList);
		map.put("3", timeIncomeDaysResuleSet);
		// map.put("4", incomeDaysList);

		return map;

	}		
	/**
	 * 份额各地市销量表取日指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/fenAreaDay", method = RequestMethod.POST)
	public Map<String, Object> areaFenDays(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		
		@SuppressWarnings("unused")
		String number = request.getParameter("number");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");


		
		List<ShareFen> selectIncomeMonth = absoluteRangeService.selectAreaShareDay(start, end, brand, model);
		
		
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();
		
		
			if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

				for (ShareFen obj : selectIncomeMonth) {
					dayListResuleSet.add(obj.getAREANAME());
				}
				for (ShareFen obj : selectIncomeMonth) {
					
					float f = obj.getPROSHARE();

					String str = String.valueOf(f);
					amountList.add(str);
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
	 * 份额各地市销量表取月指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/fenAreaMonth", method = RequestMethod.POST)
	public Map<String, Object> areaFenMonth(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		
		@SuppressWarnings("unused")
		String number = request.getParameter("number");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");

		List<ShareFen> selectIncomeMonth = absoluteRangeService.selectAreaShareMonth(start, end, brand, model);

		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();	
			if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

				for (ShareFen obj : selectIncomeMonth) {
					dayListResuleSet.add(obj.getAREANAME());
				}
				for (ShareFen obj : selectIncomeMonth) {
					
					float f = obj.getPROSHARE();

					String str = String.valueOf(f);
					amountList.add(str);
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
	 * 覆盖销量趋势表取日指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/coverDayNow", method = RequestMethod.POST)
	public Map<String, Object> coverDate(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");

		// 2018年销量
		List<OverCustomer> selectIncomeMonth = absoluteRangeService.selectCoverDayNow(start, end, brand, model);
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();

		
		if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

			for (OverCustomer obj : selectIncomeMonth) {
				dayListResuleSet.add(obj.getDODATE());
			}
			for (OverCustomer obj : selectIncomeMonth) {
				float saleprice = obj.getCnt();
				String str=String.valueOf(saleprice);
				amountList.add(str);
			
			
			}
		}
		

		// 2017年销量
		List<OverCustomer> selectComeMonth = absoluteRangeService.selectCoverYearDayNow(start, end, brand, model);
		List<String> timeIncomeDaysResuleSet = new ArrayList<String>();
		List<String> incomeDaysList = new ArrayList<String>();
		
		if (selectComeMonth != null && !selectComeMonth.isEmpty()) {

			for (OverCustomer obj : selectComeMonth) {
				String string = obj.getDODATE();
				String substring = string.substring(5);
				timeIncomeDaysResuleSet.add(substring);
			}
			for (OverCustomer obj : selectComeMonth) {
				
				float saleprice = obj.getCnt();
				String str=String.valueOf(saleprice);
				incomeDaysList.add(str);
			}
		}
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayListResuleSet);
		map.put("1", amountList);
		map.put("2", incomeDaysList);
		map.put("3", timeIncomeDaysResuleSet);
		// map.put("4", incomeDaysList);

		return map;

	}		

	/**
	 * 覆盖销量趋势表取月指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/coverMonthNow", method = RequestMethod.POST)
	public Map<String, Object> coverDateMonth(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");

		// 2018年销量
		List<OverCustomer> selectIncomeMonth = absoluteRangeService.selectCoverSayMonthNow(start, end, brand, model);
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();

		
		if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

			for (OverCustomer obj : selectIncomeMonth) {
				dayListResuleSet.add(obj.getDODATE());
			}
			for (OverCustomer obj : selectIncomeMonth) {
				float saleprice = obj.getCnt();
				String str=String.valueOf(saleprice);
				amountList.add(str);
			
			
			}
		}
		

		// 2017年销量
		List<OverCustomer> selectComeMonth = absoluteRangeService.selectCoverSayYearMonth(start, end, brand, model);
		List<String> timeIncomeDaysResuleSet = new ArrayList<String>();
		List<String> incomeDaysList = new ArrayList<String>();
		
		if (selectComeMonth != null && !selectComeMonth.isEmpty()) {

			for (OverCustomer obj : selectComeMonth) {
				String string = obj.getDODATE();
				String substring = string.substring(5);
				timeIncomeDaysResuleSet.add(substring);
			}
			for (OverCustomer obj : selectComeMonth) {
				
				float saleprice = obj.getCnt();
				String str=String.valueOf(saleprice);
				incomeDaysList.add(str);
			}
		}
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayListResuleSet);
		map.put("1", amountList);
		map.put("2", incomeDaysList);
		map.put("3", timeIncomeDaysResuleSet);
		// map.put("4", incomeDaysList);

		return map;

	}		
	/**
	 *覆盖各地市销量表取日指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/coverAreaDay", method = RequestMethod.POST)
	public Map<String, Object> coverFenDays(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		
		@SuppressWarnings("unused")
		String number = request.getParameter("number");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");


		
		List<OverCustomer> selectIncomeMonth = absoluteRangeService.selectCoverAreaShareDay(start, end, brand, model);
		
		
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();
		
		
			if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

				for (OverCustomer obj : selectIncomeMonth) {
					dayListResuleSet.add(obj.getAREANAME());
				}
				for (OverCustomer obj : selectIncomeMonth) {
					
					float f = obj.getCnt();

					String str = String.valueOf(f);
					amountList.add(str);
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
	 * 覆盖各地市销量表取月指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/coverAreaMonth", method = RequestMethod.POST)
	public Map<String, Object> coverFenMonth(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		
		@SuppressWarnings("unused")
		String number = request.getParameter("number");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");

		List<OverCustomer> selectIncomeMonth = absoluteRangeService.selectCoverAreaShareMonth(start, end, brand, model);

		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();	
			if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

				for (OverCustomer obj : selectIncomeMonth) {
					dayListResuleSet.add(obj.getAREANAME());
				}
				for (OverCustomer obj : selectIncomeMonth) {
					
					float f = obj.getCnt();

					String str = String.valueOf(f);
					amountList.add(str);
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
	 * 秩趋势表取日指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/orderDayNow", method = RequestMethod.POST)
	public Map<String, Object> orderDate(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");

		// 2018年销量
		List<OderZhi> selectIncomeMonth = absoluteRangeService.selectOrderDayNow(start, end, brand, model);
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();

		
		if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

			for (OderZhi obj : selectIncomeMonth) {
				dayListResuleSet.add(obj.getDODATE());
			}
			for (OderZhi obj : selectIncomeMonth) {
				float saleprice = obj.getLOCALRATIO();
				String str=String.valueOf(saleprice);
				amountList.add(str);
			
			
			}
		}
		

		// 2017年销量
		List<OderZhi> selectComeMonth = absoluteRangeService.selectOrderYearDayNow(start, end, brand, model);
		List<String> timeIncomeDaysResuleSet = new ArrayList<String>();
		List<String> incomeDaysList = new ArrayList<String>();
		
		if (selectComeMonth != null && !selectComeMonth.isEmpty()) {

			for (OderZhi obj : selectComeMonth) {
				timeIncomeDaysResuleSet.add(obj.getDODATE());
			}
			for (OderZhi obj : selectComeMonth) {
				
				float saleprice = obj.getLOCALRATIO();
				String str=String.valueOf(saleprice);
				incomeDaysList.add(str);
			}
		}
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayListResuleSet);
		map.put("1", amountList);
		map.put("2", incomeDaysList);
		map.put("3", timeIncomeDaysResuleSet);
		// map.put("4", incomeDaysList);

		return map;

	}		

	/**
	 * 秩趋势表取月指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/orderMonthNow", method = RequestMethod.POST)
	public Map<String, Object> orderDateMonth(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");

		// 2018年销量
		List<OderZhi> selectIncomeMonth = absoluteRangeService.selectOrderSayMonthNow(start, end, brand, model);
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();

		
		if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

			for (OderZhi obj : selectIncomeMonth) {
				dayListResuleSet.add(obj.getDODATE());
			}
			for (OderZhi obj : selectIncomeMonth) {
				float saleprice = obj.getLOCALRATIO();
				String str=String.valueOf(saleprice);
				amountList.add(str);
			
			
			}
		}
		

		// 2017年销量
		List<OderZhi> selectComeMonth = absoluteRangeService.selectOrderSayYearMonth(start, end, brand, model);
		List<String> timeIncomeDaysResuleSet = new ArrayList<String>();
		List<String> incomeDaysList = new ArrayList<String>();
		
		if (selectComeMonth != null && !selectComeMonth.isEmpty()) {

			for (OderZhi obj : selectComeMonth) {
				timeIncomeDaysResuleSet.add(obj.getDODATE());
			}
			for (OderZhi obj : selectComeMonth) {
				
				float saleprice = obj.getLOCALRATIO();
				String str=String.valueOf(saleprice);
				incomeDaysList.add(str);
			}
		}
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayListResuleSet);
		map.put("1", amountList);
		map.put("2", incomeDaysList);
		map.put("3", timeIncomeDaysResuleSet);
		// map.put("4", incomeDaysList);

		return map;

	}		
	/**
	 *秩各地市销量表取日指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/orderAreaDay", method = RequestMethod.POST)
	public Map<String, Object> orderFenDays(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		
		@SuppressWarnings("unused")
		String number = request.getParameter("number");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");


		
		List<OderZhi> selectIncomeMonth = absoluteRangeService.selectOrderAreaShareDay(start, end, brand, model);
		
		
		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();
		
		
			if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

				for (OderZhi obj : selectIncomeMonth) {
					dayListResuleSet.add(obj.getAREANAME());
				}
				for (OderZhi obj : selectIncomeMonth) {
					
					float f = obj.getLOCALRATIO();

					String str = String.valueOf(f);
					amountList.add(str);
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
	 * 秩各地市销量表取月指标数据
	 */
	@ResponseBody
	@DS("dataSource")@RequestMapping(value = "/orderAreaMonth", method = RequestMethod.POST)
	public Map<String, Object> orderFenMonth(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response) {
		
		@SuppressWarnings("unused")
		String number = request.getParameter("number");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String brand = request.getParameter("BRANDNAME");
		String model = request.getParameter("SPEC");

		List<OderZhi> selectIncomeMonth = absoluteRangeService.selectOrderAreaShareMonth(start, end, brand, model);

		List<String> dayListResuleSet = new ArrayList<String>();
		List<String> amountList = new ArrayList<String>();	
			if (selectIncomeMonth != null && !selectIncomeMonth.isEmpty()) {

				for (OderZhi obj : selectIncomeMonth) {
					dayListResuleSet.add(obj.getAREANAME());
				}
				for (OderZhi obj : selectIncomeMonth) {
					
					float f = obj.getLOCALRATIO();

					String str = String.valueOf(f);
					amountList.add(str);
				}
			}
			
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", amountList);
		map.put("1", dayListResuleSet);
		//map.put("2", incomeDaysList);
		//map.put("3", duiList);
		//map.put("4", incomeDaysList);

		return map;

	}

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
	public Map<String, Object> indexsed(Locale locale, Model models, HttpServletRequest request,
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
		List<AbsoluteRange> selectIncomeDays = absoluteRangeService.selectIncomeDay(start, end, brand1,
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
		List<AbsoluteRange> IncomeDays = absoluteRangeService.selectIncomeDay(start, end,  brand2, model2);
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
		//List dayIncome = planSaleUtils.incomePlanDay(start, end, brand, model);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayListResuleSet);
		map.put("1", amountList);
		//map.put("2", dayIncome);
		map.put("2", incomeDaysList);
		map.put("3", duiList);

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
	public Map<String, Object> indexedsed(Locale locale, Model models, HttpServletRequest request,
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
		//List dayShock = planSaleUtils.shockPlan(start, end, brand, model);		
		
		
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
	   // map.put("2", dayShock);
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
		//List monthShock = planSaleUtils.shockPlanMonth(start, end, brand, model);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayListResuleSet);
		map.put("1", amountList);
	    //map.put("2", monthShock);
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
	public Map<String, Object> indexedses(Locale locale, Model models, HttpServletRequest request,
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
		List<AbsoluteRange> selectIncomeMonths = absoluteRangeService.selectIncomeMonth(start, end,
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
		List<AbsoluteRange> selectComeMonth = absoluteRangeService.selectIncomeMonth(start, end, brand2,
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
		//List incomeCompetition = planSaleUtils.incomePlanMonth(start, end, brand, model);		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayListResuleSet);
		map.put("1", amountList);
		//map.put("2", incomeCompetition);
		map.put("2", duiList);
		map.put("3", incomeDaysList);

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
		String brand1 = request.getParameter("brand1");
		String model1 = request.getParameter("model1");
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
						//amountList.add(str);
						
					}
				}
			}else {
				amountLists.add("0");
			}
		}
		// 对标品利润指标取数据selectIncomeDays
		List<AbsoluteRange> selectIncomeMonths = absoluteRangeService.selectProfitDay(start, end,brand2, model2);
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
		//List day = planSaleUtils.profitPlan(start, end, brand, model);		
		
		
		// 竞品利润指标取数据selectIncomeDays
		List<AbsoluteRange> selectComeMonth = absoluteRangeService.selectProfitDay(start, end,brand1, model1);
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
		map.put("0", dayListResuleSet);
		map.put("1", amountList);
		//map.put("2", day);
		map.put("2", duiList);
		map.put("3", incomeDaysList);

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
		List<AbsoluteRange> selectIncomeMonths = absoluteRangeService.selectProfitMonth(start, end,
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
		List<AbsoluteRange> selectComeMonth = absoluteRangeService.selectProfitMonth(start, end, brand2, model2);
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
		//List MonthProfit = planSaleUtils.profitPlanMonth(start, end, brand, model);		
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayListResuleSet);
		map.put("1", amountList);
		//map.put("2", MonthProfit);
		map.put("2", duiList);
		map.put("3", incomeDaysList);

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
		//List shareDateDay = planSaleUtils.coverShare(start, end, brand, model);	
		
		
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
	   // map.put("2", shareDateDay);
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
		//List shareDateMonth = planSaleUtils.coverShareMonth(start, end, brand, model);	
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayListResuleSet);
		map.put("1", amountList);
		//map.put("2", shareDateMonth);
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
		//List dayCover = planSaleUtils.coverPlan(start, end, brand, model);	
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayListResuleSet);
		map.put("1", amountList);
		//map.put("2", dayCover);
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
		//List MonthCover = planSaleUtils.coverPlanMonth(start, end, brand, model);	
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("0", dayListResuleSet);
		map.put("1", amountList);
		//map.put("2", MonthCover);
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

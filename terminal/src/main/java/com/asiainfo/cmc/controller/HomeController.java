package com.asiainfo.cmc.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asiainfo.cmc.aopLog.SystemControllerLog;
import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.qudao.utils.MyDateFormat;
import com.asiainfo.cmc.qudao.vo.StoreBattleVo;
import com.asiainfo.cmc.service.impl.test;
 

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
 	@Autowired
	private test test;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
 	
	@DS("dataSource")@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(HttpServletRequest request ,Model model ) {
		//logger.info("Welcome home! The client locale is {}.", locale);
		String result = "home";
		//Date date = new Date();
		//DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		//String formattedDate = dateFormat.format(date);
		//test.getGoodsById(3);
		String special = request.getParameter("special");
		model.addAttribute("special", special );
		switch(special){
		case "CHANNEL":
			result = "forward:/customerChannel/index.do";
		    break;
		case "MONITOR":
			result = "businessIncome/business_income";
		    break;
		case "MODEL":
			result = "brandRangeSet/brandView";
		    break;
		case "CONSUMER":
			result = "consumerBigData/index";
		    break;
		}
		 
		 
		
		return result;
	}
    @RequiresPermissions("deepChanne:list")
	@DS("dataSource")@RequestMapping(value = "/CHANNEL", method = RequestMethod.GET)
	public String CHANNEL(HttpServletRequest request ,Model model ) {
		//logger.info("Welcome home! The client locale is {}.", locale);
		String result = "home";
		//Date date = new Date();
		//DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		//String formattedDate = dateFormat.format(date);
		//test.getGoodsById(3);
		String special = request.getParameter("special");
		model.addAttribute("special", special );
		switch(special){
		case "CHANNEL":
			result = "forward:/customerChannel/index.do";
		    break;
		case "MONITOR":
			result = "businessIncome/business_income";
		    break;
		case "MODEL":
			result = "brandRangeSet/brandView";
		    break;
		case "CONSUMER":
			result = "consumerBigData/index";
		    break;
		}
		 
		 
		
		return result;
	}
    @RequiresPermissions("productTrader:list")
	@DS("dataSource")@RequestMapping(value = "/MONITOR", method = RequestMethod.GET)
	public String MONITOR(HttpServletRequest request ,Model model ) {
		//logger.info("Welcome home! The client locale is {}.", locale);
		String result = "home";
		//Date date = new Date();
		//DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		//String formattedDate = dateFormat.format(date);
		//test.getGoodsById(3);
		String special = request.getParameter("special");
		model.addAttribute("special", special );
		switch(special){
		case "CHANNEL":
			result = "forward:/customerChannel/index.do";
		    break;
		case "MONITOR":
			result = "businessIncome/business_income";
		    break;
		case "MODEL":
			result = "brandRangeSet/brandView";
		    break;
		case "CONSUMER":
			result = "consumerBigData/index";
		    break;
		}
		 
		 
		
		return result;
	}
    
    @RequiresPermissions("productTrader:list")
	@DS("dataSource")@RequestMapping(value = "/MODEL", method = RequestMethod.GET)
	public String MODEL(HttpServletRequest request ,Model model ) {
		//logger.info("Welcome home! The client locale is {}.", locale);
		String result = "home";
		//Date date = new Date();
		//DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		//String formattedDate = dateFormat.format(date);
		//test.getGoodsById(3);
		String special = request.getParameter("special");
		model.addAttribute("special", special );
		switch(special){
		case "CHANNEL":
			result = "forward:/customerChannel/index.do";
		    break;
		case "MONITOR":
			result = "businessIncome/business_income";
		    break;
		case "MODEL":
			result = "brandRangeSet/brandView";
		    break;
		case "CONSUMER":
			result = "consumerBigData/index";
		    break;
		}
		 
		 
		
		return result;
	}
    
    @RequiresPermissions("consumerBigData:list")
	@DS("dataSource")@RequestMapping(value = "/CONSUMER", method = RequestMethod.GET)
	public String CONSUMER(HttpServletRequest request ,Model model ) {
		//logger.info("Welcome home! The client locale is {}.", locale);
		String result = "home";
		//Date date = new Date();
		//DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		//String formattedDate = dateFormat.format(date);
		//test.getGoodsById(3);
		String special = request.getParameter("special");
		model.addAttribute("special", special );
		switch(special){
		case "CHANNEL":
			result = "forward:/customerChannel/index.do";
		    break;
		case "MONITOR":
			result = "businessIncome/business_income";
		    break;
		case "MODEL":
			result = "brandRangeSet/brandView";
		    break;
		case "CONSUMER":
			result = "consumerBigData/index";
		    break;
		}
		 
		 
		
		return result;
	}
	@DS("dataSource")@RequestMapping(value = "/home1", method = RequestMethod.GET)
	public String home1(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home1";
	}
	
	@DS("dataSource")@RequestMapping(value = "/queryCityList", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<Map<String,String>>   queryCityList () {
		List<Map<String,String>>    citys = MyDateFormat.getCitys();
		
		
		return citys;
	}
	
	
}

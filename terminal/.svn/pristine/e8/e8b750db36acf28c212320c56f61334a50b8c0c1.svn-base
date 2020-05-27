package com.asiainfo.cmc.controller.brandRangeSet;



import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.service.brandmodel.LifeDateService;
import com.asiainfo.cmc.service.brandmodel.ProductInformationSetMajorService;
import com.asiainfo.cmc.service.brandmodel.QuantitySetService;

@Controller
@RequestMapping(value = "/quantitySet")
public class QuantitySetController {
	 //导入产品信息设置
		@Resource
		private ProductInformationSetMajorService productInformationSetMajorService;
		//生命周期
		@Resource
		private LifeDateService lifeDateService;
		@Resource
		private QuantitySetService qsuantitySetService;
	
	private static final Logger logger = LoggerFactory.getLogger(QuantitySetController.class);

	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model,HttpServletRequest request,
			HttpServletResponse response,HttpSession session) {
		logger.info("customerChannel  {}.", locale);	 
		@SuppressWarnings("unused")
		List<Object> list=new ArrayList<>();
		String brand=request.getParameter("BRANDNAME");
		 String spec=request.getParameter("SPEC");	
		 String COMPETBRANDNAME1=request.getParameter("brand1");	
		 String COMPETSPEC1=request.getParameter("model1");	
		 String COMPETBRANDNAME2=request.getParameter("brand2");	
		 String COMPETSPEC2=request.getParameter("model2");	
		 session.setAttribute("brand", brand);
		 session.setAttribute("spec", spec);
		 session.setAttribute("COMPETBRANDNAME1", COMPETBRANDNAME1);
		 session.setAttribute("COMPETSPEC1", COMPETSPEC1);
		 session.setAttribute("COMPETBRANDNAME2", COMPETBRANDNAME2);
		 session.setAttribute("COMPETSPEC2", COMPETSPEC2);
		 return "brandRangeSet/quantitySet1";
	}
	
	//显示所有的实时操盘数据到页面上	
  
	@DS("dataSource")@RequestMapping(value = "/show", method = RequestMethod.POST)
	public String showAll(Locale locale, Model models, HttpServletRequest request,
			HttpServletResponse response,HttpSession session) throws ParseException {
		logger.info("customerChannel  {}.", locale);	 
	
		//获取品牌和型号	
	Map<String,Object> map=new HashMap<String,Object>();
	//List<Object> list=new ArrayList<Object>();
	 String brand=request.getParameter("BRANDNAME");
	 String spec=request.getParameter("SPEC");	
	 String COMPETBRANDNAME1=request.getParameter("brand1");	
	 String COMPETSPEC1=request.getParameter("model1");	
	 String COMPETBRANDNAME2=request.getParameter("brand2");	
	 String COMPETSPEC2=request.getParameter("model2");		
	 map.put("brand", brand);
	 map.put("spec", spec);
	 map.put("COMPETBRANDNAME1", COMPETBRANDNAME1);
	 map.put("COMPETBRANDNAME2", COMPETBRANDNAME2);
	 map.put("COMPETSPEC1", COMPETSPEC1);
	 map.put("COMPETSPEC2", COMPETSPEC2);
	
	 /*String brand = (String) session.getAttribute("brand");
	 String spec =(String) session.getAttribute("spec");
	 String COMPETBRANDNAME1 = (String) session.getAttribute("COMPETBRANDNAME1");
	 String COMPETSPEC1 =(String) session.getAttribute("COMPETSPEC1");
	 String COMPETBRANDNAME2 = (String)((ServletRequest) session).getAttribute("COMPETBRANDNAME2");
	 String COMPETSPEC2 =(String) ((ServletRequest) session).getAttribute("COMPETSPEC2");
	*/ 
	 try {
		Map showAll = qsuantitySetService.showAll(brand, spec, COMPETBRANDNAME1, COMPETSPEC1, COMPETBRANDNAME2, COMPETSPEC2);
		 map.put("sname", showAll.get("sname"));
		 map.put("meterdes", showAll.get("meterdes"));
		
		/* Object sname = session.getAttribute("sname");
		 Object meterdes = session.getAttribute("meterdes");
		 map.put("sname", sname);
		 map.put("meterdes", meterdes);*/
		 
		 models.addAttribute("showAll", showAll);
	 } catch (Exception e) // Exception 为最大的异常
			{
			
			}
	 
	 
	     models.addAttribute("map", map);
	     return "brandRangeSet/quantitySet";
	} 
	
	
	
	//显示利润数据到实时操盘数据到页面上	
	  
		@DS("dataSource")@RequestMapping(value = "/li", method = RequestMethod.POST)
		public String liDate(Locale locale, Model models, HttpServletRequest request,
				HttpServletResponse response,HttpSession session) throws ParseException {
			logger.info("customerChannel  {}.", locale);	 
		
			//获取品牌和型号	
		Map<String,Object> map=new HashMap<String,Object>();
		//List<Object> list=new ArrayList<Object>();
		 String brand=request.getParameter("BRANDNAME");
		 String spec=request.getParameter("SPEC");	
		 String COMPETBRANDNAME1=request.getParameter("brand1");	
		 String COMPETSPEC1=request.getParameter("model1");	
		 String COMPETBRANDNAME2=request.getParameter("brand2");	
		 String COMPETSPEC2=request.getParameter("model2");		
		 map.put("brand", brand);
		 map.put("spec", spec);
		 map.put("COMPETBRANDNAME1", COMPETBRANDNAME1);
		 map.put("COMPETBRANDNAME2", COMPETBRANDNAME2);
		 map.put("COMPETSPEC1", COMPETSPEC1);
		 map.put("COMPETSPEC2", COMPETSPEC2);
		 
		 /*String brand = (String) session.getAttribute("brand");
		 String spec =(String) session.getAttribute("spec");
		 String COMPETBRANDNAME1 = (String) session.getAttribute("COMPETBRANDNAME1");
		 String COMPETSPEC1 =(String) session.getAttribute("COMPETSPEC1");
		 String COMPETBRANDNAME2 = (String)((ServletRequest) session).getAttribute("COMPETBRANDNAME2");
		 String COMPETSPEC2 =(String) ((ServletRequest) session).getAttribute("COMPETSPEC2");
		*/ 
		 try {
			 Map showAll = qsuantitySetService.showAllLi(brand, spec, COMPETBRANDNAME1, COMPETSPEC1, COMPETBRANDNAME2, COMPETSPEC2);
			 map.put("sname", showAll.get("sname"));
			 map.put("meterdes", showAll.get("meterdes"));
			 
			 
			 models.addAttribute("showAll", showAll);
		 } catch (Exception e) // Exception 为最大的异常
				{
				
				}
		 
		 
		     models.addAttribute("map", map);
		     return "brandRangeSet/profit";
		} 
	
		//显示收入数据到实时操盘数据到页面上	
		  
			@DS("dataSource")@RequestMapping(value = "/income", method = RequestMethod.POST)
			public String incomeDate(Locale locale, Model models, HttpServletRequest request,
					HttpServletResponse response,HttpSession session) throws ParseException {
				logger.info("customerChannel  {}.", locale);	 
			
				//获取品牌和型号	
			Map<String,Object> map=new HashMap<String,Object>();
			//List<Object> list=new ArrayList<Object>();
			 String brand=request.getParameter("BRANDNAME");
			 String spec=request.getParameter("SPEC");	
			 String COMPETBRANDNAME1=request.getParameter("brand1");	
			 String COMPETSPEC1=request.getParameter("model1");	
			 String COMPETBRANDNAME2=request.getParameter("brand2");	
			 String COMPETSPEC2=request.getParameter("model2");		
			 map.put("brand", brand);
			 map.put("spec", spec);
			 map.put("COMPETBRANDNAME1", COMPETBRANDNAME1);
			 map.put("COMPETBRANDNAME2", COMPETBRANDNAME2);
			 map.put("COMPETSPEC1", COMPETSPEC1);
			 map.put("COMPETSPEC2", COMPETSPEC2);
			 
			 /*String brand = (String) session.getAttribute("brand");
			 String spec =(String) session.getAttribute("spec");
			 String COMPETBRANDNAME1 = (String) session.getAttribute("COMPETBRANDNAME1");
			 String COMPETSPEC1 =(String) session.getAttribute("COMPETSPEC1");
			 String COMPETBRANDNAME2 = (String)((ServletRequest) session).getAttribute("COMPETBRANDNAME2");
			 String COMPETSPEC2 =(String) ((ServletRequest) session).getAttribute("COMPETSPEC2");
			*/ 
				Map showAll = qsuantitySetService.showAllincome(brand, spec, COMPETBRANDNAME1, COMPETSPEC1, COMPETBRANDNAME2, COMPETSPEC2);
				 map.put("sname", showAll.get("sname"));
				 map.put("meterdes", showAll.get("meterdes"));
				models.addAttribute("showAll", showAll);
			     models.addAttribute("map", map);
			     return "brandRangeSet/income";
			}
	
			//显示覆盖数据到实时操盘数据到页面上	
			  
			@DS("dataSource")@RequestMapping(value = "/cover", method = RequestMethod.POST)
			public String coverDate(Locale locale, Model models, HttpServletRequest request,
					HttpServletResponse response,HttpSession session) throws ParseException {
				logger.info("customerChannel  {}.", locale);	 
			
				//获取品牌和型号	
			Map<String,Object> map=new HashMap<String,Object>();
			//List<Object> list=new ArrayList<Object>();
			 String brand=request.getParameter("BRANDNAME");
			 String spec=request.getParameter("SPEC");	
			 String COMPETBRANDNAME1=request.getParameter("brand1");	
			 String COMPETSPEC1=request.getParameter("model1");	
			 String COMPETBRANDNAME2=request.getParameter("brand2");	
			 String COMPETSPEC2=request.getParameter("model2");		
			 map.put("brand", brand);
			 map.put("spec", spec);
			 map.put("COMPETBRANDNAME1", COMPETBRANDNAME1);
			 map.put("COMPETBRANDNAME2", COMPETBRANDNAME2);
			 map.put("COMPETSPEC1", COMPETSPEC1);
			 map.put("COMPETSPEC2", COMPETSPEC2);
			 
			 /*String brand = (String) session.getAttribute("brand");
			 String spec =(String) session.getAttribute("spec");
			 String COMPETBRANDNAME1 = (String) session.getAttribute("COMPETBRANDNAME1");
			 String COMPETSPEC1 =(String) session.getAttribute("COMPETSPEC1");
			 String COMPETBRANDNAME2 = (String)((ServletRequest) session).getAttribute("COMPETBRANDNAME2");
			 String COMPETSPEC2 =(String) ((ServletRequest) session).getAttribute("COMPETSPEC2");
			*/ 
			 try {
				 Map showAll = qsuantitySetService.showAllcover(brand, spec, COMPETBRANDNAME1, COMPETSPEC1, COMPETBRANDNAME2, COMPETSPEC2);
				 map.put("sname", showAll.get("sname"));
				 map.put("meterdes", showAll.get("meterdes"));
				 models.addAttribute("showAll", showAll);
			 } catch (Exception e) // Exception 为最大的异常
					{
					
					}
			
			    
				
				
			     models.addAttribute("map", map);
			     return "brandRangeSet/cover";
			}
			
			
			
			//显示库存 数据到实时操盘数据到页面上	
			  
			@DS("dataSource")@RequestMapping(value = "/stock", method = RequestMethod.POST)
			public String stockDate(Locale locale, Model models, HttpServletRequest request,
					HttpServletResponse response,HttpSession session) throws ParseException {
				logger.info("customerChannel  {}.", locale);	 
			
				//获取品牌和型号	
			Map<String,Object> map=new HashMap<String,Object>();
			//List<Object> list=new ArrayList<Object>();
			 String brand=request.getParameter("BRANDNAME");
			 String spec=request.getParameter("SPEC");	
			 String COMPETBRANDNAME1=request.getParameter("brand1");	
			 String COMPETSPEC1=request.getParameter("model1");	
			 String COMPETBRANDNAME2=request.getParameter("brand2");	
			 String COMPETSPEC2=request.getParameter("model2");		
			 map.put("brand", brand);
			 map.put("spec", spec);
			 map.put("COMPETBRANDNAME1", COMPETBRANDNAME1);
			 map.put("COMPETBRANDNAME2", COMPETBRANDNAME2);
			 map.put("COMPETSPEC1", COMPETSPEC1);
			 map.put("COMPETSPEC2", COMPETSPEC2);
			 
			 /*String brand = (String) session.getAttribute("brand");
			 String spec =(String) session.getAttribute("spec");
			 String COMPETBRANDNAME1 = (String) session.getAttribute("COMPETBRANDNAME1");
			 String COMPETSPEC1 =(String) session.getAttribute("COMPETSPEC1");
			 String COMPETBRANDNAME2 = (String)((ServletRequest) session).getAttribute("COMPETBRANDNAME2");
			 String COMPETSPEC2 =(String) ((ServletRequest) session).getAttribute("COMPETSPEC2");
			*/ 
			 try {
				 Map showAll = qsuantitySetService.showAllstock(brand, spec, COMPETBRANDNAME1, COMPETSPEC1, COMPETBRANDNAME2, COMPETSPEC2);
				 map.put("sname", showAll.get("sname"));
				 map.put("meterdes", showAll.get("meterdes"));
				 models.addAttribute("showAll", showAll);
			 } catch (Exception e) // Exception 为最大的异常
					{
					
					}
			 
			
			     models.addAttribute("map", map);
			     return "brandRangeSet/stock";
			}
			
			//显示份额数据到实时操盘数据到页面上	
			  
			@DS("dataSource")@RequestMapping(value = "/share", method = RequestMethod.POST)
			public String shareDate(Locale locale, Model models, HttpServletRequest request,
					HttpServletResponse response,HttpSession session) throws ParseException {
				logger.info("customerChannel  {}.", locale);	 
			
				//获取品牌和型号	
			Map<String,Object> map=new HashMap<String,Object>();
			//List<Object> list=new ArrayList<Object>();
			 String brand=request.getParameter("BRANDNAME");
			 String spec=request.getParameter("SPEC");	
			 String COMPETBRANDNAME1=request.getParameter("brand1");	
			 String COMPETSPEC1=request.getParameter("model1");	
			 String COMPETBRANDNAME2=request.getParameter("brand2");	
			 String COMPETSPEC2=request.getParameter("model2");		
			 map.put("brand", brand);
			 map.put("spec", spec);
			 map.put("COMPETBRANDNAME1", COMPETBRANDNAME1);
			 map.put("COMPETBRANDNAME2", COMPETBRANDNAME2);
			 map.put("COMPETSPEC1", COMPETSPEC1);
			 map.put("COMPETSPEC2", COMPETSPEC2);
			 
			 /*String brand = (String) session.getAttribute("brand");
			 String spec =(String) session.getAttribute("spec");
			 String COMPETBRANDNAME1 = (String) session.getAttribute("COMPETBRANDNAME1");
			 String COMPETSPEC1 =(String) session.getAttribute("COMPETSPEC1");
			 String COMPETBRANDNAME2 = (String)((ServletRequest) session).getAttribute("COMPETBRANDNAME2");
			 String COMPETSPEC2 =(String) ((ServletRequest) session).getAttribute("COMPETSPEC2");
			*/ 
			 try {
				 Map showAll = qsuantitySetService.showAllshare(brand, spec, COMPETBRANDNAME1, COMPETSPEC1, COMPETBRANDNAME2, COMPETSPEC2);
				 map.put("sname", showAll.get("sname"));
				 map.put("meterdes", showAll.get("meterdes"));
				 models.addAttribute("showAll", showAll);
			 } catch (Exception e) // Exception 为最大的异常
					{
					
					}
			 
			
			     models.addAttribute("map", map);
			     return "brandRangeSet/share";
			}	
			
			//显示秩序数据到实时操盘数据到页面上	
			  
			@DS("dataSource")@RequestMapping(value = "/order", method = RequestMethod.POST)
			public String orderDate(Locale locale, Model models, HttpServletRequest request,
					HttpServletResponse response,HttpSession session) throws ParseException {
				logger.info("customerChannel  {}.", locale);	 
			
				//获取品牌和型号	
			Map<String,Object> map=new HashMap<String,Object>();
			//List<Object> list=new ArrayList<Object>();
			 String brand=request.getParameter("BRANDNAME");
			 String spec=request.getParameter("SPEC");	
			 String COMPETBRANDNAME1=request.getParameter("brand1");	
			 String COMPETSPEC1=request.getParameter("model1");	
			 String COMPETBRANDNAME2=request.getParameter("brand2");	
			 String COMPETSPEC2=request.getParameter("model2");		
			 map.put("brand", brand);
			 map.put("spec", spec);
			 map.put("COMPETBRANDNAME1", COMPETBRANDNAME1);
			 map.put("COMPETBRANDNAME2", COMPETBRANDNAME2);
			 map.put("COMPETSPEC1", COMPETSPEC1);
			 map.put("COMPETSPEC2", COMPETSPEC2);
			 
			 /*String brand = (String) session.getAttribute("brand");
			 String spec =(String) session.getAttribute("spec");
			 String COMPETBRANDNAME1 = (String) session.getAttribute("COMPETBRANDNAME1");
			 String COMPETSPEC1 =(String) session.getAttribute("COMPETSPEC1");
			 String COMPETBRANDNAME2 = (String)((ServletRequest) session).getAttribute("COMPETBRANDNAME2");
			 String COMPETSPEC2 =(String) ((ServletRequest) session).getAttribute("COMPETSPEC2");
			*/ 
		
				 Map showAll = qsuantitySetService.showAllorder(brand, spec, COMPETBRANDNAME1, COMPETSPEC1, COMPETBRANDNAME2, COMPETSPEC2);
				 map.put("sname", showAll.get("sname"));
				 map.put("meterdes", showAll.get("meterdes"));
				 models.addAttribute("showAll", showAll);
			
			 
			
			     models.addAttribute("map", map);
			     return "brandRangeSet/order";
			}
			//显示价格数据到实时操盘数据到页面上	
			  
			@DS("dataSource")@RequestMapping(value = "/price", method = RequestMethod.POST)
			public String priceDate(Locale locale, Model models, HttpServletRequest request,
					HttpServletResponse response,HttpSession session) throws ParseException {
				logger.info("customerChannel  {}.", locale);	 
			
				//获取品牌和型号	
			Map<String,Object> map=new HashMap<String,Object>();
			//List<Object> list=new ArrayList<Object>();
			 String brand=request.getParameter("BRANDNAME");
			 String spec=request.getParameter("SPEC");	
			 String COMPETBRANDNAME1=request.getParameter("brand1");	
			 String COMPETSPEC1=request.getParameter("model1");	
			 String COMPETBRANDNAME2=request.getParameter("brand2");	
			 String COMPETSPEC2=request.getParameter("model2");		
			 map.put("brand", brand);
			 map.put("spec", spec);
			 map.put("COMPETBRANDNAME1", COMPETBRANDNAME1);
			 map.put("COMPETBRANDNAME2", COMPETBRANDNAME2);
			 map.put("COMPETSPEC1", COMPETSPEC1);
			 map.put("COMPETSPEC2", COMPETSPEC2);
			 
			 /*String brand = (String) session.getAttribute("brand");
			 String spec =(String) session.getAttribute("spec");
			 String COMPETBRANDNAME1 = (String) session.getAttribute("COMPETBRANDNAME1");
			 String COMPETSPEC1 =(String) session.getAttribute("COMPETSPEC1");
			 String COMPETBRANDNAME2 = (String)((ServletRequest) session).getAttribute("COMPETBRANDNAME2");
			 String COMPETSPEC2 =(String) ((ServletRequest) session).getAttribute("COMPETSPEC2");
			*/ 
			 try {
				 Map showAll = qsuantitySetService.showAllprice(brand, spec, COMPETBRANDNAME1, COMPETSPEC1, COMPETBRANDNAME2, COMPETSPEC2);
				 map.put("sname", showAll.get("sname"));
				 map.put("meterdes", showAll.get("meterdes"));
				 models.addAttribute("showAll", showAll);
			 } catch (Exception e) // Exception 为最大的异常
					{
					
					}
			 
			     models.addAttribute("map", map);
			     return "brandRangeSet/price";
			}
			//显示价格数据到实时操盘数据到页面上	
			  
			
			
	
}

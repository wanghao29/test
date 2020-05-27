package com.asiainfo.cmc.controller.weekReporter;


import java.text.DecimalFormat;
import java.util.ArrayList;
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
import com.asiainfo.cmc.enties.weekReport.Salf4G;

import com.asiainfo.cmc.service.weekReport.Salf4GService;

@Controller
@RequestMapping(value = "/selfAmount")
public class SelfAmountController {
	@Resource
	private Salf4GService salf4GService;
	
	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
			 
		return "weekReporter/self4G";
	}



	//对合约机销量及份额的数据进行取值
		@ResponseBody
		@DS("dataSource")@RequestMapping(value = "/sale", method = RequestMethod.POST)
		public Map<String, Object> amountSale(Locale locale, Model models, HttpServletRequest request,
				HttpServletResponse response) {
			List<String> shared = new ArrayList<String>();
			//时间集合
			List<String> time = new ArrayList<String>();
			//销量集合
			List<String> amount = new ArrayList<String>();
			//获取月指标数据进行返回页面	
		   String innit1 = request.getParameter("dodate");
		   String innit2 = request.getParameter("dodate1");
		   String text = request.getParameter("text");
		       //对月份进行拼接
		   String dodate=innit1+innit2.substring(0, 3);
		   String dodate1=innit1+innit2.substring(3);
		   //取分销表中的销量统计值
		    List<Salf4G> distribution = salf4GService.selectMonthDistribution(dodate, dodate1);
		  //取零售表中的销量统计值
		   
		    for (int i = 0;i < distribution.size(); i++) {
		    	 if (distribution.get(i) != null) {
		    for (Salf4G obj : distribution) {
			
		    	   float zdamount = obj.getZdamount();//我司合约机销量
			       float zdamountes=zdamount/10000;
			       DecimalFormat pp = new DecimalFormat("0.00");
			       String zdamountted = pp.format((float)zdamountes);
			   
			       float ydamount = obj.getYdamount();//广东移动合约机销量
			       float ydamountes=ydamount/10000;
			      
			       String ydamountted = pp.format((float)ydamountes);
			      
//			       if(zdamount!=0 &&ydamount!=0 ) {
//			    	   DecimalFormat df = new DecimalFormat("0.00");
//			    	   String share3 = df.format((float)zdamount/ydamount*100);
//			    	  // int share= zdamount/ydamount*100;//我司合约机份额 
//			    	 // String e = String.valueOf(share);
//			    	  // String share=share3+"%";
//			    	   shared.add(share3);
//			       }
			      		       		     
			       
			       String str = String.valueOf(zdamountted);
			       
			       String str1 = String.valueOf(ydamountted);
			       
			       amount.add(str);
			       shared.add(str1);
			       time.add(text);
		   }
		    
		    }
		   //我司合约机销量=分销表中的销量+零售表中的销量

		    }
		    Map<String, Object> map = new HashMap<String, Object>(); 
		    map.put("0", time);
			map.put("1", amount);
			map.put("2", shared);
		    return map;	 
		}


		//对合约机销量及份额的数据进行取值
			@ResponseBody
			@DS("dataSource")@RequestMapping(value = "/saleMonth", method = RequestMethod.POST)
			public Map<String, Object> amountSale1(Locale locale, Model models, HttpServletRequest request,
					HttpServletResponse response) {
				List<String> shared = new ArrayList<String>();
				//时间集合
				List<String> time = new ArrayList<String>();
				//销量集合
				List<String> amount = new ArrayList<String>();
				//获取月指标数据进行返回页面	
			   /*String innit1 = request.getParameter("dodate");
			   String innit2 = request.getParameter("dodate1");
			   String text = request.getParameter("text");*/
			       //对月份进行拼接
			   String dodate=request.getParameter("dodate");
			   String dodate1=request.getParameter("dodate1");
			   //取分销表中的销量统计值
			    List<Salf4G> distribution = salf4GService.selectMonthRetail(dodate, dodate1);
			  //取零售表中的销量统计值
		
			    for (Salf4G obj : distribution) {
				
			    	float zdamount = obj.getZdamount();//我司合约机销量
				       float zdamountes=zdamount/10000;
				       DecimalFormat pp = new DecimalFormat("0.00");
				       String zdamountted = pp.format((float)zdamountes);
				   
				       float ydamount = obj.getYdamount();//广东移动合约机销量
				       float ydamountes=ydamount/10000;
				      
				       String ydamountted = pp.format((float)ydamountes);
				       String month = obj.getMonth();
//				       if(zdamount!=0 &&ydamount!=0 ) {
//				    	   DecimalFormat df = new DecimalFormat("0.00");
//				    	   String share3 = df.format((float)zdamount/ydamount*100);
//				    	  // int share= zdamount/ydamount*100;//我司合约机份额 
//				    	 // String e = String.valueOf(share);
//				    	  // String share=share3+"%";
//				    	   shared.add(share3);
//				       }
				      		       		     
				       
				       String str = String.valueOf(zdamountted);
				       
				       String str1 = String.valueOf(ydamountted);
				       
				       shared.add(str1);
				       amount.add(str);
				       
				       time.add(month);
			   }
			    
			    
			   //我司合约机销量=分销表中的销量+零售表中的销量

			    
			    Map<String, Object> map = new HashMap<String, Object>(); 
			    map.put("0", time);
				map.put("1", amount);
				map.put("2", shared);
			    return map;	 
			}



			//对合约机销量及份额的数据进行取值
					@ResponseBody
					@DS("dataSource")@RequestMapping(value = "/saleYear", method = RequestMethod.POST)
					public Map<String, Object> amountSale2(Locale locale, Model models, HttpServletRequest request,
							HttpServletResponse response) {
						List<String> shared = new ArrayList<String>();
						//时间集合
						List<String> time = new ArrayList<String>();
						//销量集合
						List<String> amount = new ArrayList<String>();
						//获取月指标数据进行返回页面	
					   /*String innit1 = request.getParameter("dodate");
					   String innit2 = request.getParameter("dodate1");
					   String text = request.getParameter("text");*/
					       //对月份进行拼接
					   String dodated=request.getParameter("dodate");
					   String dodate=dodated+"-01";
					   String dodate6=request.getParameter("dodate1");
					   String dodate1=dodate6+"-12";
					   //取分销表中的销量统计值
					    List<Salf4G> distribution = salf4GService.selectMonthRetail1(dodate, dodate1);
					  //取零售表中的销量统计值
					    for (int i = 0;i < distribution.size(); i++) {
					    	 if (distribution.get(i) != null) {
					    for (Salf4G obj : distribution) {
						
					    	float zdamount = obj.getZdamount();//我司合约机销量
						       float zdamountes=zdamount/10000;
						       DecimalFormat pp = new DecimalFormat("0.00");
						       String zdamountted = pp.format((float)zdamountes);
						   
						       float ydamount = obj.getYdamount();//广东移动合约机销量
						       float ydamountes=ydamount/10000;
						      
						       String ydamountted = pp.format((float)ydamountes);
						       String month = obj.getMonth();
//						       if(zdamount!=0 &&ydamount!=0 ) {
//						    	   DecimalFormat df = new DecimalFormat("0.00");
//						    	   String share3 = df.format((float)zdamount/ydamount*100);
//						    	  // int share= zdamount/ydamount*100;//我司合约机份额 
//						    	 // String e = String.valueOf(share);
//						    	  // String share=share3+"%";
//						    	   shared.add(share3);
//						       }
						      		       		     
						       
						       String str = String.valueOf(zdamountted);
						       
						       String str1 = String.valueOf(ydamountted);
						       
						       shared.add(str1);
						       amount.add(str);
						       
						       time.add(month);
					   }
					    
					    	 }
					   //我司合约机销量=分销表中的销量+零售表中的销量

					    	 }
					    Map<String, Object> map = new HashMap<String, Object>(); 
					    map.put("0", time);
						map.put("1", amount);
						map.put("2", shared);
					    return map;	 
					}








}

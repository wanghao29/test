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
import com.asiainfo.cmc.enties.brandmodel.OverCustomers;
import com.asiainfo.cmc.enties.weekReport.DMAmount;
import com.asiainfo.cmc.qudao.utils.MyDateFormat;
import com.asiainfo.cmc.service.weekReport.DMAmountService;


@Controller
@RequestMapping(value = "/dmDate")
public class DmDateController {
	@Resource
	private DMAmountService dMAmountService;
	
	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
			 
		return "weekReporter/dmView";
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
	    List<DMAmount> distribution = dMAmountService.selectMonthDistribution(dodate, dodate1);
	  //取零售表中的销量统计值
	   
	    for (int i = 0;i < distribution.size(); i++) {
	    	 if (distribution.get(i) != null) {
	    for (DMAmount obj : distribution) {
		
		       float zdamounted = obj.getYdratio();//我司合约机销量
		       float zdamountes=zdamounted*100;
		       DecimalFormat pp = new DecimalFormat("0.00");
		       String zdamount = pp.format((float)zdamountes);
		       float ydamounted = obj.getAllratio();//广东移动合约机销量
		       float ydamountes=ydamounted*100;
		      // DecimalFormat tt = new DecimalFormat("0.00");
		       String ydamount = pp.format((float)ydamountes);
//		       if(zdamount!=0 &&ydamount!=0 ) {
//		    	   DecimalFormat df = new DecimalFormat("0.00");
//		    	   String share3 = df.format((float)zdamount/ydamount*100);
//		    	  // int share= zdamount/ydamount*100;//我司合约机份额 
//		    	 // String e = String.valueOf(share);
//		    	  // String share=share3+"%";
//		    	   shared.add(share3);
//		       }
		      		       		     
		       
		       String str = String.valueOf(zdamount);
		       
		       String str1 = String.valueOf(ydamount);
		       
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
		    List<DMAmount> distribution = dMAmountService.selectMonthRetail(dodate, dodate1);
		  //取零售表中的销量统计值
	
		    for (DMAmount obj : distribution) {
		    	DecimalFormat  mFormat = new DecimalFormat("0.00");
		    	   float zdamount1 = obj.getYdratio();//我司合约机销量
		    	   float zdamount= zdamount1*100;
		    	
		    	   String formatNum = mFormat .format(zdamount );
		    	   
			       float ydamount1 = obj.getAllratio();//广东移动合约机销量
			       float ydamount=ydamount1*100;
			       String YformatNum = mFormat .format(ydamount );
			       String month = obj.getMonth();
//			       if(zdamount!=0 &&ydamount!=0 ) {
//			    	   DecimalFormat df = new DecimalFormat("0.00");
//			    	   String share3 = df.format((float)zdamount/ydamount*100);
//			    	  // int share= zdamount/ydamount*100;//我司合约机份额 
//			    	 // String e = String.valueOf(share);
//			    	  // String share=share3+"%";
//			    	   shared.add(share3);
//			       }
			      		       		     
			       
			       String str = String.valueOf(formatNum);
			       
			       String str1 = String.valueOf(YformatNum);
			       
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
				    List<DMAmount> distribution = dMAmountService.selectMonthRetail1(dodate, dodate1);
				  //取零售表中的销量统计值
				    for (int i = 0;i < distribution.size(); i++) {
				    	 if (distribution.get(i) != null) {
				    for (DMAmount obj : distribution) {
					
				    	   float zdamounted = obj.getYdratio();//我司合约机销量
				    	   float zdamountes=zdamounted*100;
					       DecimalFormat pp = new DecimalFormat("0.00");
					       String zdamount = pp.format((float)zdamountes);
						   
					       float ydamounted = obj.getAllratio();//广东移动合约机销量
					       float ydamountes=ydamounted*100;
					      // DecimalFormat pp = new DecimalFormat("0.00");
					       String ydamount = pp.format((float)ydamountes);
					       String month = obj.getMonth();
//					       if(zdamount!=0 &&ydamount!=0 ) {
//					    	   DecimalFormat df = new DecimalFormat("0.00");
//					    	   String share3 = df.format((float)zdamount/ydamount*100);
//					    	  // int share= zdamount/ydamount*100;//我司合约机份额 
//					    	 // String e = String.valueOf(share);
//					    	  // String share=share3+"%";
//					    	   shared.add(share3);
//					       }
					      		       		     
					       
					       String str = String.valueOf(zdamount);
					       String str1 = String.valueOf(ydamount);
					       
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
	
	
				
			
				@ResponseBody
				@DS("dataSource")@RequestMapping(value = "/getCoverBrandSum", method = RequestMethod.POST)
				public Map<String, Object> CoverBrandSum(Locale locale, Model models, HttpServletRequest request,
						HttpServletResponse response) {
					Map<String,Object> data = new HashMap<String,Object>();
					//Map<String,Object> top = new HashMap<String,Object>();
					List<Integer> amount = new ArrayList<Integer>();
					OverCustomers vo=new OverCustomers();
					String dodate = request.getParameter("dodate");
					if(!dodate.equals("")) {
					vo.setDODATE(dodate);
					}
					
					String name = request.getParameter("areaname");
					if(!name.equals("")) {
						vo.setAREANAME(name);
						}
					String brand = request.getParameter("brandname");
					if(!brand.equals("")) {
						vo.setBRANDNAME(brand);
						}
					
					
			         if(!vo.getDODATE().equals("") && vo.getDODATE()!=null) {
					
			        	
					List<String> monthSblings = MyDateFormat.getMonthSblings(vo.getDODATE().toString(),6);
					
					 String start = monthSblings.get(0);
					 String end =MyDateFormat.getStartMonth1(monthSblings.get(5));
					 StringBuffer stringBuilder1=new StringBuffer(start);
					 StringBuffer stringBuilder2=new StringBuffer(end);
					 StringBuffer startMonth = stringBuilder1.insert(4,"-");					 
					 StringBuffer endMonth = stringBuilder2.insert(4,"-");
					 String stringStart = startMonth.toString();
					 String stringEnd = endMonth.toString();
					 String areaname = vo.getAREANAME();
					 String brandname = vo.getBRANDNAME();
					 vo.setMonths(monthSblings);
					 data.put("months", monthSblings);
					 
					 if(areaname.equals("全省")) {
						 
						 List<OverCustomers>  cntsAndNums = dMAmountService.listCoverBrand(stringStart, stringEnd, brandname, areaname);
							if(cntsAndNums.size()>0) {
							 
							 for (OverCustomers overCustomer : cntsAndNums) {
								int cnt = overCustomer.getCnt();
								amount.add(cnt);
								
								
							}
							} 						 						 
					        }else {
					 
					 
					List<OverCustomers>  cntsAndNums = dMAmountService.listCoverBrand1(stringStart, stringEnd, brandname, areaname);
					if(cntsAndNums.size()>0) {
					 
					 for (OverCustomers overCustomer : cntsAndNums) {
						int cnt = overCustomer.getCnt();
						amount.add(cnt);
						
						
					}
					}
					} 
					//List<OverCustomer> listCoverBrand = dMAmountService.listCoverBrand(startMonth, endMonth, brandname, areaname);
					//Map<String,String> cntsAndNums = null;
					//页面点击li时，只会传进来一个种类，只展示这种类型就好了
					// List<OverCustomer> listCoverBrand = hallBrndTtttService.listCoverBrand(vo);
					//System.out.println(listCoverBrand1.toString());
					  
					 data.put("cnts",amount );
					//data.put("nums", cntsAndNums.get("nums"));
			         }	
					return data; 
				}			
				
				
				
				
				
				
				
	
	
	
}

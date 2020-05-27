package com.asiainfo.cmc.controller.cityKpi;
import java.io.IOException;
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
import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.InternetIndex;
import com.asiainfo.cmc.enties.ModelInternet;
import com.asiainfo.cmc.enties.StockTurnOver;
import com.asiainfo.cmc.service.ModelInternetService;

/**
 * @author WANGHAO
 * @version 创建时间：2020年3月17日 上午10:17:27
 * @ClassName 类名称
 * @Description 类描述 期初数据导入功能
 */

@Controller
@RequestMapping("/InternetRote")
public class InternetRoteController {

	@Resource
	private ModelInternetService cityKpi2019Service;

	@DS("dataSource")
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		// logger.info("customerChannel {}.", locale);
		//model.addAttribute("special", "modelInternet");
		String special="type_8";
		String type_8="利";
		model.addAttribute("type_8", type_8);
		model.addAttribute("special", special );
		return "cityKpi/model_internetRote";
	}


	//汇总KPI指标操作
	
		@ResponseBody
		@DS("dataSource")@RequestMapping(value = "/deleteModel", method = RequestMethod.POST)
		public Map<String, Object> addAndU(InternetIndex modelI, Locale locale, Model model, HttpServletRequest request,
				HttpServletResponse response) {
		        Map<String, Object> map=new HashMap<>();
		        String kind = request.getParameter("pp");
		        String ss = request.getParameter("datevalue");
		        String qq = request.getParameter("endMonth");		       
		        String removeStr = "-";
		        String datevalue=ss.replace(removeStr, "");
		        String end=qq.replace(removeStr, "");
		        String month1 = request.getParameter("month1");
		        String month2 = request.getParameter("month2");	
		        String mon1=month1.replace(removeStr, "");
		        String mon2=month2.replace(removeStr, "");
		        modelI.setStart(mon1);   
		        modelI.setEnd(mon2);
		        if(kind.equals("1")){ //代表是月份  
		        	//需要截取到月份
//		        	String start = datevalue.substring(0,6);	
//		        	modelI.setDatevalue(start);
		        	
		        	
		        	
		        	try {
						
		        		//互联网完成情况  (参数可以是月份和日期)
						String yy = cityKpi2019Service.selectDateRote(datevalue, end);
						String tt = cityKpi2019Service.selectDateIRote(modelI);
						 if(yy!=null && !"".equals(yy) && tt!=null && !"".equals(tt)){
	 							
			            	  //互联网考核完成进度 
							   double a = Double.parseDouble(yy); 
			            	   double b = Double.parseDouble(tt); 
			            	   double c=a/b*100;
			            	   double d = (double) Math.round(c * 100) / 100;
			            	   String s = String.valueOf(d);
			            	   String p=s+"%";
			            	   map.put("baifen", p);
			               }else {
			            	   
			            	   map.put("baifen", "请检查数据");   
			            	   
			               }
						 if(yy==null || "".equals(yy)){
								
							    yy="0";
							}
						String selectDate=yy+"元";
						 map.put("selectDate", selectDate);
						//互联网考核指标（参数必须是月份，需转换）
						 if(tt==null || "".equals(tt)){
								
							    tt="0";
							}
						String dateI=tt+"元";	
						
						map.put("dateI", dateI);
		              
						
						
						

					} catch (Exception e) // Exception 为最大的异常
					
					{
						map.put("tip", "数据异常！");
					}
		        	
		        	
		        	
		        	
		        }
		    	
		        if(kind.equals("2")){ //代表是日期 
		        	//需要截取到月份
		        	String start = datevalue.substring(0,6);// 开始	
		        	String endtime = end.substring(0,6);// 结束	
		        	
		        	modelI.setStart(start);
		        	modelI.setEnd(endtime);
		        	
		        	
		        	try {
						//互联网完成情况  (参数可以是月份和日期)
						String yy = cityKpi2019Service.selectDateRote(datevalue, end);
						String tt = cityKpi2019Service.selectDateIRote(modelI);
						 if(yy!=null && !"".equals(yy) && tt!=null && !"".equals(tt)){
	 							
			            	  //互联网考核完成进度 
							   double a = Double.parseDouble(yy); 
			            	   double b = Double.parseDouble(tt); 
			            	   double c=a/b*100;
			            	   double d = (double) Math.round(c * 100) / 100;
			            	   String s = String.valueOf(d);
			            	   String p=s+"%";
			            	   map.put("baifen", p);
			               }else {
			            	   
			            	   map.put("baifen", "请检查数据");   
			            	   
			               }
						 if(yy==null || "".equals(yy)){
								
							    yy="0";
							}
						String selectDate=yy+"元";
						 map.put("selectDate", selectDate);
						//互联网考核指标（参数必须是月份，需转换）
						 if(tt==null || "".equals(tt)){
								
							    tt="0";
							}
						String dateI=tt+"元";	
						
						map.put("dateI", dateI);
		              
						
						
						

					} catch (Exception e) // Exception 为最大的异常
					
					{
						map.put("tip", "数据异常！");
					}
		        	
		        	
		        	
		        	
		        } 
		        
		        
		        
		        
			
			

			return map;

		}
	
	
	//圆饼图完成情况大类取数
		
		@SuppressWarnings("unchecked")
		@ResponseBody
		@DS("dataSource")@RequestMapping(value = "/takeOver", method = RequestMethod.POST)
		public Map<String, Object> areaPort(Locale locale, Model models, HttpServletRequest request,
				HttpServletResponse response) throws ParseException {
			String pp = request.getParameter("pp");//本月和去年同期切换
			String timeKind = request.getParameter("timeKind");//OBJ
			String qq = request.getParameter("start");//2019-01-01
			String cc = request.getParameter("end");
			
			
		    
		    

			ArrayList<String> list =new ArrayList<>();
			
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			HashMap<String, Object> innerMap = new LinkedHashMap<String, Object>();
			HashMap<String, Object> outterMap = new LinkedHashMap<String, Object>();
			if(pp==null || pp.equals("1")){  //代表是月份
				String removeStr = "-";
			    String start=qq.replace(removeStr, "");
			    String end=cc.replace(removeStr, "");
			    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
			    SimpleDateFormat format1 = new SimpleDateFormat("yyyyMM");
			    
			   // Date date = new Date();	
			    Date date = sdf.parse(cc);
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(date); // 设置为当前时间
				calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) - 1); // 设置为上一个月 
				date = calendar.getTime();
				String nextDate = format.format(date);//上月结束时间  yyyyMMdd
				
				 Date date11 = sdf.parse(qq);
				String topDate = format1.format(date11)+"01";//上月开始时间
				
                if(start.equals(end)){
					
                	topDate=format.format(date);
                	nextDate=format1.format(date11)+"01";
					
					
					
					
					
				}
				//去年同期
				Date dateYear = sdf.parse(cc);
				Calendar calendar1 = Calendar.getInstance();
				calendar1.setTime(dateYear); 
				calendar1.set(Calendar.YEAR,calendar1.get(Calendar.YEAR) - 1);
				dateYear = calendar1.getTime();
				String nextYear = format.format(dateYear);//上月结束时间  yyyyMMdd
				
				
				Date dateEnd = sdf.parse(qq);
				Calendar calendar5 = Calendar.getInstance();
				calendar5.setTime(dateEnd); 
				calendar5.set(Calendar.YEAR,calendar5.get(Calendar.YEAR) - 1);
				dateEnd = calendar5.getTime();
				String topYear = format1.format(dateEnd)+"01";//上月开始时间
				
				
				
				 try {
		            	
		            	
	    				
	            		
	            		  if(timeKind!=null && "2".equals(timeKind)){
	            			  List<ModelInternet> listBig = cityKpi2019Service.listBigRote(start, end);//当前日期大类 必须传日期格式的
		            		  if(listBig.size()>0){
		              			for(ModelInternet abo : listBig) {
		              				String fiveName = abo.getType();//手机类型    				
		              				//Double a = Double.valueOf(abo.getSaleprofit());//销量
		              				list.add(fiveName);
		              				
		              				
		              				innerMap.put(fiveName,Long.parseLong(abo.getSaleprofit()));	
		              				
		              				
		              				
		              			}

		              			
		                          }
	            		  List<ModelInternet> listBig1 = cityKpi2019Service.listBigRote(topDate, nextDate);//上月大类
	            		  
	            		     //上月大类
	                      if(listBig1.size()>0){
	              			for(ModelInternet abo : listBig1) {
	              				String fiveName = abo.getType();//手机类型    				
	              				//Double a = Double.valueOf(abo.getSaleprofit());//销量
	              			
	              				
	              				
	              				outterMap.put(fiveName,Long.parseLong(abo.getSaleprofit()));	
	              				
	              				
	              				
	              			}
	                      } 
	            		  }
	            		  else if(timeKind!=null && "1".equals(timeKind)){
	            			  List<ModelInternet> listBig = cityKpi2019Service.listBigRote(start, end);//当前日期大类 必须传日期格式的
		            		  if(listBig.size()>0){
		              			for(ModelInternet abo : listBig) {
		              				String fiveName = abo.getType();//手机类型    				
		              				//Double a = Double.valueOf(abo.getSaleprofit());//销量
		              				list.add(fiveName);
		              				
		              				
		              				innerMap.put(fiveName,Long.parseLong(abo.getSaleprofit()));	
		              				
		              				
		              				
		              			}

		              			
		                          }
	                      List<ModelInternet> listBig2 = cityKpi2019Service.listBigRote(topYear, nextYear);//去年同期大类 
	                      //去年同期
	          			if(listBig2.size()>0){
	              			for(ModelInternet abo : listBig2) {
	              				String fiveName = abo.getType();//手机类型    				
	              				//Double a = Double.valueOf(abo.getSaleprofit());//销量
	              			
	              				
	              				
	              				outterMap.put(fiveName,Long.parseLong(abo.getSaleprofit()));	
	              				
	              				
	              				
	              			}

	          			
	          			
	          			
	          			
	          			
	                      }
	                      
	                      }
	            		  else {
	            			  
	            			  List<ModelInternet> listBig = cityKpi2019Service.listBigRote(start, end);//当前日期大类 必须传日期格式的
		            		  if(listBig.size()>0){
		              			for(ModelInternet abo : listBig) {
		              				String fiveName = abo.getType();//手机类型    				
		              				//Double a = Double.valueOf(abo.getSaleprofit());//销量
		              				list.add(fiveName);
		              				
		              				
		              				innerMap.put(fiveName,Long.parseLong(abo.getSaleprofit()));	
		              				
		              				
		              				
		              			}

		              			
		                          }  
	            			  
		            		  
		            		  List<ModelInternet> listBig1 = cityKpi2019Service.listBigRote(topDate, nextDate);//上月大类
		            		  
		            		     //上月大类
		                      if(listBig1.size()>0){
		              			for(ModelInternet abo : listBig1) {
		              				String fiveName = abo.getType();//手机类型    				
		              				//Double a = Double.valueOf(abo.getSaleprofit());//销量
		              			
		              				
		              				
		              				outterMap.put(fiveName,Long.parseLong(abo.getSaleprofit()));	
		              				
		              				
		              				
		              			}
		                      }   
		            		  
	            			  
	            		  }
	            		  
	    				
	    			
	            	
	      
	               
	                
	                
	                
	    			
				} catch (Exception e) {
					
					
					
					
				}
				
				
				
				
			
			}else if(pp!=null || pp.equals("2")){//代表是日期
				
				
				
				String removeStr = "-";
			    String start=qq.replace(removeStr, "");
			    String end=cc.replace(removeStr, "");
			    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
			    //SimpleDateFormat format1 = new SimpleDateFormat("yyyyMM");
			    
			   // Date date = new Date();	
			    Date date = sdf.parse(cc);
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(date); // 设置为当前时间
				calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) - 1); // 设置为上一个月 
				date = calendar.getTime();
				String nextDate = format.format(date);//上月结束时间  yyyyMMdd
				
				 Date date11 = sdf.parse(qq);
				String topDate = format.format(date11);//上月开始时间
				//需要截取到月份
	        	String start1 = start.substring(0,6);// 开始	
	        	String end1 = end.substring(0,6);// 结束	
				
	        	
				
				if(start1.equals(end1)){
					
                	topDate=format.format(date);
                	nextDate=format.format(date11);
					
					
					
					
					
				}
				
				//去年同期
				Date dateYear = sdf.parse(cc);
				Calendar calendar1 = Calendar.getInstance();
				calendar1.setTime(dateYear); 
				calendar1.set(Calendar.YEAR,calendar1.get(Calendar.YEAR) - 1);
				dateYear = calendar1.getTime();
				String nextYear = format.format(dateYear);//上月结束时间  yyyyMMdd
				
				
				Date dateEnd = sdf.parse(qq);
				Calendar calendar5 = Calendar.getInstance();
				calendar5.setTime(dateEnd); 
				calendar5.set(Calendar.YEAR,calendar5.get(Calendar.YEAR) - 1);
				dateEnd = calendar5.getTime();
				String topYear = format.format(dateEnd);//上月开始时间

				 try {
		            	
		            	
	    				
	            		
	            		  if(timeKind!=null && "2".equals(timeKind)){
	            			  List<ModelInternet> listBig = cityKpi2019Service.listBigRote(start, end);//当前日期大类 必须传日期格式的
		            		  if(listBig.size()>0){
		              			for(ModelInternet abo : listBig) {
		              				String fiveName = abo.getType();//手机类型    				
		              				//Double a = Double.valueOf(abo.getSaleprofit());//销量
		              				list.add(fiveName);
		              				
		              				
		              				innerMap.put(fiveName,Long.parseLong(abo.getSaleprofit()));	
		              				
		              				
		              				
		              			}

		              			
		                          }
	            			  
	            		  List<ModelInternet> listBig1 = cityKpi2019Service.listBigRote(topDate, nextDate);//上月大类
	            		  
	            		     //上月大类
	                      if(listBig1.size()>0){
	              			for(ModelInternet abo : listBig1) {
	              				String fiveName = abo.getType();//手机类型    				
	              				//Double a = Double.valueOf(abo.getSaleprofit());//销量
	              			
	              				
	              				
	              				outterMap.put(fiveName,Long.parseLong(abo.getSaleprofit()));	
	              				
	              				
	              				
	              			}
	                      } 
	            		  }
	            		  else if(timeKind!=null && "1".equals(timeKind)){
	            			  List<ModelInternet> listBig = cityKpi2019Service.listBigRote(start, end);//当前日期大类 必须传日期格式的
		            		  if(listBig.size()>0){
		              			for(ModelInternet abo : listBig) {
		              				String fiveName = abo.getType();//手机类型    				
		              				//Double a = Double.valueOf(abo.getSaleprofit());//销量
		              				list.add(fiveName);
		              				
		              				
		              				innerMap.put(fiveName,Long.parseLong(abo.getSaleprofit()));	
		              				
		              				
		              				
		              			}

		              			
		                          }
	            			  
	            			  
	                      List<ModelInternet> listBig2 = cityKpi2019Service.listBigRote(topYear, nextYear);//去年同期大类 
	                      //去年同期
	          			if(listBig2.size()>0){
	              			for(ModelInternet abo : listBig2) {
	              				String fiveName = abo.getType();//手机类型    				
	              				//Double a = Double.valueOf(abo.getSaleprofit());//销量
	              			
	              				
	              				
	              				outterMap.put(fiveName,Long.parseLong(abo.getSaleprofit()));	
	              				
	              				
	              				
	              			}

	                      }
	                      
	                      }
	            		  else {
	            			  List<ModelInternet> listBig = cityKpi2019Service.listBigRote(start, end);//当前日期大类 必须传日期格式的
		            		  if(listBig.size()>0){
		              			for(ModelInternet abo : listBig) {
		              				String fiveName = abo.getType();//手机类型    				
		              				//Double a = Double.valueOf(abo.getSaleprofit());//销量
		              				list.add(fiveName);
		              				
		              				
		              				innerMap.put(fiveName,Long.parseLong(abo.getSaleprofit()));	
		              				
		              				
		              				
		              			}

		              			
		                          }  
	            		 
		            		  List<ModelInternet> listBig1 = cityKpi2019Service.listBigRote(topDate, nextDate);//上月大类
		            		  
		            		     //上月大类
		                      if(listBig1.size()>0){
		              			for(ModelInternet abo : listBig1) {
		              				String fiveName = abo.getType();//手机类型    				
		              				//Double a = Double.valueOf(abo.getSaleprofit());//销量
		              			
		              				
		              				
		              				outterMap.put(fiveName,Long.parseLong(abo.getSaleprofit()));	
		              				
		              				
		              				
		              			}
		                      } 
	            		  
	            		  
	            		  
	            		  
	            		  
	            		  
	            		  }
	    				
	    			
	            	
	      
	               
	                
	                
	                
	    			
				} catch (Exception e) {
					
					
					
					
				}	
				
				
				
				
			}
			
			
			
			
           
			
			
			
            map.put("nameList", list);
            map.put("dateList", innerMap);//大类精确到万
            map.put("dateList1", outterMap);//上月
            
            
            
            return map;

		}
	
		
		
		//长方形品牌完成情况大类取数
		
				@SuppressWarnings("unchecked")
				@ResponseBody
				@DS("dataSource")@RequestMapping(value = "/takeBrand", method = RequestMethod.POST)
				public Map<String, Object> areaBrand(Locale locale, Model models, HttpServletRequest request,
						HttpServletResponse response) throws ParseException {
					String pp = request.getParameter("pp");//月份和日期切换
					String timeKind = request.getParameter("timeKind");//本月和去年同期切换
					String type = request.getParameter("type");//大类
					String qq = request.getParameter("start");//2019-01-01
					String cc = request.getParameter("end");
					

					
					
					//当前
					ArrayList<String> list =new ArrayList<String>();//品牌					
					ArrayList<String> list2 =new ArrayList<String>();//数量
					//上月	
					ArrayList<String> month =new ArrayList<String>();//品牌					
					ArrayList<String> month2 =new ArrayList<String>();//数量
					//去年同期
					ArrayList<String> year =new ArrayList<String>();//品牌					
					ArrayList<String> year2 =new ArrayList<String>();//数量
					HashMap<String, Object> map = new HashMap<String, Object>();
				        
		            try {
		            	if(pp==null || pp.equals("1")){
		            		String removeStr = "-";
						    String start=qq.replace(removeStr, "");
						    String end=cc.replace(removeStr, "");
						    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
						    SimpleDateFormat format1 = new SimpleDateFormat("yyyyMM");
						    
						   // Date date = new Date();	
						    Date date = sdf.parse(cc);
							Calendar calendar = Calendar.getInstance();
							calendar.setTime(date); // 设置为当前时间
							calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) - 1); // 设置为上一个月 
							date = calendar.getTime();
							String nextDate = format.format(date);//上月结束时间  yyyyMMdd
							
							 Date date11 = sdf.parse(qq);
							String topDate = format1.format(date11)+"01";//上月开始时间
							if(start.equals(end)){
								
			                	topDate=format.format(date);
			                	nextDate=format1.format(date11)+"01";
								
								
								
								
								
							}
							
							//去年同期
							Date dateYear = sdf.parse(cc);
							Calendar calendar1 = Calendar.getInstance();
							calendar1.setTime(dateYear); 
							calendar1.set(Calendar.YEAR,calendar1.get(Calendar.YEAR) - 1);
							dateYear = calendar1.getTime();
							String nextYear = format.format(dateYear);//上月结束时间  yyyyMMdd
							
							
							Date dateEnd = sdf.parse(qq);
							Calendar calendar5 = Calendar.getInstance();
							calendar5.setTime(dateEnd); 
							calendar5.set(Calendar.YEAR,calendar5.get(Calendar.YEAR) - 1);
							dateEnd = calendar5.getTime();
							String topYear = format1.format(dateEnd)+"01";//上月开始时间

							ModelInternet mdl=new ModelInternet();//当前日期
						    mdl.setType(type);
							mdl.setStartTime(start);
							mdl.setEndTime(end);
							ModelInternet topMonth=new ModelInternet();//上月
							topMonth.setType(type);
							topMonth.setStartTime(topDate);
							topMonth.setEndTime(nextDate);
							ModelInternet netYear=new ModelInternet();//去年同期
							netYear.setType(type);
							netYear.setStartTime(topYear);
							netYear.setEndTime(nextYear);
		            		
		            		
		            		
		            		
		            	
		            	if(timeKind==null || timeKind.equals("1")){
		            	
		            	List<ModelInternet> listBig = cityKpi2019Service.listBrandRote(mdl);//当前日期大类 必须传日期格式的
		            	
		            	
		                if(listBig.size()>0){
		    			for(ModelInternet abo : listBig) {
		    				String fiveName = abo.getBrand();//手机品牌	
		    				String string = abo.getSaleprofit();//数量
		    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
		    				list.add(fiveName);
		    				list2.add(string);
		    			}
		    			 map.put("nowList", list);
		    			 map.put("nowAmount", list2);
		                }
		                
		            	}
		            	else if(timeKind!=null && timeKind.equals("2")){
		                //上月大类
		            	List<ModelInternet> listBig1 = cityKpi2019Service.listBrandRote(topMonth);//上月大类
		                if(listBig1.size()>0){
		                	for(ModelInternet abo : listBig1) {
			    				String fiveName = abo.getBrand();//手机品牌	
			    				String string = abo.getSaleprofit();//数量
			    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
			    				month.add(fiveName);
			    				month2.add(string);
			    			}
//		                	 map.put("monthList", month);
//			    			 map.put("monthAmount", month2);
		                	 map.put("nowList", month);
			    			 map.put("nowAmount", month2);
		                	
		                } 
		               }
		                else if(timeKind!=null && timeKind.equals("3")){
		                    //去年同期
		                	List<ModelInternet> listBig2 = cityKpi2019Service.listBrandRote(netYear);//去年同期大类
		        			if(listBig2.size()>0){
		        				for(ModelInternet abo : listBig2) {
				    				String fiveName = abo.getBrand();//手机品牌	
				    				String string = abo.getSaleprofit();//数量
				    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
				    				year.add(fiveName);
				    				year2.add(string);
				    			}
		        			
//		        				 map.put("yearList", year);
//				    			 map.put("yearAmount", year2);
		        				 map.put("nowList", year);
				    			 map.put("nowAmount", year2);
		        			
		        			
		        			
		                    }	
		                
		                }
		            }else if(pp!=null || pp.equals("2")){
		            	String removeStr = "-";
					    String start=qq.replace(removeStr, "");
					    String end=cc.replace(removeStr, "");
					    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
					    //SimpleDateFormat format1 = new SimpleDateFormat("yyyyMM");
					    
					   // Date date = new Date();	
					    Date date = sdf.parse(cc);
						Calendar calendar = Calendar.getInstance();
						calendar.setTime(date); // 设置为当前时间
						calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) - 1); // 设置为上一个月 
						date = calendar.getTime();
						String nextDate = format.format(date);//上月结束时间  yyyyMMdd
						
						 Date date11 = sdf.parse(qq);
						String topDate = format.format(date11);//上月开始时间
						//需要截取到月份
			        	String start1 = start.substring(0,6);// 开始	
			        	String end1 = end.substring(0,6);// 结束	
						
						if(start1.equals(end1)){
							
		                	topDate=format.format(date);
		                	nextDate=format.format(date11);
							
							
							
							
							
						}
						
						//去年同期
						Date dateYear = sdf.parse(cc);
						Calendar calendar1 = Calendar.getInstance();
						calendar1.setTime(dateYear); 
						calendar1.set(Calendar.YEAR,calendar1.get(Calendar.YEAR) - 1);
						dateYear = calendar1.getTime();
						String nextYear = format.format(dateYear);//上月结束时间  yyyyMMdd
						
						
						Date dateEnd = sdf.parse(qq);
						Calendar calendar5 = Calendar.getInstance();
						calendar5.setTime(dateEnd); 
						calendar5.set(Calendar.YEAR,calendar5.get(Calendar.YEAR) - 1);
						dateEnd = calendar5.getTime();
						String topYear = format.format(dateEnd);//上月开始时间
		            	
						ModelInternet mdl=new ModelInternet();//当前日期
					    mdl.setType(type);
						mdl.setStartTime(start);
						mdl.setEndTime(end);
						ModelInternet topMonth=new ModelInternet();//上月
						topMonth.setType(type);
						topMonth.setStartTime(topDate);
						topMonth.setEndTime(nextDate);
						ModelInternet netYear=new ModelInternet();//去年同期
						netYear.setType(type);
						netYear.setStartTime(topYear);
						netYear.setEndTime(nextYear);
						
						if(timeKind==null || timeKind.equals("1")){
			            	
			            	List<ModelInternet> listBig = cityKpi2019Service.listBrandRote(mdl);//当前日期大类 必须传日期格式的
			            	
			            	
			                if(listBig.size()>0){
			    			for(ModelInternet abo : listBig) {
			    				String fiveName = abo.getBrand();//手机品牌	
			    				String string = abo.getSaleprofit();//数量
			    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
			    				list.add(fiveName);
			    				list2.add(string);
			    			}
			    			 map.put("nowList", list);
			    			 map.put("nowAmount", list2);
			                }
			                
			            	}
			            	else if(timeKind!=null && timeKind.equals("2")){
			                //上月大类
			            	List<ModelInternet> listBig1 = cityKpi2019Service.listBrandRote(topMonth);//上月大类
			                if(listBig1.size()>0){
			                	for(ModelInternet abo : listBig1) {
				    				String fiveName = abo.getBrand();//手机品牌	
				    				String string = abo.getSaleprofit();//数量
				    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
				    				month.add(fiveName);
				    				month2.add(string);
				    			}
//			                	 map.put("monthList", month);
//				    			 map.put("monthAmount", month2);
			                	 map.put("nowList", month);
				    			 map.put("nowAmount", month2);
			                	
			                } 
			               }
			                else if(timeKind!=null && timeKind.equals("3")){
			                    //去年同期
			                	List<ModelInternet> listBig2 = cityKpi2019Service.listBrandRote(netYear);//去年同期大类
			        			if(listBig2.size()>0){
			        				for(ModelInternet abo : listBig2) {
					    				String fiveName = abo.getBrand();//手机品牌	
					    				String string = abo.getSaleprofit();//数量
					    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
					    				year.add(fiveName);
					    				year2.add(string);
					    			}
			        			
//			        				 map.put("yearList", year);
//					    			 map.put("yearAmount", year2);
			        				 map.put("nowList", year);
					    			 map.put("nowAmount", year2);
			        			
			        			
			        			
			                    }	
			                
			                }
		            	
		            	
		            	
		            	
		            	
		            	
		            	
		            }
		            
		                
		                
		                
		    			
					} catch (Exception e) {
						
						
						
						
					}
					
					
					
		           
		            
		            
		            return map;

				}
		
				
				
				
				
				
				
				
				
				
				
				//长方形型号完成情况大类取数
				
				@SuppressWarnings("unchecked")
				@ResponseBody
				@DS("dataSource")@RequestMapping(value = "/takeSpec", method = RequestMethod.POST)
				public Map<String, Object> areaspec(Locale locale, Model models, HttpServletRequest request,
						HttpServletResponse response) throws ParseException {
					String pp = request.getParameter("pp");//月份和日期切换
					String timeKind = request.getParameter("timeKind");//本月和去年同期切换
					String brand = request.getParameter("brand");//大类
					String type = request.getParameter("type");//大类
					String qq = request.getParameter("start");//2019-01-01
					String cc = request.getParameter("end");
					
					//当前
					ArrayList<String> list =new ArrayList<String>();//品牌					
					ArrayList<String> list2 =new ArrayList<String>();//数量
					//上月	
					ArrayList<String> month =new ArrayList<String>();//品牌					
					ArrayList<String> month2 =new ArrayList<String>();//数量
					//去年同期
					ArrayList<String> year =new ArrayList<String>();//品牌					
					ArrayList<String> year2 =new ArrayList<String>();//数量
					HashMap<String, Object> map = new HashMap<String, Object>();
				        
		            try {
		            	if(pp==null || pp.equals("1")){
		            		String removeStr = "-";
						    String start=qq.replace(removeStr, "");
						    String end=cc.replace(removeStr, "");
						    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
						    SimpleDateFormat format1 = new SimpleDateFormat("yyyyMM");
						    
						   // Date date = new Date();	
						    Date date = sdf.parse(cc);
							Calendar calendar = Calendar.getInstance();
							calendar.setTime(date); // 设置为当前时间
							calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) - 1); // 设置为上一个月 
							date = calendar.getTime();
							String nextDate = format.format(date);//上月结束时间  yyyyMMdd
							
							 Date date11 = sdf.parse(qq);
							String topDate = format1.format(date11)+"01";//上月开始时间
							if(start.equals(end)){
								
			                	topDate=format.format(date);
			                	nextDate=format1.format(date11)+"01";
								
								
								
								
								
							}
							
							//去年同期
							Date dateYear = sdf.parse(cc);
							Calendar calendar1 = Calendar.getInstance();
							calendar1.setTime(dateYear); 
							calendar1.set(Calendar.YEAR,calendar1.get(Calendar.YEAR) - 1);
							dateYear = calendar1.getTime();
							String nextYear = format.format(dateYear);//上月结束时间  yyyyMMdd
							
							
							Date dateEnd = sdf.parse(qq);
							Calendar calendar5 = Calendar.getInstance();
							calendar5.setTime(dateEnd); 
							calendar5.set(Calendar.YEAR,calendar5.get(Calendar.YEAR) - 1);
							dateEnd = calendar5.getTime();
							String topYear = format1.format(dateEnd)+"01";//上月开始时间

							ModelInternet mdl=new ModelInternet();//当前日期
						    mdl.setType(type);
						    mdl.setBrand(brand);
							mdl.setStartTime(start);
							mdl.setEndTime(end);
							ModelInternet topMonth=new ModelInternet();//上月
							topMonth.setType(type);
							topMonth.setBrand(brand);
							topMonth.setStartTime(topDate);
							topMonth.setEndTime(nextDate);
							ModelInternet netYear=new ModelInternet();//去年同期
							netYear.setType(type);
							netYear.setBrand(brand);
							netYear.setStartTime(topYear);
							netYear.setEndTime(nextYear);
		            		
		            		
		            		
		            		
		            	
		            	if(timeKind==null || timeKind.equals("1")){
		            	
		            	List<ModelInternet> listBig = cityKpi2019Service.listSpecRote(mdl);//当前日期大类 必须传日期格式的
		            	
		            	
		                if(listBig.size()>0){
		    			for(ModelInternet abo : listBig) {
		    				String fiveName = abo.getSpec();//手机品牌	
		    				String string = abo.getSaleprofit();//数量
		    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
		    				list.add(fiveName);
		    				list2.add(string);
		    			}
		    			 map.put("nowList", list);
		    			 map.put("nowAmount", list2);
		                }
		                
		            	}
		            	else if(timeKind!=null && timeKind.equals("2")){
		                //上月大类
		            	List<ModelInternet> listBig1 = cityKpi2019Service.listSpecRote(topMonth);//上月大类
		                if(listBig1.size()>0){
		                	for(ModelInternet abo : listBig1) {
			    				String fiveName = abo.getSpec();//手机品牌	
			    				String string = abo.getSaleprofit();//数量
			    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
			    				month.add(fiveName);
			    				month2.add(string);
			    			}
//		                	 map.put("monthList", month);
//			    			 map.put("monthAmount", month2);
		                	 map.put("nowList", month);
			    			 map.put("nowAmount", month2);
		                	
		                } 
		               }
		                else if(timeKind!=null && timeKind.equals("3")){
		                    //去年同期
		                	List<ModelInternet> listBig2 = cityKpi2019Service.listSpecRote(netYear);//去年同期大类
		        			if(listBig2.size()>0){
		        				for(ModelInternet abo : listBig2) {
				    				String fiveName = abo.getSpec();//手机品牌	
				    				String string = abo.getSaleprofit();//数量
				    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
				    				year.add(fiveName);
				    				year2.add(string);
				    			}
		        			
//		        				 map.put("yearList", year);
//				    			 map.put("yearAmount", year2);
		        				 map.put("nowList", year);
				    			 map.put("nowAmount", year2);
		        			
		        			
		        			
		                    }	
		                
		                }
		            }else if(pp!=null || pp.equals("2")){
		            	String removeStr = "-";
					    String start=qq.replace(removeStr, "");
					    String end=cc.replace(removeStr, "");
					    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
					    //SimpleDateFormat format1 = new SimpleDateFormat("yyyyMM");
					    
					   // Date date = new Date();	
					    Date date = sdf.parse(cc);
						Calendar calendar = Calendar.getInstance();
						calendar.setTime(date); // 设置为当前时间
						calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) - 1); // 设置为上一个月 
						date = calendar.getTime();
						String nextDate = format.format(date);//上月结束时间  yyyyMMdd
						
						 Date date11 = sdf.parse(qq);
						String topDate = format.format(date11);//上月开始时间
						//需要截取到月份
			        	String start1 = start.substring(0,6);// 开始	
			        	String end1 = end.substring(0,6);// 结束	
						
						if(start1.equals(end1)){
							
		                	topDate=format.format(date);
		                	nextDate=format.format(date11);
							
							
							
							
							
						}
						
						//去年同期
						Date dateYear = sdf.parse(cc);
						Calendar calendar1 = Calendar.getInstance();
						calendar1.setTime(dateYear); 
						calendar1.set(Calendar.YEAR,calendar1.get(Calendar.YEAR) - 1);
						dateYear = calendar1.getTime();
						String nextYear = format.format(dateYear);//上月结束时间  yyyyMMdd
						
						
						Date dateEnd = sdf.parse(qq);
						Calendar calendar5 = Calendar.getInstance();
						calendar5.setTime(dateEnd); 
						calendar5.set(Calendar.YEAR,calendar5.get(Calendar.YEAR) - 1);
						dateEnd = calendar5.getTime();
						String topYear = format.format(dateEnd);//上月开始时间
		            	
						ModelInternet mdl=new ModelInternet();//当前日期
					    mdl.setType(type);
					    mdl.setBrand(brand);
						mdl.setStartTime(start);
						mdl.setEndTime(end);
						ModelInternet topMonth=new ModelInternet();//上月
						topMonth.setType(type);
						topMonth.setBrand(brand);
						topMonth.setStartTime(topDate);
						topMonth.setEndTime(nextDate);
						ModelInternet netYear=new ModelInternet();//去年同期
						netYear.setType(type);
						netYear.setBrand(brand);
						netYear.setStartTime(topYear);
						netYear.setEndTime(nextYear);
						
						if(timeKind==null || timeKind.equals("1")){
			            	
			            	List<ModelInternet> listBig = cityKpi2019Service.listSpecRote(mdl);//当前日期大类 必须传日期格式的
			            	
			            	
			                if(listBig.size()>0){
			    			for(ModelInternet abo : listBig) {
			    				String fiveName = abo.getSpec();//手机品牌	
			    				String string = abo.getSaleprofit();//数量
			    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
			    				list.add(fiveName);
			    				list2.add(string);
			    			}
			    			 map.put("nowList", list);
			    			 map.put("nowAmount", list2);
			                }
			                
			            	}
			            	else if(timeKind!=null && timeKind.equals("2")){
			                //上月大类
			            	List<ModelInternet> listBig1 = cityKpi2019Service.listSpecRote(topMonth);//上月大类
			                if(listBig1.size()>0){
			                	for(ModelInternet abo : listBig1) {
				    				String fiveName = abo.getSpec();//手机品牌	
				    				String string = abo.getSaleprofit();//数量
				    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
				    				month.add(fiveName);
				    				month2.add(string);
				    			}
//			                	 map.put("monthList", month);
//				    			 map.put("monthAmount", month2);
			                	 map.put("nowList", month);
				    			 map.put("nowAmount", month2);
			                	
			                } 
			               }
			                else if(timeKind!=null && timeKind.equals("3")){
			                    //去年同期
			                	List<ModelInternet> listBig2 = cityKpi2019Service.listSpecRote(netYear);//去年同期大类
			        			if(listBig2.size()>0){
			        				for(ModelInternet abo : listBig2) {
					    				String fiveName = abo.getSpec();//手机品牌	
					    				String string = abo.getSaleprofit();//数量
					    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
					    				year.add(fiveName);
					    				year2.add(string);
					    			}
			        			
//			        				 map.put("yearList", year);
//					    			 map.put("yearAmount", year2);
			        				 map.put("nowList", year);
					    			 map.put("nowAmount", year2);
			        			
			        			
			        			
			                    }	
			                
			                }
		            	
		            	
		            	
		            	
		            	
		            	
		            	
		            }
		            
		                
		                
		                
		    			
					} catch (Exception e) {
						
						
						
						
					}
					
					
					
		           
		            
		            
		            return map;

				}				
				
				
				//对配置进行取数
				
				@SuppressWarnings("unchecked")
				@ResponseBody
				@DS("dataSource")@RequestMapping(value = "/takePZ", method = RequestMethod.POST)
				public Map<String, Object> areaPZ(Locale locale, Model models, HttpServletRequest request,
						HttpServletResponse response) throws ParseException {
					String pp = request.getParameter("pp");//月份和日期切换
					String timeKind = request.getParameter("timeKind");//本月和去年同期切换
					String brand = request.getParameter("brand");//大类
					String spec = request.getParameter("spec");//大类
					String type = request.getParameter("type");//大类
					String qq = request.getParameter("start");//2019-01-01
					String cc = request.getParameter("end");
					
					//当前
					ArrayList<String> list =new ArrayList<String>();//品牌					
					ArrayList<String> list2 =new ArrayList<String>();//数量
					//上月	
					ArrayList<String> month =new ArrayList<String>();//品牌					
					ArrayList<String> month2 =new ArrayList<String>();//数量
					//去年同期
					ArrayList<String> year =new ArrayList<String>();//品牌					
					ArrayList<String> year2 =new ArrayList<String>();//数量
					HashMap<String, Object> map = new HashMap<String, Object>();
				        
		            try {
		            	if(pp==null || pp.equals("1")){
		            		String removeStr = "-";
						    String start=qq.replace(removeStr, "");
						    String end=cc.replace(removeStr, "");
						    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
						    SimpleDateFormat format1 = new SimpleDateFormat("yyyyMM");
						    
						   // Date date = new Date();	
						    Date date = sdf.parse(cc);
							Calendar calendar = Calendar.getInstance();
							calendar.setTime(date); // 设置为当前时间
							calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) - 1); // 设置为上一个月 
							date = calendar.getTime();
							String nextDate = format.format(date);//上月结束时间  yyyyMMdd
							
							 Date date11 = sdf.parse(qq);
							String topDate = format1.format(date11)+"01";//上月开始时间
							if(start.equals(end)){
								
			                	topDate=format.format(date);
			                	nextDate=format1.format(date11)+"01";
								
								
								
								
								
							}
							
							//去年同期
							Date dateYear = sdf.parse(cc);
							Calendar calendar1 = Calendar.getInstance();
							calendar1.setTime(dateYear); 
							calendar1.set(Calendar.YEAR,calendar1.get(Calendar.YEAR) - 1);
							dateYear = calendar1.getTime();
							String nextYear = format.format(dateYear);//上月结束时间  yyyyMMdd
							
							
							Date dateEnd = sdf.parse(qq);
							Calendar calendar5 = Calendar.getInstance();
							calendar5.setTime(dateEnd); 
							calendar5.set(Calendar.YEAR,calendar5.get(Calendar.YEAR) - 1);
							dateEnd = calendar5.getTime();
							String topYear = format1.format(dateEnd)+"01";//上月开始时间

							ModelInternet mdl=new ModelInternet();//当前日期
						    mdl.setType(type);
						    mdl.setSpec(spec);
						    mdl.setBrand(brand);
							mdl.setStartTime(start);
							mdl.setEndTime(end);
							ModelInternet topMonth=new ModelInternet();//上月
							topMonth.setType(type);
							topMonth.setBrand(brand);
							topMonth.setSpec(spec);
							topMonth.setStartTime(topDate);
							topMonth.setEndTime(nextDate);
							ModelInternet netYear=new ModelInternet();//去年同期
							netYear.setType(type);
							netYear.setBrand(brand);
							netYear.setSpec(spec);
							netYear.setStartTime(topYear);
							netYear.setEndTime(nextYear);
		            		
		            		
		            		
		            		
		            	
		            	if(timeKind==null || timeKind.equals("1")){
		            	
		            	List<ModelInternet> listBig = cityKpi2019Service.listMemoryRote(mdl);//当前日期大类 必须传日期格式的
		            	
		            	
		                if(listBig.size()>0){
		    			for(ModelInternet abo : listBig) {
		    				String fiveName = abo.getMemory();//手机品牌	
		    				String string = abo.getSaleprofit();//数量
		    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
		    				list.add(fiveName);
		    				list2.add(string);
		    			}
		    			 map.put("nowList", list);
		    			 map.put("nowAmount", list2);
		                }
		                
		            	}
		            	else if(timeKind!=null && timeKind.equals("2")){
		                //上月大类
		            	List<ModelInternet> listBig1 = cityKpi2019Service.listMemoryRote(topMonth);//上月大类
		                if(listBig1.size()>0){
		                	for(ModelInternet abo : listBig1) {
			    				String fiveName = abo.getMemory();//手机品牌	
			    				String string = abo.getSaleprofit();//数量
			    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
			    				month.add(fiveName);
			    				month2.add(string);
			    			}
//		                	 map.put("monthList", month);
//			    			 map.put("monthAmount", month2);
		                	 map.put("nowList", month);
			    			 map.put("nowAmount", month2);
		                	
		                } 
		               }
		                else if(timeKind!=null && timeKind.equals("3")){
		                    //去年同期
		                	List<ModelInternet> listBig2 = cityKpi2019Service.listMemoryRote(netYear);//去年同期大类
		        			if(listBig2.size()>0){
		        				for(ModelInternet abo : listBig2) {
				    				String fiveName = abo.getMemory();//手机品牌	
				    				String string = abo.getSaleprofit();//数量
				    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
				    				year.add(fiveName);
				    				year2.add(string);
				    			}
		        			
//		        				 map.put("yearList", year);
//				    			 map.put("yearAmount", year2);
		        				 map.put("nowList", year);
				    			 map.put("nowAmount", year2);
		        			
		        			
		        			
		                    }	
		                
		                }
		            }else if(pp!=null || pp.equals("2")){
		            	String removeStr = "-";
					    String start=qq.replace(removeStr, "");
					    String end=cc.replace(removeStr, "");
					    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
					    //SimpleDateFormat format1 = new SimpleDateFormat("yyyyMM");
					    
					   // Date date = new Date();	
					    Date date = sdf.parse(cc);
						Calendar calendar = Calendar.getInstance();
						calendar.setTime(date); // 设置为当前时间
						calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) - 1); // 设置为上一个月 
						date = calendar.getTime();
						String nextDate = format.format(date);//上月结束时间  yyyyMMdd
						
						 Date date11 = sdf.parse(qq);
						String topDate = format.format(date11);//上月开始时间
						//需要截取到月份
			        	String start1 = start.substring(0,6);// 开始	
			        	String end1 = end.substring(0,6);// 结束	
						
						if(start1.equals(end1)){
							
		                	topDate=format.format(date);
		                	nextDate=format.format(date11);
							
							
							
							
							
						}
						
						//去年同期
						Date dateYear = sdf.parse(cc);
						Calendar calendar1 = Calendar.getInstance();
						calendar1.setTime(dateYear); 
						calendar1.set(Calendar.YEAR,calendar1.get(Calendar.YEAR) - 1);
						dateYear = calendar1.getTime();
						String nextYear = format.format(dateYear);//上月结束时间  yyyyMMdd
						
						
						Date dateEnd = sdf.parse(qq);
						Calendar calendar5 = Calendar.getInstance();
						calendar5.setTime(dateEnd); 
						calendar5.set(Calendar.YEAR,calendar5.get(Calendar.YEAR) - 1);
						dateEnd = calendar5.getTime();
						String topYear = format.format(dateEnd);//上月开始时间
		            	
						ModelInternet mdl=new ModelInternet();//当前日期
					    mdl.setType(type);
					    mdl.setSpec(spec);
					    mdl.setBrand(brand);
						mdl.setStartTime(start);
						mdl.setEndTime(end);
						ModelInternet topMonth=new ModelInternet();//上月
						topMonth.setType(type);
						topMonth.setSpec(spec);
						topMonth.setBrand(brand);
						topMonth.setStartTime(topDate);
						topMonth.setEndTime(nextDate);
						ModelInternet netYear=new ModelInternet();//去年同期
						netYear.setType(type);
						netYear.setSpec(spec);
						netYear.setBrand(brand);
						netYear.setStartTime(topYear);
						netYear.setEndTime(nextYear);
						
						if(timeKind==null || timeKind.equals("1")){
			            	
			            	List<ModelInternet> listBig = cityKpi2019Service.listMemoryRote(mdl);//当前日期大类 必须传日期格式的
			            	
			            	
			                if(listBig.size()>0){
			    			for(ModelInternet abo : listBig) {
			    				String fiveName = abo.getMemory();//手机品牌	
			    				String string = abo.getSaleprofit();//数量
			    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
			    				list.add(fiveName);
			    				list2.add(string);
			    			}
			    			 map.put("nowList", list);
			    			 map.put("nowAmount", list2);
			                }
			                
			            	}
			            	else if(timeKind!=null && timeKind.equals("2")){
			                //上月大类
			            	List<ModelInternet> listBig1 = cityKpi2019Service.listMemoryRote(topMonth);//上月大类
			                if(listBig1.size()>0){
			                	for(ModelInternet abo : listBig1) {
				    				String fiveName = abo.getMemory();//手机品牌	
				    				String string = abo.getSaleprofit();//数量
				    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
				    				month.add(fiveName);
				    				month2.add(string);
				    			}
//			                	 map.put("monthList", month);
//				    			 map.put("monthAmount", month2);
			                	 map.put("nowList", month);
				    			 map.put("nowAmount", month2);
			                	
			                } 
			               }
			                else if(timeKind!=null && timeKind.equals("3")){
			                    //去年同期
			                	List<ModelInternet> listBig2 = cityKpi2019Service.listMemoryRote(netYear);//去年同期大类
			        			if(listBig2.size()>0){
			        				for(ModelInternet abo : listBig2) {
					    				String fiveName = abo.getMemory();//手机品牌	
					    				String string = abo.getSaleprofit();//数量
					    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
					    				year.add(fiveName);
					    				year2.add(string);
					    			}
			        			
//			        				 map.put("yearList", year);
//					    			 map.put("yearAmount", year2);
			        				 map.put("nowList", year);
					    			 map.put("nowAmount", year2);
			        			
			        			
			        			
			                    }	
			                
			                }
		            	
		            	
		            	
		            	
		            	
		            	
		            	
		            }
		            
		                
		                
		                
		    			
					} catch (Exception e) {
						
						
						
						
					}
					
					
					
		           
		            
		            
		            return map;

				}			
				
				
				
              //对颜色进行取数
				
				@SuppressWarnings("unchecked")
				@ResponseBody
				@DS("dataSource")@RequestMapping(value = "/takeColor", method = RequestMethod.POST)
				public Map<String, Object> areaColor(Locale locale, Model models, HttpServletRequest request,
						HttpServletResponse response) throws ParseException {
					String pp = request.getParameter("pp");//月份和日期切换
					String timeKind = request.getParameter("timeKind");//本月和去年同期切换
					String brand = request.getParameter("brand");//大类
					String spec = request.getParameter("spec");//大类
					String memory = request.getParameter("memory");//大类
					String type = request.getParameter("type");//大类
					String qq = request.getParameter("start");//2019-01-01
					String cc = request.getParameter("end");
					
					//当前
					ArrayList<String> list =new ArrayList<String>();//品牌					
					ArrayList<String> list2 =new ArrayList<String>();//数量
					//上月	
					ArrayList<String> month =new ArrayList<String>();//品牌					
					ArrayList<String> month2 =new ArrayList<String>();//数量
					//去年同期
					ArrayList<String> year =new ArrayList<String>();//品牌					
					ArrayList<String> year2 =new ArrayList<String>();//数量
					HashMap<String, Object> map = new HashMap<String, Object>();
				        
		            try {
		            	if(pp==null || pp.equals("1")){
		            		String removeStr = "-";
						    String start=qq.replace(removeStr, "");
						    String end=cc.replace(removeStr, "");
						    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
						    SimpleDateFormat format1 = new SimpleDateFormat("yyyyMM");
						    
						   // Date date = new Date();	
						    Date date = sdf.parse(cc);
							Calendar calendar = Calendar.getInstance();
							calendar.setTime(date); // 设置为当前时间
							calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) - 1); // 设置为上一个月 
							date = calendar.getTime();
							String nextDate = format.format(date);//上月结束时间  yyyyMMdd
							
							 Date date11 = sdf.parse(qq);
							String topDate = format1.format(date11)+"01";//上月开始时间
							if(start.equals(end)){
								
			                	topDate=format.format(date);
			                	nextDate=format1.format(date11)+"01";
								
								
								
								
								
							}
							
							//去年同期
							Date dateYear = sdf.parse(cc);
							Calendar calendar1 = Calendar.getInstance();
							calendar1.setTime(dateYear); 
							calendar1.set(Calendar.YEAR,calendar1.get(Calendar.YEAR) - 1);
							dateYear = calendar1.getTime();
							String nextYear = format.format(dateYear);//上月结束时间  yyyyMMdd
							
							
							Date dateEnd = sdf.parse(qq);
							Calendar calendar5 = Calendar.getInstance();
							calendar5.setTime(dateEnd); 
							calendar5.set(Calendar.YEAR,calendar5.get(Calendar.YEAR) - 1);
							dateEnd = calendar5.getTime();
							String topYear = format1.format(dateEnd)+"01";//上月开始时间

							ModelInternet mdl=new ModelInternet();//当前日期
						    mdl.setType(type);
						    mdl.setSpec(spec);
						    mdl.setBrand(brand);
						    mdl.setMemory(memory);
							mdl.setStartTime(start);
							mdl.setEndTime(end);
							ModelInternet topMonth=new ModelInternet();//上月
							topMonth.setType(type);
							topMonth.setBrand(brand);
							topMonth.setSpec(spec);
							topMonth.setMemory(memory);
							topMonth.setStartTime(topDate);
							topMonth.setEndTime(nextDate);
							ModelInternet netYear=new ModelInternet();//去年同期
							netYear.setType(type);
							netYear.setBrand(brand);
							netYear.setSpec(spec);
							netYear.setMemory(memory);
							netYear.setStartTime(topYear);
							netYear.setEndTime(nextYear);
		            		
		            		
		            		
		            		
		            	
		            	if(timeKind==null || timeKind.equals("1")){
		            	
		            	List<ModelInternet> listBig = cityKpi2019Service.listColorRote(mdl);//当前日期大类 必须传日期格式的
		            	
		            	
		                if(listBig.size()>0){
		    			for(ModelInternet abo : listBig) {
		    				String fiveName = abo.getColor();//手机品牌	
		    				String string = abo.getSaleprofit();//数量
		    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
		    				list.add(fiveName);
		    				list2.add(string);
		    			}
		    			 map.put("nowList", list);
		    			 map.put("nowAmount", list2);
		                }
		                
		            	}
		            	else if(timeKind!=null && timeKind.equals("2")){
		                //上月大类
		            	List<ModelInternet> listBig1 = cityKpi2019Service.listColorRote(topMonth);//上月大类
		                if(listBig1.size()>0){
		                	for(ModelInternet abo : listBig1) {
			    				String fiveName = abo.getColor();//手机品牌	
			    				String string = abo.getSaleprofit();//数量
			    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
			    				month.add(fiveName);
			    				month2.add(string);
			    			}
//		                	 map.put("monthList", month);
//			    			 map.put("monthAmount", month2);
		                	 map.put("nowList", month);
			    			 map.put("nowAmount", month2);
		                	
		                } 
		               }
		                else if(timeKind!=null && timeKind.equals("3")){
		                    //去年同期
		                	List<ModelInternet> listBig2 = cityKpi2019Service.listColorRote(netYear);//去年同期大类
		        			if(listBig2.size()>0){
		        				for(ModelInternet abo : listBig2) {
				    				String fiveName = abo.getColor();//手机品牌	
				    				String string = abo.getSaleprofit();//数量
				    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
				    				year.add(fiveName);
				    				year2.add(string);
				    			}
		        			
//		        				 map.put("yearList", year);
//				    			 map.put("yearAmount", year2);
		        				 map.put("nowList", year);
				    			 map.put("nowAmount", year2);
		        			
		        			
		        			
		                    }	
		                
		                }
		            }else if(pp!=null || pp.equals("2")){
		            	String removeStr = "-";
					    String start=qq.replace(removeStr, "");
					    String end=cc.replace(removeStr, "");
					    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
					    //SimpleDateFormat format1 = new SimpleDateFormat("yyyyMM");
					    
					   // Date date = new Date();	
					    Date date = sdf.parse(cc);
						Calendar calendar = Calendar.getInstance();
						calendar.setTime(date); // 设置为当前时间
						calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) - 1); // 设置为上一个月 
						date = calendar.getTime();
						String nextDate = format.format(date);//上月结束时间  yyyyMMdd
						
						 Date date11 = sdf.parse(qq);
						String topDate = format.format(date11);//上月开始时间
						//需要截取到月份
			        	String start1 = start.substring(0,6);// 开始	
			        	String end1 = end.substring(0,6);// 结束	
						
						if(start1.equals(end1)){
							
		                	topDate=format.format(date);
		                	nextDate=format.format(date11);
							
							
							
							
							
						}
						
						//去年同期
						Date dateYear = sdf.parse(cc);
						Calendar calendar1 = Calendar.getInstance();
						calendar1.setTime(dateYear); 
						calendar1.set(Calendar.YEAR,calendar1.get(Calendar.YEAR) - 1);
						dateYear = calendar1.getTime();
						String nextYear = format.format(dateYear);//上月结束时间  yyyyMMdd
						
						
						Date dateEnd = sdf.parse(qq);
						Calendar calendar5 = Calendar.getInstance();
						calendar5.setTime(dateEnd); 
						calendar5.set(Calendar.YEAR,calendar5.get(Calendar.YEAR) - 1);
						dateEnd = calendar5.getTime();
						String topYear = format.format(dateEnd);//上月开始时间
		            	
						ModelInternet mdl=new ModelInternet();//当前日期
					    mdl.setType(type);
					    mdl.setSpec(spec);
					    mdl.setBrand(brand);
					    mdl.setMemory(memory);
						mdl.setStartTime(start);
						mdl.setEndTime(end);
						ModelInternet topMonth=new ModelInternet();//上月
						topMonth.setType(type);
						topMonth.setSpec(spec);
						topMonth.setBrand(brand);
						topMonth.setMemory(memory);
						topMonth.setStartTime(topDate);
						topMonth.setEndTime(nextDate);
						ModelInternet netYear=new ModelInternet();//去年同期
						netYear.setType(type);
						netYear.setSpec(spec);
						netYear.setBrand(brand);
						netYear.setMemory(memory);
						netYear.setStartTime(topYear);
						netYear.setEndTime(nextYear);
						
						if(timeKind==null || timeKind.equals("1")){
			            	
			            	List<ModelInternet> listBig = cityKpi2019Service.listColorRote(mdl);//当前日期大类 必须传日期格式的
			            	
			            	
			                if(listBig.size()>0){
			    			for(ModelInternet abo : listBig) {
			    				String fiveName = abo.getColor();//手机品牌	
			    				String string = abo.getSaleprofit();//数量
			    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
			    				list.add(fiveName);
			    				list2.add(string);
			    			}
			    			 map.put("nowList", list);
			    			 map.put("nowAmount", list2);
			                }
			                
			            	}
			            	else if(timeKind!=null && timeKind.equals("2")){
			                //上月大类
			            	List<ModelInternet> listBig1 = cityKpi2019Service.listColorRote(topMonth);//上月大类
			                if(listBig1.size()>0){
			                	for(ModelInternet abo : listBig1) {
				    				String fiveName = abo.getColor();//手机品牌	
				    				String string = abo.getSaleprofit();//数量
				    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
				    				month.add(fiveName);
				    				month2.add(string);
				    			}
//			                	 map.put("monthList", month);
//				    			 map.put("monthAmount", month2);
			                	 map.put("nowList", month);
				    			 map.put("nowAmount", month2);
			                	
			                } 
			               }
			                else if(timeKind!=null && timeKind.equals("3")){
			                    //去年同期
			                	List<ModelInternet> listBig2 = cityKpi2019Service.listColorRote(netYear);//去年同期大类
			        			if(listBig2.size()>0){
			        				for(ModelInternet abo : listBig2) {
					    				String fiveName = abo.getColor();//手机品牌	
					    				String string = abo.getSaleprofit();//数量
					    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
					    				year.add(fiveName);
					    				year2.add(string);
					    			}
			        			
//			        				 map.put("yearList", year);
//					    			 map.put("yearAmount", year2);
			        				 map.put("nowList", year);
					    			 map.put("nowAmount", year2);
			        			
			        			
			        			
			                    }	
			                
			                }
		            	
		            	
		            	
		            	
		            	
		            	
		            	
		            }
		            
		                
		                
		                
		    			
					} catch (Exception e) {
						
						
						
						
					}
					
					
					
		           
		            
		            
		            return map;

				}			
				

				
  //对渠道进行取数
				
				@SuppressWarnings("unchecked")
				@ResponseBody
				@DS("dataSource")@RequestMapping(value = "/takeQD", method = RequestMethod.POST)
				public Map<String, Object> areaClient(Locale locale, Model models, HttpServletRequest request,
						HttpServletResponse response) throws ParseException {
					String pp = request.getParameter("pp");//月份和日期切换
					String timeKind = request.getParameter("timeKind");//本月和去年同期切换
					String brand = request.getParameter("brand");//大类
					String spec = request.getParameter("spec");//大类
					String memory = request.getParameter("memory");//大类
					String color = request.getParameter("color");//大类
					String type = request.getParameter("type");//大类
					String qq = request.getParameter("start");//2019-01-01
					String cc = request.getParameter("end");
					
					//当前
					ArrayList<String> list =new ArrayList<String>();//品牌					
					ArrayList<String> list2 =new ArrayList<String>();//数量
					//上月	
					ArrayList<String> month =new ArrayList<String>();//品牌					
					ArrayList<String> month2 =new ArrayList<String>();//数量
					//去年同期
					ArrayList<String> year =new ArrayList<String>();//品牌					
					ArrayList<String> year2 =new ArrayList<String>();//数量
					HashMap<String, Object> map = new HashMap<String, Object>();
				        
		            try {
		            	if(pp==null || pp.equals("1")){
		            		String removeStr = "-";
						    String start=qq.replace(removeStr, "");
						    String end=cc.replace(removeStr, "");
						    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
						    SimpleDateFormat format1 = new SimpleDateFormat("yyyyMM");
						    
						   // Date date = new Date();	
						    Date date = sdf.parse(cc);
							Calendar calendar = Calendar.getInstance();
							calendar.setTime(date); // 设置为当前时间
							calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) - 1); // 设置为上一个月 
							date = calendar.getTime();
							String nextDate = format.format(date);//上月结束时间  yyyyMMdd
							
							 Date date11 = sdf.parse(qq);
							String topDate = format1.format(date11)+"01";//上月开始时间
							if(start.equals(end)){
								
			                	topDate=format.format(date);
			                	nextDate=format1.format(date11)+"01";
								
								
								
								
								
							}
							
							//去年同期
							Date dateYear = sdf.parse(cc);
							Calendar calendar1 = Calendar.getInstance();
							calendar1.setTime(dateYear); 
							calendar1.set(Calendar.YEAR,calendar1.get(Calendar.YEAR) - 1);
							dateYear = calendar1.getTime();
							String nextYear = format.format(dateYear);//上月结束时间  yyyyMMdd
							
							
							Date dateEnd = sdf.parse(qq);
							Calendar calendar5 = Calendar.getInstance();
							calendar5.setTime(dateEnd); 
							calendar5.set(Calendar.YEAR,calendar5.get(Calendar.YEAR) - 1);
							dateEnd = calendar5.getTime();
							String topYear = format1.format(dateEnd)+"01";//上月开始时间

							ModelInternet mdl=new ModelInternet();//当前日期
						    mdl.setType(type);
						    mdl.setSpec(spec);
						    mdl.setBrand(brand);
						    mdl.setMemory(memory);
						    mdl.setColor(color);
							mdl.setStartTime(start);
							mdl.setEndTime(end);
							ModelInternet topMonth=new ModelInternet();//上月
							topMonth.setType(type);
							topMonth.setBrand(brand);
							topMonth.setSpec(spec);
							topMonth.setColor(color);
							topMonth.setMemory(memory);
							topMonth.setStartTime(topDate);
							topMonth.setEndTime(nextDate);
							ModelInternet netYear=new ModelInternet();//去年同期
							netYear.setType(type);
							netYear.setBrand(brand);
							netYear.setSpec(spec);
							netYear.setColor(color);
							netYear.setMemory(memory);
							netYear.setStartTime(topYear);
							netYear.setEndTime(nextYear);
		            		
		            		
		            		
		            		
		            	
		            	if(timeKind==null || timeKind.equals("1")){
		            	
		            	List<ModelInternet> listBig = cityKpi2019Service.listClientNameRote(mdl);//当前日期大类 必须传日期格式的
		            	
		            	
		                if(listBig.size()>0){
		    			for(ModelInternet abo : listBig) {
		    				String fiveName = abo.getClientname();//手机品牌	
		    				String string = abo.getSaleprofit();//数量
		    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
		    				list.add(fiveName);
		    				list2.add(string);
		    			}
		    			 map.put("nowList", list);
		    			 map.put("nowAmount", list2);
		                }
		                
		            	}
		            	else if(timeKind!=null && timeKind.equals("2")){
		                //上月大类
		            	List<ModelInternet> listBig1 = cityKpi2019Service.listClientNameRote(topMonth);//上月大类
		                if(listBig1.size()>0){
		                	for(ModelInternet abo : listBig1) {
			    				String fiveName = abo.getClientname();//手机品牌	
			    				String string = abo.getSaleprofit();//数量
			    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
			    				month.add(fiveName);
			    				month2.add(string);
			    			}
//		                	 map.put("monthList", month);
//			    			 map.put("monthAmount", month2);
		                	 map.put("nowList", month);
			    			 map.put("nowAmount", month2);
		                	
		                } 
		               }
		                else if(timeKind!=null && timeKind.equals("3")){
		                    //去年同期
		                	List<ModelInternet> listBig2 = cityKpi2019Service.listClientNameRote(netYear);//去年同期大类
		        			if(listBig2.size()>0){
		        				for(ModelInternet abo : listBig2) {
				    				String fiveName = abo.getClientname();//手机品牌	
				    				String string = abo.getSaleprofit();//数量
				    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
				    				year.add(fiveName);
				    				year2.add(string);
				    			}
		        			
//		        				 map.put("yearList", year);
//				    			 map.put("yearAmount", year2);
		        				 map.put("nowList", year);
				    			 map.put("nowAmount", year2);
		        			
		        			
		        			
		                    }	
		                
		                }
		            }else if(pp!=null || pp.equals("2")){
		            	String removeStr = "-";
					    String start=qq.replace(removeStr, "");
					    String end=cc.replace(removeStr, "");
					    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
					    //SimpleDateFormat format1 = new SimpleDateFormat("yyyyMM");
					    
					   // Date date = new Date();	
					    Date date = sdf.parse(cc);
						Calendar calendar = Calendar.getInstance();
						calendar.setTime(date); // 设置为当前时间
						calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) - 1); // 设置为上一个月 
						date = calendar.getTime();
						String nextDate = format.format(date);//上月结束时间  yyyyMMdd
						
						 Date date11 = sdf.parse(qq);
						String topDate = format.format(date11);//上月开始时间
						//需要截取到月份
			        	String start1 = start.substring(0,6);// 开始	
			        	String end1 = end.substring(0,6);// 结束	
						
						if(start1.equals(end1)){
							
		                	topDate=format.format(date);
		                	nextDate=format.format(date11);
							
							
							
							
							
						}
						
						//去年同期
						Date dateYear = sdf.parse(cc);
						Calendar calendar1 = Calendar.getInstance();
						calendar1.setTime(dateYear); 
						calendar1.set(Calendar.YEAR,calendar1.get(Calendar.YEAR) - 1);
						dateYear = calendar1.getTime();
						String nextYear = format.format(dateYear);//上月结束时间  yyyyMMdd
						
						
						Date dateEnd = sdf.parse(qq);
						Calendar calendar5 = Calendar.getInstance();
						calendar5.setTime(dateEnd); 
						calendar5.set(Calendar.YEAR,calendar5.get(Calendar.YEAR) - 1);
						dateEnd = calendar5.getTime();
						String topYear = format.format(dateEnd);//上月开始时间
		            	
						ModelInternet mdl=new ModelInternet();//当前日期
					    mdl.setType(type);
					    mdl.setSpec(spec);
					    mdl.setBrand(brand);
					    mdl.setMemory(memory);
					    mdl.setColor(color);
						mdl.setStartTime(start);
						mdl.setEndTime(end);
						ModelInternet topMonth=new ModelInternet();//上月
						topMonth.setType(type);
						topMonth.setSpec(spec);
						topMonth.setBrand(brand);
						topMonth.setMemory(memory);
						topMonth.setColor(color);
						topMonth.setStartTime(topDate);
						topMonth.setEndTime(nextDate);
						ModelInternet netYear=new ModelInternet();//去年同期
						netYear.setType(type);
						netYear.setSpec(spec);
						netYear.setBrand(brand);
						netYear.setMemory(memory);
						netYear.setColor(color);
						netYear.setStartTime(topYear);
						netYear.setEndTime(nextYear);
						
						if(timeKind==null || timeKind.equals("1")){
			            	
			            	List<ModelInternet> listBig = cityKpi2019Service.listClientNameRote(mdl);//当前日期大类 必须传日期格式的
			            	
			            	
			                if(listBig.size()>0){
			    			for(ModelInternet abo : listBig) {
			    				String fiveName = abo.getClientname();//手机品牌	
			    				String string = abo.getSaleprofit();//数量
			    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
			    				list.add(fiveName);
			    				list2.add(string);
			    			}
			    			 map.put("nowList", list);
			    			 map.put("nowAmount", list2);
			                }
			                
			            	}
			            	else if(timeKind!=null && timeKind.equals("2")){
			                //上月大类
			            	List<ModelInternet> listBig1 = cityKpi2019Service.listClientNameRote(topMonth);//上月大类
			                if(listBig1.size()>0){
			                	for(ModelInternet abo : listBig1) {
				    				String fiveName = abo.getClientname();//手机品牌	
				    				String string = abo.getSaleprofit();//数量
				    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
				    				month.add(fiveName);
				    				month2.add(string);
				    			}
//			                	 map.put("monthList", month);
//				    			 map.put("monthAmount", month2);
			                	 map.put("nowList", month);
				    			 map.put("nowAmount", month2);
			                	
			                } 
			               }
			                else if(timeKind!=null && timeKind.equals("3")){
			                    //去年同期
			                	List<ModelInternet> listBig2 = cityKpi2019Service.listClientNameRote(netYear);//去年同期大类
			        			if(listBig2.size()>0){
			        				for(ModelInternet abo : listBig2) {
					    				String fiveName = abo.getClientname();//手机品牌	
					    				String string = abo.getSaleprofit();//数量
					    				//Double a = Double.valueOf(abo.getSaleprofit());//销量
					    				year.add(fiveName);
					    				year2.add(string);
					    			}
			        			
//			        				 map.put("yearList", year);
//					    			 map.put("yearAmount", year2);
			        				 map.put("nowList", year);
					    			 map.put("nowAmount", year2);
			        			
			        			
			        			
			                    }	
			                
			                }
		            	
		            	
		            	
		            	
		            	
		            	
		            	
		            }
		            
		                
		                
		                
		    			
					} catch (Exception e) {
						
						
						
						
					}
					
					
					
		           
		            
		            
		            return map;

				}			
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
	
		//查询库存周转的数据显示到页面
				@ResponseBody
				@DS("dataSource")@RequestMapping(value="/selectProductList", method = {RequestMethod.GET,RequestMethod.POST})
				public List<StockTurnOver> doSomeThings(HttpServletRequest request,HttpServletResponse response) throws IOException, ParseException  {
		            //String time="20200101";
		           String qq = request.getParameter("time");
		           //转变时间格式为20200101
		           SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");				   
		           SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		           List<StockTurnOver> listAllStock=null;
		          // String nextYear = format.format(dateYear);
		           
		           if(qq==null || "".equals(qq)){
		        	   String time ="20200101";
		        	   listAllStock = cityKpi2019Service.listAllStockRote(time);  
		           }
		           if(qq!=null && !"".equals(qq)){
		        	   Date date = sdf.parse(qq);
			           String time = format.format(date);  
			           listAllStock = cityKpi2019Service.listAllStockRote(time); 
		          
			         
		           
		           }
		           return listAllStock;
		           
		          // String format3 = format.format(qq);
		           //System.out.println(format3);
		           
		           
						
		           
		            	

				}
	
}

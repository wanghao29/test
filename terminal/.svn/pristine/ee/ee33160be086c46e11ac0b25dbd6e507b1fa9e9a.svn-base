package com.asiainfo.cmc.service.impl.brandmodel;
/**
 * 实时显示生命周期数据
 */

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.brandmodel.LifeDate;
import com.asiainfo.cmc.enties.brandmodel.NewDate;
import com.asiainfo.cmc.enties.brandmodel.ProductInformationSetMajor;
import com.asiainfo.cmc.mapper.brandmodel.LifeDateMapper;
import com.asiainfo.cmc.mapper.brandmodel.ProductInformationSetMajorMapper;
import com.asiainfo.cmc.service.brandmodel.QuantitySetService;

@Service
@Transactional
public class QuantitySetServiceImpl implements QuantitySetService {
	 @Resource
	 private ProductInformationSetMajorMapper productInformationSetMajorMapper;
	 @Resource
	 private LifeDateMapper lifeDateMapper;
	
	
	
	@SuppressWarnings("null")
	@Override
	public Map showAll(String brand, String spec, String COMPETBRANDNAME1, String COMPETSPEC1,
			String COMPETBRANDNAME2, String COMPETSPEC2) throws ParseException {
		Map<String,Object> map=new HashMap<String,Object>();
		//前面品牌参数
		ProductInformationSetMajor onePm = productInformationSetMajorMapper.selectOnePm(brand, spec);
		 if(onePm!=null) {
			 map.put("onePm",onePm); 
			
			 map.put("sname",onePm.getSNAME());
			 map.put("meterdes",onePm.getMETERDES());
		 }
		 
		 
		 //根据品牌和型号查询产品所属生命周期
		 List<LifeDate> lifeDate = lifeDateMapper.selectAllLife(brand, spec);
		 //-------------------------//查询起始时间
		 String time = lifeDateMapper.startTime(brand, spec);
		 List<NewDate> listDate=new ArrayList<NewDate>();
		 //所属时期
		 String cycle =null;
		 String startTime=time;
		 String endTime = null;
		 int week = 1;
		 SimpleDateFormat sdFormat=new SimpleDateFormat("yyyy-MM-dd");
		 Calendar calendar=Calendar.getInstance();
		 //总销量double=0
		 float totalPlan = 0;
		 
		 
		 for (LifeDate lifeDate2 : lifeDate) {
			 
			 cycle = lifeDate2.getCYCLE();
			 if(!cycle.equals("5")) {
			//每周销量=总销量/周数
			 //double 每周;
			 if(lifeDate2.getDURATION()!=0) {
			 float nowPlan =lifeDate2.getSALEAMOUNT()/lifeDate2.getDURATION();
			 
			 for(int i=1; i<=lifeDate2.getDURATION();i++) {
				 //根据起始时间和起始时间+6来查NewDate数据
			        calendar.setTime(sdFormat.parse(startTime));
			        calendar.add(Calendar.DATE, 6);
			        endTime = sdFormat.format(calendar.getTime());
				 NewDate newDate = lifeDateMapper.showAllNewDate(brand, spec, COMPETBRANDNAME1, COMPETSPEC1, COMPETBRANDNAME2, COMPETSPEC2, 
						 time, startTime, endTime);
				 
				 //当前本周利润
				 float weekSale = newDate.getWeekSale();
				 if(nowPlan!=0.0) {					 
					 //对标规划值
					 float benchPlan=(weekSale-nowPlan)/nowPlan*100; 
					 //去除小数点
					 int round = Math.round(benchPlan);
					 //对标规划值设置
					 newDate.setBenchPlan(round);
				 }
				 //对标对标品
				 float BenchSale=newDate.getBenchSale();
                 if(BenchSale!=0.0) {
                	 
                	 float benching= (weekSale-BenchSale)/BenchSale*100;
    				 int bench = Math.round(benching); 
    				//对标对标品
    				 newDate.setBenching(bench);
                
                 }

				 //对标竞品
				 float competitorSale = newDate.getCompetitorSale();
				
				 if(competitorSale!=0.0) {
					 float competitor=(weekSale-competitorSale)/competitorSale*100;
					 int competitored = Math.round(competitor); 
					//对标竞品规划值
					 newDate.setBenchCompetitor(competitored);
				 }

				 // String format = nformat.format(benchPlan);
				 // newDate.set每周销量
				 BigDecimal   c  =   new BigDecimal(nowPlan);  
				 float   f2   =  c.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();  
				 //newDate.setTotalPlan(f2);
				 newDate.setNowPlan(f2);
				// newDate.set总销量（总销量+每周销量）
				 totalPlan= totalPlan+nowPlan;
				 BigDecimal   b  =   new BigDecimal(totalPlan);  
				 float   f1   =  b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();  
				 newDate.setTotalPlan(f1);
				 if(week==1) {
					 newDate.setBrandname(onePm.getBRANDNAME());
					 newDate.setSname(onePm.getSNAME());
					 newDate.setSpec(onePm.getSPEC());
					 newDate.setMeterdes(onePm.getMETERDES());
				 }
				
				
				
				 newDate.setStartTime(startTime);
				 newDate.setEndTime(endTime);
				 newDate.setWeek(week++);
				 newDate.setPlanDate(cycle);
				 newDate.setCompatitor(cycle);
				 listDate.add(newDate);
				 calendar.add(Calendar.DATE, 1);
			        startTime = sdFormat.format(calendar.getTime());
			 }
			 
			 }
		 }
		 }	
		
		 map.put("newDate",listDate); 
		
		return map;
	}


//对实时操盘利润进行取值
	@Override
	public Map showAllLi(String brand, String spec, String COMPETBRANDNAME1, String COMPETSPEC1,
			String COMPETBRANDNAME2, String COMPETSPEC2) throws ParseException {
		Map<String,Object> map=new HashMap<String,Object>();
		//前面品牌参数
		ProductInformationSetMajor onePm = productInformationSetMajorMapper.selectOnePm(brand, spec);
		 if(onePm!=null) {
			 map.put("onePm",onePm); 
			 map.put("sname",onePm.getSNAME());
			 map.put("meterdes",onePm.getMETERDES());
		 }
		//根据品牌和型号查询产品所属生命周期
		 List<LifeDate> lifeDate = lifeDateMapper.selectAllLife(brand, spec);
		 //-------------------------//查询起始时间
		 String time = lifeDateMapper.startTime(brand, spec);
		 List<NewDate> listDate=new ArrayList<NewDate>();
		 //所属时期
		 String cycle =null;
		 String startTime=time;
		 String endTime = null;
		 int week = 1;
		 SimpleDateFormat sdFormat=new SimpleDateFormat("yyyy-MM-dd");
		 Calendar calendar=Calendar.getInstance();
		
		 //总销量double=0
		 float totalPlan = 0;
		 for (LifeDate lifeDate2 : lifeDate) {
			 cycle = lifeDate2.getCYCLE();
			 if(!cycle.equals("5")) {
			
			/* format1.parse(startTime);*/
			 
			 //每周销量=总销量/周数
			 //double 每周;
			 if(lifeDate2.getDURATION()!=0) {
			 float nowPlan =lifeDate2.getMAORI()/lifeDate2.getDURATION();
			 System.err.println("nowPlan："+nowPlan);
			 
			 
			 for(int i=1; i<=lifeDate2.getDURATION();i++) {
				 //根据起始时间和起始时间+6来查NewDate数据
			        calendar.setTime(sdFormat.parse(startTime));
			        calendar.add(Calendar.DATE, 6);
			        endTime = sdFormat.format(calendar.getTime());
				 NewDate newDate = lifeDateMapper.showProfit(brand, spec, COMPETBRANDNAME1, COMPETSPEC1, COMPETBRANDNAME2, COMPETSPEC2, 
						 time, startTime, endTime);
				 //当前本周利润
				 float weekSale = newDate.getWeekSale();
				 //对标规划值
				if(nowPlan!=0.0) {
					 float benchPlan=(weekSale-nowPlan)/nowPlan*100;
					 //去除小数点
					 int round = Math.round(benchPlan);	
					 //对标规划值设置
					 newDate.setBenchPlan(round);
				}
				
				 //对标对标品
				 float BenchSale=newDate.getBenchSale();
				 if(BenchSale!=0.0) {
					 float benching= (weekSale-BenchSale)/BenchSale*100;
					 int bench = Math.round(benching);
					//对标对标品
					 newDate.setBenching(bench);
				 }
				
				 //对标竞品
				 float competitorSale = newDate.getCompetitorSale();
				 if(competitorSale!=0.0) {
					 float competitor=(weekSale-competitorSale)/competitorSale*100;
					 int competitored = Math.round(competitor); 
					//对标竞品规划值
					 newDate.setBenchCompetitor(competitored);
				 }
				 
				 // String format = nformat.format(benchPlan);
				 // newDate.set每周销量
				 BigDecimal   c  =   new BigDecimal(nowPlan);  
				 float   f2   =  c.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();  
				 newDate.setNowPlan(f2);
				// newDate.set总销量（总销量+每周销量）
				 totalPlan= totalPlan+nowPlan;
				 BigDecimal   b  =   new BigDecimal(totalPlan);  
				 float   f1   =  b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();  
				 newDate.setTotalPlan(f1);
				 if(week==1) {
					 newDate.setBrandname(onePm.getBRANDNAME());
					 newDate.setSname(onePm.getSNAME());
					 newDate.setSpec(onePm.getSPEC());
					 newDate.setMeterdes(onePm.getMETERDES());
				 }

				 newDate.setStartTime(startTime);
				 newDate.setEndTime(endTime);
				 newDate.setWeek(week++);
				 newDate.setPlanDate(cycle);
				 newDate.setCompatitor(cycle);
				 listDate.add(newDate);
				 calendar.add(Calendar.DATE, 1);
			        startTime = sdFormat.format(calendar.getTime());
			 }
			 
			 }
		 }
		 }	
		
		 map.put("newDate",listDate); 
		
		return map;
	}

/**
 * 价格取数
 */
	@Override
	public Map showAllprice(String brand, String spec, String COMPETBRANDNAME1, String COMPETSPEC1,
			String COMPETBRANDNAME2, String COMPETSPEC2) throws ParseException {
		Map<String,Object> map=new HashMap<String,Object>();
		//前面品牌参数
		ProductInformationSetMajor onePm = productInformationSetMajorMapper.selectOnePm(brand, spec);
		 if(onePm!=null) {
			 map.put("onePm",onePm);
			 map.put("sname",onePm.getSNAME());
			 map.put("meterdes",onePm.getMETERDES());
		 }
		//根据品牌和型号查询产品所属生命周期
		 List<LifeDate> lifeDate = lifeDateMapper.selectAllLife(brand, spec);
		 //-------------------------//查询起始时间
		 String time = lifeDateMapper.startTime(brand, spec);
		 List<NewDate> listDate=new ArrayList<NewDate>();
		 //所属时期
		 String cycle =null;
		 String startTime=time;
		 String endTime = null;
		 int week = 1;
		 SimpleDateFormat sdFormat=new SimpleDateFormat("yyyy-MM-dd");
		 Calendar calendar=Calendar.getInstance();

		 for (LifeDate lifeDate2 : lifeDate) {
			 cycle = lifeDate2.getCYCLE();
			 if(!cycle.equals("5")) {
			/* format1.parse(startTime);*/

			 for(int i=1; i<=lifeDate2.getDURATION();i++) {
				 //根据起始时间和起始时间+6来查NewDate数据
			        calendar.setTime(sdFormat.parse(startTime));
			        calendar.add(Calendar.DATE, 6);
			        endTime = sdFormat.format(calendar.getTime());
				 NewDate newDate = lifeDateMapper.showPrice(brand, spec, COMPETBRANDNAME1, COMPETSPEC1, COMPETBRANDNAME2, COMPETSPEC2, 
						 time, startTime, endTime);
			
				 //当前本周利润
				 float weekSale =0 ;
				 float benchSale=0;
				 float competitorSale=0;
				 weekSale= newDate==null?0:newDate.getWeekSale();
				 
				 //对标对标品
				benchSale=newDate==null?0:newDate.getBenchSale();
				
				 //对标竞品
				 competitorSale=newDate ==null?0:newDate.getCompetitorSale();
				 
				 newDate = newDate!=null?newDate:(new NewDate());
				 
				 
				 if(week==1) {
					 newDate.setBrandname(onePm.getBRANDNAME());
					 newDate.setSname(onePm.getSNAME());
					 newDate.setSpec(onePm.getSPEC());
					 newDate.setMeterdes(onePm.getMETERDES());
				 }

				//对标对标品
				 newDate.setWeekSale(weekSale);
				 //对标规划值设置
				 newDate.setBenchSale(benchSale);
				//对标竞品规划值
				 newDate.setCompetitorSale(competitorSale);
				 
				 newDate.setStartTime(startTime);
				 newDate.setEndTime(endTime);
				 newDate.setWeek(week++);
				 newDate.setPlanDate(cycle);
				 newDate.setCompatitor(cycle);
				 listDate.add(newDate);
				 calendar.add(Calendar.DATE, 1);
			        startTime = sdFormat.format(calendar.getTime());
			 }
			 
		 }	 
		}	
		
		 map.put("newDate",listDate); 
		
		return map;
	}

/**
 * 覆取数据
 */
	@Override
	public Map showAllcover(String brand, String spec, String COMPETBRANDNAME1, String COMPETSPEC1,
			String COMPETBRANDNAME2, String COMPETSPEC2) throws ParseException {
		Map<String,Object> map=new HashMap<String,Object>();
		//前面品牌参数
		ProductInformationSetMajor onePm = productInformationSetMajorMapper.selectOnePm(brand, spec);
		 if(onePm!=null) {
			 map.put("onePm",onePm); 
			 map.put("sname",onePm.getSNAME());
			 map.put("meterdes",onePm.getMETERDES());
		 }
		//根据品牌和型号查询产品所属生命周期
		 List<LifeDate> lifeDate = lifeDateMapper.selectAllLife(brand, spec);
		 //-------------------------//查询起始时间
		 String time = lifeDateMapper.startTime(brand, spec);
		 List<NewDate> listDate=new ArrayList<NewDate>();
		 //所属时期
		 String cycle =null;
		 String startTime=time;
		 String endTime = null;
		 int week = 1;
		 SimpleDateFormat sdFormat=new SimpleDateFormat("yyyy-MM-dd");
		 Calendar calendar=Calendar.getInstance();
		 
		//总销量double=0
		 float totalPlan = 0;
		 
		 for (LifeDate lifeDate2 : lifeDate) {
			 cycle = lifeDate2.getCYCLE();
			 if(!cycle.equals("5")) {
			/* format1.parse(startTime);*/
			 //每周销量=总销量/周数
			 //double 每周;
			 if(lifeDate2.getDURATION()!=0) {
			 float nowPlan =lifeDate2.getOVERAMOUNT()/lifeDate2.getDURATION();
			 
			 for(int i=1; i<=lifeDate2.getDURATION();i++) {
				 //根据起始时间和起始时间+6来查NewDate数据
			        calendar.setTime(sdFormat.parse(startTime));
			        calendar.add(Calendar.DATE, 6);
			        endTime = sdFormat.format(calendar.getTime());
				 NewDate newDate = lifeDateMapper.showCover(brand, spec, COMPETBRANDNAME1, COMPETSPEC1, COMPETBRANDNAME2, COMPETSPEC2, 
						 time, startTime, endTime);
				
				 //当前本周利润
				 float weekSale = newDate.getWeekSale();
				if(nowPlan!=0.0) {
					 //对标规划值
					 float benchPlan=(weekSale-nowPlan)/nowPlan*100;
					 //去除小数点
					 int round = Math.round(benchPlan);	
					 //对标规划值设置
					 newDate.setBenchPlan(round);	
				}
				
				 //对标对标品
				 float BenchSale=newDate.getBenchSale();
				if(BenchSale!=0.0) {
					 float benching= (weekSale-BenchSale)/BenchSale*100;
					 int bench = Math.round(benching);
					//对标对标品
					 newDate.setBenching(bench);
					
				}
				
				 //对标竞品
				 float competitorSale = newDate.getCompetitorSale();
				 if(competitorSale!=0.0) {
					 float competitor=(weekSale-competitorSale)/competitorSale*100;
					 int competitored = Math.round(competitor);
					//对标竞品规划值
					 newDate.setBenchCompetitor(competitored);
					 
				 }
				
				 // String format = nformat.format(benchPlan);
				 // newDate.set每周销量
				 BigDecimal   c  =   new BigDecimal(nowPlan);  
				 float   f2   =  c.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();  
				 newDate.setNowPlan(f2);
				// newDate.set总销量（总销量+每周销量）
				 totalPlan= totalPlan+nowPlan;
				 BigDecimal   b  =   new BigDecimal(totalPlan);  
				 float   f1   =  b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();  
				 newDate.setTotalPlan(f1);
				 
				 
				 
				 if(week==1) {
					 newDate.setBrandname(onePm.getBRANDNAME());
					 newDate.setSname(onePm.getSNAME());
					 newDate.setSpec(onePm.getSPEC());
					 newDate.setMeterdes(onePm.getMETERDES());
				 }

				 newDate.setStartTime(startTime);
				 newDate.setEndTime(endTime);
				 newDate.setWeek(week++);
				 newDate.setPlanDate(cycle);
				 newDate.setCompatitor(cycle);
				 listDate.add(newDate);
				 calendar.add(Calendar.DATE, 1);
			        startTime = sdFormat.format(calendar.getTime());
			 }
			 
			 }
		 }
		 }	
		
		 map.put("newDate",listDate); 
		
		return map;
	}

/**
 * 库取数据
 */
	@Override
	public Map showAllstock(String brand, String spec, String COMPETBRANDNAME1, String COMPETSPEC1,
			String COMPETBRANDNAME2, String COMPETSPEC2) throws ParseException {
		Map<String,Object> map=new HashMap<String,Object>();
		//前面品牌参数
		ProductInformationSetMajor onePm = productInformationSetMajorMapper.selectOnePm(brand, spec);
		 if(onePm!=null) {
			 map.put("onePm",onePm); 
			 map.put("sname",onePm.getSNAME());
			 map.put("meterdes",onePm.getMETERDES());
		 }
		//根据品牌和型号查询产品所属生命周期
		 List<LifeDate> lifeDate = lifeDateMapper.selectAllLife(brand, spec);
		 //-------------------------//查询起始时间
		 String time = lifeDateMapper.startTime(brand, spec);
		 List<NewDate> listDate=new ArrayList<NewDate>();
		 //所属时期
		 String cycle =null;
		 String startTime=time;
		 String endTime = null;
		 int week = 1;
		 SimpleDateFormat sdFormat=new SimpleDateFormat("yyyy-MM-dd");
		 Calendar calendar=Calendar.getInstance();
		 //总销量double=0
		 float totalPlan = 0;
		 
		 for (LifeDate lifeDate2 : lifeDate) {
			 cycle = lifeDate2.getCYCLE();
			 if(!cycle.equals("5")) {
			/* format1.parse(startTime);*/
			 //每周销量=总销量/周数
			 //double 每周;
			 if(lifeDate2.getDURATION()!=0) {
			 float nowPlan =lifeDate2.getTURNOVERTIME()/lifeDate2.getDURATION();
			 for(int i=1; i<=lifeDate2.getDURATION();i++) {
				 //根据起始时间和起始时间+6来查NewDate数据
			        calendar.setTime(sdFormat.parse(startTime));
			        calendar.add(Calendar.DATE, 6);
			        endTime = sdFormat.format(calendar.getTime());
				 NewDate newDate = lifeDateMapper.showStock(brand, spec, COMPETBRANDNAME1, COMPETSPEC1, COMPETBRANDNAME2, COMPETSPEC2, 
						 time, startTime, endTime);
				 //当前本周利润
				 float weekSale = newDate.getWeekSale();
				if(nowPlan!=0.0) {
					//对标规划值
					float benchPlan=(weekSale-nowPlan)/nowPlan*100;
					//去除小数点
					int round = Math.round(benchPlan);
					 //对标规划值设置
					 newDate.setBenchPlan(round);
				}
				 
				 //对标对标品
				 float BenchSale=newDate.getBenchSale();
				if(BenchSale!=0.0) {
					float benching= (weekSale-BenchSale)/BenchSale*100;
					int bench = Math.round(benching);
					//对标对标品
					 newDate.setBenching(bench);
					
				}
				 
				 //对标竞品
				 float competitorSale = newDate.getCompetitorSale();
				if(competitorSale!=0.0) {
					float competitor=(weekSale-competitorSale)/competitorSale*100;
					int competitored = Math.round(competitor);
					//对标竞品规划值
					newDate.setBenchCompetitor(competitored);
					
					
				}
				 
				 // String format = nformat.format(benchPlan);
				 // newDate.set每周销量
				
				 BigDecimal   c  =   new BigDecimal(nowPlan);  
				 float   f2   =  c.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();  
				 newDate.setNowPlan(f2);
				// newDate.set总销量（总销量+每周销量）
				 totalPlan= totalPlan+nowPlan;
				 BigDecimal   b  =   new BigDecimal(totalPlan);  
				 float   f1   =  b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();  
				 newDate.setTotalPlan(f1);
				 
				 if(week==1) {
					 newDate.setBrandname(onePm.getBRANDNAME());
					 newDate.setSname(onePm.getSNAME());
					 newDate.setSpec(onePm.getSPEC());
					 newDate.setMeterdes(onePm.getMETERDES());
				 }

				 newDate.setStartTime(startTime);
				 newDate.setEndTime(endTime);
				 newDate.setWeek(week++);
				 newDate.setPlanDate(cycle);
				 newDate.setCompatitor(cycle);
				 listDate.add(newDate);
				 calendar.add(Calendar.DATE, 1);
			        startTime = sdFormat.format(calendar.getTime());
			 }
			 
			 }
		
		 }
		 }	
		
		 map.put("newDate",listDate); 
		
		return map;
	}

/**
 * 份取数据
 */
	
	@Override
	public Map showAllshare(String brand, String spec, String COMPETBRANDNAME1, String COMPETSPEC1,
			String COMPETBRANDNAME2, String COMPETSPEC2) throws ParseException {
		Map<String,Object> map=new HashMap<String,Object>();
		//前面品牌参数
		ProductInformationSetMajor onePm = productInformationSetMajorMapper.selectOnePm(brand, spec);
		 if(onePm!=null) {
			 map.put("onePm",onePm); 
			 map.put("sname",onePm.getSNAME());
			 map.put("meterdes",onePm.getMETERDES());
		 }
		//根据品牌和型号查询产品所属生命周期
		 List<LifeDate> lifeDate = lifeDateMapper.selectAllLife(brand, spec);
		 //-------------------------//查询起始时间
		 String time = lifeDateMapper.startTime(brand, spec);
		 List<NewDate> listDate=new ArrayList<NewDate>();
		 //所属时期
		 String cycle =null;
		 String startTime=time;
		 String endTime = null;
		 int week = 1;
		 SimpleDateFormat sdFormat=new SimpleDateFormat("yyyy-MM-dd");
		 Calendar calendar=Calendar.getInstance();
		 
		//总销量double=0
		 float totalPlan = 0;
		 for (LifeDate lifeDate2 : lifeDate) {
			 cycle = lifeDate2.getCYCLE();
			 if(!cycle.equals("5")) {
			/* format1.parse(startTime);*/
			 //每周销量=总销量/周数
			 //double 每周;
			 if(lifeDate2.getDURATION()!=0) {
			 float nowPlan =lifeDate2.getSHARE()/lifeDate2.getDURATION();
			 for(int i=1; i<=lifeDate2.getDURATION();i++) {
				 //根据起始时间和起始时间+6来查NewDate数据
			        calendar.setTime(sdFormat.parse(startTime));
			        calendar.add(Calendar.DATE, 6);
			        endTime = sdFormat.format(calendar.getTime());
				 NewDate newDate = lifeDateMapper.showShare(brand, spec, COMPETBRANDNAME1, COMPETSPEC1, COMPETBRANDNAME2, COMPETSPEC2, 
						 time, startTime, endTime);
				 //当前本周利润
				 float weekSale = newDate.getWeekSale();
				if(nowPlan!=0.0) {
					//对标规划值
					float benchPlan=(weekSale-nowPlan)/nowPlan*100;
					//去除小数点
					int round = Math.round(benchPlan);
					 //对标规划值设置
					 newDate.setBenchPlan(round);
	
				}
				 
				 //对标对标品
				 float BenchSale=newDate.getBenchSale();
				if(BenchSale!=0.0) {
				 
				 float benching= (weekSale-BenchSale)/BenchSale*100;
				 int bench = Math.round(benching);
				//对标对标品
				 newDate.setBenching(bench);
				}
				 //对标竞品
				 float competitorSale = newDate.getCompetitorSale();
				if(competitorSale!=0.0) {
					float competitor=(weekSale-competitorSale)/competitorSale*100;
					int competitored = Math.round(competitor);
					//对标竞品规划值
					 newDate.setBenchCompetitor(competitored);
				}
				 // String format = nformat.format(benchPlan);
				 // newDate.set每周销量
				 BigDecimal   c  =   new BigDecimal(nowPlan);  
				 float   f2   =  c.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();  
				 newDate.setNowPlan(f2);
				// newDate.set总销量（总销量+每周销量）
				 totalPlan= totalPlan+nowPlan;
				 BigDecimal   b  =   new BigDecimal(totalPlan);  
				 float   f1   =  b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();  
				 newDate.setTotalPlan(f1);
				 
				 if(week==1) {
					 newDate.setBrandname(onePm.getBRANDNAME());
					 newDate.setSname(onePm.getSNAME());
					 newDate.setSpec(onePm.getSPEC());
					 newDate.setMeterdes(onePm.getMETERDES());
				 }

				 newDate.setStartTime(startTime);
				 newDate.setEndTime(endTime);
				 newDate.setWeek(week++);
				 newDate.setPlanDate(cycle);
				 newDate.setCompatitor(cycle);
				 listDate.add(newDate);
				 calendar.add(Calendar.DATE, 1);
			        startTime = sdFormat.format(calendar.getTime());
			 }
			 
			 }
		 }
		 }	
		
		 map.put("newDate",listDate); 
		
		return map;
	}
/**
 * 秩
 */

	@Override
	public Map showAllorder(String brand, String spec, String COMPETBRANDNAME1, String COMPETSPEC1,
			String COMPETBRANDNAME2, String COMPETSPEC2) throws ParseException {
		Map<String,Object> map=new HashMap<String,Object>();
		//前面品牌参数
		ProductInformationSetMajor onePm = productInformationSetMajorMapper.selectOnePm(brand, spec);
		 if(onePm!=null) {
			 map.put("onePm",onePm);
			 map.put("sname",onePm.getSNAME());
			 map.put("meterdes",onePm.getMETERDES());
		 }
		//根据品牌和型号查询产品所属生命周期
		 List<LifeDate> lifeDate = lifeDateMapper.selectAllLife(brand, spec);
		 //-------------------------//查询起始时间
		 String time = lifeDateMapper.startTime(brand, spec);
		 List<NewDate> listDate=new ArrayList<NewDate>();
		 //所属时期
		 String cycle =null;
		 String startTime=time;
		 String endTime = null;
		 int week = 1;
		 SimpleDateFormat sdFormat=new SimpleDateFormat("yyyy-MM-dd");
		 Calendar calendar=Calendar.getInstance();
		
		 for (LifeDate lifeDate2 : lifeDate) {
			 cycle = lifeDate2.getCYCLE();
			 if(!cycle.equals("5")) {
			/* format1.parse(startTime);*/
			 
			 for(int i=1; i<=lifeDate2.getDURATION();i++) {
				 //根据起始时间和起始时间+6来查NewDate数据
			        calendar.setTime(sdFormat.parse(startTime));
			        calendar.add(Calendar.DATE, 6);
			        endTime = sdFormat.format(calendar.getTime());
				 NewDate newDate = lifeDateMapper.showOrder(brand, spec, COMPETBRANDNAME1, COMPETSPEC1, COMPETBRANDNAME2, COMPETSPEC2, 
						 time, startTime, endTime);
		
				 
				 //当前本周利润
				 float weekSale =0 ;
				 float benchSale=0;
				 float competitorSale=0;
				 weekSale= newDate==null?0:newDate.getWeekSale();
				 
				 //对标对标品
				benchSale=newDate==null?0:newDate.getBenchSale();
				
				 //对标竞品
				 competitorSale=newDate ==null?0:newDate.getCompetitorSale();
				 
				 newDate = newDate!=null?newDate:(new NewDate());
				 
				 if(week==1) {
					 newDate.setBrandname(onePm.getBRANDNAME());
					 newDate.setSname(onePm.getSNAME());
					 newDate.setSpec(onePm.getSPEC());
					 newDate.setMeterdes(onePm.getMETERDES());
				 }
				//对标对标品
				 newDate.setWeekSale(weekSale);
				 //对标规划值设置
				 newDate.setBenchSale(benchSale);
				//对标竞品规划值
				 newDate.setCompetitorSale(competitorSale);
				 newDate.setStartTime(startTime);
				 newDate.setEndTime(endTime);
				 newDate.setWeek(week++);
				 newDate.setPlanDate(cycle);
				 newDate.setCompatitor(cycle);
				 listDate.add(newDate);
				 calendar.add(Calendar.DATE, 1);
			        startTime = sdFormat.format(calendar.getTime());
			 }
			 
		 }	 
		}	
		
		 map.put("newDate",listDate); 
		
		return map;
	}

/**
 * 收
 */
	@Override
	public Map showAllincome(String brand, String spec, String COMPETBRANDNAME1, String COMPETSPEC1,
			String COMPETBRANDNAME2, String COMPETSPEC2) throws ParseException {
		Map<String,Object> map=new HashMap<String,Object>();
		//前面品牌参数
		ProductInformationSetMajor onePm = productInformationSetMajorMapper.selectOnePm(brand, spec);
		 if(onePm!=null) {
			 map.put("onePm",onePm); 
			 map.put("sname",onePm.getSNAME());
			 map.put("meterdes",onePm.getMETERDES());
		 }
		//根据品牌和型号查询产品所属生命周期
		 List<LifeDate> lifeDate = lifeDateMapper.selectAllLife(brand, spec);
		 //-------------------------//查询起始时间
		 String time = lifeDateMapper.startTime(brand, spec);
		 List<NewDate> listDate=new ArrayList<NewDate>();
		 //所属时期
		 String cycle =null;
		 String startTime=time;
		 String endTime = null;
		 int week = 1;
		 SimpleDateFormat sdFormat=new SimpleDateFormat("yyyy-MM-dd");
		 Calendar calendar=Calendar.getInstance();
		//总销量double=0
		 float totalPlan = 0;
		 for (LifeDate lifeDate2 : lifeDate) {
			 cycle = lifeDate2.getCYCLE();
			 if(!cycle.equals("5")) {
			/* format1.parse(startTime);*/
			//每周销量=总销量/周数
			 //double 每周;
			 if(lifeDate2.getDURATION()!=0) {
			 float nowPlan =lifeDate2.getINCOME()/lifeDate2.getDURATION();
			 for(int i=1; i<=lifeDate2.getDURATION();i++) {
				 //根据起始时间和起始时间+6来查NewDate数据
			        calendar.setTime(sdFormat.parse(startTime));
			        calendar.add(Calendar.DATE, 6);
			        endTime = sdFormat.format(calendar.getTime());
				 NewDate newDate = lifeDateMapper.showIncome(brand, spec, COMPETBRANDNAME1, COMPETSPEC1, COMPETBRANDNAME2, COMPETSPEC2, 
						 time, startTime, endTime);
				 
				 //当前本周利润
				 float weekSale = newDate.getWeekSale();
				if(nowPlan!=0.0) {
					//对标规划值
					float benchPlan=(weekSale-nowPlan)/nowPlan*100;
					//去除小数点
					int round = Math.round(benchPlan);
					 //对标规划值设置
					 newDate.setBenchPlan(round);
					
					
				}
				 
				 //对标对标品
				 float BenchSale=newDate.getBenchSale();
				if(BenchSale!=0.0) {
					float benching= (weekSale-BenchSale)/BenchSale*100;
					int bench = Math.round(benching);
					//对标对标品
					 newDate.setBenching(bench);
					
				}
				 //对标竞品
				 float competitorSale = newDate.getCompetitorSale();
				if(competitorSale!=0.0) {
					float competitor=(weekSale-competitorSale)/competitorSale*100;
					int competitored = Math.round(competitor);
					
					//对标竞品规划值
					newDate.setBenchCompetitor(competitored);
					
					
				}
				 // String format = nformat.format(benchPlan);
				 // newDate.set每周销量
				 BigDecimal   c  =   new BigDecimal(nowPlan);  
				 float   f2   =  c.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();  
				 newDate.setNowPlan(f2);
				// newDate.set总销量（总销量+每周销量）
				 totalPlan= totalPlan+nowPlan;
				 BigDecimal   b  =   new BigDecimal(totalPlan);  
				 float   f1   =  b.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();  
				 newDate.setTotalPlan(f1);
				 if(week==1) {
					 newDate.setBrandname(onePm.getBRANDNAME());
					 newDate.setSname(onePm.getSNAME());
					 newDate.setSpec(onePm.getSPEC());
					 newDate.setMeterdes(onePm.getMETERDES());
				 }
				
				
				 newDate.setStartTime(startTime);
				 newDate.setEndTime(endTime);
				 newDate.setWeek(week++);
				 newDate.setPlanDate(cycle);
				 newDate.setCompatitor(cycle);
				 listDate.add(newDate);
				 calendar.add(Calendar.DATE, 1);
			        startTime = sdFormat.format(calendar.getTime());
			 }
			 
			 } 
		 }
		 }	
		
		 map.put("newDate",listDate); 
		
		return map;
	}

}

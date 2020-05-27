package com.asiainfo.cmc.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * 时间的常方法
 * 
 * @author meiyuxiang
 * @created 2008-11-7 下午03:41:23
 * @version $Id 1.0$ <code>History</code><br/> Date Author Action<br>
 *          2008-11-7 houyanping New File: DateUtils.java<br>
 */
public class DateUtils {
	
	/**
     * 获取当前时间
     * @return yyyyMMddHHmmss
     */
    public static String GetCurTime()
    {
    	SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String curTime = formatter.format(new Date());
		return curTime;    	
    }

    
    /**
     * 获取当前日期
     * @return yyyyMMdd
     */
    public static String GetCurDate()
    {
    	SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
    	String curDate = formatter.format(new Date());		
		return curDate;    	
    }
	/**
	 * 获取包括当前日期在内的过去几天的日期
	 * 
	 * @param daycount 需要返回的天数
	 * @return yyyy-MM-dd格式的字符串组成的数组
	 */
	public static String GetBeforeDate(int daycount) {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -daycount);
		Date dt = cal.getTime();
		String str = DateToStr(dt, "yyyyMMdd");
		return str;
	}
    /**
     * 取前或后hour个小时的时间
     * @param hour（为正数则取hour小时后的时间，为负数则取hour小时前的时间）
     * @param format	按指定格式返回
     * @return
     */
    public static String GetLastTime(int hour,String format){
	    java.util.Calendar Cal=java.util.Calendar.getInstance(); 
		Cal.add(java.util.Calendar.HOUR_OF_DAY,hour); 

		SimpleDateFormat formatter = new SimpleDateFormat(format);
		String datetimeStr = formatter.format(Cal.getTime());
		return datetimeStr;
    }

	/**
	 * 按format指定的格式把日期时间dt转换为字符串 例如：format=yyyyMMddHHmmss时返回 20060213113520
	 * format=yyyy-MM-dd HH:mm:ss时返回 2006-02-13 11:35:20
	 * 
	 * @param dt Date
	 * @param format String
	 * @return String
	 */
	public static String DateToStr(Date dt, String format) {
		if (dt == null)
			return "";
		SimpleDateFormat formatter = new SimpleDateFormat(format);
		String dateStr = formatter.format(dt);
		return dateStr;
	}


	/**
	 * 将日期字符串转换为指定格式的字符串
	 * @param sDate 日期字符串
	 * @param pattern 现在的格式
	 * @param toPattern 目标格式
	 * @return
	 * @throws ParseException
	 */
	public static String format(String sDate, String pattern, String toPattern) throws ParseException{
		return DateToStr(StrToDate(sDate, pattern), toPattern);
	}
	
	/**
	 * 把format格式的日期字符串str转换为Date
	 * 
	 * @param str String
	 * @param format String
	 * @return Date
	 */
	public static java.util.Date StrToDate(String str, String format) {
		try {
			return new SimpleDateFormat(format).parse(str);
		}
		catch (Exception e) {
			//e.printStackTrace();
			return null;
		}
	}
	
	//得到触发日期前一天所在的月
	public static String getTableMonth(String triggerDate){
		Date tDate = DateUtils.StrToDate(triggerDate, "yyyyMMdd");
		Date preDate = DateUtils.addDate(tDate, -1);
		return DateUtils.DateToStr(preDate, "yyyyMM");
	}
	/**
	 * 返回指定时间范围内的所有Date对象
	 * 
	 * <pre>
	 * Date s = new SimpleDateFormat(&quot;yyyyMMdd&quot;).parse(&quot;20081101&quot;);
	 * Date e = new SimpleDateFormat(&quot;yyyyMMdd&quot;).parse(&quot;20081103&quot;);
	 * Iterator&lt;Date&gt; it = DateUtils.iterator(s, e, Calendar.DATE);
	 * while (it.hasNext()) {
	 * 	logger.info(""+it.next());
	 * }
	 * </pre>
	 * 
	 * @param start 开始时间
	 * @param end 结束时间
	 * @param field the field from Calendar
	 * @return
	 */
	public static Iterator<Date> iterator(Date start, Date end, int field) {
		List<Date> list = new LinkedList<Date>();
		if (end == null || end.compareTo(start) <= 0) {
			list.add(start);
			return list.iterator();
		}

		Calendar sDate = Calendar.getInstance();
		Calendar eDate = Calendar.getInstance();
		sDate.setTime(start);
		eDate.setTime(end);

		while (sDate.compareTo(eDate) <= 0) {
			list.add(sDate.getTime());
			sDate.add(field, 1);
		}
		return list.iterator();
	}

	public static Iterator<Date> riterator(Date start, Date end, int field) {
		List<Date> list = new LinkedList<Date>();
		if (end == null || end.compareTo(start) <= 0) {
			list.add(start);
			return list.iterator();
		}

		Calendar sDate = Calendar.getInstance();
		Calendar eDate = Calendar.getInstance();
		sDate.setTime(start);
		eDate.setTime(end);

		while (eDate.compareTo(sDate) >= 0) {
			list.add(eDate.getTime());
			eDate.add(field, -1);
		}
		return list.iterator();
	}

	public static Date addDate(Date target,int days){
		Calendar c = Calendar.getInstance();
		c.setTime(target);
		c.add(Calendar.DATE, days);
		return c.getTime();
	}
	
	public static Date addMonth(Date target,int months){
		Calendar c = Calendar.getInstance();
		c.setTime(target);
		c.add(Calendar.MONTH, months);
		return c.getTime();
	}
	
	public static Date addTime(Date target,int num,int field){
		Calendar c = Calendar.getInstance();
		c.setTime(target);
		c.add(field, num);
		return c.getTime();
	}
	/**
     * 获取当前计费月
     * @return YYYYMM格式
     */
    public static String GetCurPeriod()
    {
    	String billPeriod = null;
		int month = Calendar.getInstance().get( Calendar.MONTH)+1;
		int year = Calendar.getInstance().get( Calendar.YEAR );
		
		billPeriod = Integer.toString(year);
		if(month<10)
			billPeriod = billPeriod + "0" + Integer.toString(month);
		else
			billPeriod = billPeriod + Integer.toString(month);
		return billPeriod;
    }
    
    
    
    
	/**
     * 获取指定月份的上一个月
     * @param billPeriod 当前月
     * @return lastMonth 上一个月
     */
    public static String getBeforeMonth(String billPeriod) {
        int lastMonth = 0;
    	if(billPeriod != null && !"".equals(billPeriod)){
    		char[] temp = billPeriod.toCharArray();
    		if (temp[temp.length - 2] == '0' && temp[temp.length - 1] == '1') {
    			lastMonth = Integer.parseInt(billPeriod) - 100 + 11;// 假如是一月的时候上月应是上年12月
			} else {
				lastMonth = Integer.parseInt(billPeriod) - 1;// 上月
			}
        }
        return String.valueOf(lastMonth);
    }
    
    /**
     * 获取指定月份的下一个月
     * @param billPeriod 当前月
     * @return 下一个月
     */
    public static String getNextMonth(String billPeriod) {
    	int nextMonth = 0;
    	if(billPeriod != null && !"".equals(billPeriod)){
    		char[] temp = billPeriod.toCharArray();
    		if (temp[temp.length - 2] == '1' && temp[temp.length - 1] == '2') {
    			nextMonth = Integer.parseInt(billPeriod) + 100 - 11;// 假如是12月的时候下月应是下年1月
    		} else {
    			nextMonth = Integer.parseInt(billPeriod) + 1;// 下月
    		}
    	}
    	return String.valueOf(nextMonth);
    }
    
    public static Date getLastOfOneDay(Date d){
    	Calendar c = Calendar.getInstance();
    	c.setTime(d);
    	c.set(Calendar.HOUR_OF_DAY, 23);
    	c.set(Calendar.MINUTE,59);
    	c.set(Calendar.SECOND,59);
    	c.set(Calendar.MILLISECOND, 999);
    	return c.getTime();
    }
	
    public static Date getLastMonthOf(Date d){
    	Calendar c = Calendar.getInstance();
    	c.setTime(d);
    	c.add(Calendar.MONTH, -1);
    	return c.getTime();
    }
    public static Date getLastTwelveMonthOf(Date d){
    	Calendar c = Calendar.getInstance();
    	c.setTime(d);
    	c.add(Calendar.MONTH, -11);
    	return c.getTime();
    }
    public static Date getFirstDayOf(Date d){
    	Calendar c = Calendar.getInstance();
    	c.setTime(d);
    	c.set(Calendar.DAY_OF_MONTH, 1);
    	return c.getTime();
    }
    
    public static Date getLastDayOf(Date d){
    	Calendar c = Calendar.getInstance();
    	c.setTime(d);
		c.add(Calendar.MONTH, 1);
		c.set(Calendar.DAY_OF_MONTH, 1);
		c.add(Calendar.DATE, -1);
		return c.getTime();
    }
    public static Date getLastThirtyDayOf(Date d,int day){
    	Calendar c = Calendar.getInstance();
    	c.setTime(d);
		c.add(Calendar.DAY_OF_MONTH, day);
		return c.getTime();
    }
    public static Date getLastFourWeekOf(Date d){
    	Calendar c = Calendar.getInstance();
    	c.setTime(d);
		c.add(Calendar.MONTH, 1);
		c.set(Calendar.WEEK_OF_YEAR, 1);
		c.add(Calendar.DATE, -4);
		return c.getTime();
    }
    public static Date getLastYearOf(Date d){
    	Calendar c = Calendar.getInstance();
    	c.setTime(d);
		//c.add(Calendar.MONTH, 1);
	//	c.set(Calendar.WEEK_OF_YEAR, 1);
		c.add(Calendar.YEAR, -1);
		return c.getTime();
    }
    public static int get(Date d,int field){
    	Calendar c = Calendar.getInstance();
    	c.setTime(d);
    	return c.get(field);
    }
    
    public static boolean isLastDayOfMonth(Date d){
    	Calendar c = Calendar.getInstance();
    	c.setTime(d);
    	return c.get(Calendar.DAY_OF_MONTH)==c.getActualMaximum(Calendar.DAY_OF_MONTH);
    }
    
	public static void formatFromList(List<Map<String,String>>  list, String pattern, String toPattern,String Key) throws ParseException{
		//return DateToStr(StrToDate(sDate, pattern), toPattern);
		for(Map<String,String> map :list){
			map.put(Key,  DateUtils.format(map.get(Key), pattern,toPattern));
			//map.put("taskfinishtime",  DateUtils.format(map.get("taskfinishtime"),  pattern,toPattern));
		}
		
	}
	
	/** 
    * 获得指定日期的前一天 
    * @param specifiedDay 
    * @return 
    * @throws Exception 
    */ 
    public static String getSpecifiedDayBefore(String specifiedDay,int skewing){ 
    //SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
    Calendar c = Calendar.getInstance(); 
    Date date=null; 
    try { 
    date = new SimpleDateFormat("yyyyMMdd").parse(specifiedDay); 
    } catch (ParseException e) { 
    e.printStackTrace(); 
    } 
    c.setTime(date); 
    int day=c.get(Calendar.DATE); 
    c.set(Calendar.DATE,day-skewing); 

    String dayBefore=new SimpleDateFormat("yyyyMMdd").format(c.getTime()); 
    return dayBefore; 
    } 
    /** 
    * 获得指定日期的后一天 
    * @param specifiedDay 
    * @return 
    */ 
    public static String getSpecifiedDayAfter(String specifiedDay,int skewing){ 
    Calendar c = Calendar.getInstance(); 
    Date date=null; 
    try { 
    date = new SimpleDateFormat("yyyyMMdd").parse(specifiedDay); 
    } catch (ParseException e) { 
    e.printStackTrace(); 
    } 
    c.setTime(date); 
    int day=c.get(Calendar.DATE); 
    c.set(Calendar.DATE,day+skewing); 

    String dayAfter=new SimpleDateFormat("yyyyMMdd").format(c.getTime()); 
    return dayAfter; 
    }
    
    /** 
     * 获得指定日期的上月日期
     * @param specifiedDay 
     * @return 
     * @throws Exception 
     */ 
     public static String getSpecifiedMonthBefore(String specifiedDay,int skewing){ 
     //SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
     Calendar c = Calendar.getInstance(); 
     Date date=null; 
     try { 
     date = new SimpleDateFormat("yyyyMMdd").parse(specifiedDay); 
     } catch (ParseException e) { 
     e.printStackTrace(); 
     } 
     c.setTime(date); 
     int day=c.get(Calendar.MONTH); 
     c.set(Calendar.MONTH,day-skewing); 

     String dayBefore=new SimpleDateFormat("yyyyMMdd").format(c.getTime()); 
     return dayBefore; 
     } 
     /** 
     * 获得指定日期的下月日期
     * @param specifiedDay 
     * @return 
     */ 
     public static String getSpecifiedMonthAfter(String specifiedDay,int skewing){ 
     Calendar c = Calendar.getInstance(); 
     Date date=null; 
     try { 
     date = new SimpleDateFormat("yyyyMMdd").parse(specifiedDay); 
     } catch (ParseException e) { 
     e.printStackTrace(); 
     } 
     c.setTime(date); 
     int day=c.get(Calendar.MONTH); 
     c.set(Calendar.MONTH,day+skewing); 

     String dayAfter=new SimpleDateFormat("yyyyMMdd").format(c.getTime()); 
     return dayAfter; 
     }
	
     private static SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
          
         public static void main(String []args) throws Exception{
             String first = "2018-6-20";
             String second = "2018-6-19";
             Date firstdate = format.parse(first);
             Date seconddate = format.parse(second);
              int cnt = longOfTwoDate(firstdate, seconddate);
           //  System.out.println(cnt);
         }
          
     public static int  longOfTwoDate(Date first,Date second) throws ParseException{
                     Calendar calendar = Calendar.getInstance();
                      calendar.setTime(first);
                      int cnt = 0;
                      
                      if (first.before(second)){ 
                    	  while(calendar.getTime().compareTo(second)!=0){
                              calendar.add(Calendar.DATE, 1);
                             cnt++;
                           }
                    	  }else{ 
                    		  cnt = 0;
                    	  } 
                      
                      
                   
                      return cnt;
          }
 
     
     
/*	public static void main(String[] args) throws Exception {
		Date s = new SimpleDateFormat("yyyyMMdd").parse("20081121");
		Date e = new SimpleDateFormat("yyyyMMdd").parse("20081121");
		Iterator<Date> it = DateUtils.riterator(s, e, Calendar.DATE);
		while (it.hasNext()) {			
			logger.info(""+it.next());
		}
		
		logger.info(""+DateUtils.DateToStr(new Date(),"yyyy-MM-dd'T'HH:mm:ss"));
		//System.out.println(""+getLastOfOneDay(new Date()));
	}*/
}

package com.asiainfo.cmc.qudao.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

public class MyDateFormat {
	
	private static SimpleDateFormat yearMonFormat = new SimpleDateFormat("yyyyMM");
	private static SimpleDateFormat yearMonDayFormat = new SimpleDateFormat("yyyyMMdd");
	private static SimpleDateFormat yearMonFormat_ = new SimpleDateFormat("yyyy-MM");

	/**
	 * 获取上一个月字符串：yyyyMM
	 */
    public static String getPrevMonth(){
        Date now = new Date();
		Calendar  monCal = Calendar.getInstance();		
		monCal.setTime(now);
		monCal.add(Calendar.MONTH, -1);
        return yearMonFormat.format(monCal.getTime());       
    }
    //对动态客商的开始时间设置为当前月份的前两个月
    public static String getPrevMonthDynamic(){
        Date now = new Date();
		Calendar  monCal = Calendar.getInstance();		
		monCal.setTime(now);
		monCal.add(Calendar.MONTH, -2);
        return yearMonFormat.format(monCal.getTime());       
    }
    
    
    public static String getStartMonth(String month,Integer mon){
        Date now = new Date();;
		try {
			now = yearMonFormat.parse(month);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar  monCal = Calendar.getInstance();		
		monCal.setTime(now);
		monCal.add(Calendar.MONTH, -mon);
        return yearMonFormat.format(monCal.getTime());       
    }
    
    public static String getStartMonth1(String month){
        Date now = new Date();;
		try {
			now = yearMonFormat.parse(month);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar  monCal = Calendar.getInstance();		
		monCal.setTime(now);
		monCal.add(Calendar.MONTH, 1);
        return yearMonFormat.format(monCal.getTime());       
    }
    public static String getMonthStartDay(String monthStr){
        Date month = null;
		try {
			month = yearMonFormat.parse(monthStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar  monCal = Calendar.getInstance();	
		monCal.setTime(month);
		monCal.set(Calendar.DAY_OF_MONTH, 1);
        return yearMonDayFormat.format(monCal.getTime());       
    }
    
    public static String getMonthEndDay(String monthStr){
        Date month = null;
		try {
			month = yearMonFormat.parse(monthStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar  monCal = Calendar.getInstance();	
		monCal.setTime(month);
		monCal.set(Calendar.DAY_OF_MONTH, monCal.getActualMaximum(Calendar.DATE));
        return yearMonDayFormat.format(monCal.getTime());       
    }
    
	/**
	 * 根据月份，获取曲线图的月份范围集合
	 */
	public static List<String> getMonthSblings(String month,Integer totalMon){
		//int totalMon = 9;
		int nextMon = (totalMon-1)/2;
		int prevMon = totalMon-nextMon-1;
		List<String> months = new ArrayList<String>(0);
		Date paramMonth = null;
		Date prevMonth = null;
		try {
			paramMonth = yearMonFormat.parse(month);
			prevMonth = yearMonFormat.parse(MyDateFormat.getPrevMonth());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		//计算参数月份与上个月 相差月数
		Calendar  paramMonthCal = Calendar.getInstance();
		Calendar  prevMonthCal = Calendar.getInstance();		
		paramMonthCal.setTime(paramMonth);
		prevMonthCal.setTime(prevMonth);
	    int year = (prevMonthCal.get(Calendar.YEAR) - paramMonthCal.get(Calendar.YEAR)) * 12;
	    int m = prevMonthCal.get(Calendar.MONTH) - paramMonthCal.get(Calendar.MONTH);
	    int betMonth =  Math.abs(year + m);
		
	    //返回月份集合
	    if(betMonth<nextMon){
	    	for(int i=-totalMon+1+betMonth;i<1+betMonth;i++){
	    		Calendar tempMonth = Calendar.getInstance();
	    		tempMonth.setTime(paramMonth);
	    		tempMonth.add(Calendar.MONTH, i);
	    		String monthStr = yearMonFormat.format(tempMonth.getTime());
	    		months.add(monthStr);
	    	}
	    }else{
	    	for(int i=-prevMon;i<nextMon+1;i++){
	    		Calendar tempMonth = Calendar.getInstance();
	    		tempMonth.setTime(paramMonth);
	    		tempMonth.add(Calendar.MONTH, i);
	    		String monthStr = yearMonFormat.format(tempMonth.getTime());
	    		months.add(monthStr);
	    	}
	    	
	    }
		return months;
	}
	
	/**
	 * 根据月份，获取曲线图的月份范围集合
	 */
	public static List<String> getMonthSblings_(String month,Integer totalMon){
		//int totalMon = 9;
		int nextMon = (totalMon-1)/2;
		int prevMon = totalMon-nextMon-1;
		List<String> months = new ArrayList<String>(0);
		Date paramMonth = null;
		Date prevMonth = null;
		try {
			paramMonth = yearMonFormat.parse(month);
			prevMonth = yearMonFormat.parse(MyDateFormat.getPrevMonth());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		//计算参数月份与上个月 相差月数
		Calendar  paramMonthCal = Calendar.getInstance();
		Calendar  prevMonthCal = Calendar.getInstance();		
		paramMonthCal.setTime(paramMonth);
		prevMonthCal.setTime(prevMonth);
	    int year = (prevMonthCal.get(Calendar.YEAR) - paramMonthCal.get(Calendar.YEAR)) * 12;
	    int m = prevMonthCal.get(Calendar.MONTH) - paramMonthCal.get(Calendar.MONTH);
	    int betMonth =  Math.abs(year + m);
		
	    //返回月份集合
	    if(betMonth<nextMon){
	    	for(int i=-totalMon+1+betMonth;i<1+betMonth;i++){
	    		Calendar tempMonth = Calendar.getInstance();
	    		tempMonth.setTime(paramMonth);
	    		tempMonth.add(Calendar.MONTH, i);
	    		String monthStr = yearMonFormat_.format(tempMonth.getTime());
	    		months.add(monthStr);
	    	}
	    }else{
	    	for(int i=-prevMon;i<nextMon+1;i++){
	    		Calendar tempMonth = Calendar.getInstance();
	    		tempMonth.setTime(paramMonth);
	    		tempMonth.add(Calendar.MONTH, i);
	    		String monthStr = yearMonFormat_.format(tempMonth.getTime());
	    		months.add(monthStr);
	    	}
	    	
	    }
		return months;
	}
	
	public static List<String> getMonthBetween(String startMonthStr,String endMonthStr){
		List<String> months = new ArrayList<String>(0);
		Calendar  startMonthCal = Calendar.getInstance();
		Calendar  endMonthCal = Calendar.getInstance();
		Date startMonth = null;
		Date endMonth = null;
		try {
			startMonth = yearMonFormat.parse(startMonthStr);
			endMonth = yearMonFormat.parse(endMonthStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}		
		startMonthCal.setTime(startMonth);
		endMonthCal.setTime(endMonth);
		
		while (startMonthCal.before(endMonthCal)) {
			Date month = startMonthCal.getTime();
			String monthStr = yearMonFormat.format(month);
			months.add(monthStr);
			startMonthCal.add(Calendar.MONTH, 1);
		}
		months.add(yearMonFormat.format(endMonth.getTime()));
		return months;		
	}
	
	
	private static String[] citys = new String[]{"广州","全省","深圳","韶关","珠海","汕头","佛山","江门","湛江",
		"茂名","肇庆","惠州","梅州","汕尾","河源","阳江","清远","东莞","中山","潮州","揭阳","云浮"};
	public static List<Map<String,String>>  getCitys(){
		Subject subject = SecurityUtils.getSubject();
		List<Map<String,String>>  citysList = new ArrayList<>();
		
		Map<String,String> GZ = new HashMap<String,String>();
		GZ.put("key", "GZ");
		GZ.put("value", "广州");
		Map<String,String> QS = new HashMap<String,String>();
		QS.put("key", "QS");
		
		QS.put("value", "全省");
		Map<String,String> SZ = new HashMap<String,String>();
		SZ.put("key", "SZ");
		SZ.put("value", "深圳");
		Map<String,String> SG = new HashMap<String,String>();
		SG.put("key", "SG");
		SG.put("value", "韶关");
		Map<String,String> ZH = new HashMap<String,String>();
		ZH.put("key", "ZH");
		ZH.put("value", "珠海");
		Map<String,String> ST = new HashMap<String,String>();
		ST.put("key", "ST");
		ST.put("value", "汕头");
		Map<String,String> FS = new HashMap<String,String>();
		FS.put("key", "FS");
		FS.put("value", "佛山");
		Map<String,String> JM = new HashMap<String,String>();
		JM.put("key", "JM");
		JM.put("value", "江门");
		Map<String,String> ZJ = new HashMap<String,String>();
		ZJ.put("key", "ZJ");
		ZJ.put("value", "湛江");
		Map<String,String> MM = new HashMap<String,String>();
		MM.put("key", "MM");
		MM.put("value", "茂名");
		Map<String,String> ZQ = new HashMap<String,String>();
		ZQ.put("key", "ZQ");
		ZQ.put("value", "肇庆");
		Map<String,String> HZ = new HashMap<String,String>();
		HZ.put("key", "HZ");
		HZ.put("value", "惠州");
		Map<String,String> MZ = new HashMap<String,String>();
		MZ.put("key", "MZ");
		MZ.put("value", "梅州");
		Map<String,String> SW = new HashMap<String,String>();
		SW.put("key", "SW");
		SW.put("value", "汕尾");
		Map<String,String> HY = new HashMap<String,String>();
		HY.put("key", "HY");
		HY.put("value", "河源");
		Map<String,String> YJ = new HashMap<String,String>();
		YJ.put("key", "YJ");
		YJ.put("value", "阳江");
		Map<String,String> QY = new HashMap<String,String>();
		QY.put("key", "QY");
		QY.put("value", "清远");
		Map<String,String> DG = new HashMap<String,String>();
		DG.put("key", "DG");
		DG.put("value", "东莞");
		Map<String,String> ZS = new HashMap<String,String>();
		ZS.put("key", "ZS");
		ZS.put("value", "中山");
		Map<String,String> CZ = new HashMap<String,String>();
		CZ.put("key", "CZ");
		CZ.put("value", "潮州");
		Map<String,String> JY = new HashMap<String,String>();
		JY.put("key", "JY");
		JY.put("value", "揭阳");
		Map<String,String> YF = new HashMap<String,String>();
		YF.put("key", "YF");
		YF.put("value", "云浮");
 		
		if(subject.isPermitted("GZ")) {
			citysList.add(GZ);
		}
		if(subject.isPermitted("QS")) {
			citysList.add(QS);
		} 
		if(subject.isPermitted("SZ")) {
			citysList.add(SZ);
		}
		if(subject.isPermitted("SG")) {
			citysList.add(SG);
		}
		if(subject.isPermitted("ZH")) {
			citysList.add(ZH);
		}
		if(subject.isPermitted("ST")) {
			citysList.add(ST);
		}
		if(subject.isPermitted("FS")) {
			citysList.add(FS);
		}
		if(subject.isPermitted("JM")) {
			citysList.add(JM);
		}
		if(subject.isPermitted("ZJ")) {
			citysList.add(ZJ);
		}
		if(subject.isPermitted("MM")) {
			citysList.add(MM);
		}
		if(subject.isPermitted("ZQ")) {
			citysList.add(ZQ);
		}
		if(subject.isPermitted("HZ")) {
			citysList.add(HZ);
		}
		if(subject.isPermitted("MZ")) {
			citysList.add(MZ);
		}
		if(subject.isPermitted("SW")) {
			citysList.add(SW);
		}	
		if(subject.isPermitted("HY")) {
			citysList.add(HY);
		}
		if(subject.isPermitted("YJ")) {
			citysList.add(YJ);
		}
		if(subject.isPermitted("QY")) {
			citysList.add(QY);
		}
		if(subject.isPermitted("DG")) {
			citysList.add(DG);
		}
		if(subject.isPermitted("ZS")) {
			citysList.add(ZS);
		}
		if(subject.isPermitted("CZ")) {
			citysList.add(CZ);
		}
		if(subject.isPermitted("JY")) {
			citysList.add(JY);
		}
		if(subject.isPermitted("YF")) {
			citysList.add(YF);
		}
		return citysList;
	}
	
}

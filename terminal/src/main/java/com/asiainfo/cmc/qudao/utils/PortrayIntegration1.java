package com.asiainfo.cmc.qudao.utils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import tk.mybatis.mapper.util.StringUtil;
import com.asiainfo.cmc.qudao.enties.CusChanPortray;

public class PortrayIntegration1 {

	public static void showType2(List<Map<String,Object>> resultSet,List<CusChanPortray> portrays,List<String> months,String monthFormat){
		List<Float> setTT = new ArrayList<Float>();
	
		
		if(resultSet==null || resultSet.size()==0 || resultSet.get(0)==null){
			return;
		}
		
		String detail = months.get(0);
		for(int i=1; i<months.size(); i++){
			detail += ","+months.get(i);
		}
		
		List<String> mapListMonths = new ArrayList<String>();
		for(Map<String,Object> map : resultSet){
			mapListMonths.add(map.get(monthFormat)==null?"":map.get(monthFormat).toString());
		}
		
		int j = 0; //用于记录当前取到结果集中的第几个、因为月份可能不连续
		//封装第一个月份的值
		String fristMon = months.get(0);
		if(mapListMonths.contains(fristMon)){
			
			try {
			for(CusChanPortray portray : portrays){

    			String value = resultSet.get(j).get(portray.getName())==null?"0":resultSet.get(j).get(portray.getName()).toString();
    			if(portray.getCnName().equals("单品促销能力") && !resultSet.get(j).get("single_sales_amount").toString().equals("")) {
    			String tt=resultSet.get(j).get("single_sales_amount").toString();
    			portray.setValue(value);
    			portray.setValue1(tt);
    			portray.setDetail(detail);
    			}else {
    			portray.setValue(value);
    			portray.setDetail(detail);}
			}
			}catch (Exception e) {
				// TODO: handle exception
			}
			
			
			
			j++;			
		}else{
			for(CusChanPortray portray : portrays){
				portray.setValue("0");
				portray.setDetail(detail);
			}
		}
    	//封装其他月份的值
		for(int i=1; i<months.size(); i++){
			String month = months.get(i);				
			if(mapListMonths.contains(month)){				
				try{
				for(CusChanPortray portray : portrays){
	        		String value = resultSet.get(j).get(portray.getName())==null?"0":resultSet.get(j).get(portray.getName()).toString();
	        		
	        			if(portray.getCnName().equals("单品促销能力") && mapListMonths.contains(month)) {
		        			for(int i1=0;i1<resultSet.size();i1++) {
		        				String vv =resultSet.get(i1).get("single_sales_amount").toString();
			        			portray.setValue1(portray.getValue1()+","+vv);
			        			portray.setValue(portray.getValue()+","+value);	
		        				
		        			}
	        				
		        		}else {
			        		portray.setValue(portray.getValue()+","+value);
		        		}
				           }
	        			}catch(Exception e){
	        			
	        			}

	        	        
	        	j++;
			}else{
	        	for(CusChanPortray portray : portrays){	        		
	        		portray.setValue(portray.getValue()+","+"0");
	        		portray.setValue1(portray.getValue1()+","+"0");
	        	}	
			}
		}				
	}
	
	public static void showType1(Map<String,Object> resultSet,List<CusChanPortray> portrays){		
		if(resultSet==null){
			return;
		}
		
    	for(CusChanPortray portray : portrays){
    		String value = resultSet.get(portray.getName())==null?"":resultSet.get(portray.getName()).toString();
    		if(StringUtil.isEmpty(value)){
    			value = "0.0";
    		}
    		portray.setValue(value);	
    	}
	}
	
	public static void showType3(Map<String,Object> resultSet,List<CusChanPortray> portrays){		
		if(resultSet==null){
			return;
		}
		
    	for(CusChanPortray portray : portrays){
    		String value = resultSet.get(portray.getName())==null?"":resultSet.get(portray.getName()).toString();
    		if(StringUtil.isEmpty(value)){
    			value = "0.0";
    		}
			BigDecimal preBD = new BigDecimal(Double.valueOf(value)).setScale(5,BigDecimal.ROUND_HALF_DOWN);
			float prefixValue = preBD.floatValue();
			BigDecimal afterBD = new BigDecimal(1-prefixValue).setScale(5,BigDecimal.ROUND_HALF_DOWN);
			float afterValue = afterBD.floatValue();
			portray.setValue(prefixValue*100 +","+ afterValue*100);						
    	}
	}
	
	public static void showType4(Map<String,Object> resultSet,List<CusChanPortray> portrays){	
		for(CusChanPortray portray : portrays){
	
	     String detail = portray.getDetail();
	     String[] detailList = detail.split(";");
	
	     String cnNameStr = detailList[0];
	     String nameStr = detailList[1];
			
			//获取中文名
			portray.setDetail(cnNameStr);
			
			//获取值
			String value = "";
			for(String del : nameStr.split(",")){
				String val = (resultSet==null || resultSet.size()==0)?"0":(resultSet.get(del)==null?"0":resultSet.get(del).toString());
				value += val + ",";
			}
			value = value.substring(0, value.length()-1);
			portray.setValue(value);
		}
	
	}
	
	public static void showType5(Map<String,Object> map,List<CusChanPortray> portrays){	
		for(CusChanPortray por : portrays){				
			String detail = por.getDetail();
			String[] detailList = detail.split(";")[1].split(",");
			List<Float> valueList = new ArrayList<Float>();
			float prevValue = 0l;
			for(String del : detailList){										
				String value = (map==null || map.size()==0)?"0":(map.get(del)==null?"0":map.get(del).toString());
				float valueBig = new BigDecimal(Double.valueOf(value)).setScale(5,BigDecimal.ROUND_HALF_DOWN).floatValue();
				valueList.add(valueBig);
				prevValue += valueBig;
			}
			valueList.add(new BigDecimal(1-prevValue).setScale(5,BigDecimal.ROUND_HALF_DOWN).floatValue());
            
			String value = "";
			for(float f : valueList){
				value += f+",";
			}
			por.setValue(value.substring(0,value.length()-1));
			por.setDetail(detail.split(";")[0]);
		}	
	}
	
	//只处理“异网渗透率”圆形图
	public static void showType5_ywst(List<Map<String,Object>> mapList,List<CusChanPortray> portrays){		
		for(CusChanPortray portray : portrays){
			String detail = portray.getDetail();
			String[] detailList = detail.split(",");
			String detailResult = "移动-空,移动-移动,移动-联通,联通-移动,移动-电信,电信-移动,移动-国外卡,国外卡-移动";
			String[] detailResultList = new String[]{"移动-空","移动-移动","移动-联通","联通-移动","移动-电信","电信-移动","移动-国外卡","国外卡-移动"};
			String valueResult = "";
			Double[] valueREsults = new Double[]{0d,0d,0d,0d,0d,0d,0d,0d};
			for(Map<String,Object> map : mapList){
				String detailKey = map.get(detailList[0])==null?"":map.get(detailList[0]).toString();
				String detailValue = map.get(detailList[1])==null?"":map.get(detailList[1]).toString();
				String[] detailKeys = detailKey.split(",");
				String[] detailValues= detailValue.split(",");
				for(int i=0;i<detailKeys.length;i++){
					int j = getArrIndex(detailResultList,detailKeys[i]);
					if(j!=-1){
						valueREsults[j] = valueREsults[j] + Double.parseDouble(detailValues[i]);
					}
				}
			}
	        
			boolean isAll0 = true;
	        for(Double d : valueREsults){
	        	valueResult += d + ",";
	        	if(d != 0){
	        		isAll0 = false;	        		
	        	}
	        }
	        valueResult = valueResult.substring(0,valueResult.length()-1);
	        portray.setDetail(detailResult);
	        portray.setValue(valueResult);
	        if(isAll0){
	        	portray.setDetail("");
	        }
		}	
	}
	

    public static int getArrIndex(String[] arr, String value) {
        for (int i = 0; i < arr.length; i++) {
            if (arr[i].equalsIgnoreCase(value)) {
                return i;
            }
        }
        return -1;
    }
	
	
	public static void showType6(List<Map<String,Object>> mapList,List<CusChanPortray> portrays){	
		for(CusChanPortray por : portrays){
			String detail = por.getDetail();
			String[] names = detail.split(",");

			List<String> brands = new ArrayList<String>();
			List<Double> counts = new ArrayList<Double>();			
			for(Map<String,Object> map : mapList){
				String brandStr = (map==null || map.size()==0)?"":(map.get(names[0])==null?"":map.get(names[0]).toString());
				String countStr = (map==null || map.size()==0)?"0":(map.get(names[1])==null?"0":map.get(names[1]).toString());
				String[] brand = brandStr.split(",");
				String[] count = countStr.split(",");
				for(int i=0;i<brand.length;i++){
					int k = brands.indexOf(brand[i]);
					Double dou = count.length>i?Double.parseDouble(count[i]):0;
					if(k == -1){
						brands.add(brand[i]);						
						counts.add(dou);
					}else{
						counts.set(k, counts.get(k)+dou);
					}
				}
			}
			
			//排序
            if(counts.size()>0){ 					
				for(int i=0;i<counts.size()-1;i++){
					for(int j=i+1;j<counts.size();j++){
						if(counts.get(i)<counts.get(j)){
							Double temp = counts.get(i);
							counts.set(i, counts.get(j));
							counts.set(j, temp);
							
							String str = brands.get(i);
							brands.set(i, brands.get(j));
							brands.set(j, str);
						}
					}
				}
				String brandStr = "";
				String countStr = "";
				for(int i=0;i<counts.size() && i<5;i++){
					brandStr = brandStr+brands.get(i)+",";
					countStr = countStr+counts.get(i)+",";
				}   
				brandStr = brandStr.substring(0,brandStr.length()-1);
				countStr = countStr.substring(0,countStr.length()-1);
				
				por.setDetail(brandStr);
				por.setValue(countStr);
            }
			

		}	
	}
	
	/**
	 * 品牌覆盖情况  将连续月份的 门店数/基站数，存量数/新增数 封装
	 */
	public static Map<String,String> resultSetList2Map(List<Map<String, Object>> resultMapList,List<String> months){
		Map<String,String> map = new HashMap<String,String>();
		if(resultMapList==null || resultMapList.size()==0){
			return map;
		}
		
		List<String> resultMapMonths = new ArrayList<String>();
		for(Map<String, Object> resultMap : resultMapList){
			resultMapMonths.add(resultMap.get("month")==null?"":resultMap.get("month").toString());
		}
		String nums = "";
		String cnts = "";
		int j=0;
		for(String month : months){			
			if(resultMapMonths.contains(month)){
				nums += resultMapList.get(j).get("num") + ",";
				cnts += resultMapList.get(j).get("cnt") + ",";
				j++;
			}else{
				nums += "0" + ",";
				cnts += "0" + ",";
			}						
		}
		nums = nums.substring(0, nums.length()-1);
		cnts = cnts.substring(0, cnts.length()-1);
		map.put("nums", nums);
		map.put("cnts", cnts);
		return map;
	}	
	
	
	
	
	
}

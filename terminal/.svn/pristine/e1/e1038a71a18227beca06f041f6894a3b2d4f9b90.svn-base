package com.asiainfo.cmc.service.impl.brandmodel;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.asiainfo.cmc.enties.brandmodel.LifeDate;
import com.asiainfo.cmc.service.brandmodel.AbsoluteRangeService;

/**
 * 
 * @author Administrator
 *
 */

@Component
public class PlanSaleUtils {

	@Autowired
	private AbsoluteRangeService absoluteRangeService;	

/*public List getDay(String start,String end,String brand,String model) {
	
	List <Integer> list=new ArrayList<Integer>();
	//距开始销售的时间差c
	int e = absoluteRangeService.selectHowDay(start, brand, model);	
	int c=0;
	System.out.println(e);
	if(e>0) {
		
	 c=e;	
		
	}


   //所选时间段相差多少天d
	int d = absoluteRangeService.selectHowDays(start, end);
    System.out.println(d);
	//查出生命周期的所属周期和持续周数
	List<LifeDate> brandLife = absoluteRangeService.selectBrandLife(brand, model);
	if(brandLife!=null&&!brandLife.isEmpty()) {
	ArrayList<Object> CycleList = new ArrayList<Object>();
	ArrayList<Integer> DurationList = new ArrayList<Integer>();
	ArrayList<Object> SaleMountTList = new ArrayList<Object>();
	  int DURATION=0;
	  for(LifeDate example : brandLife){		  
		 //取出产品所属周期
		  CycleList.add( example.getCYCLE());
		 //取出产品持续的周数
		  DurationList.add(example.getDURATION());
		 //取出产品所属周期的销量
		  SaleMountTList.add(example.getSALEAMOUNT());
		 
		     }
*//**
 * Cycle：
 * Duration周数
 * avg平均值
 *//*
	 int sumDution=0;
    //四个周期一共有多少周	 
	 for(Integer  dution: DurationList) {
		 
		 sumDution += dution;
	 }
        //算出所有周期的天数
        int sumDay=sumDution*7; 
	 
        int e1=0;//导入期
	
	    int e2=0;//成长期
	 
	    int e3=0;//成熟期
	 
	    int e4=0;//衰退期
        //导入期取值
	     if(DurationList.size()>=1) {
	
		 float f = (float) SaleMountTList.get(0);
		
		 int object=(int)f;
		 
		 e1= DurationList.get(0)*7;
         
		 if((e1-c)<d) {
	
         int numberOne=(int)object/(e1-c);
        
         System.out.println(numberOne);
         
         list.add(numberOne);
         
         }
		 
		 
	 };
	//成长期取值
	 if(DurationList.size()>=2) {
	    
		float f = (float) SaleMountTList.get(1);
		
	    int object1 = (int)f;
		
		e2= DurationList.get(1)*7;
		//到2
		if(e1+e2-c<d) {
		
	    int avgGrow=object1/(e2-c);		
				
		list.add(avgGrow);	
			
		} 
		 
		//不到2
		 if(d-(e1-c)<e2) {
			
		 int numberTwo=object1/(e1-c);
		
		 System.out.println(numberTwo);
		 
		 list.add(numberTwo);
		}
		
		 
		  
		  
		  
		 
	 };
	//成熟期取值
	 if(DurationList.size()>=3) {
		 float f = (float) SaleMountTList.get(2);
		 int object2 = (int)f;
		 e3= DurationList.get(2)*7;
		if((e1+e2+e3-c)<d) {
			
		int numberThree=object2/e1+e2+e3-c;
		 
		list.add(numberThree);
		} 
	
		
		if(d-(e1-c)-e2<e3) {
			
	    int numberThrees=object2/d-(e1-c)-e2;	
			
		list.add(numberThrees);
		}
	 
		if(d-(e1+e2-c)<e3) {
			
		    int numberThreeed=object2/d-(e1+e2-c);	
				
			list.add(numberThreeed);
			}
	 
	 
	 
	 };
    //衰退期取值
	 if(DurationList.size()>=4) {
		 float f = (float) SaleMountTList.get(3);
		 
		 int object3 = (int)f;
		 
		 e4= DurationList.get(3)*7;
		
		 if(e1+e2+e3+e4-c<d) {
			
		 int numberFours=object3/e1+e2+e3+e4-c;
			
		 list.add(numberFours);
			
		}

		    if(d-(e1+e2+e3-c)<e4) {
			
			int numberFour=object3/d-(e1+e2+e3-c);
			
			list.add(numberFour);
		}
		 
		if(d-(e1+e2-c)-e3<e4) {
			
          int numberF=object3/d-(e1+e2-c)-e3;
			
			list.add(numberF);	
			
		} 
		 
		if(d-(e1-c)-e2-e3<e4) {
			
	          int number=object3/d-(e1-c)-e2-e3;
				
				list.add(number);	
				
			} 
		
		
		
	 };
 
	
	 
	}
	
	return list;
}*/
/**
 * 量 月指标规划值取数据
 * @param start
 * @param end
 * @param brand
 * @param model
 * @return
 */

public List<Integer> addAvgMonthDate(String start,String end,String brand,String model){
	List<Integer> listInt= new ArrayList<Integer>(); 
	@SuppressWarnings("unused")
	List<Integer> listI= new ArrayList<Integer>(); 
	//距开始销售的时间差c
	@SuppressWarnings("unused")
	int c = absoluteRangeService.selectMonthRange(start, brand, model);	

   //所选时间段相差多少个月
	int d = absoluteRangeService.selectMonthDiffer(start, end);
  //  System.out.println(d);
	//查出生命周期的所属周期和持续周数
	List<LifeDate> brandLife = absoluteRangeService.selectBrandLife(brand, model);
	int e1=0;//导入期
	
    int e2=0;//成长期
 
    int e3=0;//成熟期
 
    int e4=0;//衰退期
	if(brandLife!=null&&!brandLife.isEmpty()) {
	  for(LifeDate example : brandLife){		  
/*		Map<String,Object> map = new HashMap<String,Object>();
		map.put("Cycle", example.getCYCLE());//所属周期
		map.put("Duration", example.getDURATION());//周数
		map.put("avg", (int)example.getSALEAMOUNT()/(example.getDURATION()*7));//每天平均值
*/		
		  if("1".equals(example.getCYCLE())) {
			e1=d;
			for(int i= 0;i<e1;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getSALEAMOUNT()/example.getDURATION());
				}
			}
		}
		if("2".equals(example.getCYCLE())) {
			e2=d;
			for(int i= 0;i<e2;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getSALEAMOUNT()/example.getDURATION());
				}
			}
		}
		if("3".equals(example.getCYCLE())) {
			e3=d;
			for(int i= 0;i<e3;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getSALEAMOUNT()/example.getDURATION());
				}
			}
		}
		if("4".equals(example.getCYCLE())) {
			e4=d;
			for(int i= 0;i<e4;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getSALEAMOUNT()/example.getDURATION());
				}
			}
		}
	  }
	  }
	/*for(int i = 0 ; i<listInt.size();i++) {  
		if(i>c && i<c+d) {
			listI.add(listInt.get(i));
		}
  	}	*/
	
/*	int start1=0;//开始时间所属时期
	int end1 = 0;//结束时间所属时期
	if(e1-c>0) {//开始时间属于第一周期
		start1=1;
		if(d+c-e1<0) {//结束时间属于第1周期
			end1 = 1;
		}else if(d+c-e1-e2<0) {//结束时间属于第2周期
			end1 = 2;
		}else if(d+c-e1-e2-e3<0) {//结束时间属于第3周期
			end1 = 3;
		}else if(d+c-e1-e2-e3-e4<0) {//结束时间属于第4周期
			end1 = 4;
		}
		
	}else if(e1+e2-c>0) {//开始时间属于第2周期
		start1=2;
		if(d+c-e1-e2<0) {//结束时间属于第2周期
			end1 = 2;
		}else if(d+c-e1-e2-e3<0) {//结束时间属于第3周期
			end1 = 3;
		}else if(d+c-e1-e2-e3-e4<0) {//结束时间属于第4周期
			end1 = 4;
		}
	}else if(e1+e2+e3-c>0) {//开始时间属于第3周期
		start1=3;
		if(d+c-e1-e2-e3<0) {//结束时间属于第3周期
			end1 = 3;
		}else if(d+c-e1-e2-e3-e4<0) {//结束时间属于第4周期
			end1 = 4;
		}
	}else if(e1+e2+e3+e4-c>0) {//开始时间/结束时间属于第4周期
		start1=4;
		end1 = 4;
	}
	for(int i=0;i<d;i++) {
		listInt.add(list.get(0).get("avg"));
	} */
	  
	
return listInt;	
}

public List<Float> addAvgDate(String start,String end,String brand,String model){
	List<Float> listInt= new ArrayList<Float>(); 
	@SuppressWarnings("unused")
	List<Integer> listI= new ArrayList<Integer>(); 
	//距开始销售的时间差c
	@SuppressWarnings("unused")
	int c = absoluteRangeService.selectHowDay(start, brand, model);	

   //所选时间段相差多少天d
	int d = absoluteRangeService.selectHowDays(start, end);
    //System.out.println(d);
	//查出生命周期的所属周期和持续周数
	List<LifeDate> brandLife = absoluteRangeService.selectBrandLife(brand, model);
	int e1=0;//导入期
	
    int e2=0;//成长期
 
    int e3=0;//成熟期
 
    int e4=0;//衰退期
	if(brandLife!=null&&!brandLife.isEmpty()) {
	  for(LifeDate example : brandLife){		  
/*		Map<String,Object> map = new HashMap<String,Object>();
		map.put("Cycle", example.getCYCLE());//所属周期
		map.put("Duration", example.getDURATION());//周数
		map.put("avg", (int)example.getSALEAMOUNT()/(example.getDURATION()*7));//每天平均值
*/		if("1".equals(example.getCYCLE())) {
			e1=example.getDURATION()*7;
			for(int i= 0;i<e1;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((Float)example.getSALEAMOUNT()/(example.getDURATION()*7));
				}
			}
		}
		if("2".equals(example.getCYCLE())) {
			e2=example.getDURATION()*7;
			for(int i= 0;i<e2;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((Float)example.getSALEAMOUNT()/(example.getDURATION()*7));
				}
			}
		}
		if("3".equals(example.getCYCLE())) {
			e3=example.getDURATION()*7;
			for(int i= 0;i<e3;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((Float)example.getSALEAMOUNT()/(example.getDURATION()*7));
				}
			}
		}
		if("4".equals(example.getCYCLE())) {
			e4=example.getDURATION()*7;
			for(int i= 0;i<e4;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((Float)example.getSALEAMOUNT()/(example.getDURATION()*7));
				}
			}
		}
	  }
	  }
	/*for(int i = 0 ; i<listInt.size();i++) {  
		if(i>c && i<c+d) {
			listI.add(listInt.get(i));
		}
  	}	*/
	
/*	int start1=0;//开始时间所属时期
	int end1 = 0;//结束时间所属时期
	if(e1-c>0) {//开始时间属于第一周期
		start1=1;
		if(d+c-e1<0) {//结束时间属于第1周期
			end1 = 1;
		}else if(d+c-e1-e2<0) {//结束时间属于第2周期
			end1 = 2;
		}else if(d+c-e1-e2-e3<0) {//结束时间属于第3周期
			end1 = 3;
		}else if(d+c-e1-e2-e3-e4<0) {//结束时间属于第4周期
			end1 = 4;
		}
		
	}else if(e1+e2-c>0) {//开始时间属于第2周期
		start1=2;
		if(d+c-e1-e2<0) {//结束时间属于第2周期
			end1 = 2;
		}else if(d+c-e1-e2-e3<0) {//结束时间属于第3周期
			end1 = 3;
		}else if(d+c-e1-e2-e3-e4<0) {//结束时间属于第4周期
			end1 = 4;
		}
	}else if(e1+e2+e3-c>0) {//开始时间属于第3周期
		start1=3;
		if(d+c-e1-e2-e3<0) {//结束时间属于第3周期
			end1 = 3;
		}else if(d+c-e1-e2-e3-e4<0) {//结束时间属于第4周期
			end1 = 4;
		}
	}else if(e1+e2+e3+e4-c>0) {//开始时间/结束时间属于第4周期
		start1=4;
		end1 = 4;
	}
	for(int i=0;i<d;i++) {
		listInt.add(list.get(0).get("avg"));
	} */
	  
	
return listInt;	
}

//规划毛利的计算方法


public List<Integer> profitPlan(String start,String end,String brand,String model){
	List<Integer> listInt= new ArrayList<Integer>(); 
	@SuppressWarnings("unused")
	List<Integer> listI= new ArrayList<Integer>(); 
	//距开始销售的时间差c
	@SuppressWarnings("unused")
	int c = absoluteRangeService.selectHowDay(start, brand, model);	

   //所选时间段相差多少天d
	int d = absoluteRangeService.selectHowDays(start, end);
   // System.out.println(d);
	//查出生命周期的所属周期和持续周数
	List<LifeDate> brandLife = absoluteRangeService.selectBrandLife(brand, model);
	int e1=0;//导入期
	
    int e2=0;//成长期
 
    int e3=0;//成熟期
 
    int e4=0;//衰退期
	if(brandLife!=null&&!brandLife.isEmpty()) {
	  for(LifeDate example : brandLife){		  
/*		Map<String,Object> map = new HashMap<String,Object>();
		map.put("Cycle", example.getCYCLE());//所属周期
		map.put("Duration", example.getDURATION());//周数
		map.put("avg", (int)example.getSALEAMOUNT()/(example.getDURATION()*7));//每天平均值
*/		
		  if("1".equals(example.getCYCLE())) {
			e1=example.getDURATION()*7;
			for(int i= 0;i<e1;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getMAORI()/(example.getDURATION()*7));
				}
			}
		}
		if("2".equals(example.getCYCLE())) {
			e2=example.getDURATION()*7;
			for(int i= 0;i<e2;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getMAORI()/(example.getDURATION()*7));
				}
			}
		}
		if("3".equals(example.getCYCLE())) {
			e3=example.getDURATION()*7;
			for(int i= 0;i<e3;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getMAORI()/(example.getDURATION()*7));
				}
			}
		}
		if("4".equals(example.getCYCLE())) {
			e4=example.getDURATION()*7;
			for(int i= 0;i<e4;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getMAORI()/(example.getDURATION()*7));
				}
			}
		}
	  }
	  }
	//导入期第一日		select min(DODATE) from ZD_RESULT_OPER_LSLJ_AREA_D where BRANDNAME='所选品牌' and SPEC='所选机型')
	//衰退期最后一日	select max(DODATE) from ZD_RESULT_OPER_LSLJ_AREA_D where BRANDNAME='所选品牌' and SPEC='所选机型')
	//导入期第一日<=开始时间<结束时间<=衰退期最后一日
	// q= select datediff(end,endTime) from dual
	//startTime--start--end--endTime
	
	/*
	 * 1.end<=startTime
	 * 2.start<=startTime<end<=endTime
	 * 
	 * 
	 * 3.startTime<start<end<=endTime
	 * 4.startTime<start<endTime<end
	 * 
	 * 5.endTime<=start
	 */
	
/*----------------------核心判断--------------------------*/	
//	int q = end-endTime;
//	// 3.startTime<=start<end<=endTime
//	for(int i = 0 ; i<listInt.size();i++) { 
//		if(i>c && i<c+d) {
//			listI.add(listInt.get(i));
//		}
//  	}
//	//5.endTime<=start
//	if(start>=endTime) {
//		for(int i = 0 ; i<d;i++) {		
//			listI.add(listInt.get(listInt.size()-1));
//		}
//	}else {
//		for(int i = 0 ; i<q;i++) {		
//				listI.add(listInt.get(listInt.size()-1));
//		}
//	}
	
	
	/*----------------------核心判断--------------------------*/	
	
/*	int start1=0;//开始时间所属时期
	int end1 = 0;//结束时间所属时期
	if(e1-c>0) {//开始时间属于第一周期
		start1=1;
		if(d+c-e1<0) {//结束时间属于第1周期
			end1 = 1;
		}else if(d+c-e1-e2<0) {//结束时间属于第2周期
			end1 = 2;
		}else if(d+c-e1-e2-e3<0) {//结束时间属于第3周期
			end1 = 3;
		}else if(d+c-e1-e2-e3-e4<0) {//结束时间属于第4周期
			end1 = 4;
		}
		
	}else if(e1+e2-c>0) {//开始时间属于第2周期
		start1=2;
		if(d+c-e1-e2<0) {//结束时间属于第2周期
			end1 = 2;
		}else if(d+c-e1-e2-e3<0) {//结束时间属于第3周期
			end1 = 3;
		}else if(d+c-e1-e2-e3-e4<0) {//结束时间属于第4周期
			end1 = 4;
		}
	}else if(e1+e2+e3-c>0) {//开始时间属于第3周期
		start1=3;
		if(d+c-e1-e2-e3<0) {//结束时间属于第3周期
			end1 = 3;
		}else if(d+c-e1-e2-e3-e4<0) {//结束时间属于第4周期
			end1 = 4;
		}
	}else if(e1+e2+e3+e4-c>0) {//开始时间/结束时间属于第4周期
		start1=4;
		end1 = 4;
	}
	for(int i=0;i<d;i++) {
		listInt.add(list.get(0).get("avg"));
	} */
	  
	
return listInt;	
}
/**
 *  规划毛利月指标取数据
 * @param start
 * @param end
 * @param brand
 * @param model
 * @return
 */
public List<Integer> profitPlanMonth(String start,String end,String brand,String model){
	List<Integer> listInt= new ArrayList<Integer>(); 
	@SuppressWarnings("unused")
	List<Integer> listI= new ArrayList<Integer>(); 
	//距开始销售的时间差c
	@SuppressWarnings("unused")
	int c = absoluteRangeService.selectMonthRange(start, brand, model);	

   //所选时间段相差多少个月
	int d = absoluteRangeService.selectMonthDiffer(start, end);
   // System.out.println(d);
	//查出生命周期的所属周期和持续周数
	List<LifeDate> brandLife = absoluteRangeService.selectBrandLife(brand, model);
	int e1=0;//导入期
	
    int e2=0;//成长期
 
    int e3=0;//成熟期
 
    int e4=0;//衰退期
	if(brandLife!=null&&!brandLife.isEmpty()) {
	  for(LifeDate example : brandLife){		  
/*		Map<String,Object> map = new HashMap<String,Object>();
		map.put("Cycle", example.getCYCLE());//所属周期
		map.put("Duration", example.getDURATION());//周数
		map.put("avg", (int)example.getSALEAMOUNT()/(example.getDURATION()*7));//每天平均值
*/		
		  if("1".equals(example.getCYCLE())) {
			e1=d;
			for(int i= 0;i<e1;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getSALEAMOUNT()/example.getDURATION());
				}
			}
		}
		if("2".equals(example.getCYCLE())) {
			e2=d;
			for(int i= 0;i<e2;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getSALEAMOUNT()/example.getDURATION());
				}
			}
		}
		if("3".equals(example.getCYCLE())) {
			e3=d;
			for(int i= 0;i<e3;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getSALEAMOUNT()/example.getDURATION());
				}
			}
		}
		if("4".equals(example.getCYCLE())) {
			e4=d;
			for(int i= 0;i<e4;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getSALEAMOUNT()/example.getDURATION());
				}
			}
		}
	  }
	  }

	  
	
return listInt;	
}


//收入 计算规划收入的方法
public List<Integer> incomePlanDay(String start,String end,String brand,String model){
	List<Integer> listInt= new ArrayList<Integer>(); 
	@SuppressWarnings("unused")
	List<Integer> listI= new ArrayList<Integer>(); 
	//距开始销售的时间差c
	@SuppressWarnings("unused")
	int c = absoluteRangeService.selectHowDay(start, brand, model);	

   //所选时间段相差多少天d
	int d = absoluteRangeService.selectHowDays(start, end);
   // System.out.println(d);
	//查出生命周期的所属周期和持续周数
	List<LifeDate> brandLife = absoluteRangeService.selectBrandLife(brand, model);
	int e1=0;//导入期
	
    int e2=0;//成长期
 
    int e3=0;//成熟期
 
    int e4=0;//衰退期
	if(brandLife!=null&&!brandLife.isEmpty()) {
	  for(LifeDate example : brandLife){		  
/*		Map<String,Object> map = new HashMap<String,Object>();
		map.put("Cycle", example.getCYCLE());//所属周期
		map.put("Duration", example.getDURATION());//周数
		map.put("avg", (int)example.getSALEAMOUNT()/(example.getDURATION()*7));//每天平均值
*/		
		  if("1".equals(example.getCYCLE())) {
			e1=example.getDURATION()*7;
			for(int i= 0;i<e1;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getINCOME()/(example.getDURATION()*7));
				}
			}
		}
		if("2".equals(example.getCYCLE())) {
			e2=example.getDURATION()*7;
			for(int i= 0;i<e2;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getINCOME()/(example.getDURATION()*7));
				}
			}
		}
		if("3".equals(example.getCYCLE())) {
			e3=example.getDURATION()*7;
			for(int i= 0;i<e3;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getINCOME()/(example.getDURATION()*7));
				}
			}
		}
		if("4".equals(example.getCYCLE())) {
			e4=example.getDURATION()*7;
			for(int i= 0;i<e4;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getINCOME()/(example.getDURATION()*7));
				}
			}
		}
	  }
	  }

return listInt;	
}

/**
 * 收入规划月指标取数据 
 * @param start
 * @param end
 * @param brand
 * @param model
 * @return
 */
public List<Integer> incomePlanMonth(String start,String end,String brand,String model){
	List<Integer> listInt= new ArrayList<Integer>(); 
	@SuppressWarnings("unused")
	List<Integer> listI= new ArrayList<Integer>(); 
	//距开始销售的时间差c
	@SuppressWarnings("unused")
	int c = absoluteRangeService.selectMonthRange(start, brand, model);	

   //所选时间段相差多少个月
	int d = absoluteRangeService.selectMonthDiffer(start, end);
   // System.out.println(d);
	//查出生命周期的所属周期和持续周数
	List<LifeDate> brandLife = absoluteRangeService.selectBrandLife(brand, model);
	int e1=0;//导入期
	
    int e2=0;//成长期
 
    int e3=0;//成熟期
 
    int e4=0;//衰退期
	if(brandLife!=null&&!brandLife.isEmpty()) {
	  for(LifeDate example : brandLife){		  
/*		Map<String,Object> map = new HashMap<String,Object>();
		map.put("Cycle", example.getCYCLE());//所属周期
		map.put("Duration", example.getDURATION());//周数
		map.put("avg", (int)example.getSALEAMOUNT()/(example.getDURATION()*7));//每天平均值
*/		
		  if("1".equals(example.getCYCLE())) {
			e1=d;
			for(int i= 0;i<e1;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getSALEAMOUNT()/example.getDURATION());
				}
			}
		}
		if("2".equals(example.getCYCLE())) {
			e2=d;
			for(int i= 0;i<e2;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getSALEAMOUNT()/example.getDURATION());
				}
			}
		}
		if("3".equals(example.getCYCLE())) {
			e3=d;
			for(int i= 0;i<e3;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getSALEAMOUNT()/example.getDURATION());
				}
			}
		}
		if("4".equals(example.getCYCLE())) {
			e4=d;
			for(int i= 0;i<e4;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getSALEAMOUNT()/example.getDURATION());
				}
			}
		}
	  }
	  }	
return listInt;	
}




//规划累计覆盖数去日指标数据
public List<Integer> coverPlan(String start,String end,String brand,String model){
	List<Integer> listInt= new ArrayList<Integer>(); 
	@SuppressWarnings("unused")
	List<Integer> listI= new ArrayList<Integer>(); 
	//距开始销售的时间差c
	@SuppressWarnings("unused")
	int c = absoluteRangeService.selectHowDay(start, brand, model);	

   //所选时间段相差多少天d
	int d = absoluteRangeService.selectHowDays(start, end);
  //  System.out.println(d);
	//查出生命周期的所属周期和持续周数
	List<LifeDate> brandLife = absoluteRangeService.selectBrandLife(brand, model);
	int e1=0;//导入期
	
    int e2=0;//成长期
 
    int e3=0;//成熟期
 
    int e4=0;//衰退期
	if(brandLife!=null&&!brandLife.isEmpty()) {
	  for(LifeDate example : brandLife){		  
/*		Map<String,Object> map = new HashMap<String,Object>();
		map.put("Cycle", example.getCYCLE());//所属周期
		map.put("Duration", example.getDURATION());//周数
		map.put("avg", (int)example.getSALEAMOUNT()/(example.getDURATION()*7));//每天平均值
*/		if("1".equals(example.getCYCLE())) {
			e1=example.getDURATION()*7;
			for(int i= 0;i<e1;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getOVERAMOUNT()/(example.getDURATION()*7));
				}
			}
		}
		if("2".equals(example.getCYCLE())) {
			e2=example.getDURATION()*7;
			for(int i= 0;i<e2;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getOVERAMOUNT()/(example.getDURATION()*7));
				}
			}
		}
		if("3".equals(example.getCYCLE())) {
			e3=example.getDURATION()*7;
			for(int i= 0;i<e3;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getOVERAMOUNT()/(example.getDURATION()*7));
				}
			}
		}
		if("4".equals(example.getCYCLE())) {
			e4=example.getDURATION()*7;
			for(int i= 0;i<e4;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getOVERAMOUNT()/(example.getDURATION()*7));
				}
			}
		}
	  }
	  }
	
return listInt;	
}

/**
 * 规划累计覆盖月指标取数据
 * @param start
 * @param end
 * @param brand
 * @param model
 * @return
 */
public List<Integer> coverPlanMonth(String start,String end,String brand,String model){
	List<Integer> listInt= new ArrayList<Integer>(); 
	@SuppressWarnings("unused")
	List<Integer> listI= new ArrayList<Integer>(); 
	//距开始销售的时间差c
	@SuppressWarnings("unused")
	int c = absoluteRangeService.selectMonthRange(start, brand, model);	

   //所选时间段相差多少个月
	int d = absoluteRangeService.selectMonthDiffer(start, end);
    //System.out.println(d);
	//查出生命周期的所属周期和持续周数
	List<LifeDate> brandLife = absoluteRangeService.selectBrandLife(brand, model);
	int e1=0;//导入期
	
    int e2=0;//成长期
 
    int e3=0;//成熟期
 
    int e4=0;//衰退期
	if(brandLife!=null&&!brandLife.isEmpty()) {
	  for(LifeDate example : brandLife){		  
/*		Map<String,Object> map = new HashMap<String,Object>();
		map.put("Cycle", example.getCYCLE());//所属周期
		map.put("Duration", example.getDURATION());//周数
		map.put("avg", (int)example.getSALEAMOUNT()/(example.getDURATION()*7));//每天平均值
*/		
		  if("1".equals(example.getCYCLE())) {
			e1=d;
			for(int i= 0;i<e1;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getOVERAMOUNT()/example.getDURATION());
				}
			}
		}
		if("2".equals(example.getCYCLE())) {
			e2=d;
			for(int i= 0;i<e2;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getOVERAMOUNT()/example.getDURATION());
				}
			}
		}
		if("3".equals(example.getCYCLE())) {
			e3=d;
			for(int i= 0;i<e3;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getOVERAMOUNT()/example.getDURATION());
				}
			}
		}
		if("4".equals(example.getCYCLE())) {
			e4=d;
			for(int i= 0;i<e4;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getOVERAMOUNT()/example.getDURATION());
				}
			}
		}
	  }
	  }

	  
	
return listInt;	
}



//规划份额日指标取数据

public List<Integer> coverShare(String start,String end,String brand,String model){
	List<Integer> listInt= new ArrayList<Integer>(); 
	@SuppressWarnings("unused")
	List<Integer> listI= new ArrayList<Integer>(); 
	//距开始销售的时间差c
	@SuppressWarnings("unused")
	int c = absoluteRangeService.selectHowDay(start, brand, model);	

   //所选时间段相差多少天d
	int d = absoluteRangeService.selectHowDays(start, end);
   // System.out.println(d);
	//查出生命周期的所属周期和持续周数
	List<LifeDate> brandLife = absoluteRangeService.selectBrandLife(brand, model);
	int e1=0;//导入期
	
    int e2=0;//成长期
 
    int e3=0;//成熟期
 
    int e4=0;//衰退期
	if(brandLife!=null&&!brandLife.isEmpty()) {
	  for(LifeDate example : brandLife){		  
/*		Map<String,Object> map = new HashMap<String,Object>();
		map.put("Cycle", example.getCYCLE());//所属周期
		map.put("Duration", example.getDURATION());//周数
		map.put("avg", (int)example.getSALEAMOUNT()/(example.getDURATION()*7));//每天平均值
*/		if("1".equals(example.getCYCLE())) {
			e1=example.getDURATION()*7;
			for(int i= 0;i<e1;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getSHARE()/(example.getDURATION()*7));
				}
			}
		}
		if("2".equals(example.getCYCLE())) {
			e2=example.getDURATION()*7;
			for(int i= 0;i<e2;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getSHARE()/(example.getDURATION()*7));
				}
			}
		}
		if("3".equals(example.getCYCLE())) {
			e3=example.getDURATION()*7;
			for(int i= 0;i<e3;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getSHARE()/(example.getDURATION()*7));
				}
			}
		}
		if("4".equals(example.getCYCLE())) {
			e4=example.getDURATION()*7;
			for(int i= 0;i<e4;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getSHARE()/(example.getDURATION()*7));
				}
			}
		}
	  }
	  }
	
return listInt;	
}

/**
 * 规划份额月指标取数据
 * @param start
 * @param end
 * @param brand
 * @param model
 * @return
 */

public List<Integer> coverShareMonth(String start,String end,String brand,String model){
	List<Integer> listInt= new ArrayList<Integer>(); 
	@SuppressWarnings("unused")
	List<Integer> listI= new ArrayList<Integer>(); 
	//距开始销售的时间差c
	@SuppressWarnings("unused")
	int c = absoluteRangeService.selectMonthRange(start, brand, model);	

   //所选时间段相差多少个月
	int d = absoluteRangeService.selectMonthDiffer(start, end);
    //System.out.println(d);
	//查出生命周期的所属周期和持续周数
	List<LifeDate> brandLife = absoluteRangeService.selectBrandLife(brand, model);
	int e1=0;//导入期
	
    int e2=0;//成长期
 
    int e3=0;//成熟期
 
    int e4=0;//衰退期
	if(brandLife!=null&&!brandLife.isEmpty()) {
	  for(LifeDate example : brandLife){		  
/*		Map<String,Object> map = new HashMap<String,Object>();
		map.put("Cycle", example.getCYCLE());//所属周期
		map.put("Duration", example.getDURATION());//周数
		map.put("avg", (int)example.getSALEAMOUNT()/(example.getDURATION()*7));//每天平均值
*/		
		  if("1".equals(example.getCYCLE())) {
			e1=d;
			for(int i= 0;i<e1;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getSHARE()/example.getDURATION());
				}
			}
		}
		if("2".equals(example.getCYCLE())) {
			e2=d;
			for(int i= 0;i<e2;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getSHARE()/example.getDURATION());
				}
			}
		}
		if("3".equals(example.getCYCLE())) {
			e3=d;
			for(int i= 0;i<e3;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getSHARE()/example.getDURATION());
				}
			}
		}
		if("4".equals(example.getCYCLE())) {
			e4=d;
			for(int i= 0;i<e4;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getSHARE()/example.getDURATION());
				}
			}
		}
	  }
	  }

	  
	
return listInt;	
}


//规划库存周数
public List<Integer> shockPlan(String start,String end,String brand,String model){
	List<Integer> listInt= new ArrayList<Integer>(); 
	@SuppressWarnings("unused")
	List<Integer> listI= new ArrayList<Integer>(); 
	//距开始销售的时间差c
	@SuppressWarnings("unused")
	int c = absoluteRangeService.selectHowDay(start, brand, model);	

 //所选时间段相差多少天d
	int d = absoluteRangeService.selectHowDays(start, end);
 // System.out.println(d);
	//查出生命周期的所属周期和持续周数
	List<LifeDate> brandLife = absoluteRangeService.selectBrandLife(brand, model);
	int e1=0;//导入期
	
  int e2=0;//成长期

  int e3=0;//成熟期

  int e4=0;//衰退期
	if(brandLife!=null&&!brandLife.isEmpty()) {
	  for(LifeDate example : brandLife){		  
/*		Map<String,Object> map = new HashMap<String,Object>();
		map.put("Cycle", example.getCYCLE());//所属周期
		map.put("Duration", example.getDURATION());//周数
		map.put("avg", (int)example.getSALEAMOUNT()/(example.getDURATION()*7));//每天平均值
*/		if("1".equals(example.getCYCLE())) {//导入期取值
			e1=example.getDURATION()*7;
			for(int i= 0;i<e1;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getTURNOVERTIME()/(example.getDURATION()*7));
				}
			}
		}
		if("2".equals(example.getCYCLE())) {//成长期取值
			e2=example.getDURATION()*7;
			for(int i= 0;i<e2;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getTURNOVERTIME()/(example.getDURATION()*7));
				}
			}
		}
		if("3".equals(example.getCYCLE())) {//成熟期取值
			e3=example.getDURATION()*7;
			for(int i= 0;i<e3;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getTURNOVERTIME()/(example.getDURATION()*7));
				}
			}
		}
		if("4".equals(example.getCYCLE())) {//衰退期取值
			e4=example.getDURATION()*7;
			for(int i= 0;i<e4;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getTURNOVERTIME()/(example.getDURATION()*7));
				}
			}
		}
	  }
	  }
	
return listInt;	
}
/**
 * 规划库存周数月指标取数据
 * @param start
 * @param end
 * @param brand
 * @param model
 * @return
 */
public List<Integer> shockPlanMonth(String start,String end,String brand,String model){
	List<Integer> listInt= new ArrayList<Integer>(); 
	@SuppressWarnings("unused")
	List<Integer> listI= new ArrayList<Integer>(); 
	//距开始销售的时间差c
	@SuppressWarnings("unused")
	int c = absoluteRangeService.selectMonthRange(start, brand, model);	

   //所选时间段相差多少个月
	int d = absoluteRangeService.selectMonthDiffer(start, end);
   // System.out.println(d);
	//查出生命周期的所属周期和持续周数
	List<LifeDate> brandLife = absoluteRangeService.selectBrandLife(brand, model);
	int e1=0;//导入期
	
    int e2=0;//成长期
 
    int e3=0;//成熟期
 
    int e4=0;//衰退期
	if(brandLife!=null&&!brandLife.isEmpty()) {
	  for(LifeDate example : brandLife){		  
/*		Map<String,Object> map = new HashMap<String,Object>();
		map.put("Cycle", example.getCYCLE());//所属周期
		map.put("Duration", example.getDURATION());//周数
		map.put("avg", (int)example.getSALEAMOUNT()/(example.getDURATION()*7));//每天平均值
*/		
		  if("1".equals(example.getCYCLE())) {
			e1=d;
			for(int i= 0;i<e1;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getTURNOVERTIME()/example.getDURATION());
				}
			}
		}
		if("2".equals(example.getCYCLE())) {
			e2=d;
			for(int i= 0;i<e2;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getTURNOVERTIME()/example.getDURATION());
				}
			}
		}
		if("3".equals(example.getCYCLE())) {
			e3=d;
			for(int i= 0;i<e3;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getTURNOVERTIME()/example.getDURATION());
				}
			}
		}
		if("4".equals(example.getCYCLE())) {
			e4=d;
			for(int i= 0;i<e4;i++) {
				if(example.getDURATION()!=0) {
				listInt.add((int)example.getTURNOVERTIME()/example.getDURATION());
				}
			}
		}
	  }
	  }

	  
	
return listInt;	
}




}

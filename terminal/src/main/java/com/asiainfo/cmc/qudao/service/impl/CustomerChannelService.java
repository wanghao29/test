package com.asiainfo.cmc.qudao.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tk.mybatis.mapper.util.StringUtil;

import com.asiainfo.cmc.qudao.enties.CusChanPortray;
import com.asiainfo.cmc.qudao.enties.SevenPort;
import com.asiainfo.cmc.qudao.enties.ZdHallTshop;
import com.asiainfo.cmc.qudao.mapper.CusChanPortrayMapper;
import com.asiainfo.cmc.qudao.mapper.CustomerChangeWHMapper;
import com.asiainfo.cmc.qudao.mapper.CustomerChannelMapper;
import com.asiainfo.cmc.qudao.mapper.CustomerIdentifyInfoMapper;
import com.asiainfo.cmc.qudao.mapper.HallIdentifyInfoMapper;
import com.asiainfo.cmc.qudao.service.ICustomerChannelService;
import com.asiainfo.cmc.qudao.utils.MyDateFormat;
import com.asiainfo.cmc.qudao.utils.PortrayIntegration;
import com.asiainfo.cmc.qudao.utils.PortrayIntegration1;
import com.asiainfo.cmc.qudao.vo.StoreBattleVo;

@Service
@Transactional
public class CustomerChannelService implements ICustomerChannelService{
	
    @Resource
    private CusChanPortrayMapper cusChanPortrayMapper;
    @Resource
    private CustomerChangeWHMapper customerChangeWHMapper;
    
    @Resource
    private CustomerChannelMapper customerChannelMapper;
    
    @Resource
    private CustomerIdentifyInfoMapper customerIdentifyInfoMapper;    
    @Resource
    private HallIdentifyInfoMapper hallIdentifyInfoMapper;
    
	@Override
	public List<StoreBattleVo> listAllCustomer(StoreBattleVo vo) {
		return  customerChannelMapper.listAllCustomer(vo);
	}
	@Override
	public List<StoreBattleVo> listHallByCustomer(StoreBattleVo vo) {
		return  customerChannelMapper.listHallByCustomer( vo);
	}	
	@Override
	public List<StoreBattleVo> vagueQuery(StoreBattleVo vo) {
		return customerChannelMapper.vagueQuery(vo);
	}

	@Override
	public List<CusChanPortray> listCustmerPortray(StoreBattleVo vo) {
		List<CusChanPortray> portrays = cusChanPortrayMapper.listCustomerByIds(vo.getIds());   
		
		List<CusChanPortray> showType1 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType2 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType3 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType4 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType5 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType5_ywst = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType6 = new ArrayList<CusChanPortray>();
		
		List<CusChanPortray> showType4_custNormal = new ArrayList<CusChanPortray>();
		
		String fieldFunc = "'"+vo.getStartMonth()+"-"+vo.getEndMonth()+"' month";
		String field_custNormal = "'"+vo.getStartMonth()+"-"+vo.getEndMonth()+"' stat_month";

		
		for(CusChanPortray portray : portrays){
			String tableName = portray.getTableName();
			if("zd_result_cust_portrait_new_m".equalsIgnoreCase(tableName)){
				Integer showType = portray.getShowType();
				if(showType==2){  //曲线图的sql: select *
					showType2.add(portray);					
				}
				else if(showType==6){
					showType6.add(portray);
				}				
				else if(showType==1){
					showType1.add(portray);	
					fieldFunc += ","+ "MAX("+portray.getName()+") "+portray.getName();
				}
				else if(showType==3){
					showType3.add(portray); 
					fieldFunc += ","+ "SUM("+portray.getName()+")/count(1) "+portray.getName();
				}
				else if(showType==5 && portray.getDetail().split(";").length<2){  //异网渗透率
					showType5_ywst.add(portray);					
				}
				else if(showType==5){
					showType5.add(portray);
					String details = portray.getDetail();
					String[] detNames = details.split(";")[1].split(",");
					for(String detName : detNames){
						fieldFunc += ","+ "SUM(" +detName+ ")/COUNT(1) " +detName;
				    }					
				}
				else if(showType==4){					
					String details = portray.getDetail();					
					if(StringUtil.isNotEmpty(details)){      //处理特殊柱状图  单点促销能力 
						String[] detNames = details.split(";")[1].split(",");
						for(String detName : detNames){
							fieldFunc += ","+ "SUM(" +detName+ ") " +detName;
					    }
						showType4.add(portray);
					}else{
						showType2.add(portray);
					}
				}
			}
			
			if("ZD_RESULT_CUSTOMER_NORMAL_M".equalsIgnoreCase(tableName)){
				Integer showType = portray.getShowType();
                if(showType==4){
					showType4_custNormal.add(portray);
					String details = portray.getDetail();
					String[] detNames = details.split(";")[1].split(",");
					for(String detName : detNames){
 						field_custNormal += ","+ "SUM(" +detName+ ") " +detName;
				    }
				}
			}
		}			
		
		
		List<String> months = MyDateFormat.getMonthBetween(vo.getStartMonth(),vo.getEndMonth());
		vo.setMonths(months);
		List<Map<String,Object>> mapList = customerChannelMapper.getCustomerFieldByMons(vo);
		//曲线图
		if(showType2.size()>0){				        
			PortrayIntegration.showType2(mapList,showType2,months,"month");
		}
		
		//top图
		if(showType6.size()>0){
			PortrayIntegration.showType6(mapList,showType6);	
		}
		
		if(showType5_ywst.size()>0){
			PortrayIntegration.showType5_ywst(mapList,showType5_ywst);	
		}
		
		vo.setField(fieldFunc);
		Map<String,Object> map = customerChannelMapper.getCustomerFieldByMon(vo);  
		//键值对、单值环形图
		if(showType1.size()>0){						
			PortrayIntegration.showType1(map,showType1);
		}
		
		//环形图
		if(showType3.size()>0){						
			PortrayIntegration.showType3(map,showType3);
		}

		//多值饼图
		if(showType5.size()>0){			
			PortrayIntegration.showType5(map,showType5);		
		}	
		
		//柱状图
		if(showType4.size()>0){
			PortrayIntegration.showType4(map,showType4);	
		}
		
		//
		vo.setField(field_custNormal);
		List<String> list = new ArrayList<String>();//创建集合对象；
		list.add("全省");
		list.add("广州");
		list.add("清远");
		list.add("肇庆");
		list.add("韶关");
		list.add("云浮");
		list.add("佛山");
		list.add("江门");
		list.add("茂名");
		list.add("阳江");
		list.add("湛江");
		list.add("深圳");
		list.add("汕头");
		list.add("梅州");
		list.add("汕尾");
		list.add("揭阳");
		list.add("潮州");
		list.add("东莞");
		list.add("惠州");
		list.add("珠海");
		list.add("中山");
		list.add("河源");
		for (String string : list) {
		if(vo.getCusOrgacode()!=null && vo.getCusOrgacode().equals(string) && !vo.getCusOrgacode().equals("全省")) {
		//执行数据	
			Map<String,Object> map_custNormal = customerChangeWHMapper.customerChangeAll(vo);
			
			if(showType4_custNormal.size()>0){			
				PortrayIntegration.showType4(map_custNormal,showType4_custNormal);
			}
				
			return portrays;
			
		} else if(vo.getCusOrgacode()!=null && vo.getCusOrgacode().equals("全省")) {
			
            Map<String,Object> map_custNormal = customerChangeWHMapper.customerChangeAll11(vo);
			
			if(showType4_custNormal.size()>0){			
				PortrayIntegration.showType4(map_custNormal,showType4_custNormal);
			}
				
			return portrays;
			
		}
			
			
		}
		
		
		Map<String,Object> map_custNormal = customerIdentifyInfoMapper.getCustNormalFieldByMon(vo); 
		if(showType4_custNormal.size()>0){			
			PortrayIntegration.showType4(map_custNormal,showType4_custNormal);
		}
			
		return portrays;
	}
	
	@Override
	public List<CusChanPortray> listPortrayFieldInCusChanl() {
		return cusChanPortrayMapper.listPortrayFieldInCusChanl();
	}
	@Override
	public List<CusChanPortray> listPortrayFieldInHallPortrait() {
		return cusChanPortrayMapper.listPortrayFieldInHallPortrait();
	}
	
	
    
    //以下是门店作战地图	
	@Override
	public List<CusChanPortray> listHallStoreBattleByIds(StoreBattleVo vo) {
		List<CusChanPortray> portrays = cusChanPortrayMapper.listHallStoreBattleByIds(vo.getIds()); 
		
		List<CusChanPortray> showType1 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType2 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType3 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType4 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType5 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType5_ywst = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType6 = new ArrayList<CusChanPortray>();
		
		List<CusChanPortray> showType4_custNormal = new ArrayList<CusChanPortray>();
		
		String fieldFunc = "'"+vo.getStartMonth()+"-"+vo.getEndMonth()+"' month";
		String field_custNormal = "'"+vo.getStartMonth()+"-"+vo.getEndMonth()+"' stat_month";

		
		for(CusChanPortray portray : portrays){
			String tableName = portray.getTableName();
			if("zd_result_hall_portrait_new_m".equalsIgnoreCase(tableName)){
				Integer showType = portray.getShowType();
				if(showType==2){  //曲线图的sql: select *
					showType2.add(portray);					
				}
				else if(showType==6){
					showType6.add(portray);
				}				
				else if(showType==1){
					showType1.add(portray);	
					fieldFunc += ","+ "MAX("+portray.getName()+") "+portray.getName();
				}
				else if(showType==3){
					showType3.add(portray); 
					fieldFunc += ","+ "SUM("+portray.getName()+")/count(1) "+portray.getName();
				}
				else if(showType==5 && portray.getDetail().split(";").length<2){  //异网渗透率
					showType5_ywst.add(portray);					
				}
				else if(showType==5){
					showType5.add(portray);
					String details = portray.getDetail();
					String[] detNames = details.split(";")[1].split(",");
					for(String detName : detNames){
						fieldFunc += ","+ "SUM(" +detName+ ")/COUNT(1) " +detName;
				    }					
				}
				else if(showType==4){					
					String details = portray.getDetail();					
					if(StringUtil.isNotEmpty(details)){      //处理特殊柱状图  单点促销能力 
						String[] detNames = details.split(";")[1].split(",");
						for(String detName : detNames){
							fieldFunc += ","+ "SUM(" +detName+ ") " +detName;
					    }
						showType4.add(portray);
					}else{
						showType2.add(portray);
					}
				}
			}
			
			if("ZD_RESULT_HALL_NORMAL_M".equalsIgnoreCase(tableName)){
				Integer showType = portray.getShowType();
                if(showType==4){
					showType4_custNormal.add(portray);
					String details = portray.getDetail();
					String[] detNames = details.split(";")[1].split(",");
					for(String detName : detNames){
						field_custNormal += ","+ "SUM(" +detName+ ") " +detName;
				    }
				}
			}
		}			
		
		

		//曲线图        这里是对厅店的数据进行搜索查询相应的数据进行显示在页面。
		if(showType2.size()>0){				        			
			List<String> months = MyDateFormat.getMonthSblings(vo.getMonth(),6);
			vo.setMonths(months);
			//查询厅店的单品促销能力的sql
			List<Map<String,Object>> mapList = customerChannelMapper.getHallHallStoreBattleByMons(vo);
//			if(mapList==null || mapList.isEmpty()) {
//				return null;
//			}else {
			try{
				PortrayIntegration1.showType2(mapList,showType2,months,"month");
				}catch(Exception e){
				//异常处理
				}
			
			//}
		}
		
		if(showType6.size()>0 || showType5_ywst.size()>0){			
			List<String> months = new ArrayList<String>();
			months.add(vo.getMonth());
			vo.setMonths(months);
			List<Map<String,Object>> mapList = customerChannelMapper.getHallHallStoreBattleByMons(vo);
			//top图 和 异网渗透率 有做月份范围合计，所以应该单选一个月
			if(showType6.size()>0){
				PortrayIntegration.showType6(mapList,showType6);	
			}		
			if(showType5_ywst.size()>0){
				PortrayIntegration.showType5_ywst(mapList,showType5_ywst);	
			}
		}

		
		vo.setField(fieldFunc);
		Map<String,Object> map = customerChannelMapper.getHallHallStoreBattleByMon(vo);  
		//键值对、单值环形图
		if(showType1.size()>0){						
			PortrayIntegration.showType1(map,showType1);
		}
		
		//单值环形图
		if(showType3.size()>0){						
			PortrayIntegration.showType3(map,showType3);
		}

		//多值饼图
		if(showType5.size()>0){			
			PortrayIntegration.showType5(map,showType5);		
		}	
		
		//柱状图
		if(showType4.size()>0){
			PortrayIntegration.showType4(map,showType4);	
		}
		
		//
		vo.setField(field_custNormal);
		Map<String,Object> map_custNormal = hallIdentifyInfoMapper.getHallNormalFieldByMon(vo); 
		if(showType4_custNormal.size()>0){			
			PortrayIntegration.showType4(map_custNormal,showType4_custNormal);
		}
			
		return portrays;
	}
	
	@Override
	public List<CusChanPortray> listCusStoreBattleByIds(StoreBattleVo vo) {
		List<CusChanPortray> portrays = cusChanPortrayMapper.listCusStoreBattleByIds(vo.getIds());   
		
		List<CusChanPortray> showType1 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType2 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType3 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType4 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType5 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType5_ywst = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType6 = new ArrayList<CusChanPortray>();
		
		List<CusChanPortray> showType4_custNormal = new ArrayList<CusChanPortray>();
		
		String fieldFunc = "'"+vo.getStartMonth()+"-"+vo.getEndMonth()+"' month";
		String field_custNormal = "'"+vo.getStartMonth()+"-"+vo.getEndMonth()+"' stat_month";

		
		for(CusChanPortray portray : portrays){
			String tableName = portray.getTableName();
			if("zd_result_cust_portrait_new_m".equalsIgnoreCase(tableName)){
				Integer showType = portray.getShowType();
				if(showType==2){  //曲线图的sql: select *
					showType2.add(portray);					
				}
				else if(showType==6){
					showType6.add(portray);
				}				
				else if(showType==1){
					showType1.add(portray);	
					fieldFunc += ","+ "MAX("+portray.getName()+") "+portray.getName();
				}
				else if(showType==3){
					showType3.add(portray); 
					fieldFunc += ","+ "SUM("+portray.getName()+")/count(1) "+portray.getName();
				}
				else if(showType==5 && portray.getDetail().split(";").length<2){  //异网渗透率
					showType5_ywst.add(portray);					
				}
				else if(showType==5){
					showType5.add(portray);
					String details = portray.getDetail();
					String[] detNames = details.split(";")[1].split(",");
					for(String detName : detNames){
						fieldFunc += ","+ "SUM(" +detName+ ")/COUNT(1) " +detName;
				    }					
				}
				else if(showType==4){					
					String details = portray.getDetail();					
					if(StringUtil.isNotEmpty(details)){      //处理特殊柱状图  单点促销能力 
						String[] detNames = details.split(";")[1].split(",");
						for(String detName : detNames){
							fieldFunc += ","+ "SUM(" +detName+ ") " +detName;
					    }
						showType4.add(portray);
					}else{
						showType2.add(portray);
					}
				}
			}
			
			if("ZD_RESULT_CUSTOMER_NORMAL_M".equalsIgnoreCase(tableName)){
				Integer showType = portray.getShowType();
                if(showType==4){
					showType4_custNormal.add(portray);
					String details = portray.getDetail();
					String[] detNames = details.split(";")[1].split(",");
					for(String detName : detNames){
						field_custNormal += ","+ "SUM(" +detName+ ") " +detName;
				    }
				}
			}
		}			
		
		
		//曲线图
		if(showType2.size()>0){				        			
			List<String> months = MyDateFormat.getMonthSblings(vo.getMonth(),6);
			vo.setMonths(months);
			List<Map<String,Object>> mapList = customerChannelMapper.getCustomerFieldByMons(vo);
			PortrayIntegration1.showType2(mapList,showType2,months,"month");
		}
		
		if(showType6.size()>0 || showType5_ywst.size()>0){			
			List<String> months = new ArrayList<String>();
			months.add(vo.getMonth());
			vo.setMonths(months);
			List<Map<String,Object>> mapList = customerChannelMapper.getCustomerFieldByMons(vo);
			//top图 和 异网渗透率 有做月份范围合计，所以应该单选一个月
			if(showType6.size()>0){
				PortrayIntegration.showType6(mapList,showType6);	
			}		
			if(showType5_ywst.size()>0){
				PortrayIntegration.showType5_ywst(mapList,showType5_ywst);	
			}
		}
		
		vo.setField(fieldFunc);
		Map<String,Object> map = customerChannelMapper.getCustomerFieldByMon(vo);  
		//键值对、单值环形图
		if(showType1.size()>0){						
			PortrayIntegration.showType1(map,showType1);
		}
		
		//单值环形图
		if(showType3.size()>0){						
			PortrayIntegration.showType3(map,showType3);
		}

		//多值饼图
		if(showType5.size()>0){			
			PortrayIntegration.showType5(map,showType5);		
		}	
		
		//柱状图
		if(showType4.size()>0){
			PortrayIntegration.showType4(map,showType4);	
		}
		
		//
		vo.setField(field_custNormal);
		Map<String,Object> map_custNormal = customerIdentifyInfoMapper.getCustNormalFieldByMon(vo); 
		if(showType4_custNormal.size()>0){			
			PortrayIntegration.showType4(map_custNormal,showType4_custNormal);
		}
			
		return portrays;
	}
	@Override
	public List<StoreBattleVo> listOtherHalls(StoreBattleVo vo) {
		return customerChannelMapper.listOtherHalls(vo);
	}
	@Override
	public List<String> listAllHall(ZdHallTshop vo) {
		// TODO Auto-generated method stub
		return customerChannelMapper.listAllHall(vo);
	}
	@Override
	public List<StoreBattleVo> listAllHallNew(StoreBattleVo vo) {
		// TODO Auto-generated method stub
		return customerChannelMapper.listAllHallNew(vo);
	}
	@Override
	public List<CusChanPortray> listHallPortray(StoreBattleVo vo) {
        List<CusChanPortray> portrays = cusChanPortrayMapper.listHallByIds(vo.getIds());   
		
		List<CusChanPortray> showType1 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType2 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType3 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType4 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType5 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType5_ywst = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType6 = new ArrayList<CusChanPortray>();
		
		List<CusChanPortray> showType4_custNormal = new ArrayList<CusChanPortray>();
		
		String fieldFunc = "'"+vo.getStartMonth()+"-"+vo.getEndMonth()+"' month";
		String field_custNormal = "'"+vo.getStartMonth()+"-"+vo.getEndMonth()+"' stat_month";

		
		for(CusChanPortray portray : portrays){
			String tableName = portray.getTableName();
			if("zd_result_hall_portrait_new_m".equalsIgnoreCase(tableName)){
				Integer showType = portray.getShowType();
				if(showType==2){  //曲线图的sql: select *
					showType2.add(portray);					
				}
				else if(showType==6){
					showType6.add(portray);
				}				
				else if(showType==1){
					showType1.add(portray);	
					fieldFunc += ","+ "MAX("+portray.getName()+") "+portray.getName();
				}
				else if(showType==3){
					showType3.add(portray); 
					fieldFunc += ","+ "SUM("+portray.getName()+")/count(1) "+portray.getName();
				}
				else if(showType==5 && portray.getDetail().split(";").length<2){  //异网渗透率
					showType5_ywst.add(portray);					
				}
				else if(showType==5){
					showType5.add(portray);
					String details = portray.getDetail();
					String[] detNames = details.split(";")[1].split(",");
					for(String detName : detNames){
						fieldFunc += ","+ "SUM(" +detName+ ")/COUNT(1) " +detName;
				    }					
				}
				else if(showType==4){					
					String details = portray.getDetail();					
					if(StringUtil.isNotEmpty(details)){      //处理特殊柱状图  单点促销能力 
						String[] detNames = details.split(";")[1].split(",");
						for(String detName : detNames){
							fieldFunc += ","+ "SUM(" +detName+ ") " +detName;
					    }
						showType4.add(portray);
					}else{
						showType2.add(portray);
					}
				}
			}
			
			if("ZD_RESULT_HALL_NORMAL_M".equalsIgnoreCase(tableName)){
				Integer showType = portray.getShowType();
                if(showType==4){
					showType4_custNormal.add(portray);
					String details = portray.getDetail();
					String[] detNames = details.split(";")[1].split(",");
					for(String detName : detNames){
 						field_custNormal += ","+ "SUM(" +detName+ ") " +detName;
				    }
				}
			}
		}			
		
		
		List<String> months = MyDateFormat.getMonthBetween(vo.getStartMonth(),vo.getEndMonth());
		vo.setMonths(months);
		List<Map<String,Object>> mapList = customerChannelMapper.getHallFieldByMons(vo);
		//曲线图
		if(showType2.size()>0){				        
			PortrayIntegration.showType2(mapList,showType2,months,"month");
		}
		
		//top图
		if(showType6.size()>0){
			PortrayIntegration.showType6(mapList,showType6);	
		}
		
		if(showType5_ywst.size()>0){
			PortrayIntegration.showType5_ywst(mapList,showType5_ywst);	
		}
		
		vo.setField(fieldFunc);
		//单独处理全省的。。。。。。。。。。。。。。。。。。。
		if(vo.getTag1().equals("")){
			                                               
			Map<String,Object> map = customerChannelMapper.getHallFieldByMonQuanshen(vo);  	
			if(showType1.size()>0){						
				PortrayIntegration.showType1(map,showType1);
			}
			
			//环形图
			if(showType3.size()>0){						
				PortrayIntegration.showType3(map,showType3);
			}

			//多值饼图
			if(showType5.size()>0){			
				PortrayIntegration.showType5(map,showType5);		
			}	
			
			//柱状图
			if(showType4.size()>0){
				PortrayIntegration.showType4(map,showType4);	
			}
		}else{
		Map<String,Object> map = customerChannelMapper.getHallFieldByMon(vo);  
		//键值对、单值环形图
		if(showType1.size()>0){						
			PortrayIntegration.showType1(map,showType1);
		}
		
		//环形图
		if(showType3.size()>0){						
			PortrayIntegration.showType3(map,showType3);
		}

		//多值饼图
		if(showType5.size()>0){			
			PortrayIntegration.showType5(map,showType5);		
		}	
		
		//柱状图
		if(showType4.size()>0){
			PortrayIntegration.showType4(map,showType4);	
		}
		}
		//
		vo.setField(field_custNormal);
		List<String> list = new ArrayList<String>();//创建集合对象；
		list.add("全省");
		list.add("广州");
		list.add("清远");
		list.add("肇庆");
		list.add("韶关");
		list.add("云浮");
		list.add("佛山");
		list.add("江门");
		list.add("茂名");
		list.add("阳江");
		list.add("湛江");
		list.add("深圳");
		list.add("汕头");
		list.add("梅州");
		list.add("汕尾");
		list.add("揭阳");
		list.add("潮州");
		list.add("东莞");
		list.add("惠州");
		list.add("珠海");
		list.add("中山");
		list.add("河源");
		for (String string : list) {
		if(vo.getCusOrgacode()!=null && vo.getCusOrgacode().equals(string) && !vo.getCusOrgacode().equals("全省")) {
		//执行数据	
			Map<String,Object> map_custNormal = customerChangeWHMapper.HallChangeAll(vo);
			
			
			if(showType4_custNormal.size()>0){			
				PortrayIntegration.showType4(map_custNormal,showType4_custNormal);
			}
				
			return portrays;
			
		} else if(vo.getCusOrgacode()!=null && vo.getCusOrgacode().equals("全省")) {
			
            Map<String,Object> map_custNormal = customerChangeWHMapper.hallChangeAll11(vo);
			
			if(showType4_custNormal.size()>0){			
				PortrayIntegration.showType4(map_custNormal,showType4_custNormal);
			}
				
			return portrays;
			
		}
			
			
		}
		
		
		Map<String,Object> map_custNormal = customerIdentifyInfoMapper.getHallNormalFieldByMon(vo); 
		if(showType4_custNormal.size()>0){			
			PortrayIntegration.showType4(map_custNormal,showType4_custNormal);
		}
			
		return portrays;
	}
	@Override
	public List<StoreBattleVo> vagueQuery1(StoreBattleVo vo) {
		// TODO Auto-generated method stub
		return customerChannelMapper.vagueQuery1(vo);
	}
	@Override
	public List<SevenPort> sevenListAllCustomer(SevenPort vo) {
		// TODO Auto-generated method stub
		return customerChannelMapper.sevenListAllCustomer(vo);
	}
	@Override
	public List<SevenPort> hallListPort(SevenPort vo) {
		// TODO Auto-generated method stub
		return customerChannelMapper.hallListPort(vo);
	}
	
	
	//---------------------------------------------------------------------------全部-------------------------
	@Override
	public List<CusChanPortray> listCustmerPortray1(StoreBattleVo vo) {
		// TODO Auto-generated method stub
        List<CusChanPortray> portrays = cusChanPortrayMapper.listCustomerByIds(vo.getIds());   
		
		List<CusChanPortray> showType1 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType2 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType3 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType4 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType5 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType5_ywst = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType6 = new ArrayList<CusChanPortray>();
		
		List<CusChanPortray> showType4_custNormal = new ArrayList<CusChanPortray>();
		
		String fieldFunc = "'"+vo.getStartMonth()+"-"+vo.getEndMonth()+"' month";
		String field_custNormal = "'"+vo.getStartMonth()+"-"+vo.getEndMonth()+"' stat_month";

		
		for(CusChanPortray portray : portrays){
			String tableName = portray.getTableName();
			if("zd_result_cust_portrait_new_m".equalsIgnoreCase(tableName)){
				Integer showType = portray.getShowType();
				if(showType==2){  //曲线图的sql: select *
					showType2.add(portray);					
				}
				else if(showType==6){
					showType6.add(portray);
				}				
				else if(showType==1){
					showType1.add(portray);	
					fieldFunc += ","+ "MAX("+portray.getName()+") "+portray.getName();
				}
				else if(showType==3){
					showType3.add(portray); 
					fieldFunc += ","+ "SUM("+portray.getName()+")/count(1) "+portray.getName();
				}
				else if(showType==5 && portray.getDetail().split(";").length<2){  //异网渗透率
					showType5_ywst.add(portray);					
				}
				else if(showType==5){
					showType5.add(portray);
					String details = portray.getDetail();
					String[] detNames = details.split(";")[1].split(",");
					for(String detName : detNames){
						fieldFunc += ","+ "SUM(" +detName+ ")/COUNT(1) " +detName;
				    }					
				}
				else if(showType==4){					
					String details = portray.getDetail();					
					if(StringUtil.isNotEmpty(details)){      //处理特殊柱状图  单点促销能力 
						String[] detNames = details.split(";")[1].split(",");
						for(String detName : detNames){
							fieldFunc += ","+ "SUM(" +detName+ ") " +detName;
					    }
						showType4.add(portray);
					}else{
						showType2.add(portray);
					}
				}
			}
			
			if("ZD_RESULT_CUSTOMER_NORMAL_M".equalsIgnoreCase(tableName)){
				Integer showType = portray.getShowType();
                if(showType==4){
					showType4_custNormal.add(portray);
					String details = portray.getDetail();
					String[] detNames = details.split(";")[1].split(",");
					for(String detName : detNames){
 						field_custNormal += ","+ "SUM(" +detName+ ") " +detName;
				    }
				}
			}
		}			
		
		
		List<String> months = MyDateFormat.getMonthBetween(vo.getStartMonth(),vo.getEndMonth());
		vo.setMonths(months);
		List<Map<String,Object>> mapList = customerChannelMapper.getCustomerFieldByMonsAll(vo);
		//曲线图
		if(showType2.size()>0){				        
			PortrayIntegration.showType2(mapList,showType2,months,"month");
		}
		
		//top图
		if(showType6.size()>0){
			PortrayIntegration.showType6(mapList,showType6);	
		}
		
		if(showType5_ywst.size()>0){
			PortrayIntegration.showType5_ywst(mapList,showType5_ywst);	
		}
		
		vo.setField(fieldFunc);
		List<Object> oragcodes =vo.getOragcodes();
		String object =(String)oragcodes.get(0);
		vo.setCusOrgacode(object);
		vo.setField(fieldFunc);
		
		Map<String,Object> map = customerChannelMapper.getCustomerFieldByMon2(vo);  
		//键值对、单值环形图
		if(showType1.size()>0){						
			PortrayIntegration.showType1(map,showType1);
		}
		
		//环形图
		if(showType3.size()>0){						
			PortrayIntegration.showType3(map,showType3);
		}

		//多值饼图
		if(showType5.size()>0){			
			PortrayIntegration.showType5(map,showType5);		
		}	
		
		//柱状图
		if(showType4.size()>0){
			PortrayIntegration.showType4(map,showType4);	
		}
		
		//
		vo.setField(field_custNormal);
		List<String> list = new ArrayList<String>();//创建集合对象；
		list.add("全省");
		list.add("广州");
		list.add("清远");
		list.add("肇庆");
		list.add("韶关");
		list.add("云浮");
		list.add("佛山");
		list.add("江门");
		list.add("茂名");
		list.add("阳江");
		list.add("湛江");
		list.add("深圳");
		list.add("汕头");
		list.add("梅州");
		list.add("汕尾");
		list.add("揭阳");
		list.add("潮州");
		list.add("东莞");
		list.add("惠州");
		list.add("珠海");
		list.add("中山");
		list.add("河源");
		for (String string : list) {
		if(vo.getCusOrgacode()!=null && vo.getCusOrgacode().equals(string) && !vo.getCusOrgacode().equals("全省")) {
		//执行数据	
			Map<String,Object> map_custNormal = customerChangeWHMapper.customerChangeAll(vo);
			
			if(showType4_custNormal.size()>0){			
				PortrayIntegration.showType4(map_custNormal,showType4_custNormal);
			}
				
			return portrays;
			
		} else if(vo.getCusOrgacode()!=null && vo.getCusOrgacode().equals("全省")) {
			
            Map<String,Object> map_custNormal = customerChangeWHMapper.customerChangeAll11(vo);
			
			if(showType4_custNormal.size()>0){			
				PortrayIntegration.showType4(map_custNormal,showType4_custNormal);
			}
				
			return portrays;
			
		}
			
			
		}
		
		
		Map<String,Object> map_custNormal = customerIdentifyInfoMapper.getCustNormalFieldByMon(vo); 
		if(showType4_custNormal.size()>0){			
			PortrayIntegration.showType4(map_custNormal,showType4_custNormal);
		}
			
		return portrays;
	}
	@Override
	public List<CusChanPortray> listHallPortray1(StoreBattleVo vo) {
List<CusChanPortray> portrays = cusChanPortrayMapper.listHallByIds(vo.getIds());   
		
		List<CusChanPortray> showType1 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType2 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType3 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType4 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType5 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType5_ywst = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType6 = new ArrayList<CusChanPortray>();
		
		List<CusChanPortray> showType4_custNormal = new ArrayList<CusChanPortray>();
		
		String fieldFunc = "'"+vo.getStartMonth()+"-"+vo.getEndMonth()+"' month";
		String field_custNormal = "'"+vo.getStartMonth()+"-"+vo.getEndMonth()+"' stat_month";

		
		for(CusChanPortray portray : portrays){
			String tableName = portray.getTableName();
			if("zd_result_hall_portrait_new_m".equalsIgnoreCase(tableName)){
				Integer showType = portray.getShowType();
				if(showType==2){  //曲线图的sql: select *
					showType2.add(portray);					
				}
				else if(showType==6){
					showType6.add(portray);
				}				
				else if(showType==1){
					showType1.add(portray);	
					fieldFunc += ","+ "MAX("+portray.getName()+") "+portray.getName();
				}
				else if(showType==3){
					showType3.add(portray); 
					fieldFunc += ","+ "SUM("+portray.getName()+")/count(1) "+portray.getName();
				}
				else if(showType==5 && portray.getDetail().split(";").length<2){  //异网渗透率
					showType5_ywst.add(portray);					
				}
				else if(showType==5){
					showType5.add(portray);
					String details = portray.getDetail();
					String[] detNames = details.split(";")[1].split(",");
					for(String detName : detNames){
						fieldFunc += ","+ "SUM(" +detName+ ")/COUNT(1) " +detName;
				    }					
				}
				else if(showType==4){					
					String details = portray.getDetail();					
					if(StringUtil.isNotEmpty(details)){      //处理特殊柱状图  单点促销能力 
						String[] detNames = details.split(";")[1].split(",");
						for(String detName : detNames){
							fieldFunc += ","+ "SUM(" +detName+ ") " +detName;
					    }
						showType4.add(portray);
					}else{
						showType2.add(portray);
					}
				}
			}
			
			if("ZD_RESULT_HALL_NORMAL_M".equalsIgnoreCase(tableName)){
				Integer showType = portray.getShowType();
                if(showType==4){
					showType4_custNormal.add(portray);
					String details = portray.getDetail();
					String[] detNames = details.split(";")[1].split(",");
					for(String detName : detNames){
 						field_custNormal += ","+ "SUM(" +detName+ ") " +detName;
				    }
				}
			}
		}			
		
		
		List<String> months = MyDateFormat.getMonthBetween(vo.getStartMonth(),vo.getEndMonth());
		vo.setMonths(months);
		List<Map<String,Object>> mapList = customerChannelMapper.getHallFieldByMons1(vo);
		//曲线图
		if(showType2.size()>0){				        
			PortrayIntegration.showType2(mapList,showType2,months,"month");
		}
		
		//top图
		if(showType6.size()>0){
			PortrayIntegration.showType6(mapList,showType6);	
		}
		
		if(showType5_ywst.size()>0){
			PortrayIntegration.showType5_ywst(mapList,showType5_ywst);	
		}
		List<Object> oragcodes =vo.getOragcodes();
		String object =(String)oragcodes.get(0);
		vo.setCusOrgacode(object);
		vo.setField(fieldFunc);
		//针对全省做出的调整
		if(vo.getTag1().equals("")){
			Map<String,Object> map = customerChannelMapper.getHallFieldByMonQuanshen(vo);	
			if(showType1.size()>0){						
				PortrayIntegration.showType1(map,showType1);
			}
			
			//环形图
			if(showType3.size()>0){						
				PortrayIntegration.showType3(map,showType3);
			}

			//多值饼图
			if(showType5.size()>0){			
				PortrayIntegration.showType5(map,showType5);		
			}	
			
			//柱状图
			if(showType4.size()>0){
				PortrayIntegration.showType4(map,showType4);	
			}
		}else{
		Map<String,Object> map = customerChannelMapper.getHallFieldByMon(vo); 
		
		//键值对、单值环形图
		if(showType1.size()>0){						
			PortrayIntegration.showType1(map,showType1);
		}
		
		//环形图
		if(showType3.size()>0){						
			PortrayIntegration.showType3(map,showType3);
		}

		//多值饼图
		if(showType5.size()>0){			
			PortrayIntegration.showType5(map,showType5);		
		}	
		
		//柱状图
		if(showType4.size()>0){
			PortrayIntegration.showType4(map,showType4);	
		}
		}
		//
		vo.setField(field_custNormal);
		List<String> list = new ArrayList<String>();//创建集合对象；
		list.add("全省");
		list.add("广州");
		list.add("清远");
		list.add("肇庆");
		list.add("韶关");
		list.add("云浮");
		list.add("佛山");
		list.add("江门");
		list.add("茂名");
		list.add("阳江");
		list.add("湛江");
		list.add("深圳");
		list.add("汕头");
		list.add("梅州");
		list.add("汕尾");
		list.add("揭阳");
		list.add("潮州");
		list.add("东莞");
		list.add("惠州");
		list.add("珠海");
		list.add("中山");
		list.add("河源");
		for (String string : list) {
		if(vo.getCusOrgacode()!=null && vo.getCusOrgacode().equals(string) && !vo.getCusOrgacode().equals("全省")) {
		//执行数据	
			Map<String,Object> map_custNormal = customerChangeWHMapper.HallChangeAll(vo);
			
			if(showType4_custNormal.size()>0){			
				PortrayIntegration.showType4(map_custNormal,showType4_custNormal);
			}
				
			return portrays;
			
		} else if(vo.getCusOrgacode()!=null && vo.getCusOrgacode().equals("全省")) {
			
            Map<String,Object> map_custNormal = customerChangeWHMapper.hallChangeAll11(vo);
			
			if(showType4_custNormal.size()>0){			
				PortrayIntegration.showType4(map_custNormal,showType4_custNormal);
			}
				
			return portrays;
			
		}
			
			
		}
		
		
		Map<String,Object> map_custNormal = customerIdentifyInfoMapper.getHallNormalFieldByMon(vo); 
		if(showType4_custNormal.size()>0){			
			PortrayIntegration.showType4(map_custNormal,showType4_custNormal);
		}
			
		return portrays;
	}
	@Override
	public List<StoreBattleVo> listAllCustomerNull(StoreBattleVo vo) {
		// TODO Auto-generated method stub
		return customerChannelMapper.listAllCustomerNull(vo);
	}
	


}

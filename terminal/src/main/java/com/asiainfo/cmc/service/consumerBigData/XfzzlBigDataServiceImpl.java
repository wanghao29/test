package com.asiainfo.cmc.service.consumerBigData;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asiainfo.cmc.enties.consumerBigData.ConsumerBigData;
import com.asiainfo.cmc.enties.consumerBigData.XfzzlBigData;
import com.asiainfo.cmc.mapper.consumerBigData.XfzzlBigDataMapper;
import com.asiainfo.cmc.qudao.enties.CusChanPortray;
import com.asiainfo.cmc.qudao.mapper.CusChanPortrayMapper;
import com.asiainfo.cmc.qudao.utils.PortrayIntegration;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class XfzzlBigDataServiceImpl implements XfzzlBigDataService{
	
	@Autowired
	private XfzzlBigDataMapper xfzzlBigDataMapper;
	@Autowired
	private CusChanPortrayMapper cusChanPortrayMapper;

	public boolean ChkTableNotExist(XfzzlBigData xfzzlBigData) {
		String tableN;
		if(xfzzlBigData.getTableName()==null){
			xfzzlBigData.setTableName("xfz");
		}
		switch(xfzzlBigData.getTableName()){
		case "zdtz":
			tableN="ZD_RESULT_CONSUMER_ZL_ZDTZ_";break;
		case "jlfx":
			tableN="ZD_RESULT_CONSUMER_ZL_XFZ_JLFX_";break;
		default :
			tableN="ZD_RESULT_CONSUMER_ZL_XFZ_";break;
		}
		String tableName = tableN + xfzzlBigData.getStatMo();
		xfzzlBigData.setTableName(tableName);		
		int tableExist = xfzzlBigDataMapper.tableExist(xfzzlBigData);
		if(tableExist>0){
			return false;
		}
		return true;
	}

	@Override
	public List<XfzzlBigData> listCntys(XfzzlBigData xfzzlBigData) {
		if(this.ChkTableNotExist(xfzzlBigData)){
			return new ArrayList<XfzzlBigData>();
		}
		return xfzzlBigDataMapper.listCntys(xfzzlBigData);
	}

	@Override
	public  PageInfo<XfzzlBigData> listCurBrands(XfzzlBigData xfzzlBigData) {
/*		if(this.ChkTableNotExist(xfzzlBigData)){
			return new ArrayList<XfzzlBigData>();
		}*/
		
		List<XfzzlBigData> outList = new ArrayList<XfzzlBigData>();
		PageHelper.startPage(Integer.valueOf(1), Integer.valueOf(10));
		outList = xfzzlBigDataMapper.listCurBrands(xfzzlBigData);
		 PageInfo<XfzzlBigData> pageInfo = new PageInfo<>(outList);
		return pageInfo ;
	}

	@Override
	public PageInfo<XfzzlBigData> listCurSpecs(XfzzlBigData xfzzlBigData) {
	/*	if(this.ChkTableNotExist(xfzzlBigData)){
			return new ArrayList<XfzzlBigData>();
		}*/
		List<XfzzlBigData> outList = new ArrayList<XfzzlBigData>();
		PageHelper.startPage(Integer.valueOf(1), Integer.valueOf(10));
		outList = xfzzlBigDataMapper.listCurSpecs(xfzzlBigData);
		 PageInfo<XfzzlBigData> pageInfo = new PageInfo<>(outList);
		
		return pageInfo;//xfzzlBigDataMapper.listCurSpecs(xfzzlBigData);
	}
	
	
	/*
	 * 消费者特征
	 */
	
	@Override
	public HashMap<String, Object> getTxyhAndZxtxyh(XfzzlBigData vo) {
		if(this.ChkTableNotExist(vo)){
			return new HashMap<String,Object>();
		}
		 HashMap<String, Object> txyhAndZxtxyh = xfzzlBigDataMapper.getTxyhAndZxtxyh(vo);
		 String ZDTXYH  = DecimalFormat.getNumberInstance().format(txyhAndZxtxyh.get("ZDTXYH"));
		 String TXYH = DecimalFormat.getNumberInstance().format(txyhAndZxtxyh.get("TXYH"));
		 String ZWTCYHS = DecimalFormat.getNumberInstance().format(txyhAndZxtxyh.get("ZWTCYHS"));
		 
		 txyhAndZxtxyh.put("ZDTXYH", ZDTXYH);
		 txyhAndZxtxyh.put("TXYH", TXYH);
		 txyhAndZxtxyh.put("ZWTCYHS", ZWTCYHS);
		 
		 return txyhAndZxtxyh;
	}	

	@Override
	public List<CusChanPortray> listPortray(XfzzlBigData vo) {
		List<CusChanPortray> portrays = cusChanPortrayMapper.listXfzzlBigData(vo.getIds());
		if(vo.getIds()==null || vo.getIds().size()==0){
			return portrays;
		}else{
			if(this.ChkTableNotExist(vo)){
				return portrays;
			}else{
				vo.setTableName("ZD_RESULT_CONSUMER_ZL_XFZ_" + vo.getStatMo());
			}
		}
		
		List<CusChanPortray> showType4 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType5 = new ArrayList<CusChanPortray>();		
		String fieldFunc = "STAT_MO";		
		for(CusChanPortray portray : portrays){
			//top特殊处理
			String name = portray.getName();
			if("CMCC_BRANCH_CD_SCATTER".equals(name)){
				//vo.setTableName("ZD_RESULT_CONSUMER_ZL_ZDTZ_" + vo.getStatMo());  //维护时修改表名前缀为 ZD_RESULT_CONSUMER_ZL_XFZ_ 
				vo.setTableName("ZD_RESULT_CONSUMER_ZL_XFZ_" + vo.getStatMo());
				List<Map<String, Object>> top = xfzzlBigDataMapper.getXfzzlBigDataCityScatter(vo);
				String detail = "";
				String value = "";
				for(Map<String, Object> map : top){
					detail += String.valueOf(map.get("CMCC_CTY_NAM")) +",";
					value += String.valueOf(map.get("COUNT_NUM")) +",";
				}
				detail = detail.substring(0, detail.length()-1);
				value = value.substring(0, value.length()-1);
				portray.setDetail(detail);
				portray.setValue(value);
				continue;
			}
			
			if("BRND_CD_SCATTER".equals(name)){
				//vo.setTableName("ZD_RESULT_CONSUMER_ZL_ZDTZ_" + vo.getStatMo());  //维护时修改表名前缀为 ZD_RESULT_CONSUMER_ZL_XFZ_ 
				vo.setTableName("ZD_RESULT_CONSUMER_ZL_XFZ_" + vo.getStatMo());
				List<Map<String, Object>> top = xfzzlBigDataMapper.getXfzzlBigDataBrndCdScatter(vo);
				if(top==null || top.size()==0){
					continue;
				}
				
				String detail = "";
				String value = "";
				for(Map<String, Object> map : top){
					detail += String.valueOf(map.get("BRND_CD")) +",";
					value += String.valueOf(map.get("COUNT_NUM")) +",";
				}
				detail = detail.substring(0, detail.length()-1);
				value = value.substring(0, value.length()-1);
				portray.setDetail(detail);
				portray.setValue(value);
				continue;
			}
			
			Integer showType = portray.getShowType();
			if(showType==5){
				showType5.add(portray);
				String details = portray.getDetail();
				String[] detNames = details.split(";")[1].split(",");
				for(String detName : detNames){
					fieldFunc += ","+ "SUM(" +detName+ ") " +detName;
			    }					
			}
			else if(showType==4){	
				showType4.add(portray);
				String details = portray.getDetail();					
				String[] detNames = details.split(";")[1].split(",");
				for(String detName : detNames){
					fieldFunc += ","+ "SUM(" +detName+ ") " +detName;
			    }
				
			}
		}	

		if(showType4.size()==0 && showType5.size()==0){
			return portrays;
		}
		
		vo.setField(fieldFunc);
		Map<String,Object> map = xfzzlBigDataMapper.getXfzzlBigData(vo);  	
		//多值饼图
		if(showType5.size()>0){			
			PortrayIntegration.showType5(map,showType5);		
		}			
		//柱状图
		if(showType4.size()>0){
			PortrayIntegration.showType4(map,showType4);	
		}
			
		return portrays;
	}
	
	
	
	/*
	 * 终端特征
	 */
		
	@Override
	public HashMap<String, Object> getZwzdAndXrwzd(XfzzlBigData vo) {
		//构建表名，并判断表是否存在
		String tableNameVo = "ZD_RESULT_CONSUMER_ZL_ZDTZ_" + vo.getStatMo();
		
		String wlwtableName = "ZD_RESULT_IOT_CNT_" + vo.getStatMo();
		
		vo.setTableName(tableNameVo);		
		int tableExist = xfzzlBigDataMapper.tableExist(vo);
		if(tableExist<1){
			return new HashMap<String,Object>();
		}
		HashMap<String, Object> resultMap = xfzzlBigDataMapper.getZwzdAndXrwzd(vo);
		
		//千分位数
		String   ZWZD	= DecimalFormat.getNumberInstance().format(resultMap.get("ZWZD"));
		String   XRWZD	= DecimalFormat.getNumberInstance().format(resultMap.get("XRWZD"));
		resultMap.put("ZWZD", ZWZD);
		resultMap.put("XRWZD", XRWZD);
		
		
	   HashMap<String, Object> resultJL_HJZQ = xfzzlBigDataMapper.getAvg_JL_HJZQ(vo);
		
		//千分位数
		String   PJJL	= DecimalFormat.getNumberInstance().format(resultJL_HJZQ.get("PJJL"));
		String   PJHJZQ	= DecimalFormat.getNumberInstance().format(resultJL_HJZQ.get("PJHJZQ"));
		resultMap.put("ZWSJZDPJJL", PJJL);
		resultMap.put("ZWSJZDPJHJZQ", PJHJZQ);
		
		
		
		vo.setTableName(wlwtableName);		
		int wlwtableExist = xfzzlBigDataMapper.tableExist(vo);
		if(wlwtableExist<1){
			resultMap.put("ZWWLWZD", "0");
			resultMap.put("XRWWLWZD", "0");
		}else {
			HashMap<String, Object> wlwMap = xfzzlBigDataMapper.getZwwlwzdAndXrwwlwzd(vo);
			
			//千分位数
			String   ZWWLWZD	= DecimalFormat.getNumberInstance().format(wlwMap.get("ZWWLWZD"));
			String   XRWWLWZD	= DecimalFormat.getNumberInstance().format(wlwMap.get("XRWWLWZD"));
			wlwMap.put("ZWWLWZD", ZWWLWZD);
			wlwMap.put("XRWWLWZD", XRWWLWZD);
			resultMap.putAll(wlwMap);
		}

		return resultMap;
	}

	@Override
	public HashMap<String, Object> getJlfxList(XfzzlBigData vo) {
		//构建表名，并判断表是否存在
		String tableNameVo = "ZD_RESULT_CONSUMER_ZL_XFZ_JLFX_" + vo.getStatMo();
		vo.setTableName(tableNameVo);		
		int tableExist = xfzzlBigDataMapper.tableExist(vo);
		if(tableExist<1){
			return new HashMap<String,Object>();
		}
		return xfzzlBigDataMapper.getJlfxList(vo);
	}
	
	
	
	@Override
	public List<CusChanPortray> listPortrayZdtz(XfzzlBigData vo) {
		List<CusChanPortray> portrays = cusChanPortrayMapper.listZdtzzlBigData(vo.getIds());
		
		//构建表名，并判断表是否存在
		String tableNameVo = "ZD_RESULT_CONSUMER_ZL_ZDTZ_" + vo.getStatMo();
		vo.setTableName(tableNameVo);		
		int tableExist = xfzzlBigDataMapper.tableExist(vo);
		if(vo.getIds()==null || vo.getIds().size()==0){
			return portrays;
		}else{
			if(tableExist<1 ){
				return portrays;
			}
		}
		
		List<CusChanPortray> showType4 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType5 = new ArrayList<CusChanPortray>();		
		String fieldFunc = "STAT_MO";
		
		for(CusChanPortray portray : portrays){
			
			
			String name = portray.getName();
			//CMCC_CTY_NAM
			if("CMCC_CTY_NAM_ZDTZ".equals(name)){
				List<Map<String, Object>> top = xfzzlBigDataMapper.getZdtzzlBigDataByCity(vo);
				if(top==null || top.size()==0){
					continue;
				}
				String detail = "";
				String countNum = "";
				for(Map<String, Object> map : top){
					detail += String.valueOf(map.get("CMCC_CTY_NAM")) +",";
					countNum += String.valueOf(map.get("COUNT_NUM")) +",";
				}
				detail = detail.substring(0, detail.length()-1);
				countNum = countNum.substring(0,countNum.length()-1);
				portray.setDetail( detail);
				portray.setValue(countNum);
				continue;
			}
			
			//top特殊处理
			if("CM_BRAND_TOP10".equals(name)){
				List<Map<String, Object>> top = xfzzlBigDataMapper.getZdtzzlBigDataBrandTop10(vo);
				if(top==null || top.size()==0){
					continue;
				}
				String detail = "";
				String countNum = "";
				for(Map<String, Object> map : top){
					detail += String.valueOf(map.get("CM_BRAND")) +",";
					countNum += String.valueOf(map.get("COUNT_NUM")) +",";
				}
				detail = detail.substring(0, detail.length()-1);
				countNum = countNum.substring(0,countNum.length()-1);
				portray.setDetail("存量,新增"+";"+detail);
				portray.setValue(countNum);
				continue;
			}
			if("CM_TER_TYPE_TOP20".equals(name)){
				List<Map<String, Object>> top = xfzzlBigDataMapper.getZdtzzlBigDataSpecTop20(vo);
				if(top==null || top.size()==0){
					continue;
				}
				String detail = "";
				String countNum = "";
				for(Map<String, Object> map : top){
					detail += String.valueOf(map.get("CM_TER_TYPE")) +",";
					countNum += String.valueOf(map.get("COUNT_NUM")) +",";
				}
				detail = detail.substring(0, detail.length()-1);
				countNum =countNum.substring(0, countNum.length()-1);
				portray.setDetail("存量"+";"+detail);
				portray.setValue(countNum);
				continue;				
			}
			if("CM_BRAND_TOP10_xz".equals(name)){
				List<Map<String, Object>> top = xfzzlBigDataMapper.getZdtzzlBigDataBrandTop10_xz(vo);
				if(top==null || top.size()==0){
					continue;
				}
				String detail = "";
				String num = "";
				for(Map<String, Object> map : top){
					detail += String.valueOf(map.get("CM_BRAND")) +",";
					num += String.valueOf(map.get("NUM")) +",";
				}
				detail = detail.substring(0, detail.length()-1);
				num = num.substring(0,num.length()-1);
				portray.setDetail("新增"+";"+detail);
				portray.setValue(num);
				continue;
			}
			if("CM_TER_TYPE_TOP20_xz".equals(name)){
				List<Map<String, Object>> top = xfzzlBigDataMapper.getZdtzzlBigDataSpecTop20_xz(vo);
				if(top==null || top.size()==0){
					continue;
				}
				String detail = "";
				String num = "";
				for(Map<String, Object> map : top){
					detail += String.valueOf(map.get("CM_TER_TYPE")) +",";
					num += String.valueOf(map.get("NUM")) +",";
				}
				detail = detail.substring(0, detail.length()-1);
				num = num.substring(0,num.length()-1);
				portray.setDetail("新增"+";"+detail);
				portray.setValue(num);
				continue;				
			}
			
			Integer showType = portray.getShowType();
			if(showType==5){
				showType5.add(portray);
				String details = portray.getDetail();
				String[] detNames = details.split(";")[1].split(",");
				for(String detName : detNames){
					fieldFunc += ","+ "SUM(" +detName+ ") " +detName;
			    }					
			}
			else if(showType==4){	
				showType4.add(portray);
				String details = portray.getDetail();					
				String[] detNames = details.split(";")[1].split(",");
				for(String detName : detNames){
					fieldFunc += ","+ "SUM(" +detName+ ") " +detName;
			    }
				
			}
		}			
		
		if(showType4.size()==0 && showType5.size()==0){
			return portrays;
		}
		
		vo.setField(fieldFunc);
		Map<String,Object> map = xfzzlBigDataMapper.getXfzzlBigData(vo);  
		//多值饼图
		if(showType5.size()>0){			
			PortrayIntegration.showType5(map,showType5);		
		}			
		//柱状图
		if(showType4.size()>0){
			PortrayIntegration.showType4(map,showType4);	
		}
			
		return portrays;
	}

	@Override
	public List<CusChanPortray> listPortrayJlfx(XfzzlBigData vo) {
		List<CusChanPortray> portrays = cusChanPortrayMapper.listJlfxBigData(vo.getIds());
		
		//构建表名，并判断表是否存在
		String tableNameVo = "ZD_RESULT_CONSUMER_ZL_XFZ_JLFX_" + vo.getStatMo();
		vo.setTableName(tableNameVo);		
		int tableExist = xfzzlBigDataMapper.tableExist(vo);
		if(vo.getIds()==null || vo.getIds().size()==0){
			return portrays;
		}else{
			if(tableExist<1 ){
				return portrays;
			}
		}
		
		//机龄为多选数据的先处理
				StringBuffer sb = new StringBuffer();
				String jiAgeRak = vo.getJiAgeRak();		//'[3-6)月,[6-12)月'-------'[3-6)月','[6-12)月'
				if(jiAgeRak != null && jiAgeRak != ""){
					//分割为数组
					String [] jAR = jiAgeRak.split(",");
					
					sb.append("'"+jAR[0]+"'");	
					
					//循环  取数 拼接为所需字符串
					for (int i = 1; i < jAR.length; i++) {
						sb.append(",'"+jAR[i]+"'");
					}
					vo.setJiAgeRak(sb.toString());
				}
		
		List<CusChanPortray> showType4 = new ArrayList<CusChanPortray>();
		List<CusChanPortray> showType5 = new ArrayList<CusChanPortray>();		
		String fieldFunc = "STAT_MO";
		
		for(CusChanPortray portray : portrays){
			
			//top特殊处理
			String name = portray.getName();
//			if("CM_BRAND_TOP10".equals(name)){
//				List<Map<String, Object>> top = xfzzlBigDataMapper.getZdtzzlBigDataBrandTop10(vo);
//				if(top==null || top.size()==0){
//					continue;
//				}
//				String detail = "";
//				String countNum = "";
//				String num = "";
//				for(Map<String, Object> map : top){
//					detail += String.valueOf(map.get("CM_BRAND")) +",";
//					countNum += String.valueOf(map.get("COUNT_NUM")) +",";
//					num += String.valueOf(map.get("NUM")) +",";
//				}
//				detail = detail.substring(0, detail.length()-1);
//				countNum = countNum.substring(0,countNum.length()-1);
//				num = num.substring(0,num.length()-1);
//				portray.setDetail("存量,新增"+";"+detail);
//				portray.setValue(countNum+";"+num);
//				continue;
//			}
//			if("CM_TER_TYPE_TOP20".equals(name)){
//				List<Map<String, Object>> top = xfzzlBigDataMapper.getZdtzzlBigDataSpecTop20(vo);
//				if(top==null || top.size()==0){
//					continue;
//				}
//				String detail = "";
//				String countNum = "";
//				String num = "";
//				for(Map<String, Object> map : top){
//					detail += String.valueOf(map.get("CM_TER_TYPE")) +",";
//					countNum += String.valueOf(map.get("COUNT_NUM")) +",";
//					num += String.valueOf(map.get("NUM")) +",";
//				}
//				detail = detail.substring(0, detail.length()-1);
//				countNum =countNum.substring(0, countNum.length()-1);
//				num = num.substring(0,num.length()-1);
//				portray.setDetail("存量,新增"+";"+detail);
//				portray.setValue(countNum+";"+num);
//				continue;				
//			}
			
			Integer showType = portray.getShowType();
			if(showType==5){
				showType5.add(portray);
				String details = portray.getDetail();
				String[] detNames = details.split(";")[1].split(",");
				for(String detName : detNames){
					fieldFunc += ","+ "SUM(" +detName+ ") " +detName;
			    }					
			}
			else if(showType==4){	
				showType4.add(portray);
				String details = portray.getDetail();					
				String[] detNames = details.split(";")[1].split(",");
				for(String detName : detNames){
					fieldFunc += ","+ "SUM(" +detName+ ") " +detName;
			    }
				
			}
		}			
		
		if(showType4.size()==0 && showType5.size()==0){
			return portrays;
		}
		
		vo.setField(fieldFunc);
		Map<String,Object> map = xfzzlBigDataMapper.getJlfxBigData(vo);  
		
		//多值饼图
		if(showType5.size()>0){			
			PortrayIntegration.showType5(map,showType5);		
		}			
		//柱状图
		if(showType4.size()>0){
			PortrayIntegration.showType4(map,showType4);	
		}
			
		return portrays;
	}





}

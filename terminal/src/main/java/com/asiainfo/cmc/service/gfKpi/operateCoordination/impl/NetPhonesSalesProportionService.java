package com.asiainfo.cmc.service.gfKpi.operateCoordination.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.gfKpi.operateCoordination.NetPhonesSalesProportion;
import com.asiainfo.cmc.mapper.gfKpi.operateCoordination.NetPhonesSalesProportionMapper;
import com.asiainfo.cmc.service.gfKpi.operateCoordination.INetPhonesSalesProportionservice;
import com.github.pagehelper.PageInfo;
@Service
@Transactional
public class NetPhonesSalesProportionService implements INetPhonesSalesProportionservice {

	@Resource
	private NetPhonesSalesProportionMapper netPhonesSalesProportionMapper;
	
	@Override
	public PageInfo<NetPhonesSalesProportion> queryData(Map<String, Object> params) {
		List<NetPhonesSalesProportion> outList = new ArrayList<NetPhonesSalesProportion>();
		outList = netPhonesSalesProportionMapper.queryData(params);
		for(NetPhonesSalesProportion netPhonesSalesProportion :outList ) {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("wnzlxsjxlzb", netPhonesSalesProportion.getWnzlxsjxlzb());
			paramMap.put("jbmbz", netPhonesSalesProportion.getJbmbz());
			paramMap.put("jlmbz", netPhonesSalesProportion.getJlmbz());
			paramMap.put("jbdf", netPhonesSalesProportion.getJbdf());
			paramMap.put("jldf", netPhonesSalesProportion.getJldf());
			paramMap.put("billcyc", netPhonesSalesProportion.getBillcyc());
			paramMap.put("nbzsmyddf", netPhonesSalesProportion.getNbzsmyddf());
			paramMap = calculated( paramMap);
			updateByMonth(paramMap);
		}
		outList = netPhonesSalesProportionMapper.queryData(params);
		 PageInfo<NetPhonesSalesProportion> pageInfo = new PageInfo<NetPhonesSalesProportion>(outList);
		return pageInfo;
	}

	@Override
	public void calculatedScore(String startMonth, String endMonth) {
		netPhonesSalesProportionMapper.calculatedScore(startMonth, endMonth);
		
	}

	@Override
	public void insert(Map<String, Object> params) {
		String billcyc = String.valueOf(params.get("billcyc"));
		NetPhonesSalesProportion netPhonesSalesProportion =netPhonesSalesProportionMapper.queryDataByMonth(billcyc);
		params = calculated( params);
		if(netPhonesSalesProportion == null) {
			netPhonesSalesProportionMapper.insert(params);
		}else {
			netPhonesSalesProportionMapper.updateByMonth(params);
		}
		
		
	}

	@Override
	public NetPhonesSalesProportion queryDataByMonth(String billcyc) {
		 
		return netPhonesSalesProportionMapper.queryDataByMonth(billcyc);
	}

	@Override
	public void updateByMonth(Map<String, Object> params) {
		netPhonesSalesProportionMapper.updateByMonth(params);
		
	}
	
	private Map<String, Object> calculated(Map<String, Object> params){
		  BigDecimal wnzlxsjxlzb = new BigDecimal(String.valueOf(params.get("wnzlxsjxlzb")));
		  BigDecimal jbmbz = new BigDecimal(String.valueOf(params.get("jbmbz")));
		  BigDecimal jlmbz = new BigDecimal(String.valueOf(params.get("jlmbz")));
		  BigDecimal jbdf = new BigDecimal("0");
		  BigDecimal jldf = new BigDecimal("0");
		  
         if(wnzlxsjxlzb.compareTo(new BigDecimal("10")) == -1) {// 低于下限值
        	 jbdf = new BigDecimal("0");
         }else if(wnzlxsjxlzb.compareTo(new BigDecimal("10")) == 0 ) {// 等于下限值
        	 jbdf = new BigDecimal("3");
         }else if(wnzlxsjxlzb.compareTo(new BigDecimal("10")) == 1 && wnzlxsjxlzb.compareTo(jbmbz )==-1 ) {// 介于[10%,基本目标)区间时
        	 Double a  = 60.6*(Double.valueOf(String.valueOf(wnzlxsjxlzb))/100)-3;
        	 jbdf = new BigDecimal(a);
         }else if(wnzlxsjxlzb.compareTo(jbmbz) >-1 ) {//达到基本目标
        	 jbdf = new BigDecimal("5");
         } 
		 if(wnzlxsjxlzb.compareTo(jbmbz) ==1 && wnzlxsjxlzb.compareTo(jlmbz)== -1) {
			 Double a  = 32.96*(Double.valueOf(String.valueOf(wnzlxsjxlzb))/100)-4.38;
			 jldf = new BigDecimal(a);
		 }else if(wnzlxsjxlzb.compareTo(jlmbz) >-1) {
			 jldf = new BigDecimal("3");
		 }
		  
		 params.put("wnzlxsjxlzb", wnzlxsjxlzb);
		 params.put("jbmbz", jbmbz);
		 params.put("jlmbz", jlmbz);
		 params.put("jbdf", jbdf);
		 params.put("jldf", jldf);
		 return params;
	}

}

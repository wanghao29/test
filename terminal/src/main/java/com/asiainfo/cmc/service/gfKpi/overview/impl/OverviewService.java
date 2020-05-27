package com.asiainfo.cmc.service.gfKpi.overview.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.enties.gfKpi.overview.Overview;
import com.asiainfo.cmc.mapper.gfKpi.overview.OverviewMapper;
import com.asiainfo.cmc.service.gfKpi.overview.IOverviewService;
@Service
@Transactional
public class OverviewService implements IOverviewService {

	
    @Resource
	private OverviewMapper overviewMapper;
	
	@Override
/*	@DS("dataSource2")*/
	public Map<String,List<Overview>> queryData(String billcyc) {
		overviewMapper.calculatedScore(billcyc);
		Map<String,List<Overview>> resultMap = new  HashMap<>();
		List<Overview> allList = overviewMapper.queryData(billcyc);
		List<Overview> operate_income_list = new ArrayList<Overview>();
		List<Overview> channel_development_list = new ArrayList<Overview>();
		List<Overview> operate_coordination_ist = new ArrayList<Overview>();
		List<Overview> operate_efficiency_list = new ArrayList<Overview>();
		List<Overview> operate_benefit_list = new ArrayList<Overview>();
		List<Overview> bonus_list = new ArrayList<Overview>();
		List<Overview> deduction_list = new ArrayList<Overview>();
		for(Overview overview :allList) {
			switch (overview.getType()){
			case "operate_income":
				operate_income_list.add(overview);
				break;
			case "channel_development":
				operate_income_list.add(overview);
				channel_development_list.add(overview);			
				break;
			case "operate_coordination":
				operate_income_list.add(overview);
				operate_coordination_ist.add(overview);
				break;
			case "operate_efficiency":
				operate_income_list.add(overview);
				operate_efficiency_list.add(overview);
				break;
			case "operate_benefit":
				operate_income_list.add(overview);
				operate_benefit_list.add(overview);
				break;
			case "bonus":
				bonus_list.add(overview);
				break;
			case "deduction":
				bonus_list.add(overview);
				deduction_list.add(overview);
				break;
				
			}
		}
/*		if(allList ==null || allList.size()==0) {
			resultMap.put("", "");
		}*/
		resultMap.put("operate_income", operate_income_list);
		resultMap.put("channel_development", channel_development_list);
		resultMap.put("operate_coordination", operate_coordination_ist);
		resultMap.put("operate_efficiency", operate_efficiency_list);
		resultMap.put("operate_benefit", operate_benefit_list);
		resultMap.put("bonus", bonus_list);
		resultMap.put("deduction", deduction_list);
		 
		resultMap.put("allList", operate_income_list);
		resultMap.put("otherList", bonus_list);
		
		return resultMap;
	}

	@Override
/*	@DS("dataSource")*/
	public int updateRemarks(Map<String, Object> param) {
		// TODO Auto-generated method stub
		Map<String,String> update = new HashMap<String,String>();
		update.put("remarks", String.valueOf(param.get("remarks")));
		update.put("billcyc", String.valueOf(param.get("billcyc")));
		update.put("kpiKey", String.valueOf(param.get("kpiKey")));
		return overviewMapper.updateRemarks(update);
	}

}

package com.asiainfo.cmc.service.gfKpi.operateBenefit.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.gfKpi.operateBenefit.UnitCostProfit;
import com.asiainfo.cmc.mapper.gfKpi.operateBenefit.UnitCostProfitMapper;
import com.asiainfo.cmc.service.gfKpi.operateBenefit.IUnitCostProfitService;
import com.github.pagehelper.PageInfo;
@Service
@Transactional
public class UnitCostProfitService implements IUnitCostProfitService {

	@Resource
	private UnitCostProfitMapper unitCostProfitMapper;
	
	@Override
	public PageInfo<UnitCostProfit> queryData(Map<String, Object> params) {
		List<UnitCostProfit> outList = new ArrayList<UnitCostProfit>();
		outList = unitCostProfitMapper.queryData(params);
		 PageInfo<UnitCostProfit> pageInfo = new PageInfo<UnitCostProfit>(outList);
		return pageInfo;
	}

	@Override
	public void calculatedScore(String startMonth, String endMonth) {
		// TODO Auto-generated method stub
		unitCostProfitMapper.calculatedScore(startMonth, endMonth);
	}

}

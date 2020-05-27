package com.asiainfo.cmc.service.gfKpi.operateBenefit.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.gfKpi.operateBenefit.TotalProfit;
import com.asiainfo.cmc.mapper.gfKpi.operateBenefit.TotalProfitMapper;
import com.asiainfo.cmc.service.gfKpi.operateBenefit.ITotalProfitService;
import com.github.pagehelper.PageInfo;
@Service
@Transactional
public class TotalProfitService implements ITotalProfitService {
	@Resource
	private TotalProfitMapper totalProfitMapper;
	@Override
	public PageInfo<TotalProfit> queryData(Map<String, Object> params) {
		List<TotalProfit> outList = new ArrayList<TotalProfit>();
		outList = totalProfitMapper.queryData(params);
		 PageInfo<TotalProfit> pageInfo = new PageInfo<TotalProfit>(outList);
		return pageInfo;
	}

	@Override
	public void calculatedScore(String startMonth, String endMonth) {
		// TODO Auto-generated method stub
		totalProfitMapper.calculatedScore(startMonth, endMonth);
		
	}

}

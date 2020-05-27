package com.asiainfo.cmc.service.gfKpi.operateEfficiency.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.gfKpi.operateEfficiency.ThreeReceivableProportion;
import com.asiainfo.cmc.mapper.gfKpi.operateEfficiency.ThreeReceivableProportionMapper;
import com.asiainfo.cmc.service.gfKpi.operateEfficiency.IThreeReceivableProportionService;
import com.github.pagehelper.PageInfo;
@Service
@Transactional
public class ThreeReceivableProportionService implements IThreeReceivableProportionService {
	@Resource
	private ThreeReceivableProportionMapper threeReceivableProportionMapper;
	
	@Override
	public PageInfo<ThreeReceivableProportion> queryData(Map<String, Object> params) {
		List<ThreeReceivableProportion> outList = new ArrayList<ThreeReceivableProportion>();
		outList = threeReceivableProportionMapper.queryData(params);
		PageInfo<ThreeReceivableProportion> pageInfo = new PageInfo<ThreeReceivableProportion>(outList);
		return pageInfo;
	}

	@Override
	public void calculatedScore(String startMonth, String endMonth) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ThreeReceivableProportion overview(Map<String, Object> params) {
		return threeReceivableProportionMapper.overview(params);
	}

	@Override
	public List<ThreeReceivableProportion> getList(Map<String, Object> params) {
		return threeReceivableProportionMapper.getList(params);
	}

	@Override
	public int getTotal(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return threeReceivableProportionMapper.getTotal(params);
	}
}

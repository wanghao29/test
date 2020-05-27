package com.asiainfo.cmc.service.gfKpi.operateIncome.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.gfKpi.operateIncome.OwnBrandIncome;
import com.asiainfo.cmc.mapper.gfKpi.operateIncome.OwnBrandIncomeMapper;
import com.asiainfo.cmc.service.gfKpi.operateIncome.IOwnBrandIncomeService;
import com.github.pagehelper.PageInfo;
@Service
@Transactional
public class OwnBrandIncomeService implements IOwnBrandIncomeService {

	@Resource
	private OwnBrandIncomeMapper ownBrandIncomeMapper;
	
	@Override
	public PageInfo<OwnBrandIncome> queryData(Map<String, Object> params) {
		List<OwnBrandIncome> outList = new ArrayList<OwnBrandIncome>();
		outList = ownBrandIncomeMapper.queryData(params);
		 PageInfo<OwnBrandIncome> pageInfo = new PageInfo<>(outList);
		return pageInfo;
	}

	@Override
	public void calculatedScore(String startMonth, String endMonth) {
		ownBrandIncomeMapper.calculatedScore(startMonth, endMonth);
	}

}

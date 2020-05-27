package com.asiainfo.cmc.service.gfKpi.operateIncome.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.gfKpi.operateIncome.OwnBrandMultiIncome;
import com.asiainfo.cmc.mapper.gfKpi.operateIncome.OwnBrandMultiIncomeMapper;
import com.asiainfo.cmc.service.gfKpi.operateIncome.IOwnBrandMultiIncomeService;
import com.github.pagehelper.PageInfo;
@Service
@Transactional
public class OwnBrandMultiIncomeService implements IOwnBrandMultiIncomeService {
	@Resource
	private OwnBrandMultiIncomeMapper ownBrandMultiIncomeMapper;
	@Override
	public PageInfo<OwnBrandMultiIncome> queryData(Map<String, Object> params) {
		List<OwnBrandMultiIncome> outList = new ArrayList<OwnBrandMultiIncome>();
		outList = ownBrandMultiIncomeMapper.queryData(params);
		 PageInfo<OwnBrandMultiIncome> pageInfo = new PageInfo<>(outList);
		return pageInfo;
	}
	@Override
	public void calculatedScore(String startMonth, String endMonth) {
		ownBrandMultiIncomeMapper.calculatedScore(startMonth, endMonth);
		
	}

}

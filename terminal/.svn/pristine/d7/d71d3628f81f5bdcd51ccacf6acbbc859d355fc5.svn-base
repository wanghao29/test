package com.asiainfo.cmc.service.gfKpi.operateIncome.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.gfKpi.operateIncome.OwnBrandOtherMultiIncome;
import com.asiainfo.cmc.mapper.gfKpi.operateIncome.OwnBrandOtherMultiIncomeMapper;
import com.asiainfo.cmc.service.gfKpi.operateIncome.IOwnBrandOtherMultiIncomeService;
import com.github.pagehelper.PageInfo;
@Service
@Transactional
public class OwnBrandOtherMultiIncomeService implements IOwnBrandOtherMultiIncomeService {
	@Resource
	private OwnBrandOtherMultiIncomeMapper ownBrandOtherMultiIncomeMapper;
	@Override
	public PageInfo<OwnBrandOtherMultiIncome> queryData(Map<String, Object> params) {
		List<OwnBrandOtherMultiIncome> outList = new ArrayList<OwnBrandOtherMultiIncome>();
		outList = ownBrandOtherMultiIncomeMapper.queryData(params);
		 PageInfo<OwnBrandOtherMultiIncome> pageInfo = new PageInfo<>(outList);
		return pageInfo;
	}
	@Override
	public void calculatedScore(String startMonth, String endMonth) {
		// TODO Auto-generated method stub
		ownBrandOtherMultiIncomeMapper.calculatedScore(startMonth, endMonth);
	}

}

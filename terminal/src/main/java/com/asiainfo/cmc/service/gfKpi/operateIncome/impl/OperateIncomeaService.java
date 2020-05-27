package com.asiainfo.cmc.service.gfKpi.operateIncome.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.gfKpi.operateIncome.OperateIncome;
import com.asiainfo.cmc.mapper.gfKpi.operateIncome.OperateIncomeMapper;
import com.asiainfo.cmc.service.gfKpi.operateIncome.IOperateIncomeaService;
import com.github.pagehelper.PageInfo;


@Service
@Transactional
public class OperateIncomeaService implements IOperateIncomeaService {

	
	@Resource
	private OperateIncomeMapper operateIncomeMapper;
	@Override
	public PageInfo<OperateIncome> queryData(Map<String, Object> params) {
		// TODO Auto-generated method stub
		List<OperateIncome> outList = new ArrayList<OperateIncome>();
		outList = operateIncomeMapper.queryData(params);
		 PageInfo<OperateIncome> pageInfo = new PageInfo<>(outList);
		return pageInfo;
	}
	@Override
	public void calculatedScore(String startMonth, String endMonth) {
		operateIncomeMapper.calculatedScore(startMonth, endMonth);
	}

}

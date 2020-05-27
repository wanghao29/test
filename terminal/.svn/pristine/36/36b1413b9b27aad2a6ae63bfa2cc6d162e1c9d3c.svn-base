package com.asiainfo.cmc.service.gfKpi.operateEfficiency.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.gfKpi.operateEfficiency.ReceivableTurnoverRate;
import com.asiainfo.cmc.mapper.gfKpi.operateEfficiency.ReceivableTurnoverRateMapper;
import com.asiainfo.cmc.service.gfKpi.operateEfficiency.IReceivableTurnoverRateService;
import com.github.pagehelper.PageInfo;
@Service
@Transactional
public class ReceivableTurnoverRateService implements IReceivableTurnoverRateService {
	@Resource
	private ReceivableTurnoverRateMapper receivableTurnoverRateMapper;
	
	@Override
	public PageInfo<ReceivableTurnoverRate> queryData(Map<String, Object> params) {
		List<ReceivableTurnoverRate> outList = new ArrayList<ReceivableTurnoverRate>();
		outList = receivableTurnoverRateMapper.queryData(params);
		 PageInfo<ReceivableTurnoverRate> pageInfo = new PageInfo<ReceivableTurnoverRate>(outList);
		return pageInfo;
	}

	@Override
	public void calculatedScore(String startMonth, String endMonth) {
		// TODO Auto-generated method stub
		receivableTurnoverRateMapper.calculatedScore(startMonth, endMonth);
	}

	@Override
	public ReceivableTurnoverRate overview(Map<String, Object> params) {
		return receivableTurnoverRateMapper.overview(params);
	}

	@Override
	public List<ReceivableTurnoverRate> getList(Map<String, Object> params) {
		return receivableTurnoverRateMapper.getList(params);
	}
	
	@Override
	public int getTotal(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return receivableTurnoverRateMapper.getTotal(params);
	}
}

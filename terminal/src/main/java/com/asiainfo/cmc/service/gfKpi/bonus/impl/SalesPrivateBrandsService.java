package com.asiainfo.cmc.service.gfKpi.bonus.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.gfKpi.bonus.SalesPrivateBrands;
import com.asiainfo.cmc.mapper.gfKpi.bonus.SalesPrivateBrandsMapper;
import com.asiainfo.cmc.service.gfKpi.bonus.ISalesPrivateBrandsService;
import com.github.pagehelper.PageInfo;
@Service
@Transactional
public class SalesPrivateBrandsService implements ISalesPrivateBrandsService {
	@Resource
	private SalesPrivateBrandsMapper salesPrivateBrandsMapper;
	
	@Override
	public PageInfo<SalesPrivateBrands> queryData(Map<String, Object> params) {
		List<SalesPrivateBrands> outList = new ArrayList<SalesPrivateBrands>();
		outList = salesPrivateBrandsMapper.queryData(params);
		 PageInfo<SalesPrivateBrands> pageInfo = new PageInfo<>(outList);
		return pageInfo;
	}

	@Override
	public void calculatedScore(String startMonth, String endMonth) {
		salesPrivateBrandsMapper.calculatedScore(startMonth, endMonth);
		
	}

}

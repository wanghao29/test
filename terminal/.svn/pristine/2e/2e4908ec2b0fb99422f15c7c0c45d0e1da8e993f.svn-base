package com.asiainfo.cmc.service.gfKpi.operateEfficiency.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.gfKpi.operateEfficiency.ThreeStockValueProportion;
import com.asiainfo.cmc.mapper.gfKpi.operateEfficiency.ThreeStockValueProportionMapper;
import com.asiainfo.cmc.service.gfKpi.operateEfficiency.IThreeStockValueProportionService;
import com.github.pagehelper.PageInfo;
@Service
@Transactional
public class ThreeStockValueProportionService  implements IThreeStockValueProportionService{
	
	@Resource
	private ThreeStockValueProportionMapper threeStockValueProportion;
	
	@Override
	public PageInfo<ThreeStockValueProportion> queryData(Map<String, Object> params) {
		List<ThreeStockValueProportion> outList = new ArrayList<ThreeStockValueProportion>();
		outList = threeStockValueProportion.queryData(params);
		 PageInfo<ThreeStockValueProportion> pageInfo = new PageInfo<ThreeStockValueProportion>(outList);
		return pageInfo;
	}

	@Override
	public void calculatedScore(String startMonth, String endMonth) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ThreeStockValueProportion overview(Map<String, Object> params) {
		return  threeStockValueProportion.overview(params);
	}

	@Override
	public List<ThreeStockValueProportion> getList(Map<String, Object> params) {
		return threeStockValueProportion.getList(params);
	}

	@Override
	public int getTotal(Map<String, Object> params) {
		return threeStockValueProportion.getTotal(params);
	}

}

package com.asiainfo.cmc.service.gfKpi.operateEfficiency.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.gfKpi.operateEfficiency.InventoryTurnover;
import com.asiainfo.cmc.mapper.gfKpi.operateEfficiency.InventoryTurnoverMapper;
import com.asiainfo.cmc.service.gfKpi.operateEfficiency.IInventoryTurnoverService;
import com.github.pagehelper.PageInfo;
@Service
@Transactional
public class InventoryTurnoverService implements IInventoryTurnoverService {

	@Resource
	private InventoryTurnoverMapper inventoryTurnoverMapper;
	
	@Override
	public PageInfo<InventoryTurnover> queryData(Map<String, Object> params) {
		List<InventoryTurnover> outList = new ArrayList<InventoryTurnover>();
		outList = inventoryTurnoverMapper.queryData(params);
		 PageInfo<InventoryTurnover> pageInfo = new PageInfo<InventoryTurnover>(outList);
		return pageInfo;
	}

	@Override
	public void calculatedScore(String startMonth, String endMonth) {
		inventoryTurnoverMapper.calculatedScore(startMonth, endMonth);
		
	}

	@Override
	public InventoryTurnover overview(Map<String, Object> params) {
		return inventoryTurnoverMapper.overview(params);
	}

	@Override
	public List<InventoryTurnover> getList(Map<String, Object> params) {
		return inventoryTurnoverMapper.getList(params);
	}

	@Override
	public int getTotal(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return inventoryTurnoverMapper.getTotal(params);
	}

}

/**
 * Copyright (C) 2018 Long Inc., All Rights Reserved.
 */
package com.asiainfo.cmc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.asiainfo.cmc.enties.ZdKpiImptProdt;
import com.asiainfo.cmc.mapper.ZdKpiImptProdtMapper;
import com.asiainfo.cmc.service.ZdKpiImptProdtService;

/**
 * @TODO
 * @author Long
 * @date 2018年9月14日下午2:17:19
 */
@Service
public class ZdKpiImptProdtServiceImpl implements ZdKpiImptProdtService{
	
	@Resource
    private ZdKpiImptProdtMapper zdKpiImptProdtMapper;

	@Override
	public List<ZdKpiImptProdt> findAllByParam(String year, String quarter) {
		
		return zdKpiImptProdtMapper.findAllByParam(new ZdKpiImptProdt(year, quarter));
	}

	@Override
	public int insert(ZdKpiImptProdt record) {
		return zdKpiImptProdtMapper.insert(record);
	}

	@Override
	public int updateByPrimaryKeySelective(ZdKpiImptProdt record) {
		return zdKpiImptProdtMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return zdKpiImptProdtMapper.deleteByPrimaryKey(id);
	}

}

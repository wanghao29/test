/**
 * Copyright (C) 2018 Long Inc., All Rights Reserved.
 */
package com.asiainfo.cmc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.ZdKpiCompltVal;
import com.asiainfo.cmc.mapper.ZdKpiCompltValMapper;
import com.asiainfo.cmc.service.ZdKpiCompltValService;

/**
 * @TODO
 * @author Long
 * @date 2018年9月14日下午2:17:19
 */
@Service
@Transactional
public class ZdKpiCompltValServiceImpl implements ZdKpiCompltValService{
	
	@Resource
    private ZdKpiCompltValMapper zdKpiCompltValMapper;

	@Override
	public List<ZdKpiCompltVal> findAllByParam(String year, String quarter, String city) {
		
		return zdKpiCompltValMapper.findAllByParam(new ZdKpiCompltVal(year, quarter, city));
	}

	@Override
	public int insertSelective(List<ZdKpiCompltVal> records) {
		int insertNum = 0;
		for(ZdKpiCompltVal z : records){
			zdKpiCompltValMapper.insert(z);
			insertNum++;
		}
		return insertNum;		
	}

	@Override
	public int deleteByPrimaryKey(Long id) {
		// TODO Auto-generated method stub
		return zdKpiCompltValMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(ZdKpiCompltVal record) {
		// TODO Auto-generated method stub
		return zdKpiCompltValMapper.updateByPrimaryKey(record);
	}

	@Override
	public int insert(ZdKpiCompltVal record) {
		return zdKpiCompltValMapper.insert(record);
	}

}

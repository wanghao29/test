/**
 * Copyright (C) 2018 Long Inc., All Rights Reserved.
 */
package com.asiainfo.cmc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.ZdKpiGoalVal;
import com.asiainfo.cmc.mapper.ZdKpiGoalValMapper;
import com.asiainfo.cmc.service.ZdKpiGoalValService;

/**
 * @TODO
 * @author Long
 * @date 2018年9月14日下午2:17:19
 */
@Service
@Transactional
public class ZdKpiGoalValServiceImpl implements ZdKpiGoalValService{
	
	@Resource
    private ZdKpiGoalValMapper zdKpiGoalValMapper;

	@Override
	public List<ZdKpiGoalVal> findAllByParam(String year, String quarter, String city) {
		
		return zdKpiGoalValMapper.findAllByParam(new ZdKpiGoalVal(year, quarter, city));
	}

	@Override
	public int insertSelective(List<ZdKpiGoalVal> records) {
		int insertNum = 0;
		for(ZdKpiGoalVal z : records){
			zdKpiGoalValMapper.insert(z);
			insertNum++;
		}
		return insertNum;
	}

	@Override
	public int deleteByPrimaryKey(Long id) {
		return zdKpiGoalValMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(ZdKpiGoalVal record) {
		return zdKpiGoalValMapper.updateByPrimaryKey(record);
	}

	@Override
	public int insert(ZdKpiGoalVal record) {
		return zdKpiGoalValMapper.insert(record);
	}

}

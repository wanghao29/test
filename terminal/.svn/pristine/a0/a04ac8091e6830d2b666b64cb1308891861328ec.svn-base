/**
 * Copyright (C) 2018 Long Inc., All Rights Reserved.
 */
package com.asiainfo.cmc.service;

import java.util.List;

import com.asiainfo.cmc.enties.ZdKpiGoalVal;

/**
 * @TODO
 * @author Long
 * @date 2018年9月14日下午2:16:40
 */
public interface ZdKpiGoalValService {

	List<ZdKpiGoalVal> findAllByParam(String year, String quarter, String city);
	
	int insertSelective(List<ZdKpiGoalVal> records);
	
	int insert(ZdKpiGoalVal record);
	
	int deleteByPrimaryKey(Long id);
	
	int updateByPrimaryKey(ZdKpiGoalVal record);
}

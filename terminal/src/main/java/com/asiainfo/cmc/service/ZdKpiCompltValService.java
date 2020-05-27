/**
 * Copyright (C) 2018 Long Inc., All Rights Reserved.
 */
package com.asiainfo.cmc.service;

import java.util.List;

import com.asiainfo.cmc.enties.ZdKpiCompltVal;

/**
 * @TODO
 * @author Long
 * @date 2018年9月14日下午2:16:40
 */
public interface ZdKpiCompltValService {

	List<ZdKpiCompltVal> findAllByParam(String year, String quarter, String city);
	
	int insertSelective(List<ZdKpiCompltVal> records);
	
	int insert(ZdKpiCompltVal record);
	
	int deleteByPrimaryKey(Long id);
	
	int updateByPrimaryKey(ZdKpiCompltVal record);
}

/**
 * Copyright (C) 2018 Long Inc., All Rights Reserved.
 */
package com.asiainfo.cmc.service;

import java.util.List;

import com.asiainfo.cmc.enties.ZdKpiImptProdt;

/**
 * @TODO
 * @author Long
 * @date 2018年9月14日下午2:16:40
 */
public interface ZdKpiImptProdtService {
	
	int updateByPrimaryKeySelective(ZdKpiImptProdt record);

	List<ZdKpiImptProdt> findAllByParam(String year, String quarter);
	
	int insert(ZdKpiImptProdt record);
	
	int deleteByPrimaryKey(Integer id);
}

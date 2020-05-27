/**
 * Copyright (C) 2018 Long Inc., All Rights Reserved.
 */
package com.asiainfo.cmc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.asiainfo.cmc.enties.ZdResultCitykpiExtraQ;
import com.asiainfo.cmc.mapper.ZdResultCitykpiExtraQMapper;
import com.asiainfo.cmc.service.ZdResultCitykpiExtraQService;

/**
 * @TODO
 * @author Long
 * @date 2018年9月27日下午5:51:31
 */
@Service
public class ZdResultCitykpiExtraQServiceImpl implements ZdResultCitykpiExtraQService{

	@Resource
	private ZdResultCitykpiExtraQMapper zdResultCitykpiExtraQMapper;
	
	@Override
	public List<ZdResultCitykpiExtraQ> findAllByParam(ZdResultCitykpiExtraQ record) {
		return zdResultCitykpiExtraQMapper.findAllByParam(record);
	}

}

package com.asiainfo.cmc.mapper;

import java.util.List;

import com.asiainfo.cmc.enties.ZdKpiCompltVal;

public interface ZdKpiCompltValMapper {
	
    int deleteByPrimaryKey(Long id);

    int insert(ZdKpiCompltVal record);

    int insertSelective(ZdKpiCompltVal record);

    ZdKpiCompltVal selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ZdKpiCompltVal record);

    int updateByPrimaryKey(ZdKpiCompltVal record);
    
    List<ZdKpiCompltVal> findAllByParam(ZdKpiCompltVal record);
}
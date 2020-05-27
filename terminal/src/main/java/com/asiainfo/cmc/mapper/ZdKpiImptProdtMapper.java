package com.asiainfo.cmc.mapper;

import java.util.List;

import com.asiainfo.cmc.enties.ZdKpiImptProdt;

/**
 * 对象功能:ZD_KPI_IMPT_PRODT Mapper对象
 * 开发公司:亚信科技（中国）有限公司
 * 开发人员:Long
 * 创建时间:2018-09-14 11:15:05
 */
public interface ZdKpiImptProdtMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ZdKpiImptProdt record);

    int insertSelective(ZdKpiImptProdt record);

    ZdKpiImptProdt selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ZdKpiImptProdt record);

    List<ZdKpiImptProdt> findAllByParam(ZdKpiImptProdt record);
}
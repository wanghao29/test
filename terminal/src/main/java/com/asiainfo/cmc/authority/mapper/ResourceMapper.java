package com.asiainfo.cmc.authority.mapper;


import java.util.List;

import com.asiainfo.cmc.authority.pojo.Resource;

 

/**
 *@标题ResourceDao
 * @作者: meiyuxiang
 * @创建时间: 2018-06-29 0029
 * @描述: 
 */
public interface ResourceMapper {
    Integer add(Resource res);

    Integer update(Resource res);

    Integer delete(int id);

    Resource load(int id);

    List<Resource> listResource();
}

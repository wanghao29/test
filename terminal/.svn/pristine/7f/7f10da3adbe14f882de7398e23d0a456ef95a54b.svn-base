package com.asiainfo.cmc.authority.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.authority.mapper.ResourceMapper;
import com.asiainfo.cmc.authority.pojo.Resource;
import com.asiainfo.cmc.authority.service.IResourceService;

 

/**
 *@标题ResourceService
 * @作者: meiyuxiang
 * @创建时间: 2018-06-29 0029
 * @描述: 
 */
@Service
@Transactional
public class ResourceService implements IResourceService {
    @Autowired
    private ResourceMapper resourceDao;

    @Override
    public Integer add(Resource res) {
        return resourceDao.add(res);
    }

    @Override
    public Integer update(Resource res) {
        return resourceDao.update(res);
    }

    @Override
    public Integer delete(int id) {
        return resourceDao.delete(id);
    }

    @Override
    public Resource load(int id) {
        return resourceDao.load(id);
    }

    @Override
    public List<Resource> listResource() {
        return resourceDao.listResource();
    }
}

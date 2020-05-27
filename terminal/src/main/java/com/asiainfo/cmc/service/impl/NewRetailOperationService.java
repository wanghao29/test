package com.asiainfo.cmc.service.impl;

import com.asiainfo.cmc.enties.NewRetailOperation;
import com.asiainfo.cmc.mapper.NewRetailOperationMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by DB.Cooper on 2018/8/10.
 */
@Service
@Transactional
public class NewRetailOperationService implements NewRetailOperationMapper{
    @Resource
    private NewRetailOperationMapper NewRetailOperationMapper;


    @Override
    public int deleteByPrimaryKey(Integer id) {
        return NewRetailOperationMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Map<String,String> params) {
        return NewRetailOperationMapper.insert(params);
    }

    @Override
    public int insertSelective(NewRetailOperation record) {
        return NewRetailOperationMapper.insertSelective(record);
    }

    @Override
    public NewRetailOperation selectByPrimaryKey(Integer id) {
        return NewRetailOperationMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(NewRetailOperation record) {
        return NewRetailOperationMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(NewRetailOperation record) {
        return NewRetailOperationMapper.updateByPrimaryKey(record);
    }
    
    @Override
    public int updateByMonth(Map<String,String> params) {
        return NewRetailOperationMapper.updateByMonth(params);
    }
    
    @Override
    public List<NewRetailOperation> selectByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return NewRetailOperationMapper.selectByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public Integer getTotalByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return NewRetailOperationMapper.getTotalByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public List<NewRetailOperation> getEchartData(String startMonth, String endMonth) {
        return NewRetailOperationMapper.getEchartData(startMonth,endMonth);
    }

    @Override
    public List<NewRetailOperation> getLastData(String endMonth) {
        return NewRetailOperationMapper.getLastData(endMonth);
    }

    @Override
    public void updateByTargetVal(String starMonth, String endMonth, String mbz) {
        NewRetailOperationMapper.updateByTargetVal(starMonth,endMonth,mbz);
    }

    @Override
    public NewRetailOperation selectNewRetail(String month) {
        return NewRetailOperationMapper.selectNewRetail(month);
    }
}

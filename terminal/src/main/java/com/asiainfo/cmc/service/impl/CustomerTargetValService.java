package com.asiainfo.cmc.service.impl;

import com.asiainfo.cmc.enties.CustomerTargetVal;
import com.asiainfo.cmc.mapper.CustomerTargetValMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by DB.Cooper on 2018/7/26.
 */
@Service
@Transactional
public class CustomerTargetValService implements CustomerTargetValMapper{
    @Resource
    private CustomerTargetValMapper customerTargetValMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int insert(CustomerTargetVal record) {
        return 0;
    }

    @Override
    public int insertSelective(CustomerTargetVal record) {
        return 0;
    }

    @Override
    public CustomerTargetVal selectByPrimaryKey(Integer id) {
        return customerTargetValMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(CustomerTargetVal record) {
        return customerTargetValMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(CustomerTargetVal record) {
        return customerTargetValMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<CustomerTargetVal> selectByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return customerTargetValMapper.selectByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public Integer getTotalByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return customerTargetValMapper.getTotalByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public List<CustomerTargetVal> getEchartData(String startMonth, String endMonth) {
        return customerTargetValMapper.getEchartData(startMonth,endMonth);
    }

    @Override
    public List<CustomerTargetVal> getLastData(String endMonth) {
        return customerTargetValMapper.getLastData(endMonth);
    }

    @Override
    public void updateByTargetVal(String starMonth, String endMonth, String mbz) {
        customerTargetValMapper.updateByTargetVal(starMonth,endMonth,mbz);
    }

    @Override
    public Map getKeyData() {
        return customerTargetValMapper.getKeyData();
    }

    @Override
    public String getLastMonthWcqkzb(String teampMonth) {
        return customerTargetValMapper.getLastMonthWcqkzb(teampMonth);
    }

    @Override
    public String getLastYearWcqkzb(String teampMonth) {
        return customerTargetValMapper.getLastYearWcqkzb(teampMonth);
    }

    @Override
    public CustomerTargetVal selectCustomerTargetValue(String month) {
        return customerTargetValMapper.selectCustomerTargetValue(month);
    }

}

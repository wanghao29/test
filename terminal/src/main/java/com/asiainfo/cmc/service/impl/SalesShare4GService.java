package com.asiainfo.cmc.service.impl;

import com.asiainfo.cmc.enties.SalesShare4G;
import com.asiainfo.cmc.mapper.SalesShare4GMapper;
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
public class SalesShare4GService implements SalesShare4GMapper{
    @Resource
    private SalesShare4GMapper SalesShare4GMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return SalesShare4GMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Map<String,String> params) {
        return SalesShare4GMapper.insert(params);
    }

    @Override
    public int insertSelective(SalesShare4G record) {
        return SalesShare4GMapper.insertSelective(record);
    }

    @Override
    public SalesShare4G selectByPrimaryKey(Integer id) {
        return SalesShare4GMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Map<String,String> params) {
        return SalesShare4GMapper.updateByPrimaryKeySelective(  params);
    }

    @Override
    public int updateByPrimaryKey(Map<String,String> params) {
        return SalesShare4GMapper.updateByPrimaryKeySelective(params);
    }

    @Override
    public List<SalesShare4G> selectByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return SalesShare4GMapper.selectByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public Integer getTotalByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return SalesShare4GMapper.getTotalByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public List<SalesShare4G> getEchartData(String startMonth, String endMonth) {
        return SalesShare4GMapper.getEchartData(startMonth,endMonth);
    }

    @Override
    public List<SalesShare4G> getLastData(String endMonth) {
        return SalesShare4GMapper.getLastData(endMonth);
    }

    @Override
    public void updateByTargetVal(String startMonth,String endMonth,String sgtzx, String mbcs) {
        SalesShare4GMapper.updateByTargetVal(startMonth,endMonth,sgtzx,mbcs);
    }

    @Override
    public void updateByReceivePayment(SalesShare4G SalesShare4G) {
        SalesShare4GMapper.updateByReceivePayment(SalesShare4G);
    }

    @Override
    public Map getKeyData() {
        return SalesShare4GMapper.getKeyData();
    }

    @Override
    public Float getLastMonthWcqkzb(String teampMonth) {
        return SalesShare4GMapper.getLastMonthWcqkzb(teampMonth);
    }

    @Override
    public Float getLastYearWcqkzb(String teampMonth) {
        return SalesShare4GMapper.getLastYearWcqkzb(teampMonth);
    }

    @Override
    public SalesShare4G selectSalesShare(String month) {
        return SalesShare4GMapper.selectSalesShare(month);
    }

}

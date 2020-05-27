package com.asiainfo.cmc.service.impl;

import com.asiainfo.cmc.enties.AverageProfit;
import com.asiainfo.cmc.mapper.AverageProfitMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by DB.Cooper on 2018/8/10.
 */
@Service
@Transactional
public class AverageProfitService implements AverageProfitMapper{
    @Resource
    private AverageProfitMapper AverageProfitMapper;


    @Override
    public int deleteByPrimaryKey(Integer id) {
        return AverageProfitMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(AverageProfit record) {
        return AverageProfitMapper.insert(record);
    }

    @Override
    public int insertSelective(AverageProfit record) {
        return AverageProfitMapper.insertSelective(record);
    }

    @Override
    public AverageProfit selectByPrimaryKey(Integer id) {
        return AverageProfitMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(AverageProfit record) {
        return AverageProfitMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(AverageProfit record) {
        return AverageProfitMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<AverageProfit> selectByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return AverageProfitMapper.selectByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public Integer getTotalByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return AverageProfitMapper.getTotalByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public List<AverageProfit> getEchartData(String startMonth, String endMonth) {
        return AverageProfitMapper.getEchartData(startMonth,endMonth);
    }

    @Override
    public List<AverageProfit> getLastData(String endMonth) {
        return AverageProfitMapper.getLastData(endMonth);
    }

    @Override
    public void updateByTargetVal(String starMonth, String endMonth, String htzygsl,String lwpqygsl,String df) {
        AverageProfitMapper.updateByTargetVal(starMonth,endMonth,htzygsl,lwpqygsl,df);
    }

    @Override
    public AverageProfit selectAverageProfit(String month) {
        return AverageProfitMapper.selectAverageProfit(month);
    }
}

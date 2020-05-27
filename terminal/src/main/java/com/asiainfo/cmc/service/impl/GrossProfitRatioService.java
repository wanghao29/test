package com.asiainfo.cmc.service.impl;

import com.asiainfo.cmc.enties.GrossProfitRatio;
import com.asiainfo.cmc.mapper.GrossProfitRatioMapper;
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
public class GrossProfitRatioService implements GrossProfitRatioMapper{
    @Resource
    private GrossProfitRatioMapper GrossProfitRatioMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return GrossProfitRatioMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(GrossProfitRatio record) {
        return GrossProfitRatioMapper.insert(record);
    }

    @Override
    public int insertSelective(GrossProfitRatio record) {
        return GrossProfitRatioMapper.insertSelective(record);
    }

    @Override
    public GrossProfitRatio selectByPrimaryKey(Integer id) {
        return GrossProfitRatioMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(GrossProfitRatio record) {
        return GrossProfitRatioMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(GrossProfitRatio record) {
        return GrossProfitRatioMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<GrossProfitRatio> selectByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return GrossProfitRatioMapper.selectByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public Integer getTotalByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return GrossProfitRatioMapper.getTotalByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public List<GrossProfitRatio> getEchartData(String startMonth, String endMonth) {
        return GrossProfitRatioMapper.getEchartData(startMonth,endMonth);
    }

    @Override
    public List<GrossProfitRatio> getLastData(String endMonth) {
        return GrossProfitRatioMapper.getLastData(endMonth);
    }

    @Override
    public void updateByTargetVal(String startMonth,String endMonth,String sgtzx, String mbcs) {
        GrossProfitRatioMapper.updateByTargetVal(startMonth,endMonth,sgtzx,mbcs);
    }

    @Override
    public void updateBySgtzxm(GrossProfitRatio GrossProfitRatio) {
        GrossProfitRatioMapper.updateBySgtzxm(GrossProfitRatio);
    }

    @Override
    public Map getKeyData() {
        return GrossProfitRatioMapper.getKeyData();
    }

    @Override
    public String getLastMonthWcqkzb(String teampMonth) {
        return GrossProfitRatioMapper.getLastMonthWcqkzb(teampMonth);
    }

    @Override
    public String getLastMonthWcqkzb2(String teampMonth) {
        return GrossProfitRatioMapper.getLastMonthWcqkzb2(teampMonth);
    }

    @Override
    public String getLastYearWcqkzb(String teampMonth) {
        return GrossProfitRatioMapper.getLastYearWcqkzb(teampMonth);
    }

    @Override
    public String getLastYearWcqkzb2(String teampMonth) {
        return GrossProfitRatioMapper.getLastYearWcqkzb2(teampMonth);
    }

    @Override
    public GrossProfitRatio selectGrossRatio(String month) {
        return GrossProfitRatioMapper.selectGrossRatio(month);
    }

}

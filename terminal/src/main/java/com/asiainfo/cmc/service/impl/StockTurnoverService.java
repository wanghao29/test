package com.asiainfo.cmc.service.impl;

import com.asiainfo.cmc.enties.StockTurnoverRatio;
import com.asiainfo.cmc.mapper.StockTurnoverRatioMapper;
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
public class StockTurnoverService implements StockTurnoverRatioMapper{
    @Resource
    private StockTurnoverRatioMapper StockTurnoverRatioMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int insert(StockTurnoverRatio record) {
        return 0;
    }

    @Override
    public int insertSelective(StockTurnoverRatio record) {
        return 0;
    }

    @Override
    public StockTurnoverRatio selectByPrimaryKey(Integer id) {
        return StockTurnoverRatioMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(StockTurnoverRatio record) {
        return StockTurnoverRatioMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(StockTurnoverRatio record) {
        return StockTurnoverRatioMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<StockTurnoverRatio> selectByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return StockTurnoverRatioMapper.selectByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public Integer getTotalByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return StockTurnoverRatioMapper.getTotalByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public List<StockTurnoverRatio> getEchartData(String startMonth, String endMonth) {
        return StockTurnoverRatioMapper.getEchartData(startMonth,endMonth);
    }

    @Override
    public List<StockTurnoverRatio> getLastData(String endMonth) {
        return StockTurnoverRatioMapper.getLastData(endMonth);
    }

    @Override
    public void updateByTargetVal(String endMonth,String sgtzx, String mbz) {
        StockTurnoverRatioMapper.updateByTargetVal(endMonth,sgtzx,mbz);
    }

    @Override
    public Map getKeyData() {
        return StockTurnoverRatioMapper.getKeyData();
    }

    @Override
    public String getLastMonthWcqkzb(String teampMonth) {
        return StockTurnoverRatioMapper.getLastMonthWcqkzb(teampMonth);
    }

    @Override
    public String getLastYearWcqkzb(String teampMonth) {
        return StockTurnoverRatioMapper.getLastYearWcqkzb(teampMonth);
    }

    public StockTurnoverRatio selectstockTurnover(String month){
    	return StockTurnoverRatioMapper.selectstockTurnover(month);
    }
}

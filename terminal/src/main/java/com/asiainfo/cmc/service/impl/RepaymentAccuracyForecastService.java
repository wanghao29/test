package com.asiainfo.cmc.service.impl;

import com.asiainfo.cmc.enties.RepaymentAccuracyForecast;
import com.asiainfo.cmc.mapper.RepaymentAccuracyForecastMapper;
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
public class RepaymentAccuracyForecastService implements RepaymentAccuracyForecastMapper{
    @Resource
    private RepaymentAccuracyForecastMapper repaymentAccuracyForecastMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return repaymentAccuracyForecastMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(RepaymentAccuracyForecast record) {
        return repaymentAccuracyForecastMapper.insert(record);
    }

    @Override
    public int insertSelective(RepaymentAccuracyForecast record) {
        return repaymentAccuracyForecastMapper.insertSelective(record);
    }

    @Override
    public RepaymentAccuracyForecast selectByPrimaryKey(Integer id) {
        return repaymentAccuracyForecastMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(RepaymentAccuracyForecast record) {
        return repaymentAccuracyForecastMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(RepaymentAccuracyForecast record) {
        return repaymentAccuracyForecastMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<RepaymentAccuracyForecast> selectByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return repaymentAccuracyForecastMapper.selectByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public Integer getTotalByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return repaymentAccuracyForecastMapper.getTotalByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public List<RepaymentAccuracyForecast> getEchartData(String startMonth, String endMonth) {
        return repaymentAccuracyForecastMapper.getEchartData(startMonth,endMonth);
    }

    @Override
    public List<RepaymentAccuracyForecast> getLastData(String endMonth) {
        return repaymentAccuracyForecastMapper.getLastData(endMonth);
    }

    @Override
    public void updateByTargetVal(String startMonth,String endMonth,String sgtzx, String mbcs) {
        repaymentAccuracyForecastMapper.updateByTargetVal(startMonth,endMonth,sgtzx,mbcs);
    }

    @Override
    public void updateByReceivePayment(RepaymentAccuracyForecast repaymentAccuracyForecast) {
        repaymentAccuracyForecastMapper.updateByReceivePayment(repaymentAccuracyForecast);
    }

    @Override
    public Map getKeyData() {
        return repaymentAccuracyForecastMapper.getKeyData();
    }

    @Override
    public Float getLastMonthWcqkzb(String teampMonth) {
        return repaymentAccuracyForecastMapper.getLastMonthWcqkzb(teampMonth);
    }

    @Override
    public Float getLastYearWcqkzb(String teampMonth) {
        return repaymentAccuracyForecastMapper.getLastYearWcqkzb(teampMonth);
    }

    public RepaymentAccuracyForecast selectRepaymentAccuracyForecast(String month){
    	return repaymentAccuracyForecastMapper.selectRepaymentAccuracyForecast(month);
    }

	@Override
	public RepaymentAccuracyForecast selectByMonth(String month) {
		 
		return repaymentAccuracyForecastMapper.selectByMonth(month);
	}
}

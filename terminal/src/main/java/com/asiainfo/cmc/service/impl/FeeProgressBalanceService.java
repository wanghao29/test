package com.asiainfo.cmc.service.impl;

import com.asiainfo.cmc.enties.FeeProgressBalance;
import com.asiainfo.cmc.enties.GrossProfitRatio;
import com.asiainfo.cmc.mapper.FeeProgressBalanceMapper;
import com.asiainfo.cmc.mapper.FeeProgressBalanceMapper;

import org.apache.ibatis.annotations.Param;
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
public class FeeProgressBalanceService implements FeeProgressBalanceMapper{
    @Resource
    private FeeProgressBalanceMapper FeeProgressBalanceMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int insert(FeeProgressBalance record) {
        return 0;
    }

    @Override
    public int insertSelective(FeeProgressBalance record) {
        return 0;
    }

    @Override
    public FeeProgressBalance selectByPrimaryKey(Integer id) {
        return FeeProgressBalanceMapper.selectByPrimaryKey(id);
    }

  

    @Override
    public int updateByPrimaryKey(FeeProgressBalance record) {
        return FeeProgressBalanceMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<FeeProgressBalance> selectByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return FeeProgressBalanceMapper.selectByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public Integer getTotalByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return FeeProgressBalanceMapper.getTotalByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public List<FeeProgressBalance> getEchartData(String startMonth, String endMonth) {
        return FeeProgressBalanceMapper.getEchartData(startMonth,endMonth);
    }

    @Override
    public List<FeeProgressBalance> getLastData(String endMonth) {
        return FeeProgressBalanceMapper.getLastData(endMonth);
    }

    @Override
    public void updateByTargetVal( String endMonth, String sgtzx,String bhdjhrglcbys) {
        FeeProgressBalanceMapper.updateByTargetVal(endMonth,sgtzx,bhdjhrglcbys);
    	FeeProgressBalanceMapper.updateFyjdAndDf(endMonth);
    }

    @Override
    public Map getKeyData() {
        return FeeProgressBalanceMapper.getKeyData();
    }

    @Override
    public String getLastMonthWcqkzb(String teampMonth) {
        return FeeProgressBalanceMapper.getLastMonthWcqkzb(teampMonth);
    }

    @Override
    public String getLastYearWcqkzb(String teampMonth) {
        return FeeProgressBalanceMapper.getLastYearWcqkzb(teampMonth);
    }

    @Override
    public List<FeeProgressBalance> selectFeeProgressBalanceue(String month) {
        return FeeProgressBalanceMapper.selectFeeProgressBalanceue(month);
    }

	@Override
	public void updateFyjdAndDf(String endMonth) {
	
		
	}
  @Override
    public FeeProgressBalance selectFeeProgressBalance(String month) {
        return FeeProgressBalanceMapper.selectFeeProgressBalance(month);
    }
}

package com.asiainfo.cmc.service.impl;

import com.asiainfo.cmc.enties.AccountsReceivableRatio;
import com.asiainfo.cmc.mapper.AccountsReceivableRatioMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by DB.Cooper on 2018/7/26.
 */
@Service
@Transactional
public class AccountsReceivableRatioService implements AccountsReceivableRatioMapper{
    @Resource
    private AccountsReceivableRatioMapper accountsReceivableRatioMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return accountsReceivableRatioMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(AccountsReceivableRatio record) {
        return accountsReceivableRatioMapper.insert(record);
    }

    @Override
    public int insertSelective(AccountsReceivableRatio record) {
        return accountsReceivableRatioMapper.insertSelective(record);
    }

    @Override
    public AccountsReceivableRatio selectByPrimaryKey(Integer id) {
        return accountsReceivableRatioMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(AccountsReceivableRatio record) {
        return accountsReceivableRatioMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(AccountsReceivableRatio record) {
        return accountsReceivableRatioMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<AccountsReceivableRatio> selectByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return accountsReceivableRatioMapper.selectByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public Integer getTotalByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return accountsReceivableRatioMapper.getTotalByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public List<AccountsReceivableRatio> getEchartData(String startMonth, String endMonth) {
        return accountsReceivableRatioMapper.getEchartData(startMonth,endMonth);
    }

    @Override
    public List<AccountsReceivableRatio> getLastData(String endMonth) {
        return accountsReceivableRatioMapper.getLastData(endMonth);
    }

    @Override
    public void updateByTargetVal(String startMonth,String endMonth,String sgtzx, String mbcs) {
        accountsReceivableRatioMapper.updateByTargetVal(startMonth,endMonth,sgtzx,mbcs);
    }

    @Override
    public Map getKeyData() {
        return accountsReceivableRatioMapper.getKeyData();
    }

    @Override
    public String getLastMonthWcqkzb(String teampMonth) {
        return accountsReceivableRatioMapper.getLastMonthWcqkzb(teampMonth);
    }

    @Override
    public String getLastMonthWcqkzb2(String teampMonth) {
        return accountsReceivableRatioMapper.getLastMonthWcqkzb2(teampMonth);
    }

    @Override
    public String getLastYearWcqkzb(String teampMonth) {
        return accountsReceivableRatioMapper.getLastYearWcqkzb(teampMonth);
    }

    @Override
    public String getLastYearWcqkzb2(String teampMonth) {
        return accountsReceivableRatioMapper.getLastYearWcqkzb2(teampMonth);
    }

    public AccountsReceivableRatio selectAccountsReceivableRatio(String month){
    	return accountsReceivableRatioMapper.selectAccountsReceivableRatio(month);
    }
    
    public AccountsReceivableRatio overview(Map<String,Object> params){
    	return accountsReceivableRatioMapper.overview(params);
    }
    
}

package com.asiainfo.cmc.service.impl;

import com.asiainfo.cmc.enties.AccountReceivableTurnoverRatio;
import com.asiainfo.cmc.mapper.AccountReceivableTurnoverRatioMapper;
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
public class AccountReceivableRatioService implements AccountReceivableTurnoverRatioMapper{
    @Resource
    private AccountReceivableTurnoverRatioMapper AccountReceivableTurnoverRatioMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return AccountReceivableTurnoverRatioMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(AccountReceivableTurnoverRatio record) {
        return AccountReceivableTurnoverRatioMapper.insert(record);
    }

    @Override
    public int insertSelective(AccountReceivableTurnoverRatio record) {
        return AccountReceivableTurnoverRatioMapper.insertSelective(record);
    }

    @Override
    public AccountReceivableTurnoverRatio selectByPrimaryKey(Integer id) {
        return AccountReceivableTurnoverRatioMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(String sgtzxm,String yszkjz,String mbz,String month) {
        return AccountReceivableTurnoverRatioMapper.updateByPrimaryKeySelective(sgtzxm,yszkjz,mbz,month);
    }

    @Override
    public int updateByPrimaryKey(AccountReceivableTurnoverRatio record) {
        return AccountReceivableTurnoverRatioMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<AccountReceivableTurnoverRatio> selectByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return AccountReceivableTurnoverRatioMapper.selectByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public Integer getTotalByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return AccountReceivableTurnoverRatioMapper.getTotalByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public List<AccountReceivableTurnoverRatio> getEchartData(String startMonth, String endMonth) {
        return AccountReceivableTurnoverRatioMapper.getEchartData(startMonth,endMonth);
    }

    @Override
    public List<AccountReceivableTurnoverRatio> getLastData(String endMonth) {
        return AccountReceivableTurnoverRatioMapper.getLastData(endMonth);
    }

    @Override
    public void updateByTargetVal(String startMonth,String endMonth,String sgtzx, String mbcs) {
        AccountReceivableTurnoverRatioMapper.updateByTargetVal(startMonth,endMonth,sgtzx,mbcs);
    }

    @Override
    public void updateByReceivePayment(AccountReceivableTurnoverRatio AccountReceivableTurnoverRatio) {
        AccountReceivableTurnoverRatioMapper.updateByReceivePayment(AccountReceivableTurnoverRatio);
    }

    @Override
    public Map getKeyData() {
        return AccountReceivableTurnoverRatioMapper.getKeyData();
    }

    @Override
    public String getLastMonthWcqkzb(String teampMonth) {
        return AccountReceivableTurnoverRatioMapper.getLastMonthWcqkzb(teampMonth);
    }

    @Override
    public String getLastYearWcqkzb(String teampMonth) {
        return AccountReceivableTurnoverRatioMapper.getLastYearWcqkzb(teampMonth);
    }
    
    public AccountReceivableTurnoverRatio selectAccountReceivableTurnoverRatio(String month){
    	return AccountReceivableTurnoverRatioMapper.selectAccountReceivableTurnoverRatio(month);
    }
    
}

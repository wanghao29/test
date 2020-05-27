package com.asiainfo.cmc.service.impl;

import com.asiainfo.cmc.enties.BusinessIncome;
import com.asiainfo.cmc.mapper.BusinessIncomeMapper;
import com.asiainfo.cmc.service.BusinessIncomeService;
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
public class BusinessIncomeServiceImpl implements BusinessIncomeService {
    @Resource
    private BusinessIncomeMapper businessIncomeMapper;

    @Override
    public List<BusinessIncome> list(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return businessIncomeMapper.selectByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public Integer getTotalByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return businessIncomeMapper.getTotalByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public void updateByTargetVal(String starMonth, String endMonth, String mbz) {
        businessIncomeMapper.updateByTargetVal(starMonth,endMonth,mbz);
    }

    @Override
    public void update(Map<String, Object> params) {
        businessIncomeMapper.update(params);
    }

    @Override
    public List<BusinessIncome> getEchartData(String starMonth, String endMonth) {
        return businessIncomeMapper.getEchartData(starMonth,endMonth);
    }

    @Override
    public List<BusinessIncome> getLastData(String endMonth) {
    	
        return businessIncomeMapper.getLastData(endMonth);
    }

    @Override
    public BusinessIncome selectBusinessIncome(String month) {
        return businessIncomeMapper.selectBusinessIncome(month);
    }

}

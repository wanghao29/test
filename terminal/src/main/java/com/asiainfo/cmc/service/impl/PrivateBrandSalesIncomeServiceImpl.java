package com.asiainfo.cmc.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.asiainfo.cmc.enties.BrandProductSalesIncome;
import com.asiainfo.cmc.enties.PrivateBrandSalesIncome;
import com.asiainfo.cmc.mapper.BrandProductSalesIncomeMapper;
import com.asiainfo.cmc.mapper.PrivateBrandSalesIncomeMapper;
import com.asiainfo.cmc.service.PrivateBrandSalesIncomeService;

/**
 * Created by DB.Cooper on 2018/7/26.
 */
@Service
@Transactional
public class PrivateBrandSalesIncomeServiceImpl implements PrivateBrandSalesIncomeService {
    @Resource
    private BrandProductSalesIncomeMapper brandProductSalesIncomeMapper;
    @Resource
    private PrivateBrandSalesIncomeMapper privateBrandSalesIncomeMapper;

    @Override
    public List<BrandProductSalesIncome> list(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return brandProductSalesIncomeMapper.selectByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public Integer getTotalByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return brandProductSalesIncomeMapper.getTotalByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public void updateByTargetVal(String starMonth, String endMonth, String zyppsjsrmbz,String zyppdxtzdsrmbz) {
    	brandProductSalesIncomeMapper.updateByTargetVal(starMonth,endMonth,  zyppsjsrmbz, zyppdxtzdsrmbz);
    }

    @Override
    public List<BrandProductSalesIncome> getEchartData(String starMonth, String endMonth) {
        return brandProductSalesIncomeMapper.getEchartData(starMonth,endMonth);
    }

    @Override
    public List<PrivateBrandSalesIncome> getLastData(String endMonth) {
        return privateBrandSalesIncomeMapper.getLastData(endMonth);
    }

    @Override
    public void update(Map<String, Object> params) {
    	brandProductSalesIncomeMapper.update(params);
    }

    @Override
    public BrandProductSalesIncome selectBrandSalesIncome(String month) {
        return brandProductSalesIncomeMapper.selectBrandSalesIncome(month);
    }

    @Override
    public void updateByPrimaryKeySelective(Map<String,Object> params) {
    	brandProductSalesIncomeMapper.updateByPrimaryKeySelective(params);
    }

}

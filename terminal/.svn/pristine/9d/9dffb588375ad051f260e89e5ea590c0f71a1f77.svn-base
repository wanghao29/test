package com.asiainfo.cmc.service.impl;

import com.asiainfo.cmc.enties.IncomePhoneBrand;
import com.asiainfo.cmc.mapper.IncomePhoneBrandMapper;
import com.asiainfo.cmc.service.IncomePhoneBrandService;
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
public class IncomPhoneBrandServiceImpl implements IncomePhoneBrandService {
    @Resource
    private IncomePhoneBrandMapper incomePhoneBrandMapper;

    @Override
    public List<IncomePhoneBrand> list(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return incomePhoneBrandMapper.selectByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public Integer getTotalByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return incomePhoneBrandMapper.getTotalByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public void updateByTargetVal(String starMonth, String endMonth, String mbz) {
        incomePhoneBrandMapper.updateByTargetVal(starMonth,endMonth,mbz);
    }

    @Override
    public List<IncomePhoneBrand> getEchartData(String starMonth, String endMonth) {
        return incomePhoneBrandMapper.getEchartData(starMonth,endMonth);
    }

    @Override
    public IncomePhoneBrand selectBrandIncome(String month) {
        return incomePhoneBrandMapper.selectBrandIncome(month);
    }

    @Override
    public List<IncomePhoneBrand> getLastData(String endMonth) {
        return incomePhoneBrandMapper.getLastData(endMonth);
    }

    @Override
    public void update(IncomePhoneBrand incomePhoneBrand) {
        incomePhoneBrandMapper.update(incomePhoneBrand);
    }

}

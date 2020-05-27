package com.asiainfo.cmc.service.impl;

import com.asiainfo.cmc.enties.IncomeMultiForm;
import com.asiainfo.cmc.mapper.IncomeMultiFormMapper;
import com.asiainfo.cmc.service.IncomeMultiFormService;
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
public class IncomMultiFormServiceImpl implements IncomeMultiFormService {
    @Resource
    private IncomeMultiFormMapper incomeMultiFormMapper;

    @Override
    public List<IncomeMultiForm> list(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return incomeMultiFormMapper.selectByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public Integer getTotalByParameter(String starMonth, String endMonth, Integer page, Integer pageSize) {
        return incomeMultiFormMapper.getTotalByParameter(starMonth,endMonth,page,pageSize);
    }

    @Override
    public void updateByTargetVal(String starMonth, String endMonth, String mbz) {
        incomeMultiFormMapper.updateByTargetVal(starMonth,endMonth,mbz);
    }

    @Override
    public List<IncomeMultiForm> getEchartData(String starMonth, String endMonth) {
        return incomeMultiFormMapper.getEchartData(starMonth,endMonth);
    }

    @Override
    public List<IncomeMultiForm> getLastData(String endMonth) {
        return incomeMultiFormMapper.getLastData(endMonth);
    }

    @Override
    public IncomeMultiForm selectMultiForm(String month) {
        return incomeMultiFormMapper.selectMultiForm(month);
    }

	@Override
	public void update(Map<String, Object> params) {
		incomeMultiFormMapper.update(params);
		
	}


}

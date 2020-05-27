package com.asiainfo.cmc.service;

import com.asiainfo.cmc.enties.IncomePhoneBrand;

import java.util.List;
import java.util.Map;

public interface IncomePhoneBrandService {
    /**
     *  根据parameter查询运营收入列表
     */
	public List<IncomePhoneBrand> list(String starMonth, String endMonth, Integer page, Integer pageSize);

    public Integer getTotalByParameter(String starMonth, String endMonth, Integer page, Integer pageSize);

    public void updateByTargetVal(String starMonth, String endMonth, String mbz);

    public List<IncomePhoneBrand> getEchartData(String starMonth, String endMonth);

    public IncomePhoneBrand selectBrandIncome(String month);

    List<IncomePhoneBrand> getLastData(String endMonth);

    void update(IncomePhoneBrand incomePhoneBrand);
}

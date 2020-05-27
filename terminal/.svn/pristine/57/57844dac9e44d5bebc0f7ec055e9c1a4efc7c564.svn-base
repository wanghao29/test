package com.asiainfo.cmc.service;

import java.util.List;
import java.util.Map;

import com.asiainfo.cmc.enties.BusinessIncome;

public interface BusinessIncomeService {
    /**
     *  根据parameter查询运营收入列表
     */
	public List<BusinessIncome> list(String starMonth, String endMonth, Integer page, Integer pageSize);

    public Integer getTotalByParameter(String starMonth, String endMonth, Integer page, Integer pageSize);

    public void updateByTargetVal(String starMonth, String endMonth, String mbz);

    public void update(Map<String,Object> params);

    public List<BusinessIncome> getEchartData(String starMonth, String endMonth);

    List<BusinessIncome> getLastData(String  endMonth);

    BusinessIncome selectBusinessIncome(String month);
}

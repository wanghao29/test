package com.asiainfo.cmc.service;

import java.util.List;
import java.util.Map;

import com.asiainfo.cmc.enties.BrandProductSalesIncome;
import com.asiainfo.cmc.enties.PrivateBrandSalesIncome;

public interface PrivateBrandSalesIncomeService {
    /**
     *  根据parameter查询运营收入列表
     */
	public List<BrandProductSalesIncome> list(String starMonth, String endMonth, Integer page, Integer pageSize);

    public Integer getTotalByParameter(String starMonth, String endMonth, Integer page, Integer pageSize);

    public void updateByTargetVal(String starMonth, String endMonth, String zyppsjsrmbz,String zyppdxtzdsrmbz);

    public List<BrandProductSalesIncome> getEchartData(String starMonth, String endMonth);

    List<PrivateBrandSalesIncome> getLastData(String endMonth);

    void update(Map<String, Object> params);

    BrandProductSalesIncome selectBrandSalesIncome(String month);

    void updateByPrimaryKeySelective(Map<String,Object> params);


}

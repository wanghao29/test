package com.asiainfo.cmc.service;

import com.asiainfo.cmc.enties.IncomeMultiForm;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface IncomeMultiFormService {
    /**
     *  根据parameter查询运营收入列表
     */
	public List<IncomeMultiForm> list(String starMonth, String endMonth, Integer page, Integer pageSize);

    public Integer getTotalByParameter(String starMonth, String endMonth, Integer page, Integer pageSize);

    public void updateByTargetVal(String starMonth, String endMonth, String mbz);
    public void update(Map<String,Object> params);
    public List<IncomeMultiForm> getEchartData(String starMonth, String endMonth);

    List<IncomeMultiForm> getLastData(String endMonth);

    IncomeMultiForm selectMultiForm(String month);
}

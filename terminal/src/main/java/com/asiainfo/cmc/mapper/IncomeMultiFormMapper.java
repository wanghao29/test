package com.asiainfo.cmc.mapper;

import com.asiainfo.cmc.enties.IncomeMultiForm;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface IncomeMultiFormMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(IncomeMultiForm record);

    int insertSelective(IncomeMultiForm record);

    IncomeMultiForm selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(IncomeMultiForm record);

    int updateByPrimaryKey(IncomeMultiForm record);

    List<IncomeMultiForm> selectByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page, @Param("pageSize")Integer pageSize);

    Integer getTotalByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page,  @Param("pageSize")Integer pageSize);

    List<IncomeMultiForm> getEchartData(@Param("starMonth")String startMonth, @Param("endMonth")String endMonth);

    List<IncomeMultiForm> getLastData(@Param("endMonth")String endMonth);

    void updateByTargetVal(@Param("starMonth")String starMonth, @Param("endMonth")String endMonth,  @Param("mbz")String mbz);

    IncomeMultiForm selectMultiForm(@Param("month") String month);
    
    void update(Map<String, Object> params);

}
package com.asiainfo.cmc.mapper;

import com.asiainfo.cmc.enties.BusinessIncome;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface BusinessIncomeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BusinessIncome record);

    int insertSelective(BusinessIncome record);

    BusinessIncome selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BusinessIncome record);

    int updateByPrimaryKey(BusinessIncome record);

    List<BusinessIncome> selectByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page,  @Param("pageSize")Integer pageSize);

    Integer getTotalByParameter(@Param("starMonth") String starMonth, @Param("endMonth") String endMonth, @Param("page")Integer page,  @Param("pageSize")Integer pageSize);

    List<BusinessIncome> getEchartData(@Param("starMonth")String startMonth, @Param("endMonth")String endMonth);

    List<BusinessIncome> getLastData(@Param("endMonth")String endMonth);

    void updateByTargetVal(@Param("starMonth")String starMonth, @Param("endMonth")String endMonth,  @Param("mbz")String mbz);

    BusinessIncome selectBusinessIncome(@Param("month")String month);

    void update(Map<String, Object> params);
}